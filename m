Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB06F153FDF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA066F9F1;
	Thu,  6 Feb 2020 08:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4790C6E985;
 Wed,  5 Feb 2020 13:07:00 +0000 (UTC)
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 Feb 2020 18:36:55 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
 by ironmsg01-blr.qualcomm.com with ESMTP; 05 Feb 2020 18:36:43 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id 444682770; Wed,  5 Feb 2020 18:36:42 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCHv3 1/2] dt-bindings: display: add visionox rm69299 panel variant
Date: Wed,  5 Feb 2020 18:36:29 +0530
Message-Id: <1580907990-32108-2-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580907990-32108-1-git-send-email-harigovi@codeaurora.org>
References: <1580907990-32108-1-git-send-email-harigovi@codeaurora.org>
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: sean@poorly.run, seanpaul@chromium.org,
 Harigovindan P <harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for visionox rm69299 panel.

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---

Changes in v1:
	- Added a compatible string to support sc7180 panel version.
Changes in v2:
	- Removed unwanted properties from description.
	- Creating source files without execute permissions(Rob Herring).
Changes in v3:
	- Changing txt file into yaml

 .../bindings/display/visionox,rm69299.yaml         | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/visionox,rm69299.yaml

diff --git a/Documentation/devicetree/bindings/display/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/visionox,rm69299.yaml
new file mode 100644
index 0000000..bfcd46d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/visionox,rm69299.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/visionox,rm69299.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Visionox model RM69299 Panels Device Tree Bindings
+
+maintainers:
+  - Harigovindan P <harigovi@codeaurora.org>
+  - Kalyan Thota <kalyan_t@codeaurora.org>
+  - Vishnuvardhan Prodduturi <vproddut@codeaurora.org>
+
+description:
+  This binding is for display panels using a Visionox RM692999 panel.
+
+patternProperties:
+  "^(panel|panel-dsi)@[0-9]$":
+    type: object
+    description:
+      A node containing the panel or bridge description as documented in
+      Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
+    properties:
+      compatible:
+        const: visionox,rm69299-1080p-display
+
+      reg:
+        maxItems: 1
+
+      vdda-supply:
+        description:
+          Phandle of the regulator that provides the vdda supply voltage.
+
+      vdd3p3-supply:
+        description:
+          Phandle of the regulator that provides the vdd3p3 supply voltage.
+
+      pinctrl-names:
+        items:
+          - const: default
+          - const: suspend
+
+      pinctrl-0:
+        items:
+          - const: Display default pin
+          - const: Display default pin
+
+      ports:
+        type: object
+        description:
+          A node containing DSI input & output port nodes with endpoint
+          definitions as documented in
+          Documentation/devicetree/bindings/media/video-interfaces.txt
+          Documentation/devicetree/bindings/graph.txt
+        properties:
+          port@0:
+            type: object
+            description:
+              DSI input port node.
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+required:
+  - "#address-cells"
+  - "#size-cells"
+  - compatible
+  - reg
+  - vdda-supply
+  - vdd3p3-supply
+  - pinctrl-names
+  - pinctrl-0
+  - pinctrl-1
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  -
+	dsi@ae94000 {
+		panel@0 {
+			compatible = "visionox,rm69299-1080p-display";
+			reg = <0>;
+
+			vdda-supply = <&src_pp1800_l8c>;
+			vdd3p3-supply = <&src_pp2800_l18a>;
+
+			pinctrl-names = "default", "suspend";
+			pinctrl-0 = <&disp_pins_default>;
+			pinctrl-1 = <&disp_pins_default>;
+
+			reset-gpios = <&pm6150l_gpios 3 0>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					panel0_in: endpoint {
+						remote-endpoint = <&dsi0_out>;
+					};
+				};
+			};
+		};
+	};
+
+...
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
