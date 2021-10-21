Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF375435BF9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057C96EBB5;
	Thu, 21 Oct 2021 07:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57D66EBB5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:40:33 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 589AE2B01331;
 Thu, 21 Oct 2021 03:40:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 21 Oct 2021 03:40:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=pwgSELP5dT/2C
 DHLV12oEtfj6zG5D1L9hu7xC1kNBUc=; b=JlndOIGl5tAZyOkLZVC7uZYmUUTjk
 w70qe2S1XP5lcth0o9h99EerQiC+l9eWWSPkRskuovBjyAkDn0CT0dWx2Nvr5fiL
 h/2UmyRX8jM3p/6PzOLRkabJaPEpqXFmDRvz98nVTZa1jVUMaccx4d+TvrvMX2Ig
 rLoAxhidRFAJMDCUgEaXnPth45gLBzpzHFiSbccWmY1l3pqtPIQXlDUKyH0+DAuC
 chX86yU5NpAswDtx1bn5lU0fXdF0KtnsAXaUSQVou6vLK6RiiaBomap9xwU19VAp
 teO7LzVANWCYGpKqAi+XmC51O6RPl7vcNnJBHkfG9e1Mdrm7t7XaYPC2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=pwgSELP5dT/2CDHLV12oEtfj6zG5D1L9hu7xC1kNBUc=; b=TUFxoRW/
 1+jxNvo+HlikdlI+Buxz84FeX1jzBlkJLvF9NHpvyGzSgdV2vHiIFY65PESNuPCG
 sZW8SmScvzYkssZYoGJ4qYVV/Q2mNavfLMzVQcqy9ZjBDgxq5cjDzROc7xIKjiq/
 E2fbuLLUoTuYXb+zYMIC7gmJzO5Lg01po568uLjVcN2fkt/IPvWz64q4IZ0D7mBm
 KTe52TbAtj90J8tg6B51n48SHO3vlfmm/JYJLqElh+S1ZEvtcJrWOMfMnRJ5woWx
 Dl8NQ0lIpmjBO+NuQkvop7jiHGWsBghzQJcn6qYAgj4yQRRELQWgXhnqhHAkZxnC
 DfAicfqG388HjQ==
X-ME-Sender: <xms:bhlxYVj2k0GdQVDeY2Tph74rF89YKAWH_Iz4R0X8a9IcYXmLEEfymQ>
 <xme:bhlxYaAPaYxJfDmH4TcpeSAqM1CLjoibFXIQ79_czU-Tg1DDFxFKZJ7rXhpV9OQ9a
 FzYCdeFCxUOROJyeNY>
X-ME-Received: <xmr:bhlxYVG_pUsPy02qLgKvL-lPJ7gnXRRDZNa9F6F7txx0axSQ_lv-Q6yaTjiQjmMCmpcw0Kcn5zGd1U9nfCjd03tu6WJh1WI7cGDIr2t5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bhlxYaSnBAGJ0eb880FJroLzo0exFLtqL1fwvPrMEZsCMJffsmWLQQ>
 <xmx:bhlxYSx9DJ10MD58Kqq3PLdDulRc5q6TvFSa2WH5y6JtmsxVCvMovg>
 <xmx:bhlxYQ5wPSTvzwtk0RlH1Lu-CAcH_8T-rMcnKMkTHrsqZrZEqW5MWw>
 <xmx:bhlxYdS7bqtwttd5E28KJH8y0ZqirZXE9N5E0PcgbJDWN_IFIVu3Hu4amkY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:40:30 -0400 (EDT)
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
Subject: [PATCH v5 08/21] drm/bridge: lt9611: Register and attach our DSI
 device at probe
Date: Thu, 21 Oct 2021 09:39:34 +0200
Message-Id: <20211021073947.499373-9-maxime@cerno.tech>
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
Tested-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 38 ++++++++++++-------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 654131aca5ed..d2f45a0f79c8 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -825,26 +825,7 @@ static int lt9611_bridge_attach(struct drm_bridge *bridge,
 			return ret;
 	}
 
-	/* Attach primary DSI */
-	lt9611->dsi0 = lt9611_attach_dsi(lt9611, lt9611->dsi0_node);
-	if (IS_ERR(lt9611->dsi0))
-		return PTR_ERR(lt9611->dsi0);
-
-	/* Attach secondary DSI, if specified */
-	if (lt9611->dsi1_node) {
-		lt9611->dsi1 = lt9611_attach_dsi(lt9611, lt9611->dsi1_node);
-		if (IS_ERR(lt9611->dsi1)) {
-			ret = PTR_ERR(lt9611->dsi1);
-			goto err_unregister_dsi0;
-		}
-	}
-
 	return 0;
-
-err_unregister_dsi0:
-	drm_connector_cleanup(&lt9611->connector);
-
-	return ret;
 }
 
 static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
@@ -1165,10 +1146,29 @@ static int lt9611_probe(struct i2c_client *client,
 
 	drm_bridge_add(&lt9611->bridge);
 
+	/* Attach primary DSI */
+	lt9611->dsi0 = lt9611_attach_dsi(lt9611, lt9611->dsi0_node);
+	if (IS_ERR(lt9611->dsi0)) {
+		ret = PTR_ERR(lt9611->dsi0);
+		goto err_remove_bridge;
+	}
+
+	/* Attach secondary DSI, if specified */
+	if (lt9611->dsi1_node) {
+		lt9611->dsi1 = lt9611_attach_dsi(lt9611, lt9611->dsi1_node);
+		if (IS_ERR(lt9611->dsi1)) {
+			ret = PTR_ERR(lt9611->dsi1);
+			goto err_remove_bridge;
+		}
+	}
+
 	lt9611_enable_hpd_interrupts(lt9611);
 
 	return lt9611_audio_init(dev, lt9611);
 
+err_remove_bridge:
+	drm_bridge_remove(&lt9611->bridge);
+
 err_disable_regulators:
 	regulator_bulk_disable(ARRAY_SIZE(lt9611->supplies), lt9611->supplies);
 
-- 
2.31.1

