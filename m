Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0B72A5A85
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 00:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801616E909;
	Tue,  3 Nov 2020 23:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD5F6E90A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 23:27:09 +0000 (UTC)
IronPort-SDR: 7nd6gtMXi59tw1ZNwVG/FGEJSZ7/fip8NJ+TGeIZQ0ad+qDxKZodbbRJb+GEaFBI/J82vMzTAS
 qzlXWB8hmftQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="166550714"
X-IronPort-AV: E=Sophos;i="5.77,449,1596524400"; d="scan'208";a="166550714"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 15:27:09 -0800
IronPort-SDR: SCzb4M09SSmjBm0x99IQje7b5PUf44OnJl0X8Q7ngKvRudw8s6n5CDdXDHdbc3Hz665n9i/ZxD
 4eEjMRS8uJ/Q==
X-IronPort-AV: E=Sophos;i="5.77,449,1596524400"; d="scan'208";a="528679726"
Received: from adamreyx-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.36.83])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 03 Nov 2020 15:26:47 -0800
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org,
	anitha.chrisanthus@intel.com
Subject: [PATCH v12 3/7] dt-bindings: display: bridge: Intel KeemBay DSI
Date: Tue,  3 Nov 2020 15:26:14 -0800
Message-Id: <1604445978-14924-4-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604445978-14924-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1604445978-14924-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: edmund.j.dea@intel.com, sam@ravnborg.org, narmstrong@baylibre.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for Intel KeemBay MIPI DSI

v2: corrected description for port

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh@kernel.org>
---
 .../bindings/display/bridge/intel,keembay-dsi.yaml | 101 +++++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml
new file mode 100644
index 0000000..ab5be26
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
+        description: DSI output port.
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
