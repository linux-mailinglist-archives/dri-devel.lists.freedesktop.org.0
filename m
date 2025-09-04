Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32835B47816
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309A610E40E;
	Sat,  6 Sep 2025 22:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lontium.com header.i=@lontium.com header.b="T9WxGV1I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-73.mail.aliyun.com (out28-73.mail.aliyun.com
 [115.124.28.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D170A10E057
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 02:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lontium.com; s=default;
 t=1756952728; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=Un06HqfwPQsE/oAIO6ZXBVvPYAItl1qANIL2H+2XnCw=;
 b=T9WxGV1Iv/FDUQZDbtqrEvtpe5r00KL9fdfqLsNK88rH/tqLnEfM8zuJ2TNfvhsvVsyFn2cZI2XauwBzdCGdfMDIFa4GFLQRx3FF7LYIOWAXOnyHj6FK2tzv/z/k9ud6Yns22ni8DpYCbba9YM43t600R+z4PyZBAmYu3P+T2XFt3v7t326YB1Hlr+Hsk7pK63PhGdu9FD0weva4g/8i7usk3z9Py5v4Tzpni8D56y+SBQZpNIWrE4KyGZPmfa6miiFkOVvNjlZAxVC+hHTw7glKUGTs7QBHvvDPygCbkkkwh8ZgQ/dRwc98QY0C74C6efWJNMhkhoQaJjESqHffhw==
Received: from localhost.localdomain(mailfrom:syyang@lontium.com
 fp:SMTPD_---.eX3U4ee_1756952727 cluster:ay29) by smtp.aliyun-inc.com;
 Thu, 04 Sep 2025 10:25:27 +0800
From: syyang <syyang@lontium.com>
To: robh@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, syyang@lontium.com,
 yangsunyun1993@gmail.com
Subject: [PATCH v2 1/2] This patch adds a new device tree binding
 documentation.
Date: Wed,  3 Sep 2025 19:25:24 -0700
Message-Id: <20250904022524.1748587-1-syyang@lontium.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <175691717884.2393851.6340903042726389490.robh@kernel.org>
References: <175691717884.2393851.6340903042726389490.robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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

Fix device tree binding validation errors reported by Rob Herring.

v2:
- Fixed $id field to match actual filename (lontium,lt9611c.yaml)
- build pass

Thanks to Rob Herring for the review and feedback.

Signed-off-by: syyang <syyang@lontium.com>
---
 .../display/bridge/lontium,lt9611c.yaml       | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml
new file mode 100644
index 000000000000..712644da4f1d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/lontium,lt9611c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lontium LT9611C 2 Port MIPI to HDMI Bridge
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+description: |
+  The LT9611C are bridge devices which convert DSI to HDMI
+
+properties:
+  compatible:
+    enum:
+      - lontium,lt9611c
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to active high RESET pin.
+
+  vdd-supply:
+    description: Regulator for 1.2V MIPI phy power.
+
+  vcc-supply:
+    description: Regulator for 3.3V IO power.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Primary MIPI port-1 for MIPI input
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Additional MIPI port-2 for MIPI input, used in combination
+          with primary MIPI port-1 to drive higher resolution displays
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          HDMI port for HDMI output
+
+    required:
+      - port@0
+      - port@2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - vdd-supply
+  - vcc-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c10 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      hdmi-bridge@41 {
+        compatible = "lontium,lt9611c";
+        reg = <0x41>;
+        #sound-dai-cells = <0>;
+        interrupts-extended = <&pio 128 GPIO_ACTIVE_HIGH>;
+        reset-gpios = <&pio 127 GPIO_ACTIVE_HIGH>;
+        vdd-supply = <&lt9611_1v2>;
+        vcc-supply = <&lt9611_3v3>;
+        status = "okay";
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            lt9611_a: endpoint {
+              remote-endpoint = <&dsi0_out>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+            lt9611_b: endpoint {
+              remote-endpoint = <&dsi1_out>;
+            };
+          };
+
+          port@2 {
+            reg = <2>;
+            lt9611_out: endpoint {
+              remote-endpoint = <&hdmi_con>;
+            };
+          };
+        };
+      };
+    };
+
+...
+
-- 
2.25.1

