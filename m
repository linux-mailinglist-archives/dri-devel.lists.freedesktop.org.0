Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985279E76DD
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 18:18:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2427410E40A;
	Fri,  6 Dec 2024 17:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="Uy/g40pK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Fri, 06 Dec 2024 17:18:44 UTC
Received: from mta-64-226.siemens.flowmailer.net
 (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914C810F142
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 17:18:44 +0000 (UTC)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id
 20241206170840d8d1a158fcf25815c2
 for <dri-devel@lists.freedesktop.org>;
 Fri, 06 Dec 2024 18:08:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=nFgpbr9ICMll5siYBTjeBnhfrpbASPh3GUsaLse4SlY=;
 b=Uy/g40pKnJOGA0ubGEHMel5IVJlab1WTXv31IzQLQCOMke8TiYEpWc3j0aXad4lWBYIRUd
 hJCo+9VHQdpCX7Qy+K9i16CHp6eVVZNIM7ZZdjEPzkE4rubt13VnZEQAa3cB4CnF5VHg2/BM
 5OQGWGkLmWAMvX6wd7mRq8ISy8Yne85ZD7NodL0OEx8XQX8Vzq2xoBioQheEjLdJwGP7yvfg
 mD/6dXR7OS3OkkPFISMrYgN6vuzETjisUExFVCcicu//E8WXoVG+f4H7xhi3gt0uwA8p4Tpq
 rSU+yYCv17TELBo8s85YhGPxP5zfHDp8gUXr3/u42l3Yafp4skFhjuLg==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 dri-devel@lists.freedesktop.org, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 1/2] dt-bindings: backlight: Convert LP8860 into YAML format
 adding LP886x
Date: Fri,  6 Dec 2024 18:07:12 +0100
Message-ID: <20241206170717.1090206-2-alexander.sverdlin@siemens.com>
In-Reply-To: <20241206170717.1090206-1-alexander.sverdlin@siemens.com>
References: <20241206170717.1090206-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
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

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Add Texas Instruments' LP8864/LP8866 bindings into LP8860 converting them
into YAML format simultaneously. While here, drop the index of the "led"
subnode, this one is neither used nor mandated by the drivers. All the
*-cells properties are therefore not required.

Move the file into backlight directory because all of the LP886x drivers
are special backlight products.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 .../bindings/leds/backlight/ti,lp8860.yaml    | 86 +++++++++++++++++++
 .../devicetree/bindings/leds/leds-lp8860.txt  | 50 -----------
 2 files changed, 86 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8860.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-lp8860.txt

diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lp8860.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lp8860.yaml
new file mode 100644
index 0000000000000..3ece2f6fc3f02
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/ti,lp8860.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/ti,lp8860.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments - LP886x 4/6-Channel LED Driver family
+
+maintainers:
+  - Andrew Davis <afd@ti.com>
+  - Alexander Sverdlin <alexander.sverdlin@siemens.com>
+
+description: |
+  The LP8860-Q1 is an high-efficiency LED driver with boost controller.
+  It has 4 high-precision current sinks that can be controlled by a PWM input
+  signal, a SPI/I2C master, or both.
+
+  LP8866-Q1, LP8866S-Q1, LP8864-Q1, LP8864S-Q1 are newer products offering
+  similar functionality with 4/6 channels.
+
+  For more product information please see the links below:
+    https://www.ti.com/product/lp8860-q1
+    https://www.ti.com/product/LP8864-Q1
+    https://www.ti.com/product/LP8864S-Q1
+    https://www.ti.com/product/LP8866-Q1
+    https://www.ti.com/product/LP8866S-Q1
+
+properties:
+  compatible:
+    enum:
+      - ti,lp8860
+      - ti,lp8864
+
+  reg:
+    maxItems: 1
+    description: I2C slave address
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO pin to enable (active high) / disable the device
+
+  vled-supply:
+    description: LED supply
+
+  led:
+    type: object
+    $ref: common.yaml#
+    properties:
+      function: true
+      color: true
+      label: true
+      linux,default-trigger: true
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - led
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@2d {
+            compatible = "ti,lp8860";
+            reg = <0x2d>;
+            enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+            vled-supply = <&vbatt>;
+
+            led {
+                function = LED_FUNCTION_BACKLIGHT;
+                color = <LED_COLOR_ID_WHITE>;
+                linux,default-trigger = "backlight";
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
deleted file mode 100644
index 8bb25749a3da3..0000000000000
--- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-* Texas Instruments - lp8860 4-Channel LED Driver
-
-The LP8860-Q1 is an high-efficiency LED
-driver with boost controller. It has 4 high-precision
-current sinks that can be controlled by a PWM input
-signal, a SPI/I2C master, or both.
-
-Required properties:
-	- compatible :
-		"ti,lp8860"
-	- reg : I2C slave address
-	- #address-cells : 1
-	- #size-cells : 0
-
-Optional properties:
-	- enable-gpios : gpio pin to enable (active high)/disable the device.
-	- vled-supply : LED supply
-
-Required child properties:
-	- reg : 0
-
-Optional child properties:
-	- function : see Documentation/devicetree/bindings/leds/common.txt
-	- color : see Documentation/devicetree/bindings/leds/common.txt
-	- label : see Documentation/devicetree/bindings/leds/common.txt (deprecated)
-	- linux,default-trigger :
-	   see Documentation/devicetree/bindings/leds/common.txt
-
-Example:
-
-#include <dt-bindings/leds/common.h>
-
-led-controller@2d {
-	compatible = "ti,lp8860";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	reg = <0x2d>;
-	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
-	vled-supply = <&vbatt>;
-
-	led@0 {
-		reg = <0>;
-		function = LED_FUNCTION_BACKLIGHT;
-		color = <LED_COLOR_ID_WHITE>;
-		linux,default-trigger = "backlight";
-	};
-}
-
-For more product information please see the link below:
-https://www.ti.com/product/lp8860-q1
-- 
2.47.1

