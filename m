Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35236498403
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 17:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4003610E2B1;
	Mon, 24 Jan 2022 16:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DF810E2B1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 16:01:15 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id bx18so26155328oib.7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 08:01:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=lgNgufamFz1iMpUltG/YYZK51Ud/c3ekrA9PspzjUKM=;
 b=J1FeWnNo7irTqoasQFHdxxvE75YnJj+ELSA47AiTE7r10QKP0S89S0/1zPzc2bi1d4
 uOHxUFkz/3K2IUv6oHESp65qS1To2m7DQnngeUxor5LkxjiUNZt/Iprt7CZ4162f8KVW
 oNwcZ+YK89jwW1fkH40MEXjfjEgSNBwiJ7p1uBY8zs0BusrPij5kIigJHFg6NJ/IiHp7
 rBglY/AScKwS5A89PBEx2xrRsgxnv6l7qQASVJntDZWNYYFvvubUrf4JcjS3tsESOK+r
 zRDIrB8SUfdBSAsY9ofpNJn2e4hC5caC3luRCxB5rRAelqFH7Z9LVbwTHqUUjtwEaTp9
 jcOQ==
X-Gm-Message-State: AOAM5318gJxdEkrB/cvcE1Xm+IT2qx+umswuNY52OA1OPQoM1V/ESvZz
 EOA6h3UihM/RbYmKvt2UNw==
X-Google-Smtp-Source: ABdhPJyOn2qjAosvLaZY7HdDJ79MxLNRZy9V1akZsf4oTj+acz/VsYXt2sN6vzEn94LEWxV8Yiq9wQ==
X-Received: by 2002:a05:6808:f01:: with SMTP id
 m1mr2014490oiw.174.1643040074286; 
 Mon, 24 Jan 2022 08:01:14 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q15sm5502270otv.81.2022.01.24.08.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 08:01:13 -0800 (PST)
Received: (nullmailer pid 3901526 invoked by uid 1000);
 Mon, 24 Jan 2022 16:01:12 -0000
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220123172520.48741-2-noralf@tronnes.org>
References: <20220123172520.48741-1-noralf@tronnes.org>
 <20220123172520.48741-2-noralf@tronnes.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: add bindings for MIPI DBI
 compatible SPI panels
Date: Mon, 24 Jan 2022 10:01:12 -0600
Message-Id: <1643040072.579459.3901525.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, maxime@cerno.tech,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 23 Jan 2022 18:25:18 +0100, Noralf Trønnes wrote:
> Add binding for MIPI DBI compatible SPI panels.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  .../display/panel/panel-mipi-dbi-spi.yaml     | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
schemas/display/panel/panel/panel-common.yaml: ignoring, error parsing file
make[1]: *** Deleting file 'Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.example.dt.yaml'
schemas/display/panel/panel/panel-common.yaml: ignoring, error parsing file
Traceback (most recent call last):
  File "/usr/local/bin/dt-validate", line 170, in <module>
    sg.check_trees(filename, testtree)
  File "/usr/local/bin/dt-validate", line 119, in check_trees
    self.check_subtree(dt, subtree, False, "/", "/", filename)
  File "/usr/local/bin/dt-validate", line 110, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
  File "/usr/local/bin/dt-validate", line 110, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
  File "/usr/local/bin/dt-validate", line 110, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
  File "/usr/local/bin/dt-validate", line 105, in check_subtree
    self.check_node(tree, subtree, disabled, nodename, fullname, filename)
  File "/usr/local/bin/dt-validate", line 49, in check_node
    errors = sorted(dtschema.DTValidator(schema).iter_errors(node), key=lambda e: e.linecol)
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 771, in iter_errors
    for error in super().iter_errors(instance, _schema):
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 229, in iter_errors
    for error in errors:
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/_validators.py", line 362, in allOf
    yield from validator.descend(instance, subschema, schema_path=index)
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 245, in descend
    for error in self.evolve(schema=schema).iter_errors(instance):
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 771, in iter_errors
    for error in super().iter_errors(instance, _schema):
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 229, in iter_errors
    for error in errors:
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/_validators.py", line 298, in ref
    yield from validator.descend(instance, resolved)
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 245, in descend
    for error in self.evolve(schema=schema).iter_errors(instance):
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 771, in iter_errors
    for error in super().iter_errors(instance, _schema):
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 219, in iter_errors
    scope = id_of(_schema)
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 96, in _id_of
    return schema.get("$id", "")
AttributeError: 'NoneType' object has no attribute 'get'
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1583159

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

