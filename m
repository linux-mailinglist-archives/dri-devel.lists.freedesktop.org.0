Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1377309BAB
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 12:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9EB6E24D;
	Sun, 31 Jan 2021 11:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE2E6E09A
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 18:10:24 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DSj1B237sz1qrg9;
 Sat, 30 Jan 2021 19:10:22 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DSj1B18STz1tYTW;
 Sat, 30 Jan 2021 19:10:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id AyVOjtfBXXVS; Sat, 30 Jan 2021 19:10:20 +0100 (CET)
X-Auth-Info: l9tz3IwHnR7ol2YSdAVe1iHdlvPABt/QJq2F4Cka6hU=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 30 Jan 2021 19:10:20 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add TI SN65DSI83
 bindings
Date: Sat, 30 Jan 2021 19:10:13 +0100
Message-Id: <20210130181014.161457-1-marex@denx.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 31 Jan 2021 11:43:06 +0000
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DT binding document for TI SN65DSI83 DSI to LVDS bridge.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
 .../bindings/display/bridge/ti,sn65dsi83.yaml | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
new file mode 100644
index 000000000000..77e1bafd8cd8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SN65DSI83 DSI to LVDS bridge chip
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+description: |
+  The Texas Instruments SN65DSI83 bridge takes MIPI DSI in and outputs LVDS.
+  https://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=sn65dsi83&fileType=pdf
+
+properties:
+  compatible:
+    const: ti,sn65dsi83
+
+  reg:
+    const: 0x2d
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO specifier for bridge_en pin (active high).
+
+  ports:
+    type: object
+    additionalProperties: false
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
+        description:
+          Video port for MIPI DSI input
+
+        properties:
+          reg:
+            const: 0
+
+          endpoint:
+            type: object
+            additionalProperties: false
+            properties:
+              remote-endpoint: true
+              data-lanes:
+                description: array of physical DSI data lane indexes.
+
+        required:
+          - reg
+
+      port@1:
+        type: object
+        additionalProperties: false
+
+        description:
+          Video port for LVDS output (panel or bridge).
+
+        properties:
+          reg:
+            const: 1
+
+          endpoint:
+            type: object
+            additionalProperties: false
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
+  - enable-gpios
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      bridge@2d {
+        compatible = "ti,sn65dsi83";
+        reg = <0x2d>;
+
+        enable-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            endpoint {
+              remote-endpoint = <&dsi0_out>;
+              data-lanes = <1 2 3 4>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+            endpoint {
+              remote-endpoint = <&panel_in_lvds>;
+            };
+          };
+        };
+      };
+    };
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
