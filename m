Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B074B185CD4
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D026E171;
	Sun, 15 Mar 2020 13:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4081E6E15C
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:44:43 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 5so4600961lfr.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jtMrDxJy31xrdFsGU2391ZwFHhJDxHO6W5BAOG9U3Fo=;
 b=JagdCvMAfAnowjwNJiUB8Fgt8YKQloYwbMaMzzhc/SMID1feWlvGbPBuGEs3C/2fKR
 4pReNO67WL6Kfl0j8YXno0IJHNIV0TyphX07WkjZSMPs8tFN23Qf5llY8/9cJjLAL2Ph
 i6BuXLS920OPJnTGZe9fgBuXno06GLPcg3PedtvNRA1ItSWqZ7b8rvXTnSkhjimgz+WW
 b4HA8OH5fQL+IcBSK2rlxUHX2ToUpdPZyNbn2kHMU0o+UGIYC64K/BAk5UD0lSiqm1qC
 NaoI6h5pwrfcBd9naMpMUwmILeRj7C4XKMrJgI+YjQGaEPEMWw0iM4CSR+exdRPhZ+BA
 Z0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jtMrDxJy31xrdFsGU2391ZwFHhJDxHO6W5BAOG9U3Fo=;
 b=CKWQtAw+lSfWf2HLZwWMjjYOWflKlcSEfUo6Kr007fjwUhIS5qipkWRYYn5/zF4+Nr
 GK1tmQOes2sA9ZfD3c7tFaMiQXdFNF0eLrGGtzlTTij8eF13EKQuXtvgMUQnUKAq/o4E
 CPTplvhcW87Ne6Yq4FVEDvZmuHeX1i6kgJO8/5PR+12ueIRskpJpst/98HYTu+Q5Bow6
 g0EdA04HTljUNnWEdklTtvGb23P6l9q3mZnAcl0xZjPegcrmHYQ+9QTXJtDbI2SGZapz
 uvfFP1e3X8IE1KcxOrrbTiHzQuykEb5BqcnDzZxDnCGkcNv6QQ9g8bMpCuAu8JqltLIc
 doTQ==
X-Gm-Message-State: ANhLgQ3rlEwLq9ZD1joja9xuWGKpc81rfeVRQRazARbEX4By6kH2nex+
 IKmLLe9wYGHh+PfRXqCv7Jc1YaZa+iw=
X-Google-Smtp-Source: ADFU+vsXaWoLrxW4M5P16M5cGROxxT7ByHuzAkUsaafQRyocd8t0+QlpF0GSnF0ZUp8vJUYIo7AsOQ==
X-Received: by 2002:ac2:5465:: with SMTP id e5mr12477956lfn.210.1584279881255; 
 Sun, 15 Mar 2020 06:44:41 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:44:40 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 06/36] dt-bindings: display: convert ilitek,
 ili9322 to DT Schema
Date: Sun, 15 Mar 2020 14:43:46 +0100
Message-Id: <20200315134416.16527-7-sam@ravnborg.org>
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

The .txt binding explains:

"
    The following optional properties only apply to
    RGB and YUV input modes and
    can be omitted for BT.656 input modes:
"

This constraint is not implmented in the DT Schema.

The original binding from the .txt file referenced
properties that is included in panel-timing.yaml.
These properties are kept here as we want as close to a 1:1
conversion as we can. If the properties should be dropped
from the binding then this is a follow-up patch.

The properties in question are:
  - pixelclk-active
  - de-active
  - hsync-active
  - vsync-active

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/panel/ilitek,ili9322.txt | 49 ----------
 .../display/panel/ilitek,ili9322.yaml         | 90 +++++++++++++++++++
 2 files changed, 90 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt
deleted file mode 100644
index 3d5ce6ad6ec7..000000000000
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-Ilitek ILI9322 TFT panel driver with SPI control bus
-
-This is a driver for 320x240 TFT panels, accepting a variety of input
-streams that get adapted and scaled to the panel. The panel output has
-960 TFT source driver pins and 240 TFT gate driver pins, VCOM, VCOML and
-VCOMH outputs.
-
-Required properties:
-  - compatible: "dlink,dir-685-panel", "ilitek,ili9322"
-    (full system-specific compatible is always required to look up configuration)
-  - reg: address of the panel on the SPI bus
-
-Optional properties:
-  - vcc-supply: core voltage supply, see regulator/regulator.txt
-  - iovcc-supply: voltage supply for the interface input/output signals,
-    see regulator/regulator.txt
-  - vci-supply: voltage supply for analog parts, see regulator/regulator.txt
-  - reset-gpios: a GPIO spec for the reset pin, see gpio/gpio.txt
-
-  The following optional properties only apply to RGB and YUV input modes and
-  can be omitted for BT.656 input modes:
-
-  - pixelclk-active: see display/panel/display-timing.txt
-  - de-active: see display/panel/display-timing.txt
-  - hsync-active: see display/panel/display-timing.txt
-  - vsync-active: see display/panel/display-timing.txt
-
-The panel must obey the rules for a SPI slave device as specified in
-spi/spi-bus.txt
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in
-media/video-interfaces.txt. This node should describe panel's video bus.
-
-Example:
-
-panel: display@0 {
-	compatible = "dlink,dir-685-panel", "ilitek,ili9322";
-	reg = <0>;
-	vcc-supply = <&vdisp>;
-	iovcc-supply = <&vdisp>;
-	vci-supply = <&vdisp>;
-
-	port {
-		panel_in: endpoint {
-			remote-endpoint = <&display_out>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
new file mode 100644
index 000000000000..9f165f12fc32
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili9322.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI9322 TFT panel driver with SPI control bus
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  This is a driver for 320x240 TFT panels, accepting a variety of input
+  streams that get adapted and scaled to the panel. The panel output has
+  960 TFT source driver pins and 240 TFT gate driver pins, VCOM, VCOML and
+  VCOMH outputs.
+
+  The panel must obey the rules for a SPI slave device as specified in
+  spi/spi-bus.txt
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: ../../spi/spi-slave.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - dlink,dir-685-panel
+      
+      - const: ilitek,ili9322
+
+  reset-gpios: true
+  port: true
+
+  vcc-supply:
+    description: Core voltage supply
+
+  iovcc-supply:
+    description: Voltage supply for the interface input/output signals
+
+  vci-supply:
+    description: Voltage supply for analog parts
+
+  pixelclk-active:
+    description: |
+      Optional property, applies only to RGB and YUV input modes and
+      can be omitted for BT.656 input modes
+
+  de-active:
+    description: |
+      Optional property, applies only to RGB and YUV input modes and
+      can be omitted for BT.656 input modes
+
+  hsync-active:
+    description: |
+      Optional property, applies only to RGB and YUV input modes and
+      can be omitted for BT.656 input modes
+
+  vsync-active:
+    description: |
+      Optional property, applies only to RGB and YUV input modes and
+      can be omitted for BT.656 input modes
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel: display@0 {
+            compatible = "dlink,dir-685-panel", "ilitek,ili9322";
+            reg = <0>;
+            vcc-supply = <&vdisp>;
+            iovcc-supply = <&vdisp>;
+            vci-supply = <&vdisp>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&display_out>;
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
