Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7345E185D12
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA986E1BD;
	Sun, 15 Mar 2020 13:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877DB6E1BD
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:45:26 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id e18so15607307ljn.12
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gRJ0qOuvj7xd3Fm3RySbuPGlTrl0RRGIeQ9SIxKWgV0=;
 b=GkDzmzJPwQ+0Seb+vU3zv9cPxKMarphixbVlW3vImxXXMscUO9Nr73fJT7/oOmW3ov
 R5vRP76Bf96W4TqcL3uqD+p04QsOKHp8ErA1ENrI36v9nLfm4wwoCxoVKfT5qlj7GOIG
 mIggjRtgvbiyHXhgkl7hUBW3nsXFnS+Ak/dFYdg07Plg6A0yLvv5FiWb0DjU2DFKLsf+
 TR0jNALHdewmoumNhJjnp3GZRiwAww2VheF5AJn2y24zdrmMtizK6UfY0yN4GMtKAaVk
 SjSyQS3FU+GINmeQBpV2mQvsZ3cV04VeA63Jx3dHMX/IBeQJMjQeE4trV1Mz6f6rEJes
 3CfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gRJ0qOuvj7xd3Fm3RySbuPGlTrl0RRGIeQ9SIxKWgV0=;
 b=PW+6gPmg17opR8x2Dj0xADrOr5ezLWfy1P03swFDNDiO+oo4PZqAWsxdv37jWZga2S
 VFjFo4nQuW9kHpIalUljAHcWCAyMICfZTYPn8MepSb5hB3tQSm7ai8cm/4Zk2Ka/WazI
 pOyMkZ0VnidxIyebo6gdzidaewyXKNPrYsEwE9UucS9l/y7s6SVyDsu7TbMo5768mrs/
 sVYAkzoL4tnBT6VUXddYYPYWBCcRUNs+4q5e6HOUQTjqNrcbnqHuf6sEFVHxdHE5inmb
 6g0OnOPDYpFUbzFtndAIIIulaqpALcIidUk5pWNoeoMRYp4CIJn4QKG3Wp8lA2CBB2Cf
 lSKQ==
X-Gm-Message-State: ANhLgQ2xQAzmlnjkvs9Gdzdhu2UaTXANpDBfGTQWyWHqlPJIWVYblqJx
 tG+bhIU+pMaZry4eeMC2HLVO+qfaNjg=
X-Google-Smtp-Source: ADFU+vuC6yiIywbBb0ZPLb4XytTRoLe/xDi8RThEg1i7adSH/tbwLJ0SiINVcnb3kmMm7ImgJPZaaA==
X-Received: by 2002:a05:651c:2007:: with SMTP id
 s7mr13877995ljo.214.1584279924573; 
 Sun, 15 Mar 2020 06:45:24 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:45:24 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 27/36] dt-bindings: display: convert sitronix,
 st7701 to DT Schema
Date: Sun, 15 Mar 2020 14:44:07 +0100
Message-Id: <20200315134416.16527-28-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200315134416.16527-1-sam@ravnborg.org>
References: <20200315134416.16527-1-sam@ravnborg.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>, Paul Cercueil <paul@crapouillou.net>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 Guido Gunther <agx@sigxcpu.org>, Mark Brown <broonie@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The old binding documented that a number of properties is
required only for a specific panel.
The binding supports only one panel so they are now
unconditionally required.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
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
index 000000000000..d5811a8f615e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0
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
+  ST7701 is designed for small and medium sizes of TFT LCD display, is
+  capable of supporting up to 480RGBX864 in resolution. It provides
+  several system interfaces like MIPI/RGB/SPI.
+
+  Techstar TS8550B is 480x854, 2-lane MIPI DSI LCD panel which has
+  inbuilt ST7701 chip.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          # Techstar TS8550B
+        - techstar,ts8550b
+      - const: sitronix,st7701
+
+  reg: true
+  reset-gpios: true
+  backlight: true
+
+  VCC-supply:
+    description: analog regulator for MIPI circuit
+
+  IOVCC-supply:
+    description: I/O system regulator
+
+required:
+  - compatible
+  - reset-gpios
+  - reg
+  - VCC-supply
+  - IOVCC-supply
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
+
+...
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
