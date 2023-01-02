Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 256CC65AF6E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 11:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A1A10E2F1;
	Mon,  2 Jan 2023 10:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88F510E2F1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 10:18:44 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 302A9omW058418;
 Mon, 2 Jan 2023 04:09:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1672654190;
 bh=RLrpOswnN3dRdOhVR91SjPDzJmwC8rilVpTB0hj7pnw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=SjlkLtK9ZTHkzCdUNm9xrN72++9UN4kMokPbwd762BNsUzLem++Maziz8q7Qdtjon
 J+aiaHI16/+8YJLGAY00lZrbzaZWZs5T4+6sdI8o3Tf94/4CjNZ3UBSS7Tlbi+Gqqf
 g+scFwWy/Y0LXEoLfxDNz7IR1R80y/QM0hs16LFA=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 302A9oAf112066
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 2 Jan 2023 04:09:50 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 2
 Jan 2023 04:09:50 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 2 Jan 2023 04:09:50 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 302A9mjD031925;
 Mon, 2 Jan 2023 04:09:49 -0600
From: Rahul T R <r-ravikumar@ti.com>
To: <dri-devel@lists.freedesktop.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 1/5] dt-bindings: display: bridge: Convert cdns,
 dsi.txt to yaml
Date: Mon, 2 Jan 2023 15:39:38 +0530
Message-ID: <20230102100942.1828-2-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102100942.1828-1-r-ravikumar@ti.com>
References: <20230102100942.1828-1-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: mparab@cadence.com, a-bhatia1@ti.com, jonas@kwiboo.se, airlied@linux.ie,
 jpawar@cadence.com, narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, vigneshr@ti.com, devicetree@vger.kernel.org,
 robert.foss@linaro.org, andrzej.hajda@intel.com, sjakhade@cadence.com,
 lee.jones@linaro.org, Rahul T R <r-ravikumar@ti.com>,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert cdns,dsi.txt binding to yaml format

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/bridge/cdns,dsi.txt      | 112 -------------
 .../bindings/display/bridge/cdns,dsi.yaml     | 157 ++++++++++++++++++
 2 files changed, 157 insertions(+), 112 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
deleted file mode 100644
index 525a4bfd8634..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
+++ /dev/null
@@ -1,112 +0,0 @@
-Cadence DSI bridge
-==================
-
-The Cadence DSI bridge is a DPI to DSI bridge supporting up to 4 DSI lanes.
-
-Required properties:
-- compatible: should be set to "cdns,dsi".
-- reg: physical base address and length of the controller's registers.
-- interrupts: interrupt line connected to the DSI bridge.
-- clocks: DSI bridge clocks.
-- clock-names: must contain "dsi_p_clk" and "dsi_sys_clk".
-- phys: phandle link to the MIPI D-PHY controller.
-- phy-names: must contain "dphy".
-- #address-cells: must be set to 1.
-- #size-cells: must be set to 0.
-
-Optional properties:
-- resets: DSI reset lines.
-- reset-names: can contain "dsi_p_rst".
-
-Required subnodes:
-- ports: Ports as described in Documentation/devicetree/bindings/graph.txt.
-  2 ports are available:
-  * port 0: this port is only needed if some of your DSI devices are
-	    controlled through  an external bus like I2C or SPI. Can have at
-	    most 4 endpoints. The endpoint number is directly encoding the
-	    DSI virtual channel used by this device.
-  * port 1: represents the DPI input.
-  Other ports will be added later to support the new kind of inputs.
-
-- one subnode per DSI device connected on the DSI bus. Each DSI device should
-  contain a reg property encoding its virtual channel.
-
-Example:
-	dsi0: dsi@fd0c0000 {
-		compatible = "cdns,dsi";
-		reg = <0x0 0xfd0c0000 0x0 0x1000>;
-		clocks = <&pclk>, <&sysclk>;
-		clock-names = "dsi_p_clk", "dsi_sys_clk";
-		interrupts = <1>;
-		phys = <&dphy0>;
-		phy-names = "dphy";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@1 {
-				reg = <1>;
-				dsi0_dpi_input: endpoint {
-					remote-endpoint = <&xxx_dpi_output>;
-				};
-			};
-		};
-
-		panel: dsi-dev@0 {
-			compatible = "<vendor,panel>";
-			reg = <0>;
-		};
-	};
-
-or
-
-	dsi0: dsi@fd0c0000 {
-		compatible = "cdns,dsi";
-		reg = <0x0 0xfd0c0000 0x0 0x1000>;
-		clocks = <&pclk>, <&sysclk>;
-		clock-names = "dsi_p_clk", "dsi_sys_clk";
-		interrupts = <1>;
-		phys = <&dphy1>;
-		phy-names = "dphy";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				dsi0_output: endpoint@0 {
-					reg = <0>;
-					remote-endpoint = <&dsi_panel_input>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-				dsi0_dpi_input: endpoint {
-					remote-endpoint = <&xxx_dpi_output>;
-				};
-			};
-		};
-	};
-
-	i2c@xxx {
-		panel: panel@59 {
-			compatible = "<vendor,panel>";
-			reg = <0x59>;
-
-			port {
-				dsi_panel_input: endpoint {
-					remote-endpoint = <&dsi0_output>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
new file mode 100644
index 000000000000..3161c33093c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
@@ -0,0 +1,157 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/cdns,dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence DSI bridge
+
+maintainers:
+  - Boris Brezillon <boris.brezillon@bootlin.com>
+
+description: |
+   CDNS DSI is a bridge device which converts DPI to DSI
+
+properties:
+  compatible:
+    enum:
+      - cdns,dsi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PSM clock, used by the IP
+      - description: sys clock, used by the IP
+
+  clock-names:
+    items:
+      - const: dsi_p_clk
+      - const: dsi_sys_clk
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: dphy
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: dsi_p_rst
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port representing the DSI output. It can have
+          at most 4 endpoints. The endpoint number is directly encoding
+          the DSI virtual channel used by this device.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port representing the DPI input.
+
+    required:
+      - port@1
+
+allOf:
+  - $ref: ../dsi-controller.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dsi@fd0c0000 {
+            compatible = "cdns,dsi";
+            reg = <0x0 0xfd0c0000 0x0 0x1000>;
+            clocks = <&pclk>, <&sysclk>;
+            clock-names = "dsi_p_clk", "dsi_sys_clk";
+            interrupts = <1>;
+            phys = <&dphy0>;
+            phy-names = "dphy";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@1 {
+                    reg = <1>;
+                    endpoint {
+                        remote-endpoint = <&xxx_dpi_output>;
+                    };
+                };
+            };
+
+            panel@0 {
+                compatible = "panasonic,vvx10f034n00";
+                reg = <0>;
+                power-supply = <&vcc_lcd_reg>;
+            };
+        };
+    };
+
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dsi@fd0c0000 {
+            compatible = "cdns,dsi";
+            reg = <0x0 0xfd0c0000 0x0 0x1000>;
+            clocks = <&pclk>, <&sysclk>;
+            clock-names = "dsi_p_clk", "dsi_sys_clk";
+            interrupts = <1>;
+            phys = <&dphy1>;
+            phy-names = "dphy";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    endpoint@0 {
+                        reg = <0>;
+                        remote-endpoint = <&dsi_panel_input>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    endpoint {
+                        remote-endpoint = <&xxx_dpi_output>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.39.0

