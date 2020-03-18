Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBAF18A133
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 18:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454666E2B2;
	Wed, 18 Mar 2020 17:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56C66E2B2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 17:10:20 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id g2so8947779plo.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 10:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=v1txo4F9ZHXDlpSvCzNI2rmeFwQMzudpOKzit+Mhtr4=;
 b=BNQi3+WWW1X/Utl0cCgSjK1sOWY3vEw8v40vKUlsDIvCNT1rmyOP82HQE9iL5nPsw1
 BGTZRUAFdUvdIu7F0G92uMbXjKy+dfaipOiw63ksciL2ucX8+RcYbHB+trAE2wcKin4l
 hzZzBZ1h6WJNu1n7VUlx3ux6GxUOLTnwCcQUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=v1txo4F9ZHXDlpSvCzNI2rmeFwQMzudpOKzit+Mhtr4=;
 b=rU3hWMTPecuh1Zb95Gln58QhCbjVyYJvCZ28JFlGQ/GVUqMjuQl8hvKqC6K6SYFmxE
 kOI/2InVEZ0zD9GLh6sMAASNQlUn98B1knecAqIfsjMgM6CrPh0UcR7K3zcy6aGxuy88
 wZz6q9N05P1DnU7lFX5SWprHbFSLFBPEUVplwtxqipSTxViBePB1IqBJZ5aFwH7ulKc0
 70yL2l9UXIG/VSoEuoXiaSnNVimyKm0RLu1jFAgPkqW0qSzxFuRhMgaXQcbb/L6ptOB2
 O797lZU1BI6y+f1ZjDXjTngw6rkORSAjWosBjaVpJ+rM7td0kWiSOJ7mHtNsYGeBGwHz
 re7Q==
X-Gm-Message-State: ANhLgQ1mzpswm75zU9/vT9SMBpn96egtBu4OwBHyglMUJBh4qw0zb2dI
 LgX3eoNQ4j3J4VICFeOht0wPiw==
X-Google-Smtp-Source: ADFU+vsJY5WZSXSIrsTt/Eo50ixmUTcpdqYddC8+qlo6uvDuwotxpF5Is8zBj6BT99cqQ1A3HiB/ng==
X-Received: by 2002:a17:902:7b87:: with SMTP id
 w7mr4994502pll.214.1584551420315; 
 Wed, 18 Mar 2020 10:10:20 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:1998:878c:c26e:b8be])
 by smtp.gmail.com with ESMTPSA id e6sm6443869pgu.44.2020.03.18.10.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 10:10:19 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: display: panel: Convert sitronix,
 st7701 to DT schema
Date: Wed, 18 Mar 2020 22:40:02 +0530
Message-Id: <20200318171003.5179-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318171003.5179-1-jagan@amarulasolutions.com>
References: <20200318171003.5179-1-jagan@amarulasolutions.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the sitronix,st7701 panel bindings to DT schema.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- fix dt_binding_check 

 .../display/panel/sitronix,st7701.txt         | 30 --------
 .../display/panel/sitronix,st7701.yaml        | 68 +++++++++++++++++++
 2 files changed, 68 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sitronix,st7701.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.txt b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.txt
deleted file mode 100644
index ccd17597f1f6..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Sitronix ST7701 based LCD panels
-
-ST7701 designed for small and medium sizes of TFT LCD display, is
-capable of supporting up to 480RGBX864 in resolution. It provides
-several system interfaces like MIPI/RGB/SPI.
-
-Techstar TS8550B is 480x854, 2-lane MIPI DSI LCD panel which has
-inbuilt ST7701 chip.
-
-Required properties:
-- compatible: must be "sitronix,st7701" and one of
-  * "techstar,ts8550b"
-- reset-gpios: a GPIO phandle for the reset pin
-
-Required properties for techstar,ts8550b:
-- reg: DSI virtual channel used by that screen
-- VCC-supply: analog regulator for MIPI circuit
-- IOVCC-supply: I/O system regulator
-
-Optional properties:
-- backlight: phandle for the backlight control.
-
-panel@0 {
-	compatible = "techstar,ts8550b", "sitronix,st7701";
-	reg = <0>;
-	VCC-supply = <&reg_dldo2>;
-	IOVCC-supply = <&reg_dldo2>;
-	reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* LCD-RST: PD24 */
-	backlight = <&backlight>;
-};
diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
new file mode 100644
index 000000000000..e02686dfd937
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR X11)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sitronix,st7701.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7701 based LCD panels
+
+maintainers:
+  - Jagan Teki <jagan@amarulasolutions.com>
+
+description: |
+  ST7701 designed for small and medium sizes of TFT LCD display, is
+  capable of supporting up to 480RGBX864 in resolution. It provides
+  several system interfaces like MIPI/RGB/SPI.
+
+  Techstar TS8550B is 480x854, 2-lane MIPI DSI LCD panel which has
+  inbuilt ST7701 chip.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - techstar,ts8550b
+      - const: sitronix,st7701
+
+  reg:
+    description: DSI virtual channel used by that screen
+
+  VCC-supply:
+    description: analog regulator for MIPI circuit
+
+  IOVCC-supply:
+    description: I/O system regulator
+
+  reset-gpios:
+    description: a GPIO phandle for the reset pin
+
+  backlight:
+    description: Backlight used by the panel
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+required:
+  - compatible
+  - reg
+  - VCC-supply
+  - IOVCC-supply
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "techstar,ts8550b", "sitronix,st7701";
+            reg = <0>;
+            VCC-supply = <&reg_dldo2>;
+            IOVCC-supply = <&reg_dldo2>;
+            reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* LCD-RST: PD24 */
+            backlight = <&backlight>;
+        };
+    };
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
