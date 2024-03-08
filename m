Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBAB876CE4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 23:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD4E10E2B2;
	Fri,  8 Mar 2024 22:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paroga.com header.i=@paroga.com header.b="rvskoGce";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paroga.com header.i=@paroga.com header.b="rvskoGce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1010 seconds by postgrey-1.36 at gabe;
 Fri, 08 Mar 2024 22:14:20 UTC
Received: from mx202.easyname.com (mx202.easyname.com [217.74.15.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF2310E2B2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 22:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=paroga.com; 
 s=easyname;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qGiDozNNrYGn4zryVELqrnFRUu8Auu98h83A+0J6PBg=; b=rvskoGceC7x0jZP9YqGXsW3p04
 mxh7GofqKDbdu4zaqOnC8uuMOFVi0BV3hXd1/BThgQg5MjlvDCy1opTW2TxS46m/PS7Ut/Gk+wlzp
 PpdGZbMaFf0YWeFT7ArR9LjEUZYr5JT7IwyvqDWO5Ar+0+djejWcMOxxcelmjbYVm7FeIGnYvB71s
 ei+4t95MfgBMrI0p2w693VcmdTKVhtg+3nJzQ7xWSqe9EBAGlV5sg74tBYEZVfDMHMhPIyZc65E/J
 +/IAGasNYnuJVyFK+3OP39VE7VzTAS5JY7mQhky1I4rxLvrfzHGp4gexBLKCJciKNFuzFHU9MdbLD
 yrbrksDQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=paroga.com; 
 s=easyname;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qGiDozNNrYGn4zryVELqrnFRUu8Auu98h83A+0J6PBg=; b=rvskoGceC7x0jZP9YqGXsW3p04
 mxh7GofqKDbdu4zaqOnC8uuMOFVi0BV3hXd1/BThgQg5MjlvDCy1opTW2TxS46m/PS7Ut/Gk+wlzp
 PpdGZbMaFf0YWeFT7ArR9LjEUZYr5JT7IwyvqDWO5Ar+0+djejWcMOxxcelmjbYVm7FeIGnYvB71s
 ei+4t95MfgBMrI0p2w693VcmdTKVhtg+3nJzQ7xWSqe9EBAGlV5sg74tBYEZVfDMHMhPIyZc65E/J
 +/IAGasNYnuJVyFK+3OP39VE7VzTAS5JY7mQhky1I4rxLvrfzHGp4gexBLKCJciKNFuzFHU9MdbLD
 yrbrksDQ==;
Received: from 84-115-228-205.cable.dynamic.surfer.at ([84.115.228.205]
 helo=localhost.localdomain)
 by mx.easyname.com with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <paroga@paroga.com>)
 id 1riiDW-000AdK-J9; Fri, 08 Mar 2024 21:57:27 +0000
From: Patrick Gansterer <paroga@paroga.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Patrick Gansterer <paroga@paroga.com>
Subject: [PATCH v2 1/2] dt-bindings: backlight: Add Texas Instruments LM3509
Date: Fri,  8 Mar 2024 22:50:59 +0100
Message-ID: <20240308215617.1729664-1-paroga@paroga.com>
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
---
Changes in v2:
  Add device tree nodes for each output
  Addressed multiple smaller review comments

v1: https://lore.kernel.org/all/20240302212757.1871164-1-paroga@paroga.com/

 .../bindings/leds/backlight/ti,lm3509.yaml    | 138 ++++++++++++++++++
 1 file changed, 138 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml
new file mode 100644
index 000000000000..84ffd12d2f8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml
@@ -0,0 +1,138 @@
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
+required:
+  - compatible
+  - reg
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
+      label:
+        maxItems: 1
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
+
+      max-brightness:
+        minimum: 0
+        maximum: 31
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
+
+unevaluatedProperties: false
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

