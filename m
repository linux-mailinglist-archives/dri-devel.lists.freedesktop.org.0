Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A77F185CD1
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE3B6E15C;
	Sun, 15 Mar 2020 13:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B0C6E15C
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:44:41 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id n13so9905703lfh.5
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nXaJ0V5xklg8WgvlRTOBuhFm5WZEeNq3OBl1ct6iqI0=;
 b=JwHhcDs8Gen/1n/UVZV5wsKSKv/m4WzKhLlV0Bf6y3y8V7BEJVOG319xee4k5798UJ
 6TTvyDWh2G7TWv1ZJKAHCgEHHxMS3Z9/3nGt1eSoH6f22FiHM28os9pqUxC89lFFu9s9
 jT69grNbXIglNpWNdCFyThiWi761OvRa5esx6X7zHDAA/bNWlTgLIhUukMasiCiwlgRG
 actJvznHSieRm14QansgRts4MvGIMM3pZWA0I6dLOzMTuKLK03PSqQmA5PeFZd5/Ab0r
 5/3/wFQllg03HSWH8cMDeFpys6rc78Up4Q3KN7zQBP9/4Jzjt7Ta++V3fUdl4CmkUaVk
 rahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nXaJ0V5xklg8WgvlRTOBuhFm5WZEeNq3OBl1ct6iqI0=;
 b=F6IlO8Htf4lg9skh7rotXYyNfmpBvf28l21QWths7KqkfCWVWPoRNrVpJYNLaDANv6
 Y7V0O+ABaGrFZU9FXueLmewyfOjYo7Z5Tg8sDQIpGmQJlUoDmKG12LoEaiVrAN3tlDAt
 WOscE7Xv/YVF0FdSh01ENrv5y/4KCgYjFWlJhg97p+Yik6m2oRRojsqnE0PrWoP+PBTC
 U5SxPfee4zKWYSFkXZ+KLWeGrd0cqEbPnOvlN05Yz1hiByd+EAGXDd1WraHQu4YYorzb
 imhcuC28qAWaMbu8FrlVkUFdYMcdF+xv9XZJ/BBu3h+3P4kn7lj2hTyib/cm+Uhy6e41
 ePuw==
X-Gm-Message-State: ANhLgQ29L8Rx57M7Dvv4XwUc7/lS2QG22CIJQyeF3gTa7A5GVYkNCdqJ
 6WJZ8hwftc83StN3Llnwd9Gxzy/wIkE=
X-Google-Smtp-Source: ADFU+vujG7VKcDu/ERgRI3MOa9d6/ymCp4T4gMqsmUhDw1hRSsI6YFlzZD6tVoiK0x0fGWUEp6vJ7w==
X-Received: by 2002:ac2:46d9:: with SMTP id p25mr6090011lfo.174.1584279879157; 
 Sun, 15 Mar 2020 06:44:39 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:44:38 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 05/36] dt-bindings: display: convert boe,
 himax8279d to DT Schema
Date: Sun, 15 Mar 2020 14:43:45 +0100
Message-Id: <20200315134416.16527-6-sam@ravnborg.org>
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
Cc: Jerry Han <hanxu5@huaqin.corp-partner.google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/panel/boe,himax8279d.txt | 24 --------
 .../display/panel/boe,himax8279d.yaml         | 59 +++++++++++++++++++
 2 files changed, 59 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt b/Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt
deleted file mode 100644
index 3caea2172b1b..000000000000
--- a/Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Boe Himax8279d 1200x1920 TFT LCD panel
-
-Required properties:
-- compatible: should be "boe,himax8279d8p" and one of: "boe,himax8279d10p"
-- reg: DSI virtual channel of the peripheral
-- enable-gpios: panel enable gpio
-- pp33-gpios: a GPIO phandle for the 3.3v pin that provides the supply voltage
-- pp18-gpios: a GPIO phandle for the 1.8v pin that provides the supply voltage
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Example:
-
-	&mipi_dsi {
-		panel {
-			compatible = "boe,himax8279d8p", "boe,himax8279d10p";
-			reg = <0>;
-			backlight = <&backlight>;
-			enable-gpios = <&gpio 45 GPIO_ACTIVE_HIGH>;
-			pp33-gpios = <&gpio 35 GPIO_ACTIVE_HIGH>;
-			pp18-gpios = <&gpio 36 GPIO_ACTIVE_HIGH>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml b/Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml
new file mode 100644
index 000000000000..e42b6a8ae176
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/boe,himax8279d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Boe Himax8279d 1200x1920 TFT LCD panel
+
+maintainers:
+  - Jerry Han <jerry.han.hq@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: boe,himax8279d8p
+      - const: boe,himax8279d10p
+
+  backlight: true
+  enable-gpios: true
+  reg: true
+
+  pp33-gpios:
+    maxItems: 1
+    description: GPIO for the 3.3v pin that provides the supply voltage
+
+  pp18-gpios:
+    maxItems: 1
+    description: GPIO for the 1.8v pin that provides the supply voltage
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - pp33-gpios
+  - pp18-gpios
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
+        panel {
+            compatible = "boe,himax8279d8p", "boe,himax8279d10p";
+            reg = <0>;
+            backlight = <&backlight>;
+            enable-gpios = <&gpio 45 GPIO_ACTIVE_HIGH>;
+            pp33-gpios = <&gpio 35 GPIO_ACTIVE_HIGH>;
+            pp18-gpios = <&gpio 36 GPIO_ACTIVE_HIGH>;
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
