Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8C533E181
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 23:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11D06E453;
	Tue, 16 Mar 2021 22:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459D46E44C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 22:38:54 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id c10so14241478ilo.8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 15:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SD/SZ3UG7VKbgaVrrT8DgCnN1QyD1tEWDh0bYJlJYkg=;
 b=iGzSAFmz3I7IkG9b0CMZUITSNhlQic8paQoGkuCa1wu1w2B+8zJtsdgfwKmU8S2XrG
 BQjFXTLebjeWj4rk1uBtVW/lf5SUtC2Q2chij/vgsNm+ZSEVDmqcAnPTVtauZ56q65/3
 XQhhY0Y4Qpl7TpcvkJw6ni1Vlr9nwYkz9rrq9stHcHEKA33c/pMxFI0sNKG50vicI8WJ
 xoZS46H2jr8obuJqAK765Nalxuyoxt1exHGn6GOhUKRQZ03bfv5PDGE/SY7BgYK19YMk
 Fxf55Uw5bJtN48K61iTzzkfG6uo6yPpd0+c0NX/4wINSPk/l9ympY3yeStCYi0L3xlbp
 xFiw==
X-Gm-Message-State: AOAM531TJK9iwhZyjdiqRcHQ0vA+juOJOjFrZaqYwgyTjmcuPLvpx5mT
 zEbRffQgROsKeLPqgyfzvA==
X-Google-Smtp-Source: ABdhPJz/1RsNGnIMlJ8fyTp0/b8ks4EGuk0hdFVREY0vKfhYgj5oz8QkS10nM9A/ROJUejiF3rXkWw==
X-Received: by 2002:a92:d6c8:: with SMTP id z8mr5459251ilp.162.1615934333469; 
 Tue, 16 Mar 2021 15:38:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id 74sm9215084iob.43.2021.03.16.15.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 15:38:52 -0700 (PDT)
Received: (nullmailer pid 3815302 invoked by uid 1000);
 Tue, 16 Mar 2021 22:38:50 -0000
Date: Tue, 16 Mar 2021 16:38:50 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v5 07/14] dt-bindings: mfd: Add i.MX8qm/qxp Control and
 Status Registers module binding
Message-ID: <20210316223850.GA3806545@robh.at.kernel.org>
References: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
 <1615370138-5673-8-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615370138-5673-8-git-send-email-victor.liu@nxp.com>
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, lee.jones@linaro.org,
 kishon@ti.com, linux-imx@nxp.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, jonas@kwiboo.se, s.hauer@pengutronix.de,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 jernej.skrabec@siol.net, linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 vkoul@kernel.org, kernel@pengutronix.de, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 10, 2021 at 05:55:31PM +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp Control and Status Registers module.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v4->v5:
> * Newly introduced in v5. (Rob)
> 
>  .../devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml   | 202 +++++++++++++++++++++
>  1 file changed, 202 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml b/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> new file mode 100644
> index 00000000..0e724d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> @@ -0,0 +1,202 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/fsl,imx8qxp-csr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8qm/qxp Control and Status Registers Module Bindings
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description: |
> +  As a system controller, the Freescale i.MX8qm/qxp Control and Status
> +  Registers(CSR) module represents a set of miscellaneous registers of a
> +  specific subsystem.  It may provide control and/or status report interfaces
> +  to a mix of standalone hardware devices within that subsystem.  One typical
> +  use-case is for some other nodes to acquire a reference to the syscon node
> +  by phandle, and the other typical use-case is that the operating system
> +  should consider all subnodes of the CSR module as separate child devices.
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - fsl,imx8qxp-mipi-lvds-csr
> +          - fsl,imx8qm-lvds-csr

You shouldn't need this, we filter out 'syscon' and 'simple-mfd'.

> +  required:
> +    - compatible
> +
> +properties:
> +  $nodename:
> +    pattern: "^syscon@[0-9a-f]+$"
> +
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,imx8qxp-mipi-lvds-csr
> +          - fsl,imx8qm-lvds-csr
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: ipg
> +
> +patternProperties:
> +  "^(ldb|phy|pxl2dpi)$":
> +    type: object
> +    description: The possible child devices of the CSR module.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8qxp-mipi-lvds-csr
> +    then:
> +      required:
> +        - pxl2dpi
> +        - ldb
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8qm-lvds-csr
> +    then:
> +      required:
> +        - phy
> +        - ldb
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8-lpcg.h>
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +    mipi_lvds_0_csr: syscon@56221000 {
> +        compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
> +        reg = <0x56221000 0x1000>;
> +        clocks = <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
> +        clock-names = "ipg";
> +
> +        mipi_lvds_0_pxl2dpi: pxl2dpi {
> +            compatible = "fsl,imx8qxp-pxl2dpi";
> +            fsl,sc-resource = <IMX_SC_R_MIPI_0>;
> +            power-domains = <&pd IMX_SC_R_MIPI_0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    reg = <0>;
> +
> +                    mipi_lvds_0_pxl2dpi_dc0_pixel_link0: endpoint@0 {
> +                        reg = <0>;
> +                        remote-endpoint = <&dc0_pixel_link0_mipi_lvds_0_pxl2dpi>;
> +                    };
> +
> +                    mipi_lvds_0_pxl2dpi_dc0_pixel_link1: endpoint@1 {
> +                        reg = <1>;
> +                        remote-endpoint = <&dc0_pixel_link1_mipi_lvds_0_pxl2dpi>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    reg = <1>;
> +
> +                    mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
> +                        reg = <0>;
> +                        remote-endpoint = <&mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi>;
> +                    };
> +
> +                    mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1: endpoint@1 {
> +                        reg = <1>;
> +                        remote-endpoint = <&mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi>;
> +                    };
> +                };
> +            };
> +        };
> +
> +        mipi_lvds_0_ldb: ldb {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            compatible = "fsl,imx8qxp-ldb";
> +            clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
> +                     <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
> +            clock-names = "pixel", "bypass";
> +            power-domains = <&pd IMX_SC_R_LVDS_0>;
> +
> +            channel@0 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <0>;
> +                phys = <&mipi_lvds_0_phy>;
> +                phy-names = "lvds_phy";
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
> +                        remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +
> +                    /* ... */
> +                };
> +            };
> +
> +            channel@1 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <1>;
> +                phys = <&mipi_lvds_0_phy>;
> +                phy-names = "lvds_phy";
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
> +                        remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +
> +                    /* ... */
> +                };
> +            };
> +        };
> +    };
> +
> +    mipi_lvds_0_phy: phy@56228300 {
> +        compatible = "fsl,imx8qxp-mipi-dphy";
> +        reg = <0x56228300 0x100>;
> +        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_PHY>;
> +        clock-names = "phy_ref";
> +        #phy-cells = <0>;
> +        fsl,syscon = <&mipi_lvds_0_csr>;
> +        power-domains = <&pd IMX_SC_R_MIPI_0>;
> +    };
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
