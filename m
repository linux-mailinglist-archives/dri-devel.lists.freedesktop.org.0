Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0410A877732
	for <lists+dri-devel@lfdr.de>; Sun, 10 Mar 2024 14:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6378210E03E;
	Sun, 10 Mar 2024 13:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paroga.com header.i=@paroga.com header.b="ZQv77Iyx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paroga.com header.i=@paroga.com header.b="ZQv77Iyx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx201.easyname.com (mx201.easyname.com [217.74.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B1F10E03E
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Mar 2024 13:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=paroga.com; 
 s=easyname;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6mTkC7aLR9O3BERrlv16sEF/7s4nimCvcvJAgjIFGpg=; b=ZQv77IyxLDIcbRkNayXC+OUGsI
 N9vNxQslxSv87tqcJybnbZuiI6JfYoqFjulf/bN2i8Fxrv+teMzXuNzrb+CewjaUqogMECdf4og83
 lCeqrNaLRSDz4rMBsXUG3P23ux+UkIUeu4xJIaVr6p9rmPsQy8dJnrfHZDNIXEju8vZoUFGbyiUjo
 WZDXBjGtVDGNTbLipYQ4/Vq+P756SCHbPLcgBB5Sx6nHkJN6V3JXnllXeYHqpdLF8qor3C9kdZrUx
 wDAcmQxxYImNtDUcewDvPmYa6dG3Jsko3NJTkNQ3K24gVsL1vZFqNx24i8DcodVlnWcqTW8R9ScDk
 5WKCC7zA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=paroga.com; 
 s=easyname;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6mTkC7aLR9O3BERrlv16sEF/7s4nimCvcvJAgjIFGpg=; b=ZQv77IyxLDIcbRkNayXC+OUGsI
 N9vNxQslxSv87tqcJybnbZuiI6JfYoqFjulf/bN2i8Fxrv+teMzXuNzrb+CewjaUqogMECdf4og83
 lCeqrNaLRSDz4rMBsXUG3P23ux+UkIUeu4xJIaVr6p9rmPsQy8dJnrfHZDNIXEju8vZoUFGbyiUjo
 WZDXBjGtVDGNTbLipYQ4/Vq+P756SCHbPLcgBB5Sx6nHkJN6V3JXnllXeYHqpdLF8qor3C9kdZrUx
 wDAcmQxxYImNtDUcewDvPmYa6dG3Jsko3NJTkNQ3K24gVsL1vZFqNx24i8DcodVlnWcqTW8R9ScDk
 5WKCC7zA==;
Received: from 84-115-228-205.cable.dynamic.surfer.at ([84.115.228.205]
 helo=localhost.localdomain)
 by mx.easyname.com with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <paroga@paroga.com>)
 id 1rjJd8-0004yN-VW; Sun, 10 Mar 2024 13:54:27 +0000
From: Patrick Gansterer <paroga@paroga.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Patrick Gansterer <paroga@paroga.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: backlight: Add Texas Instruments LM3509
Date: Sun, 10 Mar 2024 14:52:56 +0100
Message-ID: <20240310135344.3455294-1-paroga@paroga.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Easy-Autoreply: EN
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

Add Device Tree bindings for Texas Instruments LM3509 - a
High Efficiency Boost for White LED's and/or OLED Displays

Signed-off-by: Patrick Gansterer <paroga@paroga.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v4:
  Use backlight_*() to access backlight_device
  Do not set backlight_properties.power

v3: https://lore.kernel.org/all/20240309132521.1290173-1-paroga@paroga.com/

Changes in v3:
  Improved device tree bindings documentation

v2: https://lore.kernel.org/all/20240308215617.1729664-1-paroga@paroga.com/

Changes in v2:
  Add device tree nodes for each output
  Addressed multiple smaller review comments

v1: https://lore.kernel.org/all/20240302212757.1871164-1-paroga@paroga.com/

 .../bindings/leds/backlight/ti,lm3509.yaml    | 139 ++++++++++++++++++
 1 file changed, 139 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml
new file mode 100644
index 000000000000..b67f67648852
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml
@@ -0,0 +1,139 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/ti,lm3509.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI LM3509 High Efficiency Boost for White LED's and/or OLED Displays
+
+maintainers:
+  - Patrick Gansterer <paroga@paroga.com>
+
+description:
+  The LM3509 current mode boost converter offers two separate outputs.
+  https://www.ti.com/product/LM3509
+
+properties:
+  compatible:
+    const: ti,lm3509
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  reset-gpios:
+    maxItems: 1
+
+  ti,brightness-rate-of-change-us:
+    description: Brightness Rate of Change in microseconds.
+    enum: [51, 13000, 26000, 52000]
+
+  ti,oled-mode:
+    description: Enable OLED mode.
+    type: boolean
+
+patternProperties:
+  "^led@[01]$":
+    type: object
+    description: Properties for a string of connected LEDs.
+
+    allOf:
+      - $ref: common.yaml#
+
+    properties:
+      reg:
+        description:
+          The control register that is used to program the two current sinks.
+          The LM3509 has two registers (BMAIN and BSUB) and are represented
+          as 0 or 1 in this property. The two current sinks can be controlled
+          independently with both registers, or register BMAIN can be
+          configured to control both sinks with the led-sources property.
+        minimum: 0
+        maximum: 1
+
+      label: true
+
+      led-sources:
+        allOf:
+          - minItems: 1
+            maxItems: 2
+            items:
+              minimum: 0
+              maximum: 1
+
+      default-brightness:
+        minimum: 0
+        maximum: 31
+        default: 18
+
+      max-brightness:
+        minimum: 0
+        maximum: 31
+        default: 31
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@36 {
+            compatible = "ti,lm3509";
+            reg = <0x36>;
+            reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
+
+            ti,oled-mode;
+            ti,brightness-rate-of-change-us = <52000>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0>;
+                led-sources = <0 1>;
+                label = "lcd-backlight";
+                default-brightness = <12>;
+                max-brightness = <31>;
+            };
+        };
+    };
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@36 {
+            compatible = "ti,lm3509";
+            reg = <0x36>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0>;
+                default-brightness = <12>;
+            };
+
+            led@1 {
+                reg = <1>;
+                default-brightness = <15>;
+            };
+        };
+    };
-- 
2.44.0

