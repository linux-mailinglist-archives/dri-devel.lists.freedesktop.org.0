Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1B43AF2D8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 19:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E92B6E323;
	Mon, 21 Jun 2021 17:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536306E323
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 17:56:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 654F75E17;
 Mon, 21 Jun 2021 19:56:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624298174;
 bh=xTAY6XehRVOvS40XWKwQ0ZxduxmilFWHgm+B43wpOtk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LfWdClqW2kQ6uB7QoP6STkQ08ylCf9woPfaGaApNrjNI6NChKCGJenjYRIPetky1q
 JKwS5IDWB0LO3DvoiZU03U6xpabHxbwPjne9FRGYCZgyhptOLomgX7XSSO+u9YzUiY
 d6WEo81pq6a8aUgM+XvgzDhTE2t7Dw2Nxe2Gc7R0=
Date: Mon, 21 Jun 2021 20:55:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [RFC PATCH 1/9] dt-bindings: display: bridge: Add Samsung SEC
 MIPI DSIM bindings
Message-ID: <YNDSpAJdI3OKugSL@pendragon.ideasonboard.com>
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
 <20210621072424.111733-2-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210621072424.111733-2-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-amarula@amarulasolutions.com,
 Tomasz Figa <t.figa@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 Robert Foss <robert.foss@linaro.org>, Fancy Fang <chen.fang@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

Thank you for the patch.

On Mon, Jun 21, 2021 at 12:54:16PM +0530, Jagan Teki wrote:
> Samsung SEC MIPI DSIM Bridge controller is MIPI DSI bridge
> available in NXP's i.MX8M Mini and Nano Processors.
> 
> Add dt-bingings for it.
> 
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  .../display/bridge/samsung,sec-dsim.yaml      | 184 ++++++++++++++++++
>  1 file changed, 184 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/samsung,sec-dsim.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,sec-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,sec-dsim.yaml
> new file mode 100644
> index 000000000000..32f67f313dfd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/samsung,sec-dsim.yaml
> @@ -0,0 +1,184 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/samsung,sec-dsim.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SEC MIPI DSIM Bridge controller on i.MX8M Mini and Nano SoCs
> +
> +maintainers:
> +  - Jagan Teki <jagan@amarulasolutions.com>
> +
> +description: |
> +  NWL MIPI-DSI host controller found on i.MX8 platforms. This is a dsi bridge for
> +  the SOCs NWL MIPI-DSI host controller.
> +
> +allOf:
> +  - $ref: ../dsi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mm-sec-dsim
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  assigned-clock-parents: true
> +  assigned-clock-rates: true
> +  assigned-clocks: true
> +
> +  clocks:
> +    items:
> +      - description: DSI bus clock
> +      - description: PHY_REF clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: phy_ref
> +
> +  phys:
> +    maxItems: 1
> +    description: phandle to the phy module representing the DPHY
> +
> +  phy-names:
> +    items:
> +      - const: dphy
> +
> +  power-domains:
> +    maxItems: 1
> +    description: phandle to the associated power domain
> +
> +  samsung,burst-clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      DSIM high speed burst mode frequency.
> +
> +  samsung,esc-clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      DSIM escape mode frequency.
> +
> +  samsung,pll-clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      DSIM oscillator clock frequency.

Why do you need those three properties ? They look like configuration
information to me, not system description. If they are needed, their
description needs to explain how to set them. Looking at the three
descriptions above I have no idea what to select for those frequencies.

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description:
> +          Input port node to receive pixel data from the
> +          display controller. Exactly one endpoint must be
> +          specified.
> +        properties:
> +          endpoint@0:
> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +            description: sub-node describing the input from LCDIF
> +
> +          endpoint@1:
> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +            description: sub-node describing the input from DCSS
> +
> +        oneOf:
> +          - required:
> +              - endpoint@0
> +          - required:
> +              - endpoint@1
> +
> +        unevaluatedProperties: false
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          DSI output port node to the panel or the next bridge
> +          in the chain
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - '#address-cells'
> +  - '#size-cells'
> +  - clock-names
> +  - clocks
> +  - compatible
> +  - interrupts
> +  - phy-names
> +  - phys
> +  - ports
> +  - reg
> +  - samsung,burst-clock-frequency
> +  - samsung,esc-clock-frequency
> +  - samsung,pll-clock-frequency
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mm-clock.h>
> +    #include <dt-bindings/power/imx8mm-power.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    dsi: dsi@32e10000 {
> +      compatible = "fsl,imx8mm-sec-dsim";
> +      reg = <0x32e10000 0xa0>;
> +      clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> +               <&clk IMX8MM_CLK_DSI_PHY_REF>;
> +      clock-names = "bus", "phy_ref";
> +      assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> +                        <&clk IMX8MM_VIDEO_PLL1_OUT>,
> +                        <&clk IMX8MM_CLK_DSI_PHY_REF>;
> +      assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
> +                               <&clk IMX8MM_VIDEO_PLL1_BYPASS>,
> +                               <&clk IMX8MM_VIDEO_PLL1_OUT>;
> +      assigned-clock-rates = <266000000>, <594000000>, <27000000>;
> +      interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +      phys = <&dphy>;
> +      phy-names = "dphy";
> +      power-domains = <&dispmix_blk_ctl IMX8MM_BLK_CTL_PD_DISPMIX_MIPI_DSI>;
> +      samsung,burst-clock-frequency = <891000000>;
> +      samsung,esc-clock-frequency = <54000000>;
> +      samsung,pll-clock-frequency = <27000000>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +          #size-cells = <0>;
> +          #address-cells = <1>;
> +
> +          dsi_in_lcdif: endpoint@0 {
> +            reg = <0>;
> +            remote-endpoint = <&lcdif_out_dsi>;
> +          };
> +        };
> +
> +        port@1 {
> +          reg = <1>;
> +
> +          dsi_out_panel: endpoint {
> +            remote-endpoint = <&panel_in_dsi>;
> +          };
> +        };
> +      };
> +    };

-- 
Regards,

Laurent Pinchart
