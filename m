Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B184916594F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 09:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B596E117;
	Thu, 20 Feb 2020 08:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7496ED00
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 08:35:57 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id j17so579453pjz.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 00:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ijTyB6ZR5pfL9IN/EaJ22u7Sp0djdDBIhKNgT7JvipY=;
 b=b3u9Ja078tSmcCLcfoMQJDexdgyH/UZUnFYqU4ZxbLy6czS/yTF/tJ2B8Yy102S8sN
 U35/QiLltRKbOx17qqhB/GkFDaJejvf4ImYkPJ25DMx7AXr1DiGNp1qeccXsGpTmPjUP
 L6keUCh/INygIGP1TJB5/Vo/Z7pz9epIu2+IHkFdNt/rgqueYxtm0/ZTVnAUYhoJH5Ha
 TOH7wvgMIqCYUNxrwLgoS2ReFdCSfBx6ddtW3rxgGGCW7Yyz+sfheNQqlsYX0SgdP2Ud
 3/xrhFyrS6DTh24Z7fd2eRhzaA2g/EzfPLcCqvIVOr3owpGad3Hza66L98rZlOmnSkND
 k14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ijTyB6ZR5pfL9IN/EaJ22u7Sp0djdDBIhKNgT7JvipY=;
 b=RCAzhQlEkZnhGTyweW+QG0nvPv3duSUUZy03u1LQHT9ge00Ya4E9mBdGwrOUBZqezJ
 pM3rG/TjcsyeU/eCRymrVDQYY1UJCswwet+aAJBIpeWzNhgGlYUQPv8phxkG9dNEnxdI
 8/ZuwMpuSP/1Zd7qCQbMMabwlFtWN877Nj4qTRD7uDZW/VboJsYwNanB+P2AsUP+meZ+
 X9aCUSeTnz3fTNDTep5O4DnOr3gIQ1t4sZhuZTyB5EwxzblTVpBevb9+ZrQyqamQEpVL
 lYDfwM0x8PgMcRQ3FCojUWCiclWDksvBy6QHXXE1JSfgRwf/MqWLJutFJKFshGMWcWGm
 +ung==
X-Gm-Message-State: APjAAAWoStuBEn/zP4D8v3OkBgz7sFygo6/Q8V1yTdeW1pbhhvSQbRQz
 xpiIr4tM/kZzR7NYNMhxGHE=
X-Google-Smtp-Source: APXvYqx+XcOfE7rl34bx8Kj5W10tYHXxB9gA64KZqWfc1a/TzGmCwogwaY6RZV8h7YFo8hBwokFMIQ==
X-Received: by 2002:a17:90a:b381:: with SMTP id
 e1mr2289733pjr.38.1582187757461; 
 Thu, 20 Feb 2020 00:35:57 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net.
 [216.71.213.236])
 by smtp.gmail.com with ESMTPSA id l13sm2319038pjq.23.2020.02.20.00.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 00:35:57 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@csie.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Icenowy Zheng <icenowy@aosc.io>, Torsten Duwe <duwe@suse.de>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/6] dt-bindings: display: simple: Add NewEast Optoelectronics
 WJFH116008A compatible
Date: Thu, 20 Feb 2020 00:35:06 -0800
Message-Id: <20200220083508.792071-5-anarsoul@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200220083508.792071-1-anarsoul@gmail.com>
References: <20200220083508.792071-1-anarsoul@gmail.com>
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
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit adds compatible for NewEast Optoelectronics WJFH116008A panel
to panel-simple binding

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 8fe60ee2531c..721de94cc80a 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -43,6 +43,8 @@ properties:
       - satoz,sat050at40h12r2
         # Sharp LS020B1DD01D 2.0" HQVGA TFT LCD panel
       - sharp,ls020b1dd01d
+        # NewEast Optoelectronics CO., LTD WJFH116008A eDP TFT LCD panel
+      - neweast,wjfh116008a
 
   backlight: true
   enable-gpios: true
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
