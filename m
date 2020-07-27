Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C201F22F8B8
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 21:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83C389BA5;
	Mon, 27 Jul 2020 19:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E87A89BA5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 19:10:58 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id CF9E98046C;
 Mon, 27 Jul 2020 21:10:53 +0200 (CEST)
Date: Mon, 27 Jul 2020 21:10:52 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/6] dt-bindings: display: Document NewVision NV3052C DT
 node
Message-ID: <20200727191052.GA1011220@ravnborg.org>
References: <20200727164613.19744-1-paul@crapouillou.net>
 <20200727164613.19744-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727164613.19744-2-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8 a=gEfo2CItAAAA:8 a=cFL5_wh2AAAA:8
 a=47UgJTjCgcInOTyXzTsA:9 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=yWaY75k36LOQ25BSl4KT:22
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 od@zcrc.me, Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul.

On Mon, Jul 27, 2020 at 06:46:08PM +0200, Paul Cercueil wrote:
> Add documentation for the Device Tree node for LCD panels based on the
> NewVision NV3052C controller.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Very happy to see work on RG-350 :-)
Some feedback below.

	Sam

> ---
>  .../display/panel/newvision,nv3052c.yaml      | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3052c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3052c.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3052c.yaml
> new file mode 100644
> index 000000000000..751a28800fc2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3052c.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/newvision,nv3052c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NewVision NV3052C TFT LCD panel driver with SPI control bus
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +description: |
> +  This is a driver for 320x240 TFT panels,
The binding describes the HW, not the driver. So please re-phrase this
part.

This datasheet: https://www.phoenixdisplay.com/wp-content/uploads/2019/05/NV3052C-Datasheet-V0.2.pdf
tells that the driver supports additional resoltions.
I guess the 320x240 resolution is limited to the leadtek panel.

> +  accepting a variety of input
> +  streams that get adapted and scaled to the panel. The panel output has
> +  960 TFT source driver pins and 240 TFT gate driver pins, VCOM, VCOML and
> +  VCOMH outputs.
> +
> +  The panel must obey the rules for a SPI slave device as specified in
> +  spi/spi-controller.yaml
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - leadtek,ltk035c5444t-spi
> +
> +      - const: newvision,nv3052c
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios: true
> +  port: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
Do the panel need any power?
I had expected to see a power-supply node as mandatory.

> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    spi {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      display@0 {
> +        compatible = "leadtek,ltk035c5444t-spi", "newvision,nv3052c";
> +        reg = <0>;
> +
> +        spi-max-frequency = <15000000>;
> +        spi-3wire;
> +        reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;


> +        backlight = <&backlight>;
> +        power-supply = <&vcc>;
These would fail later due to "unevaluatedProperties: false".
Add them above like
  backlight: true
  power-supply: true

as done for reset-gpios for example.

> +
> +        port {
> +          panel_input: endpoint {
> +              remote-endpoint = <&panel_output>;
> +          };
> +        };
> +      };
> +    };
Personally I prefer 4 space indent. But there is no fixed rule (yet)
what to use.

> +
> +...
> -- 
> 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
