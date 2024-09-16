Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0DF979E16
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 11:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA5F10E108;
	Mon, 16 Sep 2024 09:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NdGTUia0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846D710E108
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 09:14:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3ACCC5C5B2B;
 Mon, 16 Sep 2024 09:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A15BC4CECD;
 Mon, 16 Sep 2024 09:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726478042;
 bh=XefrUJ67gJuBnyR8xA7a23eB3BjecjUoWUUh+qaYcPk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NdGTUia0eN/xyEaTo1jz+KBKCtm5h0YXkrYjmIi5+1sKjv0JkrNR3RzAutCPPBejz
 Pwjh122qU3EOS73Ivig/Besss3fJy0NNp0x/5U1c6DzIV/aK6f5CwefrjE3LQsL6lM
 /YLhuHn/KwoRVEFniyD9dY3AMqtUUA69h2ZwHQu4+hvxIeTEcJjrCEsn0bNXRe/kee
 TIY536bsrU0TJfIdvI1m7KDVeVqM692WaDK0PUsMhs0GkYip7DFiPDrFOXq7dcnlA6
 OOQFNI88dDRS9rfDHi0UH32gJLn9vQnbipIFDOmRHicW1z76cyW3lw2iIHs+QYMrm8
 TOkfqSksVpnKg==
Date: Mon, 16 Sep 2024 11:13:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Simona Vetter <simona@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 06/27] dt-bindings: mfd: add samsung,s2dos05
Message-ID: <bpujvanzp4yph2jkgog2rkvoywjtqad3jgk47kkex6v223flpb@66zporslyjzt>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
 <20240913-starqltechn_integration_upstream-v4-6-2d2efd5c5877@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-6-2d2efd5c5877@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 13, 2024 at 06:07:49PM +0300, Dzmitry Sankouski wrote:
> Add samsung,s2dos05 MFD module binding.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> 
> ---
> Changes in v4:
> - split long(>80) lines
> - fix indentation
> - merge with regulators binding
> - drop pmic suffix
> - drop unused labels in example
> - correct description
> ---
>  .../devicetree/bindings/mfd/samsung,s2dos05.yaml   | 99 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 100 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2dos05.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2dos05.yaml
> new file mode 100644
> index 000000000000..534434002045
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/samsung,s2dos05.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/samsung,s2dos05.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S2DOS05 Power Management IC
> +
> +maintainers:
> +  - Dzmitry Sankouski <dsankouski@gmail.com>
> +
> +description:
> +  This is a device tree bindings for S2DOS family of Power Management IC (PMIC).

Drop this sentence, not really useful. I know that I put it into other
Samsung PMIC bindings, but let's don't grow this pattern.

> +
> +  The S2DOS05 is a companion power management IC for the panel and touchscreen
> +  in smart phones. Provides voltage regulators and
> +  ADC for power/current measurements.
> +
> +  Regulator section has 4 LDO and 1 BUCK regulators and also
> +  provides ELVDD, ELVSS, AVDD lines.

What are these? Input supplies?

> +
> +properties:
> +  compatible:
> +    const: samsung,s2dos05
> +
> +  reg:
> +    maxItems: 1
> +
> +  regulators:
> +    patternProperties:
> +      "^buck1|ldo[1-4]$":

s/buck1/buck/

> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +        required:
> +          - regulator-name
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - regulators
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      pmic@60 {
> +        compatible = "samsung,s2dos05";
> +        reg = <0x60>;
> +
> +            regulators {

Messed indentation.

Use 4 spaces for example indentation.

> +                ldo1 {
> +                    regulator-name = "s2dos05-ldo1";

Such name is useless, so it's a clear sign you should not require it. If
you keep it in example, then say something useful - see your DTS.

> +                    regulator-min-microvolt = <1500000>;
> +                    regulator-max-microvolt = <2000000>;
> +                    regulator-active-discharge = <0x1>;
> +                };

...

> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 59d027591e34..92135252264a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20465,6 +20465,7 @@ L:	linux-samsung-soc@vger.kernel.org
>  S:	Maintained
>  B:	mailto:linux-samsung-soc@vger.kernel.org
>  F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
> +F:	Documentation/devicetree/bindings/mfd/samsung,s2dos*.yaml
>  F:	Documentation/devicetree/bindings/mfd/samsung,s2m*.yaml

Maybe just change this pattern to s2*.yaml ?

>  F:	Documentation/devicetree/bindings/mfd/samsung,s5m*.yaml
>  F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
> 
> -- 
> 2.39.2
> 
