Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72B2AD74A5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F5810E8A7;
	Thu, 12 Jun 2025 14:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="gLQR633x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C6210E881
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 14:53:03 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 2EFB025F8B;
 Thu, 12 Jun 2025 16:53:02 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybeNELFMBll6; Thu, 12 Jun 2025 16:53:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1749739981; bh=+GGuTIftP9Os/S9WTRfml4uTN5de9NhqJE+FVI1Q4vM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=gLQR633xNlqt2vLpfYdjiGy15XlEQtheiPcCA3qjvl3yW6Zo15xig1d4GKWUWRG68
 ex4WmttlJ9PLwhXY5P42IoPfirk26voCcRggpJj5qbTYq16G2KgwRq9xagKHbQDtWn
 vOUGlj8U1EOg5rDr8+7yDW+v2A+Kbovn2/CBs1a/ZersJE+Ea3b7MZKW37RUTtsLb7
 NLdyW1CBS06P4J3M69R56g2+Iqf4heoKeoZs449uAkOQ+cZg72lFiLNGDNuA4dTHCq
 yy9U6EzOZVEz4k3b2ZtF9YrenJb0M18wWDMaT/EsEVWVWbXqYthYr7vtMBgtOnpGwS
 sWVYulJ7Ad54g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:22:41 +0530
Subject: [PATCH 1/2] dt-bindings: display: panel: document Samsung
 S6E8AA5X01 panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-panel-samsung-s6e8aa5x01-v1-1-06dcba071ea6@disroot.org>
References: <20250612-panel-samsung-s6e8aa5x01-v1-0-06dcba071ea6@disroot.org>
In-Reply-To: <20250612-panel-samsung-s6e8aa5x01-v1-0-06dcba071ea6@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749739970; l=2550;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=+GGuTIftP9Os/S9WTRfml4uTN5de9NhqJE+FVI1Q4vM=;
 b=ij0RkMY9rm3qQxLpHc5+eHhhmvg6d4bJ7ut3wUq0Bm0uJbyAl8pjEwqxTx5uwWNZHF8anX13k
 44x4ZcCPvmbC5e5Vs9rftkXYdhxoVE9hDSZnyUF8aEoi2xV7+jJO9nt
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

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/display/panel/samsung,s6e8aa5x01.yaml | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..909f43a49434af94c90ee64a3171d44645cd9dc9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e8aa0.yaml#
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
+    maxItems: 1
+    description: core voltage supply
+
+  vci-supply:
+    maxItems: 1
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

