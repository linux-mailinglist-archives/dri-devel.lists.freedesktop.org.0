Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3BCA42121
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C6110E423;
	Mon, 24 Feb 2025 13:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EUPFfXgY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADD110E027
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 15:33:17 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30613802a04so38568031fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 07:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740324796; x=1740929596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/xNQ5jZiYHJ7mGqPVKrUERwUHV0d9NVp53zY7eeij3s=;
 b=EUPFfXgYkDMuCl7g3Rcc7ulyNjuJ89iDiZj5QHEVmZkDVAPVCaqbnLLRhjEOse+5Fi
 6JuCKD/jMRhytO2eSg2babQvki2zR4u3U9a2B9MxAGeXqR5jvsaNaPUFDMZRY3FUuZPk
 ucis/cTgSecPNS8dqhNoKllxm5heEXz0h1V6D+LKghh+6JEQRlmV0nwC7ppA7ONm0V3w
 KiALWy4nhdtNln7OT/BsEI5pU5lzJeZQx7JpriA3OY8AHUG1ITpahfijMCF2Mjf9WoDR
 DRso4nTxEBetwE2Qfghz36X4ghzcYXAaUKi3t4zWWAORuzJHHrRzAMPE3qC9BR1LklIS
 lVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740324796; x=1740929596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/xNQ5jZiYHJ7mGqPVKrUERwUHV0d9NVp53zY7eeij3s=;
 b=xQgDbpBPg2LV6DPchKVgcSdSKZUz1jxYtNjLgbR82h2JB9rbG1MCNYHxQRxKVB/uGH
 OeGaJLAas1xOhiLDLx3HnvJTr+X82IshnkLa6zc4c8qI2IBmVXypdXwH5mWFoEB1r+BO
 D2YeatOWketYIn08jm3uY9A8LMTs+iv8tRYMeoVy9pdbbcCV6QEQBMjviZ7ME9q1666x
 wbBMursnXRJ2lRsHkqUnDQNHF4rj80flIv/TNYWz8a0E235HsYwUXCvyeGJRNQRlKDQv
 ybLkw1jXZ6FxqqWVQQ70dprikGkYVJ6bK1jSscusmz6acupIgeLfOYh+znN47DayWc43
 iICg==
X-Gm-Message-State: AOJu0YwiJZYpgdZE/STS69T/Xv+QW732X4TFRE+Dh/Z17nfUj6MZgOP0
 gjxwL1JFmBgjnp7pPwzlXsKmqqVhCK0Ng233jy8Nq+98Kpp8X/aF
X-Gm-Gg: ASbGncu6XDlhYl4cgkNKvWEZEmlZJpe+mTnlYT01cA/rPqtzngih0W46KMHCxEmXZim
 R/NlieggUoGihBJrNw+bUO6QNRUdSmc/ta59ZmZ16L9BW/kdq33o79nQHpg/2ipCCj/qSQCOlxe
 Sv82wZKPr6bCL4+0prj/AEL0e8MCIJ85WpyxXoVVfDYTttQ1BHQEJl1FY/vVR0NeOULasXYpxee
 KzR0PKPScM+Tas4FPMNclllbisFoo48fcI68P2Be4rvLNux1PaWsQabyXt8dkGA5VcUtk2tLj5C
 mNK4A5zByY7zo2Jl
X-Google-Smtp-Source: AGHT+IGhZKv66hyZd+R0sYrlUmONkzFhnHU8cGFVJ23YKzN8ubomX18t1RVBEPxkcZ1puaxhe+enHw==
X-Received: by 2002:a05:6512:2391:b0:545:cd5:84c9 with SMTP id
 2adb3069b0e04-5483912fd22mr3448281e87.10.1740324795595; 
 Sun, 23 Feb 2025 07:33:15 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54523dd8ca3sm3025569e87.181.2025.02.23.07.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 07:33:15 -0800 (PST)
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
Subject: [PATCH v3 1/2] dt-bindings: display: bridge: Document Solomon SSD2825
Date: Sun, 23 Feb 2025 17:32:43 +0200
Message-ID: <20250223153244.149102-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223153244.149102-1-clamor95@gmail.com>
References: <20250223153244.149102-1-clamor95@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

