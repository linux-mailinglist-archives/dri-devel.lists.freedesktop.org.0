Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34590B1589C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 07:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4E410E36B;
	Wed, 30 Jul 2025 05:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c4zAQiXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEE010E35D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 05:55:07 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-61521cd7be2so4482818a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 22:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753854906; x=1754459706; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qhA4vB5QX4cGx67rLq/kl8NrO4ybnOcVhUciXhl2JI0=;
 b=c4zAQiXMvahZrSfNdm5f0HIey2vBBnhCGQKiPTvTZqdBjFh1UrKzZ5X7kjV4jBdjsL
 dzbioOsF31gYY/fY0x9a0b4b+Ltcah0WpfPltoQ/KM1m14OyBcR+bDnR8RrDziT5igm+
 LGcthz01/DrM+TrLfYNoiJDksc90gHAVAbIRebBsujqn7O/CwgG+p/qxuXHvLFv+WNoy
 4c7kmV4wV4PcJsqQv97CTo9HwI4mQcXv4zgVAGD0sqZYehtCh/c8O1UIkLIdJ0ToHiDh
 Gum7xUAvlp9n6Lg+N7H+VTHtXZPdYJvA8AXrTQ+likeTjGf/Of3DjwDIO03D5euYnZMh
 lXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753854906; x=1754459706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qhA4vB5QX4cGx67rLq/kl8NrO4ybnOcVhUciXhl2JI0=;
 b=QbCskxJHUlNAAtVQJ1Qf9W1H68azRe/YLjOZDFtZDSiWFH61xaFWx3OR8w+zbZ3op+
 +yXMNw1xs07/KfJwZOB4E9lI8vtCwVX1atbOsVwKQgAmrUOQAVCTMUzF57y0J7MMvFiN
 oj2IhT2W56GloQudWT3f75N/wkwzSPklg7p+k6oKXXrTsbotBfjcTOgIJJObAExaUiUg
 2HYB5WP2AmbxBVtAFKQUTBXecjvmkgFz4qZ+udFNkFhEs2DmPojQehLrxGEkpd7GBVQy
 yacy4uYgnoaDGAJoPOzoEX1OgSScjSZIySo1ycbmIB/FyHm826e0SWwg0l+MaKMzMHi+
 58DQ==
X-Gm-Message-State: AOJu0YzZyzWVvZyx5GBMYBPfo3XeRxN0yN3YJscfNtgWW3CF67yP/tKe
 U1VRl2lffzmma9mpkgiKesiVCC3jY1KJ4RQQl71qu6l/vVb69jQzcgOS
X-Gm-Gg: ASbGnctvCAZOKDIlEo6LqLAjg8e4r4/UI+KuPscM9RwFN8lV9CYxwSGetJYtXRzFd2y
 ZCzd+ZYrpLUyq5mlPslU2UFDIYLJJ3Askp0jMHqW74gxsNFC6zP/c/b1LWdIGFE4JxAtz+nH9E9
 OO6QBeelQbRWrr5qCsxcD11bbcnJOUYhbO42Dj8iDrQvz0CYxsbkgWJuVz4FQHqLafbt5ig1SUS
 fcmRmK7bsnDWItWETwmvtoMQC+2SlYWIL9IxeHVKf40cne8fVYQ89fWqXV+CJvS3727Vt9huGu3
 hQ2ooCbxOkOQCyrym51tuL4TaFGInmFdWuJLDFNHYe/U+qF+hu53IxEUICy6w+LEMEItGkV10sA
 Sudcst/G5mUoGkA==
X-Google-Smtp-Source: AGHT+IFaoDmYx7cvcFkPx/FkUm8P5NpJXgi+6mJ7HG79UybIPxMPQ/yqlRtz4qcA3hnPL9FsL5zQEg==
X-Received: by 2002:a17:907:720d:b0:af1:8336:6651 with SMTP id
 a640c23a62f3a-af8fd91a375mr220105366b.33.1753854905672; 
 Tue, 29 Jul 2025 22:55:05 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6157f2d6b94sm1014803a12.57.2025.07.29.22.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 22:55:05 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Heidelberg <david@ixit.cz>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/2 RESEND] dt-bindings: display: bridge: Document Solomon
 SSD2825
Date: Wed, 30 Jul 2025 08:54:23 +0300
Message-ID: <20250730055424.6718-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250730055424.6718-1-clamor95@gmail.com>
References: <20250730055424.6718-1-clamor95@gmail.com>
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

