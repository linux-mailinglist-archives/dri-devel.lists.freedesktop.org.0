Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E3C354CD6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 08:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE2D6E07F;
	Tue,  6 Apr 2021 06:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 364 seconds by postgrey-1.36 at gabe;
 Mon, 05 Apr 2021 11:13:01 UTC
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3ED89F19;
 Mon,  5 Apr 2021 11:13:01 +0000 (UTC)
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 05 Apr 2021 04:06:56 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 Apr 2021 04:06:54 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg02-blr.qualcomm.com with ESMTP; 05 Apr 2021 16:36:14 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id ACF6A21B2C; Mon,  5 Apr 2021 16:36:12 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v15 2/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 bindings
Date: Mon,  5 Apr 2021 16:36:08 +0530
Message-Id: <1617620770-26202-2-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617620770-26202-1-git-send-email-mkrishn@codeaurora.org>
References: <1617620770-26202-1-git-send-email-mkrishn@codeaurora.org>
X-Mailman-Approved-At: Tue, 06 Apr 2021 06:25:33 +0000
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, vinod.koul@linaro.org,
 dianders@chromium.org, abhinavk@codeaurora.org, swboyd@chromium.org,
 khsieh@codeaurora.org, robh+dt@kernel.org, tanmay@codeaurora.org,
 kalyan_t@codeaurora.org, bjorn.andersson@linaro.org, sean@poorly.run
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add YAML schema for the device tree bindings for DSI

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Changes in v1:
    - Separate dsi controller bindings to a separate patch (Stephen Boyd)
    - Merge dsi-common-controller.yaml and dsi-controller-main.yaml to
      a single file (Stephen Boyd)
    - Drop supply entries and definitions from properties (Stephen Boyd)
    - Modify phy-names property for dsi controller (Stephen Boyd)
    - Remove boolean from description (Stephen Boyd)
    - Drop pinctrl properties as they are standard entries (Stephen Boyd)
    - Modify the description for ports property and keep the reference
      to the generic binding where this is defined (Stephen Boyd)
    - Add description to clock names (Stephen Boyd)
    - Correct the indendation (Stephen Boyd)
    - Drop the label for display dt nodes and correct the node
      name (Stephen Boyd)

Changes in v2:
    - Drop maxItems for clock (Stephen Boyd)
    - Drop qcom,mdss-mdp-transfer-time-us as it is not used in upstream
      dt file (Stephen Boyd)
    - Keep child node directly under soc node (Stephen Boyd)
    - Drop qcom,sync-dual-dsi as it is not used in upstream dt

Changes in v3:
    - Add description for register property (Stephen Boyd)

Changes in v4:
    - Add maxItems for phys property (Stephen Boyd)
    - Add maxItems for reg property (Stephen Boyd)
    - Add reference for data-lanes property (Stephen Boyd)
    - Remove soc from example (Stephen Boyd)

Changes in v5:
    - Modify title and description (Stephen Boyd)
    - Add required properties for ports node (Stephen Boyd)
    - Add data-lanes in the example (Stephen Boyd)
    - Drop qcom,master-dsi property (Stephen Boyd)

Changes in v6:
    - Add required properties for port@0, port@1 and corresponding
      endpoints (Stephen Boyd)
    - Add address-cells and size-cells for ports (Stephen Boyd)
    - Use additionalProperties instead of unevaluatedProperties (Stephen Boyd)
---
 .../bindings/display/msm/dsi-controller-main.yaml  | 213 ++++++++++++++++++
 .../devicetree/bindings/display/msm/dsi.txt        | 249 ---------------------
 2 files changed, 213 insertions(+), 249 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dsi.txt

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
new file mode 100644
index 0000000..7858524
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -0,0 +1,213 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DSI controller
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+allOf:
+  - $ref: "../dsi-controller.yaml#"
+
+properties:
+  compatible:
+    items:
+      - const: qcom,mdss-dsi-ctrl
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    const: dsi_ctrl
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Display byte clock
+      - description: Display byte interface clock
+      - description: Display pixel clock
+      - description: Display escape clock
+      - description: Display AHB clock
+      - description: Display AXI clock
+
+  clock-names:
+    items:
+      - const: byte
+      - const: byte_intf
+      - const: pixel
+      - const: core
+      - const: iface
+      - const: bus
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: dsi
+
+  "#address-cells": true
+
+  "#size-cells": true
+
+  syscon-sfpb:
+    description: A phandle to mmss_sfpb syscon node (only for DSIv2).
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+  qcom,dual-dsi-mode:
+    type: boolean
+    description: |
+      Indicates if the DSI controller is driving a panel which needs
+      2 DSI links.
+
+  ports:
+    $ref: "/schemas/graph.yaml#/properties/port"
+    type: object
+    description: |
+      Contains DSI controller input and output ports as children, each
+      containing one endpoint subnode.
+
+    properties:
+      port@0:
+        type: object
+        description: |
+          Input endpoints of the controller.
+
+        properties:
+          reg:
+            const: 0
+
+          endpoint:
+            type: object
+            properties:
+              remote-endpoint:
+                description: |
+                  For port@1, set to phandle of the connected panel/bridge's
+                  input endpoint. For port@0, set to the MDP interface output.
+
+              data-lanes:
+                $ref: "/schemas/media/video-interfaces.yaml#"
+                description: |
+                  This describes how the physical DSI data lanes are mapped
+                  to the logical lanes on the given platform. The value contained in
+                  index n describes what physical lane is mapped to the logical lane n
+                  (DATAn, where n lies between 0 and 3). The clock lane position is fixed
+                  and can't be changed. Hence, they aren't a part of the DT bindings.
+
+                items:
+                  - const: 0
+                  - const: 1
+                  - const: 2
+                  - const: 3
+
+            required:
+              - remote-endpoint
+
+        required:
+          - reg
+          - endpoint
+
+      port@1:
+        type: object
+        description: |
+          Output endpoints of the controller.
+        properties:
+          reg:
+            const: 1
+
+          endpoint:
+            type: object
+            properties:
+              remote-endpoint: true
+              data-lanes:
+                items:
+                  - const: 0
+                  - const: 1
+                  - const: 2
+                  - const: 3
+
+            required:
+              - remote-endpoint
+              - data-lanes
+
+        required:
+          - reg
+          - endpoint
+
+    required:
+      - port@0
+      - port@1
+      - "#address-cells"
+      - "#size-cells"
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+     #include <dt-bindings/interrupt-controller/arm-gic.h>
+     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+
+     dsi@ae94000 {
+           compatible = "qcom,mdss-dsi-ctrl";
+           reg = <0x0ae94000 0x400>;
+           reg-names = "dsi_ctrl";
+
+           #address-cells = <1>;
+           #size-cells = <0>;
+
+           interrupt-parent = <&mdss>;
+           interrupts = <4>;
+
+           clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+                    <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+                    <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+                    <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+                    <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                    <&dispcc DISP_CC_MDSS_AXI_CLK>;
+           clock-names = "byte",
+                         "byte_intf",
+                         "pixel",
+                         "core",
+                         "iface",
+                         "bus";
+
+           phys = <&dsi0_phy>;
+           phy-names = "dsi";
+
+           ports {
+                  #address-cells = <1>;
+                  #size-cells = <0>;
+
+                  port@0 {
+                          reg = <0>;
+                          dsi0_in: endpoint {
+                                   remote-endpoint = <&dpu_intf1_out>;
+                          };
+                  };
+
+                  port@1 {
+                          reg = <1>;
+                          dsi0_out: endpoint {
+                                   remote-endpoint = <&sn65dsi86_in>;
+                                   data-lanes = <0 1 2 3>;
+                          };
+                  };
+           };
+     };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
deleted file mode 100644
index b9a64d3..0000000
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ /dev/null
@@ -1,249 +0,0 @@
-Qualcomm Technologies Inc. adreno/snapdragon DSI output
-
-DSI Controller:
-Required properties:
-- compatible:
-  * "qcom,mdss-dsi-ctrl"
-- reg: Physical base address and length of the registers of controller
-- reg-names: The names of register regions. The following regions are required:
-  * "dsi_ctrl"
-- interrupts: The interrupt signal from the DSI block.
-- power-domains: Should be <&mmcc MDSS_GDSC>.
-- clocks: Phandles to device clocks.
-- clock-names: the following clocks are required:
-  * "mdp_core"
-  * "iface"
-  * "bus"
-  * "core_mmss"
-  * "byte"
-  * "pixel"
-  * "core"
-  For DSIv2, we need an additional clock:
-   * "src"
-  For DSI6G v2.0 onwards, we need also need the clock:
-   * "byte_intf"
-- assigned-clocks: Parents of "byte" and "pixel" for the given platform.
-- assigned-clock-parents: The Byte clock and Pixel clock PLL outputs provided
-  by a DSI PHY block. See [1] for details on clock bindings.
-- vdd-supply: phandle to vdd regulator device node
-- vddio-supply: phandle to vdd-io regulator device node
-- vdda-supply: phandle to vdda regulator device node
-- phys: phandle to DSI PHY device node
-- phy-names: the name of the corresponding PHY device
-- syscon-sfpb: A phandle to mmss_sfpb syscon node (only for DSIv2)
-- ports: Contains 2 DSI controller ports as child nodes. Each port contains
-  an endpoint subnode as defined in [2] and [3].
-
-Optional properties:
-- panel@0: Node of panel connected to this DSI controller.
-  See files in [4] for each supported panel.
-- qcom,dual-dsi-mode: Boolean value indicating if the DSI controller is
-  driving a panel which needs 2 DSI links.
-- qcom,master-dsi: Boolean value indicating if the DSI controller is driving
-  the master link of the 2-DSI panel.
-- qcom,sync-dual-dsi: Boolean value indicating if the DSI controller is
-  driving a 2-DSI panel whose 2 links need receive command simultaneously.
-- pinctrl-names: the pin control state names; should contain "default"
-- pinctrl-0: the default pinctrl state (active)
-- pinctrl-n: the "sleep" pinctrl state
-- ports: contains DSI controller input and output ports as children, each
-  containing one endpoint subnode.
-
-  DSI Endpoint properties:
-  - remote-endpoint: For port@0, set to phandle of the connected panel/bridge's
-    input endpoint. For port@1, set to the MDP interface output. See [2] for
-    device graph info.
-
-  - data-lanes: this describes how the physical DSI data lanes are mapped
-    to the logical lanes on the given platform. The value contained in
-    index n describes what physical lane is mapped to the logical lane n
-    (DATAn, where n lies between 0 and 3). The clock lane position is fixed
-    and can't be changed. Hence, they aren't a part of the DT bindings. See
-    [3] for more info on the data-lanes property.
-
-    For example:
-
-    data-lanes = <3 0 1 2>;
-
-    The above mapping describes that the logical data lane DATA0 is mapped to
-    the physical data lane DATA3, logical DATA1 to physical DATA0, logic DATA2
-    to phys DATA1 and logic DATA3 to phys DATA2.
-
-    There are only a limited number of physical to logical mappings possible:
-    <0 1 2 3>
-    <1 2 3 0>
-    <2 3 0 1>
-    <3 0 1 2>
-    <0 3 2 1>
-    <1 0 3 2>
-    <2 1 0 3>
-    <3 2 1 0>
-
-DSI PHY:
-Required properties:
-- compatible: Could be the following
-  * "qcom,dsi-phy-28nm-hpm"
-  * "qcom,dsi-phy-28nm-lp"
-  * "qcom,dsi-phy-20nm"
-  * "qcom,dsi-phy-28nm-8960"
-  * "qcom,dsi-phy-14nm"
-  * "qcom,dsi-phy-14nm-660"
-  * "qcom,dsi-phy-10nm"
-  * "qcom,dsi-phy-10nm-8998"
-  * "qcom,dsi-phy-7nm"
-  * "qcom,dsi-phy-7nm-8150"
-- reg: Physical base address and length of the registers of PLL, PHY. Some
-  revisions require the PHY regulator base address, whereas others require the
-  PHY lane base address. See below for each PHY revision.
-- reg-names: The names of register regions. The following regions are required:
-  For DSI 28nm HPM/LP/8960 PHYs and 20nm PHY:
-  * "dsi_pll"
-  * "dsi_phy"
-  * "dsi_phy_regulator"
-  For DSI 14nm, 10nm and 7nm PHYs:
-  * "dsi_pll"
-  * "dsi_phy"
-  * "dsi_phy_lane"
-- clock-cells: Must be 1. The DSI PHY block acts as a clock provider, creating
-  2 clocks: A byte clock (index 0), and a pixel clock (index 1).
-- power-domains: Should be <&mmcc MDSS_GDSC>.
-- clocks: Phandles to device clocks. See [1] for details on clock bindings.
-- clock-names: the following clocks are required:
-  * "iface"
-  * "ref" (only required for new DTS files/entries)
-  For 28nm HPM/LP, 28nm 8960 PHYs:
-- vddio-supply: phandle to vdd-io regulator device node
-  For 20nm PHY:
-- vddio-supply: phandle to vdd-io regulator device node
-- vcca-supply: phandle to vcca regulator device node
-  For 14nm PHY:
-- vcca-supply: phandle to vcca regulator device node
-  For 10nm and 7nm PHY:
-- vdds-supply: phandle to vdds regulator device node
-
-Optional properties:
-- qcom,dsi-phy-regulator-ldo-mode: Boolean value indicating if the LDO mode PHY
-  regulator is wanted.
-- qcom,mdss-mdp-transfer-time-us:	Specifies the dsi transfer time for command mode
-					panels in microseconds. Driver uses this number to adjust
-					the clock rate according to the expected transfer time.
-					Increasing this value would slow down the mdp processing
-					and can result in slower performance.
-					Decreasing this value can speed up the mdp processing,
-					but this can also impact power consumption.
-					As a rule this time should not be higher than the time
-					that would be expected with the processing at the
-					dsi link rate since anyways this would be the maximum
-					transfer time that could be achieved.
-					If ping pong split is enabled, this time should not be higher
-					than two times the dsi link rate time.
-					If the property is not specified, then the default value is 14000 us.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] Documentation/devicetree/bindings/graph.txt
-[3] Documentation/devicetree/bindings/media/video-interfaces.txt
-[4] Documentation/devicetree/bindings/display/panel/
-
-Example:
-	dsi0: dsi@fd922800 {
-		compatible = "qcom,mdss-dsi-ctrl";
-		qcom,dsi-host-index = <0>;
-		interrupt-parent = <&mdp>;
-		interrupts = <4 0>;
-		reg-names = "dsi_ctrl";
-		reg = <0xfd922800 0x200>;
-		power-domains = <&mmcc MDSS_GDSC>;
-		clock-names =
-			"bus",
-			"byte",
-			"core",
-			"core_mmss",
-			"iface",
-			"mdp_core",
-			"pixel";
-		clocks =
-			<&mmcc MDSS_AXI_CLK>,
-			<&mmcc MDSS_BYTE0_CLK>,
-			<&mmcc MDSS_ESC0_CLK>,
-			<&mmcc MMSS_MISC_AHB_CLK>,
-			<&mmcc MDSS_AHB_CLK>,
-			<&mmcc MDSS_MDP_CLK>,
-			<&mmcc MDSS_PCLK0_CLK>;
-
-		assigned-clocks =
-				 <&mmcc BYTE0_CLK_SRC>,
-				 <&mmcc PCLK0_CLK_SRC>;
-		assigned-clock-parents =
-				 <&dsi_phy0 0>,
-				 <&dsi_phy0 1>;
-
-		vdda-supply = <&pma8084_l2>;
-		vdd-supply = <&pma8084_l22>;
-		vddio-supply = <&pma8084_l12>;
-
-		phys = <&dsi_phy0>;
-		phy-names ="dsi-phy";
-
-		qcom,dual-dsi-mode;
-		qcom,master-dsi;
-		qcom,sync-dual-dsi;
-
-		qcom,mdss-mdp-transfer-time-us = <12000>;
-
-		pinctrl-names = "default", "sleep";
-		pinctrl-0 = <&dsi_active>;
-		pinctrl-1 = <&dsi_suspend>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				dsi0_in: endpoint {
-					remote-endpoint = <&mdp_intf1_out>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-				dsi0_out: endpoint {
-					remote-endpoint = <&panel_in>;
-					data-lanes = <0 1 2 3>;
-				};
-			};
-		};
-
-		panel: panel@0 {
-			compatible = "sharp,lq101r1sx01";
-			reg = <0>;
-			link2 = <&secondary>;
-
-			power-supply = <...>;
-			backlight = <...>;
-
-			port {
-				panel_in: endpoint {
-					remote-endpoint = <&dsi0_out>;
-				};
-			};
-		};
-	};
-
-	dsi_phy0: dsi-phy@fd922a00 {
-		compatible = "qcom,dsi-phy-28nm-hpm";
-		qcom,dsi-phy-index = <0>;
-		reg-names =
-			"dsi_pll",
-			"dsi_phy",
-			"dsi_phy_regulator";
-		reg =   <0xfd922a00 0xd4>,
-			<0xfd922b00 0x2b0>,
-			<0xfd922d80 0x7b>;
-		clock-names = "iface";
-		clocks = <&mmcc MDSS_AHB_CLK>;
-		#clock-cells = <1>;
-		vddio-supply = <&pma8084_l12>;
-
-		qcom,dsi-phy-regulator-ldo-mode;
-	};
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
