Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A8745B259
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 03:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF696E175;
	Wed, 24 Nov 2021 02:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DAA6E175
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 02:59:25 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id i9so1105209ilu.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 18:59:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=+gtitLZL9HaFjBnuPU8p8wXrV+klALlrvYaIvtVGr1Y=;
 b=XixNTCMHQwX46zdhFgHQ+QwJSBCSrzamSv3JdxjpDo7UZQfQG+TegCeFXk2pGnl/tR
 2HQIC4EHNbyBs2BT95QpqDvZf46P7+7FXNMpbcIaPYecUqdgMTIsJ48lg5Acn5Hdgwv1
 uVxH9hLUwUdVTA/Y/d7DzOPJh56BU4Usa+3cCJuo82MqtXUcW5J+rAJOx9J1PQayrGic
 U2NozJoKGGx+p1XQu9ENgLRyK/nD8hUbG9M++SVz4l5t4/vyyTIlahGrqvx1OcfaV2IM
 8A1vP2VBlC0wrh5t7nppNK3DF2PenC+S3jSqjIzz65qKYDZsfDGZiOAWdjaB8sUfQHlR
 Z13Q==
X-Gm-Message-State: AOAM531Nl6ITZLnTVJrxI4/QAwDbiQl4i//Jy2qq8jT5Rvjd4NGOrgFf
 dZQIC4Lot2/CC1skdEdPBQ==
X-Google-Smtp-Source: ABdhPJzWFPJVuLsBwNvWGvgriFboFDA1jNooS4EMQoSZqSMvlnmGGtbVzE1Y5g9KLh7fDXTK9fj/ug==
X-Received: by 2002:a92:d643:: with SMTP id x3mr10412541ilp.107.1637722765084; 
 Tue, 23 Nov 2021 18:59:25 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id l9sm8990629ilh.82.2021.11.23.18.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 18:59:24 -0800 (PST)
Received: (nullmailer pid 888169 invoked by uid 1000);
 Wed, 24 Nov 2021 02:59:21 -0000
From: Rob Herring <robh@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <f97179a630e7d0fc739a118e2b321e1a6432876b.1637691240.git.hns@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
 <f97179a630e7d0fc739a118e2b321e1a6432876b.1637691240.git.hns@goldelico.com>
Subject: Re: [PATCH v8 3/8] dt-bindings: display: Add ingenic,
 jz4780-dw-hdmi DT Schema
Date: Tue, 23 Nov 2021 19:59:21 -0700
Message-Id: <1637722761.010276.888168.nullmailer@robh.at.kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, letux-kernel@openphoenux.org,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 Mark Brown <broonie@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 Nov 2021 19:13:56 +0100, H. Nikolaus Schaller wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
> Based on .txt binding from Zubair Lutfullah Kakakhel
> 
> We also add generic ddc-i2c-bus to synopsys,dw-hdmi.yaml
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../display/bridge/ingenic,jz4780-hdmi.yaml   | 76 +++++++++++++++++++
>  .../display/bridge/synopsys,dw-hdmi.yaml      |  3 +
>  2 files changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml:36:5: [warning] wrong indentation: expected 2 but found 4 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml: 'unevaluatedPropertes' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select']
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: A schema with a "$ref" to another schema either can define all properties used and use "additionalProperties" or can use "unevaluatedProperties"
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/bridge/bridge/synopsys,dw-hdmi.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.example.dts:19:18: fatal error: dt-bindings/clock/jz4780-cgu.h: No such file or directory
   19 |         #include <dt-bindings/clock/jz4780-cgu.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1558736

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

