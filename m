Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF7917DA70
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 09:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52466E2C4;
	Mon,  9 Mar 2020 08:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DE86E10A;
 Mon,  9 Mar 2020 05:23:26 +0000 (UTC)
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 09 Mar 2020 10:53:20 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
 by ironmsg01-blr.qualcomm.com with ESMTP; 09 Mar 2020 10:53:08 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id D7D5625B6; Mon,  9 Mar 2020 10:53:06 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: display: add visionox rm69299 panel
 variant
Date: Mon,  9 Mar 2020 10:53:03 +0530
Message-Id: <20200309052304.23427-2-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200309052304.23427-1-harigovi@codeaurora.org>
References: <20200309052304.23427-1-harigovi@codeaurora.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Mar 2020 08:13:37 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for visionox rm69299 panel.

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---

Changes in v2:
	- Removed unwanted properties from description.
	- Creating source files without execute permissions(Rob Herring).
Changes in v3:
	- Changing txt file into yaml
Changes in v4:
	- Updating license identifier.
	- Moving yaml file inside panel directory.
	- Removing pinctrl entries.
	- Adding documentation for reset-gpios.
Changes in v5:
	- No changes. Updated 2/2 Patch.

 .../display/panel/visionox,rm69299.yaml       | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
new file mode 100755
index 000000000000..052d87f8fadd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/visionox,rm69299.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Visionox model RM69299 Panels Device Tree Bindings.
+
+maintainers:
+ - Harigovindan P <harigovi@codeaurora.org>
+
+description: |
+ This binding is for display panels using a Visionox RM692999 panel.
+
+allOf:
+ - $ref: panel-common.yaml#
+
+patternProperties:
+  "^(panel|panel-dsi)@[0-9]$":
+    type: object
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
+      reset-gpios:
+        description:
+          a GPIO spec for the reset pin.
+
+required:
+  - compatible
+  - reg
+  - vdda-supply
+  - vdd3p3-supply
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+- |
+    dsi@ae94000 {
+        panel@0 {
+            compatible = "visionox,rm69299-1080p-display";
+
+            vdda-supply = <&src_pp1800_l8c>;
+            vdd3p3-supply = <&src_pp2800_l18a>;
+
+            reset-gpios = <&pm6150l_gpio 3 0>;
+            ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    port@0 {
+                            reg = <0>;
+                            panel0_in: endpoint {
+                                remote-endpoint = <&dsi0_out>;
+                            };
+                    };
+            };
+        };
+    };
+...
+
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
