Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B40916BD6C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 10:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F362E6EA6A;
	Tue, 25 Feb 2020 09:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7F56E1E2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 09:39:25 +0000 (UTC)
Received: from ip5f5a5d2f.dynamic.kabel-deutschland.de ([95.90.93.47]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1j6WgT-0004zb-RB; Tue, 25 Feb 2020 10:39:21 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] dt-bindings: display: panel: Add binding document for
 Elida KD35T133
Date: Tue, 25 Feb 2020 10:39:12 +0100
Message-Id: <20200225093913.415844-2-heiko@sntech.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200225093913.415844-1-heiko@sntech.de>
References: <20200225093913.415844-1-heiko@sntech.de>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, robin.murphy@arm.com,
 robh+dt@kernel.org, linux-rockchip@lists.infradead.org,
 thierry.reding@gmail.com,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>, sam@ravnborg.org,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

The KD35T133 is a 3.5" 320x480 DSI display used in the RK3326-based
Odroid Go Advance handheld device.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 .../display/panel/elida,kd35t133.yaml         | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
new file mode 100644
index 000000000000..4bd74eaa61be
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/elida,kd35t133.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Elida KD35T133 3.5in 320x480 DSI panel
+
+maintainers:
+  - Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: elida,kd35t133
+  reg: true
+  backlight: true
+  reset-gpios: true
+  iovcc-supply:
+     description: regulator that supplies the iovcc voltage
+  vdd-supply:
+     description: regulator that supplies the vdd voltage
+
+required:
+  - compatible
+  - reg
+  - backlight
+  - iovcc-supply
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi@ff450000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "elida,kd35t133";
+            reg = <0>;
+            backlight = <&backlight>;
+            iovcc-supply = <&vcc_1v8>;
+            vdd-supply = <&vcc3v3_lcd>;
+        };
+    };
+
+...
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
