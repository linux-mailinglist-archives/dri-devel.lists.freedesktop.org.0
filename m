Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764403FE147
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 19:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4026E21C;
	Wed,  1 Sep 2021 17:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676E76E21C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 17:39:37 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 947653F347;
 Wed,  1 Sep 2021 19:31:17 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
To: thierry.reding@gmail.com
Cc: sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 2/2] dt-bindings: display: Document BOE BF060Y8M-AJ0 panel
 compatible
Date: Wed,  1 Sep 2021 19:31:15 +0200
Message-Id: <20210901173115.998628-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901173115.998628-1-angelogioacchino.delregno@somainline.org>
References: <20210901173115.998628-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the boe,bf060y8m-aj0 panel.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../display/panel/boe,bf060y8m-aj0.yaml       | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,bf060y8m-aj0.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/boe,bf060y8m-aj0.yaml b/Documentation/devicetree/bindings/display/panel/boe,bf060y8m-aj0.yaml
new file mode 100644
index 000000000000..a8f3afa922c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,bf060y8m-aj0.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/boe,bf060y8m-aj0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BOE BF060Y8M-AJ0 5.99" 1080x2160 AMOLED Panel
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
+
+description: |
+  This is a 5.99" 1080x2160 16.7M Color active matrix AMOLED
+  video mode panel module on MIPI-DSI 4-Lane interface, GGRB
+  pixel arrangement, 63 micrometers pitch, with an active
+  area of 68.04 x 136.08 millimeters.
+  Each pixel is divided into red and green dots, or blue and
+  green dots, and two pixels share red or blue dots which are
+  arranged in vertical stripe.
+  The DriverIC for this panel module is SW43404.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: boe,bf060y8m-aj0
+
+  elvdd-supply:
+    description: EL Driving positive (VDD) supply (4.40-4.80V)
+  elvss-supply:
+    description: EL Driving negative (VSS) supply (-5.00V to -1.40V)
+  vcc-supply:
+    description: Core (TSP) voltage supply (2.70-3.60V)
+  vci-supply:
+    description: DriverIC Operation supply (2.60-3.60V)
+  vddio-supply:
+    description: I/O voltage supply (1.62-1.98V)
+
+  port: true
+  reg: true
+  reset-gpios: true
+
+required:
+  - compatible
+  - elvdd-supply
+  - elvss-supply
+  - vcc-supply
+  - vci-supply
+  - vddio-supply
+  - reg
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "boe,bf060y8m-aj0";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 94 GPIO_ACTIVE_HIGH>;
+
+            vcc-supply = <&disp_vcc_vreg>;
+            vddio-supply = <&disp_vddio_vreg>;
+            vci-supply = <&disp_vci_vreg>;
+            elvdd-supply = <&disp_elvdd_vreg>;
+            elvss-supply = <&disp_elvss_vreg>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
-- 
2.32.0

