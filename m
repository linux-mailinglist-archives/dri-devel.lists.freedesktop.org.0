Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E4B16896C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319966F586;
	Fri, 21 Feb 2020 21:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F006F586
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:39:25 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 143568051B;
 Fri, 21 Feb 2020 22:39:23 +0100 (CET)
Date: Fri, 21 Feb 2020 22:39:21 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH RFC v3 3/6] dt-bindings: display: add Unisoc's dpu bindings
Message-ID: <20200221213921.GE3456@ravnborg.org>
References: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
 <1582271336-3708-4-git-send-email-kevin3.tang@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1582271336-3708-4-git-send-email-kevin3.tang@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=icsG72s9AAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=SVALNYV8_nJ9B2TJSLgA:9 a=50L6mq_XB6Qepsfu:21
 a=HXsGJvFog89IkJYu:21 a=CjuIK1q_8ugA:10 a=T89tl0cgrjxRNoSN2Dv0:22
 a=cvBusfyB2V15izCimMoJ:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=AjGcO6oz07-iQ99wixmX:22 a=a-qgeE7W1pNrGK8U0ZQC:22
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
Cc: mark.rutland@arm.com, baolin.wang@linaro.org, airlied@linux.ie,
 zhang.lyra@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, orsonzhai@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin.

On Fri, Feb 21, 2020 at 03:48:53PM +0800, Kevin Tang wrote:
> From: Kevin Tang <kevin.tang@unisoc.com>
> 
> DPU (Display Processor Unit) is the Display Controller for the Unisoc SoCs
> which transfers the image data from a video memory buffer to an internal
> LCD interface.
> 
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> ---
>  .../devicetree/bindings/display/sprd/dpu.yaml      | 85 ++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/dpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/sprd/dpu.yaml b/Documentation/devicetree/bindings/display/sprd/dpu.yaml
> new file mode 100644
> index 0000000..7695d94
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sprd/dpu.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/sprd/dpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Unisoc SoC Display Processor Unit (DPU)
> +
> +maintainers:
> +  - David Airlie <airlied@linux.ie>
> +  - Daniel Vetter <daniel@ffwll.ch>
> +  - Rob Herring <robh+dt@kernel.org>
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
Should this be maxItems: 2?
That would imply minItems: 2.


> +
> +  clock-names:
> +    items:
> +      - const: clk_src_128m
> +      - const: clk_src_384m
> +
> +  power-domains:
> +    description: A phandle to DPU power domain node.
> +
> +  iommus:
> +    description: A phandle to DPU iommu node.
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
Did this example pass dt_binding_check with no warnings?
I wonder how the reg property could avoid generating warnings as the
upper node do not have #address_cells, #node_cells

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
