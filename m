Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 272483FE13E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 19:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DC06E214;
	Wed,  1 Sep 2021 17:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 461 seconds by postgrey-1.36 at gabe;
 Wed, 01 Sep 2021 17:39:00 UTC
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA36C6E214
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 17:39:00 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id D9736200D6;
 Wed,  1 Sep 2021 19:31:29 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
To: thierry.reding@gmail.com
Cc: sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 2/2] dt-bindings: display: Add bindings for Novatek NT35950
Date: Wed,  1 Sep 2021 19:31:27 +0200
Message-Id: <20210901173127.998901-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901173127.998901-1-angelogioacchino.delregno@somainline.org>
References: <20210901173127.998901-1-angelogioacchino.delregno@somainline.org>
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

The nt35950 IC from Novatek is a Driver IC used to drive MIPI-DSI panels,
with Static RAM for content retention in command mode and also supports
video mode with VESA Frame Buffer Compression or Display Stream Compression
on single, or dual dsi port(s).
This DDIC is also capable of upscaling an input image to the panel's native
resolution, for example it can upscale a 1920x1080 input to 3840x2160 with
either bilinear interpolation or pixel duplication.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../display/panel/novatek,nt35950.yaml        | 106 ++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
new file mode 100644
index 000000000000..377a05d48a02
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt35950.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT35950-based display panels
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
+
+description: |
+  The nt35950 IC from Novatek is a Driver IC used to drive MIPI-DSI panels,
+  with Static RAM for content retention in command mode and also supports
+  video mode with VESA Frame Buffer Compression or Display Stream Compression
+  on single, or dual dsi port(s).
+  This DDIC is also capable of upscaling an input image to the panel's native
+  resolution, for example it can upscale a 1920x1080 input to 3840x2160 with
+  either bilinear interpolation or pixel duplication.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - sharp,ls055d1sx04
+      - const: novatek,nt35950
+    description: This indicates the panel manufacturer of the panel
+      that is in turn using the NT35950 panel driver. The compatible
+      string determines how the NT35950 panel driver shall be configured
+      to work with the indicated panel. The novatek,nt35950 compatible shall
+      always be provided as a fallback.
+
+  reset-gpios:
+    maxItems: 1
+    description: phandle of gpio for reset line - This should be 8mA, gpio
+      can be configured using mux, pinctrl, pinctrl-names (active high)
+
+  avdd-supply:
+    description: positive boost supply regulator
+  avee-supply:
+    description: negative boost supply regulator
+  dvdd-supply:
+    description: regulator that supplies the digital voltage
+  vddio-supply:
+    description: regulator that supplies the I/O voltage
+
+  backlight: true
+  ports: true
+  reg: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - avdd-supply
+  - avee-supply
+  - dvdd-supply
+  - vddio-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "sharp,ls055d1sx04", "novatek,nt35950";
+            reg = <0>;
+
+            backlight = <&pmi8998_wled>;
+            reset-gpios = <&tlmm 94 GPIO_ACTIVE_HIGH>;
+
+            avdd-supply = <&lab>;
+            avee-supply = <&ibb>;
+            dvdd-supply = <&disp_dvdd_vreg>;
+            vddio-supply = <&vreg_l14a_1p85>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    panel_in0: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    panel_in1: endpoint {
+                        remote-endpoint = <&dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...
-- 
2.32.0

