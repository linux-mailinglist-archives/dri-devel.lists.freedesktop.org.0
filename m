Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CBE185CDA
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA016E177;
	Sun, 15 Mar 2020 13:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3EA6E179
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:44:49 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id r9so6194364lff.13
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zmqWqwwj9+Xd7JsaiFF8KfpTIci7pCIkgyUayONmZn8=;
 b=fYhyZxUYQQ4A31HUuS/1vlTKGroCvMGAaME+rIRviZhTzcS1G9swkC/Oi6BHB/TI0B
 FKdFZ3ly/tUmoq+rbdyse9zm8zvRtWD+7kQ9rfqVCaczOIVl1M+eUArrMnF6YeBDteuj
 Lt4v6PuR1tYDi5hOfi27m+4Jr9YFAyhNdSYn0MxFg3vgXlw5GjG5oYefwvKc4zsfEXm2
 Biy3pNzfHO/kph+2Mp1NsVC+8R0HcEz7fJ+EoZNFIvnmtgQfgO/DYDrDWlTk7Dhlm4OR
 ZBI04cMncsOyAMc2tXQTJrSNgzL/9uXPJozsC/Drc3WSl5Q5qlAvu9gLTBoyc7w48aY5
 KhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zmqWqwwj9+Xd7JsaiFF8KfpTIci7pCIkgyUayONmZn8=;
 b=A7PYYp3SZAULqxjDwaV3FhnmFoZKCDOoWQ9KtKPtprHinsDs+OfbkPPAySGvjHNxvl
 rvpifw2i25/Chp1hPu8vMkNYq9a3Zm/ynCdm4H8CYAlK+gI3M2O50aDIRnjUbMutqrtH
 V5wbTL87jMRdwm2UT1Ez3FN3q9sdYvlheT5oZl1uStiiELe2X7ey0QQbT08VIG/7UbyZ
 JpMZOTjikyDIL8+eEChdZjPk0dlim5l6zfxsSodoBUhMjtu/1WMI/IO/cIlfzRcWZKpS
 nxyY6W6+8YRi1mTTmluOjazytoPF2eCHdcB28HGRqb0LEbzLKKumNiSK8MiqeAQjmPEd
 Y7pA==
X-Gm-Message-State: ANhLgQ1fL5/9MM1Tp7xhHpSGDWeJKRTGUJDVQslFU86lJwrL2tmvC9NE
 IBx/o518PBBjWZbxsT4HuTiYSiTGFtg=
X-Google-Smtp-Source: ADFU+vu8mDyzwYKm+GWNx575bjhBRZT6xdr6t6LXfxJ16I5/GZF3rwPg85UQQpBvN2KubxQa5A2lXQ==
X-Received: by 2002:a19:6e0f:: with SMTP id j15mr13943660lfc.76.1584279887761; 
 Sun, 15 Mar 2020 06:44:47 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:44:47 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 09/36] dt-bindings: display: convert innolux,
 p079zca to DT Schema
Date: Sun, 15 Mar 2020 14:43:49 +0100
Message-Id: <20200315134416.16527-10-sam@ravnborg.org>
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

As the binding matches panel-simple, added the compatible to the
panel-simple list.
With this change enable-gpios is now optional.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Chris Zhong <zyw@rock-chips.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/innolux,p079zca.txt         | 22 -------------------
 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 2 files changed, 2 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
deleted file mode 100644
index 3ab8c7412cf6..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Innolux P079ZCA 7.85" 768x1024 TFT LCD panel
-
-Required properties:
-- compatible: should be "innolux,p079zca"
-- reg: DSI virtual channel of the peripheral
-- power-supply: phandle of the regulator that provides the supply voltage
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
-			power-supply = <...>;
-			backlight = <&backlight>;
-			enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 393ffc6acbba..5088fe81d025 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -143,6 +143,8 @@ properties:
       - innolux,n116bge
         # InnoLux 15.6" WXGA TFT LCD panel
       - innolux,n156bge-l21
+        # Innolux P079ZCA 7.85" 768x1024 TFT LCD panel
+      - innolux,p079zca
         # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
       - innolux,zj070na-01p
         # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
