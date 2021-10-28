Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2D843E071
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 14:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38FF6E955;
	Thu, 28 Oct 2021 12:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 320 seconds by postgrey-1.36 at gabe;
 Thu, 28 Oct 2021 09:42:37 UTC
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B8489D2E
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 09:42:36 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19S9bDZs048274;
 Thu, 28 Oct 2021 04:37:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1635413833;
 bh=4ae0zVkqq/aFKxUoPZd93K2WrRWgz7UqCYL87K3EVqA=;
 h=From:To:CC:Subject:Date;
 b=CbFIU9DU7MaXguaAjI2oOpg4Gt/rXHUdrYSIUHzgri3ktpYs7RhHBJ64Fgruyi0KK
 KAeG9+W9XpjIdZ5fUbxJmZL4vTBCGmFMeVy7T60AnhKzw27awE7SR/8Yj7zJpBTYpd
 W5q8iI0JEIyznluDU1HKtCPns0VVnosSDgzAIaoQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19S9bDUF086498
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 28 Oct 2021 04:37:13 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Oct 2021 04:37:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Oct 2021 04:37:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19S9bBDj058974;
 Thu, 28 Oct 2021 04:37:12 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <devicetree@vger.kernel.org>, <robh+dt@kernel.org>
CC: <airlied@linux.ie>, <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>, 
 <andrey.gusakov@cogentembedded.com>, <vigneshr@ti.com>, <nm@ti.com>,
 Rahul T R <r-ravikumar@ti.com>
Subject: [PATCH] dt-bindings: display: bridge: Convert toshiba,
 tc358767.txt to yaml
Date: Thu, 28 Oct 2021 15:06:56 +0530
Message-ID: <20211028093656.25493-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 28 Oct 2021 12:02:23 +0000
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

Convert toshiba,tc358767.txt binding to yaml format

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---
 .../display/bridge/toshiba,tc358767.txt       |  54 ------
 .../display/bridge/toshiba,tc358767.yaml      | 158 ++++++++++++++++++
 2 files changed, 158 insertions(+), 54 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.txt b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.txt
deleted file mode 100644
index 583c5e9dbe6b..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.txt
+++ /dev/null
@@ -1,54 +0,0 @@
-Toshiba TC358767 eDP bridge bindings
-
-Required properties:
- - compatible: "toshiba,tc358767"
- - reg: i2c address of the bridge, 0x68 or 0x0f, depending on bootstrap pins
- - clock-names: should be "ref"
- - clocks: OF device-tree clock specification for refclk input. The reference
-   clock rate must be 13 MHz, 19.2 MHz, 26 MHz, or 38.4 MHz.
-
-Optional properties:
- - shutdown-gpios: OF device-tree gpio specification for SD pin
-                   (active high shutdown input)
- - reset-gpios: OF device-tree gpio specification for RSTX pin
-                (active low system reset)
- - toshiba,hpd-pin: TC358767 GPIO pin number to which HPD is connected to (0 or 1)
- - ports: the ports node can contain video interface port nodes to connect
-   to a DPI/DSI source and to an eDP/DP sink according to [1][2]:
-    - port@0: DSI input port
-    - port@1: DPI input port
-    - port@2: eDP/DP output port
-
-[1]: Documentation/devicetree/bindings/graph.txt
-[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-	edp-bridge@68 {
-		compatible = "toshiba,tc358767";
-		reg = <0x68>;
-		shutdown-gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&gpio3 24 GPIO_ACTIVE_LOW>;
-		clock-names = "ref";
-		clocks = <&edp_refclk>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@1 {
-				reg = <1>;
-
-				bridge_in: endpoint {
-					remote-endpoint = <&dpi_out>;
-				};
-			};
-
-			port@2 {
-				reg = <2>;
-
-				bridge_out: endpoint {
-					remote-endpoint = <&panel_in>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
new file mode 100644
index 000000000000..f1541cc05297
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/toshiba,tc358767.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC358767 eDP bridge bindings
+
+maintainers:
+  - Andrey Gusakov <andrey.gusakov@cogentembedded.com>
+
+description: The TC358767 is bridge device which converts DSI/DPI to eDP/DP
+
+properties:
+  compatible:
+    const: toshiba,tc358767
+
+  reg:
+    enum:
+      - 0x68
+      - 0x0f
+    description: |
+        i2c address of the bridge, 0x68 or 0x0f, depending on bootstrap pins
+
+  clock-names:
+    const: "ref"
+
+  clocks:
+    maxItems: 1
+    description: |
+        OF device-tree clock specification for refclk input. The reference.
+        clock rate must be 13 MHz, 19.2 MHz, 26 MHz, or 38.4 MHz.
+
+  shutdown-gpios:
+    maxItems: 1
+    description: |
+        OF device-tree gpio specification for SD pin(active high shutdown input)
+
+  reset-gpios:
+    maxItems: 1
+    description: |
+        OF device-tree gpio specification for RSTX pin(active low system reset)
+
+  toshiba,hpd-pin:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0
+      - 1
+    description: TC358767 GPIO pin number to which HPD is connected to (0 or 1)
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+            DSI input port. The remote endpoint phandle should be a
+            reference to a valid DSI output endpoint node
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+            DPI input port. The remote endpoint phandle should be a
+            reference to a valid DPI output endpoint node
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+            eDP/DP output port. The remote endpoint phandle should be a
+            reference to a valid eDP panel input endpoint node. This port is
+            optional, treated as DP panel if not defined
+
+    oneOf:
+      - required:
+          - port@0
+      - required:
+          - port@1
+
+
+required:
+  - compatible
+  - reg
+  - clock-names
+  - clocks
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    /* DPI input and eDP output */
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        edp-bridge@68 {
+            compatible = "toshiba,tc358767";
+            reg = <0x68>;
+            shutdown-gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio3 24 GPIO_ACTIVE_LOW>;
+            clock-names = "ref";
+            clocks = <&edp_refclk>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@1 {
+                    reg = <1>;
+
+                    bridge_in_0: endpoint {
+                        remote-endpoint = <&dpi_out>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    bridge_out: endpoint {
+                        remote-endpoint = <&panel_in>;
+                    };
+                };
+            };
+        };
+    };
+  - |
+    /* DPI input and DP output */
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        edp-bridge@68 {
+            compatible = "toshiba,tc358767";
+            reg = <0x68>;
+            shutdown-gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio3 24 GPIO_ACTIVE_LOW>;
+            clock-names = "ref";
+            clocks = <&edp_refclk>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@1 {
+                    reg = <1>;
+
+                    bridge_in_1: endpoint {
+                        remote-endpoint = <&dpi_out>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.17.1

