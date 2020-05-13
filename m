Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D01B21D0F42
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 12:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523E56E9F4;
	Wed, 13 May 2020 10:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EE86E9F4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 10:06:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [106.200.233.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DBC9520575;
 Wed, 13 May 2020 10:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589364369;
 bh=n8ibRyccY5zE8PGYkmSz/Wdr+0AV8UG6ty9nZ2zTvco=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hd9/GFqMHfctSqzB+U00ibTjR3mPqoDRRY2l3pf1Vov3p5vNZ2jqxzuTO4qBxBVlr
 /5DQefdb6CybxLrCvozrjws3m2Kvea0jjsoN/vzM/fjh5P5/eAbOh/ElZ+HIaHF47V
 YIVAup3OvpdvfOBi8SxlOPxlSeeO2A+VpcEtFOZE=
From: Vinod Koul <vkoul@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH 2/3] dt-bindings: display: bridge: Add documentation for LT9611
Date: Wed, 13 May 2020 15:35:32 +0530
Message-Id: <20200513100533.42996-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200513100533.42996-1-vkoul@kernel.org>
References: <20200513100533.42996-1-vkoul@kernel.org>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-arm-msm@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lontium LT9611 is a DSI to HDMI bridge which supports 2 DSI ports
and I2S port as input and one HDMI port as output

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../display/bridge/lontium,lt9611.yaml        | 178 ++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
new file mode 100644
index 000000000000..77ee8cc35cd8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lontium LT9611 2 Port MIPI to HDMI Bridge
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+description: |
+  The LT9611 is a bridge device which converts DSI to HDMI
+
+properties:
+  compatible:
+    enum:
+      - lontium,lt9611
+
+  reg:
+    maxItems: 1
+    description: base I2C address of the device.
+
+  "#sound-dai-cells":
+    const: 1
+
+  interrupts:
+    maxItems: 1
+    description: interrupt line for the chip
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to active high RESET pin.
+
+  vdd-supply:
+    description: Regulator for 1.8V MIPI phy power.
+
+  vcc-supply:
+    description: Regulator for 3.3V IO power.
+
+  ports:
+    type: object
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        type: object
+        additionalProperties: false
+
+        description: |
+          HDMI port for HDMI output
+
+        properties:
+          reg:
+            const: 0
+
+        patternProperties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint: true
+
+        required:
+          - reg
+
+      port@1:
+        type: object
+        additionalProperties: false
+
+        description: |
+          MIPI port-1 for MIPI input
+
+        properties:
+          reg:
+            const: 1
+
+        patternProperties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint: true
+
+        required:
+          - reg
+
+      port@2:
+        type: object
+        additionalProperties: false
+
+        description: |
+          MIPI port-2 for MIPI input
+
+        properties:
+          reg:
+            const: 2
+
+        patternProperties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint: true
+
+        required:
+          - reg
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - vdd-supply
+  - vcc-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c10 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      lt9611_codec: hdmi-bridge@3b {
+        compatible = "lontium,lt9611";
+        reg = <0x3b>;
+
+        reset-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;
+        interrupts-extended = <&tlmm 84 IRQ_TYPE_EDGE_FALLING>;
+
+        vdd-supply = <&lt9611_1v8>;
+        vcc-supply = <&lt9611_3v3>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            lt9611_out: endpoint {
+              remote-endpoint = <&hdmi_con>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+            lt9611_a: endpoint {
+              remote-endpoint = <&dsi0_out>;
+            };
+          };
+
+          port@2 {
+            reg = <2>;
+            lt9611_b: endpoint {
+              remote-endpoint = <&dsi1_out>;
+            };
+          };
+        };
+      };
+    };
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
