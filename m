Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD52439A2D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092616E15C;
	Mon, 25 Oct 2021 15:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3847B6E131;
 Mon, 25 Oct 2021 15:16:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6F1075806CA;
 Mon, 25 Oct 2021 11:16:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 25 Oct 2021 11:16:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=TnAZqTSQxUIP5
 JiuZiFJ75+OX+YvdvRPsxfEzIZePQM=; b=luQieLBrOannjAcxQ7qKis28/g9Fv
 UpQFPzubFSDjXh9EjZprclsSgVOCP3Ro9HFw4XvBmdISLSWq439/HNyvh93H2Fti
 XWcStmzTPGmZjejmX2sehe7YIrvj94tKt+VbvI1sMMA+qbRgxralxzeAVwdZbtP/
 GwfjUzGKLFevGMKaVLZuqLWCh5Gm6wqGWc9yw8pcPB4nHjYqK5K+FCCHz3nAa40Y
 U1nzbRj0wlLnY8gQLMpt+OGTtGiZLrp6OYC2BZaYmPkaUiEWtjLdKRfkzdyXvnf6
 PeWGPGoEKUwGqDFmc6fl8068lEhbgZKcl7M/B7xvrDHwe/Y62/l7azP9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=TnAZqTSQxUIP5JiuZiFJ75+OX+YvdvRPsxfEzIZePQM=; b=IKnBasUo
 0l6xcNQYpZhHLCUgGAjyfk+aSezziqOcjhx+UWw/Q/YdyWfqcqDOzepbnuTqGsdX
 vwVvKHXOWSgIFDE8RA/GSp4N98foM9FgbaDrxLZeVGeTkkFEz9QWTVNtoYpm8giX
 8m8sOcEcBlZMHY2slRIFyYSOwexrF0vnJ7pmwSw0vSHRszdCeYzPfMIEAcw624pp
 O5e9r/x92aTsu3O5WJs55guOZP0FPmYlvu08wzDfR8hDxeW0cgCq8W9qMIHdMeGw
 EytJFFkQ1gXHI1fc6tVdzpUMryLcZ2MV5yqnhFv/38fBAulRsGWSK8KsTfeph+uu
 4G2qO1z4UXtv8Q==
X-ME-Sender: <xms:Tcp2YY6JoUyAmWTRuWuBuLCRy6IFpE_Hys3SUskmt8EEN-vtdYIlZw>
 <xme:Tcp2YZ5BO_2MV6xBJabxn9zhrAsMNygCxskrdvpcyrDg_-fyq06CM4KfuGLn-deT7
 oZ1Z6T1h0vYI488OEg>
X-ME-Received: <xmr:Tcp2YXc8N4gyuc9VqUj6FF1HGMh9W-gEp0fRQsbhkVVPYTCsJPVETTYeRgTdKlCFH7R2p3yk0IiIgEEAp7ZP1sahpnvZSNLbe0exfa_o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Tcp2YdIUb9Q01nAJzY-HfGkPJ61VgoD65I-gWVVJ0r_m4o1wgUuRMg>
 <xmx:Tcp2YcJN3Mm-F9iqiRTVzysj7dzK0CuWbgl1lxqAz6iFLpHgmNXeJg>
 <xmx:Tcp2YewDaEzKcUdqX7PcNC-IwPeZJUvXDf-9ZayG1oi6V0wTiXgtxQ>
 <xmx:Tsp2YbKW9kzs82ek_d7Fa7ZMqaOeBgf9YHo0NXr_NPhrlUGYXJYjmA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:16:28 -0400 (EDT)
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
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Subject: [PATCH v6 19/21] drm/bridge: tc358775: Register and attach our DSI
 device at probe
Date: Mon, 25 Oct 2021 17:15:34 +0200
Message-Id: <20211025151536.1048186-20-maxime@cerno.tech>
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

In order to avoid any probe ordering issue, the best practice is to move
the secondary MIPI-DSI device registration and attachment to the
MIPI-DSI host at probe time. Let's do this.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
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

