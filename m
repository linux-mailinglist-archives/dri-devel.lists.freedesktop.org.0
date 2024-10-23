Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9A69AD5DF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 22:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9160110E85F;
	Wed, 23 Oct 2024 20:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3A710E110
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 12:45:18 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <rcz@pengutronix.de>)
 id 1t3ajj-0000VZ-96; Wed, 23 Oct 2024 14:45:15 +0200
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rcz@pengutronix.de>) id 1t3ajh-0002Hw-2D;
 Wed, 23 Oct 2024 14:45:13 +0200
Received: from rcz by dude06.red.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <rcz@pengutronix.de>) id 1t3ajh-004q6j-1y;
 Wed, 23 Oct 2024 14:45:13 +0200
From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: kernel@pengutronix.de, Rouven Czerwinski <r.czerwinski@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 2/3] dt-bindings: display: panel: add YAML schema for LXD
 M9189A
Date: Wed, 23 Oct 2024 14:44:09 +0200
Message-Id: <20241023124411.1153552-2-r.czerwinski@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241023124411.1153552-1-r.czerwinski@pengutronix.de>
References: <20241023124411.1153552-1-r.czerwinski@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rcz@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Wed, 23 Oct 2024 20:55:47 +0000
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

The LXD M9189A is a 1024x600 MIPI-DSI panel.

Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
---
 .../bindings/display/panel/lxd,m9189a.yaml    | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml b/Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml
new file mode 100644
index 0000000000000..49cee8865cae1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lxd,m9189a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LXD M9189 DSI Display Panel
+
+maintainers:
+  - Rouven Czerwinski <r.czerwinski@pengutronix.de>
+
+properties:
+  compatible:
+    const: ronbo,rb070d30
+
+  reg:
+    maxItems: 1
+
+  standby-gpios:
+    description: GPIO used for the standby pin
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO used for the reset pin
+    maxItems: 1
+
+  vdd-supply:
+    description: Power regulator
+
+  backlight:
+    description: Backlight used by the panel
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - standby-gpios
+  - reset-gpios
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      panel@0 {
+        compatible = "lxd,m9189a";
+        reg = <0>;
+        backlight = <&backlight>;
+        reset-gpios = <&gpio3 25 GPIO_ACTIVE_LOW>;
+        standby-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
+
+        port {
+          mipi_panel_in: endpoint {
+            remote-endpoint = <&mipi_dsi_out>;
+          };
+        };
+      };
+    };
-- 
2.39.5

