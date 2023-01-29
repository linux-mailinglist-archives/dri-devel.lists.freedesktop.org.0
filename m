Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 771CD680026
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 17:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA8810E209;
	Sun, 29 Jan 2023 16:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127EF10E209
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 16:05:43 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 l35-20020a05600c1d2300b003dc4634a466so2461149wms.4
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 08:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hm5mrI3RgpwLUAtsZnlhddw9mw5PRfzcGs1n8G6C6S4=;
 b=SZ64e+Kc6nziZJCeyHf85r6SvB3DuSZHahZ4qIy8zToRjMTrpwIJr2byTCTV5lOakk
 NcUszeGBNXuO+J+asj7kVp8odelPcBHKdblLr2DfKTvLOnwqFq/MTc9Ac4sjQZhRsfP3
 ThS72xkjYj6uTXN86qPiNqjhnsJ10P1tQMoij+OSBBoys1pGcbz09PXLBX5AzKowXoll
 qUFgR6rKs0/IYyrRHyFtFmBvPWObtmAoSwUtfjMkNzk62WqeP4/np/FVSAF1yArPyKuw
 03PWSIepgB14C8t5B5raa6FqPAcVtK40wG7pEUM+NqB5XMkHmH2hxEnTv2Ri7YcqRFB/
 3p2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hm5mrI3RgpwLUAtsZnlhddw9mw5PRfzcGs1n8G6C6S4=;
 b=RmqUjNlOBP/nu4dNjMkxf+pfmnVKfv/BZpudvILp3BzqiVLOMe31i2F3jhUA1pqbss
 sK7hz1MmjgLsH9H5CjY8gsNkUnEMcPJ6ZoZClRTlKV+C76+TqmQXg9e87F896elCEPRb
 72pC1bvrwU6+PycwXdUbzGXvMs98I9LWM7i8nhaKTesdXY8JNhG1kzh2dhTCq3lXVGSP
 hZKU8aS8SGJtX48Z5DtvaYdfuFsTWxU/GE0sPeblHdtPTndPBf0cJ/ppKhcAzLit/D4y
 T23MuiE9qNufyCS9c2zgHGSwiWYYZNpDYmtXYEBlErASsyWLq9atAN/57SIDxKhQoWnH
 mecg==
X-Gm-Message-State: AFqh2kpxVf7Jw62E371iumfGVVxRKQS2HXlxf0/RgVVq4bsMvRKSog6A
 TZN10nTXgS+mCrDsxg7RZTFN6xZnTeR5lkfp
X-Google-Smtp-Source: AMrXdXvBpu2ZRGTQqc3v4lxW5p3SrvUYCCzJxj+bvgjNvonJMkC76GUT/EmB0YdJppmSxKWUZfqq7w==
X-Received: by 2002:a05:600c:34d1:b0:3db:1434:c51a with SMTP id
 d17-20020a05600c34d100b003db1434c51amr40669786wmq.40.1675008342320; 
 Sun, 29 Jan 2023 08:05:42 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 s15-20020a05600c384f00b003d9de0c39fasm15734648wmr.36.2023.01.29.08.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 08:05:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: display: bridge: sil,
 sii8620: convert to dtschema
Date: Sun, 29 Jan 2023 17:05:37 +0100
Message-Id: <20230129160537.32275-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the Silicon Image SiI8620 HDMI/MHL bridge bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Require also port@1 (Laurent)
---
 .../bindings/display/bridge/sil,sii8620.yaml  | 108 ++++++++++++++++++
 .../bindings/display/bridge/sil-sii8620.txt   |  33 ------
 2 files changed, 108 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml b/Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml
new file mode 100644
index 000000000000..6d1a36b76fcb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/sil,sii8620.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silicon Image SiI8620 HDMI/MHL bridge
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+properties:
+  compatible:
+    const: sil,sii8620
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: xtal
+
+  cvcc10-supply:
+    description: Digital Core Supply Voltage (1.0V)
+
+  interrupts:
+    maxItems: 1
+
+  iovcc18-supply:
+    description: I/O Supply Voltage (1.8V)
+
+  reset-gpios:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    unevaluatedProperties: false
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Video port for HDMI (encoder) input
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          MHL to connector port
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - cvcc10-supply
+  - interrupts
+  - iovcc18-supply
+  - reset-gpios
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bridge@39 {
+            reg = <0x39>;
+            compatible = "sil,sii8620";
+            cvcc10-supply = <&ldo36_reg>;
+            iovcc18-supply = <&ldo34_reg>;
+            interrupt-parent = <&gpf0>;
+            interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+            reset-gpios = <&gpv7 0 GPIO_ACTIVE_LOW>;
+            clocks = <&pmu_system_controller 0>;
+            clock-names = "xtal";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    mhl_to_hdmi: endpoint {
+                        remote-endpoint = <&hdmi_to_mhl>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    mhl_to_musb_con: endpoint {
+                        remote-endpoint = <&musb_con_to_mhl>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt b/Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt
deleted file mode 100644
index b05052f7d62f..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Silicon Image SiI8620 HDMI/MHL bridge bindings
-
-Required properties:
-	- compatible: "sil,sii8620"
-	- reg: i2c address of the bridge
-	- cvcc10-supply: Digital Core Supply Voltage (1.0V)
-	- iovcc18-supply: I/O Supply Voltage (1.8V)
-	- interrupts: interrupt specifier of INT pin
-	- reset-gpios: gpio specifier of RESET pin
-	- clocks, clock-names: specification and name of "xtal" clock
-	- video interfaces: Device node can contain video interface port
-			    node for HDMI encoder according to [1].
-
-[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-	sii8620@39 {
-		reg = <0x39>;
-		compatible = "sil,sii8620";
-		cvcc10-supply = <&ldo36_reg>;
-		iovcc18-supply = <&ldo34_reg>;
-		interrupt-parent = <&gpf0>;
-		interrupts = <2 0>;
-		reset-gpio = <&gpv7 0 0>;
-		clocks = <&pmu_system_controller 0>;
-		clock-names = "xtal";
-
-		port {
-			mhl_to_hdmi: endpoint {
-				remote-endpoint = <&hdmi_to_mhl>;
-			};
-		};
-	};
-- 
2.34.1

