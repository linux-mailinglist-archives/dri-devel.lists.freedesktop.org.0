Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8452E81CD98
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADEF10E81D;
	Fri, 22 Dec 2023 17:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 325 seconds by postgrey-1.36 at gabe;
 Fri, 22 Dec 2023 11:11:09 UTC
Received: from mecka.net (unknown [IPv6:2a01:4f8:1c1c:934f::1])
 by gabe.freedesktop.org (Postfix) with ESMTP id EE85410E77E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 11:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mecka.net; s=2016.11;
 t=1703243143; bh=lLn1TvkFpD62y29Aa+jQpFVZRQMCpTszyZVqB2SdRCE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=G4AUWUolEsmkt6OUpTMTH0p4mm9gguHy0BTTSr8GCPunr5uBvbmsJ8s06hnd61QFG
 lMsKyEtqm+KrIfON8N8WO7cR44V7arfzqXaGkiNsDF7q0wW73Bb5hhaNS2X/R6SJwd
 xHgLWvdlQW+Jf2YSbAR+DdGaUr8HSghf1YooLUu3btDeC+e9EnmIgvFcCwtJPnQNWy
 fsMKSJEXDXV9ZznTB/Lz8zJQCrxB0KOXHIjBW3DTazx4f8mkixFInqvhrLvJfe0Nc6
 CijCW6RaZv1o9LHu2OWKdBqE9aVJSPrgvSw+t6Ab7z82IrgdKdJ3irQVku8ebrlJJ0
 m7uLqcnTzu2Ng==
Received: from arthur.fritz.box (unknown [185.147.11.134])
 by mecka.net (Postfix) with ESMTPSA id 3E255370D3C;
 Fri, 22 Dec 2023 12:05:43 +0100 (CET)
From: Manuel Traut <manut@mecka.net>
Date: Fri, 22 Dec 2023 12:05:41 +0100
Subject: [PATCH 1/6] dt-bindings: display: panel: Add BOE
 TH101MB31IG002-28A panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231222-pinetab2-v1-1-e148a7f61bd1@mecka.net>
References: <20231222-pinetab2-v1-0-e148a7f61bd1@mecka.net>
In-Reply-To: <20231222-pinetab2-v1-0-e148a7f61bd1@mecka.net>
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
 Segfault <awarnecke002@hotmail.com>, Arnaud Ferraris <aferraris@debian.org>
X-Mailer: b4 0.12.4
X-Mailman-Approved-At: Fri, 22 Dec 2023 17:32:28 +0000
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
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for the BOE TH101MB31IG002-28A LCD panel. It is
used e.g. in the Pine64 Pinetab2 and PinetabV.

Signed-off-by: Manuel Traut <manut@mecka.net>
---
 .../display/panel/boe,th101mb31ig002-28a.yaml      | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,th101mb31ig002-28a.yaml b/Documentation/devicetree/bindings/display/panel/boe,th101mb31ig002-28a.yaml
new file mode 100644
index 000000000000..a8a5e1b4439b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,th101mb31ig002-28a.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/boe,th101mb31ig002-28a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BOE TH101MB31IG002-28A Pine64 Pinetab2 DSI Display Panel
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
+  reg:
+    description: the virtual channel number of a DSI peripheral
+
+  backlight:
+    description: phandle of the backlight device attached to the panel
+
+  enable-gpios:
+    description: a GPIO spec for the enable pin
+
+  power-supply:
+    description: core voltage supply
+
+
+  ports: true
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
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "boe,th101mb31ig002-28a";
+            reg = <0>;
+            backlight = <&backlight_lcd0>;
+            enable-gpios = <&pio 45 0>;
+            rotation = <90>;
+            power-supply = <&vcc_3v3>;
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    panel_in_dsi: endpoint@0 {
+                        reg = <0>;
+                        remote-endpoint = <&dsi0_out_con>;
+                    };
+                };
+            };
+        };
+    };
+
+...

-- 
2.43.0

