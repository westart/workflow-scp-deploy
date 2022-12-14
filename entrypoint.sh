#!/bin/sh
if [[ "$INPUT_KEY" ]]; then
    echo -e "${INPUT_KEY}" > tmp_id
    chmod 600 tmp_id
    scp -qr -P $INPUT_PORT -o StrictHostKeyChecking=no -i tmp_id $INPUT_SOURCE "$INPUT_USER"@"$INPUT_HOST":"$INPUT_DESTINATION"
else
    echo "##### Utilizzo l'autenticazione con password"
    sshpass -p $INPUT_PASSWORD scp -qr -P $INPUT_PORT -o StrictHostKeyChecking=no $INPUT_SOURCE "$INPUT_USER"@"$INPUT_HOST":"$INPUT_DESTINATION"
fi
ERR=$?
if [[ $? -ne 0 ]]; then
    echo "Errore nel trasferimento"
    exit $ERR
fi