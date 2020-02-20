Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A3A16594B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 09:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445258937C;
	Thu, 20 Feb 2020 08:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC67189E5B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 08:35:54 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id d9so1580067pgu.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 00:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HWD5EoDnyMEVvpGTdgYdYgLmYJyVRNy3T597G1z67yk=;
 b=u2FtSKFX4CacAKc8xWvJmhxD5qhhvbDyLNtsCKVsbW1YAKLuZBig5n/p3kq7e8EU11
 A2acQdgTcIYY9/kwND534EI9ZMMShoCdkmAQpIPWxLnz962zv2gfqDQq/4K6ylaR9Jbo
 SyrMJL+10pzYzYGLSs/1D1e0s6OEJazqdlzokcnEWs7xeO1Ss6ibEz9huIEXImHUxqtM
 Ej1JkK/PfA1iy+ho3uFebNt8Xh+0xOR8p/omxgOGvMiXm7Vj42KJnX4CsdB651XJjT1g
 /kyf+TQlbPI6znulHlYcWYzg6BnCPDZY0DiAujkZHHj8DM9QToA0H/ofmXjyMrjpL3DE
 sU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HWD5EoDnyMEVvpGTdgYdYgLmYJyVRNy3T597G1z67yk=;
 b=W8hep26b7S424qzL5Yxrfpjsz/QWPwbKn9XfB/OD9VM5R8M6SMN49RrwsMOqnGafmk
 ETKC5Za/0JVdxhgss+8Pknvh2vZbpOnScmh2/14tCpWdqaIfiQNxp2rf10XB0UelGFzf
 wKsUeN0e6zO23a3JxXiKnPqUbYvyI8q2p6noXABQ6i9kvK1FWuW3dETknICJ2QNTiVms
 zNCqsNPwdPBKvCosZn951gyAt0jotl/LoXLaoZX7KPBiiLUxiTxXARafIWmC68FMJmcI
 lXIZaxVQuukkb4cwMUgqv4BCrg9uBvtbv87jp7vbfmsrFrmKFpqJkJjNP/OV9LXUSN6o
 S/HQ==
X-Gm-Message-State: APjAAAWf4VdG39Z4B2Xlxvpn9hgz5UJrhczg1E4wH+eutJsIUxOJ0kTb
 q/WsscyveVRqKkQu+lzV5yo=
X-Google-Smtp-Source: APXvYqzs7/Gqt1xQfGHj7U15rIDiPo8TglS71njYt+orbfTk1syKkenp7pbBfokhD2s4o1o8orXINg==
X-Received: by 2002:a63:2c50:: with SMTP id s77mr13673718pgs.182.1582187754273; 
 Thu, 20 Feb 2020 00:35:54 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net.
 [216.71.213.236])
 by smtp.gmail.com with ESMTPSA id l13sm2319038pjq.23.2020.02.20.00.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 00:35:53 -0800 (PST)
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
Subject: [PATCH 1/6] drm/bridge: anx6345: Fix getting anx6345 regulators
Date: Thu, 20 Feb 2020 00:35:03 -0800
Message-Id: <20200220083508.792071-2-anarsoul@gmail.com>
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

From: Samuel Holland <samuel@sholland.org>

We don't need to pass '-supply' suffix to devm_get_regulator()

Fixes: 6aa192698089 ("drm/bridge: Add Analogix anx6345 support")
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
