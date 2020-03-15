Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 680A4185D05
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B8B6E1B6;
	Sun, 15 Mar 2020 13:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CB86E1A4
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:45:14 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id q10so11696857lfo.8
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B3b7v3jOY+BEoITyEXppKyuNdMXph+o8yVRg4fC4u8I=;
 b=ZZRgEYtfMwf8hny9XTolYcMHHBBtuR8qClGcSjJfqHToyZOJ4RqB3R5wM/xen1SHXi
 WrTy0Ms+W5rCEdgJ0+hTMdsirV9opKmO+yk2INO0z6giusoSZTdgimlL431MUbxh+Jgy
 o1njPeOpjedD5wwPz1aEaqF0VZHUG9FyY34zAgtFNYQFpGyJtU04Huzd1+sHBnEMulwP
 aLyqdKw01/WCit7qD6wHV4D1pKuA8nbsyca92ZGxnwJ6hG5GTAF0wOaTDC9o/yQlQALl
 6IgfpxFFf1xSr0QGu0vSuLK+ss3lhgCiYH5kZnrLx9qW76tAzqGMYdTl65y9hybyD8Q5
 53Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=B3b7v3jOY+BEoITyEXppKyuNdMXph+o8yVRg4fC4u8I=;
 b=MSGm8xBBurteeAMJLU3DiNfxnNRw310IiYryPvM+vUeGphgQ084FLAsofAWm2uSfTV
 3ZOt3OfhXAtqNLHibvAmcoGIbUWlRp6YDX1kmSPaviBzjiLgoIFOg+y7o8I5Xctx8D0W
 8841vl4//jUJlSu6ApNzn9BkakfBnUeep5oO7Jvapv6hv2MyQIilqn6Ciokj+LAGYEZj
 UEjZLGmqpQ6xx81R8G49cD+ZHnAUqN6OBbIoiNf345dypEn9l/NCbK2I47Sjp0WIm2r8
 QmuJBVvC3lL51lRrappd3UuV7GKgY09oqzLLuuO5QSJw6GOIxKhKoALdTGlFJqQR2mIp
 ZExw==
X-Gm-Message-State: ANhLgQ1hP2ewS9zanDkfYeyXt2KHnetpjM76cXiAu96OWLOVSGH6L/Lo
 9OPoJImVhV858dhExzYh/x4gNaJnADU=
X-Google-Smtp-Source: ADFU+vs5SZ0RjLxx/mcXO1vlxdkNPH3sSNPKwNq5nPrIwT5rKIrQAIVis04WnsLYjPbxsvfuIfaWxA==
X-Received: by 2002:a19:9d0:: with SMTP id 199mr412715lfj.175.1584279912362;
 Sun, 15 Mar 2020 06:45:12 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:45:11 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 21/36] dt-bindings: display: convert samsung,
 s6d16d0 to DT Schema
Date: Sun, 15 Mar 2020 14:44:01 +0100
Message-Id: <20200315134416.16527-22-sam@ravnborg.org>
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
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/samsung,s6d16d0.txt         | 30 ----------
 .../display/panel/samsung,s6d16d0.yaml        | 56 +++++++++++++++++++
 2 files changed, 56 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.txt
deleted file mode 100644
index b94e366f451b..000000000000
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Samsung S6D16D0 4" 864x480 AMOLED panel
-
-Required properties:
-  - compatible: should be:
-    "samsung,s6d16d0",
-  - reg: the virtual channel number of a DSI peripheral
-  - vdd1-supply: I/O voltage supply
-  - reset-gpios: a GPIO spec for the reset pin (active low)
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in
-media/video-interfaces.txt. This node should describe panel's video bus.
-
-Example:
-&dsi {
-	...
-
-	panel@0 {
-		compatible = "samsung,s6d16d0";
-		reg = <0>;
-		vdd1-supply = <&foo>;
-		reset-gpios = <&foo_gpio 0 GPIO_ACTIVE_LOW>;
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&dsi_out>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.yaml
new file mode 100644
index 000000000000..66d147496bc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6d16d0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S6D16D0 4" 864x480 AMOLED panel
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6d16d0
+
+  port: true
+  reg: true
+  reset-gpios: true
+
+  vdd1-supply:
+    description: I/O voltage supply
+
+required:
+  - compatible
+  - reg
+  - vdd1-supply
+  - reset-gpios
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
+            compatible = "samsung,s6d16d0";
+            reg = <0>;
+            vdd1-supply = <&foo>;
+            reset-gpios = <&foo_gpio 0 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
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
