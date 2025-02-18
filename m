Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E926A3A024
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 15:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD81310E3D2;
	Tue, 18 Feb 2025 14:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZoAkcpcR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E9C10E3D2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 14:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739889599;
 bh=ER6W0b2g/2UyJF4xz5QxxKZrGpaDX+db+NCwoIJ25Lc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZoAkcpcRui2PWffSNXX42wMnSf0D2kVlNRAd4NeVspxV+/Z1ZcsDqiuSr43/g9+xU
 xHqHmbRX9rihQyqCSaEGTRSaFgZM1Dwr7TdYe32ekbLwNVJJ4xL0l6fIgRereB0eDP
 f46sKAZbB5Bsfh+cbfRvSqgoS5TSyuZVRJDx/otEirS6AN4LpxLDKYHNlzwUF9gwnf
 /CV9kYTgslrscbcAE6O55GoTg7+wKO5/zksHh+s6fWkwIwINNX3CYwtBzTxgX6csha
 kMBSaQcfYe6FjHi8W2re1E7fbA1ytmcwL4RLw6rdUTHfw3SkZmMakPCp7OxiXL2x5b
 NLlaQFvLrCgPg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2666417E0657;
 Tue, 18 Feb 2025 15:39:58 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, pablo.sun@mediatek.com,
 christophe.jaillet@wanadoo.fr, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add Himax HX8279/HX8279-D
Date: Tue, 18 Feb 2025 15:39:51 +0100
Message-ID: <20250218143952.84261-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218143952.84261-1-angelogioacchino.delregno@collabora.com>
References: <20250218143952.84261-1-angelogioacchino.delregno@collabora.com>
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

Describe this DriverIC and the Startek KD070FHFID078 panel found
on newer revisions of the MediaTek Genio 510/700/1200 Evaluation
Kits (EVK).

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/display/panel/himax,hx8279.yaml  | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
new file mode 100644
index 000000000000..d66191398f50
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
@@ -0,0 +1,74 @@
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
2.48.1

