Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1066F5070C7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 16:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72C210EEA6;
	Tue, 19 Apr 2022 14:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66F110EEA7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 14:40:20 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D242F83CF3;
 Tue, 19 Apr 2022 16:40:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650379218;
 bh=hDwfhY/HpPxbc/begCdgWtM53seWsGCI4w+qpBFpdVk=;
 h=From:To:Cc:Subject:Date:From;
 b=Uj9qcmf/ELviyuYREIY0CFcTCn77IAd/IPOIkP20AFmpGLbjB855SViux029w0csd
 7mbjpSbRCdeNHb2j2DQ/rFkEXArXrPACgrt9bzeE3ROINlE1nowUBagKGzsrel2Jgm
 e3eJCpZ2gqC7ka+qyWwp3Hh7UBesrjKs9G/Dd5O76J+0dk7jWscRuf+l9F8qHr5Lpe
 hXz/pS2FcSSXwWmcz9gS5N6bYFk8/E+L+09BNtwg94P3qtbPYU3cBb9UijWd/9CCbd
 GslUvl+EGr+rBI/8747KnedN5F9P7zR7O+AMvGibJc96zfgJLPCjCSj2aQqqRkJGu1
 De/oC6l0eSP2g==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] dt-bindings: display: bridge: lt9211: Add Lontium
 LT9211 bridge driver
Date: Tue, 19 Apr 2022 16:39:57 +0200
Message-Id: <20220419143958.94873-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 robert.foss@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for Lontium LT9211 Single/Dual-Link DSI/LVDS or Single DPI to
Single-link/Dual-Link DSI/LVDS or Single DPI bridge. This chip is highly
capable at converting formats, but sadly it is also highly undocumented.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
V2: - Fix up s@i2c10@i2c@ in binding example
    - Add RB from Rob
---
 .../display/bridge/lontium,lt9211.yaml        | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
new file mode 100644
index 0000000000000..9a6e9b25d14a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/lontium,lt9211.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lontium LT9211 DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+description: |
+  The LT9211 are bridge devices which convert Single/Dual-Link DSI/LVDS
+  or Single DPI to Single/Dual-Link DSI/LVDS or Single DPI.
+
+properties:
+  compatible:
+    enum:
+      - lontium,lt9211
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to active high RESET pin.
+
+  vccio-supply:
+    description: Regulator for 1.8V IO power.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Primary MIPI DSI port-1 for MIPI input or
+          LVDS port-1 for LVDS input or DPI input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Additional MIPI port-2 for MIPI input or LVDS port-2
+          for LVDS input. Used in combination with primary
+          port-1 to drive higher resolution displays
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Primary MIPI DSI port-1 for MIPI output or
+          LVDS port-1 for LVDS output or DPI output.
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Additional MIPI port-2 for MIPI output or LVDS port-2
+          for LVDS output. Used in combination with primary
+          port-1 to drive higher resolution displays.
+
+    required:
+      - port@0
+      - port@2
+
+required:
+  - compatible
+  - reg
+  - vccio-supply
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
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      hdmi-bridge@3b {
+        compatible = "lontium,lt9211";
+        reg = <0x3b>;
+
+        reset-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;
+        interrupts-extended = <&tlmm 84 IRQ_TYPE_EDGE_FALLING>;
+
+        vccio-supply = <&lt9211_1v8>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            endpoint {
+              remote-endpoint = <&dsi0_out>;
+            };
+          };
+
+          port@2 {
+            reg = <2>;
+
+            endpoint {
+              remote-endpoint = <&panel_in_lvds>;
+            };
+          };
+        };
+      };
+    };
+
+...
-- 
2.35.1

