Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E9CA32078
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 08:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF30B10E7E4;
	Wed, 12 Feb 2025 07:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rp+i4p9w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9363510E7D7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 07:59:18 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5450c8b5b3aso509166e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 23:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739347157; x=1739951957; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nmzH8tnBHTD3rBbOaj/wPbPUR7lc2Xqk0vuNMvFINeE=;
 b=Rp+i4p9wc8ucU68Jg4qGKFkWlYyGb8mS1jptei/O5SxMyCJGoXWUQVns/exte9pcIy
 VOUGb5NSCJae6329nA6WKt8+CI5LBYrkCp2SHVVfMRgHrcpQHFay56jMQJQ2oteQ+gyq
 3girubBXCTWfibiZhQANptWr5OYGdYmKgd89TxYaZtIHjL3quA7XrO//3fMLnzjp0yR2
 fsFpjU2b9S1r9S8MAO3R3WSDSAjTBL/3Y0xLHy+594LFHbnygXTR3RS9pX6vXysN152b
 Hp4G7qdQ9YSs0Ev1DgP3cCtxA41Xvr0RzOnoawTDlkS3FB3kZHi3UzSYcRWgrk4evJ5P
 1C9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739347157; x=1739951957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nmzH8tnBHTD3rBbOaj/wPbPUR7lc2Xqk0vuNMvFINeE=;
 b=uBBNJ+UEWXDRzMWdI142DhHlXkh11qK5jTV/0yQvvmuj75I0cl6Q1/PbGm1OLPRhhO
 lSnVt5ejm4OXR9fYbOTEr42pqOlvrsaQrGzyH9EyjtGwqmi/eGphFPf/WvncBxjP7GzZ
 m1u5BV3Z5WsaGtNGLqFTr4kicP/A3LZVl2CHGZL8DbUoBuciYZEulCKDDtwl/rJJ4Z9e
 x1sOAQN0L4SrvucLMdpQLnxLWoJpK3uGFrUa3G8zid/+Emx/8Vz/zflP710V8GdLkWYe
 OyeJtucf9YCFSOG3xNCuxuuJ0JEXKX5PD/kCCEVWR9Wg4Grh7IxnYByPwNT9NYpwg8Gy
 UUjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxGx5P4GO9bziWgnEwU/N/IMcwkLVfK12kN5cDn4w3jjZdmZhXRvgXNN+lsHhgJWK6l1CfhM5ynok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydIDMgxKWZd/sASOyIl8BUF+UfwPmOrHnttQJvoyiZTHLaY7w9
 PVAaSXMMdkg8YbtXW+k9rv0AfY8D83UoZf130s8v/koc8XvAomSz1h9GMg==
X-Gm-Gg: ASbGnctF5ENCHyn3PJ5RExRTHN2H6PZmGisSuBpMqa7ceSNZwczuOgmIlUaYstFAVqX
 r/2z7zgm8vDCAkz+/R306grgQXn4YJBzKgstzt0mUegjp9pBNBFT505JSRB45spnirqt1G04N1r
 iYHsoW8KGDeU52mmH4VXu10+fS20gcFae9Uuu53pf6wZpQAh39UMMJkoc0OEe7VrbKNMdbf1eeC
 mrkYywsZidLj+kL8+f7vBDh4IZU5uQhu/2+qnFPGBkftqIGZqBOHspx6QfeedcrDYJM/u0hCMVe
 ld+O+iI=
X-Google-Smtp-Source: AGHT+IFZyQAKWZrZ4MuAfWBuJ1NpOgrEWJgJh1slnsJM+BJw6witruaZKKjsQOfYThAg7/upxVhUtg==
X-Received: by 2002:a05:6512:3d88:b0:545:1065:117f with SMTP id
 2adb3069b0e04-54511c71959mr2077959e87.17.1739347156597; 
 Tue, 11 Feb 2025 23:59:16 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441053eacfsm1797880e87.38.2025.02.11.23.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 23:59:16 -0800 (PST)
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
Subject: [PATCH v1 1/2] dt-bindings: mfd: Document TI LM3533 MFD
Date: Wed, 12 Feb 2025 09:58:41 +0200
Message-ID: <20250212075845.11338-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212075845.11338-1-clamor95@gmail.com>
References: <20250212075845.11338-1-clamor95@gmail.com>
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
 .../devicetree/bindings/mfd/ti,lm3533.yaml    | 221 ++++++++++++++++++
 include/dt-bindings/mfd/lm3533.h              |  19 ++
 2 files changed, 240 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,lm3533.yaml
 create mode 100644 include/dt-bindings/mfd/lm3533.h

diff --git a/Documentation/devicetree/bindings/mfd/ti,lm3533.yaml b/Documentation/devicetree/bindings/mfd/ti,lm3533.yaml
new file mode 100644
index 000000000000..d0307e5894f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,lm3533.yaml
@@ -0,0 +1,221 @@
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
+  - Johan Hovold <jhovold@gmail.com>
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
+  ti,boost-ovp:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Boost OVP select (16V, 24V, 32V, 40V)
+    enum: [ 0, 1, 2, 3 ]
+    default: 0
+
+  ti,boost-freq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Boost frequency select (500KHz or 1MHz)
+    enum: [ 0, 1 ]
+    default: 0
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
+    properties:
+      compatible:
+        const: lm3533-backlight
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
+      max-current-microamp:
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
+      default-brightness:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Default brightness level on boot.
+        minimum: 0
+        maximum: 255
+        default: 255
+
+      pwm:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Default pwm level on boot.
+        minimum: 0
+        maximum: 63
+        default: 0
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
+    properties:
+      compatible:
+        const: lm3533-leds
+
+      reg:
+        description:
+          4 led banks
+        minimum: 0
+        maximum: 3
+
+      max-current-microamp:
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
+      default-trigger:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: |
+          This parameter, if present, is a string defining
+          the trigger assigned to the LED. Check linux,default-trigger.
+
+      pwm:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Default pwm level on boot.
+        minimum: 0
+        maximum: 63
+        default: 0
+
+    required:
+      - compatible
+      - reg
+
+    additionalProperties: false
+
+  "^light-sensor@[0]$":
+    type: object
+    description:
+      Properties for an illumination sensor.
+
+    properties:
+      compatible:
+        const: lm3533-als
+
+      reg:
+        const: 0
+
+      resistor-value:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          PWM resistor value a linear step in currents
+          of 10 µA per code based upon 2V/R_ALS.
+        minimum: 1
+        maximum: 127
+        default: 1
+
+      pwm-mode:
+        type: boolean
+        description: Mode in which ALS is running
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
+    #include <dt-bindings/mfd/lm3533.h>
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
+            ti,boost-ovp = <LM3533_BOOST_OVP_24V>;
+            ti,boost-freq = <LM3533_BOOST_FREQ_500KHZ>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            backlight@0 {
+                compatible = "lm3533-backlight";
+                reg = <0>;
+
+                max-current-microamp = <23400>;
+                default-brightness = <113>;
+                pwm = <0x00>;
+            };
+        };
+    };
+...
diff --git a/include/dt-bindings/mfd/lm3533.h b/include/dt-bindings/mfd/lm3533.h
new file mode 100644
index 000000000000..929988190c52
--- /dev/null
+++ b/include/dt-bindings/mfd/lm3533.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides macros for TI LM3533 device bindings.
+ */
+
+#ifndef _DT_BINDINGS_MFD_LM3533_H
+#define _DT_BINDINGS_MFD_LM3533_H
+
+/* LM3533 boost freq */
+#define LM3533_BOOST_FREQ_500KHZ	0
+#define LM3533_BOOST_FREQ_1000KHZ	1
+
+/* LM3533 boost ovp */
+#define LM3533_BOOST_OVP_16V		0
+#define LM3533_BOOST_OVP_24V		1
+#define LM3533_BOOST_OVP_32V		2
+#define LM3533_BOOST_OVP_40V		3
+
+#endif
-- 
2.43.0

