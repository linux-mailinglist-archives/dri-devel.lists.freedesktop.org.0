Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7210BAABF9E
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 11:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B9E10E633;
	Tue,  6 May 2025 09:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dr47fZUk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B229210E633
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 09:33:52 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso164596366b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 02:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746524031; x=1747128831; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qhA4vB5QX4cGx67rLq/kl8NrO4ybnOcVhUciXhl2JI0=;
 b=Dr47fZUk3tLBn3RloRvdKeZDazMCtkNd1EfdXpjg2TZYmfSv7pN2BGE+QeZE3g/Gxk
 KWV65nYlIfebmsPfv5Od2kOnygXZpRGXgQpxkfX0C4PIkBl1QlRQ1WVf+rBZv/RDIxae
 JU5SZo2DOxycfheDLUNDOwUXAcMVgYQT0kvOjT+k3iuijQIpqaHt6yGHr+sVqA1b6SEw
 bHrGIhwrfUGZ9zYiz+k0Qm9OUlsnKVSE8ujGoC6gwD2Y6dJunNFkW/ZCFP0P7a02KF/m
 SLdcbGgVuoCqn3huRxFyzi9PeH0A8yz2p7doup7dC52AsrHDkmjyt+Ql7Y5R3Fa/dbfM
 XP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746524031; x=1747128831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qhA4vB5QX4cGx67rLq/kl8NrO4ybnOcVhUciXhl2JI0=;
 b=a/OUBoJK08VICSEt90HWVq+OVMddCjNZQ1XLkF4UJvvnvEjqQ2I1tth2Z2IExCN54L
 r/IeF9EnPHwk2JR47UVQM4/OZkfgjzptkb+05LQLsE9XaKqXvwNYFsAlQdgogsIiPBiZ
 fxmqebxzLeclhPx1Uz+V0AYCO9HI3NvYd/G+CRoRpiaitLhiStZlehTRUlye2x7ej5g2
 +pCwDo+Hnbz4oQAArV/R/SsfiBB+YqTBmQQIEYDRotbNGiAqVmFEG68yG71Sa5zbvMEC
 pYpbnWUuBpnmsc4/o/XriZGzMWh96N4bzAJXsgYbBmowJ2MD52gVFH+YzgIPMqClGKZp
 K47Q==
X-Gm-Message-State: AOJu0YyhefWtZ/vwpKhUVvXDu7Kv5ZV/TiHdAKzo2Jld08WzcjTHx6SC
 8jylq5dANVWfrkpFXlTgje70hfMAmc9yy/CQ0w+4qP1gdi7ZGUdo
X-Gm-Gg: ASbGncvJlU2bA2EUJLLw65ruNNroATh2ePIE2e7o7PfGuGmg2tXMMoX9GJR6bK7QL+l
 6Qh8nOsrDbbrGAG7AUj57nnBrFM8aaI54pTQToW7rNibFzWjBRhHGEU+sXsvekeaQyvXk0285dS
 P32EBaspv3Tw7ukGZltpppw0CaJLsIVb/Py+o0edoQilw3mnlrbPVbX7pJSKW2WM+GuYMcLTMm2
 4e8oqvezUKbnrcoT/pSgzzQfU5kmhpvvBGM6ZCkRpx43jwjO35vehBUGqFGWkDK5V7r/zmiOFQA
 mb/2Vawg1NRDXT/GeSi80fu8tiupWCaC
X-Google-Smtp-Source: AGHT+IFtCBcr7dFXi8hYBmPOb4L/CnUpKjpcGPLBRC3hn7FKEobypbJ4vI4+M83ZIMj8oevyLZNh3g==
X-Received: by 2002:a17:906:c142:b0:ace:c416:4231 with SMTP id
 a640c23a62f3a-ad17b470739mr1692264466b.12.1746524030821; 
 Tue, 06 May 2025 02:33:50 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1e1292696sm25594666b.111.2025.05.06.02.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 02:33:50 -0700 (PDT)
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
Subject: [PATCH v5 1/2] dt-bindings: display: bridge: Document Solomon SSD2825
Date: Tue,  6 May 2025 12:33:39 +0300
Message-ID: <20250506093340.106575-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506093340.106575-1-clamor95@gmail.com>
References: <20250506093340.106575-1-clamor95@gmail.com>
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

