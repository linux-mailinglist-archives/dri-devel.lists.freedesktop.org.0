Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDA9B07EDB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 22:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983FA10E3C0;
	Wed, 16 Jul 2025 20:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E53D10E682
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 07:17:46 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4E9CF1A0A67;
 Wed, 16 Jul 2025 09:08:39 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CE2EE1A017B;
 Wed, 16 Jul 2025 09:08:38 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com
 (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 24CEA18000A4;
 Wed, 16 Jul 2025 15:08:36 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Wed, 16 Jul 2025 16:08:29 +0900
Subject: [PATCH 1/3] dt-bindings: display: bridge: Add waveshare DSI2DPI
 unit support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-waveshare-v1-1-81cb03fb25a3@nxp.com>
References: <20250716-waveshare-v1-0-81cb03fb25a3@nxp.com>
In-Reply-To: <20250716-waveshare-v1-0-81cb03fb25a3@nxp.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, victor.liu@nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752649713; l=2965;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=/l7MHh7uPIX7InE79NqaIQrPISn4O7GStWIfCFgbWZY=;
 b=sgMIn9k4WGCKe39EcRuCPBdMUFY3baUH37oOrCw26INUSJIvwJVfsEgQDDkFTIK8ebm7XCFRF
 p3tg5WbY0RhCcKDXZ7TJu2Ers+Cq3L7iT5ZaSy334XiItKsawNhww0H
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Wed, 16 Jul 2025 20:26:43 +0000
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

Add dt-binding documentation for waveshare DSI2DPI unit

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
 .../bindings/display/bridge/waveshare,dsi2dpi.yaml | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml b/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..678922ebe138ec2fa7bd05902947a86ec73fc644
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/waveshare,dsi2dpi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Waveshare MIPI-DSI to DPI Converter bridge
+
+maintainers:
+  - Joseph Guo <qijian.guo@nxp.com>
+
+description:
+  Waveshare bridge board is part of Waveshare panel which converts DSI to DPI.
+
+properties:
+  compatible:
+    const: waveshare,dsi2dpi
+
+  reg:
+    maxItems: 1
+    description: base I2C address of the device
+
+  power-supply: true
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Video port for MIPI DSI input
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                description: array of physical DSI data lane indexes.
+                items:
+                  - const: 1
+                  - const: 2
+
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Video port for MIPI DPI output panel.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - ports
+  - power-supply
+
+additionalProperties: false
+
+examples:
+  - |
+
+    i2c0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      bridge@45 {
+        compatible = "waveshare,dsi2dpi";
+        reg = <0x45>;
+        power-supply = <&reg_3p3v>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            waveshare_from_dsim: endpoint {
+              data-lanes = <1 2>;
+              remote-endpoint = <&dsim_to_waveshare>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+
+            waveshare_to_panel: endpoint {
+              remote-endpoint = <&panel_to_waveshare>;
+            };
+          };
+        };
+      };
+    };
+
+...

-- 
2.34.1

