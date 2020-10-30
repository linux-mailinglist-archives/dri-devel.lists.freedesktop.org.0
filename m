Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5474129FFCD
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44F26E997;
	Fri, 30 Oct 2020 08:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E906E949
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 03:08:12 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id A89B7DF87E;
 Fri, 30 Oct 2020 03:05:53 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id c_9sNn2-j_t5; Fri, 30 Oct 2020 03:05:52 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 8A5F9DF9C8;
 Fri, 30 Oct 2020 03:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id GXnGmoeApl_U; Fri, 30 Oct 2020 03:05:52 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 74427DF6FB;
 Fri, 30 Oct 2020 03:05:51 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v6 1/2] dt-bindings: display: himax,
 hx8837: Add Himax HX8837 bindings
Date: Fri, 30 Oct 2020 04:07:59 +0100
Message-Id: <20201030030800.1036888-2-lkundrak@v3.sk>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030030800.1036888-1-lkundrak@v3.sk>
References: <20201030030800.1036888-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Himax HX8837 is a secondary display controller used to drive the panel
on OLPC platforms.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Reviewed-by: Rob Herring <robh@kernel.org>

---
Changes since v4:
- Rob's Reviewed-by

Changes since v3:
- Moved to bindings/display/
- Added the ports
- Converted to YAML
- Removed Pavel's Ack, because the changes are substantial

Changes since v2:
- s/betweend/between/

Changes since v1:
- s/load-gpio/load-gpios/
- Use interrupt bindings instead of gpio for the IRQ

 .../bindings/display/bridge/himax,hx8837.yaml | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/himax,hx8837.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/himax,hx8837.yaml b/Documentation/devicetree/bindings/display/bridge/himax,hx8837.yaml
new file mode 100644
index 0000000000000..f5b0a00f5089d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/himax,hx8837.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2018,2019,2020 Lubomir Rintel <lkundrak@v3.sk>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/himax,hx8837.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HX8837 Display Controller Device Tree Bindings
+
+maintainers:
+  - Lubomir Rintel <lkundrak@v3.sk>
+
+properties:
+  compatible:
+    const: himax,hx8837
+
+  reg:
+    const: 0xd
+
+  load-gpios:
+    maxItems: 1
+    description: GPIO specifier of DCON_LOAD pin (active high)
+
+  stat-gpios:
+    minItems: 2
+    description: GPIO specifier of DCON_STAT0 and DCON_STAT1 pins (active high)
+
+  interrupts:
+    maxItems: 1
+    description: Interrupt specifier of DCON_IRQ pin (edge falling)
+
+  ports:
+    type: object
+
+    properties:
+      port@0:
+        type: object
+        description: |
+          Video port for RGB input.
+
+      port@1:
+        type: object
+        description: |
+          Video port connected to the panel.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - load-gpios
+  - stat-gpios
+  - interrupts
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        
+        lcd-controller@d {
+            compatible = "himax,hx8837";
+            reg = <0x0d>;
+            stat-gpios = <&gpio 100 GPIO_ACTIVE_HIGH>,
+                         <&gpio 101 GPIO_ACTIVE_HIGH>;
+            load-gpios = <&gpio 142 GPIO_ACTIVE_HIGH>;
+            interrupts = <&gpio 124 IRQ_TYPE_EDGE_FALLING>;
+    
+            ports {
+                #address-cells = <0x01>;
+                #size-cells = <0x00>;
+    
+                port@0 {
+                    reg = <0x00>;
+                    dcon_rgb_in: endpoint {
+                        remote-endpoint = <&lcd0_rgb_out>;
+                    };
+                };
+    
+                port@1 {
+                    reg = <0x01>;
+                    dcon_gettl_out: endpoint {
+                        remote-endpoint = <&panel_dettl_in>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
