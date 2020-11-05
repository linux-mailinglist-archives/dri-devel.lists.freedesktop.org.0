Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A4C2A74CF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 02:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F96B6E973;
	Thu,  5 Nov 2020 01:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602D86E971
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 01:16:11 +0000 (UTC)
IronPort-SDR: LU1NNNs89d7SG9Me8EnDZtxz2DsJ/L8ZTPElFIc4C8PJysyynTeNYe9D3tm2AMZ7x3GG2lVnxw
 QsBeLLlcIYAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="187180155"
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="187180155"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 17:15:58 -0800
IronPort-SDR: LxPsUB1OOIzjBZ2URP5it6+hYSwk5SDbcQ3oaauB5s4+GWT3Eqw3sRaXdXs/yEfszI5oS3WADl
 yJc0rK6V0jvg==
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="471445659"
Received: from pschung-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.255.72.205])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 04 Nov 2020 17:15:58 -0800
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org,
	anitha.chrisanthus@intel.com
Subject: [PATCH v13 1/7] dt-bindings: display: Add support for Intel KeemBay
 Display
Date: Wed,  4 Nov 2020 17:15:25 -0800
Message-Id: <1604538931-26726-2-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604538931-26726-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1604538931-26726-1-git-send-email-anitha.chrisanthus@intel.com>
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

This patch adds bindings for Intel KeemBay Display

v2: review changes from Rob Herring
v3: review changes from Sam Ravnborg (removed mipi dsi entries, and
    encoder entry, connect port to dsi)
    MSSCAM is part of the display submodule and its used to reset LCD
    and MIPI DSI clocks, so its best to be on this device tree.
v4: review changes from Neil Armstrong and Sam - removed msscam
    entries

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh@kernel.org>
---
 .../bindings/display/intel,keembay-display.yaml    | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/intel,keembay-display.yaml

diff --git a/Documentation/devicetree/bindings/display/intel,keembay-display.yaml b/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
new file mode 100644
index 0000000..0a697d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/intel,keembay-display.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Devicetree bindings for Intel Keem Bay display controller
+
+maintainers:
+  - Anitha Chrisanthus <anitha.chrisanthus@intel.com>
+  - Edmond J Dea <edmund.j.dea@intel.com>
+
+properties:
+  compatible:
+    const: intel,keembay-display
+
+  reg:
+    items:
+      - description: LCD registers range
+
+  reg-names:
+    items:
+      - const: lcd
+
+  clocks:
+    items:
+      - description: LCD controller clock
+      - description: pll0 clock
+
+  clock-names:
+    items:
+      - const: clk_lcd
+      - const: clk_pll0
+
+  interrupts:
+    maxItems: 1
+
+  port:
+    type: object
+    description: Display output node to DSI.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    display@20930000 {
+        compatible = "intel,keembay-display";
+        reg = <0x20930000 0x3000>;
+        reg-names = "lcd";
+        interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&scmi_clk 0x83>,
+                 <&scmi_clk 0x0>;
+        clock-names = "clk_lcd", "clk_pll0";
+
+        port {
+            disp_out: endpoint {
+                remote-endpoint = <&dsi_in>;
+            };
+        };
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
