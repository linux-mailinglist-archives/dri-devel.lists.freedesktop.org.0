Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C659FA41BF7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 12:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F02D10E329;
	Mon, 24 Feb 2025 11:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jtm1ipZs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D07010E249
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 11:02:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B287F5C657A;
 Mon, 24 Feb 2025 11:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F54CC4CED6;
 Mon, 24 Feb 2025 11:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740394938;
 bh=a+4TRnbDCqyLC8W0M0u+rtawQ83N83YT2yK4cftn09s=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=jtm1ipZslTxrUxMXE4v+bY0l8Rd6NkmdaKa3sWo/vACxL0/naI7n70ocMhoCjeCVL
 c1luUWTOXJQIjD5GaLFPg2OBQlqAMhoDDBSGf9j/kgfsui1zwlKE5nORZ0Dy21ei+H
 2N4s4L3dDt2aC4dtuRl0c1j7g9piYK3sDiPo/PLgFB1ZfRFAeQP25/raRubga8lvVj
 rfaEKozSuXSPrMl0HNucEQaL9trGA4iBFvafL8/e6o9sQg/nR1EK8vzjC0EjML6Hp9
 Gy8C3zlatshyGZk5NeePAeZMWGF+jjQynw8ljybZ0fV1Nb2UfYATSbUyFfo3WU8nTG
 Ukk9lBTlPN0kA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 44720C021A6;
 Mon, 24 Feb 2025 11:02:18 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Mon, 24 Feb 2025 12:02:16 +0100
Subject: [PATCH v8 1/5] dt-bindings: display: Add Apple pre-DCP display
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-adpdrm-v8-1-cccf96710f0f@gmail.com>
References: <20250224-adpdrm-v8-0-cccf96710f0f@gmail.com>
In-Reply-To: <20250224-adpdrm-v8-0-cccf96710f0f@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740394936; l=7350;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=WfWNX2qd2LMsuVRTJjIwpLZ5EHqBKnuNB1L8yU2L/wI=;
 b=wQ3uzk4xWgKwyxvbYM7jweeJiyet1/OMv9Luj6E20IjFh8MvKFJveUIzgDvx2XUjgaW/tjGC6
 zslYBVRx25CDajisT00+eCBbuN0vxsisY6VgU4jHC5yDOKzf/BmW/Cg
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
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
Reply-To: fnkl.kernel@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add bindings for a secondary display controller present on certain
Apple laptops.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 .../display/apple,h7-display-pipe-mipi.yaml        | 83 ++++++++++++++++++++
 .../bindings/display/apple,h7-display-pipe.yaml    | 88 ++++++++++++++++++++++
 .../bindings/display/panel/apple,summit.yaml       | 58 ++++++++++++++
 3 files changed, 229 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml b/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5e6da66499a508c001670f68fa00d6bab13591d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/apple,h7-display-pipe-mipi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple pre-DCP display controller MIPI interface
+
+maintainers:
+  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+
+description:
+  The MIPI controller part of the pre-DCP Apple display controller
+
+allOf:
+  - $ref: dsi-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,t8112-display-pipe-mipi
+          - apple,t8103-display-pipe-mipi
+      - const: apple,h7-display-pipe-mipi
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input port. Always connected to the primary controller
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output MIPI DSI port to the panel
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
+unevaluatedProperties: false
+
+examples:
+  - |
+    dsi@28200000 {
+        compatible = "apple,t8103-display-pipe-mipi", "apple,h7-display-pipe-mipi";
+        reg = <0x28200000 0xc000>;
+        power-domains = <&ps_dispdfr_mipi>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                dfr_adp_out_mipi: endpoint {
+                    remote-endpoint = <&dfr_adp_out_mipi>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                dfr_panel_in: endpoint {
+                    remote-endpoint = <&dfr_mipi_out_panel>;
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml b/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..102fb1804c0c0b84f590e507ca2d526948e98f68
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/apple,h7-display-pipe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple pre-DCP display controller
+
+maintainers:
+  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+
+description:
+  A secondary display controller used to drive the "touchbar" on
+  certain Apple laptops.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,t8112-display-pipe
+          - apple,t8103-display-pipe
+      - const: apple,h7-display-pipe
+
+  reg:
+    items:
+      - description: Primary register block, controls planes and blending
+      - description:
+          Contains other configuration registers like interrupt
+          and FIFO control
+
+  reg-names:
+    items:
+      - const: be
+      - const: fe
+
+  power-domains:
+    description:
+      Phandles to pmgr entries that are needed for this controller to turn on.
+      Aside from that, their specific functions are unknown
+    maxItems: 2
+
+  interrupts:
+    items:
+      - description: Unknown function
+      - description: Primary interrupt. Vsync events are reported via it
+
+  interrupt-names:
+    items:
+      - const: be
+      - const: fe
+
+  iommus:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Output port. Always connected to apple,h7-display-pipe-mipi
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/apple-aic.h>
+    display-pipe@28200000 {
+        compatible = "apple,t8103-display-pipe", "apple,h7-display-pipe";
+        reg = <0x28200000 0xc000>,
+              <0x28400000 0x4000>;
+        reg-names = "be", "fe";
+        power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>;
+        interrupt-parent = <&aic>;
+        interrupts = <AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>,
+                     <AIC_IRQ 506 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "be", "fe";
+        iommus = <&displaydfr_dart 0>;
+
+        port {
+            dfr_adp_out_mipi: endpoint {
+                remote-endpoint = <&dfr_mipi_in_adp>;
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/panel/apple,summit.yaml b/Documentation/devicetree/bindings/display/panel/apple,summit.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f081755325e97ad58b831893b84082cc10f8d5e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/apple,summit.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/apple,summit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple "Summit" display panel
+
+maintainers:
+  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+
+description:
+  An OLED panel used as a touchbar on certain Apple laptops.
+  Contains a backlight device, which controls brightness of the panel itself.
+  The backlight common properties are included for this reason
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/leds/backlight/common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,j293-summit
+          - apple,j493-summit
+      - const: apple,summit
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - max-brightness
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "apple,j293-summit", "apple,summit";
+            reg = <0>;
+            max-brightness = <255>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&dfr_bridge_out>;
+                };
+            };
+        };
+    };
+...

-- 
2.48.1


