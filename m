Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED20A41D86
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 12:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D333510E348;
	Mon, 24 Feb 2025 11:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SkdFPFmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBE310E2BF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 11:48:38 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-548409cd2a8so2430082e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 03:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740397717; x=1741002517; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+MBhvZt4vjLDC8q/lcIhSmOcrM6PKUkGdN2T76L0AmI=;
 b=SkdFPFmTeB5WDFaXRYTtPRIFdu/Hvl05SoX9BmTN5xIxTa70YVbpUS2YAjxxpirIsC
 iFf5kTNrfv3KGW5P0x9A5sq2tYL8nWaLfuD/GmQmyktBRgv+ggkiOuFboSc4FgXojMo2
 gitehNaa3QHX2IYK3acclTvDPh4kzqVPP8D7+mZU7fxQb42JG73KhnWQMbb5P4/R32F+
 CTE96sKIHrVdz6R/QbAzhYA0XiEW2XhOvTmaDM+pQbNnL30zV8sk6DLboZZtjwrlradF
 SitAODMHWKDc7l1IdL/28ex7hMdC90ZCV9UWg2Jbwg96KVFoaNjt1WRzm6F62UPGbYjL
 rO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740397717; x=1741002517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+MBhvZt4vjLDC8q/lcIhSmOcrM6PKUkGdN2T76L0AmI=;
 b=tyILyHlPIXHc2fNWeyqy3ZyywNuDMmCQQTEYsmYxYmlKNnyp1jo7v+Z3qfs7v7Q5iK
 1BqfjHGk04d0Kb0vqXZbW3xqKj97aEgC8wwePt4XkpuDe+6rbNJtVx9kUYlHUfc9EJil
 NHTA9wnCvvLmk7SMosHSxNALvymY0YIc/NepSCq4aKFj/FByXxfaJut1SUVMPhUb216p
 6ERlbi5hp/v/fpQ75dz2GvLVRdPYHILfFecug+NJ4O1LodlSfwZm3RmpQmn5X1xjNjC0
 NlCjAhinwwhbdZ2AhCfm0Ag+fM2BZaAv8gpu2nKlwA0zUz1Vfo3neCOnU+aB1QhZ6nh/
 RyFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW50IvouCze1yOVwbUKSnYigoYtzQNxNRyodjy61cJFcNTz48AFoyS9Ka0m7s5yu2aRXpmlJJDATrE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc3vKXIWyq7X7cajgZ84YBn2Nzb3dr6TQyF1skBTktMFTh+fTd
 iZTSbG0AWIhVhD79kzngqMX4DUX7cqAG4Bted6lVXSnX2+VLexTh
X-Gm-Gg: ASbGncvXQ46MP6nfu1IXw09p/sZZH+wwCY4kT31JBqi0QqNInHzLyFx9G99xWptJd5e
 Q+EKDtMA8D1fRldD5kKmsPIR2ggjr00E5kGQI5DkRfmRiZSWBJL/FN1FkEG9xffiQmjCMsx69yo
 bhXQ5P6ofhi2zvWI+mcG9LT9Hak9EhAntyh613Z8BRT12rYkmJyAqz7bh2Yw9LobU/yNRoKitQu
 aqMFEIOZopK6wpqgbc28B0NrKPVACsHYbE/DpsRxJXyuDfZHI0zRPvmuNzPGSaTQO2m50fQeERG
 mXekBknSzj+jsOKM
X-Google-Smtp-Source: AGHT+IH+HNPcxqMLKuJWsB6GW+NT134Jn0ypTXzkqAZNbymF35/Mv3onOVSc0hPbnddKKvR6W0yXaw==
X-Received: by 2002:a05:6512:ea1:b0:545:b49:f96d with SMTP id
 2adb3069b0e04-54838d43b7emr4464873e87.0.1740397716315; 
 Mon, 24 Feb 2025 03:48:36 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54526338bf9sm3167862e87.85.2025.02.24.03.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 03:48:35 -0800 (PST)
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
Subject: [PATCH v3 1/2] dt-bindings: mfd: Document TI LM3533 MFD
Date: Mon, 24 Feb 2025 13:48:13 +0200
Message-ID: <20250224114815.146053-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224114815.146053-1-clamor95@gmail.com>
References: <20250224114815.146053-1-clamor95@gmail.com>
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

Add bindings for the LM3533 - a complete power source for backlight, keypad
and indicator LEDs in smartphone handsets. The high-voltage inductive boost
converter provides the power for two series LED strings display backlight
and keypad functions.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/mfd/ti,lm3533.yaml    | 231 ++++++++++++++++++
 1 file changed, 231 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,lm3533.yaml

diff --git a/Documentation/devicetree/bindings/mfd/ti,lm3533.yaml b/Documentation/devicetree/bindings/mfd/ti,lm3533.yaml
new file mode 100644
index 000000000000..c8ac6d4424aa
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
+description: >
+  The LM3533 is a complete power source for backlight, keypad, and indicator LEDs
+  in smartphone handsets. The high-voltage inductive boost converter provides the
+  power for two series LED strings display backlight and keypad functions.
+
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
+  light-sensor:
+    type: object
+    description:
+      Properties for an illumination sensor.
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: ti,lm3533-als
+
+      ti,resistor-value-ohm:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Internal configuration resister value when ALS is in Analog Sensor
+          mode and PWM mode is disabled.
+        minimum: 1575
+        maximum: 200000
+
+      ti,pwm-mode:
+        type: boolean
+        description:
+          Switch for mode in which ALS is running. If this propertly is set
+          then ALS is running in PWM mode, internal resistor value is set to
+          high-impedance (0) and resistor-value-ohm propertly is ignored.
+
+    required:
+      - compatible
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - light-sensor
+  - backlight-0
+  - backlight-1
+  - led-0
+  - led-1
+  - led-2
+  - led-3
+
+patternProperties:
+  "^backlight-[01]$":
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
+        description:
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
+        description:
+          Enable linear mapping mode. If disabled, then it will use exponential
+          mapping mode in which the ramp up/down appears to have a more uniform
+          transition to the human eye.
+        type: boolean
+
+      ti,hardware-controlled:
+        description:
+          Each backlight has its own voltage Control Bank (A and B) and there are
+          two HVLED sinks which by default are linked to respective Bank. Setting
+          this property will link both sinks to a Control Bank of backlight where
+          property is defined.
+        type: boolean
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
+  "^led-[0-3]$":
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
+            backlight-0 {
+                compatible = "ti,lm3533-backlight";
+
+                ti,max-current-microamp = <23400>;
+                default-brightness = <113>;
+                ti,hardware-controlled;
+            };
+
+            backlight-1 {
+                compatible = "ti,lm3533-backlight";
+                status = "disabled";
+            };
+
+            led-0 {
+                compatible = "ti,lm3533-leds";
+                status = "disabled";
+            };
+
+            led-1 {
+                compatible = "ti,lm3533-leds";
+                status = "disabled";
+            };
+
+            led-2 {
+                compatible = "ti,lm3533-leds";
+                status = "disabled";
+            };
+
+            led-3 {
+                compatible = "ti,lm3533-leds";
+                status = "disabled";
+            };
+
+            light-sensor {
+                compatible = "ti,lm3533-als";
+                status = "disabled";
+            };
+        };
+    };
+...
-- 
2.43.0

