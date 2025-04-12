#Dockerfile para ambiente ETL com Python + Postgresql + SQLAlchemy
FROM python:3.10-slim 


RUN apt-get update && apt-get install -y \
build-essential \
libpq-dev \
curl \
&& rm -rf /var/lib/apt/lists/*

#Definir diretório de trabalho
WORKDIR /app

#Copiar arquivos do projeto
COPY requirements.txt ./
COPY srag_2021.csv  ./

#instalar dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

#Copiar arquivos do projet
COPY etl_srag.py ./

#Comando padrão
CMD [ "python", "etl_srag.py"]