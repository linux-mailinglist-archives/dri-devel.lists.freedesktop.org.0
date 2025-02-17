Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B488EA38589
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 15:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0851910E264;
	Mon, 17 Feb 2025 14:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TeukRiut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D818A10E264
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 14:09:27 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-543d8badc30so5215069e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 06:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739801366; x=1740406166; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NBvpaDEnRYexWP0/rCT65mQ1l4vlz411qKmQ+5kOMDY=;
 b=TeukRiutxRcQVZZtZGRzGPSLAuZKnrIuOEL8zY4vD477oPWqTZrR90uf5ajt8tcCa9
 WE426B2qQNRp/sIyoHtqwOgnMJ0fuxyarGKsEe5CuXXUSl2Jp76h3wnEqIn2I46UYyh/
 C2JHbp6nGB7037xYi5o5sr3nqPR7HtMmo/75ev7o20FTIQ4yYvp4FrvIN4IXi8aFJ3tU
 vp/76DK9RWoPXTS5tmLaxanfvI95Y+VnW21w01Wjuwhw95rgJbV+Ne+ZYGUVfYACCVRO
 /PhzNuy6vviJpXv3gdnc8rOMjl18qLbO2SYGuH0/4oqM6SJeHa72zrqoQOLvTJbosCkw
 gW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739801366; x=1740406166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NBvpaDEnRYexWP0/rCT65mQ1l4vlz411qKmQ+5kOMDY=;
 b=vviIgu+XokWFpGvQQtcCThc5W4JFh9s/dZQzzsNrcoe1Py4omj8fj7IBYLysG2EY/2
 8vSsJ+2RAFhprBvNyXSyNnutCJwL4YkXznthjUXoRJ0eXqED08DLZMSkROALTpFRZrNV
 4Aly7IRcWZlC/WRVBaXxdpCmbMMy09Qd5ZCNKr4k6MwSDSOxaHLFepamaJPHOoQwY/mP
 mQFEl2aZHxcMkaivd/LTJNf9+SIug1KOYI0VEi3vNctVbo15VgDUlCWekAnHDENADkW+
 Umc5ygEbSck3AybQrtltgYjueBduyp51mZJYO4vHZ4DygycNdosVFC9EZTEfwmtlNG+O
 V9qA==
X-Gm-Message-State: AOJu0YwMf/mBjYWPuQiBL09X+E7EpogGluNYE8Jl9jKFTl62/7gQ8fgJ
 FvaXxGqesw7w8xLMGKa4sKKAK1pWFOFRPCd7xoZFaICTE6ecRl2f
X-Gm-Gg: ASbGncukBj22P2LU1qgRcrV7Jgb2HRCPAHb29CyUD2zGhKy6c8bIluUSAtl6mNmaKhm
 0WVcH+sLo3duQ1+vqyZWC2Brqev+NM3j6IsfMkvl4lonE+QSmOOgYr3qFBLqkJ/HUExRIze/01i
 WPrYCHmAapC6Aui+zLjNVxxFgZSNbRehc+odsnhNZPL2Ei4WoaK9syxcTy5ncS2FzIjSR404xkK
 wNiNiXNenIQ0sg9ccbie6b+3glvKM7AJDYm6U6hqCUSygpqubAUJyIc8YlUsK/VWDCTaJGVNyGY
 xLPspA==
X-Google-Smtp-Source: AGHT+IFxia5DKdKWgX6hkQJUH6EY+CAt795XfnBfkMfO9oSW6FA40NQb9/QyEftvaXCvsImNdilT9A==
X-Received: by 2002:a05:6512:3a91:b0:545:b89:30a4 with SMTP id
 2adb3069b0e04-5452fe6369fmr2389050e87.29.1739801364482; 
 Mon, 17 Feb 2025 06:09:24 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54531b8ac1dsm866855e87.75.2025.02.17.06.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:09:23 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: display: bridge: Document Solomon SSD2825
Date: Mon, 17 Feb 2025 16:09:09 +0200
Message-ID: <20250217140910.108175-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217140910.108175-1-clamor95@gmail.com>
References: <20250217140910.108175-1-clamor95@gmail.com>
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

Add bindings for Solomon SSD2825 MIPI master bridge chip that connects an
application processor with traditional parallel LCD interface and an LCD
driver with MIPI slave interface. The SSD2825 supports both parallel RGB
interface and serial SPI interface.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/bridge/solomon,ssd2825.yaml       | 141 ++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml b/Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
new file mode 100644
index 000000000000..e2d293d623b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/solomon,ssd2825.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Solomon SSD2825 RGB to MIPI-DSI bridge
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: solomon,ssd2825
+
+  reg:
+    maxItems: 1
+
+  reset-gpios: true
+
+  dvdd-supply:
+    description: Regulator for 1.2V digital power supply.
+
+  avdd-supply:
+    description: Regulator for 1.2V analog power supply.
+
+  vddio-supply:
+    description: Regulator for 1.8V IO power supply.
+
+  spi-max-frequency:
+    maximum: 1000000
+
+  spi-cpha: true
+  spi-cpol: true
+
+  clocks:
+    maxItems: 1
+    description: Reference TX_CLK used before PLL is locked.
+
+  solomon,hs-zero-delay-ns:
+    description:
+      HS zero delay period
+    minimum: 0
+    maximum: 1700
+    default: 133
+
+  solomon,hs-prep-delay-ns:
+    description:
+      HS prep delay period
+    minimum: 0
+    maximum: 1728
+    default: 40
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Video port for RGB input
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              bus-width:
+                enum: [ 16, 18, 24 ]
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Video port for DSI output (panel or connector)
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dsi@2 {
+            compatible = "solomon,ssd2825";
+            reg = <2>;
+
+            spi-max-frequency = <1000000>;
+
+            spi-cpha;
+            spi-cpol;
+
+            reset-gpios = <&gpio 114 GPIO_ACTIVE_LOW>;
+
+            dvdd-supply = <&vdd_1v2>;
+            avdd-supply = <&vdd_1v2>;
+            vddio-supply = <&vdd_1v8_io>;
+
+            solomon,hs-zero-delay-ns = <300>;
+            solomon,hs-prep-delay-ns = <65>;
+
+            clocks = <&ssd2825_tx_clk>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    bridge_input: endpoint {
+                        remote-endpoint = <&dpi_output>;
+                        bus-width = <24>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    bridge_output: endpoint {
+                        remote-endpoint = <&panel_input>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.43.0

