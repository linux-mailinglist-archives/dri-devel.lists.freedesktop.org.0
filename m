Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97455185CFB
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809C86E1A4;
	Sun, 15 Mar 2020 13:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109246E1A2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:45:08 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id j11so11717800lfg.4
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K4LBF/SfxFsUJUI8XynDjFJLvWIbs62fNsYASRbdYqg=;
 b=aoJebTvoPhClcIQs9YdHWM3SzN8T043UUVvQYFNL8UE17NuDGxf+Py6gqkcqFYFsEk
 T5nBFivS4rykT3XVNYc/7+tX7dCQV27ZdqAlkvzYrH/48ztoAudGFud7YIx+dmawq9Dx
 un8ulI1mFeNu4hlK4vUnbKS7ooVbnGNzKoWmAdar0teE0q158xIPaNieOGLvTqILBQS/
 Cs8JlXNRVtJKlcnthDW/Yw0S/txAH2kG/thS1zfMnVqNZecJlLw8buvJn0nTdzzr88Jy
 XgoQj1y6WPlO2swBt1s88x1sPetexxXX6SrDcIXa6ln/FPEp9Aj/+feIpGIpnkw5ob7L
 032w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=K4LBF/SfxFsUJUI8XynDjFJLvWIbs62fNsYASRbdYqg=;
 b=Ie7aTmIQ8HMsmvRRaHas7ZzNp6dNVXZYp3Zy5/dBJczi/iTUIKw9ZBmBcqdZsKwNRO
 en/IC2HNDR8tsifVAO+1xugCSJV3zvYC/zwWi1yJTsZHlAxW1AXagxz4Mf5uxFhIB1zt
 /1DAzgtggaHqyBRClgHN9j4qjwD2BcRodyUy6YQeqvCVf7UV4aEjcSYXaq6/Y0l64MXG
 Dk8qvbi0aJcfQeZWFrpyiBKWh6ZXNjeXsZMfKLx2S6J40tXNU3U/HhVJJiLuDAiJ0Rr2
 brKIdmLsyoLJ7OFszItVNEXW/tnKs9RFl41m6Te5Jrk56kf1FA5i47ecEz2A/p29gqes
 XsCQ==
X-Gm-Message-State: ANhLgQ1XizghaFbwnrkLbBhkdXIt3se9Yz/rt+5+pjDzl9O77EPdA5IO
 i+JOTAu+T8adH53SB3gXrpieTcrVXlg=
X-Google-Smtp-Source: ADFU+vvWFtPKBW6qyBr5/W0wNmtivYBhs/ZHpF0VnBgS28zZBTjXkCXXsHcgk6/v8BGForf5E2kFNA==
X-Received: by 2002:a19:5509:: with SMTP id n9mr12784893lfe.51.1584279906102; 
 Sun, 15 Mar 2020 06:45:06 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:45:05 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 18/36] dt-bindings: display: convert raydium,
 rm67191 to DT Schema
Date: Sun, 15 Mar 2020 14:43:58 +0100
Message-Id: <20200315134416.16527-19-sam@ravnborg.org>
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
Cc: Robert Chiras <robert.chiras@nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/raydium,rm67191.txt         | 41 ----------
 .../display/panel/raydium,rm67191.yaml        | 75 +++++++++++++++++++
 2 files changed, 75 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
deleted file mode 100644
index 10424695aa02..000000000000
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Raydium RM67171 OLED LCD panel with MIPI-DSI protocol
-
-Required properties:
-- compatible: 		"raydium,rm67191"
-- reg:			virtual channel for MIPI-DSI protocol
-			must be <0>
-- dsi-lanes:		number of DSI lanes to be used
-			must be <3> or <4>
-- port: 		input port node with endpoint definition as
-			defined in Documentation/devicetree/bindings/graph.txt;
-			the input port should be connected to a MIPI-DSI device
-			driver
-
-Optional properties:
-- reset-gpios:		a GPIO spec for the RST_B GPIO pin
-- v3p3-supply:		phandle to 3.3V regulator that powers the VDD_3V3 pin
-- v1p8-supply:		phandle to 1.8V regulator that powers the VDD_1V8 pin
-- width-mm:		see panel-common.txt
-- height-mm:		see panel-common.txt
-- video-mode:		0 - burst-mode
-			1 - non-burst with sync event
-			2 - non-burst with sync pulse
-
-Example:
-
-	panel@0 {
-		compatible = "raydium,rm67191";
-		reg = <0>;
-		pinctrl-0 = <&pinctrl_mipi_dsi_0_1_en>;
-		pinctrl-names = "default";
-		reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
-		dsi-lanes = <4>;
-		width-mm = <68>;
-		height-mm = <121>;
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&mipi_out>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
new file mode 100644
index 000000000000..b78b66a4336f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/raydium,rm67191.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raydium RM67171 OLED LCD panel with MIPI-DSI protocol
+
+maintainers:
+  - Robert Chiras <robert.chiras@nxp.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: raydium,rm67191
+
+  reg: true
+  port: true
+  reset-gpios: true
+  width-mm: true
+  height-mm: true
+ 
+  dsi-lanes:
+    description: Number of DSI lanes to be used must be <3> or <4>
+    enum: [3, 4]
+
+  v3p3-supply:
+    description: phandle to 3.3V regulator that powers the VDD_3V3 pin
+
+  v1p8-supply:
+    description: phandle to 1.8V regulator that powers the VDD_1V8 pin
+
+  video-mode:
+    description: |
+      0 - burst-mode
+      1 - non-burst with sync event
+      2 - non-burst with sync pulse
+    enum: [0, 1, 2]
+
+required:
+  - compatible
+  - reg
+  - dsi-lanes
+  - port
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
+        panel {
+            compatible = "raydium,rm67191";
+            reg = <0>;
+            reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+            dsi-lanes = <4>;
+            width-mm = <68>;
+            height-mm = <121>;
+            video-mode = <1>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mipi_out>;
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
