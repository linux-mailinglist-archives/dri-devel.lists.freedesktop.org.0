Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5560EAE381C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 10:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D0510E1C9;
	Mon, 23 Jun 2025 08:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ep33k22Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B0B10E1BE
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 08:15:31 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-553b165c80cso3674343e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 01:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750666530; x=1751271330; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qhA4vB5QX4cGx67rLq/kl8NrO4ybnOcVhUciXhl2JI0=;
 b=Ep33k22Zea716FPz3PJNur3VGUDi5JlixyHCFw706YyLNkpbl0UgdhoLA2vS8oMbQZ
 JTCm8DAbwogb4ZGJTzCxO1yo5pnJy/Byy+0nFzMaObDrxWFIQ/uJqkD+wRlnP4TonNKu
 nt37bSgTfzmGZxZontHu/h9k/PChTbxUG+aB2KVicorcTD+MI/aUuEWDsErG4XV79APm
 ZSnfuYGWzDMfvAiHl1TnQDonjkNvFhnH6fFNdStADg/YB8ZpzgOwcC1+fZAEiLB0tgVy
 jU5pfeY4LVnQdBjJgs6O6+cuWGBoX/QmiRTW5SWj/gEhg5nbpxyTOKoW+4jhZ1DyqqWv
 dq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750666530; x=1751271330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qhA4vB5QX4cGx67rLq/kl8NrO4ybnOcVhUciXhl2JI0=;
 b=f2ZC/D5p76u1Pc0SaYdj4DGVVEZMEKtZ0Xz9WgRTK9/diyXc9n/UFhru7W2nJsF/yw
 7xOaqhYGlQwJkdoks9mPJImd8v95kbk1ZC+V/cHmMOuQQUiZt5QxtXTFj8SoswacRTIF
 0FA7bZfnoXrCSgcV4I5Q2NUmpzfKb33g8GbYcT4DNcHWF9h2injoYauJmvf/zLI2z09M
 H/Yl1f2s1bmK5cxBOLaetx0hLexU0j7CT3dw596kxE1OIHLkjGeG8dWAjMUtMJVsA7yI
 E/JEdXjEV7zgwwrSdsCthk4h9vLo1XdF64l7HjW32glupBQjfIjotqtBbKn65Mc5BM+T
 MFUA==
X-Gm-Message-State: AOJu0Yy00Po/OWlhHVB1Fjzbbn7gSeHlh/8xDoLC3qDfWE4pT42rdnab
 ydFF5jfHfCgTwB3ZXk02C6K9as6pXeg45UdqVnwgoYLQ+nfG5/d1ySL3
X-Gm-Gg: ASbGncuCrIUfRnCS65GI2V2d/kpKTFaqp6IHypkTwhy5TXdvhba5NwgHzG9X9sTcqW4
 oKtgZb0zIudpRwZCmWczPVWVdY7D2wkCD+3qpHTNgeANelPY/RvQML0wAfPvomSEf27rGTaGy9v
 uYlBIaIXDcMkfboerpKAgrvnLb4YcITaG0pvU9bfcvFSdYk6QyhNyhiAgHbYjYVAxBqzzQLZthO
 HverK5E5ChcQpMzU4xITEQ+1faFPvN/og4t+hBSvFKEWRu8nUSVwp8b0iMgu0Js2ooz1EbiF98N
 nf2QpYmVFu8CTRR2pVdPl0+oCM7xabRwCDNXHipnP7escq4NVgjGkQ==
X-Google-Smtp-Source: AGHT+IF3QEi+k6EJ/xY0gmwMm2BjKyfzFhvFLowpbK8wmnngpEVMkOKV5dcDODOgqZ35fxin2tU5wQ==
X-Received: by 2002:a05:6512:220b:b0:553:260c:1b90 with SMTP id
 2adb3069b0e04-553e3bfed7fmr3615305e87.32.1750666529626; 
 Mon, 23 Jun 2025 01:15:29 -0700 (PDT)
Received: from xeon.. ([188.163.112.61]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e414483asm1308072e87.52.2025.06.23.01.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 01:15:29 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/2] dt-bindings: display: bridge: Document Solomon SSD2825
Date: Mon, 23 Jun 2025 11:15:03 +0300
Message-ID: <20250623081504.58622-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250623081504.58622-1-clamor95@gmail.com>
References: <20250623081504.58622-1-clamor95@gmail.com>
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
2.48.1

