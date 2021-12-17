Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFAA479270
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 18:07:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2950A10E348;
	Fri, 17 Dec 2021 17:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B850710E348
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 17:07:21 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r17so4964605wrc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 09:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zoS7CsJ40sO7fBTmwqL9a7mTuTbz2YmZ0X8YJ+KC0Js=;
 b=oJ7bj0Dw7aVB1n0XibbrBHf+0ij3yhOKuXNzf708V84+FSQTtPpKwXWg/Wrun26i6L
 IDnFSKkAZjoKNG8mChS8++wUwFIgkPpBeECSMLVR5zaQWw0ic0w4QpSUi2CCs4exxnuz
 iUPBs1QEZtojh//CbecMoc4MQv2RuAhlOfKlupyIbekyEKeKTsv0Km0Ivz79YRdXxDGy
 Kps0UBje78UpF9h+BFM7Q8jxch+wr7smICAi4GdqexfQvG1omvnwxBUiUpq3xfN7WT1+
 zPTwx3Dayw+oZrwRgP733l5uRDhVFGVZCauZC/gJLykNa521wDNJKABiiP9gwpc+K9Dl
 wWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zoS7CsJ40sO7fBTmwqL9a7mTuTbz2YmZ0X8YJ+KC0Js=;
 b=dBKMFRnGQbFT+NkxzlcnLwYZQg0kRy3ofJyZOc0MRZgV7+7eYExyXuAiWrSv6if7N0
 G8yH77xCiK3M5Zh6RoQa8Q7eugkj2RVxapRIBk0r06lP/Hfa+mPZlNIZSkikV0VC6LZa
 HWd1Y3VEFmoXMkST1OMCPvEGcsa/bkKOcZ3XJDZGm+96f7jkoNJCvoj6ucRMlLzvonRg
 gl0mQPXOel2HZFK7yOL53v17WkSqR9UIznpiZe1wjh0kJ1Ckt0Wt58W5j18KKIKIYHvV
 ioRiE1RlzqD3GePsCuqsm+hk7OPIoH0R2+u+y4YcrGLRYstzwhlVZoFcuWO34CEZAJWp
 vttg==
X-Gm-Message-State: AOAM532k07qbKTXD2H8d8ncEVq7M4lbYZLAZddqRJoVt6dDrIORGhb+O
 mJFlxXbxOmfrW3uS1iGRxr0=
X-Google-Smtp-Source: ABdhPJzuYn74HEE1+NOvXsw2tw8dxMq2Y9fn64ltymYHN3h8cFS/99urNMIMvX7pnbadu+o8qCta0Q==
X-Received: by 2002:a05:6000:2ce:: with SMTP id
 o14mr1624139wry.70.1639760840241; 
 Fri, 17 Dec 2021 09:07:20 -0800 (PST)
Received: from localhost ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id c8sm9122994wmq.34.2021.12.17.09.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 09:07:19 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/2] dt-bindings: leds: lp855x: Convert to json-schema
Date: Fri, 17 Dec 2021 18:07:15 +0100
Message-Id: <20211217170715.2893923-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211217170715.2893923-1-thierry.reding@gmail.com>
References: <20211217170715.2893923-1-thierry.reding@gmail.com>
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
Cc: Milo Kim <milo.kim@ti.com>, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Convert the Texas Instruments LP855x backlight device tree bindings from
the free-form text format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/leds/backlight/lp855x.txt        |  72 ---------
 .../bindings/leds/backlight/ti,lp8550.yaml    | 151 ++++++++++++++++++
 2 files changed, 151 insertions(+), 72 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/lp855x.txt
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8550.yaml

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
diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lp8550.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lp8550.yaml
new file mode 100644
index 000000000000..412779a5462b
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/ti,lp8550.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/ti,lp8550.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments LP855x family devicetree bindings
+
+maintainers:
+  - Milo Kim <milo.kim@ti.com>
+  - Rob Herring <robh+dt@kernel.org>
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
+    description: Value of DEVICE CONTROL register. It depends on the device.
+
+  bl-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Backlight device name
+
+  init-brt:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: Initial value of backlight brightness
+
+  pwm-period:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: PWM period value. Set only PWM input mode used
+
+  pwm-names:
+    maxItems: 1
+
+  pwms:
+    maxItems: 1
+
+  power-supply:
+    description: Regulator which controls the 3V rail
+
+  enable-supply:
+    description: Regulator which controls the EN/VDDIO input
+
+patternProperties:
+  '^rom_[0-9a-f]{2}h$':
+    type: object
+    properties:
+      rom-addr:
+        $ref: /schemas/types.yaml#/definitions/uint8
+        description: Register address of ROM area to be updated
+
+      rom-val:
+        $ref: /schemas/types.yaml#/definitions/uint8
+        description: Register value to be updated
+
+    additionalProperties: false
+
+    required:
+      - rom-addr
+      - rom-val
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - dev-ctrl
+
+examples:
+  # LP8555
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      backlight@2c {
+        compatible = "ti,lp8555";
+        reg = <0x2c>;
+
+        dev-ctrl = /bits/ 8 <0x00>;
+        pwm-period = <10000>;
+
+        /* 4V OV, 4 output LED0 string enabled */
+        rom_14h {
+          rom-addr = /bits/ 8 <0x14>;
+          rom-val = /bits/ 8 <0xcf>;
+        };
+
+        /* Heavy smoothing, 24ms ramp time step */
+        rom_15h {
+          rom-addr = /bits/ 8 <0x15>;
+          rom-val = /bits/ 8 <0xc7>;
+        };
+
+        /* 4 output LED1 string enabled */
+        rom_19h {
+          rom-addr = /bits/ 8 <0x19>;
+          rom-val = /bits/ 8 <0x0f>;
+        };
+      };
+    };
+
+  # LP8556
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      backlight@2c {
+        compatible = "ti,lp8556";
+        reg = <0x2c>;
+
+        bl-name = "lcd-bl";
+        dev-ctrl = /bits/ 8 <0x85>;
+        init-brt = /bits/ 8 <0x10>;
+      };
+    };
+
+  # LP8557
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      backlight@2c {
+        compatible = "ti,lp8557";
+        reg = <0x2c>;
+        enable-supply = <&backlight_vddio>;
+        power-supply = <&backlight_vdd>;
+
+        dev-ctrl = /bits/ 8 <0x41>;
+        init-brt = /bits/ 8 <0x0a>;
+
+        /* 4V OV, 4 output LED string enabled */
+        rom_14h {
+          rom-addr = /bits/ 8 <0x14>;
+          rom-val = /bits/ 8 <0xcf>;
+        };
+      };
+    };
-- 
2.34.1

