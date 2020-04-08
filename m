Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C41A1A29D0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737DD6EADA;
	Wed,  8 Apr 2020 19:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252786EAD6
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:51:58 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id t17so8963722ljc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DaICPVhWGMzYWehtRVbV/jO9Up7YjJ7XLHT6tmeYB5E=;
 b=HYnB/to8RJXQKnyDwMdbAnEqtL8JJbJA987j6GgWeJtT7Fz1wkLdhsfcoO7MkdcVol
 o0KcR5zXEZVl6NQbrBkGlbx14iQpYH755wNkDfJ2KHJ8EtRqleoUuVRHSCONchLtd/KD
 Hu7fdoiSZpbjJAdWStNO6AsKlzJQeZU5zR+EEs7JqkGI5UauudPO2qzDQws2pg64twl9
 Z6gshauG8+8Lnh4s4W3rZAdL0elmyp03uxO3k82X8d/FETZqm8BB1lyVEB8Sp4K71EPg
 vFNWfAGbmVvnYFclGoS5r/relJTypd2ifH6LsWU9uwegneI5LwzhLmFfhVh8UU5VMG7s
 J8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DaICPVhWGMzYWehtRVbV/jO9Up7YjJ7XLHT6tmeYB5E=;
 b=f6WDanzcvCjHu1Qo9SMmtzoVigkq16aq5HyV7sHFxpJd1qCePmfL+CQS2HN9/kjulY
 IM1Y9/qAgSWAhVvzHSn+ewvxLKrL7vVUS8KesRYzVUeh85UiWlYhAH2SXAPZVX/PBY5a
 4S77xHJldAu5jtQsN3ho7+GNMczGP7A+226YX7E6p5WJpE+Xw5anZcIiuQ4E+TgxZiUf
 lR6Lsd9BWsr/axa0QFxs7I8R0j/7aHf+kd7yDNNpFnyRdqUnnG4yIJutfiMAQgPSzLuU
 lH2u6TrjWFChK9XIr2KNArOJPF0WPkAGrefAvrcIAZQ47r4mBcqmBIeYHSk3lvOS43xJ
 Vcug==
X-Gm-Message-State: AGi0PuZ7XHhxv+kMBJ5prYW7ffOuYhMrv9TVWFhge1KilgynDgEtjTKD
 qgxY2wppNGsiYZTtwBx+jFiFMdpGEm8=
X-Google-Smtp-Source: APiQypIRlLDB66S2v+CD42pwXG2CjA3QxlWHexQl/bSzdmSMgYVVWvSsx2LYOSWCZeX3WsoKJQEGGA==
X-Received: by 2002:a2e:8612:: with SMTP id a18mr5580381lji.250.1586375516188; 
 Wed, 08 Apr 2020 12:51:56 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:51:55 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 14/36] dt-bindings: display: convert kingdisplay,
 kd097d04 to DT Schema
Date: Wed,  8 Apr 2020 21:50:47 +0200
Message-Id: <20200408195109.32692-15-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
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
Cc: Nickey Yang <nickey.yang@rock-chips.com>, Sam Ravnborg <sam@ravnborg.org>
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
