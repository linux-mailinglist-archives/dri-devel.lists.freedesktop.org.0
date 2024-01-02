Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B410B821F4E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 17:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D81C10E1EB;
	Tue,  2 Jan 2024 16:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mecka.net (unknown [IPv6:2a01:4f8:1c1c:934f::1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6265A10E1F2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 16:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mecka.net; s=2016.11;
 t=1704212152; bh=j5RQjHHjEK5PMWTnoys+kCde51784rTlmwN4k68Z7/0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=spSaVp2duUxvxmUGKf2GCI3Ks6qUdecVG3bBSH8rQOFT91WyULPvm2dlMLov4dk++
 8NNdJcBCD4+2FLf/dBdyEYx8eWiJKzYqO/0oT6dOcPtBaJ9iMg6gSm2WZYTZRxIa3f
 xie2Fr1BDZ0b+oxp2UYz9G3Y46C8fG1Vl5yRuxs/BqwA/y7zqLUULQdVZTkv++oGrb
 EGPr08Jee/gqGyo6G+vXjZ6FPoRPejB+mFIg7E/YsKRlF5N9WQ8Isdgxqen8pjKBBI
 q5Gs3059thjZEppTrVJ+RxY1zYAf4OX0iBJ+8uH/GtG5mteNiEuiDHwAoENR9bnsPz
 IhbKo7XOubkOw==
Received: from arthur.fritz.box (unknown [185.147.11.134])
 by mecka.net (Postfix) with ESMTPSA id 14925377C53;
 Tue,  2 Jan 2024 17:15:52 +0100 (CET)
From: Manuel Traut <manut@mecka.net>
Date: Tue, 02 Jan 2024 17:15:44 +0100
Subject: [PATCH v3 1/4] dt-bindings: display: panel: Add BOE
 TH101MB31IG002-28A panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-pinetab2-v3-1-cb1aa69f8c30@mecka.net>
References: <20240102-pinetab2-v3-0-cb1aa69f8c30@mecka.net>
In-Reply-To: <20240102-pinetab2-v3-0-cb1aa69f8c30@mecka.net>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sandy Huang <hjc@rock-chips.com>, Mark Yao <markyao0591@gmail.com>, 
 Diederik de Haas <didi.debian@cknow.org>, 
 Segfault <awarnecke002@hotmail.com>, Arnaud Ferraris <aferraris@debian.org>, 
 Danct12 <danct12@riseup.net>, Ondrej Jirman <megi@xff.cz>
X-Mailer: b4 0.12.4
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
Cc: devicetree@vger.kernel.org, Manuel Traut <manut@mecka.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for the BOE TH101MB31IG002-28A LCD panel. It is
used e.g. in the Pine64 PineTab2 and PineTab-V.

Signed-off-by: Manuel Traut <manut@mecka.net>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../display/panel/boe,th101mb31ig002-28a.yaml      | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,th101mb31ig002-28a.yaml b/Documentation/devicetree/bindings/display/panel/boe,th101mb31ig002-28a.yaml
new file mode 100644
index 000000000000..32df26cbfeed
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,th101mb31ig002-28a.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/boe,th101mb31ig002-28a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BOE TH101MB31IG002-28A WXGA DSI Display Panel
+
+maintainers:
+  - Manuel Traut <manut@mecka.net>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+        # BOE TH101MB31IG002-28A 10.1" WXGA TFT LCD panel
+      - boe,th101mb31ig002-28a
+
+  reg: true
+  backlight: true
+  enable-gpios: true
+  power-supply: true
+  port: true
+  rotation: true
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - power-supply
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
+        panel@0 {
+            compatible = "boe,th101mb31ig002-28a";
+            reg = <0>;
+            backlight = <&backlight_lcd0>;
+            enable-gpios = <&gpio 45 GPIO_ACTIVE_HIGH>;
+            rotation = <90>;
+            power-supply = <&vcc_3v3>;
+            port {
+                panel_in_dsi: endpoint {
+                    remote-endpoint = <&dsi_out_con>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.43.0

