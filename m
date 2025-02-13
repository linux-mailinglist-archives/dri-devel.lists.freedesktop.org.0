Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CF4A340EA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 14:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0417510EAAF;
	Thu, 13 Feb 2025 13:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Utejg8ZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C8610E3EA
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 13:56:40 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-543e4bbcd86so966129e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 05:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739454999; x=1740059799; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b1IGkQScRodOBygrIsMSnLoiENI5KM9I94X/GE+75SU=;
 b=Utejg8ZUnjRNoRA/8rWikMcYHG4hE3ZG48keKIgIye8RE6w4nhJ9hOM4XpK0WgQfB/
 TIc/6lf7Z2/CzCtsFiKoCiO3uWAjmEMhngTY79EyBZmeP5RqhIM949SH25z0mv4wsX8O
 xKknM0OTGgbc3C20jF3IcjiJYx4o0wzFk0zDiINEjPdvMFdLKuF1pLPur5e5QocsnK/p
 vZstc+SNLICDWqsX2TE7N6PGqp51fikA9+gb7Q50YVHqcfBI19RgiqWEx7qb0T7x6uFP
 M9gHaxATdBeOZhheqNIKq8uKFz/Z8YEXl601NQhvNv8G5q1+EZimDXqxrno+3t5laOxa
 H1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739454999; x=1740059799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b1IGkQScRodOBygrIsMSnLoiENI5KM9I94X/GE+75SU=;
 b=ClU9gZWSqF4raa8sgNjtGsLrS+LrtVotL+G6lHLSNdCMI90330JdFJXWDEeX2OjuSg
 E/CKYI0dJOYZWeTtFBV96oMGeT+5cfO+lJm4OJb7ebiwAxo3ChbrYK1yuzRRWUXf1qIv
 y+YjJbbBa2z7g/E4CT9e7TA/7gXxlLCAvkDScU1A0OtljiahM27PMeDU44AeBAj9uPWs
 /R5rL+sKuuz1ym2uLoAYcsVu1V+5QsmTPOri+zLC24XDoNE7z4fmUn95OU64gBoO5/aV
 qRW+/jN6B46ZQMRn+NV1WKI+np7ZCwHYNQUGUJQKk8t91FptgzDn9nwQ6e6SoON00dou
 36pA==
X-Gm-Message-State: AOJu0YzS+PiJPzdiLQRJZccbx9uP7wEMz4mG54NhslRkxLiV1ODz35kM
 5Rz6vMvN71DeQGRlqhNYSImDhZubLsvfMRd/U/n0qcruFx6LMOtV
X-Gm-Gg: ASbGncvysBiOZGaVXPv/5t61300aws8i4ov8/JTJIfokk4aqPoAj3BrmfKQOaAIm++A
 W345ys7Zdb2BZxqwHkI9+tnbnqPLH+nQXTSx6GiNoX4PJqPJ30IpJkmAJ//p1i1zi07NqIpU+Qj
 LFDpFbUqhVCps47oiISvz5VAIyDlItyqiEuWgahfR1FEdSIsr8X6LHuiKMr1acR7BEuQIkuK/YH
 oXJ+LboH+jaj1ZIX0MBlWp67G10kFCj5/3Lk3HJdHsVdh6v62BjtFRoezFZuVZlv8yGij3Qwt9q
 wziUZA==
X-Google-Smtp-Source: AGHT+IEQ5oFs1ifcABBwjOpA5t4U65S3XXvUcxsC19cuCWeiLav/s9wwWL2jOoOY4wqwjyi0rQBVhA==
X-Received: by 2002:a05:6512:3d0d:b0:545:d7d:ac4a with SMTP id
 2adb3069b0e04-545181771d1mr2208375e87.36.1739454998935; 
 Thu, 13 Feb 2025 05:56:38 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f105cdcsm177789e87.116.2025.02.13.05.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 05:56:38 -0800 (PST)
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
Subject: [PATCH v1 1/2] dt-bindings: display: bridge: Document Solomon SSD2825
Date: Thu, 13 Feb 2025 15:56:04 +0200
Message-ID: <20250213135605.157650-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213135605.157650-1-clamor95@gmail.com>
References: <20250213135605.157650-1-clamor95@gmail.com>
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
 .../display/bridge/solomon,ssd2825.yaml       | 140 ++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml b/Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
new file mode 100644
index 000000000000..cd7ff971495c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
@@ -0,0 +1,140 @@
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
+
+  clock-names:
+    const: tx_clk
+
+  solomon,hs-zero-delay-ns:
+    description:
+      HS zero delay period
+    default: 133
+
+  solomon,hs-prep-delay-ns:
+    description:
+      HS prep delay period
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
+            clock-names = "tx_clk";
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

