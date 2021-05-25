Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A236390023
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 13:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06936E9F6;
	Tue, 25 May 2021 11:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541F96E9FA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 11:39:00 +0000 (UTC)
Received: from localhost.localdomain (83.6.168.54.neoplus.adsl.tpnet.pl
 [83.6.168.54])
 by m-r1.th.seeweb.it (Postfix) with ESMTPA id EBE2520425;
 Tue, 25 May 2021 13:31:12 +0200 (CEST)
From: Konrad Dybcio <konrad.dybcio@somainline.org>
To: ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 1/2] dt-bindings: Add SONY Synaptics JDI panel
Date: Tue, 25 May 2021 13:31:02 +0200
Message-Id: <20210525113105.52990-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.31.1
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 jamipkettunen@somainline.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, martin.botka@somainline.org,
 dri-devel@lists.freedesktop.org, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for the SONY Synaptics JDI panel used in
Xperia X, X Performance, X Compact, XZ and XZs smartphones.

Due to the nature of phone manufacturing and lack of any docs
whatsoever, replacement names have been used to indicate the
devices that this panel is used on.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../display/panel/sony,synaptics-jdi.yaml     | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sony,synaptics-jdi.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sony,synaptics-jdi.yaml b/Documentation/devicetree/bindings/display/panel/sony,synaptics-jdi.yaml
new file mode 100644
index 000000000000..81d841c049e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sony,synaptics-jdi.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sony,synaptics-jdi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SONY Synaptics JDI panel
+
+maintainers:
+  - Konrad Dybcio <konrad.dybcio@somainline.org>
+
+description: |+
+  This panel seems to only be found in SONY Xperia
+  X, X Performance, X Compact, XZ and XZs
+  smartphones and we have no straightforward way of
+  actually getting the correct model number,
+  as no schematics are released publicly.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - sony,synaptics-jdi-dora
+          - sony,synaptics-jdi-kagura
+          - sony,synaptics-jdi-keyaki
+          - sony,synaptics-jdi-kugo
+          - sony,synaptics-jdi-suzu
+
+  reg: true
+
+  reset-gpios: true
+
+  avdd-supply:
+    description: avdd supply
+
+  vddio-supply:
+    description: vddio supply
+
+  vsn-supply:
+    description: voltage negative supply
+
+  vsp-supply:
+    description: voltage positive supply
+
+  tvdd-supply:
+    description: tvdd supply
+
+  preset-gpio:
+    description: panel reset pin
+
+  pvddio-gpio:
+    description: panel vddio pin
+
+  treset-gpio:
+    description: touch reset pin
+
+required:
+  - compatible
+  - reg
+  - preset-gpio
+  - pvddio-gpio
+  - treset-gpio
+  - avdd-supply
+  - vddio-supply
+  - vsn-supply
+  - vsp-supply
+  - tvdd-supply
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
+            panel: panel@0 {
+                    reg = <0>;
+
+                    pvddio-gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
+                    preset-gpio = <&tlmm 8 GPIO_ACTIVE_HIGH>;
+                    treset-gpio = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+
+                    vddio-supply = <&pm8994_s4>;
+                    avdd-supply = <&pm8994_l2>;
+                    tvdd-supply = <&panel_tvdd>;
+
+                    backlight = <&pmi8994_wled>;
+
+                    port {
+                      panel_in: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                      };
+                    };
+            };
+    };
-- 
2.31.1

