Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDA3AD747D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19AD310E89E;
	Thu, 12 Jun 2025 14:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="bYS8wDMr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 514 seconds by postgrey-1.36 at gabe;
 Thu, 12 Jun 2025 14:48:45 UTC
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8049510E880
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 14:48:45 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id C2F8825E38;
 Thu, 12 Jun 2025 16:40:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SR4gQnR6tiSp; Thu, 12 Jun 2025 16:40:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1749739208; bh=MNY5GrlKulcobjKhaz4Ugy35VrS+LfXdMTxhyeYCZ3U=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=bYS8wDMrUnyo4JzaHSlNlBuQJs2yRt7Q3r9qwIqoFOe1mzNq6pgINXshKC8h4AlHS
 Sf6eL7xdwdGfRCjkT7ojVU1sduxcNKNHQk/gQhD7ao0ZNyhpN2t231XXbc6kO+OSRW
 OQ1HAoOS1Hg+6VJnpr+BBvanuXg4eKgYbmXHNpBVGQSx/9I+Jck+EDvriZ9L3uC2nC
 baKxMlr+A1murkSHJ9wbhgxKIiF8nzcyXHpYtuc4aCFUpGQB9HtozuBRlVRjA7O/3P
 MlsSKOs/bKdGEvPKEIlYDjBJbmsr8as9zvtIzdVeqqKwtr65y/87oTPke25OWMq3qw
 eAM8cXbAcwpVg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:09:40 +0530
Subject: [PATCH 1/2] dt-bindings: display: panel: document Synaptics TDDI
 panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-panel-synaptics-tddi-v1-1-dfb8a425f76c@disroot.org>
References: <20250612-panel-synaptics-tddi-v1-0-dfb8a425f76c@disroot.org>
In-Reply-To: <20250612-panel-synaptics-tddi-v1-0-dfb8a425f76c@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749739197; l=2932;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=MNY5GrlKulcobjKhaz4Ugy35VrS+LfXdMTxhyeYCZ3U=;
 b=4j7u0ZeD2t4wgyl9xeAF3zzcvOQbOARt4jYlNXeqN1cKeberTGie2+iVPNKswaGLsKepy3Uii
 lqjhmVDlrsVAQgRdfuUxrzahqYv8KzzJ/vfCz7l+czOcN6gy3hmYGWx
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
 .../bindings/display/panel/synaptics,tddi.yaml     | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,tddi.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,tddi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3aae1358a1d764361c072d3b54f74cdf634f7fa8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/synaptics,tddi.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,tddi.yaml#
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
+    maxItems: 1
+    description: core I/O voltage supply
+
+  vsn-supply:
+    maxItems: 1
+    description: negative voltage supply for analog circuits
+
+  vsp-supply:
+    maxItems: 1
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

