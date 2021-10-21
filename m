Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BB8435C0B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3496EC19;
	Thu, 21 Oct 2021 07:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04226EC16
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:41:22 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id C7ACA2B00466;
 Thu, 21 Oct 2021 03:41:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 21 Oct 2021 03:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=TnAZqTSQxUIP5
 JiuZiFJ75+OX+YvdvRPsxfEzIZePQM=; b=UDEuMd1k1lFvWpdAnoIo2Oma49cec
 50Ur1Q0HhQIZrPwHDcSJo4avmRdbxDRHDsQ1C1uLhapBB1r2j6+91SO2OlGZ1M1x
 zrDW0kgb7U23AnRuBkqSi6wHfAgW/b3HLEwMRiJRN5IWm81tPgf0benMnTCECrXo
 CDnTHjPAsvbFf0uZU31HkIUtyu5XYL1ZF8BwBeysSPQGdFtNgMUABYxDibSZAI4y
 8f3ebt7XTuDfnq7s4CbG0eQXoLPof7+JVoWqpaiAi/zV+40sw2l+TkoJV72oV1GL
 KgFK+RuWoCjgDXYsM3E/0QkxYHBbHACykGa5jflkjPFjyib4AMgzULTVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=TnAZqTSQxUIP5JiuZiFJ75+OX+YvdvRPsxfEzIZePQM=; b=hWjlK+rA
 LlSoqppAi0AZ78MjBK43ID/WIcrE5dKmcKsk861kqnr+OWcSdPib8Jj0hOoV2e1/
 aPdZmBQ1M1kwB+w4lF1hUkB9oFj1NJsUMWV8n2upx2vMJfg50tIauEyITgPbz8d3
 G7FinYJHmDKlNK54HVW1aMmcAPmRB2pLy6ij0mvHD+IGRfXv367nZFg34yNUhbL4
 /d14sBJVhKgdAIqF4GS0ykLZ7yqHc0f/cL1+hX07AC1rJGjE71LUetAXq6HU2Mgf
 2KQrd6jutxS1agUAO67Lm0Jhfu91gB8In0XSABkz1dicGyowPOqXz+OGn29Mxi4Z
 hAX2mGRDbyp6+A==
X-ME-Sender: <xms:oBlxYfEZpZhgYEHqlzxflYCOF2Td7WNiXuNqlMQ0GmMldku1VdPQPA>
 <xme:oBlxYcWtvINUZx-wFOLQ5tWQ9gf5D6tc7COBb3pKOge_506fQFGxa93p35yJBmmG9
 9Bp1zi9t8b70eqSdtc>
X-ME-Received: <xmr:oBlxYRJTcZo4RYYS2c5Mp1IVy6cbT4Xy5G-qJHscUfvgEnrjs_Hf6sUNZzgPCM9MZyizcnxnnjk0jWa0wTiRTYLbowax3cdQV_DSLuGH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oBlxYdH2XQhOqmuwimrF6XYJP0RgeHbZDauQs5M9JDEAiJfZq7wFDw>
 <xmx:oBlxYVWhsf5EWDEhN2sK-aVAqnpnrfaZ2B5onWr9U9F0QgSDOINdlA>
 <xmx:oBlxYYOr1vkyMbrSVI9rC-FdvXLcdMzODMfNoUUacP8JZh2pa-v3BQ>
 <xmx:oBlxYcnVm6O1egrK8g7tsI8dzDJ5cXGXbJOldG_x4kun7FlZPUhczKo9l4g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:41:19 -0400 (EDT)
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
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 19/21] drm/bridge: tc358775: Register and attach our DSI
 device at probe
Date: Thu, 21 Oct 2021 09:39:45 +0200
Message-Id: <20211021073947.499373-20-maxime@cerno.tech>
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

