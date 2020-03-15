Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68090185CE9
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C8E6E196;
	Sun, 15 Mar 2020 13:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA00B6E198
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:44:57 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w4so890385lji.11
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tSotertszjUMedRD2Vfuz3bf57eHMzv0dgtIHvRY4pE=;
 b=q84CQRrzbFaUgbclub7n9i8HE11jCelZdW91ikDPW0qWyoEOnVhHbVEoCzcN119m8r
 BJkHcDvXPHaGXFusmTLJhgMetrZbnv56W6y5k0/lp+btY5x1BXTajNbLaT4BTJ5gxbjK
 3iHK4ym/zPpJlGagQ75FkKKdCoBUzr8jpxJjs5OmgfNKxxdPuBLjqwL45HQ4FecWNWDi
 MxxHYdpfSA5Nb9s6g/fuiSLZBUt2eL+WltpgQU7m0Yw7mrj5gH4jAraDc1wSALW7aq/y
 unKBvJu1jPVc7MZ82c1v/bxjxrCI6YO7Q9SLdggaVSu9uAQxJm25eBSneLCE1l4JOAaB
 cy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tSotertszjUMedRD2Vfuz3bf57eHMzv0dgtIHvRY4pE=;
 b=p9VGQkAH70+ub+USjgIcpl9hnois8qGAhX84CP/p+172uWEgLdcEC5r0YrNbXSrgc9
 +jIsKLZ0HG14zhyA8ZuMfJfq/XIg6KqEcrQRHj4+ksihsX2v4sPXfTWTURHXhlU+95XW
 7Ika4xq7VJsxscCuRqZHtM+KxPNq8AaSIq5hs7IDturuQoaUG479oXXcKOhZEfZXflOy
 5sGD1VFNyPsrFUvnvoLmgx4l2LYIY7EFkmo+dCbKjNDp0uwq+pBrHYZ6S+/kTaD8XpF8
 lEnML/I6LlLvvGNmfbcmq9gw7eL1rkPj7R4CsAu409j2fecfPGzHYce78SfKEj09CF1U
 zcPA==
X-Gm-Message-State: ANhLgQ1dTvy7RPIyN9vk6MNK9mPlrF14SGzSmucT6FGtE1yC6PKGjdEx
 YZhfPmBHSNoqWcVCsAYyHVu/BAjpXV4=
X-Google-Smtp-Source: ADFU+vupX6Yo38VsCs3py6kXA/mvB4+z4M+2UnehbCnmVP2r6tEA+pKmSkufcwFcSFL5CaCAEJ/R+g==
X-Received: by 2002:a2e:9091:: with SMTP id l17mr3120139ljg.154.1584279896075; 
 Sun, 15 Mar 2020 06:44:56 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:44:55 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 13/36] dt-bindings: display: convert kingdisplay,
 kd035g6-54nt to DT Schema
Date: Sun, 15 Mar 2020 14:43:53 +0100
Message-Id: <20200315134416.16527-14-sam@ravnborg.org>
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
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../panel/kingdisplay,kd035g6-54nt.txt        | 42 -------------
 .../panel/kingdisplay,kd035g6-54nt.yaml       | 60 +++++++++++++++++++
 2 files changed, 60 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt
deleted file mode 100644
index fa9596082e44..000000000000
--- a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-King Display KD035G6-54NT 3.5" (320x240 pixels) 24-bit TFT LCD panel
-
-Required properties:
-- compatible: should be "kingdisplay,kd035g6-54nt"
-- power-supply: See panel-common.txt
-- reset-gpios: See panel-common.txt
-
-Optional properties:
-- backlight: see panel-common.txt
-
-The generic bindings for the SPI slaves documented in [1] also apply.
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in [2]. This
-node should describe panel's video bus.
-
-[1]: Documentation/devicetree/bindings/spi/spi-bus.txt
-[2]: Documentation/devicetree/bindings/graph.txt
-
-Example:
-
-&spi {
-	panel@0 {
-		compatible = "kingdisplay,kd035g6-54nt";
-		reg = <0>;
-
-		spi-max-frequency = <3125000>;
-		spi-3wire;
-		spi-cs-high;
-
-		reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;
-
-		backlight = <&backlight>;
-		power-supply = <&ldo6>;
-
-		port {
-			panel_input: endpoint {
-				remote-endpoint = <&panel_output>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
new file mode 100644
index 000000000000..31fc63294a9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/kingdisplay,kd035g6-54nt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: King Display KD035G6-54NT 3.5" (320x240 pixels) 24-bit TFT LCD panel
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+allOf:
+  - $ref: ../../spi/spi-slave.yaml#
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: kingdisplay,kd035g6-54nt
+
+  backlight: true
+  port: true
+  power-supply: true
+  reg: true
+  reset-gpios: true
+
+required:
+  - compatible
+  - power-supply
+  - reset-gpios
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "kingdisplay,kd035g6-54nt";
+            reg = <0>;
+
+            spi-max-frequency = <3125000>;
+            spi-3wire;
+            spi-cs-high;
+
+            reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;
+
+            backlight = <&backlight>;
+            power-supply = <&ldo6>;
+
+            port {
+                panel_input: endpoint {
+                    remote-endpoint = <&panel_output>;
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
