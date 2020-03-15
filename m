Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F36185D22
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5832A6E181;
	Sun, 15 Mar 2020 13:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC436E1D6
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:45:38 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id b13so11702049lfb.12
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oOzyULiNbeFY2/JVqESTmUOi0tZ1RaKtlAJLXAU+LTo=;
 b=jVKh2KC4mKUFqX3k/JW6TS/U7j/YIxHjIFQ7M43CDa5qqWOHKX1aj/xt+WV+FnuBb+
 IPf6kD5dUG264S3EVkYQ2trKmgL74MyI3Zva5tWaFzkW9BdJo84tJsgm9jE9LXb3GsFJ
 BIoEnmvTYCCqmx2Tr5rs5Krsf34i+LhnaXhCRgVXjXkGVnmM77duQGYgcEupqC8qYPBo
 LewMeyxMNxfZZWElHlwUbn4GcVJjkoJmhI8G/QjtLu/DJXL+TUyACsBc4yhdAYdLhQ1Y
 Jexqjsdd1nIKjW8bFDNiS23SJ0+NS84BttZafjMQ52X4gpE4a3SdZpNgPad7Gw235hKN
 dsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oOzyULiNbeFY2/JVqESTmUOi0tZ1RaKtlAJLXAU+LTo=;
 b=TbBUUBzJ5YXl523ajW3MTf57FiaKF/iaiVhwX1hkggt2L85G15SfOETOJ7xvtHb0As
 Yis99BvOk8BJUCLz2pDnPvdqmmudC0B7azhM3px3Nm9GIuNP3MFXEfVZJbInURLAlk2K
 9rR0XGk35NIorVptS4/MXl6yPgzjVqbwbbaKfHKL6w46AQTSx19uzTUIjd30bcFl0ffg
 Ws2CHg4/UULgN+1oZEQn1qqdZg/cB4plVcpkYZV5knvrde1iBZCIVcMY/biWxQU8koj/
 Iw14ROnW7WIs51WG1EkYC2ByCzTqH78VR2AXmCOJcRu4Q54JJeire1fH4qBe+Bb/uuai
 KuIg==
X-Gm-Message-State: ANhLgQ0LoiPhXSFUwVBeYCtT/uCNNZFJ/s3xJiOQz2nXERmroKoTWr78
 uujvsg1vp5G2LqcCip8zQRRRqDRtw5A=
X-Google-Smtp-Source: ADFU+vtr+LHEQowdAfWSKJxhIwCC8cDfNuCiUTXYchSZ2Y3hSfen41VNdYjJLibo6depjha7ND3oEw==
X-Received: by 2002:ac2:5465:: with SMTP id e5mr12479598lfn.210.1584279936692; 
 Sun, 15 Mar 2020 06:45:36 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:45:36 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 33/36] dt-bindings: display: convert sharp,
 lq150x1lg11 to DT Schema
Date: Sun, 15 Mar 2020 14:44:13 +0100
Message-Id: <20200315134416.16527-34-sam@ravnborg.org>
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
Cc: Peter Rosin <peda@axentia.se>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/sharp,lq150x1lg11.txt       | 36 ------------
 .../display/panel/sharp,lq150x1lg11.yaml      | 58 +++++++++++++++++++
 2 files changed, 58 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt
deleted file mode 100644
index 0f57c3143506..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Sharp 15" LQ150X1LG11 XGA TFT LCD panel
-
-Required properties:
-- compatible: should be "sharp,lq150x1lg11"
-- power-supply: regulator to provide the VCC supply voltage (3.3 volts)
-
-Optional properties:
-- backlight: phandle of the backlight device
-- rlud-gpios: a single GPIO for the RL/UD (rotate 180 degrees) pin.
-- sellvds-gpios: a single GPIO for the SELLVDS pin.
-
-If rlud-gpios and/or sellvds-gpios are not specified, the RL/UD and/or SELLVDS
-pins are assumed to be handled appropriately by the hardware.
-
-Example:
-
-	backlight: backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pwm 0 100000>;                      /* VBR */
-
-		brightness-levels = <0 20 40 60 80 100>;
-		default-brightness-level = <2>;
-
-		power-supply = <&vdd_12v_reg>;               /* VDD */
-		enable-gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;  /* XSTABY */
-	};
-
-	panel {
-		compatible = "sharp,lq150x1lg11";
-
-		power-supply = <&vcc_3v3_reg>;               /* VCC */
-
-		backlight = <&backlight>;
-		rlud-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;    /* RL/UD */
-		sellvds-gpios = <&gpio 18 GPIO_ACTIVE_HIGH>; /* SELLVDS */
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.yaml
new file mode 100644
index 000000000000..92f2d12f4f4c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,lq150x1lg11.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp 15" LQ150X1LG11 XGA TFT LCD panel
+
+maintainers:
+  - Peter Rosin <peda@axentia.se>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,lq150x1lg11
+
+  power-supply: true
+  backlight: true
+
+  rlud-gpios:
+    maxItems: 1
+    description: |
+      GPIO for the RL/UD (rotate 180 degrees) pin.
+      If rlud-gpios and/or sellvds-gpios are not specified,
+      the RL/UD and/or SELLVDS pins are assumed to be handled
+      appropriately by the hardware.
+
+  sellvds-gpios:
+    maxItems: 1
+    description: |
+      GPIO for the SELLVDS pin.
+      If rlud-gpios and/or sellvds-gpios are not specified,
+      the RL/UD and/or SELLVDS pins are assumed to be handled
+      appropriately by the hardware.
+
+required:
+  - compatible
+  - power-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    panel {
+        compatible = "sharp,lq150x1lg11";
+
+        power-supply = <&vcc_3v3_reg>;               /* VCC */
+
+        backlight = <&backlight>;
+        rlud-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;    /* RL/UD */
+        sellvds-gpios = <&gpio 18 GPIO_ACTIVE_HIGH>; /* SELLVDS */
+    };
+
+...
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
