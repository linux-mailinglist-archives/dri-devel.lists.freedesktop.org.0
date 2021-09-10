Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 106E840699A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE4E6E9C0;
	Fri, 10 Sep 2021 10:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBB46E9C0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:13:02 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 1A41E2B00953;
 Fri, 10 Sep 2021 06:13:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 10 Sep 2021 06:13:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=590Q5CeovMlaY
 Iqfzw6ds099mwIGojrXNZbg0b8wkuw=; b=J9M2mIikzifZlxbJ5aACPcn0CM1eb
 UvcMIQ9TYQn9Ueaf/lCkviYmDiixIG8aitinPRMOUfg0ziWy6c0rPVD5rnlexO+w
 OWpq8OqT4vHBNb3BZIIbdgoig6Q9sPDyamAY2zUt3jsqcuiwVj8FFmiF4YVEZTa7
 F7KdqXGrqZMLK08+opvm2mPorKaTpBjhGnfzVQkEhITKKKqpRoKChRF+2CgSLj7E
 x6eBEOf/ROTmTHdfxG2aVNY2ctLItFFEW85GM/Uw7ZG81lVjPlJFpTg4W9ZJ0w5I
 1deTf8McYVldb0TTMje0XtMr3K9M2aAcm5k+VAs4J5DzOvfdwncBGoFhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=590Q5CeovMlaYIqfzw6ds099mwIGojrXNZbg0b8wkuw=; b=Wr/k4YTC
 Zd9hw5dbFJRwjaV6njUiw04aM/Wjy6pDT0tt5j6IKtyetp3lJtx93vzmIuMDmRD4
 dS/OhUvE56WjebEtWYeCEus6vB/ZeKloNp9TSVqIPb8fcuy7GR6akjaNAGyAgdBw
 HQ0TY1FFuc31JAEBEBjco7zD3Dl0+qhRHpo8UXSxwEFcbu0y5neT3W4TdTTmIUDk
 0hxr3Y4fIY3ZOnI19fJ5l/zrVgE83c5oq3h8wfEHSx5gwHv1CNsCj2zX5OsuQnv7
 VmFOwAKRGLFGsEH5qcKk3HpWC2AazNdBgPPyMnvlWmraxNsnP5Qh+0j2F4dx/for
 HEgPXaSespv8Lg==
X-ME-Sender: <xms:qS87YW2s-oDf_j5gcTDkQHaXLytP_O2jLFavpsoT_krEHkJ19L84Cw>
 <xme:qS87YZF0F-SDUWFljm-Hghn0XPSabZXnmW854ylthF9qsA8c8Nvzdv7aZ5qxohWlc
 cQhkYMSh4GSQ-tnKww>
X-ME-Received: <xmr:qS87Ye4_w1uZ-WeBWc3Km2QvXnnnAPndtnMtzueAb3kHVuLUO-VCCmqCbg1Slh6RaFV1u8aUu1l33V-x945c6NMbtByfE-Zs7Del>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qS87YX143RUqatALbYCStc0cyqBCFGh6dHVFsYvx1wlnTsvg0nss8Q>
 <xmx:qS87YZFfDP8e5BC-MtZP_mqBUJAdCsNUXvu_roa6BBd1yjgRE7jWDw>
 <xmx:qS87YQ-Tsw7mAIMjacpLi-YlobhBddrexyPXyDPA5q1vfZC2dG9lGw>
 <xmx:qy87YVVznz3SficJgGpcNlQqgV54Eywzn5tedaM2u4AnQk4kue2WHyfYoiY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:12:56 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Tian Tao <tiantao6@hisilicon.com>,
 Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, John Stultz <john.stultz@linaro.org>,
 Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH v4 06/24] drm/bridge: adv7511: Register and attach our DSI
 device at probe
Date: Fri, 10 Sep 2021 12:12:00 +0200
Message-Id: <20210910101218.1632297-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910101218.1632297-1-maxime@cerno.tech>
References: <20210910101218.1632297-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to avoid any probe ordering issue, the best practice is to move
the secondary MIPI-DSI device registration and attachment to the
MIPI-DSI host at probe time. Let's do this.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 9e3585f23cf1..f8e5da148599 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -910,9 +910,6 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
 			return ret;
 	}
 
-	if (adv->type == ADV7533 || adv->type == ADV7535)
-		ret = adv7533_attach_dsi(adv);
-
 	if (adv->i2c_main->irq)
 		regmap_write(adv->regmap, ADV7511_REG_INT_ENABLE(0),
 			     ADV7511_INT0_HPD);
@@ -1288,8 +1285,18 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	drm_bridge_add(&adv7511->bridge);
 
 	adv7511_audio_init(dev, adv7511);
+
+	if (adv7511->type == ADV7533 || adv7511->type == ADV7535) {
+		ret = adv7533_attach_dsi(adv7511);
+		if (ret)
+			goto err_unregister_audio;
+	}
+
 	return 0;
 
+err_unregister_audio:
+	adv7511_audio_exit(adv7511);
+	drm_bridge_remove(&adv7511->bridge);
 err_unregister_cec:
 	i2c_unregister_device(adv7511->i2c_cec);
 	clk_disable_unprepare(adv7511->cec_clk);
-- 
2.31.1

