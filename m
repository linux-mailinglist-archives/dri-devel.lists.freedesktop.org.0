Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 295CB23232E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 19:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A606E5B2;
	Wed, 29 Jul 2020 17:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBA06E5B0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 17:10:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE22429E;
 Wed, 29 Jul 2020 19:10:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1596042657;
 bh=riwybW52EjlFX38PbzROSyTfxzjJON7hQACGRPsGFqw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aDCiK9ivoRvkZNPZgMRw4Oi/wfssbYvl0JQ9tXWoU+XCfzqRw12iwFb831vGoOPXP
 QVSMzw38dLJLUgqnX2bwFpXgUYFMcKyvFnOCH32VvlumEQvHNDIMd1PbOMWjRBqY29
 qMQialmS1i97H78AOWJdP75VZSsyhyl5nTrTCFAk=
Date: Wed, 29 Jul 2020 20:10:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/6] dt-bindings: display: Document NewVision NV3052C DT
 node
Message-ID: <20200729171047.GA18755@pendragon.ideasonboard.com>
References: <20200727164613.19744-1-paul@crapouillou.net>
 <20200727164613.19744-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727164613.19744-2-paul@crapouillou.net>
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
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

Thank you for the patch.

On Mon, Jul 27, 2020 at 06:46:08PM +0200, Paul Cercueil wrote:
> Add documentation for the Device Tree node for LCD panels based on the
> NewVision NV3052C controller.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
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

s/driver/driver IC/ (or driver chip, or controller, or any other similar
term) to avoid confusion with device drivers.

Do I understand that the NV3052C also supports control through DSI ?
Shouldn't this appear in the DT bindings ? Do I assume correctly that
the panel will be controlled either through SPI or through DSI, but not
through both ?

> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +description: |
> +  This is a driver for 320x240 TFT panels, accepting a variety of input
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

According to its datasheet, that panel is 640x480 :-)

I think you need a bit of documentation to explain that two compatible
strings are needed, one matching the panel type, and a second one
matching the chip.

> +
> +      - const: newvision,nv3052c
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios: true
> +  port: true

The NV3052C requires multiple power supplies, I think this needs to be
taken into account here.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
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
> +
> +        port {
> +          panel_input: endpoint {
> +              remote-endpoint = <&panel_output>;
> +          };
> +        };
> +      };
> +    };
> +
> +...

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
