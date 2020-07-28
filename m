Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98197231442
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 22:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C476E3F9;
	Tue, 28 Jul 2020 20:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6946E3FE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 20:52:01 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id CC35920039;
 Tue, 28 Jul 2020 22:51:58 +0200 (CEST)
Date: Tue, 28 Jul 2020 22:51:57 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH RFC v6 3/6] dt-bindings: display: add Unisoc's dpu bindings
Message-ID: <20200728205157.GD1277651@ravnborg.org>
References: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
 <1595930879-2478-4-git-send-email-kevin3.tang@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595930879-2478-4-git-send-email-kevin3.tang@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=icsG72s9AAAA:8 a=pGLkceISAAAA:8 a=gEfo2CItAAAA:8
 a=7CQSdrXTAAAA:8 a=e5mUnYsNAAAA:8 a=nf-ICS-ZoSeXndDHOMUA:9
 a=HAnh4mGoJf9lCd-b:21 a=3GzCVPTGihwzIhyW:21 a=CjuIK1q_8ugA:10
 a=T89tl0cgrjxRNoSN2Dv0:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: mark.rutland@arm.com, airlied@linux.ie, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, orsonzhai@gmail.com, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin.

On Tue, Jul 28, 2020 at 06:07:56PM +0800, Kevin Tang wrote:
> From: Kevin Tang <kevin.tang@unisoc.com>
> 
> DPU (Display Processor Unit) is the Display Controller for the Unisoc SoCs
> which transfers the image data from a video memory buffer to an internal
> LCD interface.
> 
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> ---
>  .../devicetree/bindings/display/sprd/dpu.yaml      | 82 ++++++++++++++++++++++

Could we name it after the compatible "sharkl3-dpu.yaml"?

>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/dpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/sprd/dpu.yaml b/Documentation/devicetree/bindings/display/sprd/dpu.yaml
> new file mode 100644
> index 0000000..54ba9b6f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sprd/dpu.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: GPL-2.0
Can this be: (GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/sprd/dpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Unisoc SoC Display Processor Unit (DPU)
> +
> +maintainers:
> +  - Mark Rutland <mark.rutland@arm.com>
> +
> +description: |
> +  DPU (Display Processor Unit) is the Display Controller for the Unisoc SoCs
> +  which transfers the image data from a video memory buffer to an internal
> +  LCD interface.
> +
> +properties:
> +  compatible:
> +    const: sprd,sharkl3-dpu
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Physical base address and length of the DPU registers set
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      The interrupt signal from DPU
> +
> +  clocks:
> +    minItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: clk_src_128m
> +      - const: clk_src_384m
> +
> +  power-domains:
> +    description: A phandle to DPU power domain node.
maxItems: 1

> +
> +  iommus:
> +    description: A phandle to DPU iommu node.
maxItems: 1

> +
> +  port:
> +    type: object
> +    description:
> +      A port node with endpoint definitions as defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +      That port should be the output endpoint, usually output to
> +      the associated DSI.
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
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/sprd,sc9860-clk.h>
> +    dpu: dpu@0x63000000 {
> +          compatible = "sprd,sharkl3-dpu";
> +          reg = <0x0 0x63000000 0x0 0x1000>;
> +          interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +          clock-names = "clk_src_128m",
> +      	        "clk_src_384m";
> +
> +          clocks = <&pll CLK_TWPLL_128M>,
> +                <&pll CLK_TWPLL_384M>;
> +
> +          dpu_port: port {
> +                  dpu_out: endpoint {
> +                          remote-endpoint = <&dsi_in>;
> +                  };
> +          };
> +    };

Be consistent in indent. Now it is a mix of 6 and 8 spaces.
(My preference is 4 spaces, but 2,4,6,8 are all OK)

End the file with and end statement like this:
<empty line>
...

> -- 
> 2.7.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
