Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C279EB6C0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 17:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD1E10E929;
	Tue, 10 Dec 2024 16:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XohQEmR5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8068710E929
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733849017;
 bh=P6DWcP64YEGP5AhpEHJkbc/BzwjTPrNY96mOFNSx1tU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XohQEmR56poh8StU0tsC1qMwBw3P3zCVlqTxEMc+J3B3DH4YSOhtXVjse7bKrzHFS
 kgNuAV7Qtsu3YAw7e49y7IVwmR1fIN1D35MpTVkvW4JUMyuAAowsHZCT6CvemFlwmI
 gjaBF7xcUGOVPwwwUiQkNv47+vQgqrqXVxzyKUIezg2gRayp7IBAsNQEqEEiqyz7fN
 lrBTUycTp9x+Fv/DbyN4qkNsoq6j1ogpQ5X+WvLUiwgbDx2sF4//A5XZK5R7SKhBjP
 wl8i3Kdin9aEjvID8ACB49Hda3E/VJm7yLkFe60cvrr6InmFvKtDtOjOzJJZzidbFa
 c4ZePtjV13ofA==
Received: from jupiter.universe (dyndsl-091-248-190-127.ewe-ip-backbone.de
 [91.248.190.127])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: sre)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0597317E37B1;
 Tue, 10 Dec 2024 17:43:37 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
 id 6A46748CC8B; Tue, 10 Dec 2024 17:43:36 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Andy Yan <andyshrk@163.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com
Subject: [PATCH v1 1/2] dt-bindings: display: panel: Add Raydium RM67200
Date: Tue, 10 Dec 2024 17:41:30 +0100
Message-ID: <20241210164333.121253-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241210164333.121253-1-sebastian.reichel@collabora.com>
References: <20241210164333.121253-1-sebastian.reichel@collabora.com>
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

The Rockchip W552793DBA-V10 display/touchscreen board contains a
Wanchanglong W552793BAA panel, which in turn is using a Raydium
RM67200 MIPI-DSI controller. Add a DT binding for the DSI panel.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../display/panel/raydium,rm67200.yaml        | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
new file mode 100644
index 000000000000..d0a6d3207811
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/raydium,rm67200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raydium RM67200 based MIPI-DSI panels
+
+maintainers:
+  - Sebastian Reichel <sebastian.reichel@collabora.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - wanchanglong,w552793baa
+      - const: raydium,rm67200
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: 2.8V Logic voltage
+
+  iovcc-supply:
+    description: 1.8V IO voltage
+
+  vsp-supply:
+    description: positive 5.5V voltage
+
+  vsn-supply:
+    description: negative 5.5V voltage
+
+  backlight: true
+  port: true
+  reset-gpios: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - reg
+  - reset-gpios
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "wanchanglong,w552793baa", "raydium,rm67200";
+            reg = <0>;
+
+            vdd-supply = <&regulator1>;
+            iovcc-supply = <&regulator2>;
+            vsp-supply = <&regulator3>;
+            vsn-supply = <&regulator4>;
+            reset-gpios = <&gpiobank 42 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel0_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+...
-- 
2.45.2

