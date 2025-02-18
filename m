Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBC1A39D5D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 14:27:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C63910E008;
	Tue, 18 Feb 2025 13:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K2N5YiOv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE0410E6C5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 13:27:24 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30795988ebeso56984971fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 05:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739885243; x=1740490043; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JcY0j5/3e6cwhup+7TTVg+eO1rssFDj9P+AQ5rPw/gQ=;
 b=K2N5YiOv2/1SApJ5aqAk/MLHhTiy+CWKjMXgmdaJU985T17Xc4uiZyGhesEjdftjjN
 GPTXHl1ku3xUH8GbGtoddO4tYjo16BR3GL78yAnfIdxvdCBoJeINrLR7Gw/FIU2eSjyT
 kH+Co8cxwyxH1NVt1W+jnNh5ncIc8G5QIsb6sbjnp8QRb0d9HOSps60BYam9Ul46hfim
 YBY2rM4UAC20xXsAEKdlIudLfunlFZdushCw39fACDzo51iNxSn+L9OF9GD2hQa7c852
 yVPe23VikHLDBOwMuC9HDYJDnEOZ4OXYkMmBnRqGUwskSnxOdadBsHgo3iFA8AO4KbxJ
 L3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739885243; x=1740490043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JcY0j5/3e6cwhup+7TTVg+eO1rssFDj9P+AQ5rPw/gQ=;
 b=cc88gox4jAntvluRCeu/68zd+HJEyA6mwm0eQOJ8nU2Cj48wuOOWa4tDrXbSLdb7Yv
 kvl3CuMlJNW5JmxxVcATv21H//irRLHXab53NLmEix+wSS0cK0hyU+sAQl2Hm/rbkfKB
 PDElzs3YNAeqegRJDavyAX3wcArGYabCWHnPwzsdjj1odD4Hj+9kJt9q4tThatve7InJ
 xQR0yxl8mSDONeRmrNuGJlfecjDQGlGpTrjWgIATCrZWVRK8AFRISor8JxcQAnxp7pBs
 ZTqChEjQvHcTq7sBPfDSbT3hFfMuCz0R8Gx0DD7KblKM5DyZrBM8wf9vrZxUPV8wtHIS
 Tfeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwsqSONiLR+Y0kqTzF+tD85MMraD4ux10iEB1qAkvAE7A7tfteCZrWhzZrUDZbiXaHPF7lej3UBU8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/R6UyoZ2toN6UrM6gkrLUI0nJwETBUUGjvAvN6OOr1r/EpkFV
 CXM2LwCOV3WUOUv/hI4OJeho5iGV6TK+b9hPmB2iKMhXkBipgKhb
X-Gm-Gg: ASbGnctUpfTUgUb8RciQrJ79ZBWfUQ+70t0D7gCUA0zWkw88Q5/xvJku359CzWIyrwR
 NaADjtLQiLZBzLBf7pRO1PD5prWOMSO/gWqv/dHZhD1+jhNxb+Lu6qv+/ItxqJj21Ouz2hUCJIa
 ZqqiGTrWeLdAEXA3f56srHVl/pU08IT5DjLBruK4VqLVClx1d3j8kDuB9mnNyTlQL2cbuE8LlsU
 jLde4SeZWws0hsZsVZaqJagQ2Z/O1IT1oGP9aEjfssImQWW4fwUlXToAMSoGJ2Or4Ky7lq/GL3o
 vzuQ7xs=
X-Google-Smtp-Source: AGHT+IG7tPc6iGrk3gZc+02r/zA9o519WXklYX8dI8yKaw0rkGB2udrfLJPL+83phxgroT7H/mERbQ==
X-Received: by 2002:a2e:9f54:0:b0:2fa:d2c3:a7e8 with SMTP id
 38308e7fff4ca-30927a474a1mr38564601fa.13.1739885242803; 
 Tue, 18 Feb 2025 05:27:22 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30917da0e64sm18300851fa.88.2025.02.18.05.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 05:27:22 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: mfd: Document TI LM3533 MFD
Date: Tue, 18 Feb 2025 15:26:59 +0200
Message-ID: <20250218132702.114669-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218132702.114669-1-clamor95@gmail.com>
References: <20250218132702.114669-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add bindings for the LM3533 - a complete power source for
backlight, keypad, and indicator LEDs in smartphone handsets.
The high-voltage inductive boost converter provides the
power for two series LED strings display backlight and keypad
functions.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/mfd/ti,lm3533.yaml    | 231 ++++++++++++++++++
 1 file changed, 231 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,lm3533.yaml

diff --git a/Documentation/devicetree/bindings/mfd/ti,lm3533.yaml b/Documentation/devicetree/bindings/mfd/ti,lm3533.yaml
new file mode 100644
index 000000000000..83542f0c7bf7
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,lm3533.yaml
@@ -0,0 +1,231 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,lm3533.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI LM3533 Complete Lighting Power Solution
+
+description: |
+  The LM3533 is a complete power source for backlight,
+  keypad, and indicator LEDs in smartphone handsets. The
+  high-voltage inductive boost converter provides the
+  power for two series LED strings display backlight and
+  keypad functions.
+  https://www.ti.com/product/LM3533
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    const: ti,lm3533
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  enable-gpios:
+    description: GPIO to use to enable/disable the backlight (HWEN pin).
+    maxItems: 1
+
+  ti,boost-ovp-microvolt:
+    description:
+      Boost OVP select (16V, 24V, 32V, 40V)
+    enum: [ 16000000, 24000000, 32000000, 40000000 ]
+    default: 16000000
+
+  ti,boost-freq-hz:
+    description:
+      Boost frequency select (500KHz or 1MHz)
+    enum: [ 500000, 1000000 ]
+    default: 500000
+
+  light-sensor@0:
+    type: object
+    description:
+      Properties for an illumination sensor.
+
+    properties:
+      compatible:
+        const: ti,lm3533-als
+
+      reg:
+        const: 0
+
+      ti,resistor-value-ohm:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Internal configuration resister value when ALS is in Analog Sensor
+          mode and PWM mode is disabled.
+        minimum: 1575
+        maximum: 200000
+
+      ti,pwm-mode:
+        type: boolean
+        description: |
+          Switch for mode in which ALS is running. If this propertly is
+          set then ALS is running in PWM mode, internal resistor value is
+          set to high-impedance (0) and resistor-value-ohm propertly is
+          ignored.
+
+    required:
+      - compatible
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+  - enable-gpios
+
+patternProperties:
+  "^backlight@[01]$":
+    type: object
+    description:
+      Properties for a backlight device.
+
+    $ref: /schemas/leds/backlight/common.yaml#
+
+    properties:
+      compatible:
+        const: ti,lm3533-backlight
+
+      reg:
+        description: |
+          The control bank that is used to program the two current sinks. The
+          LM3533 has two control banks (A and B) and are represented as 0 or 1
+          in this property. The two current sinks can be controlled
+          independently with both banks, or bank A can be configured to control
+          both sinks with the led-sources property.
+        minimum: 0
+        maximum: 1
+
+      default-brightness: true
+
+      ti,max-current-microamp:
+        description:
+          Maximum current in µA with a 800 µA step.
+        enum: [ 5000, 5800, 6600, 7400, 8200, 9000, 9800,
+                10600, 11400, 12200, 13000, 13800, 14600,
+                15400, 16200, 17000, 17800, 18600, 19400,
+                20200, 21000, 21800, 22600, 23400, 24200,
+                25000, 25800, 26600, 27400, 28200, 29000,
+                29800 ]
+        default: 5000
+
+      ti,pwm-config-mask:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Control Bank PWM Configuration Register mask that allows to configure
+          PWM input in Zones 0-4
+          BIT(0) - PWM Input is enabled
+          BIT(1) - PWM Input is enabled in Zone 0
+          BIT(2) - PWM Input is enabled in Zone 1
+          BIT(3) - PWM Input is enabled in Zone 2
+          BIT(4) - PWM Input is enabled in Zone 3
+          BIT(5) - PWM Input is enabled in Zone 4
+
+      ti,linear-mapping-mode:
+        description: |
+          Enable linear mapping mode. If disabled, then it will use exponential
+          mapping mode in which the ramp up/down appears to have a more uniform
+          transition to the human eye.
+        type: boolean
+
+      ti,hardware-controlled:
+        description: |
+          Each backlight has its own voltage Control Bank (A and B) and there are
+          two HVLED sinks which by default are linked to respective Bank. Setting
+          this property will link both sinks to a Control Bank of backlight where
+          property is defined.
+        type: boolean
+
+    required:
+      - compatible
+      - reg
+
+    additionalProperties: false
+
+  "^led@[0-3]$":
+    type: object
+    description:
+      Properties for a led device.
+
+    $ref: /schemas/leds/common.yaml#
+
+    properties:
+      compatible:
+        const: ti,lm3533-leds
+
+      reg:
+        description:
+          4 led banks
+        minimum: 0
+        maximum: 3
+
+      linux,default-trigger: true
+
+      ti,max-current-microamp:
+        description:
+          Maximum current in µA with a 800 µA step.
+        enum: [ 5000, 5800, 6600, 7400, 8200, 9000, 9800,
+                10600, 11400, 12200, 13000, 13800, 14600,
+                15400, 16200, 17000, 17800, 18600, 19400,
+                20200, 21000, 21800, 22600, 23400, 24200,
+                25000, 25800, 26600, 27400, 28200, 29000,
+                29800 ]
+        default: 5000
+
+      ti,pwm-config-mask:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Same descryption and function as for backlight.
+
+    required:
+      - compatible
+      - reg
+
+    additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@36 {
+            compatible = "ti,lm3533";
+            reg = <0x36>;
+
+            enable-gpios = <&gpio 110 GPIO_ACTIVE_HIGH>;
+
+            ti,boost-ovp-microvolt = <24000000>;
+            ti,boost-freq-hz = <500000>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            backlight@0 {
+                compatible = "ti,lm3533-backlight";
+                reg = <0>;
+
+                ti,max-current-microamp = <23400>;
+                default-brightness = <113>;
+                ti,hardware-controlled;
+            };
+        };
+    };
+...
-- 
2.43.0

