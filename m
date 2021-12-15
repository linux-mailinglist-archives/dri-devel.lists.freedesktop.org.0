Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3597475DA4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 17:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D8810E320;
	Wed, 15 Dec 2021 16:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468A810E278
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 16:38:03 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id bj13so32457966oib.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 08:38:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pyzDEpSOQgdCiOSbwrSV+3W9QMVtWPI913uVY3KbW+g=;
 b=mVzAWEoh4FairScVXBXbUYEt4gT4AbAmL0GJ34Wo6TmJpt1/cMrboMmvhl9U+FsD+t
 /Ln4KEATm+s+yZbiDDQyJolzViz9jFwPfChxl+ZsgLqgH7VTQNJtpeZpJxEYE2sJvRpN
 ngLA1RuBUyz9umMdTBcnVGIbVn5bKHdEkvn5mgmCjkLMI21+ofDLGA83wfo/W1RTnTnR
 IlkvPkdYFBCIZz8pzz1S88C0mwUH1HEMWxkiMMSMMWU6oPBnGCIbqSzKXR4kRx5cMuwH
 WaMeS7NmWMAJfzHNcNY0XhE08Fen1eTaJseC0+A0YY2UpFenOzDdwit6pm1F1dDty0d1
 5BXw==
X-Gm-Message-State: AOAM532hvm5+kwwdbO2jNGHZSmO6gDC3dhS8koQi/b3atD84UfzJbDLb
 bt8x3frU4lrxPOZaYh9J+g==
X-Google-Smtp-Source: ABdhPJwchxUpomWZ84XMD8NECADxpL1WphGhTrDCmu+5xiuED9HghkfnDdHWfY06xUvJVQI/VrKNBA==
X-Received: by 2002:aca:581:: with SMTP id 123mr574137oif.13.1639586282530;
 Wed, 15 Dec 2021 08:38:02 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h1sm537374oog.26.2021.12.15.08.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:38:01 -0800 (PST)
Received: (nullmailer pid 1441302 invoked by uid 1000);
 Wed, 15 Dec 2021 16:38:01 -0000
Date: Wed, 15 Dec 2021 10:38:01 -0600
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 10/18] dt-bindings: display: rockchip: Add binding for VOP2
Message-ID: <YboZ6aXQXZ/WReB1@robh.at.kernel.org>
References: <20211208151230.3695378-1-s.hauer@pengutronix.de>
 <20211208151230.3695378-11-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208151230.3695378-11-s.hauer@pengutronix.de>
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

On Wed, Dec 08, 2021 at 04:12:22PM +0100, Sascha Hauer wrote:
> The VOP2 is found on newer Rockchip SoCs like the rk3568 or the rk3566.
> The binding differs slightly from the existing VOP binding, so add a new
> binding file for it.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../display/rockchip/rockchip-vop2.yaml       | 118 ++++++++++++++++++
>  1 file changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> new file mode 100644
> index 0000000000000..6533c4ae4ec3a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings.

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
> +      - const: dclk_vp0
> +      - const: dclk_vp1
> +      - const: dclk_vp2
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port

Please describe what the port represents.

> +
> +  assigned-clocks:
> +    maxItems: 2
> +
> +  assigned-clock-rates:
> +    maxItems: 2
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
> +  - port
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
> +                vop_out: port {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    vp0_out_dsi0: endpoint@0 {
> +                        reg = <0>;
> +                        remote-endpoint = <&dsi0_in_vp0>;
> +                    };
> +                    vp0_out_hdmi: endpoint@1 {
> +                        reg = <1>;
> +                        remote-endpoint = <&hdmi0_in_vp0>;
> +                    };
> +                };
> +            };
> +        };
> -- 
> 2.30.2
> 
> 
