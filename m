Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E09E3439A0A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EE36E0F6;
	Mon, 25 Oct 2021 15:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2478F6E0CD;
 Mon, 25 Oct 2021 15:16:09 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 571335806B7;
 Mon, 25 Oct 2021 11:16:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 25 Oct 2021 11:16:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=V2ECKODejaAuL
 jYVZGAyrUq9Ivh4nxZakGL2AQusnM8=; b=iQwtMgUxVM82/+GyHreEhxdErqjl/
 upjI0Di4OBRjxPJ0KSbxT1M3E81yneDyJAXXpkHK/5Xb2pTAPbbktqOS6pcTHD1A
 sH7EzKAx/nDjO4BuiBROWdTjl4kiTPDGu5HsYOGS7xk2r6pJhmdphLJZLbeI3qzJ
 T4vlCSAil1YnBk8WJsqU+BKVesOVUjSOrZQT3TN4lNg1G+D3wBMnzVVjMDdhimxV
 XgwW1fe4jm3n620pFrQbkXN+eQN28ma4cm0B77a/3FDzJIVP2iHnDv1DcUwn8Eit
 A2OhaBD7370FLWxIlCDfoUi7Ht58hIv/Bd/8vC18PGoVJyZWsb/TsJQPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=V2ECKODejaAuLjYVZGAyrUq9Ivh4nxZakGL2AQusnM8=; b=NbXmj21w
 ayC7OzYZn7o4LiM0p1H+Z9XIfXQyXbm8eNH53Be1F6F2LkVcFE8g7ue0+2f5iYPs
 zPenXRC0NADUZK6KfFqB6iEvjiKHfaLGcAKhPqkwQ4dDFMobt/JVqNP6rR0EzDAk
 DuBcu8KtaWBrtR//Ipsw20CAz1p453FxMellu9QUfSEVLwI/jgJ2o57R9UTHjaFz
 56YgWgkfQgPd3ykm10BULrKpYhcWETMQMVpm+OAwsLD+2otwm8ZqVrw0H/w64Y1j
 hcDnxVStak8tBEoyoKlmlVahRrgtmI9uXfADC7cyntsdkHb9+cZJYCltUU55Y0PM
 EPI189xcJ+VvqA==
X-ME-Sender: <xms:OMp2Ye0QiINg8n4f_AHmnsZ5OR3w9mc0Uov0LUHNk1LDLaG_x1gctg>
 <xme:OMp2YRE_lqg8pUDrSRy4j_qidhfs03yh2yijtxE-48nS9af0dPG9MnZrRYxSfy5Qe
 wZEpoHwOUzHgOFFZ44>
X-ME-Received: <xmr:OMp2YW54rp1g5AZXf-A8zqUiEsZiawbE25u8mCNabIZ1GVetGPTTrzd_lY7Yk2oJ9j5ZTD63VqRF85F2F9D4RnD9OuLD8nsWr4qcNwHH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:OMp2Yf2Gx5HI-r_sr9m6_cG4FwcuEFeWSnGPHeBWPAKRwsKb7O53ew>
 <xmx:OMp2YRGMu2hjooX5cElExH3H58Vk-J3C4VgxngqKv6l2T4Uq0WBwpA>
 <xmx:OMp2YY-FRHafMvJJc0wA9cbWrDeQLPnGxcm4YE-0RhfaVu23DudDCg>
 <xmx:OMp2YdWlG0HjDPZhLICV-k9jW79kk3O3HK1MpFjTnQPQFPrfDTU91A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:16:07 -0400 (EDT)
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
Subject: [PATCH v6 10/21] drm/bridge: lt9611uxc: Register and attach our DSI
 device at probe
Date: Mon, 25 Oct 2021 17:15:25 +0200
Message-Id: <20211025151536.1048186-11-maxime@cerno.tech>
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
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 31 +++++++++++++---------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index ab1a0c00aad8..33f9716da0ee 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -367,18 +367,6 @@ static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
 			return ret;
 	}
 
-	/* Attach primary DSI */
-	lt9611uxc->dsi0 = lt9611uxc_attach_dsi(lt9611uxc, lt9611uxc->dsi0_node);
-	if (IS_ERR(lt9611uxc->dsi0))
-		return PTR_ERR(lt9611uxc->dsi0);
-
-	/* Attach secondary DSI, if specified */
-	if (lt9611uxc->dsi1_node) {
-		lt9611uxc->dsi1 = lt9611uxc_attach_dsi(lt9611uxc, lt9611uxc->dsi1_node);
-		if (IS_ERR(lt9611uxc->dsi1))
-			return PTR_ERR(lt9611uxc->dsi1);
-	}
-
 	return 0;
 }
 
@@ -958,8 +946,27 @@ static int lt9611uxc_probe(struct i2c_client *client,
 
 	drm_bridge_add(&lt9611uxc->bridge);
 
+	/* Attach primary DSI */
+	lt9611uxc->dsi0 = lt9611uxc_attach_dsi(lt9611uxc, lt9611uxc->dsi0_node);
+	if (IS_ERR(lt9611uxc->dsi0)) {
+		ret = PTR_ERR(lt9611uxc->dsi0);
+		goto err_remove_bridge;
+	}
+
+	/* Attach secondary DSI, if specified */
+	if (lt9611uxc->dsi1_node) {
+		lt9611uxc->dsi1 = lt9611uxc_attach_dsi(lt9611uxc, lt9611uxc->dsi1_node);
+		if (IS_ERR(lt9611uxc->dsi1)) {
+			ret = PTR_ERR(lt9611uxc->dsi1);
+			goto err_remove_bridge;
+		}
+	}
+
 	return lt9611uxc_audio_init(dev, lt9611uxc);
 
+err_remove_bridge:
+	drm_bridge_remove(&lt9611uxc->bridge);
+
 err_disable_regulators:
 	regulator_bulk_disable(ARRAY_SIZE(lt9611uxc->supplies), lt9611uxc->supplies);
 
-- 
2.31.1

