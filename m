Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9D947C18F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 15:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC01C1137F5;
	Tue, 21 Dec 2021 14:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF341137F5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 14:33:58 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id f9so977712qtk.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 06:33:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aG0eQSYEAQyUQnUa/FOediZKLelTefKQEp1kjVjva0Q=;
 b=kQIsJxCGpCiCKx7iYFutovS/X8uD800FfoVEmcdkzf+juMOjnY6xVoe7ws6VqigMAs
 baPdPvTP20uikx5rh7wLqrM6IBzXBiRxWSnWsLSRrBxEH8v1S3aMzmBiTG1HklkQ+2yH
 5c5GEXVFAyb7NsX7wbsY36hF9sXAig6EZM+5kPCJ2ejHmKUrxkndSvCQqh11MaCuPAbW
 vYZrAbtvURXSHRqszHDytChjSTl4AkUA92cMfdeL0cbFBATmqqaa/JIpR2oFsrOS9p89
 kIB0nwSzMiLwLaBt1Go8M7UVQ2Y9l8+Yz9JtDvF5B+u9Din+qEHpcogyje28phBD8Hv+
 QHMA==
X-Gm-Message-State: AOAM533KI05omFbmxkrTKwwztPf7reXGqGFFaWWcOqC8Ix8qPgS89wvG
 Z/x7KXyDZeMz1HvO70DrcQ==
X-Google-Smtp-Source: ABdhPJyhD7RbfWBFdjUBHLOnbPdtwHYSuCv8eC8x8hzMQ5P20a0gpm948kDAcVu1xWxBrU68uTKkVw==
X-Received: by 2002:a05:622a:50a:: with SMTP id
 l10mr2374912qtx.491.1640097237052; 
 Tue, 21 Dec 2021 06:33:57 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id j20sm14725579qko.117.2021.12.21.06.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 06:33:55 -0800 (PST)
Received: (nullmailer pid 1362097 invoked by uid 1000);
 Tue, 21 Dec 2021 14:33:51 -0000
Date: Tue, 21 Dec 2021 10:33:51 -0400
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 11/22] dt-bindings: display: rockchip: Add binding for VOP2
Message-ID: <YcHlzzuvxMGpPaRa@robh.at.kernel.org>
References: <20211220110630.3521121-1-s.hauer@pengutronix.de>
 <20211220110630.3521121-12-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211220110630.3521121-12-s.hauer@pengutronix.de>
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 20, 2021 at 12:06:19PM +0100, Sascha Hauer wrote:
> The VOP2 is found on newer Rockchip SoCs like the rk3568 or the rk3566.
> The binding differs slightly from the existing VOP binding, so add a new
> binding file for it.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../display/rockchip/rockchip-vop2.yaml       | 146 ++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> new file mode 100644
> index 0000000000000..df14d5aa85c85
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> @@ -0,0 +1,146 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip SoC display controller (VOP2)
> +
> +description:
> +  VOP2 (Video Output Processor v2) is the display controller for the Rockchip
> +  series of SoCs which transfers the image data from a video memory
> +  buffer to an external LCD interface.
> +
> +maintainers:
> +  - Sandy Huang <hjc@rock-chips.com>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3566-vop
> +      - rockchip,rk3568-vop
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description:
> +          Must contain one entry corresponding to the base address and length
> +          of the register space.
> +      - description:
> +          Can optionally contain a second entry corresponding to
> +          the CRTC gamma LUT address.
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      The VOP interrupt is shared by several interrupt sources, such as
> +      frame start (VSYNC), line flag and other status interrupts.
> +
> +  clocks:
> +    items:
> +      - description: Clock for ddr buffer transfer.
> +      - description: Clock for the ahb bus to R/W the phy regs.
> +      - description: Pixel clock for video port 0.
> +      - description: Pixel clock for video port 1.
> +      - description: Pixel clock for video port 2.
> +
> +  clock-names:
> +    items:
> +      - const: aclk_vop
> +      - const: hclk_vop

_vop is redundant.

> +      - const: dclk_vp0
> +      - const: dclk_vp1
> +      - const: dclk_vp2
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to GRF regs used for misc control
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/port

s/port/ports/

> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output endpoint of VP0
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output endpoint of VP1
> +
> +      port@:

port@2

> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output endpoint of VP2
> +

> +  assigned-clocks: true
> +
> +  assigned-clock-rates: true
> +
> +  assigned-clock-parents: true

These are automatically added.

> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +        #include <dt-bindings/clock/rk3568-cru.h>
> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +        #include <dt-bindings/power/rk3568-power.h>
> +        bus {
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            vop: vop@fe040000 {
> +                compatible = "rockchip,rk3568-vop";
> +                reg = <0x0 0xfe040000 0x0 0x3000>, <0x0 0xfe044000 0x0 0x1000>;
> +                interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> +                clocks = <&cru ACLK_VOP>,
> +                         <&cru HCLK_VOP>,
> +                         <&cru DCLK_VOP0>,
> +                         <&cru DCLK_VOP1>,
> +                         <&cru DCLK_VOP2>;
> +                clock-names = "aclk_vop",
> +                              "hclk_vop",
> +                              "dclk_vp0",
> +                              "dclk_vp1",
> +                              "dclk_vp2";
> +                power-domains = <&power RK3568_PD_VO>;
> +                iommus = <&vop_mmu>;
> +                vop_out: ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    vp0: port@0 {
> +                        reg = <0>;
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +                    };
> +                    vp1: port@1 {
> +                        reg = <1>;
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +                    };
> +                    vp2: port@2 {
> +                        reg = <2>;
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +                    };
> +                };
> +            };
> +        };
> -- 
> 2.30.2
> 
> 
