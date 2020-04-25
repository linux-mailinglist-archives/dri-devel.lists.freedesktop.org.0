Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B10AF1B895C
	for <lists+dri-devel@lfdr.de>; Sat, 25 Apr 2020 22:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91EF89F41;
	Sat, 25 Apr 2020 20:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9337A89F41
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Apr 2020 20:29:24 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 83A22804BE;
 Sat, 25 Apr 2020 22:29:21 +0200 (CEST)
Date: Sat, 25 Apr 2020 22:29:19 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: display: xlnx: Add Xilinx DSI TX
 subsystem bindings
Message-ID: <20200425202919.GA18024@ravnborg.org>
References: <1587417656-48078-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <1587417656-48078-2-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587417656-48078-2-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=Am4ss40yAAAA:8 a=e5mUnYsNAAAA:8
 a=Xm7NPBnI88oGpJyOjkkA:9 a=pzKxttIwnFwYilsU:21 a=ariiaaN-ea5_aa7Y:21
 a=CjuIK1q_8ugA:10 a=lf-hbUz_c89dky27wAWH:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: sandipk@xilinx.com, hyun.kwon@xilinx.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 vgannava@xilinx.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Venkateshwar

On Tue, Apr 21, 2020 at 02:50:55AM +0530, Venkateshwar Rao Gannavarapu wrote:
> This add a dt binding for Xilinx DSI TX subsystem.
> 
> The Xilinx MIPI DSI (Display serial interface) Transmitter Subsystem
> implements the Mobile Industry Processor Interface (MIPI) based display
> interface. It supports the interface with the programmable logic (FPGA).
> 
> Signed-off-by: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
> ---
>  .../devicetree/bindings/display/xlnx/xlnx,dsi.txt  | 68 ++++++++++++++++++++++

Sorry, but new bindings in DT Schema format (.yaml) please.
We are working on migrating all bindings to DT Schema and do not want
to add new bindings in the old format.


>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.txt b/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.txt
> new file mode 100644
> index 0000000..ef69729
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.txt
> @@ -0,0 +1,68 @@
> +Device-Tree bindings for Xilinx MIPI DSI Tx IP core
> +
> +The IP core supports transmission of video data in MIPI DSI protocol.
> +
> +Required properties:
> + - compatible: Should be "xlnx-dsi".
> + - reg: physical base address and length of the registers set for the device.
> + - xlnx,dsi-num-lanes: Possible number of DSI lanes for the Tx controller.
> +   The values should be 1, 2, 3 or 4. Based on xlnx,dsi-num-lanes and
> +   line rate for the MIPI D-PHY core in Mbps, the AXI4-stream received by
> +   Xilinx MIPI DSI Tx IP core adds markers as per DSI protocol and the packet
> +   thus framed is convered to serial data by MIPI D-PHY core. Please refer
> +   Xilinx pg238 for more details. This value should be equal to the number
> +   of lanes supported by the connected DSI panel. Panel has to support this
> +   value or has to be programmed to the same value that DSI Tx controller is
> +   configured to.
> + - xlnx,dsi-datatype: Color format. The value should be one of "MIPI_DSI_FMT_RGB888",
> +  "MIPI_DSI_FMT_RGB666", "MIPI_DSI_FMT_RGB666_PACKED" or "MIPI_DSI_FMT_RGB565".
> + - #address-cells, #size-cells: should be set respectively to <1> and <0>
> +   according to DSI host bindings (see MIPI DSI bindings [1])
> + - clock-names: Must contain "s_axis_aclk" and "dphy_clk_200M" in same order as
> +   clocks listed in clocks property.
> + - clocks: List of phandles to Video and 200Mhz DPHY clocks.
> + - port: Logical block can be used / connected independently with
> +   external device. In the display controller port nodes, topology
> +   for entire pipeline should be described using the DT bindings defined in
> +   Documentation/devicetree/bindings/graph.txt.

> + - simple_panel: The subnode for connected panel. This represents the
> +   DSI peripheral connected to the DSI host node. Please refer to
> +   Documentation/devicetree/bindings/display/mipi-dsi-bus.txt. The
> +   simple-panel driver has auo,b101uan01 panel timing parameters added along
> +   with other existing panels. DSI driver derive the required Tx IP controller
> +   timing values from the panel timing parameters.A
Please always use either a port or a ports node.

	Sam

> +
> +Required simple_panel properties:
> + - compatible: Value should be one of the panel names in
> +   Documentation/devicetree/bindings/display/panel/. e.g. "auo,b101uan01".
> +   For available panel compatible strings, please refer to bindings in
> +   Documentation/devicetree/bindings/display/panel/
> +
> +Optional properties:
> + - xlnx,dsi-cmd-mode: denotes command mode enable.
> +
> +[1]: Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
> +[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +Example:
> +
> +       mipi_dsi_tx_subsystem@80000000 {
> +               compatible = "xlnx,dsi";
> +               reg = <0x0 0x80000000 0x0 0x10000>;
> +               xlnx,dsi-num-lanes = <4>;
> +               xlnx,dsi-data-type = <MIPI_DSI_FMT_RGB888>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               clock-names = "dphy_clk_200M", "s_axis_aclk";
> +               clocks = <&misc_clk_0>, <&misc_clk_1>;
> +               encoder_dsi_port: port@0 {
> +                       reg = <0>;
> +                       dsi_encoder: endpoint {
> +                               remote-endpoint = <&xdsi_ep>;
> +                       };
> +               };
> +               simple_panel: simple-panel@0 {
> +                       compatible = "auo,b101uan01";
> +                       reg = <0>;
> +                       };
> +               };
> --
> 2.7.4
> 
> This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
