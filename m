Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0780C16F92F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE49C6E247;
	Wed, 26 Feb 2020 08:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21766E23B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 08:10:44 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id t14so977296plr.8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 00:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bV3ZvEYwFOIunmpWLGzAgCdGTlK6S+EV6uVEHB+FGxY=;
 b=Q0cii6N45xFi8jvZk47bAoc1Nxu6hFKn2R/6gr1ZfjKbVoDJZ64PKB8Z3UWgfpC96z
 m858biDFlV7/4mo1LjVTUmbbBHm1yKrJnJ3uLVZBlEdyOFSDznZRxrzu6B/mSXoBfdGU
 mlGpBVLSLPU/z8ykPcedU1XFyCgTRivYgIcpSqG+QITc7/eIRdzyugFFz9Yzl27ql70w
 8AlOefrAt/HgAlO+4L6JoXtZp+YN7BobPP6qXr0OfqH/1PLZecbnI0vC7uItRmmZkPfN
 j7AsPd8mIOV8s5KgCaaK+xwtreytUn7QQZvq+Frfrl0pLWndKlgav8D5uWnV85pooXdR
 SCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bV3ZvEYwFOIunmpWLGzAgCdGTlK6S+EV6uVEHB+FGxY=;
 b=qcC7outDxbNTBU7yBOL5LyoOCFV1B7pvYF/LImrucW/zSyTivpCDD6o02UE3DOmj6N
 v3xTaIezG889tVKCayMRSYKKcRHlquVV+VqKQ7bzXgb5a9T/MTxSok/nel4ITTs3x3d4
 62Vpr12SYiwW6sdegGrLaYunTocRcB0066k2m16doCyVNs06AB27Dm76o+jAJL+muURy
 BNPkvBd+WetGKrsT+gapBbrXfZSfTV0dfMakYb1vf8yMvBEMJp7sgpypIOZ98OR2qciu
 +BqqsFYVQIfku/13H8cYEkrc5W2tVUJIIJYl3ZWc+DsJBZ9HZsGMc5yWP0assssScGDa
 266Q==
X-Gm-Message-State: APjAAAUlcBrXZp158Vw2e9jEEBpk7rRnYdsmYHVYx5CSXWh/FlZW3K7K
 eJ1jaylf81ny9tv1NpKDisg=
X-Google-Smtp-Source: APXvYqwzmN2dNDKDPwprqjYoy3wHRxeIo1QTGdy8Nrs8WKG2CT6K8e2fuBfcpdmu4anfHjvkmdpjJQ==
X-Received: by 2002:a17:902:6184:: with SMTP id
 u4mr2301682plj.216.1582704644297; 
 Wed, 26 Feb 2020 00:10:44 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net.
 [216.71.213.236])
 by smtp.gmail.com with ESMTPSA id v7sm1679230pfn.61.2020.02.26.00.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 00:10:43 -0800 (PST)
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
Subject: [PATCH v2 2/6] drm/bridge: anx6345: don't print error message if
 regulator is not ready
Date: Wed, 26 Feb 2020 00:10:07 -0800
Message-Id: <20200226081011.1347245-3-anarsoul@gmail.com>
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

We don't want to print scary message if devm_regulator_get() returns
-EPROBE_DEFER

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index 0d8d083b0207..0bf81b9b5faa 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -714,14 +714,18 @@ static int anx6345_i2c_probe(struct i2c_client *client,
 	/* 1.2V digital core power regulator  */
 	anx6345->dvdd12 = devm_regulator_get(dev, "dvdd12");
 	if (IS_ERR(anx6345->dvdd12)) {
-		DRM_ERROR("dvdd12-supply not found\n");
+		if (PTR_ERR(anx6345->dvdd12) != -EPROBE_DEFER)
+			DRM_ERROR("Failed to get dvdd12 supply (%ld)\n",
+				  PTR_ERR(anx6345->dvdd12));
 		return PTR_ERR(anx6345->dvdd12);
 	}
 
 	/* 2.5V digital core power regulator  */
 	anx6345->dvdd25 = devm_regulator_get(dev, "dvdd25");
 	if (IS_ERR(anx6345->dvdd25)) {
-		DRM_ERROR("dvdd25-supply not found\n");
+		if (PTR_ERR(anx6345->dvdd25) != -EPROBE_DEFER)
+			DRM_ERROR("Failed to get dvdd25 supply (%ld)\n",
+				  PTR_ERR(anx6345->dvdd25));
 		return PTR_ERR(anx6345->dvdd25);
 	}
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
