Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99470185CEC
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7366F6E198;
	Sun, 15 Mar 2020 13:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092316E0A1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:45:00 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id r24so15637625ljd.4
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DaICPVhWGMzYWehtRVbV/jO9Up7YjJ7XLHT6tmeYB5E=;
 b=ZibC4+UNeg34TbeI3ckGQczgn386Wu/l22ZpAODVcHe97It6VtfBqDTxm9uSyl+BHi
 I5tn/NFGl7HJch+m5eUoaDpspYTPwNi6MdPdoGihz4s55YeyepzrkpjT937R9vxg1bQ5
 vu7sTooKxHv/mJIQ1d5m1uLOCfZtRtq8qSAhNGo2e9pCU2TvsB3IQMju3ozIjdP21PpO
 l/HYXypAtNp6nAHWMkrKndi4YT2Rs/6lk4xSJh047DXuoIvtAV7ty2xsFGsuw/YkbMu6
 SCStaJXWS/xOq75AvYwPMzxTAThl8wP2u9bXtUxSc/huAdJAoLf51x0cTidgbeTzdRYV
 FaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DaICPVhWGMzYWehtRVbV/jO9Up7YjJ7XLHT6tmeYB5E=;
 b=noHB04Gpd6YdbjyCgv1i7HLpgCxoQdPBe8/ps0XW0fHUn/f0H2YKKWEjOqjOzuU0BK
 KoJ2xBXlQGb4Spxn2ipcVxlkVWRo4Ns/3Xy0fS8wQ3hquZO+wcVWxAFxGzpeazb2x66u
 LXChE23w3EsXPjI4WBgAFrcBcGW7nyN9/QO8Xyu/eO+jOTOfbO9QdG/B5IxMaKUFkImU
 Ph8gC6fkUO8b9ayajb16E2wEDjbUKDBBQ0YsBjQojmN9kq/RlOIlHPzv2h8TIz986xX4
 yCP+1sXnGkr6lIgoQFvoPvksDq6FY20Cl4LoXvln7RGBk8u5uUvY6aEskVDcwSYtqniB
 TupA==
X-Gm-Message-State: ANhLgQ1nlhUtIiMbPV7+/4NAhd+eYq3NDACx0OjmS/4acQbV8k6HaDUq
 lFSEjihtN09yswcARCV2CNlhTCRJ/NE=
X-Google-Smtp-Source: ADFU+vtiYR/8jOKEOpXLo77qW2MSVX/PdJNmFiXhUMdYwaEx+J8Z4srFOMItI4TWNSXjVwVgstJAug==
X-Received: by 2002:a2e:b5a5:: with SMTP id f5mr13517595ljn.162.1584279898083; 
 Sun, 15 Mar 2020 06:44:58 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:44:57 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 14/36] dt-bindings: display: convert kingdisplay,
 kd097d04 to DT Schema
Date: Sun, 15 Mar 2020 14:43:54 +0100
Message-Id: <20200315134416.16527-15-sam@ravnborg.org>
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

kingdisplay,kd097d04 matches the panel-simple-dsi binding.
The only difference is that enable-gpios is now an optional
property.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Nickey Yang <nickey.yang@rock-chips.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/kingdisplay,kd097d04.txt    | 22 -------------------
 .../display/panel/panel-simple-dsi.yaml       |  2 ++
 2 files changed, 2 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt

diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt
deleted file mode 100644
index cfefff688614..000000000000
--- a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Kingdisplay KD097D04 9.7" 1536x2048 TFT LCD panel
-
-Required properties:
-- compatible: should be "kingdisplay,kd097d04"
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
-			compatible = "kingdisplay,kd097d04";
-			reg = <0>;
-			power-supply = <...>;
-			backlight = <&backlight>;
-			enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index b2e8742fd6af..949371db0a16 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -29,6 +29,8 @@ properties:
       # compatible must be listed in alphabetical order, ordered by compatible.
       # The description in the comment is mandatory for each compatible.
 
+        # Kingdisplay KD097D04 9.7" 1536x2048 TFT LCD panel
+      - kingdisplay,kd097d04
         # Panasonic 10" WUXGA TFT LCD panel
       - panasonic,vvx10f034n00
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
