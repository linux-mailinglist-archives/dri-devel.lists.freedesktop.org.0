Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CDA5F115D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 20:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB29610ED81;
	Fri, 30 Sep 2022 18:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DED10ED81
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 18:08:34 +0000 (UTC)
Received: from localhost.localdomain (95.49.31.201.neoplus.adsl.tpnet.pl
 [95.49.31.201])
 by m-r2.th.seeweb.it (Postfix) with ESMTPA id 300D53F342;
 Fri, 30 Sep 2022 20:08:30 +0200 (CEST)
From: Konrad Dybcio <konrad.dybcio@somainline.org>
To: ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v3 1/2] dt-bindings: display/panel: Add Sony Tama TD4353 JDI
 display panel
Date: Fri, 30 Sep 2022 20:08:10 +0200
Message-Id: <20220930180812.32210-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.37.3
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, jamipkettunen@somainline.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 martin.botka@somainline.org, dri-devel@lists.freedesktop.org,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for the display panel used on some Sony Xperia XZ2 and XZ2
Compact smartphones.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Changes since v2:
- preset -> panel-reset
- treset -> touch-reset
 .../display/panel/sony,td4353-jdi.yaml        | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml b/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
new file mode 100644
index 000000000000..b6b885b4c22d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sony,td4353-jdi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony TD4353 JDI 5 / 5.7" 2160x1080 MIPI-DSI Panel
+
+maintainers:
+  - Konrad Dybcio <konrad.dybcio@somainline.org>
+
+description: |
+  The Sony TD4353 JDI is a 5 (XZ2c) / 5.7 (XZ2) inch 2160x1080
+  MIPI-DSI panel, used in Xperia XZ2 and XZ2 Compact smartphones.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sony,td4353-jdi-tama
+
+  reg: true
+
+  backlight: true
+
+  vddio-supply:
+    description: VDDIO 1.8V supply
+
+  vsp-supply:
+    description: Positive 5.5V supply
+
+  vsn-supply:
+    description: Negative 5.5V supply
+
+  panel-reset-gpios:
+    description: Display panel reset pin
+
+  touch-reset-gpios:
+    description: Touch panel reset pin
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - vsp-supply
+  - vsn-supply
+  - panel-reset-gpios
+  - touch-reset-gpios
+  - port
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
+
+        panel: panel@0 {
+            compatible = "sony,td4353-jdi-tama";
+            reg = <0>;
+
+            backlight = <&pmi8998_wled>;
+            vddio-supply = <&vreg_l14a_1p8>;
+            vsp-supply = <&lab>;
+            vsn-supply = <&ibb>;
+            panel-reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+            touch-reset-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+...
-- 
2.37.3

