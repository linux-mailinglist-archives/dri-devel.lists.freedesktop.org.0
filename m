Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C08302D6F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 22:19:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0ED56E284;
	Mon, 25 Jan 2021 21:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBA86E314
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 21:19:16 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id x71so16293951oia.9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 13:19:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NibYT71W+B8TDWyLV12/C5+2M+J43v+ssl9R4tm+o1Q=;
 b=cU2I/Q9Hq/qD7OsaViGdVI9+mjD+Ww7d6tulgKc3/cWXNUszzVW2lDj+aNCca5GqtF
 owR5sL3q31oMA8iroJeSTc5vjqB6AGkusv1pm3H+rqjmVA+RYhslBTOIGKcckJYapfp4
 7/Djt5+SCTpq5vr1cUI+/yqPTdWTiL/d3PBGh3Z0jPoPfieBjGonIPyjyUaqmyWyNl9L
 400ivT2ipvmtcNsvabAWU0cUTiKDdjxevhk/e7saSV+3DxXVMxnVRb6qY649C6r01OCi
 7tBz1PzpACbXTANdyhIeJhdINLrPps1kFfbgHGX0zTzeoB/skrcjZerjrsQAwIu9WuCe
 TsOA==
X-Gm-Message-State: AOAM531FFQON7OrNNTjwz75tqgWKJfRnDzUcwGV68F8StUZGGnr4b9lf
 977oaZynB0r4tBrEvkP3d8k4qvwWGg==
X-Google-Smtp-Source: ABdhPJzawJ1RMizxJND21fu6qb4j513EzjDeH7HKS+tLfPZacMXvR7CRmkgQOrWYyoYiX7+j1r9tOg==
X-Received: by 2002:aca:f255:: with SMTP id q82mr1293905oih.138.1611609555404; 
 Mon, 25 Jan 2021 13:19:15 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z20sm2732315oth.55.2021.01.25.13.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 13:19:12 -0800 (PST)
Received: (nullmailer pid 1014454 invoked by uid 1000);
 Mon, 25 Jan 2021 21:19:10 -0000
Date: Mon, 25 Jan 2021 15:19:10 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v2 11/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 LVDS display bridge binding
Message-ID: <20210125211910.GA1004310@robh.at.kernel.org>
References: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
 <1610616132-8220-12-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1610616132-8220-12-git-send-email-victor.liu@nxp.com>
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

On Thu, Jan 14, 2021 at 05:22:09PM +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp LVDS display bridge(LDB).
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v1->v2:
> * Use graph schema. (Laurent)
> * Side note i.MX8qxp LDB official name 'pixel mapper'. (Laurent)
> 
>  .../bindings/display/bridge/fsl,imx8qxp-ldb.yaml   | 176 +++++++++++++++++++++
>  1 file changed, 176 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> new file mode 100644
> index 00000000..514ac90
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> @@ -0,0 +1,176 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/fsl,imx8qxp-ldb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8qm/qxp LVDS Display Bridge
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description: |
> +  The Freescale i.MX8qm/qxp LVDS Display Bridge(LDB) has two channels.
> +
> +  For i.MX8qxp LDB, each channel supports up to 24bpp parallel input color
> +  format and can map the input to VESA or JEIDA standards.  The two channels
> +  cannot be used simultaneously, that is to say, the user should pick one of
> +  them to use.  Two LDB channels from two LDB instances can work together in
> +  LDB split mode to support a dual link LVDS display.  The channel indexes
> +  have to be different.  Channel0 outputs odd pixels and channel1 outputs
> +  even pixels.
> +
> +  For i.MX8qm LDB, each channel additionally supports up to 30bpp parallel
> +  input color format.  The two channels can be used simultaneously, either
> +  in dual mode or split mode.  In dual mode, the two channels output identical
> +  data.  In split mode, channel0 outputs odd pixels and channel1 outputs even
> +  pixels.
> +
> +  A side note is that i.MX8qm/qxp LDB is officially called pixel mapper in
> +  the SoC reference manuals.  The pixel mapper uses logic of LDBs embedded in
> +  i.MX6qdl/sx SoCs, i.e., it is essentially based on them.  To keep the naming
> +  consistency, this binding calls it LDB.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8qm-ldb
> +      - fsl,imx8qxp-ldb
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: pixel clock
> +      - description: bypass clock
> +
> +  clock-names:
> +    items:
> +      - const: pixel
> +      - const: bypass
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  fsl,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      A phandle which points to Control and Status Registers(CSR) module.

Again, seems like this binding should be a child of the syscon.

> +
> +  fsl,companion-ldb:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      A phandle which points to companion LDB which is used in LDB split mode.
> +
> +patternProperties:
> +  "^channel@[0-1]$":
> +    type: object
> +    description: Represents a channel of LDB.
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      reg:
> +        description: The channel index.
> +        enum: [ 0, 1 ]
> +
> +      phys:
> +        description: A phandle to the phy module representing the LVDS PHY.
> +        maxItems: 1
> +
> +      phy-names:
> +        const: lvds_phy
> +
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input port of the channel.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output port of the channel.
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - reg
> +      - phys
> +      - phy-names
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - fsl,syscon
> +  - channel@0
> +  - channel@1
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8qm-ldb
> +    then:
> +      properties:
> +        fsl,companion-ldb: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +    ldb {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "fsl,imx8qxp-ldb";
> +        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
> +                 <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
> +        clock-names = "pixel", "bypass";
> +        power-domains = <&pd IMX_SC_R_LVDS_0>;
> +        fsl,syscon = <&mipi_lvds_0_csr>;
> +
> +        channel@0 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0>;
> +            phys = <&mipi_lvds_0_phy>;
> +            phy-names = "lvds_phy";
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
> +                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
> +                };
> +            };
> +        };
> +
> +        channel@1 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <1>;
> +            phys = <&mipi_lvds_0_phy>;
> +            phy-names = "lvds_phy";
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
> +                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
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
