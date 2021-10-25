Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168D6439A25
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F056E151;
	Mon, 25 Oct 2021 15:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2536E10F;
 Mon, 25 Oct 2021 15:16:15 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 33EC55806BC;
 Mon, 25 Oct 2021 11:16:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 25 Oct 2021 11:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=EN5xePGTNMO0H
 /F8C9iuzf8RZG/qHM1W7ybnkbL4DMs=; b=hlZp1sT3HLSCz/Rhmcq+ASF4Avo88
 FcMod4BawMyaZRg7SCyC1XaEH+8I+CeU7mO2XUQ0y0BfDU6RIazcz2ru3pB0qFNf
 ElQXIvbJ+iRV0fu/44hPtKbzq8Csmm/uoR8KvUZydpF2gw7eElYH650HWWOHxXCz
 lVlwwH3nwrjTOqlm3P9fD2ZOtYhRpJ8YAOJKRblL+LpOeZL4SyZBg+nB4W3kCm96
 DWV5i/C+o9YqR/akW9uv2q6E85QWelbVfNo7hyB3g01SJXPIduFvTzBunaJAwbDF
 aIWclJhLAIhDwuMsxRyb5e6AXPE9+YwlAyAMarEh03Tt05/AxoSqzWHJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=EN5xePGTNMO0H/F8C9iuzf8RZG/qHM1W7ybnkbL4DMs=; b=PuJpfAql
 7IgjLU8t2bvI5bLrB18yexPm/4im/DZXovQsMcRv1y6kL/goOgy8b8m45GS5GBpi
 jSeWUPUW5II9wQuQwUhxM/4VNp6W+WufdkOex+2WLWPTJZ8ap5MQsvHaQvAI3qQh
 ZO4L+exvP+Lq79FsPoU2uVUEbjfxPqMjJEmWyymwqlpc/fQbNOQ91YbN8pHrR4++
 NTSYQW6UNdXyQ5g5BQcoUzwvMVG5m2kmaoNMVTjo7Z1vZh7K9nBFqisYCa392cOh
 V6OdZb8WdIq8oj7DMzhIi+3S0+4uF85w8P1TtukFkx45clZ0yIWSn+gc3FNXsY4R
 6g22smeQcmwmpA==
X-ME-Sender: <xms:P8p2YRk3pKjfNjFsWunWu8qNhT98WxHKuCDFRzzjjFrWrn_yMEuleA>
 <xme:P8p2Yc0HbhiC9kYzeBWHZuYSi2VYRMTUDsdnnrmlREfySIU3dE0tE-ijKg0MSH_eo
 Qflf2kaU289kn6M61I>
X-ME-Received: <xmr:P8p2YXrYNzDAYSKk1seDpXifLXr_CGSUsMkWWTboAZGKFSDcMK-DMHXzPZ-VzNpZAyoiyihKudkOzDEz6Um9JAijiw34kQmyM16RTh5_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:P8p2YRk0oFVmLRIPP_BMustD7YhtLOlbm_UCL4MjWX4CI9ng4Scg9w>
 <xmx:P8p2Yf1oVFXtOfhpiAuTk2RGhjpuYrKQpIC2G213YTz332f1a-TqzA>
 <xmx:P8p2YQueZtstKq538mkM6fafVI72W3T_rH1WViNXjPhLHWQ5Kh4W6A>
 <xmx:P8p2YeBlyliW-aoltrz84qC96NVripHt0nlCt3e3gVVK77vIw_EDyg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:16:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, linux-arm-msm@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Tian Tao <tiantao6@hisilicon.com>, Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Xinliang Liu <xinliang.liu@linaro.org>,
 John Stultz <john.stultz@linaro.org>, linux-kernel@vger.kernel.org,
 Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v6 13/21] drm/bridge: sn65dsi83: Fix bridge removal
Date: Mon, 25 Oct 2021 17:15:28 +0200
Message-Id: <20211025151536.1048186-14-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-1-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
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

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Marek Vasut <marex@denx.de>
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

