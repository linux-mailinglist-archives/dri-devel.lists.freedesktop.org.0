Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EBB3AF217
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 19:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF426E073;
	Mon, 21 Jun 2021 17:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA066E073
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 17:40:09 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id s23so20741524oiw.9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 10:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=GOLlee18Cq+VZCrN2BSKn7jALbwR1Zc9vSp5DxBhXsc=;
 b=jnKt3sfvC/w33nGImnEX97FMlQCY6ShipfUE2+jrl9Nd07hATzsaCl8BcZS0RJSg1q
 blx21l3edLAx/40Jdys8B1cnmVgnpy5dLf5Cz3B1FcW0tcr0d/IOO6l99EKh514wtcTM
 BQEB3ZblrupSzpdZ1WaK2864eUGKkkGrdf8WQhLRPpbH0iyzmDhakEXrIeM50fbcI+GF
 oPf5IZT55iINJ+/a3Becnoo7pFpAayBajjCs/NsNiRRIBE0+BZR3Ghq3l6SkJ5tNmwrK
 Eh0JTpBX+/ZhgmxzV17ZVMYgt8zfn76TA+udsFtniRQu1xaODqrWlzpA8FCV70MMm/dg
 rqWw==
X-Gm-Message-State: AOAM532Qt3VDjmvaaD3cimOTDbTgzHzjXhMisjZq8jUanFLZfXLBPeX5
 UC6GcEebOydIu1tnlAl8VbYkTf4zVQ==
X-Google-Smtp-Source: ABdhPJxfENLRerkLK7CZCNrrEAOulpIKYqd89FEg+Mrdo1plFtf4lh4tQqcgcpzZACnhF6rlmAMLLw==
X-Received: by 2002:aca:4d3:: with SMTP id 202mr17729526oie.9.1624297208354;
 Mon, 21 Jun 2021 10:40:08 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id y13sm4184113ots.47.2021.06.21.10.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 10:40:07 -0700 (PDT)
Received: (nullmailer pid 1161632 invoked by uid 1000);
 Mon, 21 Jun 2021 17:40:02 -0000
From: Rob Herring <robh@kernel.org>
To: Tomohito Esaki <etom@igel.co.jp>
In-Reply-To: <20210621064403.26663-4-etom@igel.co.jp>
References: <20210621064403.26663-1-etom@igel.co.jp>
 <20210621064403.26663-4-etom@igel.co.jp>
Subject: Re: [PATH 3/4] dt-bindings: display: Add virtual DRM
Date: Mon, 21 Jun 2021 11:40:02 -0600
Message-Id: <1624297202.341994.1161630.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Jun 2021 15:44:02 +0900, Tomohito Esaki wrote:
> Add device tree bindings documentation for virtual DRM.
> 
> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
> ---
>  .../devicetree/bindings/display/vdrm.yaml     | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/vdrm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/vdrm.yaml:39:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/display/vdrm.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 120, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 731, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: while scanning a plain scalar
  in "<unicode string>", line 38, column 15
found a tab character that violates indentation
  in "<unicode string>", line 39, column 1
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/display/vdrm.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/display/vdrm.yaml:  while scanning a plain scalar
  in "<unicode string>", line 38, column 15
found a tab character that violates indentation
  in "<unicode string>", line 39, column 1
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/vdrm.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/display/vdrm.yaml
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1494913

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

