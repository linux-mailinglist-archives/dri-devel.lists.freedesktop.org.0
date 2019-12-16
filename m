Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B8711FC34
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 01:32:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EB66E15C;
	Mon, 16 Dec 2019 00:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C7A6E059
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 00:32:20 +0000 (UTC)
Received: from ip5f5a5f74.dynamic.kabel-deutschland.de ([95.90.95.116]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1igeJ6-0004oF-NW; Mon, 16 Dec 2019 01:32:16 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] dt-bindings: display: panel: Add binding document for
 Xinpeng XPP055C272
Date: Mon, 16 Dec 2019 01:32:05 +0100
Message-Id: <20191216003206.6672-2-heiko@sntech.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216003206.6672-1-heiko@sntech.de>
References: <20191216003206.6672-1-heiko@sntech.de>
MIME-Version: 1.0
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

The XPP055C272 is a 5.5" 720x1280 DSI display.

changes in v2:
- add size info into binding title (Sam)
- add more required properties (Sam)

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/xinpeng,xpp055c272.yaml     | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
new file mode 100644
index 000000000000..2d0fc97d735c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sony,acx424akp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xinpeng XPP055C272 5.5in 720x1280 DSI panel
+
+maintainers:
+  - Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: xinpeng,xpp055c272
+  reg: true
+  backlight: true
+  port: true
+  reset-gpios: true
+  iovcc-supply:
+     description: regulator that supplies the iovcc voltage
+  vci-supply:
+     description: regulator that supplies the vci voltage
+
+required:
+  - compatible
+  - reg
+  - backlight
+  - iovcc-supply
+  - vci-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi@ff450000 {
+        panel@0 {
+            compatible = "xinpeng,xpp055c272";
+            reg = <0>;
+            backlight = <&backlight>;
+            iovcc-supply = <&vcc_1v8>;
+            vci-supply = <&vcc3v3_lcd>;
+        };
+    };
+
+...
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
