Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB032E024E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 23:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3D76E5A3;
	Mon, 21 Dec 2020 22:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE176E5A3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 22:07:17 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id d20so10230332otl.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 14:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2VgdvX5Ur5pTGaQxWLG6Bl3LqsRP77sKFxiKnQwMdLs=;
 b=Jn7KuhcfFiCsVJESGLaMiC23ytkU5F37JmdOd1kbF3sWlm2KN8xItUsD53MEfe6ms9
 CcGusj2b9RALF+Kh67oBMCVmqR68liCD4pv6jdZeooRDJT5uiHW4XBxdZTZ0TgW663BG
 EDrnskrmgpY0qzfRzVOJGbqsXfW7r20/X6hpTmlr/nw9ZZJkrT8OqaHfjcQccIo4wNM9
 vl74NOoBgMpQaJHKLK1WPlLCYVNmz+RSkBFKl/pdx59w8Cf3sD+TUDhW4Nv4ZKJr0avR
 xRHABI4uWVCfjWlMDA5bQ2itz2/WeItIaN6c7fuyr3KNcV4NRWXneerhMWcN90p6PI9b
 T5WA==
X-Gm-Message-State: AOAM5332ro2hOfhwt6F5kQQGIGbgwZzRu5CcOz4xdw/01WRf2Qj4gjX5
 20DYfdSU5kAxU2TsHT0AHULfgpuRwA==
X-Google-Smtp-Source: ABdhPJyoDAL7oYPx/VjD1/+QQ1bEQabcYua0wBR8spCDnUfsFpkpljR32JlL7Lrqx0Dl0tK8jRbaEQ==
X-Received: by 2002:a9d:154:: with SMTP id 78mr13429159otu.171.1608588436945; 
 Mon, 21 Dec 2020 14:07:16 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id e25sm1825310oof.1.2020.12.21.14.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 14:07:16 -0800 (PST)
Received: (nullmailer pid 652695 invoked by uid 1000);
 Mon, 21 Dec 2020 22:07:13 -0000
Date: Mon, 21 Dec 2020 15:07:13 -0700
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 04/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 pixel combiner binding
Message-ID: <20201221220713.GA610096@robh.at.kernel.org>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-5-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608199173-28760-5-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 Laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kishon@ti.com, a.hajda@samsung.com, vkoul@kernel.org, linux-imx@nxp.com,
 mchehab@kernel.org, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 17, 2020 at 05:59:23PM +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp pixel combiner.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 160 +++++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> new file mode 100644
> index 00000000..bacacd8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> @@ -0,0 +1,160 @@
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
> +        oneOf:
> +          - const: 0
> +          - const: 1

enum: [ 0, 1 ]

> +
> +      port@0:
> +        type: object
> +        description: Input endpoint of the display stream.
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +        required:
> +          - reg

You can drop 'reg' parts. That's going to get covered by the graph 
schema.

> +
> +      port@1:
> +        type: object
> +        description: Output endpoint of the display stream.
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +        required:
> +          - reg
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
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
