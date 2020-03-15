Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E85F185D1F
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63ED6E1D8;
	Sun, 15 Mar 2020 13:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE446E1D6
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:45:34 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 5so4602119lfr.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=toNvd5WCF3GFjyOE6moNJQWMcvQ9HoQ7rB2BNOsqJDw=;
 b=tpI7Glt5hnpU4DaQC7X+FIHxMbU2wT+uyBW3nSDxWJMZc2f7D0qNvdS6sofzEUKxBI
 6FOemqXL6eGmbN2b1gZ+6zPGMqqgrahUx8RyW7D1InHNeONtx4acIqIrvG1RhBJf4LvL
 Utk9f4vmHuR5HWDRluxHcuc1xuQi4Ywhd+ZXORgInjl5G3+v4lBVochLJeF4N4zgXEfi
 M7Mv9WLiL5FZtuI77NDMITpOSkxnf+k0veDQGfJlulwzIHbLl+4wW147EuQ9xodvL6tS
 1jzYm0O9IFkzLZNVvQ/rJy/KXko98ms2CFwanD5qd/9B3C1o8sgoZ4lEPztesCuWjY7A
 5o6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=toNvd5WCF3GFjyOE6moNJQWMcvQ9HoQ7rB2BNOsqJDw=;
 b=pqDNOdWvfzcspnm8O5oo7YmqGk7Xb8nu9NI+WyCptDC9EgJPVspizMwzdOHp8pjT9Y
 xE15pjSlLeasVMV3WCq9vuZ0EHDaFyr/mZSwwB53SSK8zPNKj1jzs8SnUtp6YZ3/sAFO
 50WFf6/aJlerd9L3tjfBapLKIpsq9RhQG6VSequmvAIiXvuzBo6w6yns8m7B9qBJ6QEY
 jtVOpJJlN3BaRS5Sn9iRYv1p57dqvhg7LPm/n6D4BggpfNxTBpXAHivPm6+hVoevRuBB
 HDDwFCcCkDE0kfQ3jz+oqJlIkoAKjDryu7e5gtCyhDRQ+ITe8TWXo+/knp6xlt9fDtG6
 bGfQ==
X-Gm-Message-State: ANhLgQ0jlionBZ+qCFSRsS8aX6ytOGyHNELA3wA5jAhF7dhWsXogxE8C
 +Twxw2VnDGUSmBJc6NaF26JhPIvZJhw=
X-Google-Smtp-Source: ADFU+vtO0ISVT9WRNKB1NwfMIOS6r4vjvczsImL2D5nQyMFJBkIyabieO2xRhae4WYedOTQRWxrJww==
X-Received: by 2002:ac2:46d9:: with SMTP id p25mr6091534lfo.174.1584279932730; 
 Sun, 15 Mar 2020 06:45:32 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:45:32 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 31/36] dt-bindings: display: convert sharp,
 lq101r1sx01 to DT Schema
Date: Sun, 15 Mar 2020 14:44:11 +0100
Message-Id: <20200315134416.16527-32-sam@ravnborg.org>
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

This bindings describes a panel with a secondary channel.

A few of the properties are only required for the
main (non-secondary) node.
This is properly described in the binding.

A few properties are only valid for the main node,
this is not described in the binding.
I failed to find a way to describe it.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/sharp,lq101r1sx01.txt       | 49 ------------
 .../display/panel/sharp,lq101r1sx01.yaml      | 78 +++++++++++++++++++
 2 files changed, 78 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt
deleted file mode 100644
index f522bb8e47e1..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-Sharp Microelectronics 10.1" WQXGA TFT LCD panel
-
-This panel requires a dual-channel DSI host to operate. It supports two modes:
-- left-right: each channel drives the left or right half of the screen
-- even-odd: each channel drives the even or odd lines of the screen
-
-Each of the DSI channels controls a separate DSI peripheral. The peripheral
-driven by the first link (DSI-LINK1), left or even, is considered the primary
-peripheral and controls the device. The 'link2' property contains a phandle
-to the peripheral driven by the second link (DSI-LINK2, right or odd).
-
-Note that in video mode the DSI-LINK1 interface always provides the left/even
-pixels and DSI-LINK2 always provides the right/odd pixels. In command mode it
-is possible to program either link to drive the left/even or right/odd pixels
-but for the sake of consistency this binding assumes that the same assignment
-is chosen as for video mode.
-
-Required properties:
-- compatible: should be "sharp,lq101r1sx01"
-- reg: DSI virtual channel of the peripheral
-
-Required properties (for DSI-LINK1 only):
-- link2: phandle to the DSI peripheral on the secondary link. Note that the
-  presence of this property marks the containing node as DSI-LINK1.
-- power-supply: phandle of the regulator that provides the supply voltage
-
-Optional properties (for DSI-LINK1 only):
-- backlight: phandle of the backlight device attached to the panel
-
-Example:
-
-	dsi@54300000 {
-		panel: panel@0 {
-			compatible = "sharp,lq101r1sx01";
-			reg = <0>;
-
-			link2 = <&secondary>;
-
-			power-supply = <...>;
-			backlight = <...>;
-		};
-	};
-
-	dsi@54400000 {
-		secondary: panel@0 {
-			compatible = "sharp,lq101r1sx01";
-			reg = <0>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
new file mode 100644
index 000000000000..81bbd8872110
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,lq101r1sx01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp Microelectronics 10.1" WQXGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <treding@nvidia.com>
+
+description: |
+  This panel requires a dual-channel DSI host to operate. It supports two modes:
+  - left-right: each channel drives the left or right half of the screen
+  - even-odd: each channel drives the even or odd lines of the screen
+
+  Each of the DSI channels controls a separate DSI peripheral. The peripheral
+  driven by the first link (DSI-LINK1), left or even, is considered the primary
+  peripheral and controls the device. The 'link2' property contains a phandle
+  to the peripheral driven by the second link (DSI-LINK2, right or odd).
+
+  Note that in video mode the DSI-LINK1 interface always provides the left/even
+  pixels and DSI-LINK2 always provides the right/odd pixels. In command mode it
+  is possible to program either link to drive the left/even or right/odd pixels
+  but for the sake of consistency this binding assumes that the same assignment
+  is chosen as for video mode.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,lq101r1sx01
+
+  reg: true
+  power-supply: true
+  backlight: true
+
+  link2:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      phandle to the DSI peripheral on the secondary link. Note that the
+      presence of this property marks the containing node as DSI-LINK1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel: panel@0 {
+            compatible = "sharp,lq101r1sx01";
+            reg = <0>;
+
+            link2 = <&secondary>;
+
+            power-supply = <&power>;
+            backlight = <&backlight>;
+        };
+    };
+
+    dsi1 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        secondary: panel@0 {
+            compatible = "sharp,lq101r1sx01";
+            reg = <0>;
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
