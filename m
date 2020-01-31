Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 456B714EB8F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 12:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D3C6FAFE;
	Fri, 31 Jan 2020 11:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C216FAFE
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 11:15:22 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00VBFBH2085199;
 Fri, 31 Jan 2020 05:15:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1580469311;
 bh=BdpuZjoq6e26Vd2QRkcbX3snICg0iYFLr814nhpi3XQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=G8zk6p5vdW2ldiN4NLj4eZzY5dCW+lQ0Wrt8/3i6+G0YorvsVlGZZpL0OuSQT/dDh
 polUClIgSOTtOQtMUX7FWzw8eqLp27DK/g7STVNRIfwGc0NoF5XzjmFtN+JDBw0xzG
 J3t/vFXqZl8FVtnknUdpKHxn7SKafkXULUJ8jv3E=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00VBFBF6078748
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 31 Jan 2020 05:15:11 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 31
 Jan 2020 05:15:11 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 31 Jan 2020 05:15:11 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VBF4Ej026862;
 Fri, 31 Jan 2020 05:15:08 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>, <narmstrong@baylibre.com>
Subject: [PATCH v4 1/2] dt-bindings: display: bridge: Add documentation for
 Toshiba tc358768
Date: Fri, 31 Jan 2020 13:15:52 +0200
Message-ID: <20200131111553.472-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200131111553.472-1-peter.ujfalusi@ti.com>
References: <20200131111553.472-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ti.com, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TC358768/TC358778 is a Parallel RGB to MIPI DSI bridge.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 .../display/bridge/toshiba,tc358768.yaml      | 159 ++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
new file mode 100644
index 000000000000..c036a75db8f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
@@ -0,0 +1,159 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/toshiba,tc358768.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toschiba TC358768/TC358778 Parallel RGB to MIPI DSI bridge
+
+maintainers:
+  - Peter Ujfalusi <peter.ujfalusi@ti.com>
+
+description: |
+  The TC358768/TC358778 is bridge device which converts RGB to DSI.
+
+properties:
+  compatible:
+    enum:
+      - toshiba,tc358768
+      - toshiba,tc358778
+
+  reg:
+    maxItems: 1
+    description: base I2C address of the device
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to active low RESX pin
+
+  vddc-supply:
+    description: Regulator for 1.2V internal core power.
+
+  vddmipi-supply:
+    description: Regulator for 1.2V for the MIPI.
+
+  vddio-supply:
+    description: Regulator for 1.8V - 3.3V IO power.
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: refclk
+
+  ports:
+    type: object
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        type: object
+        additionalProperties: false
+
+        description: |
+          Video port for RGB input
+
+        properties:
+          reg:
+            const: 0
+
+        patternProperties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              data-lines:
+                enum: [ 16, 18, 24 ]
+
+              remote-endpoint: true
+
+        required:
+          - reg
+
+      port@1:
+        type: object
+        additionalProperties: false
+
+        description: |
+          Video port for DSI output (panel or connector).
+
+        properties:
+          reg:
+            const: 1
+
+        patternProperties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint: true
+
+        required:
+          - reg
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - vddc-supply
+  - vddmipi-supply
+  - vddio-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c1 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      dsi_bridge: dsi-bridge@e {
+        compatible = "toshiba,tc358768";
+        reg = <0xe>;
+
+        clocks = <&tc358768_refclk>;
+        clock-names = "refclk";
+
+        reset-gpios = <&pcf_display_board 0 GPIO_ACTIVE_LOW>;
+
+        vddc-supply = <&v1_2d>;
+        vddmipi-supply = <&v1_2d>;
+        vddio-supply = <&v3_3d>;
+
+        dsi_bridge_ports: ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            rgb_in: endpoint {
+              remote-endpoint = <&dpi_out>;
+              data-lines = <24>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+            dsi_out: endpoint {
+              remote-endpoint = <&lcd_in>;
+            };
+          };
+        };
+      };
+    };
+    
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
