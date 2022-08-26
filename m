Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2655A3035
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 21:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8905310E2AA;
	Fri, 26 Aug 2022 19:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C00410E2AA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 19:52:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA72A3F1;
 Fri, 26 Aug 2022 21:52:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661543545;
 bh=pxDWoc6HHlc6ObY4f/XUHXN7eaWL6EKlUFTO8nQeR84=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Um4bWNz0Svq7GF95PxqlPuSBnH+atumuxXCqAkY/iNqjAxlO5demyc+9gvVG8Msi0
 zKP426HSxvFs8ZsojGcOjgetmmF/0qvLxav6qljChpw46Z958PeWu14D5wa3qELcYJ
 EKRJt+iqTTU5ONTFuCQfkqLRHoT3mUDUEVHt2Ghg=
Date: Fri, 26 Aug 2022 22:52:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 3/4] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI PVI
Message-ID: <YwkkcW4rJF/t/JY6@pendragon.ideasonboard.com>
References: <20220826192424.3216734-1-l.stach@pengutronix.de>
 <20220826192424.3216734-3-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220826192424.3216734-3-l.stach@pengutronix.de>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Liu Ying <victor.liu@nxp.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, patchwork-lst@pengutronix.de,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

Thank you for the patch.

On Fri, Aug 26, 2022 at 09:24:23PM +0200, Lucas Stach wrote:
> Add binding for the i.MX8MP HDMI parallel video interface block.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Tested-by: Marek Vasut <marex@denx.de>
> ---
>  .../display/imx/fsl,imx8mp-hdmi-pvi.yaml      | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml
> new file mode 100644
> index 000000000000..bf25d29c03ab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pvi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8MP HDMI Parallel Video Interface
> +
> +maintainers:
> +  - Lucas Stach <l.stach@pengutronix.de>
> +
> +description: |
> +  The HDMI parallel video interface is timing and sync generator block in the
> +  i.MX8MP SoC, that sits between the video source and the HDMI TX controller.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mp-hdmi-pvi
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      This device has two video ports.

You could possibly drop the description here, this is made evident by
the two ports below, up to you.

> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input from the LCDIF controller.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output to the HDMI TX controller
> +
> +    anyOf:
> +      - required:
> +          - port@0
> +      - required:
> +          - port@1

Both exist and need to be connected, is there a reason not to require
both ?

> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +    #include <dt-bindings/power/imx8mp-power.h>
> +
> +    display-bridge@32fc4000 {
> +        compatible = "fsl,imx8mp-hdmi-pvi";
> +        reg = <0x32fc4000 0x40>;
> +        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PVI>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                pvi_from_lcdif3: endpoint {
> +                    remote-endpoint = <&lcdif3_to_pvi>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                pvi_to_hdmi_tx: endpoint {
> +                    remote-endpoint = <&hdmi_tx_from_pvi>;
> +                };
> +            };
> +        };
> +    };

-- 
Regards,

Laurent Pinchart
