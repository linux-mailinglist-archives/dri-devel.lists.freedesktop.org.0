Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03318185D03
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299C46E1A7;
	Sun, 15 Mar 2020 13:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DFE6E1A7
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:45:16 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id d23so15558376ljg.13
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=95/tYrFLxFWhHQedTIuiprVnYZuYF3knH69CjqDuvg4=;
 b=kVkFO0dZn3WY2eMdLtNyuUxKYmVfl5GkIYSSGuVnSVLwfS7on2M58zQL/nGUG1V6W6
 KOPElrjpPlI3MYCbvm8oiDtkivrOfLK0wD5olkxHasi8wp5yStO5MJUKwxW4N2+56vEl
 9SJ6aj5TLkVhBTe+OnB68MnD2QYhQTYONHmVpzs6rbf+QYn7haf7iiAwe+Byt+M1gVYR
 aLQDOzcS6djblQkcKg6VbWUSbWcALHd+nu7VuNCO7/D1kzH0Aow495hmSMovYWMXmW0o
 92P+Qu03iJ57nRtDk9+6a6fHVx3kIdJIKOPbcu5k4SLWQ1l8rIzuVp/v9HKFf4m9xFkJ
 wU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=95/tYrFLxFWhHQedTIuiprVnYZuYF3knH69CjqDuvg4=;
 b=Z0LGYFsoIcEHwAwleEuPEpeYQTiWjFWqSn2so19mTge7eH5k3epNBxAv7A7t+iOh2N
 2QEk5dR8lWAffyOzWqbnoOK39EExEIiXyf+5oTu4BVVrxz5iZiZNVTs0cI+K1Gz7vDgb
 8bOTlD/pTpUcmAPhJ2bEpEtrnlKe5k+BWdjvdWOiELv827bAVNWks70qa0l1gumocG2s
 iiH/NpD5g8ZfDD5udR9nZusJf/HbvSL2F6UiHWhzLXw3f29XBLxYD5ga0t7xHvyOiEL7
 hls4ypey0/1dG7uM23TujNIRs1wOfGgsSgLUTwmRF0GJs2zUedDbOXJaTa44NRuql6kp
 VmQA==
X-Gm-Message-State: ANhLgQ1o6zoQTc4UrHEVqAYx0Fnu2GT1VljdC4khA1XnNdB5WR4bZC1B
 /gV7ig7OEDaeY0nhn/CFlKVGYpfQb8g=
X-Google-Smtp-Source: ADFU+vvAb04MLDJqI6lPeN8wJHT/HuiV0E9v6XPvtroLZweI21bVO9Nmr0Oyc6ieS+LchZ7g0jnh2Q==
X-Received: by 2002:a2e:870b:: with SMTP id m11mr3056178lji.109.1584279914394; 
 Sun, 15 Mar 2020 06:45:14 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:45:13 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 22/36] dt-bindings: display: convert samsung,
 ld9040 to DT Schema
Date: Sun, 15 Mar 2020 14:44:02 +0100
Message-Id: <20200315134416.16527-23-sam@ravnborg.org>
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

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/panel/samsung,ld9040.txt |  66 ------------
 .../display/panel/samsung,ld9040.yaml         | 100 ++++++++++++++++++
 2 files changed, 100 insertions(+), 66 deletions(-)
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
index 000000000000..b6e7e87411e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,ld9040.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung LD9040 AMOLED LCD parallel RGB panel with SPI control bus
+
+maintainers:
+  - Andrzej Hajda <a.hajda@samsung.com>
+
+allOf:
+  - $ref: ../../spi/spi-slave.yaml#
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
+    description: delay after turning regulators on [ms]
+
+  reset-delay:
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
