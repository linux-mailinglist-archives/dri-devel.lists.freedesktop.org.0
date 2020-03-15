Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7303F185CDF
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6366E186;
	Sun, 15 Mar 2020 13:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D166E181
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:44:51 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 5so4601162lfr.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DKFWNzm+inHvUnuFaBbTyPTrAd4h6YpCxucuZ+VVDvg=;
 b=nKQkRbs6p7IU6GKjqEAoG/cl1CtIpH+L/FrvbrTmJCLaV2cNEYHISe0/xnBO2pnCoi
 tm25uzNnyMFSpPnNrAbUugYBn7ixSlcl7XtqS6N2cD9nz7IJCm+CPPK9Dj4E/sQmm0Z1
 br7eDuzTfyk+VVm+L+T2vSOJ249dlsCTvZha1x60RHoCCaSyvaVnUZ8TGFxgFT5FY1Dz
 ndve/sIQpzM9HJ7ubT8+f3MoVRL5it674tni+OL0RzSOAwr7Ny7ChiPqwoAxtOFekX2n
 Ch0ZYff0Dm1FLo1o801LkUTwCVqZojTf/D+SpivzJR8GkiohK9wbY97Ult8LleZBvaYp
 5t2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DKFWNzm+inHvUnuFaBbTyPTrAd4h6YpCxucuZ+VVDvg=;
 b=hiaBDEFGrLv+RKOlqJL8BOjalcLxTCoG4UNu99sxWlQH7JlyU6rbdreub+R4uS6kqG
 nUQZm4zromtvPr1WyvtCeBzcK9hKQG+p7fq2aKwlHDGQ7avugR2MOHDb9qUkNKtaih4z
 0qGVk5p9S5PRiQvjQKgwldGb1EzSnV8X/j4JPfM5Zu5YYTRqAPMQH0kL3cl3qN9Bp7vG
 InSOht7TGXdViePYT+EXavTllV8E8bgiKSSharUGRF2F1pKs0he3m8EwuNzrWg55bKx2
 sbLQ3w5uGCO9K+mJbKq39PxX8u38D1UrELj10dgks+i93+B9SDEBX0+XI8oEYyH6fVdE
 CCOw==
X-Gm-Message-State: ANhLgQ1jwnWsecJP6gtECetnf6uf3C6Pz2YQP9fWhSZ4bmWm8EkoYkjw
 a7T2zfEt3/e/5l0Bey2iYG63gnhBXME=
X-Google-Smtp-Source: ADFU+vs0IGyQy3vzYGDlnv9TvE4khDaBhV7yBGIAFb8i07P4mBDYkpaUXJBq/gHEcKsW7v9UOYK1uQ==
X-Received: by 2002:a19:a415:: with SMTP id q21mr13918816lfc.21.1584279889723; 
 Sun, 15 Mar 2020 06:44:49 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:44:49 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 10/36] dt-bindings: display: convert innolux,
 p097pfg to DT Schema
Date: Sun, 15 Mar 2020 14:43:50 +0100
Message-Id: <20200315134416.16527-11-sam@ravnborg.org>
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
Cc: Lin Huang <hl@rock-chips.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/innolux,p097pfg.txt         | 24 --------
 .../display/panel/innolux,p097pfg.yaml        | 56 +++++++++++++++++++
 2 files changed, 56 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p097pfg.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.txt b/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.txt
deleted file mode 100644
index d1cab3a8f0fb..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Innolux P097PFG 9.7" 1536x2048 TFT LCD panel
-
-Required properties:
-- compatible: should be "innolux,p097pfg"
-- reg: DSI virtual channel of the peripheral
-- avdd-supply: phandle of the regulator that provides positive voltage
-- avee-supply: phandle of the regulator that provides negative voltage
-- enable-gpios: panel enable gpio
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Example:
-
-	&mipi_dsi {
-		panel@0 {
-			compatible = "innolux,p079zca";
-			reg = <0>;
-			avdd-supply = <...>;
-			avee-supply = <...>;
-			backlight = <&backlight>;
-			enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml b/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml
new file mode 100644
index 000000000000..5a5f071627fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,p097pfg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Innolux P097PFG 9.7" 1536x2048 TFT LCD panel
+
+maintainers:
+  - Lin Huang <hl@rock-chips.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: innolux,p097pfg
+
+  backlight: true
+  enable-gpios: true
+  reg: true
+
+  avdd-supply:
+    description: The regulator that provides positive voltage
+
+  avee-supply:
+    description: The regulator that provides negative voltage
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+  - avee-supply
+  - enable-gpios
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
+            compatible = "innolux,p097pfg";
+            reg = <0>;
+            avdd-supply = <&avdd>;
+            avee-supply = <&avee>;
+            backlight = <&backlight>;
+            enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
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
