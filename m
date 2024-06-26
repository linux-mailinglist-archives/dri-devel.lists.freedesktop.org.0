Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779C09184B4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 16:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6809310E8E4;
	Wed, 26 Jun 2024 14:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c1JcKeTo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED1310E8E1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:44:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E87D361A1B;
 Wed, 26 Jun 2024 14:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3CEC2BD10;
 Wed, 26 Jun 2024 14:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719413092;
 bh=xnV4Pwafjm1hCV6mupvMtuQXDRG+XuPAPy/PDaxveGw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c1JcKeToG5KR1/yhW8dEprMC2HxFwdHvHHCJSdExMf1AYNgc6QrKAVQgHpH1WGnNF
 X5ZEg3YDJ1T+pfj3lH8j02yrrJKEYDRu5AjFRz2/GmOxCsMPrs8M0repQb0nT8pGg8
 8Qv1AGSp4zyA7+McQrSLTPk5glQ9ltwKr5seGZrBD5gzWCowIeL/kAztZpsxQs2ZcD
 ao1oTA5uDMCQwFEIrS0oMYHlczk1Hln6yXG/EcSw8u66B6jb3GLhCKgeLpIsGC4E/H
 aq4oo/ghzInpSGxtkXvOoMZh6f6upjGmCKC9cpmrDvo3iM1LZ1lgQ1iFbTs9yNgvxg
 t72AAIKLAUsxg==
From: Michael Walle <mwalle@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Gunnar Dibbern <gunnar.dibbern@lht.dlh.de>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: display: panel: add Ilitek ili9806e panel
 controller
Date: Wed, 26 Jun 2024 16:44:32 +0200
Message-Id: <20240626144433.3097793-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240626144433.3097793-1-mwalle@kernel.org>
References: <20240626144433.3097793-1-mwalle@kernel.org>
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

Add the device tree binding for the Ilitek ILI9806E controller which can
be found on the Ortustech COME35H3P70ULC DSI display panel.

There are no peculiarities except for two different power signals.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../display/panel/ilitek,ili9806e.yaml        | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
new file mode 100644
index 000000000000..cfd7cc9c8725
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili9806e.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI9806E based MIPI-DSI panels
+
+maintainers:
+  - Michael Walle <mwalle@kernel.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - ortustech,com35h3p70ulc
+      - const: ilitek,ili9806e
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+  vccio-supply: true
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - vccio-supply
+  - reset-gpios
+  - backlight
+  - port
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
+            compatible = "ortustech,com35h3p70ulc", "ilitek,ili9806e";
+            reg = <0>;
+            vdd-supply = <&reg_vdd_panel>;
+            vccio-supply = <&reg_vccio_panel>;
+            reset-gpios = <&gpio3 6 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
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
2.39.2

