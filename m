Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7488A4582
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 22:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1541F112386;
	Sun, 14 Apr 2024 20:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="GbQKyzGY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 503 seconds by postgrey-1.36 at gabe;
 Sun, 14 Apr 2024 15:31:32 UTC
Received: from mail.mainlining.org (mainlining.org [94.241.141.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95AB10FFD0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 15:31:32 +0000 (UTC)
Received: from david-ryuzu.localdomain
 (ipbcc3a836.dynamic.kabel-deutschland.de [188.195.168.54])
 by mail.mainlining.org (Postfix) with ESMTPSA id 35E83E21DB;
 Sun, 14 Apr 2024 15:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1713108188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EtqK3uEi0BtvzaEa+6wDfgaSFywVG1Occvijkka7SVg=;
 b=GbQKyzGY3vX5Ra2kUdZX+6zjq49WnTZR2+JQUMaCTnVtyaSxsX9ZETC035w2ScD/8u5xc0
 SYUfkGYP3lL8zF90Bv7Xr2EG6CFsO+mrz5ehZuUKo1vcFvu8lZgud1Kl+KgZ6QkouT5aBN
 0b+EVqbPQ1mKjwiLVrwu5mIs9lJQLn/4S3LwZCZkvxwd3c1WQtjK1FA35iUom6RhYJLOCB
 5qMjYPGEaV7cnnYnFMOo6GdxBbrDfVrsiUFbWkwM+puAs8Tpy73YSvUqafrmngBP9iAVXW
 afzUr4qLb6YI7a/j9UeLAZkQgJpPttlNgseuz5wm8siMR3LB+gZ2wLiSDtYWCg==
From: David Wronek <david@mainlining.org>
Date: Sun, 14 Apr 2024 17:22:30 +0200
Subject: [PATCH 1/2] dt-bindings: display: panel: Add Raydium RM69380
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-raydium-rm69380-driver-v1-1-5e86ba2490b5@mainlining.org>
References: <20240414-raydium-rm69380-driver-v1-0-5e86ba2490b5@mainlining.org>
In-Reply-To: <20240414-raydium-rm69380-driver-v1-0-5e86ba2490b5@mainlining.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 David Wronek <david@mainlining.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713108185; l=2750;
 i=david@mainlining.org; s=20240121; h=from:subject:message-id;
 bh=iaVKhaEtwD3vSAsF6Kkc8NkVIHXOiq0xCW909ztf0Zw=;
 b=2qWujeaKtp1Jj2aeXeZqqhTLSo63aKqqMsvWwFXS1hqWu0fVA+wqK9mZQDiIL1XWNg5OZ+iDw
 Keo4kVMdbEGCxgW6FOij1pZxgNsX6R69WhP/zr04M0sJWe1OvXxtk6G
X-Developer-Key: i=david@mainlining.org; a=ed25519;
 pk=PJIYyFK3VrK6x+9W6ih8IGSJ5dxRXHiYay+gG1qQzqs=
X-Mailman-Approved-At: Sun, 14 Apr 2024 20:55:33 +0000
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
 .../bindings/display/panel/raydium,rm69380.yaml    | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml
new file mode 100644
index 000000000000..9b01b9c22ae9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/raydium,rm69380.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raydium RM6380-based DSI display panels
+
+maintainers:
+  - David Wronek <david@mainlining.org>
+
+description:
+  The Raydium RM69380 is a generic DSI Panel IC used to control
+  OLED panels.
+
+properties:
+  compatible:
+    items:
+      - const: lenovo,j716f-edo-rm69380
+      - const: raydium,rm69380
+
+  avdd-supply:
+    description: Analog voltage rail
+
+  vddio-supply:
+    description: I/O voltage rail
+
+  reset-gpios:
+    maxItems: 1
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
+allOf:
+  - $ref: panel-common-dual.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - lenovo,j716f-edo-rm69380
+    then:
+      properties:
+        port: false
+        ports:
+          required:
+            - port@1
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

