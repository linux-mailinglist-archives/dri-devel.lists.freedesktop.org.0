Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B09AD4294
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 21:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DFD10E5C0;
	Tue, 10 Jun 2025 19:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="r3AM64gE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A944B10E5BE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 19:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1749582620; bh=JKv9j+MloBTNIEwt/Sjd6/2oEonQ8rDlDgo1+og22m0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=r3AM64gEICaZ68NORc1xJ7dyoEjIicSlBCKb5muJzqkY/NRpR6ejfCJJVcD7gTjfB
 VwkZh5ih3qWvmOoqRC1V8y7frtxf4+GfLu6LWWekphWPWXQg8k0E4RTuERAOts0+rD
 oqN1MwAmh3lY48oLXQKFIsayavpwCD3mUWAFgyY8=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 10 Jun 2025 21:09:20 +0200
Subject: [PATCH v3 2/4] dt-bindings: display: panel: Add Himax HX83112B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-fp3-display-v3-2-e7e7561812e1@lucaweiss.eu>
References: <20250610-fp3-display-v3-0-e7e7561812e1@lucaweiss.eu>
In-Reply-To: <20250610-fp3-display-v3-0-e7e7561812e1@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2267; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=JKv9j+MloBTNIEwt/Sjd6/2oEonQ8rDlDgo1+og22m0=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSIMZMmetvwadHrIYEmkQkVK24IDPVMIhIjbKr
 pk9Gf8Sk9mJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEiDGQAKCRBy2EO4nU3X
 VsUqD/sHY9lwB3CGrsB37mAdfKIOPIKMfCmMjVCBojPDbJZo5P6uVgNm8+6FUiSoOn8y1Nssigg
 7khdovPND5C8FvG0BZ0HsKiSqNAK4bMGhzOt3bgwvy3/TWbYlJUZqqEPcTMyNQd6fBtCMSY5Rfw
 QV0RvhlBPjAYao9k6I+vGC0zoY04dWBCCN7GxGPinc7xGfGy9gvapeDnXeEgcUUO9xyimFnjSDX
 AKgavECQi9XUGRAOrSLBYoPzlOfolbn4HS0F6njGiusQM9udmBSbzIVVY/gowbQ+xf3watTHTFh
 KO2q8yyrWyFh7NM5ZexcqI2Yqz8FGp3VdR6b23BnEDIYiwgqd+WnXuPnIYcJ8PfLJQOY6hzIt5S
 4XvdsPwZ7k85YtvKdwTq7xyizcxTXrgJKtfMhxQSJUonF4EUp3aQ99EQms1n42NcM3aqKIx1FRq
 WCsaomyTRfGpyTOcWQAcmbp3YQN1RY0EEKjOm/xkRgKO5MzwAloH1EUGJkiunMb6uqi+EJpi8j8
 prg+xTZdP7eFXYHO6zYx1SHc2NQFDjQijfGTY6Owalvjml9PRJcdAEF2lZth036YGYbJlGNP9mI
 HvUUguSaptQX+HHqcX7crotF/YOlVtv/WLhuAyRIqSeGTUq/CaHyMV1as8NmiZ/DSXqWkPzKPfx
 1Xt5OU/5SUllgMg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
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

Himax HX83112B is a display driver IC used to drive LCD DSI panels.
Describe it and the Fairphone 3 panel (98-03057-6598B-I) from DJN using
it.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 .../bindings/display/panel/himax,hx83112b.yaml     | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..54c555c18bbe7656ec625b20e28a53fde5fe578b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/himax,hx83112b.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HX83112B-based DSI display panels
+
+maintainers:
+  - Luca Weiss <luca@lucaweiss.eu>
+
+description:
+  The Himax HX83112B is a generic DSI Panel IC used to control
+  LCD panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    contains:
+      const: djn,98-03057-6598b-i
+
+  reg:
+    maxItems: 1
+
+  iovcc-supply:
+    description: I/O voltage rail
+
+  vsn-supply:
+    description: Positive source voltage rail
+
+  vsp-supply:
+    description: Negative source voltage rail
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - iovcc-supply
+  - vsn-supply
+  - vsp-supply
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
+            compatible = "djn,98-03057-6598b-i";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+
+            iovcc-supply = <&pm8953_l6>;
+            vsn-supply = <&pmi632_lcdb_ncp>;
+            vsp-supply = <&pmi632_lcdb_ldo>;
+
+            port {
+                panel_in_0: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.49.0

