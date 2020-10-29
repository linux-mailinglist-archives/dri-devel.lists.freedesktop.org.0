Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A160C29F6D2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 22:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEB76E907;
	Thu, 29 Oct 2020 21:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB236E907
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 21:28:50 +0000 (UTC)
IronPort-SDR: B/IxZyHInvxQLoGETMIitMamak/ulFLdtKofAHoj/bd/cPC4csTgAbAbcfXzbaU25uwi2ZnVRW
 8vzSYeRSP6qA==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="165928995"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="165928995"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 14:28:50 -0700
IronPort-SDR: p895hK9yHECY7z3KnUbvFi2n3alb8ZGyAGaPo9/SU5uI0JfPcspmM4S2sFPnY5K0AKEe+V0Vpl
 fqph+oTpBi/A==
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="469282828"
Received: from nschweme-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.34.96])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 29 Oct 2020 14:28:49 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org,
	anitha.chrisanthus@intel.com
Subject: [PATCH v10 2/6] dt-bindings: display: bridge: Intel KeemBay DSI
Date: Thu, 29 Oct 2020 14:27:53 -0700
Message-Id: <1604006877-20092-3-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604006877-20092-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1604006877-20092-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: edmund.j.dea@intel.com, sam@ravnborg.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for Intel KeemBay MIPI DSI

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 .../bindings/display/bridge/intel,keembay-dsi.yaml | 101 +++++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml
new file mode 100644
index 0000000..4cef64e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/intel,keembay-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Devicetree bindings for Intel Keem Bay mipi dsi controller
+
+maintainers:
+  - Anitha Chrisanthus <anitha.chrisanthus@intel.com>
+  - Edmond J Dea <edmund.j.dea@intel.com>
+
+properties:
+  compatible:
+    const: intel,keembay-dsi
+
+  reg:
+    items:
+      - description: MIPI registers range
+
+  reg-names:
+    items:
+      - const: mipi
+
+  clocks:
+    items:
+      - description: MIPI DSI clock
+      - description: MIPI DSI econfig clock
+      - description: MIPI DSI config clock
+
+  clock-names:
+    items:
+      - const: clk_mipi
+      - const: clk_mipi_ecfg
+      - const: clk_mipi_cfg
+
+  ports:
+    type: object
+
+    properties:
+      '#address-cells':
+       const: 1
+
+      '#size-cells':
+       const: 0
+
+      port@0:
+        type: object
+        description: MIPI DSI input port.
+
+      port@1:
+        type: object
+        description: DSI output port to adv7535.
+
+    required:
+      - port@0
+      - port@1
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    mipi-dsi@20900000 {
+        compatible = "intel,keembay-dsi";
+        reg = <0x20900000 0x4000>;
+        reg-names = "mipi";
+        clocks = <&scmi_clk 0x86>,
+                 <&scmi_clk 0x88>,
+                 <&scmi_clk 0x89>;
+        clock-names = "clk_mipi", "clk_mipi_ecfg",
+                      "clk_mipi_cfg";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dsi_in: endpoint {
+                    remote-endpoint = <&disp_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dsi_out: endpoint {
+                    remote-endpoint = <&adv7535_input>;
+                };
+            };
+        };
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
