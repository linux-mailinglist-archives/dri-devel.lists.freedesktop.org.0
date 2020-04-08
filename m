Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94EB1A29DC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F186EADE;
	Wed,  8 Apr 2020 19:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A766EADD
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:52:06 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id m19so4085259lfq.13
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5XY9f77RsjrlWr7bPqxvxTztyV1LpBbE8q2+zoUKqUA=;
 b=GucfOdX6HLn3uSN+jsA8pa9B0vK9hTcJ89UiuaZDc2x68oLlt49PIj4gyw3elSbKqF
 xlcjxvq1npHj6C3d26gV0KXnOHJpjncvp1pZzH/z19wXSr/12RhEAEow/vt8/TnIoRQ0
 rN5X1KncMxTfTxE/zYEa9JKV9FNXEypQJONBYJkHKiwEIXghobGjeUR5GoyjUZOfxTRf
 zag6Xa9UqKxonyhZRLbEuZDDsrTWMK3o/A5KDx8bI6035/owsX5pouGQjKTDxfhmF7ol
 IrEZAX53m92BvuKRLYtmd+ubAnquUsalum9RJfNJB88XENi9mwpeGCU/Br6sWET7l0wF
 5YiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5XY9f77RsjrlWr7bPqxvxTztyV1LpBbE8q2+zoUKqUA=;
 b=Rs8eOx1u0Z9xMm9WayIHNvIcgEOhNI/7DSzOvuwKk2fT4BXksIZYnk/pa8sYIXbfSN
 LJuHSW4zsuIH9BrFWVl+slNJRk+eje3pkPSr+mjd43QxH9JFlYJ+dlZM8P8pz9qQqu34
 H3m0X22Hf09VSEreifUwcXuvF56Y9w9y8afVTGdUepbhMR58cxUBqjUfNY/5jFNWoFzF
 7a+W/PRQnhvVZ8I9BTTc0eXtsQN3QT79b65PpL8pFOHu/wwmCmhVxR/mWncofK9nB4I4
 c9bWvOinQJEZGvAzsw8nZKxWOjvJarpFga7CmlgCvCEVPEoVCi5YHgPheYc/swy3MJti
 FycA==
X-Gm-Message-State: AGi0PuZUgRvgL4b+S0k+MedQDJF1A1RbX/uMAsvNjvBGtdiC4+7+BFos
 JKldsMu9JcaShl7ZTfASaaq4Uw9f590=
X-Google-Smtp-Source: APiQypJB40e3mpcm/7pV/FIjgY7ytpO5yWTb6rrck0wxh8C1GOpTD0IcmIt2MzNCXb72WGv4DVhjZg==
X-Received: by 2002:ac2:4832:: with SMTP id 18mr2268613lft.162.1586375525077; 
 Wed, 08 Apr 2020 12:52:05 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:52:04 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 22/36] dt-bindings: display: convert samsung,
 ld9040 to DT Schema
Date: Wed,  8 Apr 2020 21:50:55 +0200
Message-Id: <20200408195109.32692-23-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2:
  - drop use of spi-slave.yaml (Maxime)
  - added unevaluatedProperties (Maxime)
  - added type to width/height properties (Rob)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/panel/samsung,ld9040.txt |  66 -----------
 .../display/panel/samsung,ld9040.yaml         | 107 ++++++++++++++++++
 2 files changed, 107 insertions(+), 66 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ld9040.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ld9040.txt b/Documentation/devicetree/bindings/display/panel/samsung,ld9040.txt
deleted file mode 100644
index 354d4d1df4ff..000000000000
--- a/Documentation/devicetree/bindings/display/panel/samsung,ld9040.txt
+++ /dev/null
@@ -1,66 +0,0 @@
-Samsung LD9040 AMOLED LCD parallel RGB panel with SPI control bus
-
-Required properties:
-  - compatible: "samsung,ld9040"
-  - reg: address of the panel on SPI bus
-  - vdd3-supply: core voltage supply
-  - vci-supply: voltage supply for analog circuits
-  - reset-gpios: a GPIO spec for the reset pin
-  - display-timings: timings for the connected panel according to [1]
-
-The panel must obey rules for SPI slave device specified in document [2].
-
-Optional properties:
-  - power-on-delay: delay after turning regulators on [ms]
-  - reset-delay: delay after reset sequence [ms]
-  - panel-width-mm: physical panel width [mm]
-  - panel-height-mm: physical panel height [mm]
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in [3]. This
-node should describe panel's video bus.
-
-[1]: Documentation/devicetree/bindings/display/panel/display-timing.txt
-[2]: Documentation/devicetree/bindings/spi/spi-bus.txt
-[3]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-
-	lcd@0 {
-		compatible = "samsung,ld9040";
-		reg = <0>;
-		vdd3-supply = <&ldo7_reg>;
-		vci-supply = <&ldo17_reg>;
-		reset-gpios = <&gpy4 5 0>;
-		spi-max-frequency = <1200000>;
-		spi-cpol;
-		spi-cpha;
-		power-on-delay = <10>;
-		reset-delay = <10>;
-		panel-width-mm = <90>;
-		panel-height-mm = <154>;
-
-		display-timings {
-			timing {
-				clock-frequency = <23492370>;
-				hactive = <480>;
-				vactive = <800>;
-				hback-porch = <16>;
-				hfront-porch = <16>;
-				vback-porch = <2>;
-				vfront-porch = <28>;
-				hsync-len = <2>;
-				vsync-len = <1>;
-				hsync-active = <0>;
-				vsync-active = <0>;
-				de-active = <0>;
-				pixelclk-active = <0>;
-			};
-		};
-
-		port {
-			lcd_ep: endpoint {
-				remote-endpoint = <&fimd_dpi_ep>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
new file mode 100644
index 000000000000..060ee27a4749
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,ld9040.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung LD9040 AMOLED LCD parallel RGB panel with SPI control bus
+
+description: |
+  The panel must obey the rules for a SPI slave device as specified in
+  spi/spi-controller.yaml
+
+maintainers:
+  - Andrzej Hajda <a.hajda@samsung.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,ld9040
+
+  display-timings: true
+  port: true
+  reg: true
+  reset-gpios: true
+
+  vdd3-supply:
+    description: core voltage supply
+
+  vci-supply:
+    description: voltage supply for analog circuits
+
+  power-on-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: delay after turning regulators on [ms]
+
+  reset-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: delay after reset sequence [ms]
+
+  panel-width-mm:
+    description: physical panel width [mm]
+
+  panel-height-mm:
+    description: physical panel height [mm]
+
+required:
+  - compatible
+  - reg
+  - vdd3-supply
+  - vci-supply
+  - reset-gpios
+  - display-timings
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        lcd@0 {
+            compatible = "samsung,ld9040";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            reg = <0>;
+            vdd3-supply = <&ldo7_reg>;
+            vci-supply = <&ldo17_reg>;
+            reset-gpios = <&gpy4 5 0>;
+            spi-max-frequency = <1200000>;
+            spi-cpol;
+            spi-cpha;
+            power-on-delay = <10>;
+            reset-delay = <10>;
+            panel-width-mm = <90>;
+            panel-height-mm = <154>;
+
+            display-timings {
+                timing {
+                    clock-frequency = <23492370>;
+                    hactive = <480>;
+                    vactive = <800>;
+                    hback-porch = <16>;
+                    hfront-porch = <16>;
+                    vback-porch = <2>;
+                    vfront-porch = <28>;
+                    hsync-len = <2>;
+                    vsync-len = <1>;
+                    hsync-active = <0>;
+                    vsync-active = <0>;
+                    de-active = <0>;
+                    pixelclk-active = <0>;
+                };
+            };
+
+            port {
+                lcd_ep: endpoint {
+                    remote-endpoint = <&fimd_dpi_ep>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
