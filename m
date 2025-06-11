Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB4AAD5C3A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 18:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0D410E6D3;
	Wed, 11 Jun 2025 16:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="AZBnIro8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5257010E6C7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 16:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1749659638; bh=t7hdxYz+chmbcKWjNALyrNVpKeDqXfdchbiPUCyhJ8E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=AZBnIro8yt85w69usmIHTSxeHi32OmkcAChW3N36BpWTvyaydf0o5fiaksWUuKohL
 qXBGa6PgmlI0y8iXPifx/4KA554k4fdooCi458sgOMM9I9AvLSn5NxJPEo8FnPFt+T
 GOHfkcVofS7D2+1Nkk6UQp9cICIw4P08in1UKixY=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 11 Jun 2025 18:33:16 +0200
Subject: [PATCH v4 2/4] dt-bindings: display: panel: Add Himax HX83112B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-fp3-display-v4-2-ef67701e7687@lucaweiss.eu>
References: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
In-Reply-To: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
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
 Luca Weiss <luca@lucaweiss.eu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2316; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=t7hdxYz+chmbcKWjNALyrNVpKeDqXfdchbiPUCyhJ8E=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSa/yh5K+T861P0/TUJU7Q/RAQB+B5GNaj9ppv
 EWyzeadN1eJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEmv8gAKCRBy2EO4nU3X
 VvoOEACW0QL96gtaDGYOCCf4z/uZc1aXTxshqI8dINxhfgDT6kd2AAh0Kx+/WnePSQuvKcxYlMq
 TKSRodwTj4DVJfTbGDSLiqODQFL8ruCQcGP2xs8BMWFVwBQ2IY1uqn2sNqnCV3G87Z+5z4aU72T
 CRlZYcE+Qi4V+Zg03awUWTljt/pY/VlmFh/pVq40qSXswrSzHn5ZhE6JUfLTLhfNguO7BXYHoqt
 oTCnVRHiSzh4h+npAuB857BJU00+q63kbRCEY4RcBfOXBEOZwJN3OCMtAH9mf4vJYXauG7ZMU6k
 N2NP6ljB0JCfXilAe+X5SUFoNaOSI3FzIq4FJyJEyVupjGWF9r9zH8eoa77C3Vy7rnUGU7Wxn2M
 0+YAKcrsFPFG7VqBoGfaFhQFhfKefC2Lg1xOT6JYDrRX4mbCf7BEC7ktmFLALovXMXM9ralB4CY
 F04MjnlkRkBkJlBrFQrx0scdvYw9QTvIpUQhtqJFLYKWpkGB39pcLEtEfTYtnlD76wvpqe6w33X
 9lGArsT4zJkV3mp7+KLCFpDVPlJ1yDEidR1ULcnc8pxe1pbTgRgVG+EV7eL+F400KHP3vPID2F3
 pmLXGiKOgf1apiAKlJPd5YF4tgMvKuDvFfue2hofC5fFblVCfvVYYOH2W8czu6q59+v9exJc1NC
 h15Hr0pXHgR7VcQ==
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 .../bindings/display/panel/himax,hx83112b.yaml     | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e58bb3d45331490e0ae2764aa341d3c3391af550
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
@@ -0,0 +1,73 @@
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

