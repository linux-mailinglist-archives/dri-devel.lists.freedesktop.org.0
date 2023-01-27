Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C2167EF97
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 21:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8BD10E2C4;
	Fri, 27 Jan 2023 20:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5211010E2C4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 20:35:31 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id m14so5552957wrg.13
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 12:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tOSLWb1vwjKO4WJ43/TjoArz+LQUiEIotvMCGvn9Rhg=;
 b=XrPghrfWp28VnVClJjRshC0wfHRxYPDGh6e4242w3yT8IYIZ4fRLKUv/MQiAoovS1M
 F0JOi92mTwNMozlOENVbeLAHM8xsOQdtyEnAxidL0dYrROc8ECbwvtDzF7tFCFsYzyrn
 cHaCuph3U0DADKUAFM30qB6FQNSxqiBP07d++LEezfrKFQfuxzQyupi7qpvSq+AiNJ27
 JOBRGl/Hpl7OkLXRenybG4FkVYXm2QyiGXLLWPpnyRm6nzuWGc3RNPN6OrvpLwFtJ70f
 XGeRMpflno8eKNKDSYpmgX7is3kIu8s+B9f1rbEpNxGfnb7PfF18oSXd1WLmmLOxs85m
 68Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tOSLWb1vwjKO4WJ43/TjoArz+LQUiEIotvMCGvn9Rhg=;
 b=WfdF3pmWnCvTen+vQfbEiwETvlX0jnoT7kJ1+QV7XcsHGemPj/1WgC2lHPpplQuJcA
 4M9dIRMVb93x0RPXH+AK/0JhQjvR+/wqXr0NFcJmX9dBxoBzzlY9uzaD17uop33dPqlY
 zjM+Y6ZfaLpQ6NRP0c10+HdRfPXe5/TJxF18Ik8DJqkUsdUICzLfhES7LYE3lVDbzQOQ
 UDun5py2l/KUdN0+c1PO2oG4ciCLnehvg6zK3FK97+gVq2Bzz19rLvmrJvm7sSd9y6SH
 Aqh1lSavW4q8B/77R7PmBg4Mai1nrCLbk6BvzHMGh0LKQlY7QoJUqK3QVCbKtuh79MnX
 YD9A==
X-Gm-Message-State: AO0yUKWJEXoT5jIacdjqzz70ObjIbXZ+Z74OBlKwssjZOGvlHmZnOp37
 RtdQrkO/ij1lNeHAL/bpDxMzXA==
X-Google-Smtp-Source: AK7set9mVzens57pP2p8N2/XE1w2NpWbMM1s3hvm8aruGMS6t42palIVYPktw+LHWlOQWaXw6ViYAw==
X-Received: by 2002:adf:e48c:0:b0:2bf:ae16:817c with SMTP id
 i12-20020adfe48c000000b002bfae16817cmr13488006wrm.29.1674851729760; 
 Fri, 27 Jan 2023 12:35:29 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 b14-20020adff90e000000b002be34f87a34sm4961307wrr.1.2023.01.27.12.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 12:35:29 -0800 (PST)
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
Subject: [PATCH] dt-bindings: display: bridge: sil,
 sii8620: convert to dtschema
Date: Fri, 27 Jan 2023 21:35:25 +0100
Message-Id: <20230127203525.198295-1-krzysztof.kozlowski@linaro.org>
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
 .../bindings/display/bridge/sil,sii8620.yaml  | 107 ++++++++++++++++++
 .../bindings/display/bridge/sil-sii8620.txt   |  33 ------
 2 files changed, 107 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml b/Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml
new file mode 100644
index 000000000000..90532bb99161
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml
@@ -0,0 +1,107 @@
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

