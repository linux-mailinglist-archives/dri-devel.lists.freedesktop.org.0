Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054E1AC3EBC
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 13:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EE310E363;
	Mon, 26 May 2025 11:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P1bmXglR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A3910E363
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 11:44:26 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-60462e180e2so2299019a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 04:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748259865; x=1748864665; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qhA4vB5QX4cGx67rLq/kl8NrO4ybnOcVhUciXhl2JI0=;
 b=P1bmXglRmKVXJAzaCT1i3tLqerppntXrABBORwDJOv7udlzPOzW/WsVpN1vHi6nv7F
 vVyzTwWXztsVOvX9+NGYp5qBpgFN0VAvE/YF3wKPT+gJjkgr71bAOLgGtLc74jHQpjkO
 hJejUDYq4XOrlMr+kxzwx62X9mzb5Ai7oYrRLWA8REJ/g11aGJBA31VMiJIqE5+9RaWq
 l7ngiG8M5KfLDZKEsXzFvk4iaye6chXpnmx9+TLZXrENdV6afDF0epZTUFq3kb0beo78
 RcSFHYZxZfm1zYUm2uo+T8WFGiKDqC94x3Smlv3yRaC4orFfwcx75VsujRAEeZ01cDf7
 brlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748259865; x=1748864665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qhA4vB5QX4cGx67rLq/kl8NrO4ybnOcVhUciXhl2JI0=;
 b=NN6CqnbfT9740VStA0F6Xm85SaCURPIvD/x6EXBPlPVfbHXPttFnwjh3IJEk7MYOtS
 eciYFlJ/G4COogknzv5i4gq6hU2O1MuGuccUUeVuZd9hFepIeG5UwfiXwnNGeZHYKzB6
 xxGsSE23bEmVsvbnP7jI5zTFcPN6CIcghwRYK0C77fxFmfEjIh84SAYKnM+PhOTJMf2k
 CHtxqspdykL85+35D41KHiwusqKZxfxX6NPPPRub0IfPSZg9PUHFLuFus65N+c26hmV6
 I3hvGlhezrqV28qL7uGcYJryem1PWaFZmS2O8BtpaME+4krqCXpgM2iKCKvRmvjQVtrB
 sOwA==
X-Gm-Message-State: AOJu0YyMQ1mNH4U7ZGxbED/NB3AIdv/Jb9MPUNX7Hto9Mgsue3df4782
 ornb1bV2Wirbg/gp0jdvoOJCIrGGbhyjhAHi2XeZAz9Sfwi2gTmG6rhH
X-Gm-Gg: ASbGncu2m2UNdPwmlh+52uZDABEakShszpoU8zFIVtHZD9l1MWfDzP89mv8Q7yfva2X
 MhgCRBCff+r40CtvdAXwwAeM+uXwEOxaImqSutD8VQ/bQKN9xo95UP2mhIblJmDI3DLXmboz2CQ
 WLVZmx+r7+xqIJ8qsSS7ipcPwLquowRP9HZdLtPYW2LTcG7SNhlPylJEUzP/SFeX46YyzPLIv75
 ay0n0LhsBqfl4rchdOX2KNiUoM9iu1dcVTKLgZh/PwYa2rX9HbTzszCNPZ7B1wsa2QzrSWw3Eq9
 o4rBAA2DtIPpX7u9FYauQaENgPf9TCO1sBKmueiiQ6Q=
X-Google-Smtp-Source: AGHT+IFYB3Pg37qMXd511oOswKyKu832PASjC/HqGqTJ9l4yNAY5MqCpfKzCopQR9urjsfAbZT5/CA==
X-Received: by 2002:a05:6402:90b:b0:5fb:868b:5a59 with SMTP id
 4fb4d7f45d1cf-602da8ddecbmr6735163a12.32.1748259864556; 
 Mon, 26 May 2025 04:44:24 -0700 (PDT)
Received: from xeon.. ([188.163.112.65]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d4f1be3sm16270716a12.5.2025.05.26.04.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 04:44:24 -0700 (PDT)
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
Subject: [PATCH v6 1/2] dt-bindings: display: bridge: Document Solomon SSD2825
Date: Mon, 26 May 2025 14:43:52 +0300
Message-ID: <20250526114353.12081-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250526114353.12081-1-clamor95@gmail.com>
References: <20250526114353.12081-1-clamor95@gmail.com>
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

