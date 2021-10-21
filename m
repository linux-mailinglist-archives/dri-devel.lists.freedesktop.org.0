Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0154435C04
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53EA6EBED;
	Thu, 21 Oct 2021 07:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A32D6EBED
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:40:51 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 0199D2B0134D;
 Thu, 21 Oct 2021 03:40:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 21 Oct 2021 03:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=yrvr1Otm7mUsB
 ldmX+/88d0Z/Hg66+YUbEVXmQwCzeY=; b=RvTEktepwLYrfRYkxcUXpzO0x1Yhb
 /oKyuSyKSJAclU4ykw+VhDXOMeTKynKMFE1KvsqsrfZj5bXBrzDNykZ21VF4EHRG
 k0IKt5Gr2UKEOO28lJ4HpEaOkYEYiYj1Bo8pB7vxjqoI0AsDVrpTXirQzvDxd6nL
 jQ2X/dxaJnRBKv9v4fTcyABx/NwpBEnzuOj7RS8iB2seW8xxZA/07Qg54pKlLgoQ
 REVsr561bAXHrKapriAZG6Y/ACilNV5UHwWKlYF4QOogOipa8Jus8lA8UOwxr1HI
 hIAZFOc0e5W4ZN2smMCfv9O9F+e5nxxSmuJdUHeN7HQV3TDVhZcxA+phw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=yrvr1Otm7mUsBldmX+/88d0Z/Hg66+YUbEVXmQwCzeY=; b=MYojQJ4q
 YIjJTVKQmV2KCqLZO12YKW/6t8jL4q7ADkp4mBrtY0JAdlk/LgpSCX/notBAugkc
 sNGQyXropLYBUhy2SucRpGES2haN+xW15amGjZFpa3yc/j/soywtv/xQpXJesha0
 AqQjvhRv+sLiyZHB/hHawdbw2aSOHM6cG9i6NWl6byUJlofxag/5Mr92U9PCGLAg
 EsgscbsMgW5Lvf31HknCw8OLatgwZ/05JJL6GRNtTLtgjOmKvJFV5rAqRfujGWHP
 aPKr0xF17+qcBKSOL2FJKoUJGTPJiy4wCuzu24LFgqtQN4qJibHBSZCSRgDra2CF
 /5TlzT1gA9LY3A==
X-ME-Sender: <xms:gBlxYaPGqre-8cf-x4NJVHBRWrcgiDUHU-VLhu5kG9ZMifLsj84wlg>
 <xme:gBlxYY8hZ2L1D1ELMI7qc1ZMMIeyUuOXRrIKnJ3PTzPcjwOzeGnUDUg962h8773Uf
 JiRoBk3PXRUj_rgU_A>
X-ME-Received: <xmr:gBlxYRQcRHdeybL2-xVSX-HTH2Xhm45zy7VT6eZsEmdb6Vwy_csQ8VhXtS8DyL154mUG-qefNbMI0xY02_Ell8wEXTZOtxGoJ4AHSDZJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:gBlxYatYjXgj3jrwdU0guqiDJnxu5XFcgNJNprqYjWHGwqvLjLu_Iw>
 <xmx:gBlxYScnwJWcswtQfRkY-Uc9VxV0_HsU9z1P7HkRPWSz7e5fcVQP6g>
 <xmx:gBlxYe1R2NAtswDgWzlTodVF2QPCU2OEfuj1k1YzdnirFrUqfiSnfg>
 <xmx:gBlxYTP5ktABA_uT264t7DHIat5b5acRIXH7PbbPFCyKuA35jZNZ-ht8im0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:40:48 -0400 (EDT)
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
Subject: [PATCH v5 12/21] drm/bridge: ps8640: Register and attach our DSI
 device at probe
Date: Thu, 21 Oct 2021 09:39:38 +0200
Message-Id: <20211021073947.499373-13-maxime@cerno.tech>
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
 drivers/gpu/drm/bridge/parade-ps8640.c | 100 ++++++++++++++-----------
 1 file changed, 55 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 5ae15fc407c5..5f70eaca175b 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -400,55 +400,10 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
 				enum drm_bridge_attach_flags flags)
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
-	struct device *dev = &ps_bridge->page[0]->dev;
-	struct device_node *in_ep, *dsi_node;
-	struct mipi_dsi_device *dsi;
-	struct mipi_dsi_host *host;
-	int ret;
-	const struct mipi_dsi_device_info info = { .type = "ps8640",
-						   .channel = 0,
-						   .node = NULL,
-						 };
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
 		return -EINVAL;
 
-	/* port@0 is ps8640 dsi input port */
-	in_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
-	if (!in_ep)
-		return -ENODEV;
-
-	dsi_node = of_graph_get_remote_port_parent(in_ep);
-	of_node_put(in_ep);
-	if (!dsi_node)
-		return -ENODEV;
-
-	host = of_find_mipi_dsi_host_by_node(dsi_node);
-	of_node_put(dsi_node);
-	if (!host)
-		return -ENODEV;
-
-	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
-	if (IS_ERR(dsi)) {
-		dev_err(dev, "failed to create dsi device\n");
-		ret = PTR_ERR(dsi);
-		return ret;
-	}
-
-	ps_bridge->dsi = dsi;
-
-	dsi->host = host;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
-			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
-	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->lanes = NUM_MIPI_LANES;
-
-	ret = devm_mipi_dsi_attach(dev, dsi);
-	if (ret) {
-		dev_err(dev, "failed to attach dsi device: %d\n", ret);
-		return ret;
-	}
-
 	ret = drm_dp_aux_register(&ps_bridge->aux);
 	if (ret) {
 		dev_err(dev, "failed to register DP AUX channel: %d\n", ret);
@@ -507,6 +462,53 @@ static const struct drm_bridge_funcs ps8640_bridge_funcs = {
 	.pre_enable = ps8640_pre_enable,
 };
 
+static int ps8640_bridge_host_attach(struct device *dev, struct ps8640 *ps_bridge)
+{
+	struct device_node *in_ep, *dsi_node;
+	struct mipi_dsi_device *dsi;
+	struct mipi_dsi_host *host;
+	int ret;
+	const struct mipi_dsi_device_info info = { .type = "ps8640",
+						   .channel = 0,
+						   .node = NULL,
+						 };
+
+	/* port@0 is ps8640 dsi input port */
+	in_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
+	if (!in_ep)
+		return -ENODEV;
+
+	dsi_node = of_graph_get_remote_port_parent(in_ep);
+	of_node_put(in_ep);
+	if (!dsi_node)
+		return -ENODEV;
+
+	host = of_find_mipi_dsi_host_by_node(dsi_node);
+	of_node_put(dsi_node);
+	if (!host)
+		return -EPROBE_DEFER;
+
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
+	if (IS_ERR(dsi)) {
+		dev_err(dev, "failed to create dsi device\n");
+		return PTR_ERR(dsi);
+	}
+
+	ps_bridge->dsi = dsi;
+
+	dsi->host = host;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
+			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->lanes = NUM_MIPI_LANES;
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int ps8640_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -584,7 +586,15 @@ static int ps8640_probe(struct i2c_client *client)
 
 	drm_bridge_add(&ps_bridge->bridge);
 
+	ret = ps8640_bridge_host_attach(dev, ps_bridge);
+	if (ret)
+		goto err_bridge_remove;
+
 	return 0;
+
+err_bridge_remove:
+	drm_bridge_remove(&ps_bridge->bridge);
+	return ret;
 }
 
 static int ps8640_remove(struct i2c_client *client)
-- 
2.31.1

