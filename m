Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8104E17A0EC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 09:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336CC6EB9C;
	Thu,  5 Mar 2020 08:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EB76EB7E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 00:11:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1583367083; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=QnmPx683BtcX2PIuGW+tIyE5RhTZO8cW2qvcPnNtqP0=;
 b=KUM/KXeIYkRHuxxYyZYnQ2v106dpn/T9Q4OnNYCTnmb2Z5AsrCYX+tOM31tvSEW5hUZiOwYP
 NIRdSqxEjE5k2VwxhKYvnQaqzFJl0WOx2fx8x7cKRZvzOawPd9Gro+qANH5RDaoc24QXhAxJ
 EmhyXsgMYkf039iMOSvW8OxrxIM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6043a9.7fc39eb5f730-smtp-out-n03;
 Thu, 05 Mar 2020 00:11:21 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9FAAAC4479D; Thu,  5 Mar 2020 00:11:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from displaysanity13-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: varar)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C5AFDC43383;
 Thu,  5 Mar 2020 00:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C5AFDC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=varar@codeaurora.org
From: Vara Reddy <varar@codeaurora.org>
To: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, seanpaul@chromium.org
Subject: [DPU PATCH v4 1/5] dt-bindings: msm/dp: add bindings of DP/DP-PLL
 driver for Snapdragon
Date: Wed,  4 Mar 2020 16:10:24 -0800
Message-Id: <1583367028-19979-2-git-send-email-varar@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1583367028-19979-1-git-send-email-varar@codeaurora.org>
References: <1583367028-19979-1-git-send-email-varar@codeaurora.org>
X-Mailman-Approved-At: Thu, 05 Mar 2020 08:14:30 +0000
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
Cc: abhinavk@codeaurora.org, hoegsberg@google.com,
 dri-devel@lists.freedesktop.org, Vara Reddy <varar@codeaurora.org>,
 aravindh@codeaurora.org, Chandan Uddaraju <chandanu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chandan Uddaraju <chandanu@codeaurora.org>

Add bindings for Snapdragon DisplayPort and
display-port PLL driver.

Changes in V2:
Provide details about sel-gpio

Changes in V4:
Provide details about max dp lanes
Change the commit text

Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
Signed-off-by: Vara Reddy <varar@codeaurora.org>
---
 .../devicetree/bindings/display/msm/dp.txt         | 252 +++++++++++++++++++++
 .../devicetree/bindings/display/msm/dpu.txt        |  16 +-
 2 files changed, 264 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dp.txt

diff --git a/Documentation/devicetree/bindings/display/msm/dp.txt b/Documentation/devicetree/bindings/display/msm/dp.txt
new file mode 100644
index 0000000..1a4e17f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dp.txt
@@ -0,0 +1,252 @@
+Qualcomm Technologies, Inc.
+DP is the master Display Port device which supports DP host controllers that are compatible with VESA Display Port interface specification.
+DP Controller: Required properties:
+- compatible:           Should be "qcom,dp-display".
+- reg:                  Base address and length of DP hardware's memory mapped regions.
+- cell-index:           Specifies the controller instance.
+- reg-names:            A list of strings that name the list of regs.
+			"dp_ahb" - DP controller memory region.
+			"dp_aux" - DP AUX memory region.
+			"dp_link" - DP link layer memory region.
+			"dp_p0" - DP pixel clock domain memory region.
+			"dp_phy" - DP PHY memory region.
+			"dp_ln_tx0" - USB3 DP PHY combo TX-0 lane memory region.
+			"dp_ln_tx1" - USB3 DP PHY combo TX-1 lane memory region.
+			"dp_mmss_cc" - Display Clock Control memory region.
+			"qfprom_physical" - QFPROM Phys memory region.
+			"dp_pll" - USB3 DP combo PLL memory region.
+			"usb3_dp_com" - USB3 DP PHY combo memory region.
+			"hdcp_physical" - DP HDCP memory region.
+- interrupt-parent	phandle to the interrupt parent device node.
+- interrupts:		The interrupt signal from the DP block.
+- clocks:               Clocks required for Display Port operation. See [1] for details on clock bindings.
+- clock-names:          Names of the clocks corresponding to handles. Following clocks are required:
+			"core_aux_clk", "core_usb_ref_clk_src","core_usb_ref_clk", "core_usb_cfg_ahb_clk",
+			"core_usb_pipe_clk", "ctrl_link_clk", "ctrl_link_iface_clk", "ctrl_crypto_clk",
+			"ctrl_pixel_clk", "pixel_clk_rcg", "pixel_parent".
+- pll-node:		phandle to DP PLL node.
+- vdda-1p2-supply:		phandle to vdda 1.2V regulator node.
+- vdda-0p9-supply:		phandle to vdda 0.9V regulator node.
+- qcom,aux-cfg0-settings:		Specifies the DP AUX configuration 0 settings. The first
+					entry in this array corresponds to the register offset
+					within DP AUX, while the remaining entries indicate the
+					programmable values.
+- qcom,aux-cfg1-settings:		Specifies the DP AUX configuration 1 settings. The first
+					entry in this array corresponds to the register offset
+					within DP AUX, while the remaining entries indicate the
+					programmable values.
+- qcom,aux-cfg2-settings:		Specifies the DP AUX configuration 2 settings. The first
+					entry in this array corresponds to the register offset
+					within DP AUX, while the remaining entries indicate the
+					programmable values.
+- qcom,aux-cfg3-settings:		Specifies the DP AUX configuration 3 settings. The first
+					entry in this array corresponds to the register offset
+					within DP AUX, while the remaining entries indicate the
+					programmable values.
+- qcom,aux-cfg4-settings:		Specifies the DP AUX configuration 4 settings. The first
+					entry in this array corresponds to the register offset
+					within DP AUX, while the remaining entries indicate the
+					programmable values.
+- qcom,aux-cfg5-settings:		Specifies the DP AUX configuration 5 settings. The first
+					entry in this array corresponds to the register offset
+					within DP AUX, while the remaining entries indicate the
+					programmable values.
+- qcom,aux-cfg6-settings:		Specifies the DP AUX configuration 6 settings. The first
+					entry in this array corresponds to the register offset
+					within DP AUX, while the remaining entries indicate the
+					programmable values.
+- qcom,aux-cfg7-settings:		Specifies the DP AUX configuration 7 settings. The first
+					entry in this array corresponds to the register offset
+					within DP AUX, while the remaining entries indicate the
+					programmable values.
+- qcom,aux-cfg8-settings:		Specifies the DP AUX configuration 8 settings. The first
+					entry in this array corresponds to the register offset
+					within DP AUX, while the remaining entries indicate the
+					programmable values.
+- qcom,aux-cfg9-settings:		Specifies the DP AUX configuration 9 settings. The first
+					entry in this array corresponds to the register offset
+					within DP AUX, while the remaining entries indicate the
+					programmable values.
+- qcom,max-pclk-frequency-khz:		An integer specifying the maximum. pixel clock in KHz supported by Display Port.
+- qcom,max-lanes-for-dp:		Maximum number of lanes that can be used for Display port.
+- qcom,<type>-supply-entries:		A node that lists the elements of the supply used by the a particular "type" of DP module. The module "types"
+					can be "core", "ctrl", and "phy". Within the same type,
+					there can be more than one instance of this binding,
+					in which case the entry would be appended with the
+					supply entry index.
+					e.g. qcom,ctrl-supply-entry@0
+					-- qcom,supply-name: name of the supply (vdd/vdda/vddio)
+					-- qcom,supply-min-voltage: minimum voltage level (uV)
+					-- qcom,supply-max-voltage: maximum voltage level (uV)
+					-- qcom,supply-enable-load: load drawn (uA) from enabled supply
+					-- qcom,supply-disable-load: load drawn (uA) from disabled supply
+					-- qcom,supply-pre-on-sleep: time to sleep (ms) before turning on
+					-- qcom,supply-post-on-sleep: time to sleep (ms) after turning on
+					-- qcom,supply-pre-off-sleep: time to sleep (ms) before turning off
+					-- qcom,supply-post-off-sleep: time to sleep (ms) after turning off
+- pinctrl-names:	List of names to assign mdss pin states defined in pinctrl device node
+					Refer to pinctrl-bindings.txt
+- pinctrl-<0..n>:	Lists phandles each pointing to the pin configuration node within a pin
+					controller. These pin configurations are installed in the pinctrl
+					device node. Refer to pinctrl-bindings.txt
+DP Endpoint properties:
+  - remote-endpoint: For port@0, set to phandle of the connected panel/bridge's
+    input endpoint. For port@1, set to the DPU interface output. See [2] for
+    device graph info.
+
+Optional properties:
+- qcom,aux-en-gpio:		Specifies the aux-channel enable gpio.
+- qcom,aux-sel-gpio:		Specifies the mux-selection that might be needed for aux interface.
+
+
+DP PLL: Required properties:
+- compatible:           Should be "qcom,dp-pll-10nm".
+- reg:                  Base address and length of DP hardware's memory mapped regions.
+- cell-index:           Specifies the PLL instance.
+- reg-names:            A list of strings that name the list of regs.
+			"pll_base" - DP PLL memory region.
+			"phy_base" - DP PHY memory region.
+			"ln_tx0_base" - USB3 DP PHY combo TX-0 lane memory region.
+			"ln_tx1_base" - USB3 DP PHY combo TX-1 lane memory region.
+			"gdsc_base" - gdsc memory region.
+- interrupt-parent	phandle to the interrupt parent device node.
+- interrupts:		The interrupt signal from the DP block.
+- clocks:               Clocks required for Display Port operation. See [1] for details on clock bindings.
+- clock-names:          Names of the clocks corresponding to handles. Following clocks are required:
+			"iface_clk", "ref_clk", cfg_ahb_clk", "pipe_clk".
+- clock-rate:           Initial clock rate to be configured. For the shared clocks, the default value			     is set to zero so that minimum clock value is configured. Non-zero clock
+			value can be used to configure DP pixel clock.
+
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+[2] Documentation/devicetree/bindings/graph.txt
+
+Example:
+	msm_dp: dp_display@ae90000{
+		cell-index = <0>;
+		compatible = "qcom,dp-display";
+
+		reg =   <0 0x90000 0x0dc>,
+			<0 0x90200 0x0c0>,
+			<0 0x90400 0x508>,
+			<0 0x90a00 0x094>,
+			<1 0xeaa00 0x200>,
+			<1 0xea200 0x200>,
+			<1 0xea600 0x200>,
+			<2 0x02000 0x1a0>,
+			<3 0x00000 0x621c>,
+			<1 0xea000 0x180>,
+			<1 0xe8000 0x20>,
+			<4 0xe1000 0x034>;
+		reg-names = "dp_ahb", "dp_aux", "dp_link",
+			"dp_p0", "dp_phy", "dp_ln_tx0", "dp_ln_tx1",
+			"dp_mmss_cc", "qfprom_physical", "dp_pll",
+			"usb3_dp_com", "hdcp_physical";
+
+		interrupt-parent = <&display_subsystem>;
+		interrupts = <12 0>;
+
+		extcon = <&usb_1_ssphy>;
+		clocks =  <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+			<&rpmhcc RPMH_CXO_CLK>,
+			<&gcc GCC_USB3_PRIM_CLKREF_CLK>,
+			<&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+			<&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>,
+			<&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+			<&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+			<&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
+			<&dispcc DISP_CC_MDSS_DP_CRYPTO_CLK>,
+			<&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+		clock-names = "core_aux_clk", "core_ref_clk_src",
+			"core_usb_ref_clk", "core_usb_cfg_ahb_clk",
+			"core_usb_pipe_clk", "ctrl_link_clk",
+			"ctrl_link_iface_clk", "ctrl_pixel_clk",
+			"crypto_clk", "pixel_clk_rcg";
+
+		pll-node = <&dp_pll>;
+		vdda-1p2-supply = <&vreg_l3c_1p2>;
+		vdda-0p9-supply = <&vreg_l4a_0p8>;
+		qcom,aux-cfg0-settings = [20 00];
+		qcom,aux-cfg1-settings = [24 13 23 1d];
+		qcom,aux-cfg2-settings = [28 24];
+		qcom,aux-cfg3-settings = [2c 00];
+		qcom,aux-cfg4-settings = [30 0a];
+		qcom,aux-cfg5-settings = [34 26];
+		qcom,aux-cfg6-settings = [38 0a];
+		qcom,aux-cfg7-settings = [3c 03];
+		qcom,aux-cfg8-settings = [40 bb];
+		qcom,aux-cfg9-settings = [44 03];
+
+		qcom,max-pclk-frequency-khz = <675000>;
+		qcom,max-lanes-for-dp = <2>;
+
+		qcom,ctrl-supply-entries {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			qcom,ctrl-supply-entry@0 {
+				reg = <0>;
+				qcom,supply-name = "vdda-1p2";
+				qcom,supply-min-voltage = <1200000>;
+				qcom,supply-max-voltage = <1200000>;
+				qcom,supply-enable-load = <21800>;
+				qcom,supply-disable-load = <4>;
+			};
+		};
+
+		qcom,phy-supply-entries {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			qcom,phy-supply-entry@0 {
+				reg = <0>;
+				qcom,supply-name = "vdda-0p9";
+				qcom,supply-min-voltage = <880000>;
+				qcom,supply-max-voltage = <880000>;
+				qcom,supply-enable-load = <36000>;
+				qcom,supply-disable-load = <32>;
+			};
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dp_in: endpoint {
+					remote-endpoint = <&dpu_intf0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dp_out: endpoint {
+				};
+			};
+		};
+	};
+
+	dp_pll: dp-pll@c011000 {
+		compatible = "qcom,dp-pll-10nm";
+		label = "DP PLL";
+		cell-index = <0>;
+		#clock-cells = <1>;
+
+		reg = <1 0xea000 0x200>,
+		      <1 0xeaa00 0x200>,
+		      <1 0xea200 0x200>,
+		      <1 0xea600 0x200>,
+		      <2 0x03000 0x8>;
+		reg-names = "pll_base", "phy_base", "ln_tx0_base",
+			"ln_tx1_base", "gdsc_base";
+
+		clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+			 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
+			 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+			 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+		clock-names = "iface_clk", "ref_clk",
+			"cfg_ahb_clk", "pipe_clk";
+		clock-rate = <0>;
+
+	};
diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
index 551ae26..7e99e45 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
@@ -63,8 +63,9 @@ Required properties:
 	Documentation/devicetree/bindings/graph.txt
 	Documentation/devicetree/bindings/media/video-interfaces.txt
 
-	Port 0 -> DPU_INTF1 (DSI1)
-	Port 1 -> DPU_INTF2 (DSI2)
+	Port 0 -> DPU_INTF0 (DP)
+	Port 1 -> DPU_INTF1 (DSI1)
+	Port 2 -> DPU_INTF2 (DSI2)
 
 Optional properties:
 - assigned-clocks: list of clock specifiers for clocks needing rate assignment
@@ -125,13 +126,20 @@ Example:
 
 				port@0 {
 					reg = <0>;
-					dpu_intf1_out: endpoint {
-						remote-endpoint = <&dsi0_in>;
+					dpu_intf0_out: endpoint {
+						remote-endpoint = <&dp_in>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
+					dpu_intf1_out: endpoint {
+						remote-endpoint = <&dsi0_in>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
 					dpu_intf2_out: endpoint {
 						remote-endpoint = <&dsi1_in>;
 					};
-- 
$(echo -e 'The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project')
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
