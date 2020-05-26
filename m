Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 267A11AAEC1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 18:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4D56EA37;
	Wed, 15 Apr 2020 16:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0F56EA37
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 16:58:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42A6B2D1;
 Wed, 15 Apr 2020 18:58:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586969931;
 bh=dDCRMO0GaF4F11m8Dy4CmaaUYTeAclyywgcyTHRJM0k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L1ZDKSFAAGYIvOOGf+V7YT5tiA8qYXIqugXk3F1Qc7BkA9FGyn6mGxRIWCH/QNkxI
 8K09u6bLg9IsFvz1+VCUnHyzqt6Amec/AofpozbZ2DExAynnxN5BXc1YFEAZfNUC5X
 mhEsz7HJhjBBatEJFPeayiJG/T/v1U7BgTXMlg0c=
Date: Wed, 15 Apr 2020 19:58:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH v11 1/5] dt-bindings: display: xlnx: Add ZynqMP DP
 subsystem bindings
Message-ID: <20200415165839.GJ4758@pendragon.ideasonboard.com>
References: <20200318153728.25843-1-laurent.pinchart@ideasonboard.com>
 <20200318153728.25843-2-laurent.pinchart@ideasonboard.com>
 <20200318192651.GA28612@ravnborg.org>
 <20200319010857.GC27556@smtp.xilinx.com>
 <20200402031125.GA31187@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200402031125.GA31187@pendragon.ideasonboard.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michal Simek <michals@xilinx.com>,
 Satish Kumar Nagireddy <SATISHNA@xilinx.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hyun,

On Thu, Apr 02, 2020 at 06:11:25AM +0300, Laurent Pinchart wrote:
> On Wed, Mar 18, 2020 at 06:08:57PM -0700, Hyun Kwon wrote:
> > On Wed, 2020-03-18 at 12:26:51 -0700, Sam Ravnborg wrote:
> >> On Wed, Mar 18, 2020 at 05:37:24PM +0200, Laurent Pinchart wrote:
> >>> From: Hyun Kwon <hyun.kwon@xilinx.com>
> >>> 
> >>> The bindings describe the ZynqMP DP subsystem. They don't support the
> >>> interface with the programmable logic (FPGA) or audio yet.
> >>> 
> >>> Signed-off-by: Hyun Kwon <hyun.kwon@xilinx.com>
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> Reviewed-by: Rob Herring <robh@kernel.org>
> >> 
> >> Bikeshedding - examples with indent on 4 spaces to make them easier to
> >> read.
> >> 
> >> Would it be possible to make this binding: (GPL-2.0-only OR BSD-2-Clause)
> >> This is preferred for new bindings.
> >> In this case asking Hyun Kwon should be enough?
> > 
> > It should be possible. But to be safer and if needed, I need to check with
> > corperate policy before I can confirm.
> > 
> > Michal, have you already checked about adding 'OR BSD-2-Clause'? or should I
> > take it up to Xilinx legal?
> 
> Have you been able to get an answer on this ? I though the
> double-license was encouraged for new bindings, but it now seems to be a
> hard requirement to get them merged.

Gentle ping.

> >> With or without the suggestions above:
> >> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> >> 
> >> 	Sam
> >> 
> >>> ---
> >>> Changes since v10:
> >>> 
> >>> - Update example to new PHY DT bindings without subnodes
> >>> - Add resets property
> >>> 
> >>> Changes since v9:
> >>> 
> >>> - Fix constraints on clock-names
> >>> - Document dp_apb_clk as the APB clock, not the AXI clock
> >>> 
> >>> Changes since v8:
> >>> 
> >>> - Convert to yaml
> >>> - Rename aclk to dp_apb_clk
> >>> ---
> >>>  .../display/xlnx/xlnx,zynqmp-dpsub.yaml       | 174 ++++++++++++++++++
> >>>  1 file changed, 174 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> >>> 
> >>> diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> >>> new file mode 100644
> >>> index 000000000000..05e6a14de75c
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> >>> @@ -0,0 +1,174 @@
> >>> +# SPDX-License-Identifier: GPL-2.0
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Xilinx ZynqMP DisplayPort Subsystem
> >>> +
> >>> +description: |
> >>> +  The DisplayPort subsystem of Xilinx ZynqMP (Zynq UltraScale+ MPSoC)
> >>> +  implements the display and audio pipelines based on the DisplayPort v1.2
> >>> +  standard. The subsystem includes multiple functional blocks as below:
> >>> +
> >>> +               +------------------------------------------------------------+
> >>> +  +--------+   | +----------------+     +-----------+                       |
> >>> +  | DPDMA  | --->|                | --> |   Video   | Video +-------------+ |
> >>> +  | 4x vid |   | |                |     | Rendering | -+--> |             | |   +------+
> >>> +  | 2x aud |   | |  Audio/Video   | --> | Pipeline  |  |    | DisplayPort |---> | PHY0 |
> >>> +  +--------+   | | Buffer Manager |     +-----------+  |    |   Source    | |   +------+
> >>> +               | |    and STC     |     +-----------+  |    | Controller  | |   +------+
> >>> +  Live Video --->|                | --> |   Audio   | Audio |             |---> | PHY1 |
> >>> +               | |                |     |   Mixer   | --+-> |             | |   +------+
> >>> +  Live Audio --->|                | --> |           |  ||   +-------------+ |
> >>> +               | +----------------+     +-----------+  ||                   |
> >>> +               +---------------------------------------||-------------------+
> >>> +                                                       vv
> >>> +                                                 Blended Video and
> >>> +                                                 Mixed Audio to PL
> >>> +
> >>> +  The Buffer Manager interacts with external interface such as DMA engines or
> >>> +  live audio/video streams from the programmable logic. The Video Rendering
> >>> +  Pipeline blends the video and graphics layers and performs colorspace
> >>> +  conversion. The Audio Mixer mixes the incoming audio streams. The DisplayPort
> >>> +  Source Controller handles the DisplayPort protocol and connects to external
> >>> +  PHYs.
> >>> +
> >>> +  The subsystem supports 2 video and 2 audio streams, and various pixel formats
> >>> +  and depths up to 4K@30 resolution.
> >>> +
> >>> +  Please refer to "Zynq UltraScale+ Device Technical Reference Manual"
> >>> +  (https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf)
> >>> +  for more details.
> >>> +
> >>> +maintainers:
> >>> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: xlnx,zynqmp-dpsub-1.7
> >>> +
> >>> +  reg:
> >>> +    maxItems: 4
> >>> +  reg-names:
> >>> +    items:
> >>> +      - const: dp
> >>> +      - const: blend
> >>> +      - const: av_buf
> >>> +      - const: aud
> >>> +
> >>> +  interrupts:
> >>> +    maxItems: 1
> >>> +
> >>> +  clocks:
> >>> +    description:
> >>> +      The APB clock and at least one video clock are mandatory, the audio clock
> >>> +      is optional.
> >>> +    minItems: 2
> >>> +    maxItems: 4
> >>> +    items:
> >>> +      - description: dp_apb_clk is the APB clock
> >>> +      - description: dp_aud_clk is the Audio clock
> >>> +      - description:
> >>> +          dp_vtc_pixel_clk_in is the non-live video clock (from Processing
> >>> +          System)
> >>> +      - description:
> >>> +          dp_live_video_in_clk is the live video clock (from Programmable
> >>> +          Logic)
> >>> +  clock-names:
> >>> +    oneOf:
> >>> +      - minItems: 2
> >>> +        maxItems: 3
> >>> +        items:
> >>> +          - const: dp_apb_clk
> >>> +          - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> >>> +          - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> >>> +      - minItems: 3
> >>> +        maxItems: 4
> >>> +        items:
> >>> +          - const: dp_apb_clk
> >>> +          - const: dp_aud_clk
> >>> +          - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> >>> +          - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> >>> +
> >>> +  power-domains:
> >>> +    maxItems: 1
> >>> +
> >>> +  resets:
> >>> +    maxItems: 1
> >>> +
> >>> +  dmas:
> >>> +    maxItems: 4
> >>> +    items:
> >>> +      - description: Video layer, plane 0 (RGB or luma)
> >>> +      - description: Video layer, plane 1 (U/V or U)
> >>> +      - description: Video layer, plane 2 (V)
> >>> +      - description: Graphics layer
> >>> +  dma-names:
> >>> +    items:
> >>> +      - const: vid0
> >>> +      - const: vid1
> >>> +      - const: vid2
> >>> +      - const: gfx0
> >>> +
> >>> +  phys:
> >>> +    description: PHYs for the DP data lanes
> >>> +    minItems: 1
> >>> +    maxItems: 2
> >>> +  phy-names:
> >>> +    minItems: 1
> >>> +    maxItems: 2
> >>> +    items:
> >>> +      - const: dp-phy0
> >>> +      - const: dp-phy1
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - reg-names
> >>> +  - interrupts
> >>> +  - clocks
> >>> +  - clock-names
> >>> +  - power-domains
> >>> +  - resets
> >>> +  - dmas
> >>> +  - dma-names
> >>> +  - phys
> >>> +  - phy-names
> >>> +
> >>> +additionalProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    #include <dt-bindings/phy/phy.h>
> >>> +    #include <dt-bindings/reset/xlnx-zynqmp-resets.h>
> >>> +
> >>> +    display@fd4a0000 {
> >>> +      compatible = "xlnx,zynqmp-dpsub-1.7";
> >>> +      reg = <0x0 0xfd4a0000 0x0 0x1000>,
> >>> +            <0x0 0xfd4aa000 0x0 0x1000>,
> >>> +            <0x0 0xfd4ab000 0x0 0x1000>,
> >>> +            <0x0 0xfd4ac000 0x0 0x1000>;
> >>> +      reg-names = "dp", "blend", "av_buf", "aud";
> >>> +      interrupts = <0 119 4>;
> >>> +      interrupt-parent = <&gic>;
> >>> +
> >>> +      clock-names = "dp_apb_clk", "dp_aud_clk", "dp_live_video_in_clk";
> >>> +      clocks = <&dp_aclk>, <&clkc 17>, <&si570_1>;
> >>> +
> >>> +      power-domains = <&pd_dp>;
> >>> +      resets = <&reset ZYNQMP_RESET_DP>;
> >>> +
> >>> +      dma-names = "vid0", "vid1", "vid2", "gfx0";
> >>> +      dmas = <&xlnx_dpdma 0>,
> >>> +             <&xlnx_dpdma 1>,
> >>> +             <&xlnx_dpdma 2>,
> >>> +             <&xlnx_dpdma 3>;
> >>> +
> >>> +      phys = <&psgtr 1 PHY_TYPE_DP 0 3 27000000>,
> >>> +             <&psgtr 0 PHY_TYPE_DP 1 3 27000000>;
> >>> +
> >>> +      phy-names = "dp-phy0", "dp-phy1";
> >>> +    };
> >>> +
> >>> +...

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
