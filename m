Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960AE3994D2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 22:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7706EE6C;
	Wed,  2 Jun 2021 20:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1B56EE6C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 20:49:53 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6C04B82F3C;
 Wed,  2 Jun 2021 22:49:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1622666991;
 bh=k67kcRUmZQf8wU6LPLEdjAPuykwU0wMMmZ4I2S3Si8Y=;
 h=From:To:Cc:Subject:Date:From;
 b=ZXMrwlNUc+qlzSR1UlB+mDLcVVcFh/0UQtDcWJt8SQEtEkoaS98haWHf2A1nAsmdM
 D2S5Y2/bK6v722PzjlXtT/6q90gN7qVZep84yabMwJ5YVFKLGqRD8lqDhf8yBYvvko
 mynb743/Wh5mkjkQ9Ta66lwDgzVK+INs7gj+vi/Bnu1iZWY04Li0CWoOuS4rlnkwuf
 Ji3MNoQZB/tr+VMOgdYLF4k/TVBh6QazHIMfNt3nfyTAxo8wkHrIICN4rRMk5huUut
 3ibxo+EugCuQaNVdS2/ite4oREdnvy+CkgT7iGYlpESdnzl77meq0PPMdIewhaVjUT
 dLj7tgWPBDiLQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V5 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add TI
 SN65DSI83 and SN65DSI84 bindings
Date: Wed,  2 Jun 2021 22:49:27 +0200
Message-Id: <20210602204928.420342-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, ch@denx.de, devicetree@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DT binding document for TI SN65DSI83 and SN65DSI84 DSI to LVDS bridge.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
V2: Add compatible string for SN65DSI84, since this is now tested on it
V3: - Add 0x2c as valid i2c address
    - Switch to schemas/graph.yaml
    - Constraint data-lanes to <1>, <1 2>, <1 2 3>, <1 2 3 4> only
    - Indent example by 4 spaces
    - Handle dual-link LVDS with two ports and describe the second DSI
      channel-B port as well. Based on the register defaults of DSI83
      and DSI84, it is likely that the LVDS-channel-B and DSI-channel-B
      hardware is present in all the chips, so just reuse port@0 and 2
      for DSI83, port@0,2,3 for DSI84 and all of 0,1,2,3 for DSI85 when
      that is supported
V4: - Fix typo in port@3 description
    - Add RB from Linus Walleij
    - Replace oneOf: and const with enum:
    - ref /schemas/media/video-interfaces.yaml#
    - Drop empty endpoint: and properties:
V5: - Add RB from Rob Herring
---
 .../bindings/display/bridge/ti,sn65dsi83.yaml | 159 ++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
new file mode 100644
index 0000000000000..d101233ae17ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -0,0 +1,159 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SN65DSI83 and SN65DSI84 DSI to LVDS bridge chip
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+description: |
+  Texas Instruments SN65DSI83 1x Single-link MIPI DSI
+  to 1x Single-link LVDS
+  https://www.ti.com/lit/gpn/sn65dsi83
+  Texas Instruments SN65DSI84 1x Single-link MIPI DSI
+  to 1x Dual-link or 2x Single-link LVDS
+  https://www.ti.com/lit/gpn/sn65dsi84
+
+properties:
+  compatible:
+    enum:
+      - ti,sn65dsi83
+      - ti,sn65dsi84
+
+  reg:
+    enum:
+      - 0x2c
+      - 0x2d
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO specifier for bridge_en pin (active high).
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for MIPI DSI Channel-A input
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                description: array of physical DSI data lane indexes.
+                minItems: 1
+                maxItems: 4
+                items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for MIPI DSI Channel-B input
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                description: array of physical DSI data lane indexes.
+                minItems: 1
+                maxItems: 4
+                items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for LVDS Channel-A output (panel or bridge).
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for LVDS Channel-B output (panel or bridge).
+
+    required:
+      - port@0
+      - port@2
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - ports
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,sn65dsi83
+    then:
+      properties:
+        ports:
+          properties:
+            port@1: false
+            port@3: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,sn65dsi84
+    then:
+      properties:
+        ports:
+          properties:
+            port@1: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bridge@2d {
+            compatible = "ti,sn65dsi83";
+            reg = <0x2d>;
+
+            enable-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                        data-lanes = <1 2 3 4>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    endpoint {
+                        remote-endpoint = <&panel_in_lvds>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.30.2

