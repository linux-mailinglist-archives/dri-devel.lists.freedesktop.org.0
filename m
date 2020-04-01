Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AA319A2DC
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 02:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC6189E14;
	Wed,  1 Apr 2020 00:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC47189D3E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 00:31:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585701090; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=XwM6/VxbjB2bBUxJacWsaOY1tPxf7f4osqNmZwIygNU=;
 b=a/bScyWrGpsL6Dvqx7+gOI9EMAEReTgIDIoA8GJ87CeOHFoX51I033VAgXXxwYFF/Jph5P0v
 S0MhWoPtkBgiSDzW0n5CYC3OmvsrGVQlZDZ9Vakcq47oS7RJYguHQAnj73ew9Le/Orwx0+Va
 2HxpllBEPAGz9SlTMtmIOieN0LQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e83e0d3.7fba2da56848-smtp-out-n05;
 Wed, 01 Apr 2020 00:31:15 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8B74FC43637; Wed,  1 Apr 2020 00:31:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from displaysanity13-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: varar)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B203CC433D2;
 Wed,  1 Apr 2020 00:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B203CC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=tanmay@codeaurora.org
From: Tanmay Shah <tanmay@codeaurora.org>
To: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, seanpaul@chromium.org, swboyd@chromium.org
Subject: [DPU PATCH v5 1/5] dt-bindings: msm/dp: add bindings of DP/DP-PLL
 driver for Snapdragon
Date: Tue, 31 Mar 2020 17:30:27 -0700
Message-Id: <1585701031-28871-2-git-send-email-tanmay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1585701031-28871-1-git-send-email-tanmay@codeaurora.org>
References: <1585701031-28871-1-git-send-email-tanmay@codeaurora.org>
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
 aravindh@codeaurora.org, linux-clk@vger.kernel.org,
 Chandan Uddaraju <chandanu@codeaurora.org>
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

Changes in V5:
Moved dp.txt to yaml file.

Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
Signed-off-by: Vara Reddy <varar@codeaurora.org>
---
 .../devicetree/bindings/display/msm/dp-sc7180.yaml | 325 +++++++++++++++++++++
 .../devicetree/bindings/display/msm/dpu.txt        |  16 +-
 2 files changed, 337 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
new file mode 100644
index 0000000..761a01d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
@@ -0,0 +1,325 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dp-sc7180.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display Port dt properties.
+
+maintainers:
+  - Chandan Uddaraju <chandanu@codeaurora.org>
+  - Vara Reddy <varar@codeaurora.org>
+
+description: |
+  Device tree bindings for MSM Display Port which supports DP host controllers
+  that are compatible with VESA Display Port interface specification.
+
+properties:
+  "msm_dp":
+    type: object
+    description: |
+      Node containing Display port register address bases, clocks, power supplies.
+
+    properties:
+     compatible:
+       items:
+         - const: qcom,dp-display
+
+     cell-index:
+       description: Specifies the controller instance.
+
+     reg:
+       description: Physical base address and length of controller's registers.
+
+     reg-names:
+       description: |
+         Names for different register regions defined above. The required region
+         is mentioned below.
+       items:
+         - const: dp_ahb
+         - const: dp_aux
+         - const: dp_link
+         - const: dp_p0
+         - const: dp_phy
+         - const: dp_ln_tx0
+         - const: dp_ln_tx1
+         - const: afprom_physical
+         - const: dp_pll
+         - const: usb3_dp_com
+         - const: hdcp_physical
+
+     interrupts:
+       description: The interrupt signal from the DP block.
+
+     clocks:
+       description: List of clock specifiers for clocks needed by the device.
+
+     clock-names:
+       description: |
+         Device clock names in the same order as mentioned in clocks property.
+         The required clocks are mentioned below.
+       items:
+         - const: core_aux_clk
+         - const: core_ref_clk_src
+         - const: core_usb_ref_clk
+         - const: core_usb_cfg_ahb_clk
+         - const: core_usb_pipe_clk
+         - const: ctrl_link_clk
+         - const: ctrl_link_iface_clk
+         - const: ctrl_pixel_clk
+         - const: crypto_clk
+         - const: pixel_clk_rcg
+
+     pll-node:
+       description: phandle to DP PLL node.
+
+     vdda-1p2-supply:
+       description: phandle to vdda 1.2V regulator node.
+
+     vdda-0p9-supply:
+       description: phandle to vdda 0.9V regulator node.
+
+     aux-cfg0-settings:
+       description: |
+         Specifies the DP AUX configuration 0 settings.
+         The first entry in this array corresponds to the register offset
+         within DP AUX, while the remaining entries indicate the
+         programmable values.
+
+     aux-cfg1-settings:
+       description: |
+         Specifies the DP AUX configuration 1 settings.
+         The first entry in this array corresponds to the register offset
+         within DP AUX, while the remaining entries indicate the
+         programmable values.
+
+     aux-cfg2-settings:
+       description: |
+         Specifies the DP AUX configuration 2 settings.
+         The first entry in this array corresponds to the register offset
+         within DP AUX, while the remaining entries indicate the
+         programmable values.
+
+     aux-cfg3-settings:
+       description: |
+         Specifies the DP AUX configuration 3 settings.
+         The first entry in this array corresponds to the register offset
+         within DP AUX, while the remaining entries indicate the
+         programmable values.
+
+     aux-cfg4-settings:
+       description: |
+         Specifies the DP AUX configuration 4 settings.
+         The first entry in this array corresponds to the register offset
+         within DP AUX, while the remaining entries indicate the
+         programmable values.
+
+     aux-cfg5-settings:
+       description: |
+         Specifies the DP AUX configuration 5 settings.
+         The first entry in this array corresponds to the register offset
+         within DP AUX, while the remaining entries indicate the
+         programmable values.
+
+     aux-cfg6-settings:
+       description: |
+         Specifies the DP AUX configuration 6 settings.
+         The first entry in this array corresponds to the register offset
+         within DP AUX, while the remaining entries indicate the
+         programmable values.
+
+     aux-cfg7-settings:
+       description: |
+         Specifies the DP AUX configuration 7 settings.
+         The first entry in this array corresponds to the register offset
+         within DP AUX, while the remaining entries indicate the
+         programmable values.
+
+     aux-cfg8-settings:
+       description: |
+         Specifies the DP AUX configuration 8 settings.
+         The first entry in this array corresponds to the register offset
+         within DP AUX, while the remaining entries indicate the
+         programmable values.
+
+     aux-cfg9-settings:
+       description: |
+         Specifies the DP AUX configuration 9 settings.
+         The first entry in this array corresponds to the register offset
+         within DP AUX, while the remaining entries indicate the
+         programmable values.
+
+     max-pclk-frequency-khz:
+       description: Maximum displayport pixel clock supported for the chipset.
+
+     data-lanes:
+       description: Maximum number of lanes that can be used for Display port.
+
+     usbplug-cc-gpio:
+       maxItems: 1
+       description: Specifies the usbplug orientation gpio.
+
+     aux-en-gpio:
+       maxItems: 1
+       description: Specifies the aux-channel enable gpio.
+
+     aux-sel-gpio:
+       maxItems: 1
+       description: Specifies the sux-channel select gpio.
+
+     ports:
+       description: |
+         Contains display port controller endpoint subnode.
+         remote-endpoint: |
+           For port@0, set to phandle of the connected panel/bridge's
+           input endpoint. For port@1, set to the DPU interface output.
+           Documentation/devicetree/bindings/graph.txt and
+           Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+  "dp_pll":
+     type: object
+     description: Node contains properties of Display port pll and phy driver.
+
+     properties:
+       compatible:
+         items:
+           - const: qcom,dp-pll-10nm
+
+       cell-index:
+         description: Specifies the controller instance.
+
+       reg:
+         description: Physical base address and length of DP phy and pll registers.
+
+       reg-names:
+         description: |
+           Names for different register regions defined above. The required region
+           is mentioned below.
+         items:
+           - const: pll_base
+           - const: phy_base
+           - const: ln_tx0_base
+           - const: ln_tx1_base
+           - const: gdsc_base
+
+       clocks:
+         description: List of clock specifiers for clocks needed by the device.
+
+       clock-names:
+         description: |
+           Device clock names in the same order as mentioned in clocks property.
+           The required clocks are mentioned below.
+         items:
+           - const: iface
+           - const: ref
+           - const: cfg_ahb
+           - const: pipe
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/gpio/gpio.h>
+    msm_dp: displayport-controller@ae90000{
+                cell-index = <0>;
+        compatible = "qcom,dp-display";
+        reg =   <0 0xae90000 0 0x200>,
+                <0 0xae90200 0 0x200>,
+                <0 0xae90400 0 0xc00>,
+                <0 0xae91000 0 0x400>,
+                <0 0x88eaa00 0 0x200>,
+                <0 0x88ea200 0 0x200>,
+                <0 0x88ea600 0 0x200>,
+                <0 0x780000 0 0x6228>,
+                <0 0x088ea000 0 0x40>,
+                <0 0x88e8000 0 0x20>,
+                <0 0x0aee1000 0 0x034>;
+        reg-names = "dp_ahb", "dp_aux", "dp_link",
+            "dp_p0", "dp_phy", "dp_ln_tx0", "dp_ln_tx1",
+            "qfprom_physical", "dp_pll",
+            "usb3_dp_com", "hdcp_physical";
+
+        interrupt-parent = <&display_subsystem>;
+        interrupts = <12 0>;
+
+        clocks = <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+            <&rpmhcc RPMH_CXO_CLK>,
+            <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
+            <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+            <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>,
+            <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+            <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+            <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
+            <&dispcc DISP_CC_MDSS_DP_CRYPTO_CLK>,
+            <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+        clock-names = "core_aux_clk", "core_ref_clk_src",
+            "core_usb_ref_clk", "core_usb_cfg_ahb_clk",
+            "core_usb_pipe_clk", "ctrl_link_clk",
+            "ctrl_link_iface_clk", "ctrl_pixel_clk",
+            "crypto_clk", "pixel_clk_rcg";
+
+        pll-node = <&dp_pll>;
+        vdda-1p2-supply = <&vreg_l3c_1p2>;
+        vdda-0p9-supply = <&vreg_l4a_0p8>;
+
+        aux-cfg0-settings = [20 00];
+        aux-cfg1-settings = [24 13 23 1d];
+        aux-cfg2-settings = [28 24];
+        aux-cfg3-settings = [2c 00];
+        aux-cfg4-settings = [30 0a];
+        aux-cfg5-settings = [34 26];
+        aux-cfg6-settings = [38 0a];
+        aux-cfg7-settings = [3c 03];
+        aux-cfg8-settings = [40 bb];
+        aux-cfg9-settings = [44 03];
+
+        max-pclk-frequency-khz = <67500>;
+        data-lanes = <2>;
+
+        aux-en-gpio = <&msmgpio 55 1>;
+        aux-sel-gpio = <&msmgpio 110 1>;
+        usbplug-cc-gpio = <&msmgpio 90 1>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dp_in: endpoint {
+                    remote-endpoint = <&dpu_intf0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dp_out: endpoint {
+                };
+            };
+        };
+    };
+
+    dp_pll: dp-pll@088ea000 {
+        compatible = "qcom,dp-pll-10nm";
+        label = "DP PLL";
+        cell-index = <0>;
+        #clock-cells = <1>;
+
+        reg = <0 0x088ea000 0 0x200>,
+              <0 0x088eaa00 0 0x200>,
+              <0 0x088ea200 0 0x200>,
+              <0 0x088ea600 0 0x200>,
+              <0 0x08803000 0 0x8>;
+        reg-names = "pll_base", "phy_base", "ln_tx0_base",
+            "ln_tx1_base", "gdsc_base";
+
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+             <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
+             <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+             <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+        clock-names = "iface_clk", "ref_clk",
+            "cfg_ahb_clk", "pipe_clk";
+    };
+
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
1.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
