Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6198299EF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 12:58:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C820F10E5DB;
	Wed, 10 Jan 2024 11:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD60910E5DB
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 11:57:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7D6B9B81D30;
 Wed, 10 Jan 2024 11:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5538C433F1;
 Wed, 10 Jan 2024 11:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704887875;
 bh=GKca1HsX6awgTvyvYloYbP0iiufJSLHo67+h3IFogD0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=NbSGwV4QHrYZtRcQUhUadF8s/kTlJjjW2jEmUW2irTffjvNE70LySk8rWiJdZ+yl7
 2GsZ0xUSMWvsWOpGCCBr5oacMXr1qfxDMoNGnQhtncFxDf8zItEODikEnmrDXZtso1
 fapQw7vW8L5eQxp+zd5gq/P878Simawt2KjubhHk+xcI2uFFjXJD5CiVlteU8Yv2hv
 xa/FCE+T2ijWY0xCyOnCKsa8DDhipM1FGNGlENHvsjurdwxbiK0lIx8lMhC8PugFpA
 gRLoNRNzRdh4Iq6P+R/9IetTpzB+qkXmS7qO4fb+zwd2BYJIfBRSAgiP6wcRcntWED
 aWWM8ift3m0rQ==
Received: (nullmailer pid 942200 invoked by uid 1000);
 Wed, 10 Jan 2024 11:57:49 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
In-Reply-To: <20240110102535.246177-3-dharma.b@microchip.com>
References: <20240110102535.246177-1-dharma.b@microchip.com>
 <20240110102535.246177-3-dharma.b@microchip.com>
Message-Id: <170488786949.942181.15403969242765460725.robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT
 schema format
Date: Wed, 10 Jan 2024 05:57:49 -0600
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
Cc: linux-pwm@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org,
 tzimmermann@suse.de, alexandre.belloni@bootlin.com, bbrezillon@kernel.org,
 sam@ravnborg.org, nicolas.ferre@microchip.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, claudiu.beznea@tuxon.dev,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, mripard@kernel.org,
 u.kleine-koenig@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 10 Jan 2024 15:55:34 +0530, Dharma Balasubiramani wrote:
> Convert the atmel,hlcdc binding to DT schema format.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
>  .../devicetree/bindings/mfd/atmel,hlcdc.yaml  | 106 ++++++++++++++++++
>  .../devicetree/bindings/mfd/atmel-hlcdc.txt   |  56 ---------
>  2 files changed, 106 insertions(+), 56 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/pwm/atmel,hlcdc-pwm.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/atmel/atmel,hlcdc-dc.example.dtb: hlcdc@f0030000: hlcdc-pwm: False schema does not allow {'compatible': ['atmel,hlcdc-pwm'], 'pinctrl-names': ['default'], 'pinctrl-0': [[4294967295]], '#pwm-cells': [[3]]}
	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/atmel,hlcdc.example.dtb: hlcdc@f0030000: hlcdc-pwm: False schema does not allow {'compatible': ['atmel,hlcdc-pwm'], 'pinctrl-names': ['default'], 'pinctrl-0': [[4294967295]], '#pwm-cells': [[3]]}
	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
Documentation/devicetree/bindings/mfd/atmel,hlcdc.example.dtb: /example-0/hlcdc@f0030000/hlcdc-pwm: failed to match any schema with compatible: ['atmel,hlcdc-pwm']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240110102535.246177-3-dharma.b@microchip.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

