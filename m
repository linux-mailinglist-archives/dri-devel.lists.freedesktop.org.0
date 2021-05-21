Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEDB38C4CE
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 12:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE2D89058;
	Fri, 21 May 2021 10:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1014A6F610;
 Fri, 21 May 2021 10:28:11 +0000 (UTC)
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 21 May 2021 03:28:11 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 21 May 2021 03:28:09 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg01-blr.qualcomm.com with ESMTP; 21 May 2021 15:57:28 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id 579E021C06; Fri, 21 May 2021 15:57:26 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v17 1/4] dt-bindings: msm: disp: add yaml schemas for DPU
 bindings
Date: Fri, 21 May 2021 15:57:21 +0530
Message-Id: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
like DPU display controller, DSI etc. Add YAML schema
for DPU device tree bindings.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Changes in v2:
    - Changed dpu to DPU (Sam Ravnborg)
    - Fixed indentation issues (Sam Ravnborg)
    - Added empty line between different properties (Sam Ravnborg)
    - Replaced reference txt files with  their corresponding
      yaml files (Sam Ravnborg)
    - Modified the file to use "|" only when it is
      necessary (Sam Ravnborg)

Changes in v3:
    - Corrected the license used (Rob Herring)
    - Added maxItems for properties (Rob Herring)
    - Dropped generic descriptions (Rob Herring)
    - Added ranges property (Rob Herring)
    - Corrected the indendation (Rob Herring)
    - Added additionalProperties (Rob Herring)
    - Split dsi file into two, one for dsi controller
      and another one for dsi phy per target (Rob Herring)
    - Corrected description for pinctrl-names (Rob Herring)
    - Corrected the examples used in yaml file (Rob Herring)
    - Delete dsi.txt and dpu.txt (Rob Herring)

Changes in v4:
    - Move schema up by one level (Rob Herring)
    - Add patternProperties for mdp node (Rob Herring)
    - Corrected description of some properties (Rob Herring)

Changes in v5:
    - Correct the indentation (Rob Herring)
    - Remove unnecessary description from properties (Rob Herring)
    - Correct the number of interconnect entries (Rob Herring)
    - Add interconnect names for sc7180 (Rob Herring)
    - Add description for ports (Rob Herring)
    - Remove common properties (Rob Herring)
    - Add unevalutatedProperties (Rob Herring)
    - Reference existing dsi controller yaml in the common
      dsi controller file (Rob Herring)
    - Correct the description of clock names to include only the
      clocks that are required (Rob Herring)
    - Remove properties which are already covered under the common
      binding (Rob Herring)
    - Add dsi phy supply nodes which are required for sc7180 and
      sdm845 targets (Rob Herring)
    - Add type ref for syscon-sfpb (Rob Herring)

Changes in v6:
    - Fixed errors during dt_binding_check (Rob Herring)
    - Add maxItems for phys and phys-names (Rob Herring)
    - Use unevaluatedProperties wherever required (Rob Herring)
    - Removed interrupt controller from required properties for
      dsi controller (Rob Herring)
    - Add constraints for dsi-phy reg-names based on the compatible
      phy version (Rob Herring)
    - Add constraints for dsi-phy supply nodes based on the
      compatible phy version (Rob Herring)

Changes in v7:
    - Add default value for qcom,mdss-mdp-transfer-time-us (Rob Herring)
    - Modify the schema for data-lanes (Rob Herring)
    - Split the phy schema into separate schemas based on
      the phy version (Rob Herring)

Changes in v8:
    - Resolve merge conflicts with latest dsi.txt file
    - Include dp yaml change also in the same series

Changes in v9:
    - Combine target specific dsi controller yaml files
      to a single yaml file (Rob Herring)
    - Combine target specific dsi phy yaml files into a
      single yaml file (Rob Herring)
    - Use unevaluatedProperties and additionalProperties
      wherever required
    - Remove duplicate properties from common yaml files

Changes in v10:
    - Split the patch into separate patches for DPU, DSI and
      PHY (Stephen Boyd)
    - Drop unnecessary fullstop (Stephen Boyd)
    - Add newline whereever required (Stephen Boyd)
    - Add description for clock used (Stephen Boyd)
    - Modify the description for interconnect entries  (Stephen Boyd)
    - Drop assigned clock entries as it a generic property (Stephen Boyd)
    - Correct the definition for interrupts (Stephen Boyd)
    - Drop clock names from required properties (Stephen Boyd)
    - Drop labels for display nodes from example (Stephen Boyd)
    - Drop flags from interrupts entries (Stephen Boyd)

Changes in v11:
    - Drop maxItems for clocks (Stephen Boyd)

Changes in v12:
    - Add description for register property (Stephen Boyd)
    - Add maxItems for interrupts (Stephen Boyd)
    - Add description for iommus property (Stephen Boyd)
    - Add description for interconnects (Stephen Boyd)
    - Change display node name to display_controller (Stephen Boyd)

Changes in v13:
    - Add maxItems for reg property (Stephen Boyd)
    - Add ranges property in example (Stephen Boyd)
    - Modify description for iommus property (Stephen Boyd)
    - Add Dp bindings for ports in the same patch (Stephen Boyd)
    - Remove soc from examples and change address and size cells
      accordingly (Stephen Boyd)
    - Add reference for ports

Changes in v14:
    - Modify title for SC7180 and SDM845 yaml files (Stephen Boyd)
    - Add required list for display-controller node (Stephen Boyd)

Changes in v16:
    - Add reference for port (Rob Herring)
    - Make additionalProperties as false (Rob Herring)
---
 .../bindings/display/msm/dpu-sc7180.yaml           | 228 +++++++++++++++++++++
 .../bindings/display/msm/dpu-sdm845.yaml           | 212 +++++++++++++++++++
 .../devicetree/bindings/display/msm/dpu.txt        | 141 -------------
 3 files changed, 440 insertions(+), 141 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu.txt

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
new file mode 100644
index 0000000..12a86b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -0,0 +1,228 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties for SC7180 target
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS and DPU are mentioned for SC7180 target.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sc7180-mdss
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    const: mdss
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display AHB clock from dispcc
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ahb
+      - const: core
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#address-cells": true
+
+  "#size-cells": true
+
+  "#interrupt-cells":
+    const: 1
+
+  iommus:
+    items:
+      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
+
+  ranges: true
+
+  interconnects:
+    items:
+      - description: Interconnect path specifying the port ids for data bus
+
+  interconnect-names:
+    const: mdp0-mem
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    description: Node containing the properties of DPU.
+
+    properties:
+      compatible:
+        items:
+          - const: qcom,sc7180-dpu
+
+      reg:
+        items:
+          - description: Address offset and size for mdp register set
+          - description: Address offset and size for vbif register set
+
+      reg-names:
+        items:
+          - const: mdp
+          - const: vbif
+
+      clocks:
+        items:
+          - description: Display hf axi clock
+          - description: Display ahb clock
+          - description: Display rotator clock
+          - description: Display lut clock
+          - description: Display core clock
+          - description: Display vsync clock
+
+      clock-names:
+        items:
+          - const: bus
+          - const: iface
+          - const: rot
+          - const: lut
+          - const: core
+          - const: vsync
+
+      interrupts:
+        maxItems: 1
+
+      power-domains:
+        maxItems: 1
+
+      operating-points-v2: true
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+        description: |
+          Contains the list of output ports from DPU device. These ports
+          connect to interfaces that are external to the DPU hardware,
+          such as DSI, DP etc. Each output port contains an endpoint that
+          describes how it is connected to an external interface.
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: DPU_INTF1 (DSI1)
+
+          port@2:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: DPU_INTF0 (DP)
+
+        required:
+          - port@0
+
+    required:
+      - compatible
+      - reg
+      - reg-names
+      - clocks
+      - interrupts
+      - power-domains
+      - operating-points-v2
+      - ports
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+  - clocks
+  - interrupts
+  - interrupt-controller
+  - iommus
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
+    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sdm845.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@ae00000 {
+         #address-cells = <1>;
+         #size-cells = <1>;
+         compatible = "qcom,sc7180-mdss";
+         reg = <0xae00000 0x1000>;
+         reg-names = "mdss";
+         power-domains = <&dispcc MDSS_GDSC>;
+         clocks = <&gcc GCC_DISP_AHB_CLK>,
+                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
+         clock-names = "iface", "ahb", "core";
+
+         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+         interrupt-controller;
+         #interrupt-cells = <1>;
+
+         interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
+         interconnect-names = "mdp0-mem";
+
+         iommus = <&apps_smmu 0x800 0x2>;
+         ranges;
+
+         display-controller@ae01000 {
+                   compatible = "qcom,sc7180-dpu";
+                   reg = <0x0ae01000 0x8f000>,
+                         <0x0aeb0000 0x2008>;
+
+                   reg-names = "mdp", "vbif";
+
+                   clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                            <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                            <&dispcc DISP_CC_MDSS_ROT_CLK>,
+                            <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                            <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                            <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+                   clock-names = "bus", "iface", "rot", "lut", "core",
+                                 "vsync";
+
+                   interrupt-parent = <&mdss>;
+                   interrupts = <0>;
+                   power-domains = <&rpmhpd SC7180_CX>;
+                   operating-points-v2 = <&mdp_opp_table>;
+
+                   ports {
+                           #address-cells = <1>;
+                           #size-cells = <0>;
+
+                           port@0 {
+                                   reg = <0>;
+                                   dpu_intf1_out: endpoint {
+                                                  remote-endpoint = <&dsi0_in>;
+                                   };
+                           };
+
+                            port@2 {
+                                    reg = <2>;
+                                    dpu_intf0_out: endpoint {
+                                                   remote-endpoint = <&dp_in>;
+                                    };
+                            };
+                   };
+         };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
new file mode 100644
index 0000000..b4ea7c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -0,0 +1,212 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dpu-sdm845.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties for SDM845 target
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS and DPU are mentioned for SDM845 target.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sdm845-mdss
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    const: mdss
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display AXI clock
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: core
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#address-cells": true
+
+  "#size-cells": true
+
+  "#interrupt-cells":
+    const: 1
+
+  iommus:
+    items:
+      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
+      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
+
+  ranges: true
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    description: Node containing the properties of DPU.
+
+    properties:
+      compatible:
+        items:
+          - const: qcom,sdm845-dpu
+
+      reg:
+        items:
+          - description: Address offset and size for mdp register set
+          - description: Address offset and size for vbif register set
+
+      reg-names:
+        items:
+          - const: mdp
+          - const: vbif
+
+      clocks:
+        items:
+          - description: Display ahb clock
+          - description: Display axi clock
+          - description: Display core clock
+          - description: Display vsync clock
+
+      clock-names:
+        items:
+          - const: iface
+          - const: bus
+          - const: core
+          - const: vsync
+
+      interrupts:
+        maxItems: 1
+
+      power-domains:
+        maxItems: 1
+
+      operating-points-v2: true
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+        description: |
+          Contains the list of output ports from DPU device. These ports
+          connect to interfaces that are external to the DPU hardware,
+          such as DSI, DP etc. Each output port contains an endpoint that
+          describes how it is connected to an external interface.
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: DPU_INTF1 (DSI1)
+
+          port@1:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: DPU_INTF2 (DSI2)
+
+        required:
+          - port@0
+          - port@1
+
+    required:
+      - compatible
+      - reg
+      - reg-names
+      - clocks
+      - interrupts
+      - power-domains
+      - operating-points-v2
+      - ports
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+  - clocks
+  - interrupts
+  - interrupt-controller
+  - iommus
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@ae00000 {
+          #address-cells = <1>;
+          #size-cells = <1>;
+          compatible = "qcom,sdm845-mdss";
+          reg = <0x0ae00000 0x1000>;
+          reg-names = "mdss";
+          power-domains = <&dispcc MDSS_GDSC>;
+
+          clocks = <&gcc GCC_DISP_AHB_CLK>,
+                   <&gcc GCC_DISP_AXI_CLK>,
+                   <&dispcc DISP_CC_MDSS_MDP_CLK>;
+          clock-names = "iface", "bus", "core";
+
+          interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+          interrupt-controller;
+          #interrupt-cells = <1>;
+
+          iommus = <&apps_smmu 0x880 0x8>,
+                   <&apps_smmu 0xc80 0x8>;
+          ranges;
+
+          display-controller@ae01000 {
+                    compatible = "qcom,sdm845-dpu";
+                    reg = <0x0ae01000 0x8f000>,
+                          <0x0aeb0000 0x2008>;
+                    reg-names = "mdp", "vbif";
+
+                    clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                             <&dispcc DISP_CC_MDSS_AXI_CLK>,
+                             <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                             <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+                    clock-names = "iface", "bus", "core", "vsync";
+
+                    interrupt-parent = <&mdss>;
+                    interrupts = <0>;
+                    power-domains = <&rpmhpd SDM845_CX>;
+                    operating-points-v2 = <&mdp_opp_table>;
+
+                    ports {
+                           #address-cells = <1>;
+                           #size-cells = <0>;
+
+                           port@0 {
+                                   reg = <0>;
+                                   dpu_intf1_out: endpoint {
+                                                  remote-endpoint = <&dsi0_in>;
+                                   };
+                           };
+
+                           port@1 {
+                                   reg = <1>;
+                                   dpu_intf2_out: endpoint {
+                                                  remote-endpoint = <&dsi1_in>;
+                                   };
+                           };
+                    };
+          };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
deleted file mode 100644
index 586e6ea..0000000
--- a/Documentation/devicetree/bindings/display/msm/dpu.txt
+++ /dev/null
@@ -1,141 +0,0 @@
-Qualcomm Technologies, Inc. DPU KMS
-
-Description:
-
-Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
-sub-blocks like DPU display controller, DSI and DP interfaces etc.
-The DPU display controller is found in SDM845 SoC.
-
-MDSS:
-Required properties:
-- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
-- reg: physical base address and length of controller's registers.
-- reg-names: register region names. The following region is required:
-  * "mdss"
-- power-domains: a power domain consumer specifier according to
-  Documentation/devicetree/bindings/power/power_domain.txt
-- clocks: list of clock specifiers for clocks needed by the device.
-- clock-names: device clock names, must be in same order as clocks property.
-  The following clocks are required:
-  * "iface"
-  * "bus"
-  * "core"
-- interrupts: interrupt signal from MDSS.
-- interrupt-controller: identifies the node as an interrupt controller.
-- #interrupt-cells: specifies the number of cells needed to encode an interrupt
-  source, should be 1.
-- iommus: phandle of iommu device node.
-- #address-cells: number of address cells for the MDSS children. Should be 1.
-- #size-cells: Should be 1.
-- ranges: parent bus address space is the same as the child bus address space.
-- interconnects : interconnect path specifier for MDSS according to
-  Documentation/devicetree/bindings/interconnect/interconnect.txt. Should be
-  2 paths corresponding to 2 AXI ports.
-- interconnect-names : MDSS will have 2 port names to differentiate between the
-  2 interconnect paths defined with interconnect specifier.
-
-Optional properties:
-- assigned-clocks: list of clock specifiers for clocks needing rate assignment
-- assigned-clock-rates: list of clock frequencies sorted in the same order as
-  the assigned-clocks property.
-
-MDP:
-Required properties:
-- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu"
-- reg: physical base address and length of controller's registers.
-- reg-names : register region names. The following region is required:
-  * "mdp"
-  * "vbif"
-- clocks: list of clock specifiers for clocks needed by the device.
-- clock-names: device clock names, must be in same order as clocks property.
-  The following clocks are required.
-  * "bus"
-  * "iface"
-  * "core"
-  * "vsync"
-- interrupts: interrupt line from DPU to MDSS.
-- ports: contains the list of output ports from DPU device. These ports connect
-  to interfaces that are external to the DPU hardware, such as DSI, DP etc.
-
-  Each output port contains an endpoint that describes how it is connected to an
-  external interface. These are described by the standard properties documented
-  here:
-	Documentation/devicetree/bindings/graph.txt
-	Documentation/devicetree/bindings/media/video-interfaces.txt
-
-	Port 0 -> DPU_INTF1 (DSI1)
-	Port 1 -> DPU_INTF2 (DSI2)
-
-Optional properties:
-- assigned-clocks: list of clock specifiers for clocks needing rate assignment
-- assigned-clock-rates: list of clock frequencies sorted in the same order as
-  the assigned-clocks property.
-
-Example:
-
-	mdss: mdss@ae00000 {
-		compatible = "qcom,sdm845-mdss";
-		reg = <0xae00000 0x1000>;
-		reg-names = "mdss";
-
-		power-domains = <&clock_dispcc 0>;
-
-		clocks = <&gcc GCC_DISP_AHB_CLK>, <&gcc GCC_DISP_AXI_CLK>,
-			 <&clock_dispcc DISP_CC_MDSS_MDP_CLK>;
-		clock-names = "iface", "bus", "core";
-
-		assigned-clocks = <&clock_dispcc DISP_CC_MDSS_MDP_CLK>;
-		assigned-clock-rates = <300000000>;
-
-		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-controller;
-		#interrupt-cells = <1>;
-
-		interconnects = <&rsc_hlos MASTER_MDP0 &rsc_hlos SLAVE_EBI1>,
-				<&rsc_hlos MASTER_MDP1 &rsc_hlos SLAVE_EBI1>;
-
-		interconnect-names = "mdp0-mem", "mdp1-mem";
-
-		iommus = <&apps_iommu 0>;
-
-		#address-cells = <2>;
-		#size-cells = <1>;
-		ranges = <0 0 0xae00000 0xb2008>;
-
-		mdss_mdp: mdp@ae01000 {
-			compatible = "qcom,sdm845-dpu";
-			reg = <0 0x1000 0x8f000>, <0 0xb0000 0x2008>;
-			reg-names = "mdp", "vbif";
-
-			clocks = <&clock_dispcc DISP_CC_MDSS_AHB_CLK>,
-				 <&clock_dispcc DISP_CC_MDSS_AXI_CLK>,
-				 <&clock_dispcc DISP_CC_MDSS_MDP_CLK>,
-				 <&clock_dispcc DISP_CC_MDSS_VSYNC_CLK>;
-			clock-names = "iface", "bus", "core", "vsync";
-
-			assigned-clocks = <&clock_dispcc DISP_CC_MDSS_MDP_CLK>,
-					  <&clock_dispcc DISP_CC_MDSS_VSYNC_CLK>;
-			assigned-clock-rates = <0 0 300000000 19200000>;
-
-			interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					dpu_intf1_out: endpoint {
-						remote-endpoint = <&dsi0_in>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-					dpu_intf2_out: endpoint {
-						remote-endpoint = <&dsi1_in>;
-					};
-				};
-			};
-		};
-	};
-- 
2.7.4

