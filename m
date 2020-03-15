Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E849185CF4
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7ED96E19C;
	Sun, 15 Mar 2020 13:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318796E19B
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:45:06 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id t21so11694553lfe.9
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U/emWc6W4zftcHfaj2Yi3x1iJjutKkIrJjITu/23MG8=;
 b=soslxIbXlga3HyB3Xw3wJYKYpBXGUY2SyZD4ZKzVIpz/U1tbAfjbUysyQseA7TyOXk
 B5/6Z47V2IY1KxUSXQ59R5/TTFKZ3V10fi+akp9plN/0btYG6qylw4Ur6vaJ+l/w87Qb
 eTOxyGY97JfyCjzJ6t359ubmblf8x2JvVjlO0VJMQ6MJMShO9FvzQl3P7d3Qw4R/9Eyh
 y9Iy+B7MPSNVU0ObeAy4QNfzJFRqRMlzz2kcexsLG7fm6L/pdYv536jwLTDBcpIpNUVd
 D3nu4TkFK3/YG0LuSdsLSpXwawLGCaa7zPi0MrOBdnIIuRL+3KxHwYwHADddMhXrzlrY
 gSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U/emWc6W4zftcHfaj2Yi3x1iJjutKkIrJjITu/23MG8=;
 b=PgW7aPUmR4+WgPJcAcoPYHubpi1JaC8umIxNB6a+mPZA1/U9BEO7n3EsDLU43nfwIB
 nNE7DctEUrXGIbsUgCU0yi13UArTpURv0ceqeEdyq7d1R+JV3bCEQFLzi/lPujODMbjW
 QhqBRQsFt1bMKJCOqkOiSwzonjkd3AvQvmZsOFavPNqgxg80HcE8ANMdIJZDR5sAryTq
 ShQ+35EHQwSw36OqflPeliJ3EPtzSEwK5VJyDbe64rAwhE+LGmLmjCpN72RM5VYEL9J4
 OFCvHtEcivHooZm5UtmoatUb1j14awtfeLvqaTSxuik+fALpO0bh1+G8Zb7r8z0arqDR
 VdJw==
X-Gm-Message-State: ANhLgQ2BZVWR2MlPWnKoZzPtXG5hZoi/YJsaEHjxOC93VhQOHQ7ghpUZ
 a8fKMNfVlWEYSym9MPy6w4oKhFXEwHs=
X-Google-Smtp-Source: ADFU+vv/YARa9XC2pIUfGZx8c4J67p1hauQnO9uNhe9XhQfB4SmZyKZCgmx7UknwsUdiQJnzDkFIHQ==
X-Received: by 2002:a05:6512:10cf:: with SMTP id
 k15mr14706524lfg.142.1584279904157; 
 Sun, 15 Mar 2020 06:45:04 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:45:03 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 17/36] dt-bindings: display: convert osddisplays,
 osd101t2587-53ts to DT Schema
Date: Sun, 15 Mar 2020 14:43:57 +0100
Message-Id: <20200315134416.16527-18-sam@ravnborg.org>
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

osddisplays,osd101t2587-53ts is compatible with panel-simple binding,
so list the compatible in the panel-simple binding file.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/osddisplays,osd101t2587-53ts.txt | 14 --------------
 .../bindings/display/panel/panel-simple.yaml       |  2 ++
 2 files changed, 2 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.txt

diff --git a/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.txt b/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.txt
deleted file mode 100644
index 9d88e96003fc..000000000000
--- a/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-One Stop Displays OSD101T2587-53TS 10.1" 1920x1200 panel
-
-The panel is similar to OSD101T2045-53TS, but it needs additional
-MIPI_DSI_TURN_ON_PERIPHERAL message from the host.
-
-Required properties:
-- compatible: should be "osddisplays,osd101t2587-53ts"
-- power-supply: as specified in the base binding
-
-Optional properties:
-- backlight: as specified in the base binding
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index b1b8d0edadef..70c290f7df30 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -209,6 +209,8 @@ properties:
       - osddisplays,osd070t1718-19ts
         # One Stop Displays OSD101T2045-53TS 10.1" 1920x1200 panel
       - osddisplays,osd101t2045-53ts
+        # One Stop Displays OSD101T2587-53TS 10.1" 1920x1200 panel
+      - osddisplays,osd101t2587-53ts
         # QiaoDian XianShi Corporation 4"3 TFT LCD panel
       - qiaodian,qd43003c0-40
         # Rocktech Displays Ltd. RK101II01D-CT 10.1" TFT 1280x800
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
