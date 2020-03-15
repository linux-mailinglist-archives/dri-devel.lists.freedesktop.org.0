Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB05185D17
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBCD6E1CD;
	Sun, 15 Mar 2020 13:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791E86E1CD
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:45:28 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id q10so11697127lfo.8
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aR/Y4J4Ng2nITnp6C8iQx7gJZtioK1x7f06y6fKkYkk=;
 b=ZMRhjKqUaC80StOG54UvNQgF+2E0CQ3QZOhh5eJ/xi7zKaFNawvj7dSxdg11bFH2gA
 lwE020oqkVe2MCC2OXxDACEVJ31ssC2nyWfhXD3SOi51tc6UJxfjDc8Vh6b+22NMxReX
 qlDpVcdTszxMiuB089pkzcWwFGC6LN+80sCozrzJtRfNpT+gqIDPrYxRQ/d2okiGzYlh
 Fm/fjoIHFWZDhHGiZqniB2oH5BcnZoV6Yv4Fyl0TvnbiHTP5tQti///Wsm36aNjvNU3H
 5jr8HiMF5ORYQPTsamwC6osPs2L7BXDu0uthtdgUEwL/+AUSWbkpKilgLVD3HpUWqunf
 3V7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aR/Y4J4Ng2nITnp6C8iQx7gJZtioK1x7f06y6fKkYkk=;
 b=XyTdWWqoJCQxjqjhDjUfbyg99iz/jKMq123Il9fs6CqkjKHqPTjkOwX/djjLYM30B+
 NqJwjOINfPwhyQUs4YUyPpUMAnSicnuwX2tMoxlgJmSV4jeKjllu9t6A1/zEjrjum0Fc
 Bmz0moSdA0ASc5jO614V/3n6u70kl/R9Xh8oQqjGZKFJ66LwIBt4cKwZwssWWfiSB2Cf
 0rBfvu1QCaFbzxFUlkMsITg1hL4VT24vMdn14/TFvWJ6Xre9tMMH4uOPfb2eAz8D31x8
 fVCjJ4ElQUs/tCaFQHP5QmyL2ichylWzFmDnz7mi4xlXyGDfvPsWkzyI20INAlhyGgTA
 V0og==
X-Gm-Message-State: ANhLgQ2yrErNnVsTEklnNHnvKFztsnYI7s/ozUYrm2Ef6jTTbauOvXeY
 q8NwfBEv63F97zjFrzl8r2PHx2AMxX0=
X-Google-Smtp-Source: ADFU+vsiDKQKYVVpPhUH+Vnj06nnM5ycCAm89/6lk2djQ+UTdRQdN3NDg0MtLJIY1xx1om9ZRncTvQ==
X-Received: by 2002:a19:c34e:: with SMTP id t75mr13297771lff.197.1584279926572; 
 Sun, 15 Mar 2020 06:45:26 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:45:26 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 28/36] dt-bindings: display: convert sitronix,
 st7789v to DT Schema
Date: Sun, 15 Mar 2020 14:44:08 +0100
Message-Id: <20200315134416.16527-29-sam@ravnborg.org>
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
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/sitronix,st7789v.txt        | 37 ------------
 .../display/panel/sitronix,st7789v.yaml       | 58 +++++++++++++++++++
 2 files changed, 58 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt
deleted file mode 100644
index c6995dde641b..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-Sitronix ST7789V RGB panel with SPI control bus
-
-Required properties:
-  - compatible: "sitronix,st7789v"
-  - reg: Chip select of the panel on the SPI bus
-  - reset-gpios: a GPIO phandle for the reset pin
-  - power-supply: phandle of the regulator that provides the supply voltage
-
-Optional properties:
-  - backlight: phandle to the backlight used
-
-The generic bindings for the SPI slaves documented in [1] also applies
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
-panel@0 {
-	compatible = "sitronix,st7789v";
-	reg = <0>;
-	reset-gpios = <&pio 6 11 GPIO_ACTIVE_LOW>;
-	backlight = <&pwm_bl>;
-	spi-max-frequency = <100000>;
-	spi-cpol;
-	spi-cpha;
-
-	port {
-		panel_input: endpoint {
-			remote-endpoint = <&tcon0_out_panel>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
new file mode 100644
index 000000000000..493006a52c5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sitronix,st7789v.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7789V RGB panel with SPI control bus
+
+maintainers:
+  - Maxime Ripard <mripard@kernel.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: ../../spi/spi-slave.yaml#
+
+properties:
+  compatible:
+    const: sitronix,st7789v
+
+  reg: true
+  reset-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - power-supply
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
+            compatible = "sitronix,st7789v";
+            reg = <0>;
+            reset-gpios = <&pio 6 11 GPIO_ACTIVE_LOW>;
+            backlight = <&pwm_bl>;
+            power-supply = <&power>;
+            spi-max-frequency = <100000>;
+            spi-cpol;
+            spi-cpha;
+
+            port {
+                panel_input: endpoint {
+                    remote-endpoint = <&tcon0_out_panel>;
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
