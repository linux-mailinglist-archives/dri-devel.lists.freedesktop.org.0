Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1522B185D0D
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FB76E1BC;
	Sun, 15 Mar 2020 13:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BFF6E1BC
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:45:20 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id b13so11701689lfb.12
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ghUynx34Se1PWQlxUuq3M8AKFCN6cEMd2e8sZ7qxkGY=;
 b=pXX4HARMlo/xxLmk/Ribpq3UuFfXvqrQ9jU2j13Y9h6stHodmEt1h+dfHlxMt9L57z
 SEBzTJDGTz+G+YRegd+ZgxU8hAa2OaSfKgDZz30lTHQ96Bprky335XWloIRBjLb9gg2d
 lIQuIbWcAQNAhfOl5eo5MZgNdoQ0XaE2vDt5N3r2iT9MOBtm8xR/J0LyO3W8Sla21jZx
 yOf1Q+FyoqUDj/2FJ4Q7U26s5gxEJDyk4huESC2qjhA2e5dc903i5Inv23gUj+l40Ex/
 BDBJoJ0Ojk4RV00rd3B9eejNCkx1QjY9MGoixSN0TEJ0e8X0FriBJg1HOrL7Ckqy5mWD
 c15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ghUynx34Se1PWQlxUuq3M8AKFCN6cEMd2e8sZ7qxkGY=;
 b=lH1p+ccQhCDWOf+Zif6tQ0d97b0p8nJUV/+uE8Vro0jptW1aWW/nCNVdZ3ip+RL2PR
 RTP/Gc166Hgk3U8wmrRJAoYi6YYt7QZipoeChmET2pnbKBm8zKDotSwDi+r1NiE7m4aA
 PP2Ixo7I7f6gtCqfUhrFGWciSTK2vGbyWtNaXRaWmh1SOEANPPYtpPKjJfEMGD9P6tk6
 SCraevqbN3uLyexlS2bYaRBxfbNTwOXGW+ilse6vK2wKHc1Wo4+I3ozVYhHZJyoLLt5r
 8fLeoNjUbe2PHE3yf0L/TIlRTooRRIR8SeGJvfC2INrCVEX7sapb2qi2gKyUOCAv3ey4
 Ow5w==
X-Gm-Message-State: ANhLgQ304yW6cSzVRpPYS2OaFZqAwpielyizMT9nElVT16qTScOHG6Yh
 HEXMW5P9HGKEX9Ch5v5zzqIxYhZsB3A=
X-Google-Smtp-Source: ADFU+vvqGwEF7vJ9mSozATwfYlatHSXGkxufLvaaOBHO7rJKVQZ4y8gUYwiG2PeFs0YD7kJuwer2lA==
X-Received: by 2002:ac2:5598:: with SMTP id v24mr13738225lfg.139.1584279918259; 
 Sun, 15 Mar 2020 06:45:18 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:45:17 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 24/36] dt-bindings: display: convert toppoly panels to DT
 Schema
Date: Sun, 15 Mar 2020 14:44:04 +0100
Message-Id: <20200315134416.16527-25-sam@ravnborg.org>
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
Cc: Marek Belisko <marek@goldelico.com>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/panel/tpo,td.yaml        | 60 +++++++++++++++++++
 .../bindings/display/panel/tpo,td028ttec1.txt | 32 ----------
 .../bindings/display/panel/tpo,td043mtea1.txt | 33 ----------
 3 files changed, 60 insertions(+), 65 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt

diff --git a/Documentation/devicetree/bindings/display/panel/tpo,td.yaml b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
new file mode 100644
index 000000000000..9a79bcf87753
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/tpo,td.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toppoly TD Panels
+
+maintainers:
+  - Marek Belisko <marek@goldelico.com>
+  - H. Nikolaus Schaller <hns@goldelico.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: ../../spi/spi-slave.yaml#
+
+properties:
+  compatible:
+    enum:
+        # Toppoly TD028TTEC1 Panel
+      - tpo,td028ttec1
+        # Toppoly TD043MTEA1 Panel
+      - tpo,td043mtea1
+
+  reg: true
+  label: true
+  reset-gpios: true
+  backlight: true
+  port: true
+
+required:
+  - compatible
+  - port
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel: panel@0 {
+            compatible = "tpo,td043mtea1";
+            reg = <0>;
+            spi-max-frequency = <100000>;
+            spi-cpol;
+            spi-cpha;
+
+            label = "lcd";
+
+            reset-gpios = <&gpio7 7 0>;
+
+            port {
+                lcd_in: endpoint {
+                    remote-endpoint = <&dpi_out>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt b/Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt
deleted file mode 100644
index 898e06ecf4ef..000000000000
--- a/Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Toppoly TD028TTEC1 Panel
-========================
-
-Required properties:
-- compatible: "tpo,td028ttec1"
-
-Optional properties:
-- label: a symbolic name for the panel
-- backlight: phandle of the backlight device
-
-Required nodes:
-- Video port for DPI input
-
-Example
--------
-
-lcd-panel: td028ttec1@0 {
-	compatible = "tpo,td028ttec1";
-	reg = <0>;
-	spi-max-frequency = <100000>;
-	spi-cpol;
-	spi-cpha;
-
-	label = "lcd";
-	backlight = <&backlight>;
-	port {
-		lcd_in: endpoint {
-			remote-endpoint = <&dpi_out>;
-		};
-	};
-};
-
diff --git a/Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt b/Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt
deleted file mode 100644
index ec6d62975162..000000000000
--- a/Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-TPO TD043MTEA1 Panel
-====================
-
-Required properties:
-- compatible: "tpo,td043mtea1"
-- reset-gpios: panel reset gpio
-
-Optional properties:
-- label: a symbolic name for the panel
-
-Required nodes:
-- Video port for DPI input
-
-Example
--------
-
-lcd-panel: panel@0 {
-	compatible = "tpo,td043mtea1";
-	reg = <0>;
-	spi-max-frequency = <100000>;
-	spi-cpol;
-	spi-cpha;
-
-	label = "lcd";
-
-	reset-gpios = <&gpio7 7 0>;
-
-	port {
-		lcd_in: endpoint {
-			remote-endpoint = <&dpi_out>;
-		};
-	};
-};
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
