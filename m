Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAF2CA8182
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 16:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2B110EB4C;
	Fri,  5 Dec 2025 15:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TAIrLK5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A74410EB4C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 15:07:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 974E5601F0;
 Fri,  5 Dec 2025 15:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3B9C4CEF1;
 Fri,  5 Dec 2025 15:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764947274;
 bh=Btrf2pkJCWZijzZcvy/muKQ3+oGgoj6S6CYvcVWIQrk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TAIrLK5lY6tbIMZDXSaylFE0NQrndOHSyUGk0YaIxSZtnw/TdkoI3YjlqHA7OYtZO
 GTsnIpz2g1H6OBepN9YbTEtS/ML+DEM2HpHfCHI3so2uL+u4zE2MvbqhA/qGlsRNMo
 tyxAUxnmas8OwCUVJznh84YNC6ZGPLNfQV0APcvwtBvTqzt9VOiZnd8Wk5A9NW/VMJ
 qK+az0ifq91qYJ1iqtgRCctAtNyZdi1oh8lGPP8tPUqspCujiwkPu15TIpWEIzROf7
 YlJke5tJGKyHMX5s4V3BMX7Wb9HdMIHUa54sMBIYOf8dJC7FtIeKRzRAcNGna1gAsH
 Npiav9APMasgg==
Date: Fri, 5 Dec 2025 09:07:51 -0600
From: Rob Herring <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 1/4] dt-bindings: backlight: Add max25014 support
Message-ID: <20251205150751.GA124954-robh@kernel.org>
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
 <20251201-max25014-v6-1-88e3ac8112ff@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-max25014-v6-1-88e3ac8112ff@gocontroll.com>
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

On Mon, Dec 01, 2025 at 12:53:20PM +0100, Maud Spierings wrote:
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> 
> ---
> 
> In the current implementation the control registers for channel 1,
> control all channels. So only one led subnode with led-sources is
> supported right now. If at some point the driver functionality is
> expanded the bindings can be easily extended with it.

What's the relationship between the LEDs and backlight? It's a backlight 
plus LEDs or just 4 identical channels.

> 
> ---
>  .../bindings/leds/backlight/maxim,max25014.yaml    | 107 +++++++++++++++++++++
>  MAINTAINERS                                        |   5 +
>  2 files changed, 112 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> new file mode 100644
> index 000000000000..e83723224b07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim max25014 backlight controller
> +
> +maintainers:
> +  - Maud Spierings <maudspierings@gocontroll.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max25014
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  enable-gpios:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-supply:
> +    description: Regulator which controls the boost converter input rail.
> +
> +  pwms:
> +    maxItems: 1
> +
> +  maxim,iset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 15
> +    default: 11
> +    description:
> +      Value of the ISET field in the ISET register. This controls the current
> +      scale of the outputs, a higher number means more current.

We have properties for setting the current (in uA). That can't work 
here?

> +
> +  led@0:
> +    type: object
> +    description: Properties for a string of connected LEDs.
> +    $ref: common.yaml#
> +
> +    properties:
> +      reg:
> +        const: 0
> +
> +      led-sources:
> +        allOf:
> +          - minItems: 1
> +            maxItems: 4
> +            items:
> +              minimum: 0
> +              maximum: 3
> +            default: [0, 1, 2, 3]
> +
> +      default-brightness:
> +        minimum: 0
> +        maximum: 100
> +        default: 50
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        backlight@6f {
> +            compatible = "maxim,max25014";
> +            reg = <0x6f>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
> +            interrupt-parent = <&gpio1>;
> +            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> +            power-supply = <&reg_backlight>;
> +            pwms = <&pwm1>;
> +            maxim,iset = <7>;
> +
> +            led@0 {
> +                reg = <0>;
> +                led-sources = <0 1 2 3>;
> +                default-brightness = <50>;
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 58c7e3f678d8..606ce086f758 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15261,6 +15261,11 @@ F:	Documentation/userspace-api/media/drivers/max2175.rst
>  F:	drivers/media/i2c/max2175*
>  F:	include/uapi/linux/max2175.h
>  
> +MAX25014 BACKLIGHT DRIVER
> +M:	Maud Spierings <maudspierings@gocontroll.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> +
>  MAX31335 RTC DRIVER
>  M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
>  L:	linux-rtc@vger.kernel.org
> 
> -- 
> 2.52.0
> 
