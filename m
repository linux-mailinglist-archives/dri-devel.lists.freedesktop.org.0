Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6582CA40AD3
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 18:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26AA410E258;
	Sat, 22 Feb 2025 17:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="Aqa+ragB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59EB10E052
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 17:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1740247094; bh=uOTZ6w5F/QVUfzYDDHW1oSDwuDIcbKSfDmjsbQ08n8M=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=Aqa+ragBgDTY6nh25HY4HOXyRN/U9dnvsIBfc5tbSsFw96cjRzbnZki/Gi58y8bVu
 lL3wvitX2CgAVr9bOWw4l+XCDb5b++Be5gWJ2ZonJNi88K/ZiPecvGrrNz/8GlHIGk
 rHxulfQhbDXf0By0e1TsGEDtc/ae/RPNIFSbRxCI=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 22 Feb 2025 18:58:05 +0100
Subject: [PATCH 2/4] dt-bindings: display: panel: Add Himax HX83112B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-fp3-display-v1-2-ccd812e16952@lucaweiss.eu>
References: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
In-Reply-To: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2253; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=uOTZ6w5F/QVUfzYDDHW1oSDwuDIcbKSfDmjsbQ08n8M=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnuhAy2zK2gofuVwCEFjaW4Dk7ucYCGIT+QxvYi
 VwdQ87xbJOJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7oQMgAKCRBy2EO4nU3X
 VjspD/0ZDU4ZmU2PbTqUxEx4jwWkjKRaUTjbndEjvWc2jRg2rIzDMFiKRlhpF2P1NpsW1VeTnRm
 TwRq9gGnXotpqI7HC5HM+UltpxGIVyPCJp/SAt0NpDrmmiZp8z5Oqak/kAFDOijxT42gi+s98nN
 rk/ObWlZRtUBHOJNlBvN8VOTqC5UV+qXvOZNh0XtAiQg7cHhxPkaNSv/Xfhfqdo1oxRq0WUpx/J
 rJ+JTJBgwBQQRpEMFwgjQQT+teggx3DbxUzFatL9KZq/QSXc2mZ/ZGufHhl3u/ysvOplFJQtxeZ
 /BbAWPCXSK1yGixEX9WLfM1W6IuIM2pTn6EWK1rcbkiLDUY4kiRLY2HSFqOlhB48JWHfLI+Gqo6
 UGm1SN+W2rgKrcOBNA76ZRbspwU53/ggGKSXu436XM3go+qg3UdcZmR6qVJji16OvtRnG5pySs5
 zxcOhaP4XqjSA89A1OI9YmT/zkt8X54ppk9hKl4GmFf2W/RGv9DCicbo4oZ5w/9cv9Q+qNISWff
 MJGvV5jZx2BQVzADYJphc2XhSXaf0uj+5rYKIhVnHUXftT8S7un4L+OeYU0ueXTgcx4PsBmz7gn
 IyjDNE4xCIijXJJZ+GHAZpc9e38gKeLXvxYV4TieZsuGtkDqTvlNCCTXYT/0V9LKACQCG4tJcgY
 fb0TU7eXXM7UXdg==
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
Describe it and the Fairphone 3 panel from DJN using it.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 .../bindings/display/panel/himax,hx83112b.yaml     | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e6bd4b33d40be98e479d84617aea6d2af0df70e4
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
+      const: djn,fairphone-fp3-panel
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
+            compatible = "djn,fairphone-fp3-panel";
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
2.48.1

