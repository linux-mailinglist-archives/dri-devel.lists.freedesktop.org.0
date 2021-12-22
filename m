Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1ED47D600
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 18:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53D310E12B;
	Wed, 22 Dec 2021 17:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF44210E12B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 17:44:00 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id u13so6940077lff.12
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 09:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:to:cc:from:subject
 :content-transfer-encoding;
 bh=hI44alCBMb6sS97Llt50LudbiqSbCyeG3dGh0ijfen0=;
 b=Fi8N9py/rC0Xo3UM2gSETcw5MQw6N68kl4EAZfQGH/FQt8I9jZb+ruX4yejltNZNIu
 L9UEhN501ZgKMtGXaKprl1V618hnjq8JVjejpQLtTvjPCaRBtVr64ZR4VfvStECGuPeP
 cGdz9SZWQ15eRgItKRmqVx/lFD19UlUrV9mxrloWGoZCinyP9Qy78uei39ROlTsXYpHh
 AKghDpZBDA7NzsDg7ro88VMLSoQ7goBLMLdrzlNM2OsA0XnGYeTwW6T4DZTfQi2U4bzH
 gTQtIJuros5yUBDBN/bOFkrP5Bg1KgFCKPbnyvZs3LanDq2IF7gEK/MGirWBlg/J7nCn
 EhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
 :from:subject:content-transfer-encoding;
 bh=hI44alCBMb6sS97Llt50LudbiqSbCyeG3dGh0ijfen0=;
 b=KC7qx8KfBM2Dhm2PAMHgg6RaSPicsN9I5wvKxtaJAhfA488m5Z5vDdXeFOWERQkhWl
 D1i4sNlg9JtGeEMzi+xCJmfrxeevdmFadQKOdMwhhF3AgyHYjLA67P7XkE4/gjRogyAi
 u+ohuetitBVmaSdf1JJuzAdcJ2ZyiHV6q8JS34Vzi/R/3CWi/zZZSm0t76BCwkPWU4Qb
 3nYCdC2rEyfp6iB+aUxNUW2Kl0ShprruRTxgb224Sh3yOYQ3MKniWnPNr8VcC0gUG3Cy
 lgywELb/pCpHeuAfNE2zVzyOibT1fuFm6GxPKICA3tpXz9URiIz4sj2QZrFg14QHtGCc
 BlFQ==
X-Gm-Message-State: AOAM531vKFjs5mr+INiv1Uu4sJaySu7E5SK6847ZcU+ZZe2TPmIPB4z+
 3z53reGSe3xEh4UUy/XIBtY=
X-Google-Smtp-Source: ABdhPJyW9dM5lw3f7wmG+eynErvsrPNTPxLwa6U/fMu42qB6SmF1ruMSOp0ZA0ffOjUVhQSTAfn5fA==
X-Received: by 2002:ac2:4e11:: with SMTP id e17mr3143634lfr.126.1640195039174; 
 Wed, 22 Dec 2021 09:43:59 -0800 (PST)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id d5sm273568lfv.83.2021.12.22.09.43.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 09:43:58 -0800 (PST)
Message-ID: <35c7df78-6e8a-b996-3df8-2c405bfcff81@gmail.com>
Date: Wed, 22 Dec 2021 18:43:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
To: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: make dt_binding_check broken by drm & lvds-codec
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 22 Dec 2021 17:49:00 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I just noticed that "make dt_binding_check" doesn't work in linux-next:

   SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
Traceback (most recent call last):
   File "/home/rmilecki/.local/bin/dt-mk-schema", line 38, in <module>
     schemas = dtschema.process_schemas(args.schemas, core_schema=(not args.useronly))
   File "/home/rmilecki/.local/lib/python3.6/site-packages/dtschema/lib.py", line 587, in process_schemas
     sch = process_schema(os.path.abspath(filename))
   File "/home/rmilecki/.local/lib/python3.6/site-packages/dtschema/lib.py", line 561, in process_schema
     schema = load_schema(filename)
   File "/home/rmilecki/.local/lib/python3.6/site-packages/dtschema/lib.py", line 126, in load_schema
     return do_load(os.path.join(schema_basedir, schema))
   File "/home/rmilecki/.local/lib/python3.6/site-packages/dtschema/lib.py", line 112, in do_load
     return yaml.load(tmp)
   File "/usr/lib/python3.6/site-packages/ruamel/yaml/main.py", line 343, in load
     return constructor.get_single_data()
   File "/usr/lib/python3.6/site-packages/ruamel/yaml/constructor.py", line 113, in get_single_data
     return self.construct_document(node)
   File "/usr/lib/python3.6/site-packages/ruamel/yaml/constructor.py", line 123, in construct_document
     for _dummy in generator:
   File "/usr/lib/python3.6/site-packages/ruamel/yaml/constructor.py", line 723, in construct_yaml_map
     value = self.construct_mapping(node)
   File "/usr/lib/python3.6/site-packages/ruamel/yaml/constructor.py", line 440, in construct_mapping
     return BaseConstructor.construct_mapping(self, node, deep=deep)
   File "/usr/lib/python3.6/site-packages/ruamel/yaml/constructor.py", line 257, in construct_mapping
     if self.check_mapping_key(node, key_node, mapping, key, value):
   File "/usr/lib/python3.6/site-packages/ruamel/yaml/constructor.py", line 295, in check_mapping_key
     raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
   in "<unicode string>", line 4, column 1
found duplicate key "if" with value "{}" (original value: "{}")
   in "<unicode string>", line 113, column 1

It's caused by two commits:
ba3e86789eaf ("dt-bindings: display: bridge: lvds-codec: Document LVDS data mapping select")
d7df3948eb49 ("dt-bindings: display: bridge: lvds-codec: Document pixel data sampling edge select")

Both commits add "if" and "then" at YAML "root" level.

Can you take a look at that, please?
