Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 112C7978365
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A52F10ED24;
	Fri, 13 Sep 2024 15:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SKkBiRb1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C867910ED23
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:08:24 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5c3d209db94so2588089a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240103; x=1726844903; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6qs9D7WYZmFir3ENOGTcz3S245/jkLwimxjEHB73n2I=;
 b=SKkBiRb1qv8NDB3qZ8iO8DdkSUyo6HFQ7N4mtHBtAFT9pqMtYc5jYn69h0nUJWZ+do
 qhCZ5pxedwHk0LXqMg8hu+4lNAHjTS0whvf1T1ihnNFzyQiqmz1IkvgBXMRuFh9HetuA
 MKy1OZhmywWq46bX1Jvjuhm8US6ouNHGfC06k/686zDEQ1Pj4/afAqNW8LBEK/QOWjdf
 4CGUz0CMvsk7dEnuGkwdkdE4pb/biEho5QGAyaSHPq24LHbwGtqvFJKzg+S8mDCEFRle
 AK4vuRrmwTtAKlN76joCml0MuVfiOdYminPLBui4L5aq+TougMv1VuIskq+b3fgN1c8I
 GnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240103; x=1726844903;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6qs9D7WYZmFir3ENOGTcz3S245/jkLwimxjEHB73n2I=;
 b=nku3NL+Pc5+nsjZBxPbqe/ARdi/2/AIivxomryTHlhA4b0YAkHlGHH+Hlaf16nelQP
 MwbRSbDYPg4ZfzeeeS9lsSjT3f9Bz1QfEBcxZOhi4s1nVoFhGJJgFYxVi9CvrnEX3if1
 n7owdFCKshd5UarFjQ66qMHWW1XCeuUq+vpKwJtjyKzIsdVNFKfVPoHWJyUXG2ov1ddd
 PgnS06Z+R9Qtsz00LmVY42f0Sn8Ifte45Q1/4gfHthgPMZ8wi9uXsllpxRjZRGLj6Zyt
 HGxyCZPk+ZLGuSMmsUyxx4Yo7TaCuIbYT/13BCklNTKovSOKPXnSwAwWf3NBbejiT+F7
 2Uxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ1i8yHBq8z/QtmN3Ci8U1X2+ZIQlLSJMayL1P4rL2pVT3+iFYCnSj46RBlS1lnInJbeE1JaPN0ak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrvbAVLpAEIBy+RH4p8FoXpgvfILlWuxed9aNZlqFAZ6o5BDDx
 PG8PU6JUakk8pRITcoemeitLy30g/BvPI1k5jNaWpqsGlugvfaCJ
X-Google-Smtp-Source: AGHT+IGahGtGigZva5WPUaLkeCtIA6xLZrMdXSHJDxtijqoIvYyvOjyZWfSktvVNDMinjY/pES1pWw==
X-Received: by 2002:a05:6402:2108:b0:5c4:2396:d990 with SMTP id
 4fb4d7f45d1cf-5c42396da70mr1184642a12.17.1726240103019; 
 Fri, 13 Sep 2024 08:08:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.127.153.210])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm7774318a12.51.2024.09.13.08.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:08:22 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 18:07:48 +0300
Subject: [PATCH v4 05/27] dt-bindings: mfd: add maxim,max77705
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-starqltechn_integration_upstream-v4-5-2d2efd5c5877@gmail.com>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Simona Vetter <simona@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726240085; l=5568;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=5BxvSoJGkTvuZWFT0LW8xSppfKPLK5W8Ozr1yp+nxb0=;
 b=hFCvbe7/NZeyGGOlUrY6moZjqhp7M+tq8u1pB+8hJ/1RUhTji/N5Cbrm4vhl7h0G8elBiXQzQ
 QfaTXcE8qh7CEAMHTuEUJaLdsG2uiUE6446V2gdDN4K4dbzfSIKDgrv
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
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

Add maxim,max77705 core binding part.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v4:
- change dts example intendation from tabs
 to spaces
- remove interrupt-names property
- remove obvious reg description
- split long(>80) lines
---
 .../devicetree/bindings/mfd/maxim,max77705.yaml    | 169 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 170 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml
new file mode 100644
index 000000000000..40a67d15e312
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/maxim,max77705.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX77705 Companion Power Management IC and USB Type-C interface IC
+
+maintainers:
+  - Dzmitry Sankouski <dsankouski@gmail.com>
+
+description: |
+  This is a part of device tree bindings for Maxim MAX77705 multi functional
+  device.
+
+  The Maxim MAX77705 is a Companion Power Management and Type-C
+  interface IC which includes charger, fuelgauge, LED, haptic motor driver and
+  Type-C management IC.
+
+properties:
+  compatible:
+    const: maxim,max77705
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  charger:
+    $ref: /schemas/power/supply/power-supply.yaml
+    additionalProperties: true
+    properties:
+      compatible:
+        const: maxim,max77705-charger
+
+    required:
+      - compatible
+      - monitored-battery
+
+  fuel_gauge:
+    $ref: /schemas/power/supply/power-supply.yaml
+    type: object
+    additionalProperties: true
+    description: MAX77705 fuel gauge with ModelGauge m5 EZ algorithm support.
+    properties:
+      compatible:
+        const: maxim,max77705-fuel-gauge
+
+      shunt-resistor-micro-ohms:
+        description: |
+          The value of current sense resistor in microohms.
+
+    required:
+      - compatible
+      - shunt-resistor-micro-ohms
+      - monitored-battery
+      - power-supplies
+
+  haptic:
+    type: object
+    additionalProperties: false
+    properties:
+      compatible:
+        const: maxim,max77705-haptic
+
+      haptic-supply: true
+
+      pwms:
+        maxItems: 1
+
+    required:
+      - compatible
+      - haptic-supply
+      - pwms
+
+  leds:
+    type: object
+    additionalProperties: false
+    description:
+      Up to 4 LEDs supported. One LED is represented by one child node.
+    properties:
+      compatible:
+        const: maxim,max77705-led
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-3]$":
+        type: object
+        $ref: /schemas/leds/common.yaml#
+        properties:
+          reg:
+            description:
+              LED index.
+        unevaluatedProperties: false
+        required:
+          - reg
+
+    required:
+      - compatible
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@66 {
+            compatible = "maxim,max77705";
+            reg = <0x66>;
+            interrupt-parent = <&pm8998_gpios>;
+            interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+            pinctrl-0 = <&chg_int_default>;
+            pinctrl-names = "default";
+
+            leds {
+                compatible = "maxim,max77705-led";
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                led@1 {
+                    reg = <1>;
+                    label = "red:usr1";
+                };
+
+                led@2 {
+                    reg = <2>;
+                    label = "green:usr2";
+                };
+
+                led@3 {
+                    reg = <3>;
+                    label = "blue:usr3";
+                };
+            };
+
+            max77705_charger: charger {
+                compatible = "maxim,max77705-charger";
+                monitored-battery = <&battery>;
+            };
+
+            fuel_gauge {
+                compatible = "maxim,max77705-fuel-gauge";
+                monitored-battery = <&battery>;
+                power-supplies = <&max77705_charger>;
+                rsense = <5>;
+            };
+
+
+            haptic {
+                compatible = "maxim,max77705-haptic";
+                haptic-supply = <&vib_regulator>;
+                pwms = <&vib_pwm 0 50000>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b65cfa1d322d..59d027591e34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14064,6 +14064,7 @@ B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/*/maxim,max14577.yaml
 F:	Documentation/devicetree/bindings/*/maxim,max77686.yaml
 F:	Documentation/devicetree/bindings/*/maxim,max77693.yaml
+F:	Documentation/devicetree/bindings/*/maxim,max77705*.yaml
 F:	Documentation/devicetree/bindings/*/maxim,max77843.yaml
 F:	Documentation/devicetree/bindings/clock/maxim,max77686.txt
 F:	drivers/*/*max77843.c

-- 
2.39.2

