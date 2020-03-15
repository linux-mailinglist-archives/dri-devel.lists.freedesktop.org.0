Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A864185CCB
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4D26E156;
	Sun, 15 Mar 2020 13:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6806E156
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:44:36 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id j11so11717268lfg.4
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2nNoHF8rJC/nOf5M8UDCn0+951QJCRTbyZ2ThPvlf0w=;
 b=peaSA7XXfInnOlxZwHMfXxgxh99b4MF4RSH4zmci46aJTfHAih6Ks3JleLT1XNLKXG
 tfiESYeF9CeV4mxStON58h1mDB4iz2RF84TVh+5jyM/MK1olmp3EnXLQuyzW4rOJ/PHr
 T2RkT5PavJJhRaXkMvdxQjd8P0M3ZsZ0APYHq+DAwytpMGagy46rdlv4h/njIPy+iDuL
 LJT6BzKaAnOr6dhcwwhBcm4V3D9Y109REnC5uSzp+hGLeCkFiHEHYH8KIKhG9E9BQcQA
 C1n7QwXOVKK7UQDY/ZNCEnfslAIDSct4tK1Jkjxqgcqb9ngMMVpdYtv+uLbQTU6VXqJJ
 BOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2nNoHF8rJC/nOf5M8UDCn0+951QJCRTbyZ2ThPvlf0w=;
 b=fvKC0ZjBXJhtRnkl0WQgahcE5DFFOJ8RhHWqn97BfKZPIrFbJH2ibx20AWz0DPAfx0
 Q6rRsk9w+bYqEy9gHm3YWhPi4sHKpV2NBtomEQonDIBG5fzZxS70kA0kdLLP5/Ww9vxx
 ZPIhVjXrX7vxmWqZBgQ/LYdemcUuM5im3BNNBz9MOqjudY7v+H1KRsfxonQmWDceNJJ6
 Upy4gH6o8yu2PTP9MEPq++fWWxvHKQKgubLb132wAwQwFxvnPXO5OSDhJjsuuE9OTYCA
 AVEI5QRTxMtV3sizJOR258EPFxm7y+PGYys5iTgx9sipXUDX0Kkx8V43vPtgWRGP1rjl
 onzQ==
X-Gm-Message-State: ANhLgQ34KgB9NHGgICWLpfT7CO5pXE/JHUuJI+gXmGXMEGd2XIvjsY9i
 KlrQVRg6XFwTiZGwN7REcQhWQGqGPU8=
X-Google-Smtp-Source: ADFU+vsRGsioJ1VqqB8qQWTmMk8FSUPBYKCqg6o0VA9Tjps9bftz2BrCNELrmgSTrx0twM5iMuyksg==
X-Received: by 2002:ac2:5e7b:: with SMTP id a27mr5597020lfr.61.1584279874961; 
 Sun, 15 Mar 2020 06:44:34 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:44:34 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 03/36] dt-bindings: display: convert samsung,
 s6e63m0 to DT Schema
Date: Sun, 15 Mar 2020 14:43:43 +0100
Message-Id: <20200315134416.16527-4-sam@ravnborg.org>
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

The binding for this panel is a SPI slave.
Reference spi-slave.yaml
to avoid duplicating all properties.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jonathan Bakker <xc-racer2@live.ca>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/samsung,s6e63m0.txt         | 33 -----------
 .../display/panel/samsung,s6e63m0.yaml        | 58 +++++++++++++++++++
 2 files changed, 58 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt
deleted file mode 100644
index 9fb9ebeef8e4..000000000000
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Samsung s6e63m0 AMOLED LCD panel
-
-Required properties:
-  - compatible: "samsung,s6e63m0"
-  - reset-gpios: GPIO spec for reset pin
-  - vdd3-supply: VDD regulator
-  - vci-supply: VCI regulator
-
-The panel must obey rules for SPI slave device specified in document [1].
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in [2]. This
-node should describe panel's video bus.
-
-[1]: Documentation/devicetree/bindings/spi/spi-bus.txt
-[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-
-		s6e63m0: display@0 {
-			compatible = "samsung,s6e63m0";
-			reg = <0>;
-			reset-gpio = <&mp05 5 1>;
-			vdd3-supply = <&ldo12_reg>;
-			vci-supply = <&ldo11_reg>;
-			spi-max-frequency = <1200000>;
-
-			port {
-				lcd_ep: endpoint {
-					remote-endpoint = <&fimd_ep>;
-				};
-			};
-		};
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
new file mode 100644
index 000000000000..204ed76da84d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e63m0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung s6e63m0 AMOLED LCD panel
+
+maintainers:
+  - Jonathan Bakker <xc-racer2@live.ca>
+
+allOf:
+  - $ref: ../../spi/spi-slave.yaml#
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e63m0
+
+  reg: true
+  reset-gpios: true
+  port: true
+
+  vdd3-supply:
+    description: VDD regulator
+
+  vci-supply:
+    description: VCI regulator
+
+required:
+  - compatible
+  - reset-gpios
+  - vdd3-supply
+  - vci-supply
+
+examples:
+  - |
+    spi {
+        reg = <0xf00 0x20>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        display@0 {
+            compatible = "samsung,s6e63m0";
+            reg = <0>;
+            reset-gpios = <&mp05 5 1>;
+            vdd3-supply = <&ldo12_reg>;
+            vci-supply = <&ldo11_reg>;
+            spi-max-frequency = <1200000>;
+
+            port {
+                lcd_ep: endpoint {
+                    remote-endpoint = <&fimd_ep>;
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
