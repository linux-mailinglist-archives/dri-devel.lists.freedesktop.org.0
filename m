Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A106F7A227C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 17:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8273810E647;
	Fri, 15 Sep 2023 15:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F240E10E647
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 15:35:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2D4D0CE2C3E;
 Fri, 15 Sep 2023 15:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26ECCC433C8;
 Fri, 15 Sep 2023 15:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694792137;
 bh=eh4hH43/skbLq/T9F77bp8BlsF0bG5I501rYqNbey9I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PPfKUYXYtMuseNUQg+5lGAAzQpjpqobvavjqmSNov9pCRHaXxXwA3VOahu6pTywRJ
 kF/716J3AjK2BZyzwSHbObop64Kf/Amu4S1oUefCLx2hVJZXs3V8yb7fTTTJrefYIc
 SV8L152VzFsrESorWxN6Snp17XhJl0SEaxrmi1r4OqtH81C1xvJ2A2gorhPxpgY79s
 fAnH1I0ZpHyhZxQ49Vzpxs1xw1VWS+nF1qPo36SEuPVcIA8DhAYrWEHEApdC5FUNG0
 NfrwNWvCVqTOqy0yc1Mth7v5IK26vFM/p122KNYdozchdw4PgoccKsSOqkcPDzJH7E
 cwzCeNYaQiO+Q==
Received: (nullmailer pid 3764874 invoked by uid 1000);
 Fri, 15 Sep 2023 15:35:35 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Flavio Suligoi <f.suligoi@asem.it>
In-Reply-To: <20230915140516.1294925-1-f.suligoi@asem.it>
References: <20230915140516.1294925-1-f.suligoi@asem.it>
Message-Id: <169479213508.3764858.9372771347269509988.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: Add MPS MP3309C
Date: Fri, 15 Sep 2023 10:35:35 -0500
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
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 15 Sep 2023 16:05:15 +0200, Flavio Suligoi wrote:
> The Monolithic Power (MPS) MP3309C is a WLED step-up converter, featuring a
> programmable switching frequency to optimize efficiency.
> The brightness can be controlled either by I2C commands (called "analog"
> mode) or by a PWM input signal (PWM mode).
> This driver supports both modes.
> 
> For device driver details, please refer to:
> - drivers/video/backlight/mp3309c_bl.c
> 
> The datasheet is available at:
> - https://www.monolithicpower.com/en/mp3309c.html
> 
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
> 
> v2:
>  - remove useless properties (dimming-mode, pinctrl-names, pinctrl-0,
>    switch-on-delay-ms, switch-off-delay-ms, reset-gpios, reset-on-delay-ms,
>    reset-on-length-ms)
>  - add common.yaml#
>  - remove already included properties (default-brightness, max-brightness)
>  - substitute three boolean properties, used for the overvoltage-protection
>    values, with a single enum property
>  - remove some conditional definitions
>  - remove the 2nd example
> v1:
>  - first version
> 
>  .../bindings/leds/backlight/mps,mp3309c.yaml  | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.example.dtb: /example-0/i2c/backlight@17: failed to match any schema with compatible: ['mps,mp3309c-backlight']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230915140516.1294925-1-f.suligoi@asem.it

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

