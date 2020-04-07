Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FABA1A16BE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 22:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09406E8FC;
	Tue,  7 Apr 2020 20:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A496A6E8FC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 20:24:54 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id B55DF80532;
 Tue,  7 Apr 2020 22:24:51 +0200 (CEST)
Date: Tue, 7 Apr 2020 22:24:50 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: display: convert rockchip vop
 bindings to yaml
Message-ID: <20200407202450.GC28801@ravnborg.org>
References: <20200403142235.8870-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403142235.8870-1-jbx6244@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8 a=s8YR1HE3AAAA:8 a=e5mUnYsNAAAA:8
 a=I1IL0Xl9k2phEoxdptwA:9 a=oHOzSfBX9ZjYUJn9:21 a=-5uzdQ6-SERdSyDy:21
 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=jGH_LyMDp9YhSvY-UuyI:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Johan.

On Fri, Apr 03, 2020 at 04:22:34PM +0200, Johan Jonker wrote:
> Current dts files with 'vop' nodes are manually verified.
> In order to automate this process rockchip-vop.txt
> has to be converted to yaml.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks, I have applied the patches to drm-misc-next.
They will hit the upstream kernel when next merge window opens.

	Sam

> ---
> Changes v5:
>   Add reviewed by
>   Fix irq.h already included in arm-gic.h
> 
> Changes v4:
>   Change description
>   Replace compatible oneOf by enum
>   Change interrupts description
>   Remove resets minItems
> 
> Changes v3:
>   Change description
> 
> Changes v2:
>   No new properties
> ---
>  .../bindings/display/rockchip/rockchip-vop.txt     |  74 -------------
>  .../bindings/display/rockchip/rockchip-vop.yaml    | 123 +++++++++++++++++++++
>  2 files changed, 123 insertions(+), 74 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
> deleted file mode 100644
> index 8b3a5f514..000000000
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -device-tree bindings for rockchip soc display controller (vop)
> -
> -VOP (Visual Output Processor) is the Display Controller for the Rockchip
> -series of SoCs which transfers the image data from a video memory
> -buffer to an external LCD interface.
> -
> -Required properties:
> -- compatible: value should be one of the following
> -		"rockchip,rk3036-vop";
> -		"rockchip,rk3126-vop";
> -		"rockchip,px30-vop-lit";
> -		"rockchip,px30-vop-big";
> -		"rockchip,rk3066-vop";
> -		"rockchip,rk3188-vop";
> -		"rockchip,rk3288-vop";
> -		"rockchip,rk3368-vop";
> -		"rockchip,rk3366-vop";
> -		"rockchip,rk3399-vop-big";
> -		"rockchip,rk3399-vop-lit";
> -		"rockchip,rk3228-vop";
> -		"rockchip,rk3328-vop";
> -
> -- reg: Must contain one entry corresponding to the base address and length
> -	of the register space. Can optionally contain a second entry
> -	corresponding to the CRTC gamma LUT address.
> -
> -- interrupts: should contain a list of all VOP IP block interrupts in the
> -		 order: VSYNC, LCD_SYSTEM. The interrupt specifier
> -		 format depends on the interrupt controller used.
> -
> -- clocks: must include clock specifiers corresponding to entries in the
> -		clock-names property.
> -
> -- clock-names: Must contain
> -		aclk_vop: for ddr buffer transfer.
> -		hclk_vop: for ahb bus to R/W the phy regs.
> -		dclk_vop: pixel clock.
> -
> -- resets: Must contain an entry for each entry in reset-names.
> -  See ../reset/reset.txt for details.
> -- reset-names: Must include the following entries:
> -  - axi
> -  - ahb
> -  - dclk
> -
> -- iommus: required a iommu node
> -
> -- port: A port node with endpoint definitions as defined in
> -  Documentation/devicetree/bindings/media/video-interfaces.txt.
> -
> -Example:
> -SoC specific DT entry:
> -	vopb: vopb@ff930000 {
> -		compatible = "rockchip,rk3288-vop";
> -		reg = <0x0 0xff930000 0x0 0x19c>, <0x0 0xff931000 0x0 0x1000>;
> -		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&cru ACLK_VOP0>, <&cru DCLK_VOP0>, <&cru HCLK_VOP0>;
> -		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
> -		resets = <&cru SRST_LCDC1_AXI>, <&cru SRST_LCDC1_AHB>, <&cru SRST_LCDC1_DCLK>;
> -		reset-names = "axi", "ahb", "dclk";
> -		iommus = <&vopb_mmu>;
> -		vopb_out: port {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			vopb_out_edp: endpoint@0 {
> -				reg = <0>;
> -				remote-endpoint=<&edp_in_vopb>;
> -			};
> -			vopb_out_hdmi: endpoint@1 {
> -				reg = <1>;
> -				remote-endpoint=<&hdmi_in_vopb>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
> new file mode 100644
> index 000000000..42ee2b5c3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip SoC display controller (VOP)
> +
> +description:
> +  VOP (Video Output Processor) is the display controller for the Rockchip
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
> +      - rockchip,px30-vop-big
> +      - rockchip,px30-vop-lit
> +      - rockchip,rk3036-vop
> +      - rockchip,rk3066-vop
> +      - rockchip,rk3126-vop
> +      - rockchip,rk3188-vop
> +      - rockchip,rk3228-vop
> +      - rockchip,rk3288-vop
> +      - rockchip,rk3328-vop
> +      - rockchip,rk3366-vop
> +      - rockchip,rk3368-vop
> +      - rockchip,rk3399-vop-big
> +      - rockchip,rk3399-vop-lit
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
> +      - description: Pixel clock.
> +      - description: Clock for the ahb bus to R/W the phy regs.
> +
> +  clock-names:
> +    items:
> +      - const: aclk_vop
> +      - const: dclk_vop
> +      - const: hclk_vop
> +
> +  resets:
> +    maxItems: 3
> +
> +  reset-names:
> +    items:
> +      - const: axi
> +      - const: ahb
> +      - const: dclk
> +
> +  port:
> +    type: object
> +    description:
> +      A port node with endpoint definitions as defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +  iommus:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3288-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    vopb: vopb@ff930000 {
> +      compatible = "rockchip,rk3288-vop";
> +      reg = <0x0 0xff930000 0x0 0x19c>,
> +            <0x0 0xff931000 0x0 0x1000>;
> +      interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&cru ACLK_VOP0>,
> +               <&cru DCLK_VOP0>,
> +               <&cru HCLK_VOP0>;
> +      clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
> +      resets = <&cru SRST_LCDC1_AXI>,
> +               <&cru SRST_LCDC1_AHB>,
> +               <&cru SRST_LCDC1_DCLK>;
> +      reset-names = "axi", "ahb", "dclk";
> +      iommus = <&vopb_mmu>;
> +      vopb_out: port {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        vopb_out_edp: endpoint@0 {
> +          reg = <0>;
> +          remote-endpoint=<&edp_in_vopb>;
> +        };
> +        vopb_out_hdmi: endpoint@1 {
> +          reg = <1>;
> +          remote-endpoint=<&hdmi_in_vopb>;
> +        };
> +      };
> +    };
> -- 
> 2.11.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
