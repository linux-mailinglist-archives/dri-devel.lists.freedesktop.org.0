Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C92526303
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 15:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D1C10F4F5;
	Fri, 13 May 2022 13:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9173310F4F5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 13:39:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-5-213-nat.elisa-mobile.fi
 [85.76.5.213])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C78C959D;
 Fri, 13 May 2022 15:39:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1652449184;
 bh=8/jJDujU6QyrSi/47Vo1bf+z4+ljqIkNHAMhhxf4vkY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i1nSdsuqrEcfUCKfR5DGq4mA9vssQVDeApG7aBRalDAmZPZU1YgztKy/6mmHPnhdi
 56KF0ozHPcm8Iy+dDcxFh9LnFZe9bIX08TivUaD6hS18hYnlQ6YqwrQi7wqEwhQgSc
 WJmKpJs5ivJMWhYwmnJ3/OTzIkiNMwkXtIbrBPvA=
Date: Fri, 13 May 2022 16:39:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
Subject: Re: [LINUX PATCH 1/2] dt-bindings: display: xlnx: Add DSI 2.0 Tx
 subsystem documentation
Message-ID: <Yn5fjds2ATeK0J9b@pendragon.ideasonboard.com>
References: <1652363593-45799-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <1652363593-45799-2-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1652363593-45799-2-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
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
Cc: airlied@linux.ie, vgannava@xilinx.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi GVRao,

Thank you for the patch.

On Thu, May 12, 2022 at 07:23:12PM +0530, Venkateshwar Rao Gannavarapu wrote:
> This patch adds dt binding for Xilinx DSI TX subsystem.
> 
> The Xilinx MIPI DSI (Display serial interface) Transmitter Subsystem
> implements the Mobile Industry Processor Interface (MIPI) based display
> interface. It supports the interface with the programmable logic (FPGA).
> 
> Signed-off-by: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
> ---
>  .../bindings/display/xlnx/xlnx,dsi-tx.yaml         | 105 +++++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,dsi-tx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi-tx.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi-tx.yaml
> new file mode 100644
> index 0000000..8e23cf5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi-tx.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/xlnx/xlnx,dsi-tx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx DSI Transmitter subsystem
> +
> +maintainers:
> +  - Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
> +
> +description: |
> +  The Xilinx DSI Transmitter Subsystem implements the Mobile Industry
> +  Processor Interface based display interface. It supports the interface
> +  with the programmable logic (FPGA).
> +
> +  For more details refer to PG238 Xilinx MIPI DSI-V2.0 Tx Subsystem.
> +
> +properties:
> +  compatible:
> +    const: xlnx,dsi-tx-v2.0
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: List of clock specifiers

You can drop the description, clocks is always a list of clock
specifiers.

> +    items:
> +      - description: AXI Lite CPU clock
> +      - description: D-phy clock

s/D-phy/D-PHY/

> +
> +  clock-names:
> +    items:
> +      - const: s_axis_aclk
> +      - const: dphy_clk_200M
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description:
> +          Input port node to receive pixel data from the
> +          display controller. Exactly one endpoint must be
> +          specified.
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +            description: sub-node describing the input from CRTC

"CRTC" is a DRM term, and DT bindings should document the hardware, not
the driver. I'd drop the endpoint description as I don't think it brings
much, and use /schemas/graph.yaml#/properties/port instead of port-base.

> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          DSI output port node to the panel or the next bridge
> +          in the chain

Same ere about "bridge". Maybe just

        description:
          Output port node to DSI device.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dsi_tx@80020000 {
> +        compatible = "xlnx,dsi-tx-v2.0";
> +        reg = <0x80020000 0x20000>;
> +        clock-names = "s_axi_aclk", "dphy_clk_200M";

Wrong clock name.

> +        clocks = <&misc_clk_0>, <&misc_clk_1>;

You need #address-cells = <1> and #size-cells = <0> here to specify an
address for the panel.

This should have been caught by the schema validation. Please see
Documentation/devicetree/bindings/writing-schema.rst for instructions on
how to validate bindings.

> +
> +        panel@0 {

This will also fail to validate. You need to reference
dsi-controller.yaml. You can check the other bindings for DSI controller
for examples.

> +                compatible = "auo,b101uan01";
> +                reg = <0>;
> +                port {
> +                        panel_in: endpoint {
> +                                remote-endpoint = <&mipi_dsi_out>;
> +                        };
> +                };
> +        };
> +
> +        ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                        #size-cells = <0>;
> +                        #address-cells = <1>;
> +                        reg = <0>;
> +                        mipi_dsi_in: endpoint@0 {
> +                                reg = <0>;

With a single endpoint you can drop the reg as well as the @0, and the
size and address cells in the parent.

> +                                remote-endpoint = <&pl_disp_crtc>;
> +                        };
> +                };
> +                port@1 {
> +                        reg = <1>;
> +                        mipi_dsi_out: endpoint {
> +                                remote-endpoint = <&panel_in>;
> +                        };
> +                };
> +        };
> +    };

-- 
Regards,

Laurent Pinchart
