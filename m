Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD911435C08
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CB36EC0A;
	Thu, 21 Oct 2021 07:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EDD6EC0A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:41:08 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id D4BDE2B01362;
 Thu, 21 Oct 2021 03:41:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 21 Oct 2021 03:41:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=R42zJVFPqXWis
 ftwmhRtrrTmMiiujU+L/s0xKJb/r2o=; b=Ve5FuXreqcW5s8yaQ57TY8cqWF0Mn
 X7rVMHZlmysTlXXYtuLF2bKCB1SMfBUkayHBhetIFmBTtzC34FPmujgmzzzW7N7C
 9saPIQ/28xVQN7DDK/EZ0UzNoF0em2JYW+tRVqaN1iPnCOi0HXek8jPzMHpjQEfH
 CSvuIjUv8lrNRmTm+B5k2hluHQ8UtA1XZByjxohS2Fsyth245LxqcDjUjfI4b6x5
 AzRzm+MbkiSX5IljAFZNYB1sgp1DDDP1g2+7tZM41f8KY3hkvkkb3ccBtrh7sptC
 W4DIMh25bLsbGL8v/olDfxQpOH9ltvvw/eLiQAKXWMOCdF1087dFNVRuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=R42zJVFPqXWisftwmhRtrrTmMiiujU+L/s0xKJb/r2o=; b=bbPguaPW
 hWfirR9U1m+UYX5PsZLYsUt262l+CTFntR+ytG9PLhle7+tr7JZI227bZ+mNNV5J
 Urz+QKUUOPdgVTDwTPbIhPtsczYlpLg7en92Edxfm9zOtbRC8vF6mlSdelSjeUwN
 TrPexa91VU9fSQ6QfuLTrjCMC7Erf8tDFzAPyOzI8Aaopkc34szK3yxgUZII2rWY
 LGotj6Z0pH2lstrkiFtzBoiy24mlSB4qxB5RPl4Dx9AFcz0R3qzX863ik4LAyEnX
 xXLwLxS6GBt31dDTy8skjll7y0H6BZD9JtCXyeDzapvwrNmfHa40FcxNvitqRJKq
 XzELclE/IbKh2A==
X-ME-Sender: <xms:khlxYf3Ge1Kewe-WifgCy63cLkxnom7vdRP7ZpqGDI73g-yWTRHeZg>
 <xme:khlxYeEjrXKsQuLdsezWl4ADRKKN6Xb4SI62p58U-4T3-CDMXDWpSS0HRXW8J_M6b
 XpqRUVDiI8GcD7m2Mc>
X-ME-Received: <xmr:khlxYf7EwIpx-SdAWUpkP2p0nXt5e_vc37YLAFJCYdibiJiQcqgVK7V9WGZDdsP1KkaaIUp1xldiuQNcfvAQ9_BaZz6-8GsaGGsU08G7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:khlxYU2AG2iq5Ny-Gc0fGOzmA6zHM4Jf-8U36goZabNaiVzBfDIGgQ>
 <xmx:khlxYSGTOlIKerQwkpBSRKHHPoUY62b8BRZ4TViGw-Ak-d3wTNt8ew>
 <xmx:khlxYV_ncmRZZRMAMr_JVHVNTkd0Eqm1os09KymZFhtODbpv1KmIUg>
 <xmx:khlxYaUvr5MH5Oy3-QL6g3H5z3xsCtDdEG3ywUTOhFsUHxFGeE1mqIIehls>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:41:05 -0400 (EDT)
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
Subject: [PATCH v5 16/21] drm/bridge: sn65dsi86: Switch to devm MIPI-DSI
 helpers
Date: Thu, 21 Oct 2021 09:39:42 +0200
Message-Id: <20211021073947.499373-17-maxime@cerno.tech>
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

Let's switch to the new devm MIPI-DSI function to register and attach
our secondary device. This also avoids leaking the device when we detach
the bridge.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 6154bed0af5b..36a82e3d17ab 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -662,6 +662,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	struct mipi_dsi_host *host;
 	struct mipi_dsi_device *dsi;
+	struct device *dev = pdata->dev;
 	const struct mipi_dsi_device_info info = { .type = "ti_sn_bridge",
 						   .channel = 0,
 						   .node = NULL,
@@ -701,7 +702,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		goto err_dsi_host;
 	}
 
-	dsi = mipi_dsi_device_register_full(host, &info);
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		DRM_ERROR("failed to create dsi device\n");
 		ret = PTR_ERR(dsi);
@@ -714,16 +715,16 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
 
 	/* check if continuous dsi clock is required or not */
-	pm_runtime_get_sync(pdata->dev);
+	pm_runtime_get_sync(dev);
 	regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
-	pm_runtime_put_autosuspend(pdata->dev);
+	pm_runtime_put_autosuspend(dev);
 	if (!(val & DPPLL_CLK_SRC_DSICLK))
 		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
 		DRM_ERROR("failed to attach dsi to host\n");
-		goto err_dsi_attach;
+		goto err_dsi_host;
 	}
 	pdata->dsi = dsi;
 
@@ -734,14 +735,10 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
 				&pdata->bridge, flags);
 	if (ret < 0)
-		goto err_dsi_detach;
+		goto err_dsi_host;
 
 	return 0;
 
-err_dsi_detach:
-	mipi_dsi_detach(dsi);
-err_dsi_attach:
-	mipi_dsi_device_unregister(dsi);
 err_dsi_host:
 	drm_connector_cleanup(&pdata->connector);
 err_conn_init:
@@ -1237,11 +1234,6 @@ static void ti_sn_bridge_remove(struct auxiliary_device *adev)
 	if (!pdata)
 		return;
 
-	if (pdata->dsi) {
-		mipi_dsi_detach(pdata->dsi);
-		mipi_dsi_device_unregister(pdata->dsi);
-	}
-
 	drm_bridge_remove(&pdata->bridge);
 
 	of_node_put(pdata->host_node);
-- 
2.31.1

