Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7722F74A8
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB99689DA7;
	Fri, 15 Jan 2021 08:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5144D89DFC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 17:50:28 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 9790B3EA59;
 Thu, 14 Jan 2021 18:50:25 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
To: thierry.reding@gmail.com
Subject: [PATCH 2/2] dt-bindings: display: Document BOE BF060Y8M-AJ0 panel
 compatible
Date: Thu, 14 Jan 2021 18:50:24 +0100
Message-Id: <20210114175024.399756-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114175024.399756-1-angelogioacchino.delregno@somainline.org>
References: <20210114175024.399756-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 15 Jan 2021 08:55:00 +0000
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, martin.botka@somainline.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 marijn.suijten@somainline.org, phone-devel@vger.kernel.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the boe,bf060y8m-aj0 panel.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../display/panel/boe,bf060y8m-aj0.yaml       | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,bf060y8m-aj0.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/boe,bf060y8m-aj0.yaml b/Documentation/devicetree/bindings/display/panel/boe,bf060y8m-aj0.yaml
new file mode 100644
index 000000000000..0fba09ddb6a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,bf060y8m-aj0.yaml
@@ -0,0 +1,67 @@
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
+  reg: true
+  reset-gpios: true
+  vcc-supply:
+    description: Core (TSP) voltage supply (2.70-3.60V)
+  vddio-supply:
+    description: I/O voltage supply (1.62-1.98V)
+  vci-supply:
+    description: DriverIC Operation supply (2.60-3.60V)
+  elvdd-supply:
+    description: EL Driving positive (VDD) supply (4.40-4.80V)
+  elvss-supply:
+    description: EL Driving negative (VSS) supply (-5.00V to -1.40V)
+
+required:
+  - compatible
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
+            #address-cells = <1>;
+            #size-cells = <0>;
+            panel@0 {
+                    compatible = "boe,bf060y8m,aj0";
+                    reg = <0>;
+
+                    vcc-supply = <&disp_vcc_vreg>;
+                    vddio-supply = <&disp_vddio_vreg>;
+                    vci-supply = <&disp_vci_vreg>;
+                    elvdd-supply = <&disp_elvdd_vreg>;
+                    elvss-supply = <&disp_elvss_vreg>;
+
+                    reset-gpios = <&tlmm 94 GPIO_ACTIVE_HIGH>;
+            };
+    };
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
