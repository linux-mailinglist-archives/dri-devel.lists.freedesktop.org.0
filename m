Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 258F22E0288
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 23:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550E3891E1;
	Mon, 21 Dec 2020 22:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B48891E1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 22:31:44 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id w124so12861773oia.6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 14:31:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CrCNdD9kKFd0w/18HL8sM1tY8e07PfB1FWqVN+teSm0=;
 b=ZAFM0+hdSo3aEgTC5zddRDVpwa29cAdSfjOvi8BbejgwXGI81yV7Fpzrm/vokBYWmT
 xVf0ArAUlxLPaV0ALmO73TgSRrLwQsBdxtG3Z1UyN/9wNIQ+Xg/mgLDTJqntiHupZbbW
 FGw6ofns3dRI63m8RCEfUczYneWr23E+zxzQYEO645u9E8faS+YhTWVFoxy+0EM4IH3c
 Cj9NrEr++uHM/eLfx0JGz6aJPxj0nUAi5o1all/2M/WH6V9Dhntae4Y5tCKeMIe4cMYA
 hWtVByJu2zdc+BfN6DdgmWu+LTzbiJgCGQT5r0VL9QWdWXMY5KI0V6k4qwGKML3oGFj9
 6L6g==
X-Gm-Message-State: AOAM530cpMEAFqtlJbP//gSyxAFJ0FqLkipzc7+EAjF/258oFYAEb3+w
 Ay2J3fI6OkIaDwyDuOmxMp+gGFfJXQ==
X-Google-Smtp-Source: ABdhPJwd3rb480++WHPVL+OW+GohWnneE/ypMwzopQAGGGNcpsFcZLA+a1WpJRtC7opt6UMNNivAAQ==
X-Received: by 2002:aca:6202:: with SMTP id w2mr4690067oib.5.1608589903376;
 Mon, 21 Dec 2020 14:31:43 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id z6sm3980286ooz.17.2020.12.21.14.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 14:31:42 -0800 (PST)
Received: (nullmailer pid 689847 invoked by uid 1000);
 Mon, 21 Dec 2020 22:31:40 -0000
Date: Mon, 21 Dec 2020 15:31:40 -0700
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 06/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 display pixel link binding
Message-ID: <20201221223140.GA687317@robh.at.kernel.org>
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

Perhaps some information about how this 'device' is accessed because you 
have no control interface.

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

You can drop 'reg' parts.

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
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
