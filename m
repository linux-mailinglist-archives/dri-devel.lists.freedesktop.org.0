Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B72F116594E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 09:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319A789B12;
	Thu, 20 Feb 2020 08:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCC9891AA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 08:35:55 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id e9so578905pjr.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 00:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wYQONlA9lvcFld0G+NwhV5rBbyIu6fNUKkg/bhapB14=;
 b=N+fgwF/6e6JTKFlrJgQIRnbOLpsKCtZYnIYWWcKNnfKNY9CCUMr6V9Gw9TGF6pjJIB
 EHSAyjOJyfeCwqQkmI4hUnJOnoferabWuW52Jemsyz3ozxX45q3P64AnHJpigGKXMWzg
 wBZNL9EgTQWFnkbTSNbeoeGpldgIni5ogrZfMmarImqShr+dejWNmNW96uI2OQSM/DiG
 TbWyOd6OuhzcE+KwC0rYa/X8GMZFSoOWT0/63ZQIGG5D9x0EvG1IvBxr9J8jYpAcdO0a
 4Za6FD12Z2xqA0PCoc8lNH2bo+yCBkGwRyZmRXN6uApIHstunbaeA/WX/yObPRwoUFUG
 f+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wYQONlA9lvcFld0G+NwhV5rBbyIu6fNUKkg/bhapB14=;
 b=oFy9V+Gtyrgrd0hb7hIfA60+fXxnf/xXXCb02YC+ydR3PjkmqLys3BTd9AjQrHL19U
 wa52oD5NHxseyXbG4X55f5wdABArGJgK0yYkD858KqzVzVCtmYOPT+JjlRUagbimS8Xb
 3whnQnzTM4IZ6IPenYNX9727mCEtDmsM3eyjc9Ez5iZtHkMeRn5lBHsKdYXaazSFVfT/
 LIHpmJLzCOkZ0buvfI/9Xo/HCLdie8NHGPaux2o9p7Xmd1i9TVU8dJ3nZs4GBgloYu50
 /I2IhFn14DWK/xJsCiN141l7fZOQpZbaRKQ7zzpC1AEgackbFtaLUbnavZ2WAmHk81Ev
 cKOA==
X-Gm-Message-State: APjAAAWqXZl6uWw+hp7PupSR4Go55xMom6LVv/qdf52UOqICKCTugOyA
 jGeRVTan6D0VTz357/Q6x+M=
X-Google-Smtp-Source: APXvYqwAMzlg3ox1kckOd8OArhVChc+fFh1B8FYzsDIg77886p2/0Fs+/up3ECkbKsMtzNNlm8jUUQ==
X-Received: by 2002:a17:90a:c216:: with SMTP id
 e22mr2300961pjt.134.1582187755353; 
 Thu, 20 Feb 2020 00:35:55 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net.
 [216.71.213.236])
 by smtp.gmail.com with ESMTPSA id l13sm2319038pjq.23.2020.02.20.00.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 00:35:54 -0800 (PST)
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
Subject: [PATCH 2/6] drm/bridge: anx6345: Clean up error handling in probe()
Date: Thu, 20 Feb 2020 00:35:04 -0800
Message-Id: <20200220083508.792071-3-anarsoul@gmail.com>
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

devm_regulator_get() returns either a dummy regulator or -EPROBE_DEFER,
we don't need to print scary message in either case.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index 0d8d083b0207..0204bbe4f0a0 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -713,17 +713,13 @@ static int anx6345_i2c_probe(struct i2c_client *client,
 
 	/* 1.2V digital core power regulator  */
 	anx6345->dvdd12 = devm_regulator_get(dev, "dvdd12");
-	if (IS_ERR(anx6345->dvdd12)) {
-		DRM_ERROR("dvdd12-supply not found\n");
+	if (IS_ERR(anx6345->dvdd12))
 		return PTR_ERR(anx6345->dvdd12);
-	}
 
 	/* 2.5V digital core power regulator  */
 	anx6345->dvdd25 = devm_regulator_get(dev, "dvdd25");
-	if (IS_ERR(anx6345->dvdd25)) {
-		DRM_ERROR("dvdd25-supply not found\n");
+	if (IS_ERR(anx6345->dvdd25))
 		return PTR_ERR(anx6345->dvdd25);
-	}
 
 	/* GPIO for chip reset */
 	anx6345->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
