Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FBE354CD3
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 08:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076E089B06;
	Tue,  6 Apr 2021 06:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5A489F19;
 Mon,  5 Apr 2021 11:13:02 +0000 (UTC)
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 05 Apr 2021 04:06:59 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 Apr 2021 04:06:57 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg02-blr.qualcomm.com with ESMTP; 05 Apr 2021 16:36:14 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id 6E4A321B28; Mon,  5 Apr 2021 16:36:13 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v15 3/4] dt-bindings: msm: dsi: add yaml schemas for DSI PHY
 bindings
Date: Mon,  5 Apr 2021 16:36:09 +0530
Message-Id: <1617620770-26202-3-git-send-email-mkrishn@codeaurora.org>
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

Add YAML schema for the device tree bindings for DSI PHY.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Changes in v1:
   - Merge dsi-phy.yaml and dsi-phy-10nm.yaml (Stephen Boyd)
   - Remove qcom,dsi-phy-regulator-ldo-mode (Stephen Boyd)
   - Add clock cells properly (Stephen Boyd)
   - Remove unnecessary decription from clock names (Stephen Boyd)
   - Add pin names for the supply entries for 10nm phy which is
     used in sc7180 and sdm845 (Stephen Boyd)
   - Remove unused header files from examples (Stephen Boyd)
   - Drop labels for display nodes and correct node name (Stephen Boyd)

Changes in v2:
   - Drop maxItems for clock (Stephen Boyd)
   - Add vdds supply pin information for sdm845 (Stephen Boyd)
   - Add examples for 14nm, 20nm and 28nm phy yaml files (Stephen Boyd)
   - Keep child nodes directly under soc node (Stephen Boyd)

Changes in v3:
   - Use a separate yaml file to describe the common properties
     for all the dsi phy versions (Stephen Boyd)
   - Remove soc from examples (Stephen Boyd)
   - Add description for register property

Changes in v4:
   - Modify the title for all the phy versions (Stephen Boyd)
   - Drop description for all the phy versions (Stephen Boyd)
   - Modify the description for register property (Stephen Boyd)

Changes in v5:
   - Remove unused properties from common dsi phy file
   - Add clock-cells and phy-cells to required property
     list (Stephen Boyd)
---
 .../bindings/display/msm/dsi-phy-10nm.yaml         | 68 +++++++++++++++++++++
 .../bindings/display/msm/dsi-phy-14nm.yaml         | 66 ++++++++++++++++++++
 .../bindings/display/msm/dsi-phy-20nm.yaml         | 71 ++++++++++++++++++++++
 .../bindings/display/msm/dsi-phy-28nm.yaml         | 68 +++++++++++++++++++++
 .../bindings/display/msm/dsi-phy-common.yaml       | 40 ++++++++++++
 5 files changed, 313 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
new file mode 100644
index 0000000..4a26bef
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-phy-10nm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DSI 10nm PHY
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+allOf:
+  - $ref: dsi-phy-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,dsi-phy-10nm
+      - const: qcom,dsi-phy-10nm-8998
+
+  reg:
+    items:
+      - description: dsi phy register set
+      - description: dsi phy lane register set
+      - description: dsi pll register set
+
+  reg-names:
+    items:
+      - const: dsi_phy
+      - const: dsi_phy_lane
+      - const: dsi_pll
+
+  vdds-supply:
+    description: |
+      Connected to DSI0_MIPI_DSI_PLL_VDDA0P9 pin for sc7180 target and
+      connected to VDDA_MIPI_DSI_0_PLL_0P9 pin for sdm845 target
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - vdds-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+     #include <dt-bindings/clock/qcom,rpmh.h>
+
+     dsi-phy@ae94400 {
+         compatible = "qcom,dsi-phy-10nm";
+         reg = <0x0ae94400 0x200>,
+               <0x0ae94600 0x280>,
+               <0x0ae94a00 0x1e0>;
+         reg-names = "dsi_phy",
+                     "dsi_phy_lane",
+                     "dsi_pll";
+
+         #clock-cells = <1>;
+         #phy-cells = <0>;
+
+         vdds-supply = <&vdda_mipi_dsi0_pll>;
+         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                  <&rpmhcc RPMH_CXO_CLK>;
+         clock-names = "iface", "ref";
+     };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
new file mode 100644
index 0000000..72a00cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-phy-14nm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DSI 14nm PHY
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+allOf:
+  - $ref: dsi-phy-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,dsi-phy-14nm
+      - const: qcom,dsi-phy-14nm-660
+
+  reg:
+    items:
+      - description: dsi phy register set
+      - description: dsi phy lane register set
+      - description: dsi pll register set
+
+  reg-names:
+    items:
+      - const: dsi_phy
+      - const: dsi_phy_lane
+      - const: dsi_pll
+
+  vcca-supply:
+    description: Phandle to vcca regulator device node.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - vcca-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+     #include <dt-bindings/clock/qcom,rpmh.h>
+
+     dsi-phy@ae94400 {
+         compatible = "qcom,dsi-phy-14nm";
+         reg = <0x0ae94400 0x200>,
+               <0x0ae94600 0x280>,
+               <0x0ae94a00 0x1e0>;
+         reg-names = "dsi_phy",
+                     "dsi_phy_lane",
+                     "dsi_pll";
+
+         #clock-cells = <1>;
+         #phy-cells = <0>;
+
+         vcca-supply = <&vcca_reg>;
+         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                  <&rpmhcc RPMH_CXO_CLK>;
+         clock-names = "iface", "ref";
+     };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
new file mode 100644
index 0000000..743806d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-phy-20nm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DSI 20nm PHY
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+allOf:
+  - $ref: dsi-phy-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,dsi-phy-20nm
+
+  reg:
+    items:
+      - description: dsi pll register set
+      - description: dsi phy register set
+      - description: dsi phy regulator register set
+
+  reg-names:
+    items:
+      - const: dsi_pll
+      - const: dsi_phy
+      - const: dsi_phy_regulator
+
+  vcca-supply:
+    description: Phandle to vcca regulator device node.
+
+  vddio-supply:
+    description: Phandle to vdd-io regulator device node.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - vddio-supply
+  - vcca-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+     #include <dt-bindings/clock/qcom,rpmh.h>
+
+     dsi-phy@fd922a00 {
+         compatible = "qcom,dsi-phy-20nm";
+         reg = <0xfd922a00 0xd4>,
+               <0xfd922b00 0x2b0>,
+               <0xfd922d80 0x7b>;
+         reg-names = "dsi_pll",
+                     "dsi_phy",
+                     "dsi_phy_regulator";
+
+         #clock-cells = <1>;
+         #phy-cells = <0>;
+
+         vcca-supply = <&vcca_reg>;
+         vddio-supply = <&vddio_reg>;
+
+         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                  <&rpmhcc RPMH_CXO_CLK>;
+         clock-names = "iface", "ref";
+     };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
new file mode 100644
index 0000000..78f6b16
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-phy-28nm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DSI 28nm PHY
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+allOf:
+  - $ref: dsi-phy-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,dsi-phy-28nm-hpm
+      - const: qcom,dsi-phy-28nm-lp
+      - const: qcom,dsi-phy-28nm-8960
+
+  reg:
+    items:
+      - description: dsi pll register set
+      - description: dsi phy register set
+      - description: dsi phy regulator register set
+
+  reg-names:
+    items:
+      - const: dsi_pll
+      - const: dsi_phy
+      - const: dsi_phy_regulator
+
+  vddio-supply:
+    description: Phandle to vdd-io regulator device node.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - vddio-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+     #include <dt-bindings/clock/qcom,rpmh.h>
+
+     dsi-phy@fd922a00 {
+         compatible = "qcom,dsi-phy-28nm";
+         reg = <0xfd922a00 0xd4>,
+               <0xfd922b00 0x2b0>,
+               <0xfd922d80 0x7b>;
+         reg-names = "dsi_pll",
+                     "dsi_phy",
+                     "dsi_phy_regulator";
+
+         #clock-cells = <1>;
+         #phy-cells = <0>;
+
+         vddio-supply = <&vddio_reg>;
+
+         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                  <&rpmhcc RPMH_CXO_CLK>;
+         clock-names = "iface", "ref";
+     };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
new file mode 100644
index 0000000..502bdda
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-phy-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Description of Qualcomm Display DSI PHY common dt properties
+
+maintainers:
+  - Krishna Manikandan <mkrishn@codeaurora.org>
+
+description: |
+  This defines the DSI PHY dt properties which are common for all
+  dsi phy versions.
+
+properties:
+  "#clock-cells":
+    const: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: Display AHB clock
+      - description: Board XO source
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ref
+
+required:
+  - clocks
+  - clock-names
+  - "#clock-cells"
+  - "#phy-cells"
+
+additionalProperties: true
+...
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
