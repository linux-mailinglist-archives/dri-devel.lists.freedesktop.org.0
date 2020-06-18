Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 063B31FFE46
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 00:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C596E487;
	Thu, 18 Jun 2020 22:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF8B6E487
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 22:44:15 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id a13so7592732ilh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rfITGv97c7cMb+WeohbiFTmlyExW7qDVisN2PWuDKZk=;
 b=ZA1o7NbDl2uv7e58L7thOESadnTLzm39Vs40LUEk+2qVJoss3RWhDo9heql8yvCWwO
 Yd0g1Cz8ACxtdbQ105vzJ3Ao5natjLLaWL/fQNESx6jl8oiAMN1AkWaDKoTfRieBUw0V
 lK7IzWRj3uF/7wasuaywnVLBsvh3FJ04wKGZdesoV0uKReJzPHd+boDB6u3BBKwEAnIG
 ARHiF05ZlwsWflx4QCJ8IagcpsKpWHH7ZX1innTkIlcCVoHji+swB9vLiwDbLaSMTKQh
 UY346FZa5byPVDlNP3FsaiBJdy4hR//OJISYzLvFbleFUAhxtRUU4W9g2VAIwY9AKPfW
 0+9g==
X-Gm-Message-State: AOAM531y2cA7DcTRa2O7Wb7I8E+v2Jj6pcZ+xIUH24OMURfTX55zsWfE
 s4RwJF4cl7MkgnwZd/7VzA==
X-Google-Smtp-Source: ABdhPJzXW1Usk/qCclIYZ6LdMhqIbqVz2/F7Pljcz/cri28c7oKoRvdShQh0MP/2pgasCfzcmmEB4Q==
X-Received: by 2002:a92:5e59:: with SMTP id s86mr819176ilb.104.1592520255062; 
 Thu, 18 Jun 2020 15:44:15 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.253])
 by smtp.googlemail.com with ESMTPSA id z4sm2333784iot.24.2020.06.18.15.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 15:44:14 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] dt-bindings: backlight: Convert common backlight bindings to
 DT schema
Date: Thu, 18 Jun 2020 16:44:13 -0600
Message-Id: <20200618224413.1115849-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the common GPIO, LED, and PWM backlight bindings to DT schema
format.

Given there's only 2 common properties and the descriptions are slightly
different, I opted to not create a common backlight schema.

Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../leds/backlight/gpio-backlight.txt         | 16 ---
 .../leds/backlight/gpio-backlight.yaml        | 41 ++++++++
 .../bindings/leds/backlight/led-backlight.txt | 28 ------
 .../leds/backlight/led-backlight.yaml         | 58 +++++++++++
 .../bindings/leds/backlight/pwm-backlight.txt | 61 ------------
 .../leds/backlight/pwm-backlight.yaml         | 98 +++++++++++++++++++
 6 files changed, 197 insertions(+), 105 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/gpio-backlight.txt
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.txt
deleted file mode 100644
index 321be6640533..000000000000
--- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-gpio-backlight bindings
-
-Required properties:
-  - compatible: "gpio-backlight"
-  - gpios: describes the gpio that is used for enabling/disabling the backlight.
-    refer to bindings/gpio/gpio.txt for more details.
-
-Optional properties:
-  - default-on: enable the backlight at boot.
-
-Example:
-	backlight {
-		compatible = "gpio-backlight";
-		gpios = <&gpio3 4 GPIO_ACTIVE_HIGH>;
-		default-on;
-	};
diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
new file mode 100644
index 000000000000..75cc569b9c55
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/gpio-backlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: gpio-backlight bindings
+
+maintainers:
+  - Lee Jones <lee.jones@linaro.org>
+  - Daniel Thompson <daniel.thompson@linaro.org>
+  - Jingoo Han <jingoohan1@gmail.com>
+
+properties:
+  compatible:
+    const: gpio-backlight
+
+  gpios:
+    description: The gpio that is used for enabling/disabling the backlight.
+    maxItems: 1
+
+  default-on:
+    description: enable the backlight at boot.
+    type: boolean
+
+required:
+  - compatible
+  - gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    backlight {
+        compatible = "gpio-backlight";
+        gpios = <&gpio3 4 GPIO_ACTIVE_HIGH>;
+        default-on;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
deleted file mode 100644
index 4c7dfbe7f67a..000000000000
--- a/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-led-backlight bindings
-
-This binding is used to describe a basic backlight device made of LEDs.
-It can also be used to describe a backlight device controlled by the output of
-a LED driver.
-
-Required properties:
-  - compatible: "led-backlight"
-  - leds: a list of LEDs
-
-Optional properties:
-  - brightness-levels: Array of distinct brightness levels. The levels must be
-                       in the range accepted by the underlying LED devices.
-                       This is used to translate a backlight brightness level
-                       into a LED brightness level. If it is not provided, the
-                       identity mapping is used.
-
-  - default-brightness-level: The default brightness level.
-
-Example:
-
-	backlight {
-		compatible = "led-backlight";
-
-		leds = <&led1>, <&led2>;
-		brightness-levels = <0 4 8 16 32 64 128 255>;
-		default-brightness-level = <6>;
-	};
diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
new file mode 100644
index 000000000000..ae50945d2798
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/led-backlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: led-backlight bindings
+
+maintainers:
+  - Lee Jones <lee.jones@linaro.org>
+  - Daniel Thompson <daniel.thompson@linaro.org>
+  - Jingoo Han <jingoohan1@gmail.com>
+
+description:
+  This binding is used to describe a basic backlight device made of LEDs. It
+  can also be used to describe a backlight device controlled by the output of
+  a LED driver.
+
+properties:
+  compatible:
+    const: led-backlight
+
+  leds:
+    description: A list of LED nodes
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  brightness-levels:
+    description: Array of distinct brightness levels. The levels must be
+      in the range accepted by the underlying LED devices. This is used
+      to translate a backlight brightness level into a LED brightness level.
+      If it is not provided, the identity mapping is used.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  default-brightness-level:
+    description: The default brightness level (index into the array defined
+      by the "brightness-levels" property).
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+dependencies:
+  default-brightness-level: [brightness-levels]
+
+required:
+  - compatible
+  - leds
+
+additionalProperties: false
+
+examples:
+  - |
+    backlight {
+        compatible = "led-backlight";
+
+        leds = <&led1>, <&led2>;
+        brightness-levels = <0 4 8 16 32 64 128 255>;
+        default-brightness-level = <6>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
deleted file mode 100644
index 64fa2fbd98c9..000000000000
--- a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
+++ /dev/null
@@ -1,61 +0,0 @@
-pwm-backlight bindings
-
-Required properties:
-  - compatible: "pwm-backlight"
-  - pwms: OF device-tree PWM specification (see PWM binding[0])
-  - power-supply: regulator for supply voltage
-
-Optional properties:
-  - pwm-names: a list of names for the PWM devices specified in the
-               "pwms" property (see PWM binding[0])
-  - enable-gpios: contains a single GPIO specifier for the GPIO which enables
-                  and disables the backlight (see GPIO binding[1])
-  - post-pwm-on-delay-ms: Delay in ms between setting an initial (non-zero) PWM
-                          and enabling the backlight using GPIO.
-  - pwm-off-delay-ms: Delay in ms between disabling the backlight using GPIO
-                      and setting PWM value to 0.
-  - brightness-levels: Array of distinct brightness levels. Typically these
-                       are in the range from 0 to 255, but any range starting at
-                       0 will do. The actual brightness level (PWM duty cycle)
-                       will be interpolated from these values. 0 means a 0% duty
-                       cycle (darkest/off), while the last value in the array
-                       represents a 100% duty cycle (brightest).
-  - default-brightness-level: The default brightness level (index into the
-                              array defined by the "brightness-levels" property).
-  - num-interpolated-steps: Number of interpolated steps between each value
-                            of brightness-levels table. This way a high
-                            resolution pwm duty cycle can be used without
-                            having to list out every possible value in the
-                            brightness-level array.
-
-[0]: Documentation/devicetree/bindings/pwm/pwm.txt
-[1]: Documentation/devicetree/bindings/gpio/gpio.txt
-
-Example:
-
-	backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pwm 0 5000000>;
-
-		brightness-levels = <0 4 8 16 32 64 128 255>;
-		default-brightness-level = <6>;
-
-		power-supply = <&vdd_bl_reg>;
-		enable-gpios = <&gpio 58 0>;
-		post-pwm-on-delay-ms = <10>;
-		pwm-off-delay-ms = <10>;
-	};
-
-Example using num-interpolation-steps:
-
-	backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pwm 0 5000000>;
-
-		brightness-levels = <0 2048 4096 8192 16384 65535>;
-		num-interpolated-steps = <2048>;
-		default-brightness-level = <4096>;
-
-		power-supply = <&vdd_bl_reg>;
-		enable-gpios = <&gpio 58 0>;
-	};
diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
new file mode 100644
index 000000000000..7e1f109a38a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/pwm-backlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: pwm-backlight bindings
+
+maintainers:
+  - Lee Jones <lee.jones@linaro.org>
+  - Daniel Thompson <daniel.thompson@linaro.org>
+  - Jingoo Han <jingoohan1@gmail.com>
+
+properties:
+  compatible:
+    const: pwm-backlight
+
+  pwms:
+    maxItems: 1
+
+  pwm-names: true
+
+  power-supply:
+    description: regulator for supply voltage
+
+  enable-gpios:
+    description: Contains a single GPIO specifier for the GPIO which enables
+      and disables the backlight
+    maxItems: 1
+
+  post-pwm-on-delay-ms:
+    description: Delay in ms between setting an initial (non-zero) PWM and
+      enabling the backlight using GPIO.
+
+  pwm-off-delay-ms:
+    description: Delay in ms between disabling the backlight using GPIO
+      and setting PWM value to 0.
+
+  brightness-levels:
+    description: Array of distinct brightness levels. Typically these are
+      in the range from 0 to 255, but any range starting at 0 will do. The
+      actual brightness level (PWM duty cycle) will be interpolated from
+      these values. 0 means a 0% duty cycle (darkest/off), while the last
+      value in the array represents a 100% duty cycle (brightest).
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  default-brightness-level:
+    description: The default brightness level (index into the array defined
+      by the "brightness-levels" property).
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  num-interpolated-steps:
+    description: Number of interpolated steps between each value of brightness-levels
+      table. This way a high resolution pwm duty cycle can be used without
+      having to list out every possible value in the brightness-level array.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+dependencies:
+  default-brightness-level: [brightness-levels]
+  num-interpolated-steps: [brightness-levels]
+
+required:
+  - compatible
+  - pwms
+  - power-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    backlight {
+        compatible = "pwm-backlight";
+        pwms = <&pwm 0 5000000>;
+
+        brightness-levels = <0 4 8 16 32 64 128 255>;
+        default-brightness-level = <6>;
+
+        power-supply = <&vdd_bl_reg>;
+        enable-gpios = <&gpio 58 0>;
+        post-pwm-on-delay-ms = <10>;
+        pwm-off-delay-ms = <10>;
+    };
+
+  - |
+    // Example using num-interpolation-steps:
+    backlight {
+        compatible = "pwm-backlight";
+        pwms = <&pwm 0 5000000>;
+
+        brightness-levels = <0 2048 4096 8192 16384 65535>;
+        num-interpolated-steps = <2048>;
+        default-brightness-level = <4096>;
+
+        power-supply = <&vdd_bl_reg>;
+        enable-gpios = <&gpio 58 0>;
+    };
+
+...
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
