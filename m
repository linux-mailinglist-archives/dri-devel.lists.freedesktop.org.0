Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2939F544595
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 10:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C3810E27F;
	Thu,  9 Jun 2022 08:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1F610E1DE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 08:24:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3C256CF;
 Thu,  9 Jun 2022 10:24:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1654763058;
 bh=vMa0MeOb7MuPhJf+SAgT/S3YUwPTfbIyifU6+Lln7ug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PZfVSv5AxZ6ensen1LEp27w+o8Xvjqj3d2YDyeuuD3fQiE8yAEsubP1ktZZuAx1uF
 cFNUB+a8lzMFtYqdVicHOrE0PqqZR5SBjzbt9pXh3UGdO9fmnUIPJOJ0riN/dLjorU
 S3gWVqTbJcq7ALbN/xoCMSB+YtDqWPeUT8s0XHZ4=
Date: Thu, 9 Jun 2022 11:24:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v8 03/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 pixel combiner binding
Message-ID: <YqGuK9g0g2XsJV+x@pendragon.ideasonboard.com>
References: <20220609064931.3068601-1-victor.liu@nxp.com>
 <20220609064931.3068601-4-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220609064931.3068601-4-victor.liu@nxp.com>
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
Cc: andrzej.hajda@intel.com, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 lee.jones@linaro.org, jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com,
 linux-imx@nxp.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 kernel@pengutronix.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

Thank you for the patch.

On Thu, Jun 09, 2022 at 02:49:20PM +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp pixel combiner.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v7->v8:
> * No change.
> 
> v6->v7:
> * No change.
> 
> v5->v6:
> * No change.
> 
> v4->v5:
> * No change.
> 
> v3->v4:
> * No change.
> 
> v2->v3:
> * Add Rob's R-b tag.
> 
> v1->v2:
> * Use graph schema. (Laurent)
> * Use enum instead of oneOf + const for the reg property of pixel combiner
>   channels. (Rob)
> 
>  .../bridge/fsl,imx8qxp-pixel-combiner.yaml    | 144 ++++++++++++++++++
>  1 file changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> new file mode 100644
> index 000000000000..50bae2122183
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> @@ -0,0 +1,144 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/fsl,imx8qxp-pixel-combiner.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8qm/qxp Pixel Combiner
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description: |
> +  The Freescale i.MX8qm/qxp Pixel Combiner takes two output streams from a
> +  single display controller and manipulates the two streams to support a number
> +  of modes(bypass, pixel combine, YUV444 to YUV422, split_RGB) configured as
> +  either one screen, two screens, or virtual screens.  The pixel combiner is
> +  also responsible for generating some of the control signals for the pixel link
> +  output channel.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8qm-pixel-combiner
> +      - fsl,imx8qxp-pixel-combiner
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: apb
> +
> +  power-domains:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^channel@[0-1]$":
> +    type: object
> +    description: Represents a display stream of pixel combiner.
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      reg:
> +        description: The display stream index.
> +        enum: [ 0, 1 ]
> +
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input endpoint of the display stream.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output endpoint of the display stream.

When multiple ports are present, they are usually grouped in a "ports"
node. Not doing say may work from a schema point of view but makes
implementation of generic helpers more difficult. Unless Rob thinks
"ports" is really not needed here, I'd add it.

This comment applies to all bindings in this series.

> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - reg
> +      - port@0
> +      - port@1
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - reg
> +  - clocks
> +  - clock-names
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8-lpcg.h>
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +    pixel-combiner@56020000 {
> +        compatible = "fsl,imx8qxp-pixel-combiner";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0x56020000 0x10000>;
> +        clocks = <&dc0_pixel_combiner_lpcg IMX_LPCG_CLK_4>;
> +        clock-names = "apb";
> +        power-domains = <&pd IMX_SC_R_DC_0>;
> +
> +        channel@0 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                dc0_pixel_combiner_ch0_dc0_dpu_disp0: endpoint {
> +                    remote-endpoint = <&dc0_dpu_disp0_dc0_pixel_combiner_ch0>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                dc0_pixel_combiner_ch0_dc0_pixel_link0: endpoint {
> +                    remote-endpoint = <&dc0_pixel_link0_dc0_pixel_combiner_ch0>;
> +                };
> +            };
> +        };
> +
> +        channel@1 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <1>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                dc0_pixel_combiner_ch1_dc0_dpu_disp1: endpoint {
> +                    remote-endpoint = <&dc0_dpu_disp1_dc0_pixel_combiner_ch1>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                dc0_pixel_combiner_ch1_dc0_pixel_link1: endpoint {
> +                    remote-endpoint = <&dc0_pixel_link1_dc0_pixel_combiner_ch1>;
> +                };
> +            };
> +        };
> +    };

-- 
Regards,

Laurent Pinchart
