Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ECC2416A5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE43B6E115;
	Tue, 11 Aug 2020 06:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFB089FD7;
 Mon, 10 Aug 2020 13:38:32 +0000 (UTC)
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 10 Aug 2020 06:38:32 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 10 Aug 2020 06:38:30 -0700
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg01-blr.qualcomm.com with ESMTP; 10 Aug 2020 19:08:07 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id 3B992453A; Mon, 10 Aug 2020 19:08:06 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: msm: disp: add yaml schemas for DPU and DSI
 bindings
Date: Mon, 10 Aug 2020 19:08:02 +0530
Message-Id: <1597066683-6044-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Tue, 11 Aug 2020 06:58:41 +0000
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MSM Mobile Display Subsytem (MDSS) encapsulates sub-blocks
like DPU display controller, DSI etc. Add YAML schema
for the device tree bindings for the same.

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
---
 .../bindings/display/msm/dpu-sc7180.yaml           | 236 +++++++++++++++++++
 .../bindings/display/msm/dpu-sdm845.yaml           | 216 ++++++++++++++++++
 .../devicetree/bindings/display/msm/dpu.txt        | 141 ------------
 .../display/msm/dsi-common-controller.yaml         | 249 +++++++++++++++++++++
 .../display/msm/dsi-controller-sc7180.yaml         | 120 ++++++++++
 .../display/msm/dsi-controller-sdm845.yaml         | 120 ++++++++++
 .../bindings/display/msm/dsi-phy-10nm.yaml         |  62 +++++
 .../bindings/display/msm/dsi-phy-14nm.yaml         |  62 +++++
 .../bindings/display/msm/dsi-phy-20nm.yaml         |  66 ++++++
 .../bindings/display/msm/dsi-phy-28nm.yaml         |  62 +++++
 .../bindings/display/msm/dsi-phy-sc7180.yaml       |  80 +++++++
 .../bindings/display/msm/dsi-phy-sdm845.yaml       |  82 +++++++
 .../devicetree/bindings/display/msm/dsi.txt        | 247 --------------------
 13 files changed, 1355 insertions(+), 388 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-common-controller.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-sc7180.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-sdm845.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dsi.txt

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
new file mode 100644
index 0000000..df70393
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -0,0 +1,236 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display DPU dt properties.
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+  Device tree bindings for MSM Mobile Display Subsytem(MDSS) that encapsulates
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
+    maxItems: 3
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
+  "#interrupt-cells":
+    const: 1
+
+  iommus:
+    maxItems: 1
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+  interconnects:
+    description: |
+      Interconnect path specifier for MDSS according to
+      Documentation/devicetree/bindings/interconnect/interconnect.txt.
+      An entry should contain 2 paths corresponding to 2 AXI ports representing
+      source and destination ports.
+    minItems: 1
+
+  interconnect-names:
+    description: |
+      MDSS will have 2 port names to differentiate between the
+      2 interconnect paths defined with interconnect specifier.
+    items:
+      - const: mdp0-mem
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-rates:
+    maxItems: 1
+
+patternProperties:
+  "^mdp@[0-9a-f]+$":
+    type: object
+    description: Node containing the properties of DPU.
+
+    properties:
+      compatible:
+        items:
+          - const: qcom,sc7180-dpu
+
+      reg:
+        maxItems: 2
+
+      reg-names:
+        items:
+          - const: mdp
+          - const: vbif
+
+      clocks:
+        maxItems: 6
+
+      clock-names:
+        description: |
+          Device clock names, must be in same order as clocks property.
+          The following clocks are required.
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
+      ports:
+        type: object
+        description: |
+          Contains the list of output ports from DPU device. These ports
+          connect to interfaces that are external to the DPU hardware,
+          such as DSI, DP etc. Each output port contains an endpoint that
+          describes how it is connected to an external interface. These
+          are described by the standard properties documented in files
+          mentioned below.
+
+          Documentation/devicetree/bindings/graph.txt
+          Documentation/devicetree/bindings/media/video-interfaces.txt
+
+        properties:
+          port@0:
+            type: object
+            description: DPU_INTF1 (DSI1)
+          port@1:
+            type: object
+            description: DPU_INTF2 (DSI2)
+
+      assigned-clocks:
+        maxItems: 4
+
+      assigned-clock-rates:
+        maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-controller
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
+    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sdm845.h>
+
+    soc: soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      mdss: mdss@ae00000 {
+         compatible = "qcom,sc7180-mdss";
+         reg = <0 0xae00000 0 0x1000>;
+         reg-names = "mdss";
+         power-domains = <&dispcc MDSS_GDSC>;
+
+         clocks = <&gcc GCC_DISP_AHB_CLK>,
+                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
+
+         clock-names = "iface", "ahb", "core";
+
+         assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
+         assigned-clock-rates = <300000000>;
+
+         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+         interrupt-controller;
+         #interrupt-cells = <1>;
+
+         interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
+
+         interconnect-names = "mdp0-mem";
+
+         iommus = <&apps_smmu 0x800 0x2>;
+
+         #address-cells = <2>;
+         #size-cells = <2>;
+
+         mdp: mdp@ae01000 {
+                   compatible = "qcom,sc7180-dpu";
+                   reg = <0 0x0ae01000 0 0x8f000>,
+                         <0 0x0aeb0000 0 0x2008>;
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
+                   assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
+                                     <&dispcc DISP_CC_MDSS_ROT_CLK>,
+                                     <&dispcc DISP_CC_MDSS_ROT_CLK>;
+                   assigned-clock-rates = <300000000>,
+                                          <19200000>,
+                                          <19200000>,
+                                          <19200000>;
+
+                   interrupt-parent = <&mdss>;
+                   interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
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
+                   };
+         };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
new file mode 100644
index 0000000..17395f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -0,0 +1,216 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dpu-sdm845.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display DPU dt properties.
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+  Device tree bindings for MSM Mobile Display Subsytem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS and DPU are mentioned for SDM845 target.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sdm845-mdss
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
+    maxItems: 3
+
+  clock-names:
+    description: |
+      Device clock names in the same order as mentioned in clocks property.
+      The required clocks are mentioned below.
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
+  "#interrupt-cells":
+    const: 1
+
+  iommus:
+    maxItems: 2
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-rates:
+    maxItems: 1
+
+patternProperties:
+  "^mdp@[0-9a-f]+$":
+    type: object
+    description: Node containing the properties of DPU.
+
+    properties:
+      compatible:
+        items:
+          - const: qcom,sdm845-dpu
+      reg:
+        maxItems: 2
+
+      reg-names:
+        items:
+          - const: mdp
+          - const: vbif
+
+      clocks:
+        maxItems: 4
+
+      clock-names:
+        description: |
+          Device clock names, must be in same order as clocks property.
+          The following clocks are required.
+        items:
+          - const: iface
+          - const: bus
+          - const: core
+          - const: vsync
+
+      interrupts:
+        maxItems: 1
+
+      ports:
+        type: object
+        description: |
+          Contains the list of output ports from DPU device. These ports
+          connect to interfaces that are external to the DPU hardware,
+          such as DSI, DP etc. Each output port contains an endpoint that
+          describes how it is connected to an external interface. These
+          are described by the standard properties documented in files
+          mentioned below.
+
+          Documentation/devicetree/bindings/graph.txt
+          Documentation/devicetree/bindings/media/video-interfaces.txt
+
+        properties:
+          port@0:
+            type: object
+            description: DPU_INTF1 (DSI1)
+          port@1:
+            type: object
+            description: DPU_INTF2 (DSI2)
+
+      assigned-clocks:
+        maxItems: 2
+
+      assigned-clock-rates:
+        maxItems: 2
+
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-controller
+  - iommus
+
+additionalProperties: false
+
+examples:
+- |
+    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc: soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      mdss: mdss@ae00000 {
+          compatible = "qcom,sdm845-mdss";
+          reg = <0 0x0ae00000 0 0x1000>;
+          reg-names = "mdss";
+          power-domains = <&dispcc MDSS_GDSC>;
+
+          clocks = <&gcc GCC_DISP_AHB_CLK>,
+                   <&gcc GCC_DISP_AXI_CLK>,
+                   <&dispcc DISP_CC_MDSS_MDP_CLK>;
+          clock-names = "iface", "bus", "core";
+
+          assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
+          assigned-clock-rates = <300000000>;
+
+          interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+          interrupt-controller;
+          #interrupt-cells = <1>;
+
+          iommus = <&apps_smmu 0x880 0x8>,
+                   <&apps_smmu 0xc80 0x8>;
+
+          #address-cells = <2>;
+          #size-cells = <2>;
+
+          mdss_mdp: mdp@ae01000 {
+                    compatible = "qcom,sdm845-dpu";
+                    reg = <0 0x0ae01000 0 0x8f000>,
+                          <0 0x0aeb0000 0 0x2008>;
+                    reg-names = "mdp", "vbif";
+
+                    clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                             <&dispcc DISP_CC_MDSS_AXI_CLK>,
+                             <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                             <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+                    clock-names = "iface", "bus", "core", "vsync";
+
+                    assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                                      <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+                    assigned-clock-rates = <300000000>,
+                                           <19200000>;
+
+                    interrupt-parent = <&mdss>;
+                    interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
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
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
deleted file mode 100644
index 551ae26..0000000
--- a/Documentation/devicetree/bindings/display/msm/dpu.txt
+++ /dev/null
@@ -1,141 +0,0 @@
-Qualcomm Technologies, Inc. DPU KMS
-
-Description:
-
-Device tree bindings for MSM Mobile Display Subsytem(MDSS) that encapsulates
-sub-blocks like DPU display controller, DSI and DP interfaces etc.
-The DPU display controller is found in SDM845 SoC.
-
-MDSS:
-Required properties:
-- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
-- reg: physical base address and length of contoller's registers.
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
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-common-controller.yaml b/Documentation/devicetree/bindings/display/msm/dsi-common-controller.yaml
new file mode 100644
index 0000000..dec2253
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-common-controller.yaml
@@ -0,0 +1,249 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-common-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display DSI controller dt properties.
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+  Common Device tree bindings for DSI controller.
+
+allOf:
+  - $ref: "../dsi-controller.yaml#"
+
+properties:
+  compatible:
+    items:
+      - const: qcom,mdss-dsi-ctrl
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    description: |
+      Device clock names in the same order as mentioned in clocks property.
+
+  assigned-clocks:
+    description: Parents of "byte" and "pixel" for the given platform.
+
+  assigned-clock-parents:
+    description: |
+      The Byte clock and Pixel clock PLL outputs provided by a DSI PHY block.
+      Details on clock bindings are mentioned in
+      Documentation/devicetree/bindings/clock/clock-bindings.txt.
+
+  vdd-supply:
+    description: Phandle to vdd regulator device node.
+
+  vddio-supply:
+    description: Phandle to vdd-io regulator device node.
+
+  vdda-supply:
+    description: Phandle to vdda regulator device node.
+
+  phys:
+    description: Phandle to DSI PHY device node.
+    maxItems: 1
+
+  phy-names:
+    description: Name of the corresponding PHY device.
+    maxItems: 1
+
+  syscon-sfpb:
+    description: A phandle to mmss_sfpb syscon node (only for DSIv2).
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+      # Optional Properties for dsi controller
+  qcom,mdss-mdp-transfer-time-us:
+    description: |
+      Specifies the DSI transfer time for command mode
+      panels in microseconds. Driver uses this number to adjust
+      the clock rate according to the expected transfer time.
+      Increasing this value would slow down the mdp processing
+      and can result in slower performance.
+      Decreasing this value can speed up the mdp processing,
+      but this can also impact power consumption.
+      As a rule this time should not be higher than the time
+      that would be expected with the processing at the
+      DSI link rate since anyways this would be the maximum
+      transfer time that could be achieved.
+      If ping pong split is enabled, this time should not be higher
+      than two times the DSI link rate time.
+      This is an optional property.
+    default: 14000
+
+  qcom,dual-dsi-mode:
+    type: boolean
+    description: |
+      Boolean value indicating if the DSI controller is
+      driving a panel which needs 2 DSI links.
+
+  qcom,master-dsi:
+    type: boolean
+    description: |
+      Boolean value indicating if the DSI controller is driving
+      the master link of the 2-DSI panel.
+
+  qcom,sync-dual-dsi:
+    type: boolean
+    description: |
+      Boolean value indicating if the DSI controller is driving a
+      2-DSI panel whose 2 links need receive command simultaneously.
+
+  pinctrl-names:
+    description: The pin control state names.
+    items:
+      - const: default
+      - const: sleep
+
+  pinctrl-0:
+    description: The default pinctrl state (active)
+
+  pinctrl-1:
+    description: The sleep pinctrl state (suspend)
+
+  ports:
+    type: object
+    description: |
+      Contains DSI controller input and output ports as children, each
+      containing one endpoint subnode as defined in
+      Documentation/devicetree/bindings/graph.txt and
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
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
+                  For port@0, set to phandle of the connected panel/bridge's
+                  input endpoint. For port@1, set to the MDP interface output.
+                  See Documentation/devicetree/bindings/graph.txt for
+                  device graph info.
+
+              data-lanes:
+                description: |
+                  This describes how the physical DSI data lanes are mapped
+                  to the logical lanes on the given platform. The value contained in
+                  index n describes what physical lane is mapped to the logical lane n
+                  (DATAn, where n lies between 0 and 3). The clock lane position is fixed
+                  and can't be changed. Hence, they aren't a part of the DT bindings. See
+                  Documentation/devicetree/bindings/media/video-interfaces.txt for
+                  more info on the data-lanes property.
+
+                  For example:
+                  data-lanes = <3 0 1 2>;
+
+                  The above mapping describes that the logical data lane DATA0 is mapped
+                  to the physical data lane DATA3, logical DATA1 to physical DATA0,
+                  logic DATA2 to phys DATA1 and logic DATA3 to phys DATA2. There are
+                  only a limited number of physical to logical mappings possible.
+                oneOf:
+                  - items:
+                    - const: 0
+                    - const: 1
+                    - const: 2
+                    - const: 3
+                  - items:
+                    - const: 1
+                    - const: 2
+                    - const: 3
+                    - const: 0
+                  - items:
+                    - const: 2
+                    - const: 3
+                    - const: 0
+                    - const: 1
+                  - items:
+                    - const: 3
+                    - const: 0
+                    - const: 1
+                    - const: 2
+                  - items:
+                    - const: 0
+                    - const: 3
+                    - const: 2
+                    - const: 1
+                  - items:
+                    - const: 1
+                    - const: 0
+                    - const: 3
+                    - const: 2
+                  - items:
+                    - const: 2
+                    - const: 1
+                    - const: 0
+                    - const: 3
+                  - items:
+                    - const: 3
+                    - const: 2
+                    - const: 1
+                    - const: 0
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
+                oneOf:
+                  - items:
+                    - const: 0
+                    - const: 1
+                    - const: 2
+                    - const: 3
+                  - items:
+                    - const: 1
+                    - const: 2
+                    - const: 3
+                    - const: 0
+                  - items:
+                    - const: 2
+                    - const: 3
+                    - const: 0
+                    - const: 1
+                  - items:
+                    - const: 3
+                    - const: 0
+                    - const: 1
+                    - const: 2
+                  - items:
+                    - const: 0
+                    - const: 3
+                    - const: 2
+                    - const: 1
+                  - items:
+                    - const: 1
+                    - const: 0
+                    - const: 3
+                    - const: 2
+                  - items:
+                    - const: 2
+                    - const: 1
+                    - const: 0
+                    - const: 3
+                  - items:
+                    - const: 3
+                    - const: 2
+                    - const: 1
+                    - const: 0
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-sc7180.yaml
new file mode 100644
index 0000000..6f3e179
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-sc7180.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-controller-sc7180.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display DSI controller dt properties.
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+  Device tree bindings for DSI controller for SC7180 target.
+
+allOf:
+  - $ref: dsi-common-controller.yaml#
+
+properties:
+  compatible:
+    const: qcom,mdss-dsi-ctrl
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
+    maxItems: 6
+
+  clock-names:
+    items:
+         - const: byte
+         - const: byte_intf
+         - const: pixel
+         - const: core
+         - const: iface
+         - const: bus
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: dsi
+
+  ports: true
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
+unevaluatedProperties: false
+
+examples:
+  - |
+     #include <dt-bindings/interrupt-controller/arm-gic.h>
+     #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
+     #include <dt-bindings/clock/qcom,gcc-sc7180.h>
+
+     mdss: mdss {
+       #address-cells = <2>;
+       #size-cells = <2>;
+       interrupt-controller;
+       #interrupt-cells = <1>;
+
+       dsi0: dsi@ae94000 {
+           compatible = "qcom,mdss-dsi-ctrl";
+           reg = <0 0x0ae94000 0 0x400>;
+           reg-names = "dsi_ctrl";
+
+           interrupt-parent = <&mdss>;
+           interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+
+           clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+                    <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+                    <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+                    <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+                    <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                    <&gcc GCC_DISP_HF_AXI_CLK>;
+
+           clock-names = "byte",
+                         "byte_intf",
+                         "pixel",
+                         "core",
+                         "iface",
+                         "bus";
+
+           phys = <&dsi_phy>;
+           phy-names = "dsi";
+
+           ports {
+                 #address-cells = <1>;
+                 #size-cells = <0>;
+                 port@0 {
+                         reg = <0>;
+                         dsi0_in: endpoint {
+                                  remote-endpoint = <&dpu_intf1_out>;
+                         };
+                };
+
+                port@1 {
+                        reg = <1>;
+                        dsi0_out: endpoint {
+                        };
+               };
+          };
+       };
+     };
+...
+
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-sdm845.yaml
new file mode 100644
index 0000000..5dae89e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-sdm845.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-controller-sdm845.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display DSI controller dt properties.
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+  Device tree bindings for DSI controller for SDM845 target.
+
+allOf:
+  - $ref: dsi-common-controller.yaml#
+
+properties:
+  compatible:
+    const: qcom,mdss-dsi-ctrl
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
+    maxItems: 6
+
+  clock-names:
+    items:
+         - const: byte
+         - const: byte_intf
+         - const: pixel
+         - const: core
+         - const: iface
+         - const: bus
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: dsi
+
+  ports: true
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
+unevaluatedProperties: false
+
+examples:
+  - |
+     #include <dt-bindings/interrupt-controller/arm-gic.h>
+     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+
+     mdss: mdss {
+       #address-cells = <2>;
+       #size-cells = <2>;
+       interrupt-controller;
+       #interrupt-cells = <1>;
+
+       dsi0: dsi@ae94000 {
+           compatible = "qcom,mdss-dsi-ctrl";
+           reg = <0 0x0ae94000 0 0x400>;
+           reg-names = "dsi_ctrl";
+
+           interrupt-parent = <&mdss>;
+           interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
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
+                          };
+                  };
+           };
+       };
+     };
+...
+
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
new file mode 100644
index 0000000..3c0a4f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-phy-10nm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display DSI 10nm PHY dt properties.
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+  Common Device tree bindings for DSI 10nm PHY.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,dsi-phy-10nm
+      - const: qcom,dsi-phy-10nm-8998
+
+  reg-names:
+    items:
+      - const: dsi_phy
+      - const: dsi_phy_lane
+      - const: dsi_pll
+
+  clock-cells:
+    description: |
+      The DSI PHY block acts as a clock provider, creating
+      2 clocks: A byte clock (index 0), and a pixel clock (index 1).
+    const: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    description: |
+      The following clocks are required.
+    items:
+      - const: iface
+      - const: ref
+
+  vdds-supply:
+    description: |
+      Phandle to vdds regulator device node.
+
+  qcom,dsi-phy-regulator-ldo-mode:
+    type: boolean
+    description: |
+      Boolean value indicating if the LDO mode PHY regulator is wanted (optional).
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - vdds-supply
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
new file mode 100644
index 0000000..9232462
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-phy-14nm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display DSI 14nm PHY dt properties.
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+  Common Device tree bindings for DSI 14nm PHY.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,dsi-phy-14nm
+      - const: qcom,dsi-phy-14nm-660
+
+  reg-names:
+    items:
+      - const: dsi_phy
+      - const: dsi_phy_lane
+      - const: dsi_pll
+
+  clock-cells:
+    description: |
+      The DSI PHY block acts as a clock provider, creating
+      2 clocks: A byte clock (index 0), and a pixel clock (index 1).
+    const: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    description: |
+      The following clocks are required.
+    items:
+      - const: iface
+      - const: ref
+
+  qcom,dsi-phy-regulator-ldo-mode:
+    type: boolean
+    description: |
+      Boolean value indicating if the LDO mode PHY regulator is wanted (optional).
+
+  vcca-supply:
+    description: |
+      Phandle to vcca regulator device node.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - vcca-supply
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
new file mode 100644
index 0000000..30ec182
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-phy-20nm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display DSI 20nm PHY dt properties.
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+  Common Device tree bindings for DSI 20nm PHY.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,dsi-phy-20nm
+
+  reg-names:
+    items:
+      - const: dsi_pll
+      - const: dsi_phy
+      - const: dsi_phy_regulator
+
+  clock-cells:
+    description: |
+      The DSI PHY block acts as a clock provider, creating
+      2 clocks: A byte clock (index 0), and a pixel clock (index 1).
+    const: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    description: |
+      The following clocks are required.
+    items:
+      - const: iface
+      - const: ref
+
+  qcom,dsi-phy-regulator-ldo-mode:
+    type: boolean
+    description: |
+      Boolean value indicating if the LDO mode PHY regulator is wanted (optional).
+
+  vcca-supply:
+    description: |
+      Phandle to vcca regulator device node.
+
+  vddio-supply:
+    description: |
+      Phandle to vdd-io regulator device node.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - vddio-supply
+  - vcca-supply
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
new file mode 100644
index 0000000..42bf0d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-phy-28nm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display DSI 28nm PHY dt properties.
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+  Common Device tree bindings for DSI 28nm PHY.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,dsi-phy-28nm-hpm
+      - const: qcom,dsi-phy-28nm-lp
+      - const: qcom,dsi-phy-28nm-8960
+
+  reg-names:
+    items:
+      - const: dsi_pll
+      - const: dsi_phy
+      - const: dsi_phy_regulator
+
+  clock-cells:
+    description: |
+      The DSI PHY block acts as a clock provider, creating
+      2 clocks: A byte clock (index 0), and a pixel clock (index 1).
+    const: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    description: |
+      The following clocks are required.
+    items:
+      - const: iface
+      - const: ref
+
+  qcom,dsi-phy-regulator-ldo-mode:
+    type: boolean
+    description: |
+      Boolean value indicating if the LDO mode PHY regulator is wanted (optional).
+
+  vddio-supply:
+    description: |
+      Phandle to vdd-io regulator device node.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - vddio-supply
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.yaml
new file mode 100644
index 0000000..02f87bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-phy-sc7180.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display DSI PHY dt properties.
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+  Device tree bindings for DSI PHY for SC7180 target.
+
+allOf:
+  - $ref: dsi-phy-10nm.yaml#
+
+properties:
+  compatible:
+    const: qcom,dsi-phy-10nm
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    maxItems: 3
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ref
+
+  "#clock-cells":
+    const: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+     #include <dt-bindings/interrupt-controller/arm-gic.h>
+     #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
+     #include <dt-bindings/clock/qcom,gcc-sc7180.h>
+     #include <dt-bindings/clock/qcom,rpmh.h>
+
+     mdss: mdss {
+       #address-cells = <2>;
+       #size-cells = <2>;
+
+       dsi_phy: dsi-phy@ae94400 {
+              compatible = "qcom,dsi-phy-10nm";
+              reg = <0 0x0ae94400 0 0x200>,
+                    <0 0x0ae94600 0 0x280>,
+                    <0 0x0ae94a00 0 0x1e0>;
+              reg-names = "dsi_phy",
+                          "dsi_phy_lane",
+                          "dsi_pll";
+
+              vdds-supply = <&vdda_mipi_dsi0_pll>;
+              #clock-cells = <1>;
+              #phy-cells = <0>;
+              clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                       <&rpmhcc RPMH_CXO_CLK>;
+              clock-names = "iface", "ref";
+       };
+     };
+...
+
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.yaml
new file mode 100644
index 0000000..8214235
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-phy-sdm845.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display DSI PHY dt properties.
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+  Device tree bindings for DSI PHY for SDM845 target.
+
+allOf:
+  - $ref: dsi-phy-10nm.yaml#
+
+properties:
+  compatible:
+    const: qcom,dsi-phy-10nm
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    maxItems: 3
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ref
+
+  "#clock-cells":
+    const: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+     #include <dt-bindings/interrupt-controller/arm-gic.h>
+     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+     #include <dt-bindings/clock/qcom,rpmh.h>
+
+     mdss: mdss {
+       #address-cells = <2>;
+       #size-cells = <2>;
+
+       dsi0_phy: dsi-phy@ae94400 {
+               compatible = "qcom,dsi-phy-10nm";
+               reg = <0 0x0ae94400 0 0x200>,
+                     <0 0x0ae94600 0 0x280>,
+                     <0 0x0ae94a00 0 0x1e0>;
+               reg-names = "dsi_phy",
+                           "dsi_phy_lane",
+                           "dsi_pll";
+
+               #clock-cells = <1>;
+               #phy-cells = <0>;
+
+               vdds-supply = <&vdda_mipi_dsi0_pll>;
+               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                        <&rpmhcc RPMH_CXO_CLK>;
+               clock-names = "iface", "ref";
+
+       };
+     };
+...
+
diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
deleted file mode 100644
index 7884fd7..0000000
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ /dev/null
@@ -1,247 +0,0 @@
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
-- reg: Physical base address and length of the registers of PLL, PHY. Some
-  revisions require the PHY regulator base address, whereas others require the
-  PHY lane base address. See below for each PHY revision.
-- reg-names: The names of register regions. The following regions are required:
-  For DSI 28nm HPM/LP/8960 PHYs and 20nm PHY:
-  * "dsi_pll"
-  * "dsi_phy"
-  * "dsi_phy_regulator"
-  For DSI 14nm and 10nm PHYs:
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
-  For 10nm PHY:
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
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
