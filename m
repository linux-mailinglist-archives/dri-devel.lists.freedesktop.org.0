Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB0F16F92E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15996E23B;
	Wed, 26 Feb 2020 08:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DEE6E222
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 08:10:43 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 6so940997pgk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 00:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4KM0r5uD7rljHPdtJuNxVsZCmDnwVuLvCzxfAh27Klw=;
 b=dgRS/obec3aOByr8PTKvXVfLFPdY1OXcSqqEUuyzPCu3aykdzkVOJ72/vImDdDvwYy
 u6HGV4iMY1+UU+6DDHioTxtUmpb4PL1lZF9mvbpeFOT35Mv2rS6loQXlTy5PFr/ULB4B
 lWV4RthTKBuPwRIoUJkcrsrmXJSZo5zuYr9Oo1NFcrbFmqPY68uGSvIhMKxSZsO769hX
 ujP/inLHS1BnYoTZvXdKpMKWCie+TcW+f6ic+DwM5gEVUlvh2oZnE/KN+Mq3UuB1youB
 dUl46XZqucP07YZ37nkUhsXFZn5UiopzPt1a6mWynNd4vdD+LEgxQgd3WURCof44zIb4
 ifRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4KM0r5uD7rljHPdtJuNxVsZCmDnwVuLvCzxfAh27Klw=;
 b=gHM6NjDVXmYj5oExj/vYXEjZzlWOw//43JObk4CRWaaNp9iU060fYRSkVVYk0PjyU4
 3ZD1YxfrgVmJKkcpoBQoz7YCXfW6HMdOOTAi53B5AnrrROEns52gWCf5rr5sAUu57+5E
 hfy5U1e1TLeIA4bihUBqo7QvQ6fQhfaRr/ddQRiqbQmm2314RwNntFLHz0Qmkjei64sz
 cZVO1ADdIYudz25mruhozx7y0kS59TqVyMFQWoDWoGD4RfQxoMVvRMUU/nMZahql1+pd
 vGzymwLFJffRm6PA+7XhRMZ9SRlpbV0dBVF3YYuszFLvqFzrwzk+66IUBaOBRhHKSLQ7
 iPag==
X-Gm-Message-State: APjAAAWGWJA/buGH10U3bWi2V5clY6CmGbUspz7p03Mo7p2iBB3AsYbX
 XPTYH9AnGkEGyg1fSgQO5TU=
X-Google-Smtp-Source: APXvYqyQjLc15uh0MUo/Upb22dso+icknd9LfH39mfhW5X2d4U/9EURWB7pcI9luJw0/E5sOA2wZ5Q==
X-Received: by 2002:a62:3304:: with SMTP id z4mr2893899pfz.79.1582704643017;
 Wed, 26 Feb 2020 00:10:43 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net.
 [216.71.213.236])
 by smtp.gmail.com with ESMTPSA id v7sm1679230pfn.61.2020.02.26.00.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 00:10:42 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@csie.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Torsten Duwe <duwe@suse.de>, Icenowy Zheng <icenowy@aosc.io>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/6] drm/bridge: anx6345: Fix getting anx6345 regulators
Date: Wed, 26 Feb 2020 00:10:06 -0800
Message-Id: <20200226081011.1347245-2-anarsoul@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226081011.1347245-1-anarsoul@gmail.com>
References: <20200226081011.1347245-1-anarsoul@gmail.com>
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
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Samuel Holland <samuel@sholland.org>

We don't need to pass '-supply' suffix to devm_regulator_get()

Fixes: 6aa192698089 ("drm/bridge: Add Analogix anx6345 support")
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index 56f55c53abfd..0d8d083b0207 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -712,14 +712,14 @@ static int anx6345_i2c_probe(struct i2c_client *client,
 		DRM_DEBUG("No panel found\n");
 
 	/* 1.2V digital core power regulator  */
-	anx6345->dvdd12 = devm_regulator_get(dev, "dvdd12-supply");
+	anx6345->dvdd12 = devm_regulator_get(dev, "dvdd12");
 	if (IS_ERR(anx6345->dvdd12)) {
 		DRM_ERROR("dvdd12-supply not found\n");
 		return PTR_ERR(anx6345->dvdd12);
 	}
 
 	/* 2.5V digital core power regulator  */
-	anx6345->dvdd25 = devm_regulator_get(dev, "dvdd25-supply");
+	anx6345->dvdd25 = devm_regulator_get(dev, "dvdd25");
 	if (IS_ERR(anx6345->dvdd25)) {
 		DRM_ERROR("dvdd25-supply not found\n");
 		return PTR_ERR(anx6345->dvdd25);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
