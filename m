Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6D82E0699
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 08:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C546E150;
	Tue, 22 Dec 2020 07:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8C86E150
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 07:09:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCA0D9E6;
 Tue, 22 Dec 2020 08:09:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608620954;
 bh=VH+sNIDHdF2vto78fqqJB6mWZwyWSfrL6TYP0PHE3xc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iyRKpS/FHTAX53XZRUthWRpJGyP7509SFeIJ40/4n10Klx7n93XpRBLuJ1tAtgaXv
 A89B2GHJc3oCkDQeCNSDyCwJngwH0kHQ8XbgmWaOW1Mp41XKeHPql35r5RYv/LTJqK
 RX55kyGGc6rP72KB8RXFp6AUDoglDPPzM+xU0m7o=
Date: Tue, 22 Dec 2020 09:09:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 06/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 display pixel link binding
Message-ID: <X+Gbk3uN870B/B7P@pendragon.ideasonboard.com>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-7-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608199173-28760-7-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kishon@ti.com, a.hajda@samsung.com, vkoul@kernel.org, robh+dt@kernel.org,
 linux-imx@nxp.com, mchehab@kernel.org, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

Thank you for the patch.

On Thu, Dec 17, 2020 at 05:59:25PM +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp display pixel link.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../display/bridge/fsl,imx8qxp-pixel-link.yaml     | 128 +++++++++++++++++++++
>  1 file changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> new file mode 100644
> index 00000000..fd24a0e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8qm/qxp Display Pixel Link
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description: |
> +  The Freescale i.MX8qm/qxp Display Pixel Link(DPL) forms a standard
> +  asynchronous linkage between pixel sources(display controller or
> +  camera module) and pixel consumers(imaging or displays).
> +  It consists of two distinct functions, a pixel transfer function and a
> +  control interface.  Multiple pixel channels can exist per one control channel.
> +  This binding documentation is only for pixel links whose pixel sources are
> +  display controllers.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8qm-dc-pixel-link
> +      - fsl,imx8qxp-dc-pixel-link
> +
> +  ports:
> +    type: object
> +    description: |
> +      A node containing pixel link input & output port nodes with endpoint
> +      definitions as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +      Documentation/devicetree/bindings/graph.txt

With Rob's patch that convert both of these to YAML, I think you can
drop the references to these documents, and use

  $ref: /schemas/graph.yaml#/properties/ports

in the ports node, and

  $ref: /schemas/graph.yaml#/$defs/port-base
  unevaluatedProperties: false

in the port nodes, dropping the type property. You will also be able to
drop

  additionalProperties: false

for the ports node.

> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        description: The pixel link input port node from upstream video source.
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +        required:
> +          - reg
> +
> +    patternProperties:
> +      "^port@[1-4]$":
> +        type: object
> +        description: The pixel link output port node to downstream bridge.
> +
> +        properties:
> +          reg:
> +            enum: [ 1, 2, 3, 4 ]
> +
> +        required:
> +          - reg
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +
> +    anyOf:
> +      - required:
> +          - port@1
> +      - required:
> +          - port@2
> +      - required:
> +          - port@3
> +      - required:
> +          - port@4

Do all DPL instances have four output ports ? If so I would make all of
them mandatory, as they describe the hardware. They can be left without
any endpoing if they're not connected to anything.

> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dc0-pixel-link0 {
> +        compatible = "fsl,imx8qxp-dc-pixel-link";
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            /* from dc0 pixel combiner channel0 */
> +            port@0 {
> +                reg = <0>;
> +
> +                dc0_pixel_link0_dc0_pixel_combiner_ch0: endpoint {
> +                    remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_pixel_link0>;
> +                };
> +            };
> +
> +            /* to PXL2DPIs in MIPI/LVDS combo subsystems */
> +            port@1 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <1>;
> +
> +                dc0_pixel_link0_mipi_lvds_0_pxl2dpi: endpoint@0 {
> +                    reg = <0>;
> +                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_dc0_pixel_link0>;
> +                };
> +
> +                dc0_pixel_link0_mipi_lvds_1_pxl2dpi: endpoint@1 {
> +                    reg = <1>;
> +                    remote-endpoint = <&mipi_lvds_1_pxl2dpi_dc0_pixel_link0>;
> +                };
> +            };
> +
> +            /* to imaging subsystem */
> +            port@4 {
> +                reg = <4>;
> +            };
> +        };
> +    };

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
