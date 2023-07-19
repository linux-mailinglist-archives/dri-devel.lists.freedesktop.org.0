Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D54C759E1D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 21:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB5A10E314;
	Wed, 19 Jul 2023 19:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDB110E314
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 19:02:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B84E617CB;
 Wed, 19 Jul 2023 19:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB9BC433C8;
 Wed, 19 Jul 2023 19:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689793376;
 bh=u9hjwJitkzPQZ4YGpEFJThuMQKEBsoFdZK3Z8XQdi7w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UfVv4zXoX/HoGwQFixyFKcBw1epZ6EU9rga+LvEFoVoQT+rA85w6wzkTQBKwcSGqk
 quaVfJHjbgopC3TNKpOwL0+mN9Xya+ZEFnn78gF7zbhbdWcBOB7Ad7Jbcb1WqGFu91
 LJxc2t+aX2IcIiujW1q9MX0cONET1JV34eoaGduMbVhwISNBKiBltHaNmbPXAXgU5/
 qtE5qqT/B8b0nNhG7Kum7xrbPH4S7wpxC23q8zpsfdcLijX84dKuXLQjheSPJgCYT4
 ZPQFe2BIkckANWq9ZjgzaAALCvpUxxSZwfy+n8hA8aUCcV8JFjkgRQ+u0jm8Ps/17w
 5qXUc1WE/fD6w==
Received: (nullmailer pid 589925 invoked by uid 1000);
 Wed, 19 Jul 2023 19:02:54 -0000
Date: Wed, 19 Jul 2023 13:02:54 -0600
From: Rob Herring <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: Add panels based on
 ILITEK ILI9806E
Message-ID: <20230719190254.GA578754-robh@kernel.org>
References: <20230719152147.355486-1-luca.ceresoli@bootlin.com>
 <20230719152147.355486-2-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230719152147.355486-2-luca.ceresoli@bootlin.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 05:21:46PM +0200, Luca Ceresoli wrote:
> Add bindings for LCD panels based on the ILITEK ILI9806E RGB controller
> connected over SPI and the "ShenZhen New Display Co NDS040480800-V3"
> 480x800 panel based on it.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  .../display/panel/ilitek,ili9806e.yaml        | 69 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
> new file mode 100644
> index 000000000000..42abc6923065
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/ilitek,ili9806e.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ilitek ILI9806E display panels
> +
> +maintainers:
> +  - Luca Ceresoli <luca.ceresoli@bootlin.com>
> +
> +description:
> +  This binding is for display panels using an Ilitek ILI9806E controller in
> +  SPI mode.
> +
> +allOf:
> +  - $ref: panel-common.yaml#

A SPI device should reference spi-peripheral-props.yaml as well.

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          # ShenZhen New Display Co 3.97" 480x800 RGB a-SI TFT LCD
> +          - newdisplay,nds040480800-v3
> +      - const: ilitek,ili9806e
> +
> +  reg: true

maxItems: 1

> +  spi-max-frequency: true
> +  reset-gpios: true
> +  backlight: true
> +  port: true

Drop all these and ...

> +
> +required:
> +  - compatible
> +  - reg
> +  - port
> +
> +additionalProperties: false

... use "unevaluatedProperties" instead.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    backlight: backlight {
> +        compatible = "gpio-backlight";
> +        gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
> +    };

The exact backlight is outside the scope of this binding and should be 
dropped from the example.

> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        display@0 {
> +            compatible = "newdisplay,nds040480800-v3", "ilitek,ili9806e";
> +            reg = <0>;
> +            spi-max-frequency = <1000000>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&pinctrl_lcdgpios>;
> +            reset-gpios = <&gpio 26 GPIO_ACTIVE_LOW>;
> +            backlight = <&backlight>;
> +
> +            port {
> +                ili9806e_in: endpoint {
> +                    remote-endpoint = <&lcdif_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
