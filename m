Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 577FE35A2E3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 18:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE906E4D7;
	Fri,  9 Apr 2021 16:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BFE6E4B7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 16:20:02 +0000 (UTC)
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:19b8:b5db:beab:c68c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 664E11F46988;
 Fri,  9 Apr 2021 17:20:00 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 1/2] dt-bindings: display: add google,cros-ec-anx7688.yaml
Date: Fri,  9 Apr 2021 18:19:50 +0200
Message-Id: <20210409161951.12365-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210409161951.12365-1-dafna.hirschfeld@collabora.com>
References: <20210409161951.12365-1-dafna.hirschfeld@collabora.com>
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
Cc: megous@megous.com, chunkuang.hu@kernel.org, jernej.skrabec@siol.net,
 drinkcat@chromium.org, dafna.hirschfeld@collabora.com, jonas@kwiboo.se,
 airlied@linux.ie, dafna3@gmail.com, linux-usb@vger.kernel.org,
 narmstrong@baylibre.com, a.hajda@samsung.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, hsinyi@chromium.org,
 enric.balletbo@collabora.com, kernel@collabora.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ChromeOS EC ANX7688 is a display bridge that converts HDMI 2.0 to
DisplayPort 1.3 Ultra-HDi (4096x2160p60). It is an Analogix ANX7688 chip
which is connected to and operated by the ChromeOS Embedded Controller
(See google,cros-ec.yaml). It is accessed using I2C tunneling through
the EC and therefore its node should be a child of an EC I2C tunnel node
(See google,cros-ec-i2c-tunnel.yaml).

ChromOS EC ANX7688 is found on Acer Chromebook R13 (elm)

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../bridge/google,cros-ec-anx7688.yaml        | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
new file mode 100644
index 000000000000..9f7cc6b757cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/google,cros-ec-anx7688.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ChromeOS EC ANX7688 HDMI to DP Converter through Type-C Port
+
+maintainers:
+  - Nicolas Boichat <drinkcat@chromium.org>
+  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
+
+description: |
+  ChromeOS EC ANX7688 is a display bridge that converts HDMI 2.0 to
+  DisplayPort 1.3 Ultra-HDi (4096x2160p60). It is an Analogix ANX7688 chip
+  which is connected to and operated by the ChromeOS Embedded Controller
+  (See google,cros-ec.yaml). It is accessed using I2C tunneling through
+  the EC and therefore its node should be a child of an EC I2C tunnel node
+  (See google,cros-ec-i2c-tunnel.yaml).
+
+properties:
+  compatible:
+    const: google,cros-ec-anx7688
+
+  reg:
+    maxItems: 1
+    description: I2C address of the device.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for HDMI input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: USB Type-c connector.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c_tunnel_b: i2c-tunnel1 {
+        compatible = "google,cros-ec-i2c-tunnel";
+        google,remote-bus = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        anx7688: anx7688@2c {
+            compatible = "google,cros-ec-anx7688";
+            reg = <0x2c>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    anx7688_in: endpoint {
+                        remote-endpoint = <&hdmi0_out>;
+                    };
+                };
+                port@1 {
+                    reg = <1>;
+                    anx7688_out: endpoint {
+                        remote-endpoint = <&typec_connector>;
+                    };
+                };
+            };
+        };
+    };
+
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
