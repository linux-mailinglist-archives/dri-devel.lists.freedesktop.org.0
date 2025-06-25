Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1849AE7E98
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 12:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F50F10E6B9;
	Wed, 25 Jun 2025 10:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="DM1bWqg6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E40710E6B8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 10:09:10 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 2E35425C66;
 Wed, 25 Jun 2025 12:09:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndqWISe2pY-j; Wed, 25 Jun 2025 12:09:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1750846148; bh=HdlGU4uFigU94HS/hpJv4/qyqkW1zpKq6o0RHxR+NtE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=DM1bWqg6lOXQOdCGMQkq4JlVX4iXofjgTkyC0fQo8ItKoIhy0OB0cUgc3VEz90F2L
 bjYQW5M3qHMHdUG4IVMkZkuh8SjZU/TwIWa4Z6nLXFDfS9Ky7YigzMdSwjmX5tjre0
 XKucmffrnv/dNcBqd63tDuARQb0ZJSJH7sZUkbV5E02yjjnwP/ra7QkLOYf8L7VCiw
 AQcDu2wT2po1F7DNW5ZMrArTs3QM1WnK8BbWM4pdf/YfZHQJdRN7wpiPibmRI6Pw6b
 clX6U2nhXSIsGI4kUKlKd7Oqg+Q8u7sO6OA1RL+RoQEAcYTwQ7LAnVw9Natg0KXLdh
 7aX/pe2s33/oQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 25 Jun 2025 15:38:44 +0530
Subject: [PATCH v2 1/2] dt-bindings: display: panel: document Synaptics
 TDDI panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-panel-synaptics-tddi-v2-1-7a62ab1d13c7@disroot.org>
References: <20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org>
In-Reply-To: <20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750846137; l=2912;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=HdlGU4uFigU94HS/hpJv4/qyqkW1zpKq6o0RHxR+NtE=;
 b=Qlb73GTCc1VHHWnU/DMqqg+miwrpmv0z+IewEwRtojn09RWtgOAYOybJdf/sdI/FuIBZZxt5R
 fAIvSL0ezJLCxrN3pcpmhwZzFd1vZXLZ+wUzfaq/MVMb0PybjttVv53
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

Document the driver for Synaptics TDDI (Touch/Display Integration) panels.
Along with the MIPI-DSI panel, these devices also have an in-built LED
backlight device and a touchscreen, all packed together in a single chip.
Also, add compatibles for supported panels - TD4101 and TD4300.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../display/panel/synaptics,td4300-panel.yaml      | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..10ac24afdfbc43ca6913bf8a343413eed81f12ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/synaptics,td4300-panel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synaptics TDDI Display Panel Controller
+
+maintainers:
+  - Kaustabh Chakraborty <kauschluss@disroot.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - syna,td4101-panel
+      - syna,td4300-panel
+
+  reg:
+    maxItems: 1
+
+  vio-supply:
+    description: core I/O voltage supply
+
+  vsn-supply:
+    description: negative voltage supply for analog circuits
+
+  vsp-supply:
+    description: positive voltage supply for analog circuits
+
+  backlight-gpios:
+    maxItems: 1
+    description: backlight enable GPIO
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
+            compatible = "synaptics,td4300-panel";
+            reg = <0>;
+
+            vio-supply = <&panel_vio_reg>;
+            vsn-supply = <&panel_vsn_reg>;
+            vsp-supply = <&panel_vsp_reg>;
+
+            backlight-gpios = <&gpd3 5 GPIO_ACTIVE_LOW>;
+            reset-gpios = <&gpd3 4 GPIO_ACTIVE_LOW>;
+
+            width-mm = <68>;
+            height-mm = <121>;
+
+            panel-timing {
+                clock-frequency = <144389520>;
+
+                hactive = <1080>;
+                hsync-len = <4>;
+                hfront-porch = <120>;
+                hback-porch = <32>;
+
+                vactive = <1920>;
+                vsync-len = <2>;
+                vfront-porch = <21>;
+                vback-porch = <4>;
+            };
+        };
+    };
+
+...

-- 
2.49.0

