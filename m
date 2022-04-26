Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D1A50EDD4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 02:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0679F10E607;
	Tue, 26 Apr 2022 00:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A59910E607
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 00:49:54 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-e93ff05b23so4774104fac.9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 17:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1fdKOZi8iNJSd576TwWH5REYRKg0ya45cIe36/rUVWc=;
 b=p9jIv427BPFJc3WJtMB7YYU1wCfEc02KRmhC4j4SXemjQ74Jp19vyFekYaJVXFEsKh
 gA/QBtJjn1b62qzQmsLLcw8g4DYYgp/OAzP+UIvHUG6gaC5oa4f98piZHQko1rUtDFh/
 zltp3kg0xDAMVqDPmq0pIBxbPFWA8yvPkM/S6yIx3X96QyK2L65+h0n2qZ6IhNiRqJnt
 KOGCzBDEySYC+Guxi8iMzvSZG+6g7+6RL4Uq69gDsR7aAzeTy+juSTKmpsm6xatRvE91
 iUbQEAzBU5G33+5mghd9uJ58en7wFKp6ljNzYEwRvpPu3rdA/3NvUiiM+QbA+7gqJ3k7
 bKnQ==
X-Gm-Message-State: AOAM531lxz8Uq2cdjUTbxWAhd5C427Dkd8tOfLyDtzUU/T68bmtQZMkh
 wF7OSHaun5A8HiTo07squw==
X-Google-Smtp-Source: ABdhPJyZwC2gPyiHHF3DH1b0aGQSRbDAaw1NCgexRfV7+BT7QuhWm2DyDyquBIjIYVF/PgYajJlUYQ==
X-Received: by 2002:a05:6870:248b:b0:e5:9d7d:8795 with SMTP id
 s11-20020a056870248b00b000e59d7d8795mr8106656oaq.74.1650934193227; 
 Mon, 25 Apr 2022 17:49:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 dw11-20020a056870770b00b000e686d13875sm285196oab.15.2022.04.25.17.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 17:49:52 -0700 (PDT)
Received: (nullmailer pid 648664 invoked by uid 1000);
 Tue, 26 Apr 2022 00:49:51 -0000
Date: Mon, 25 Apr 2022 19:49:51 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: ldb: Implement
 simple NXP i.MX8MP LDB bridge
Message-ID: <YmdBr905SdaUmq0W@robh.at.kernel.org>
References: <20220423021625.512380-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220423021625.512380-1-marex@denx.de>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Robby Cai <robby.cai@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 23, 2022 at 04:16:24AM +0200, Marek Vasut wrote:
> The i.MX8MP contains two syscon registers which are responsible
> for configuring the on-SoC DPI-to-LVDS serializer. Add DT binding
> which represents this serializer as a bridge.
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> V2: - Consistently use fsl,imx8mp-ldb as compatible
>     - Drop items: from compatible:
>     - Replace minItems with maxItems in clocks:
>     - Drop quotes from clock-names const: ldb
>     - Rename syscon to fsl,syscon
>     - Use generic name of ldb-lvds in example
> V3: - Add AB from Sam
>     - Consistently use MX8MP
> ---
>  .../bindings/display/bridge/nxp,ldb.yaml      | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml
> new file mode 100644
> index 000000000000..9c1807f2ae43
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/nxp,ldb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX8MP DPI to LVDS bridge chip
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +description: |
> +  The i.MX8MP contains two syscon registers which are responsible
> +  for configuring the on-SoC DPI-to-LVDS serializer. This describes
> +  those registers as bridge within the DT.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mp-ldb
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: ldb
> +
> +  fsl,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: A phandle to media block controller.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for DPI input.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for LVDS Channel-A output (panel or bridge).
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for LVDS Channel-B output (panel or bridge).
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - fsl,syscon
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +
> +    bridge {
> +        compatible = "fsl,imx8mp-ldb";
> +        clocks = <&clk IMX8MP_CLK_MEDIA_LDB>;
> +        clock-names = "ldb";
> +        fsl,syscon = <&media_blk_ctrl>;

This binding should be a child of &media_blk_ctrl. And then do away with 
this property.

> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                ldb_from_lcdif2: endpoint {
> +                    remote-endpoint = <&lcdif2_to_ldb>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                ldb_lvds_ch0: endpoint {
> +                    remote-endpoint = <&ldb_to_lvdsx4panel>;
> +                };
> +            };
> +
> +            port@2 {
> +                reg = <2>;
> +
> +                ldb_lvds_ch1: endpoint {
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.35.1
> 
> 
