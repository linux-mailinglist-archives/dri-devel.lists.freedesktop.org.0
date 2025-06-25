Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B17AE82EB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 14:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C1E10E225;
	Wed, 25 Jun 2025 12:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="Lmus5BIf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5A010E6F4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 12:41:48 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 4288A22E77;
 Wed, 25 Jun 2025 14:41:47 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2WDmWBds7S-4; Wed, 25 Jun 2025 14:41:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1750855306; bh=f0JRQMEsVKlGa0ZIRNYll0HpfPGIEpcJG3yvaDfP6WI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=Lmus5BIfu4fCaYB498+Tsaiv8pmWviBNbjtU0Uv3Bbuaq6c6KFcXbalhpMFAHowL1
 QsPy3HAqg79mDcFOKtnOjT6/QYyyKnreVpjJibmMn6QPyEmcwnSn0bzUBZWRTEueqR
 LHJWZlOQzK0eU0qDZach4VQ1WbG1L3vNlyQ5DfUwmuzw5T4NhlT4edxIjWPULVxsDY
 sqykfO9N/N9DITn2CEjj8Sr1SOQR9jauBjZmOnB1YE/6KpEGOu5NlPaP62Y1t+FSbr
 tmvntRqKs8ZJFUZya9LG2WY0LEaaL8PCOHZKHB7KW2jtk9lnoAoVz4s9J4qmDcXKI7
 RlfY3XEvs6WeQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 25 Jun 2025 18:11:25 +0530
Subject: [PATCH v3 1/2] dt-bindings: display: panel: document Samsung
 S6E8AA5X01 panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-panel-samsung-s6e8aa5x01-v3-1-9a1494fe6c50@disroot.org>
References: <20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org>
In-Reply-To: <20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750855293; l=2570;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=f0JRQMEsVKlGa0ZIRNYll0HpfPGIEpcJG3yvaDfP6WI=;
 b=4gHZ6p02DoCgctAauhiZwhxESjSXoNuWs9dHjGDbREvcKPo06rNCwzzAEZKoh89R7Z+uiSsfS
 LHQ6zn1SZg0AuWYde1ucVbWe5Hpgrme6LLsnr68rt0T3CyQLG/d8x0n
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
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

Samsung S6E8AA5X01 is an AMOLED MIPI DSI panel controller. Document the
compatible and devicetree properties of this panel driver. Timings are
provided through the devicetree node as panels are available in
different sizes.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/display/panel/samsung,s6e8aa5x01.yaml | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..23dae6e961ae01c99de93bf4b4a067f2953f8edf
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e8aa5x01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S6E8AA5X01 display panel controller
+
+maintainers:
+  - Kaustabh Chakraborty <kauschluss@disroot.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e8aa5x01
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: core voltage supply
+
+  vci-supply:
+    description: voltage supply for analog circuits
+
+  reset-gpios: true
+  width-mm: true
+  height-mm: true
+  panel-timing: true
+
+required:
+  - compatible
+  - reg
+  - width-mm
+  - height-mm
+  - panel-timing
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "samsung,s6e8aa5x01";
+            reg = <0>;
+
+            vdd-supply = <&panel_vdd_reg>;
+            vci-supply = <&panel_vci_reg>;
+
+            reset-gpios = <&gpd3 4 GPIO_ACTIVE_HIGH>;
+
+            width-mm = <62>;
+            height-mm = <128>;
+
+            panel-timing {
+                clock-frequency = <73094400>;
+
+                hactive = <720>;
+                hsync-len = <2>;
+                hfront-porch = <62>;
+                hback-porch = <26>;
+
+                vactive = <1480>;
+                vsync-len = <2>;
+                vfront-porch = <12>;
+                vback-porch = <10>;
+            };
+        };
+    };
+
+...

-- 
2.49.0

