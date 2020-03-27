Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A83195283
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 09:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F326E9C4;
	Fri, 27 Mar 2020 08:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2279D6E9BA;
 Fri, 27 Mar 2020 07:36:55 +0000 (UTC)
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 27 Mar 2020 13:06:52 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
 by ironmsg01-blr.qualcomm.com with ESMTP; 27 Mar 2020 13:06:40 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id 7729D2973; Fri, 27 Mar 2020 13:06:39 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v10 1/2] dt-bindings: display: add visionox rm69299 panel
 variant
Date: Fri, 27 Mar 2020 13:06:35 +0530
Message-Id: <20200327073636.13823-2-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200327073636.13823-1-harigovi@codeaurora.org>
References: <20200327073636.13823-1-harigovi@codeaurora.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Mar 2020 08:03:27 +0000
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
Changes in v6:
    - Removing patternProperties.
    - Added " |" after description.
    - Setting port and reset-gpios to true.
    - Removing @ae94000 for dsi node.
Changes in v7:
    - Added reg property.
Changes in v8:
    - Rearranged additionalProperties.
    - Dropping improper reg property.
Changes in v9:
    - Adding additionalProperties at the same level as
      'properties'
    - Adding properties for "ports" which includes:
      -> #address-cells
      -> #size-cells
      -> port@0
Changes in v10:
   - Changed file mode
   - Making port as required
   - Fixing example by removing ports and unit address in port
   - Removing indentation for 'additionalProperties'

 .../display/panel/visionox,rm69299.yaml       | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
new file mode 100644
index 000000000000..1a44caae5f9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
@@ -0,0 +1,58 @@
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
+properties:
+  compatible:
+    const: visionox,rm69299-1080p-display
+
+  vdda-supply:
+    description: |
+      Phandle of the regulator that provides the vdda supply voltage.
+
+  vdd3p3-supply:
+    description: |
+      Phandle of the regulator that provides the vdd3p3 supply voltage.
+
+  port: true
+
+  reset-gpios: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - vdda-supply
+  - vdd3p3-supply
+  - reset-gpios
+  - port
+
+examples:
+  - |
+    panel {
+        compatible = "visionox,rm69299-1080p-display";
+
+        vdda-supply = <&src_pp1800_l8c>;
+        vdd3p3-supply = <&src_pp2800_l18a>;
+
+        reset-gpios = <&pm6150l_gpio 3 0>;
+        port {
+            panel0_in: endpoint {
+                remote-endpoint = <&dsi0_out>;
+            };
+        };
+    };
+...
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
