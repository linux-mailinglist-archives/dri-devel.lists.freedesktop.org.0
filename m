Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 091924069CC
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53026E9D3;
	Fri, 10 Sep 2021 10:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7706E9E3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:14:29 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 60FD42B013F1;
 Fri, 10 Sep 2021 06:14:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 10 Sep 2021 06:14:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=ZV6el4YX6dedj
 o34GTWvzQgjR2wYBy7cKjJm/jNj3xQ=; b=wO+M2W8Mx8twoZJW9pKCl9vsif2IL
 EbeVzaTynLZLq2fuI7wn8AEQAiyavoDZsko0HanD3YQGc45W24e9kuHabJ+Yp8pQ
 GGaXI8ZEE+mzngpDrwl5+WOziP6alFABZoxplG/gc1dTFioSUTkjCjHFNSD5isZL
 Sn7CA0BmtZ6bfV1/IpVONXeEpfNnF2OzNl8zm7+WgCqr1NxATQmv2bVSsLSJst8w
 Ij3NW0DPvxFcn6ZZ4Q1xOGL938g7rYMiwkJoRC2sxj2azpNiXgGOM4Lgzqw8vGhf
 e29JCJQ92HWPf9eHTW9EzsqspSAwOkarBoIlYnncvzCvp39Mny8d/Y+TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ZV6el4YX6dedjo34GTWvzQgjR2wYBy7cKjJm/jNj3xQ=; b=KOSX9aqq
 5Ez9d/Qaf0ZkHwOVqYSp9KAMpj2hUWtFg9MZqw6eZSYB38KyFfBsJSg2Z9t6p3W7
 b1qFShq8K80v9Rq/mh2njqoayB2KEGwrM0bQ5RYxXI1wVQop7cFLMtIj8dlngsme
 dITROKaQLjkAvcyQQKEd07ZPflGk5nt9gC2LnsutqwTzvzKog8BzL0duwhwoO5g9
 BqGk14nyE/PUJSGHRZ5hP3wFnawSAFe54eqgEWCY8T8YIw/48ZhYC4RCmu/STNvc
 2uENyIJFabtcyHG7z2aG8Us9PD5ZR/aLnP/7eENto+SmjzPOmuyPFHzglvXQKd4o
 kSO1gQJydQCKmA==
X-ME-Sender: <xms:AjA7YU2Igt8M4BJVRZrSxf4Z3UI_ZKgXW5qjgenczzK0RuD2f4KP6Q>
 <xme:AjA7YfFS-yXXLPLB9GMR3v-hBiHV1iBE5Db6e9FhQ4IZaJZP37779Dor__4eEQkhC
 AhxfrCjufG99wDRwLI>
X-ME-Received: <xmr:AjA7Yc4uE2Sct2jJkb_UBd6tbA2EyypiYSML_sYVvxYoTXeB0xlEOxXvDFQKVxxRcVab8cv3e5BfCgszKJd0nPC4lmtaAwRn6Opl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:AjA7Yd1tA-cY1ws0MfJM_d2J_0gSJ0Opqt3NdgCn38xDbeYvJOnO1Q>
 <xmx:AjA7YXEZKpuI0bWp2r0Sdsq9Z2QdEiwjDVj3aPPXlb2wx1b2cG7u6Q>
 <xmx:AjA7YW_32tbJqRpkd17cjWpicQTkYqZ5Gqze3rZ3g4Rt5UoaTv42IA>
 <xmx:AjA7YbWHMNpTnsI-Yg9qxEEAoEYwhCCbk5b7GzdW0BDZb4p4M4AtPb8B3bo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:14:26 -0400 (EDT)
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
Subject: [PATCH v4 22/24] drm/bridge: tc358775: Register and attach our DSI
 device at probe
Date: Fri, 10 Sep 2021 12:12:16 +0200
Message-Id: <20210910101218.1632297-23-maxime@cerno.tech>
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
 drivers/gpu/drm/bridge/tc358775.c | 37 +++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 35e66d1b6456..2c76331b251d 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -594,11 +594,26 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
 			    enum drm_bridge_attach_flags flags)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
+
+	/* Attach the panel-bridge to the dsi bridge */
+	return drm_bridge_attach(bridge->encoder, tc->panel_bridge,
+				 &tc->bridge, flags);
+}
+
+static const struct drm_bridge_funcs tc_bridge_funcs = {
+	.attach = tc_bridge_attach,
+	.pre_enable = tc_bridge_pre_enable,
+	.enable = tc_bridge_enable,
+	.mode_valid = tc_mode_valid,
+	.post_disable = tc_bridge_post_disable,
+};
+
+static int tc_attach_host(struct tc_data *tc)
+{
 	struct device *dev = &tc->i2c->dev;
 	struct mipi_dsi_host *host;
 	struct mipi_dsi_device *dsi;
 	int ret;
-
 	const struct mipi_dsi_device_info info = { .type = "tc358775",
 							.channel = 0,
 							.node = NULL,
@@ -628,19 +643,9 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
 		return ret;
 	}
 
-	/* Attach the panel-bridge to the dsi bridge */
-	return drm_bridge_attach(bridge->encoder, tc->panel_bridge,
-				 &tc->bridge, flags);
+	return 0;
 }
 
-static const struct drm_bridge_funcs tc_bridge_funcs = {
-	.attach = tc_bridge_attach,
-	.pre_enable = tc_bridge_pre_enable,
-	.enable = tc_bridge_enable,
-	.mode_valid = tc_mode_valid,
-	.post_disable = tc_bridge_post_disable,
-};
-
 static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
@@ -704,7 +709,15 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	i2c_set_clientdata(client, tc);
 
+	ret = tc_attach_host(tc);
+	if (ret)
+		goto err_bridge_remove;
+
 	return 0;
+
+err_bridge_remove:
+	drm_bridge_remove(&tc->bridge);
+	return ret;
 }
 
 static int tc_remove(struct i2c_client *client)
-- 
2.31.1

