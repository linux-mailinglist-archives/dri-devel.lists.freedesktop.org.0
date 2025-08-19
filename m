Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FC2B2C7B7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 16:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F00010E2D3;
	Tue, 19 Aug 2025 14:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="CP4gC+O0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7342C10E2D3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 14:57:11 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 5A6A920D2A;
 Tue, 19 Aug 2025 16:57:10 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_9U3BbE2EY6; Tue, 19 Aug 2025 16:57:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1755615429; bh=We7amH1B4SyPPjeaqUpaFP4DU6xAfLuufxsp/dk8cPI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=CP4gC+O0vh/j1nF/ZcZyYYmcySop5s8U3QTZfohi3qs6XH6StcQwGvga65dWbVvIa
 52EpDPqf+jmTKk3c/2BbI8XOJ8mHtmn8ymDqJCXbwoS38/tRVVN44fsABM11k0CxgQ
 DyfDJVFmckjZ6OB45AGgSEMwKl1HWQOJ7RAGf7RMvKS8Q64zFZMl7yfQPYJrFHRp8G
 t7a0fEU290lVPra4OiupPycCNTnyiIq5YhIPZQcel9joc7Nk1fSUBNb44yj3d8rVwi
 fcM3P5zwyrMk99e4lLqkXqTHUG+QOtAC2WQ4CZG9VFi/icNfkwLfHUsNmX5bq/HlqF
 4rrBAT3URohbQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 19 Aug 2025 20:26:44 +0530
Subject: [PATCH v4 1/2] dt-bindings: display: panel: document Synaptics
 TDDI panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-panel-synaptics-tddi-v4-1-448f466d16a6@disroot.org>
References: <20250819-panel-synaptics-tddi-v4-0-448f466d16a6@disroot.org>
In-Reply-To: <20250819-panel-synaptics-tddi-v4-0-448f466d16a6@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755615411; l=3009;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=We7amH1B4SyPPjeaqUpaFP4DU6xAfLuufxsp/dk8cPI=;
 b=KF2t3a6LrkLl90sKyXsE4ARvF2XMo2o4RvpKcOi9iXgz2dunnxjikdRuzCA0/+JEUQDr5Semf
 FIVOGkYJWFlCcxSIC34nT3hnZPavMc+8QAvMKplPmDrx1b5NKESmU4m
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

Document the Synaptics TDDI (Touch/Display Integration) panel hardware.
Along with the MIPI-DSI panel, these devices also have an in-built LED
backlight device and a touchscreen, all packed together in a single chip.

Also, add compatibles for supported panels - TD4101 and TD4300. Both
have the '-panel' suffix so as to remove any ambiguity between the panel
and touchscreen chips.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../display/panel/synaptics,td4300-panel.yaml      | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..152d94367130e9d80a885fe87a2da53db88e3393
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
+            compatible = "syna,td4300-panel";
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
2.50.0

