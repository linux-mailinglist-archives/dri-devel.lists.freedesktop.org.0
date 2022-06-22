Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8E3556DA6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 23:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6155D10E1A5;
	Wed, 22 Jun 2022 21:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872DF10E1A5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 21:07:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7557BDD;
 Wed, 22 Jun 2022 23:07:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1655932035;
 bh=hlTDQWFzV4JSxpRbykgQQwJUvt43T8XrutUdxr4Yt1g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hot08ZXuPwC6POLdDYIB93/0Tm8W/KjlW6qwXGl1lhCuYJ/Q3j4upD9yxYThyLK6i
 DSlOsrlB9ACOdG6qEgQG8NsHR/gBnc3GQ5MwbCxqIfN0VGUhTnKWzHdvgtvHXDiBW8
 k01ia0ztHuHiIdkUCh0WhnG6zFsqPwINuZZgIctQ=
Date: Thu, 23 Jun 2022 00:06:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: display: xlnx: Add DSI 2.0 Tx
 subsystem documentation
Message-ID: <YrOEc/K3BqT9F8Ye@pendragon.ideasonboard.com>
References: <1655389056-37044-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <1655389056-37044-2-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1655389056-37044-2-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, vgannava@xilinx.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi GVRao,

Thank you for the patch.

On Thu, Jun 16, 2022 at 07:47:35PM +0530, Venkateshwar Rao Gannavarapu wrote:
> This patch adds dt binding for Xilinx DSI-TX subsystem.
> 
> The Xilinx MIPI DSI (Display serial interface) Transmitter Subsystem
> implements the Mobile Industry Processor Interface (MIPI) based display
> interface. It supports the interface with the programmable logic (FPGA).
> 
> Signed-off-by: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
> ---
>  .../bindings/display/xlnx/xlnx,dsi-tx.yaml         | 101 +++++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,dsi-tx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi-tx.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi-tx.yaml
> new file mode 100644
> index 0000000..644934d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi-tx.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/xlnx/xlnx,dsi-tx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx DSI Transmitter subsystem Device Tree Bindings
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
> +    items:
> +      - description: AXI Lite CPU clock
> +      - description: D-PHY clock
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
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          This port should be the input endpoint.

Port and endpoint are two different things. You can just write "Input
port of the DSI encoder".

> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          This port should be the output endpoint.

And here, "Output port of the DSI encoder".

> +
> +required:
> +  - "#address-cells"
> +  - "#size-cells"

I think those should be listed in the properties above, with fixed
values.

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
> +    dsi0: dsi_tx@80020000 {
> +        compatible = "xlnx,dsi-tx-v2.0";
> +        reg = <0x80020000 0x20000>;
> +        clocks = <&misc_clk_0>, <&misc_clk_1>;
> +        clock-names = "s_axis_aclk", "dphy_clk_200M";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ports {
> +              #address-cells = <1>;
> +              #size-cells = <0>;
> +
> +              port@0 {
> +                    reg = <0>;
> +                    mipi_dsi_in: endpoint {
> +                        remote-endpoint = <&pl_disp>;
> +                    };
> +              };
> +
> +              port@1 {
> +                    reg = <1>;
> +                    mipi_dsi_out: endpoint {
> +                        remote-endpoint = <&panel_in>;
> +                    };
> +              };
> +        };
> +
> +        panel@0 {
> +              compatible = "auo,b101uan01";
> +              reg = <0>;
> +              port {
> +                    panel_in: endpoint {
> +                        remote-endpoint = <&mipi_dsi_out>;
> +                    };
> +              };
> +        };

Does this example validate (with `make dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/xlnx/xlnx,dsi-tx.yaml`)
without listing the panel node in the properties ?

> +    };
> +
> +...

-- 
Regards,

Laurent Pinchart
