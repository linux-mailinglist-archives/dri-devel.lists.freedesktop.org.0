Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C9B185D19
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80466E1CE;
	Sun, 15 Mar 2020 13:45:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A13F6E1CE
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:45:32 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id g12so15628139ljj.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=azOZ7kPdKDKE87CbcQj8S1GR4y4K/OoMeP9jpkMqrjY=;
 b=T2ZA2c+5tlbhyLrAiFFqt/rd0/VzWau2iJzhn8+bRFM4+1dTv0fJfFPfVvTAxKXbI1
 kbqJwQsojD1BcX513aT3h94W4/2KP42h/h81z7rFV/PoaQlxecxhB7v57J0jLeDGOp1q
 3uX29T4nJHY/sz5ErLpFRPkO93Z0x0MizZgzyC7EuR0MDLCZWKuHhWP5zwfdFm+F2EV6
 /yQi9+LGvupDi4oN7V/B4Yq6gtfhIS4ZEtaHTAog3lq2qmnFdkfKb5mg5nPI89r6RV/A
 FZ+O1zW81w4Cz+WhYTwxR1rbigqr4BD/tUVgNXCw9vS6jR44dZqTMpy6c1edpwst4ZmT
 qSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=azOZ7kPdKDKE87CbcQj8S1GR4y4K/OoMeP9jpkMqrjY=;
 b=bCKmalOyyupBMxnQNpQJ3V4k48Zl+n+zKdnpG2e5xy8sB4ZWIwZB+lOePrigDn1X73
 PgZ81arFNFHMOTNG1gdicwNd+Z9Mkh38iLTy/8/9T58sf8ZjSg2SJ9g1do931gDvfA/A
 jM7cL2a5zfWujEQlk4zpmoS7wM+DE9OMyBG+tZBp8t0KciMpjp4KiGvH/4yiBdzOyytE
 ZEVWz4MNUQgqICCJ5aglHWAy5MDf6iIBGFqN2VS/X8g8zWneN6cO/WALYyXxYoX/ss9D
 kKmuJXQk1TYb/o67PDYOwXj95B3LnTHLCu8nVaAxcZOTfabJscx0rBopD4OGoKWwYgJi
 8Tgw==
X-Gm-Message-State: ANhLgQ2+m1dJ7F8eZSaB3uxzCmvk4dy5886fvLU68XR/mdW9TVBpu9Tr
 MoRisjYuFzUiKRJVXjlTVHYJNqxMa9U=
X-Google-Smtp-Source: ADFU+vs5LuCj6JNUC3blwIOkeUFcSwpV+vRt0L6KH2EvF6B7qKXUZVTzXMthHRmmuB8/H9vgT3/euA==
X-Received: by 2002:a2e:8095:: with SMTP id i21mr14054517ljg.193.1584279930756; 
 Sun, 15 Mar 2020 06:45:30 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:45:30 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 30/36] dt-bindings: display: convert sharp,
 ls043t1le01 to DT Schema
Date: Sun, 15 Mar 2020 14:44:10 +0100
Message-Id: <20200315134416.16527-31-sam@ravnborg.org>
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

The txt binding specified the property "power-supply".
But the example and the actual implementation in the linux-kernel
uses "avdd-supply".
So the binding is adjusted to use avdd-supply as this seems
to be the correct choice.
There are no DT files in the linux kernel to check.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Werner Johansson <werner.johansson@sonymobile.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/sharp,ls043t1le01.txt       | 22 --------
 .../display/panel/sharp,ls043t1le01.yaml      | 51 +++++++++++++++++++
 2 files changed, 51 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt b/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt
deleted file mode 100644
index 3770a111968b..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Sharp Microelectronics 4.3" qHD TFT LCD panel
-
-Required properties:
-- compatible: should be "sharp,ls043t1le01-qhd"
-- reg: DSI virtual channel of the peripheral
-- power-supply: phandle of the regulator that provides the supply voltage
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-- reset-gpios: a GPIO spec for the reset pin
-
-Example:
-
-	mdss_dsi@fd922800 {
-		panel@0 {
-			compatible = "sharp,ls043t1le01-qhd";
-			reg = <0>;
-			avdd-supply = <&pm8941_l22>;
-			backlight = <&pm8941_wled>;
-			reset-gpios = <&pm8941_gpios 19 GPIO_ACTIVE_HIGH>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml
new file mode 100644
index 000000000000..a90d0d8bf7c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,ls043t1le01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp Microelectronics 4.3" qHD TFT LCD panel
+
+maintainers:
+  - Werner Johansson <werner.johansson@sonymobile.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,ls043t1le01-qhd
+
+  reg: true
+  backlight: true
+  reset-gpios: true
+  port: true
+
+  avdd-supply:
+    description: handle of the regulator that provides the supply voltage
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
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
+            compatible = "sharp,ls043t1le01-qhd";
+            reg = <0>;
+            avdd-supply = <&pm8941_l22>;
+            backlight = <&pm8941_wled>;
+            reset-gpios = <&pm8941_gpios 19 GPIO_ACTIVE_HIGH>;
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
