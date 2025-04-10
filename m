Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33016A83AF1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 09:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF8E10E794;
	Thu, 10 Apr 2025 07:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FJga5olg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF1410E0DF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 07:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744269904;
 bh=BmmPcxIdmczouLi9tckQmkezJm/NyZ1kg9kQFE6OrD4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FJga5olgBPi1pl/M1iH6M+djF+iHfIuKE8tpXuLxdgezuHdxAmvRYPXDnNkZTz8xn
 SqcYpdqKNFFHfO7V9W7q9Ovj5TBOFZWjZSDOaSfHq5n2Z7ecy6mZKI0/IFPCQiBHd2
 UBgea9QjZBZ6YigTjM7ngWYXVg+pupoF57/CrcTi7NFOsxOHnfdQKWygiSrSwoUKtL
 o8qsWTaCLx725OWh6jVjHAc5IAXJOX10BzN8iKu5vZYbtZGCBE38zhoqJHcd5lANa1
 dLKBfyZymy/U+ggO7E2sMckaFa11GyCyGtI+ZfteTP+lrHqaUbKlw5flB2xTatAyE8
 su6nlSybstN3g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 64E0317E0FC1;
 Thu, 10 Apr 2025 09:25:03 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, pablo.sun@mediatek.com,
 christophe.jaillet@wanadoo.fr, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/3] dt-bindings: display: panel: Add Himax HX8279/HX8279-D
 DDIC panels
Date: Thu, 10 Apr 2025 09:24:55 +0200
Message-ID: <20250410072456.387562-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410072456.387562-1-angelogioacchino.delregno@collabora.com>
References: <20250410072456.387562-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Himax HX8279 is a Display DriverIC suitable for driving LCD
MIPI-DSI panels.

Describe this DriverIC, the Startek KD070FHFID078 panel found
on newer revisions of the MediaTek Genio 510/700/1200 Evaluation
Kits (EVK), and the Aoly SL101PM1794FOG-V15 found on some i.MX8MM
boards.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/display/panel/himax,hx8279.yaml  | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
new file mode 100644
index 000000000000..f619aea82bdf
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/himax,hx8279.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HX8279/HX8279-D based MIPI-DSI panels
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The Himax HX8279 is a 1803 channel outputs source driver with MIPI
+  TCON, which generates the horizontal and vertical control timing to
+  the source and gate drivers.
+  This DriverIC is most suitable for 1200x1920, 1080x1920, 1200x1600,
+  and 600x1024 panels and outputs full RGB888 over two or four lanes,
+  single or dual, MIPI-DSI video interface.
+
+allOf:
+  - $ref: panel-common-dual.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - aoly,sl101pm1794fog-v15
+          - startek,kd070fhfid078
+      - const: himax,hx8279
+
+  reg:
+    maxItems: 1
+
+  iovcc-supply:
+    description: I/O voltage supply
+
+  vdd-supply:
+    description: Panel power supply
+
+required:
+  - compatible
+  - reg
+  - backlight
+  - reset-gpios
+  - iovcc-supply
+  - vdd-supply
+
+unevaluatedProperties: false
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
+            compatible = "startek,kd070fhfid078", "himax,hx8279";
+            reg = <0>;
+            backlight = <&backlight>;
+            enable-gpios = <&pio 25 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
+            iovcc-supply = <&vreg_lcm_vio>;
+            vdd-supply = <&vreg_lcm_vdd>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.49.0

