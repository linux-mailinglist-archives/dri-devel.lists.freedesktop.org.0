Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66353978AE8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 23:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4A910E23D;
	Fri, 13 Sep 2024 21:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WcQMUsYv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36E010E1B7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 21:55:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4041E5C5BA1;
 Fri, 13 Sep 2024 21:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B8EC4CECC;
 Fri, 13 Sep 2024 21:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726264522;
 bh=q6149tWf9a83IHhHEMU2VwoiZlrZy13ezqBewO8qXZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WcQMUsYvo9iMfCXqKzz6WfBOeSf3QnxCe7qBB55jtluaLCdkajX3PK+h6pyWyBX07
 PnEet5lNBh2xMOHyEUtFlosiTzo3hwcMA6t3RS+egfoow2NGG+5Npxa7L2SoCr/Fwq
 +7PxDup8jdlmXiDh0wY+Xr8SAzjC+G1FGXhlQ9FtrV5qrJACiTJ7rzq5GLGeGaPylO
 GB8gfB5GU9GIUuRgX2zsW3uP0oSuG9V+oz/AGRvxv9tI7ACCSGFP0+5eFAjyG+icUO
 Rv2Mvreqixc/gkn8utok04BwajsZETiwRjz2Yoy/B6F6jeyNk8jWAZP9/okZ+fjhXI
 EJdZKnyjanX/A==
Date: Fri, 13 Sep 2024 16:55:21 -0500
From: Rob Herring <robh@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Simona Vetter <simona@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org,
 Konrad Dybcio <konradybcio@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 05/27] dt-bindings: mfd: add maxim,max77705
Message-ID: <20240913215521.GA864207-robh@kernel.org>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
 <20240913-starqltechn_integration_upstream-v4-5-2d2efd5c5877@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-5-2d2efd5c5877@gmail.com>
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

On Fri, Sep 13, 2024 at 06:07:48PM +0300, Dzmitry Sankouski wrote:
> Add maxim,max77705 core binding part.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> 
> ---
> Changes in v4:
> - change dts example intendation from tabs
>  to spaces
> - remove interrupt-names property
> - remove obvious reg description
> - split long(>80) lines
> ---
>  .../devicetree/bindings/mfd/maxim,max77705.yaml    | 169 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 170 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml
> new file mode 100644
> index 000000000000..40a67d15e312
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml
> @@ -0,0 +1,169 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/maxim,max77705.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim MAX77705 Companion Power Management IC and USB Type-C interface IC
> +
> +maintainers:
> +  - Dzmitry Sankouski <dsankouski@gmail.com>
> +
> +description: |
> +  This is a part of device tree bindings for Maxim MAX77705 multi functional
> +  device.
> +
> +  The Maxim MAX77705 is a Companion Power Management and Type-C
> +  interface IC which includes charger, fuelgauge, LED, haptic motor driver and
> +  Type-C management IC.
> +
> +properties:
> +  compatible:
> +    const: maxim,max77705
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  charger:
> +    $ref: /schemas/power/supply/power-supply.yaml
> +    additionalProperties: true

No, true is only valid for incomplete schemas (i.e. common ones included 
by another complete schema).

And since you reference another schema, you want 'unevaluatedProperties' 
instead if you want to use any properties defined in power-supply.yaml.

> +    properties:
> +      compatible:
> +        const: maxim,max77705-charger
> +
> +    required:
> +      - compatible
> +      - monitored-battery
> +
> +  fuel_gauge:

fuel-gauge

> +    $ref: /schemas/power/supply/power-supply.yaml
> +    type: object
> +    additionalProperties: true
> +    description: MAX77705 fuel gauge with ModelGauge m5 EZ algorithm support.

blank line

> +    properties:
> +      compatible:
> +        const: maxim,max77705-fuel-gauge
> +
> +      shunt-resistor-micro-ohms:
> +        description: |

Don't need '|'.

> +          The value of current sense resistor in microohms.
> +
> +    required:
> +      - compatible
> +      - shunt-resistor-micro-ohms
> +      - monitored-battery
> +      - power-supplies
> +
> +  haptic:
> +    type: object
> +    additionalProperties: false

blank line

> +    properties:
> +      compatible:
> +        const: maxim,max77705-haptic
> +
> +      haptic-supply: true
> +
> +      pwms:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - haptic-supply
> +      - pwms
> +
> +  leds:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Up to 4 LEDs supported. One LED is represented by one child node.

blank line

> +    properties:
> +      compatible:
> +        const: maxim,max77705-led
> +
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      "^led@[0-3]$":
> +        type: object
> +        $ref: /schemas/leds/common.yaml#

blank line

> +        properties:
> +          reg:
> +            description:
> +              LED index.

blank line

> +        unevaluatedProperties: false

blank line

> +        required:
> +          - reg
> +
> +    required:
> +      - compatible
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic@66 {
> +            compatible = "maxim,max77705";
> +            reg = <0x66>;
> +            interrupt-parent = <&pm8998_gpios>;
> +            interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +            pinctrl-0 = <&chg_int_default>;
> +            pinctrl-names = "default";
> +
> +            leds {
> +                compatible = "maxim,max77705-led";
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                led@1 {
> +                    reg = <1>;
> +                    label = "red:usr1";
> +                };
> +
> +                led@2 {
> +                    reg = <2>;
> +                    label = "green:usr2";
> +                };
> +
> +                led@3 {
> +                    reg = <3>;
> +                    label = "blue:usr3";
> +                };
> +            };
> +
> +            max77705_charger: charger {
> +                compatible = "maxim,max77705-charger";
> +                monitored-battery = <&battery>;
> +            };
> +
> +            fuel_gauge {
> +                compatible = "maxim,max77705-fuel-gauge";
> +                monitored-battery = <&battery>;
> +                power-supplies = <&max77705_charger>;
> +                rsense = <5>;

Not documented.

> +            };
> +
> +
> +            haptic {
> +                compatible = "maxim,max77705-haptic";
> +                haptic-supply = <&vib_regulator>;
> +                pwms = <&vib_pwm 0 50000>;
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b65cfa1d322d..59d027591e34 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14064,6 +14064,7 @@ B:	mailto:linux-samsung-soc@vger.kernel.org
>  F:	Documentation/devicetree/bindings/*/maxim,max14577.yaml
>  F:	Documentation/devicetree/bindings/*/maxim,max77686.yaml
>  F:	Documentation/devicetree/bindings/*/maxim,max77693.yaml
> +F:	Documentation/devicetree/bindings/*/maxim,max77705*.yaml
>  F:	Documentation/devicetree/bindings/*/maxim,max77843.yaml
>  F:	Documentation/devicetree/bindings/clock/maxim,max77686.txt
>  F:	drivers/*/*max77843.c
> 
> -- 
> 2.39.2
> 
