Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14074B0B5B6
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 14:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B9710E361;
	Sun, 20 Jul 2025 12:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="dFQwoIQb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D6010E360
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:03:26 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id BFD3A25DF5;
 Sun, 20 Jul 2025 14:03:25 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8mTaVHPdMyd; Sun, 20 Jul 2025 14:03:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1753013004; bh=V8H2sOCpM7ipVF4MyaUQHDZH0lIhrU9NycxkG2AHxok=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=dFQwoIQb3TkNUDY7uJY1Q+Ptqa+MHevaOaZwFbVQEKK1pdgGnMMr0sTK6/wZb8BZI
 OWfDyMxoojzTT9PxqOO1pYdvUMmBihsKmRtEi+NDV69SID6JozQDEyC3VZlmrml49D
 /QV5FU7ArhDi/yLJpAKv2ie7P7vJe7mNf/PahLavGHkdXSIIA4EjRjCUYiFFWLcdSP
 5Y0YmYL469eFnvaD1xo2n9zi25deZ1wieqlxNLNILA3jPThReQ4teo2W0yvQrOdBSp
 CXCHF3CFWBFnDoKCyRwusEkqKuC3ppX0oNWgzs3crBm3IVAyTh9WRzI54umeuRFPv+
 hGtD09qOf2piw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 20 Jul 2025 17:33:07 +0530
Subject: [PATCH v4 1/2] dt-bindings: display: panel: document Samsung
 AMS561RA01 panel with S6E8AA5X01 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-panel-samsung-s6e8aa5x01-v4-1-7d9258fa3f4a@disroot.org>
References: <20250720-panel-samsung-s6e8aa5x01-v4-0-7d9258fa3f4a@disroot.org>
In-Reply-To: <20250720-panel-samsung-s6e8aa5x01-v4-0-7d9258fa3f4a@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753012994; l=2042;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=V8H2sOCpM7ipVF4MyaUQHDZH0lIhrU9NycxkG2AHxok=;
 b=uUpYj+pLrPcs6HR5RAAy/1TInqeC2D5MsVYBtUKzElWZLSajzOFfonzDub+X7PZb1zQxj/Nou
 +PlTXZCiGTAARVlkPEQZ5HbAbK70ScwW//iwMh1+Y/IJbRWduyK6FOd
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

Samsung AMS561RA01 is an AMOLED panel, using the Samsung S6E8AA5X01 MIPI
DSI panel controller. Document the compatible and devicetree properties
of this hardware. It has a reset GPIO and two voltage regulators.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../panel/samsung,s6e8aa5x01-ams561ra01.yaml       | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..479621b078976a47ecbc7305a7d5fc5eb600f0ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung AMS561RA01 panel with S6E8AA5X01 controller
+
+maintainers:
+  - Kaustabh Chakraborty <kauschluss@disroot.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e8aa5x01-ams561ra01
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
+
+required:
+  - compatible
+  - reg
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
+        };
+    };
+
+...

-- 
2.50.0

