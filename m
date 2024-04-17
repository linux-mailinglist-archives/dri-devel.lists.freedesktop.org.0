Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C1E8A88DC
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 18:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF2910F752;
	Wed, 17 Apr 2024 16:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="DNNzHnfJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mainlining.org [94.241.141.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEDD10F752
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 16:29:39 +0000 (UTC)
Received: from david-ryuzu.localdomain
 (ipbcc3a836.dynamic.kabel-deutschland.de [188.195.168.54])
 by mail.mainlining.org (Postfix) with ESMTPSA id 5EEFDE1E3E;
 Wed, 17 Apr 2024 16:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1713371378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kCC1OXHE0ahT9Hbuxs9gCsCWn97AcT+f1n3yOCFLu98=;
 b=DNNzHnfJEZUv0cIGdTJ/OC8ngcj7KdNkf94kxES9YjOFvqUB+Os5ravoHXQjDbotNiCOJ/
 AKNDYo9Gwm8WiQ617N/a/HKpESYEozPWoKiP34go9ditLObkeltDdjLFwJPWPu3sBMdVSr
 HnZ9zHXNCedm1F7jajNyc9lwBLCE36NJxYyIf7DALGKn90g9ur9QdS5CMjpkVjj9wG/LMm
 j31HdJIkKcmWD88ZRJCEUtjxm5fJxMrp3bwX54kT/6Z4xOdxXo9rbK2aBUjxDBdtx+indc
 pwQmjLvnGVccYb+OYFmeLJLNX/r3BMr7f0Owfrgs8On8Uoiyl8FjB9fbbLoSYw==
From: David Wronek <david@mainlining.org>
Date: Wed, 17 Apr 2024 18:29:33 +0200
Subject: [PATCH v4 1/2] dt-bindings: display: panel: Add Raydium RM69380
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240417-raydium-rm69380-driver-v4-1-e9c2337d0049@mainlining.org>
References: <20240417-raydium-rm69380-driver-v4-0-e9c2337d0049@mainlining.org>
In-Reply-To: <20240417-raydium-rm69380-driver-v4-0-e9c2337d0049@mainlining.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, David Wronek <david@mainlining.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713371375; l=3031;
 i=david@mainlining.org; s=20240121; h=from:subject:message-id;
 bh=h5qZZjzoTRxtLs57A1m+Ned2UYZ4J/B9Lk8ufvsTNtI=;
 b=eEA2bl2+/AK7NVt/QBJD2qR7+rPLWt1oPhkBMkZ6U7ine90Eo5D2gA9itUHshahPPuY3bgedf
 xtLA2Rr9H+YCWx3X5GQyETgNGsIqUsDqu+b1GzAd7gPd48lkwbPUZVa
X-Developer-Key: i=david@mainlining.org; a=ed25519;
 pk=PJIYyFK3VrK6x+9W6ih8IGSJ5dxRXHiYay+gG1qQzqs=
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

Raydium RM69380 is a display driver IC used to drive OLED DSI panels.
Add a dt-binding for it.

Signed-off-by: David Wronek <david@mainlining.org>
---
Note:
Depends on commit 48a516363e29 ("dt-bindings: display: panel: add common dual-link schema")
---
 .../bindings/display/panel/raydium,rm69380.yaml    | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml
new file mode 100644
index 000000000000..b17765b2b351
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/raydium,rm69380.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raydium RM69380-based DSI display panels
+
+maintainers:
+  - David Wronek <david@mainlining.org>
+
+description:
+  The Raydium RM69380 is a generic DSI panel IC used to control
+  OLED panels.
+
+allOf:
+  - $ref: panel-common-dual.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - lenovo,j716f-edo-rm69380
+      - const: raydium,rm69380
+    description: This indicates the panel manufacturer of the panel
+      that is in turn using the RM69380 panel driver. The compatible
+      string determines how the RM69380 panel driver shall be configured
+      to work with the indicated panel. The raydium,rm69380 compatible shall
+      always be provided as a fallback.
+
+  avdd-supply:
+    description: Analog voltage rail
+
+  vddio-supply:
+    description: I/O voltage rail
+
+  reset-gpios:
+    maxItems: 1
+    description: phandle of gpio for reset line - This should be active low
+
+  reg: true
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+  - vddio-supply
+  - reset-gpios
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
+            compatible = "lenovo,j716f-edo-rm69380", "raydium,rm69380";
+            reg = <0>;
+
+            avdd-supply = <&panel_avdd_regulator>;
+            vddio-supply = <&vreg_l14a>;
+            reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    panel_in_0: endpoint {
+                        remote-endpoint = <&mdss_dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    panel_in_1: endpoint {
+                        remote-endpoint = <&mdss_dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...

-- 
2.44.0

