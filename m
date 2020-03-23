Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9F918FDD7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 20:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956686E3B5;
	Mon, 23 Mar 2020 19:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B556E3B5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 19:41:30 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id g15so5366243ilj.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 12:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wZqIgGpvp/4WvbCX5pHBFK/yoCSdaoYyZWmUWDi0I6w=;
 b=rkfuYek6OSX0tmjer0PbbR6PeKmo5R5L2qQnC9cXWyCk2st0tJsq+PeykWH9/SaRke
 mv9dUcL73l9SXUOtL8PXwCQ+gymazpULzjUM8tf2NuOFvLCgfSDIv4om9dLpCosf/JSM
 2yyK+KrPkprbbm5zGUdZx481MGk+FperwcySXNa58iLYRJBmCWFAyg52mdsDiePOzf1R
 5Q8v4qWd1RFIzi9I2+vZrLxGd/Twl1Vqsjli7BjbFcuIU6o4pSRcQKpztbHp1S8sJNps
 c36Hf5Sy3bvhda8dOdRD1ehFH7N+Q8fVz7d8bIRxJAyL59TVemMRPq9/p2WsSOkQh592
 eWvg==
X-Gm-Message-State: ANhLgQ0X2fZgTYjWHoWtD12sElUshBY9SF5v6yJvqvdrnT7rSmqtGgRR
 NPMXaJSG1dlOO/aXS0Y7vg==
X-Google-Smtp-Source: ADFU+vvGYTk0BRk7h8eRIHfK7+xZWKAn2MCIiE63wBii1saw9W0SBjLLJ/OUebYGdQPaJwZK8SFAlw==
X-Received: by 2002:a92:41c7:: with SMTP id o190mr22269984ila.11.1584992489760; 
 Mon, 23 Mar 2020 12:41:29 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id m14sm795371ilr.16.2020.03.23.12.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 12:41:29 -0700 (PDT)
Received: (nullmailer pid 15741 invoked by uid 1000);
 Mon, 23 Mar 2020 19:41:28 -0000
Date: Mon, 23 Mar 2020 13:41:28 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v1] dt-bindings: display: rockchip: convert rockchip vop
 bindings to yaml
Message-ID: <20200323194128.GD8470@bogus>
References: <20200306170353.11393-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200306170353.11393-1-jbx6244@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 06, 2020 at 06:03:53PM +0100, Johan Jonker wrote:
> Current dts files with 'vop' nodes are manually verified.
> In order to automate this process rockchip-vop.txt
> has to be converted to yaml. Also included are new
> properties needed for the latest Rockchip Socs.
> 
> Added properties:
>   assigned-clocks
>   assigned-clock-rates
>   power-domains
>   rockchip,grf
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../bindings/display/rockchip/rockchip-vop.txt     |  74 -----------
>  .../bindings/display/rockchip/rockchip-vop.yaml    | 141 +++++++++++++++++++++
>  2 files changed, 141 insertions(+), 74 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml


> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
> new file mode 100644
> index 000000000..93ccd32aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
> @@ -0,0 +1,141 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip soc display controller (VOP)
> +
> +description:
> +  VOP (Visual Output Processor) is the Display Controller for the Rockchip
> +  series of SoCs which transfers the image data from a video memory
> +  buffer to an external LCD interface.
> +
> +maintainers:
> +  - Sandy Huang <hjc@rock-chips.com>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: rockchip,px30-vop-big
> +      - const: rockchip,px30-vop-lit
> +      - const: rockchip,rk3036-vop
> +      - const: rockchip,rk3066-vop
> +      - const: rockchip,rk3126-vop
> +      - const: rockchip,rk3188-vop
> +      - const: rockchip,rk3228-vop
> +      - const: rockchip,rk3288-vop
> +      - const: rockchip,rk3328-vop
> +      - const: rockchip,rk3366-vop
> +      - const: rockchip,rk3368-vop
> +      - const: rockchip,rk3399-vop-big
> +      - const: rockchip,rk3399-vop-lit

Use an 'enum' instead of oneOf+const.

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
> +      Should contain a list of all VOP IP block interrupts in the
> +      order VSYNC, LCD_SYSTEM. The interrupt specifier
> +      format depends on the interrupt controller used.

maxItems and the description disagree.

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
> +    minItems: 3
> +    maxItems: 3

Just maxItems is enough.

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
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node for
> +      the general register file (GRF).
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
> +    #include <dt-bindings/interrupt-controller/irq.h>
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
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
