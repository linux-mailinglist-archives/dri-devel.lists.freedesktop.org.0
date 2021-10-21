Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D01435C05
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD676EC03;
	Thu, 21 Oct 2021 07:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25506EC03
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:40:55 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 947B92B01324;
 Thu, 21 Oct 2021 03:40:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 21 Oct 2021 03:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=r1YAMUMbYh8TB
 z8LKCCpgMzm2QMxfhcouzSjIrys2jM=; b=K+9/UMTd3DYjSXs3xz2YxytyV0jbJ
 ZSa9qH9SGAvg00qoGXmnjvUrhA+6CY0oNdBVCWKIpVAV3gJkiGzAtk21kDhG2LEW
 KN5g12uwAObnWJ7IsvQw5QJWeAEJ7Zx/9Xd7+9MkVQX10fQTZO+zcSibnavTOmUS
 66PjBR1n8A1Q60+awDDN7sUFOf1cl04f2+MqJIJivh7ql/IQA8a5K/48SL2Qa77W
 8gmDO/ygQf9QlRdx8XhoO0Zhjwx9eTmCaSqlRMpx+IeqYhJHn9OaTGhi7+7Io7CC
 8FtKw/e4IYdR9eI6rhDpMcn/NyfXWhNC1NthTRxJ8ugzZptfANCRuzl7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=r1YAMUMbYh8TBz8LKCCpgMzm2QMxfhcouzSjIrys2jM=; b=GXe9tVuh
 Y189C23kwB3Dv6xlnm31NpLXpIQCjhUbiq61u7usMTgCNAxJaPoYOEMkQNYM0us7
 i1QYHmqxEy+/H3nr4xCDvP3tccVj1ZTXoz0DIEX1A5upVuuweiamNEHBFO/x5+Jh
 ople7YSc9rmKwZddQ3sanBDuWd7YUCDOMFxpSkkW/4oZu4lqf0GERbTyqoY/3vIE
 cj4wkB+ArLN3T4549FWB/4ss7ycZ2ugqly4gVB/5ss+HdjgH9DeH2Dkw5VypSKLK
 jKqlCJJNwgKLeP4Cra1p6kbLSGfl408zPOl6KnMZtpgH0NnHkHJEif/EQXmVIOzg
 pa4kVZlYe29Y1Q==
X-ME-Sender: <xms:hRlxYWdFHa5CYfp7jdGVnXSPieT2sVuZh37fmEOIetqvL4geHQkOSw>
 <xme:hRlxYQMzuwPcOBQcRQCK8cX_aDYLvF5yKnqiLRMQC0bf7DZPhNdo5d999MXm6fqQL
 r-IgkrwAU6nWDIM6v8>
X-ME-Received: <xmr:hRlxYXjCrV5ca5xyVAg5sL8NrnH1TPR2K33wNIdz2Gksp4-IvmBuXMkNZOVUQFijbPqdlepO8jS5kFlbDv8pwfyiMI-s6RaIx7AcLvIm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hRlxYT8JNwgXZM63zWVTjZiinP6hZ9dZffGEEEd7665nQeDPEVpxtQ>
 <xmx:hRlxYStOFVY1dJvVRpkAoq5qqQAryT7GlZfOqXA1u9Rla9DT5X3MJw>
 <xmx:hRlxYaGG16W85ZHqWmRa-HX7el8fvsJXum0AdsWj8u_0T173Krh_DA>
 <xmx:hRlxYb54dW-Ek3AF4qaW8Enr_bU3hkmmm4Pys1gy6HhSJWbUniFo7dwGP9s>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:40:52 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tian Tao <tiantao6@hisilicon.com>,
 freedreno@lists.freedesktop.org, Chen Feng <puck.chen@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 John Stultz <john.stultz@linaro.org>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Inki Dae <inki.dae@samsung.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
Subject: [PATCH v5 13/21] drm/bridge: sn65dsi83: Fix bridge removal
Date: Thu, 21 Oct 2021 09:39:39 +0200
Message-Id: <20211021073947.499373-14-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021073947.499373-1-maxime@cerno.tech>
References: <20211021073947.499373-1-maxime@cerno.tech>
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

Commit 24417d5b0c00 ("drm/bridge: ti-sn65dsi83: Implement .detach
callback") moved the unregistration of the bridge DSI device and bridge
itself to the detach callback.

While this is correct for the DSI device detach and unregistration, the
bridge is added in the driver probe, and should thus be removed as part
of its remove callback.

Cc: Marek Vasut <marex@denx.de>
Fixes: 24417d5b0c00 ("drm/bridge: ti-sn65dsi83: Implement .detach callback")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 52030a82f3e1..3bfd07caf8d7 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -297,7 +297,6 @@ static void sn65dsi83_detach(struct drm_bridge *bridge)
 
 	mipi_dsi_detach(ctx->dsi);
 	mipi_dsi_device_unregister(ctx->dsi);
-	drm_bridge_remove(&ctx->bridge);
 	ctx->dsi = NULL;
 }
 
@@ -693,6 +692,7 @@ static int sn65dsi83_remove(struct i2c_client *client)
 {
 	struct sn65dsi83 *ctx = i2c_get_clientdata(client);
 
+	drm_bridge_remove(&ctx->bridge);
 	of_node_put(ctx->host_node);
 
 	return 0;
-- 
2.31.1

