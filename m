Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDB86F2446
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 12:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9267610E0AB;
	Sat, 29 Apr 2023 10:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EDD10E0A5
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 10:45:57 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-508418b6d59so1172151a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 03:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682765155; x=1685357155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DqgQik20RaJrNL1T+Wan9fC2dfJvhcXkp91dOJuP+tU=;
 b=ff5jeISUOKBWdr65mnm8rSLXdTfGoje2crU/FV35AS0hXK1tnEOiIy2sk0zZE9kuU7
 KOoc61t3VEXaiI8VwHvk/4mhERtXxVrOXgNNfCSzoT9VxFWeSGCqpf0rrMKkt+WsNRMT
 LLHBxRHPczDtZqvVsP42/RY+dNSMDNY2kiU6wBxeEyrDBy7+aHxEzK1T7Zqwl3ASa1sk
 t1G0oHANQt2Q/qaxAURMz32lytoIsvi6evHsGQtz1vXjYKczmgyfkKfl9SGV8G+cuDhz
 jpDbmXoFIDGQ2x8wzHsjtLs5gIh6eAEt7zZz8HWF1/cugDS/ZPbocMiGjj2Ptj2Vge4W
 dsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682765155; x=1685357155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DqgQik20RaJrNL1T+Wan9fC2dfJvhcXkp91dOJuP+tU=;
 b=CTJlci30I0wppdStH7MSi9/uytNmdFqFxX+NScEeGucpBvH8rmsiO0Gih4chgUhqEx
 m6+1jOLghtY5rsfDBG9PIJZAbFA5AD6+ol09PZrICku+KbhMdhYYp9QfJ4zPCS5n+jyU
 6380E9YrGhNkdla49l+B1XxuEZ3ESJPdapyFsYXLUZY5zSMIMZMfbXE98WWBOgLw4rAz
 pHNZj/B4HlxgqWARk+BaBGmAR5ZEE4i2oKO2QB1mzeIryhKsRqVm4AVOiIDg6BN/sFE4
 ReSZkO8sIl+Q8AJch4G5Hq7M+kbwMGTcZoZyAVVcovh8MgIrTBFoGo1KVx7jYJKkd/HO
 unqA==
X-Gm-Message-State: AC+VfDxa4buE9dZJNSIKqZCmpxxj5vG/WXcoJzPizlYeLFyDYVzBbs+O
 JDjaFIXUMkGUCCAFC5avZC8=
X-Google-Smtp-Source: ACHHUZ5IX7xd8VAKHJ8OC13ltLaInMOVU/XbGBnAThSTe8i0B/XBGS7hyaGf2AaaeTCqRO2qTgWDrQ==
X-Received: by 2002:a05:6402:1219:b0:506:7d65:c1fb with SMTP id
 c25-20020a056402121900b005067d65c1fbmr960029edw.30.1682765155315; 
 Sat, 29 Apr 2023 03:45:55 -0700 (PDT)
Received: from localhost.my.domain (83.8.115.30.ipv4.supernova.orange.pl.
 [83.8.115.30]) by smtp.gmail.com with ESMTPSA id
 b11-20020a056402138b00b004bd6e3ed196sm9952522edv.86.2023.04.29.03.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 03:45:55 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 1/4] dt-bindings: backlight: lp855x: convert to YAML and
 modernize
Date: Sat, 29 Apr 2023 12:45:31 +0200
Message-Id: <20230429104534.28943-2-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230429104534.28943-1-aweber.kernel@gmail.com>
References: <20230429104534.28943-1-aweber.kernel@gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Artur Weber <aweber.kernel@gmail.com>, linux-pwm@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-fbdev@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Notable changes:
- ROM child nodes use dashes instead of underscores; the driver
  reads all child nodes regardless of their names, so this doesn't
  break ABI.
- pwm-period argument is deprecated, as it effectively duplicates
  the period value provided in pwms. The driver continues to accept
  the property, so this should not break ABI.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 .../leds/backlight/lp855x-backlight.yaml      | 148 ++++++++++++++++++
 .../bindings/leds/backlight/lp855x.txt        |  72 ---------
 2 files changed, 148 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/lp855x.txt

diff --git a/Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.yaml
new file mode 100644
index 000000000000..dfe8131d2a32
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.yaml
@@ -0,0 +1,148 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/lp855x-backlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments LP855X backlight controllers
+
+maintainers:
+  - Artur Weber <aweber.kernel@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,lp8550
+      - ti,lp8551
+      - ti,lp8552
+      - ti,lp8553
+      - ti,lp8555
+      - ti,lp8556
+      - ti,lp8557
+
+  reg:
+    maxItems: 1
+
+  dev-ctrl:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      Value of device control register. This is a device-specific value.
+
+  bl-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Backlight device name.
+
+  init-brt:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: Initial value of backlight brightness.
+
+  power-supply:
+    description: Regulator which controls the 3V rail.
+
+  enable-supply:
+    description: Regulator which controls the EN/VDDIO input.
+
+  pwms:
+    maxItems: 1
+    description: |
+      PWM channel to use for controlling the backlight; setting this
+      enables the PWM-based backlight control mode.
+
+  pwm-names: true
+
+  pwm-period:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      PWM period value. Deprecated; set the period value in the pwms
+      property instead.
+    deprecated: true
+
+patternProperties:
+  "^rom-[0-9a-f]{2}h$":
+    type: object
+    description: Nodes containing the values of configuration registers.
+    properties:
+      rom-addr:
+        $ref: /schemas/types.yaml#/definitions/uint8
+        description: Register address of ROM area to be updated.
+
+      rom-val:
+        $ref: /schemas/types.yaml#/definitions/uint8
+        description: Value to write to the ROM register.
+
+required:
+  - compatible
+  - reg
+  - dev-ctrl
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@2c {
+            compatible = "ti,lp8555";
+            reg = <0x2c>;
+
+            dev-ctrl = /bits/ 8 <0x00>;
+
+            pwms = <&pwm 0 10000>;
+            pwm-names = "lp8555";
+
+            /* 4V OV, 4 output LED0 string enabled */
+            rom-14h {
+              rom-addr = /bits/ 8 <0x14>;
+              rom-val = /bits/ 8 <0xcf>;
+            };
+
+            /* Heavy smoothing, 24ms ramp time step */
+            rom-15h {
+              rom-addr = /bits/ 8 <0x15>;
+              rom-val = /bits/ 8 <0xc7>;
+            };
+
+            /* 4 output LED1 string enabled */
+            rom-19h {
+              rom-addr = /bits/ 8 <0x19>;
+              rom-val = /bits/ 8 <0x0f>;
+            };
+        };
+    };
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@2c {
+            compatible = "ti,lp8556";
+            reg = <0x2c>;
+
+            bl-name = "lcd-bl";
+            dev-ctrl = /bits/ 8 <0x85>;
+            init-brt = /bits/ 8 <0x10>;
+        };
+      };
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@2c {
+            compatible = "ti,lp8557";
+            reg = <0x2c>;
+            enable-supply = <&backlight_vddio>;
+            power-supply = <&backlight_vdd>;
+
+            dev-ctrl = /bits/ 8 <0x41>;
+            init-brt = /bits/ 8 <0x0a>;
+
+            /* 4V OV, 4 output LED string enabled */
+            rom-14h {
+              rom-addr = /bits/ 8 <0x14>;
+              rom-val = /bits/ 8 <0xcf>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/leds/backlight/lp855x.txt b/Documentation/devicetree/bindings/leds/backlight/lp855x.txt
deleted file mode 100644
index 88f56641fc28..000000000000
--- a/Documentation/devicetree/bindings/leds/backlight/lp855x.txt
+++ /dev/null
@@ -1,72 +0,0 @@
-lp855x bindings
-
-Required properties:
-  - compatible: "ti,lp8550", "ti,lp8551", "ti,lp8552", "ti,lp8553",
-                "ti,lp8555", "ti,lp8556", "ti,lp8557"
-  - reg: I2C slave address (u8)
-  - dev-ctrl: Value of DEVICE CONTROL register (u8). It depends on the device.
-
-Optional properties:
-  - bl-name: Backlight device name (string)
-  - init-brt: Initial value of backlight brightness (u8)
-  - pwm-period: PWM period value. Set only PWM input mode used (u32)
-  - rom-addr: Register address of ROM area to be updated (u8)
-  - rom-val: Register value to be updated (u8)
-  - power-supply: Regulator which controls the 3V rail
-  - enable-supply: Regulator which controls the EN/VDDIO input
-
-Example:
-
-	/* LP8555 */
-	backlight@2c {
-		compatible = "ti,lp8555";
-		reg = <0x2c>;
-
-		dev-ctrl = /bits/ 8 <0x00>;
-		pwm-period = <10000>;
-
-		/* 4V OV, 4 output LED0 string enabled */
-		rom_14h {
-			rom-addr = /bits/ 8 <0x14>;
-			rom-val = /bits/ 8 <0xcf>;
-		};
-
-		/* Heavy smoothing, 24ms ramp time step */
-		rom_15h {
-			rom-addr = /bits/ 8 <0x15>;
-			rom-val = /bits/ 8 <0xc7>;
-		};
-
-		/* 4 output LED1 string enabled */
-		rom_19h {
-			rom-addr = /bits/ 8 <0x19>;
-			rom-val = /bits/ 8 <0x0f>;
-		};
-	};
-
-	/* LP8556 */
-	backlight@2c {
-		compatible = "ti,lp8556";
-		reg = <0x2c>;
-
-		bl-name = "lcd-bl";
-		dev-ctrl = /bits/ 8 <0x85>;
-		init-brt = /bits/ 8 <0x10>;
-	};
-
-	/* LP8557 */
-	backlight@2c {
-		compatible = "ti,lp8557";
-		reg = <0x2c>;
-		enable-supply = <&backlight_vddio>;
-		power-supply = <&backlight_vdd>;
-
-		dev-ctrl = /bits/ 8 <0x41>;
-		init-brt = /bits/ 8 <0x0a>;
-
-		/* 4V OV, 4 output LED string enabled */
-		rom_14h {
-			rom-addr = /bits/ 8 <0x14>;
-			rom-val = /bits/ 8 <0xcf>;
-		};
-	};
-- 
2.40.1

