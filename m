Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D68C64069BD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738616E9C8;
	Fri, 10 Sep 2021 10:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2E26E9C8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:13:47 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id A4ED42B013E1;
 Fri, 10 Sep 2021 06:13:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 10 Sep 2021 06:13:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=NN3eBrtri6Inn
 2bzE3OGtV8ML/5ceQ1O31aiU9aFohA=; b=Z88z88SED5vFpCDjnObQErA0pyWmg
 wLXICelTOpGbHutyUeqSQUSMebOupABh4WQq+OnVTiFKW2Au2Mv2KnaozZquxfoT
 vByU7gKGKsioZGQOmO4AqSONRI5rIuANJ0juqIAK9joP5A/uyKqHE/iZGK8HuBVn
 TgmFqpeJYob6je4Ou+N29tQrHl+ppGNrD99PULei4zbRY5jLonfVgD5CDbLBIG0v
 ARZ+Gw+hNba8ixXnd6xIeRUNyMPovWYTFY088hriyYB8llgcOtFyGeTBlojcDDOl
 FcSuQwG40ZKLvnDl1VLvCmfgLPUo4SNKNfsB59nsH9LWFJ/194zKt2IAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=NN3eBrtri6Inn2bzE3OGtV8ML/5ceQ1O31aiU9aFohA=; b=tDC/wOId
 MfzkQdPc5bAj4JzMbe7XLUKfyq/lzxcEklfmhCvnSunwBPqjVuFMSLnLBMan8Lsy
 gGVrGAnDiKmVV5zDES/yFBEocTbgtdhLBnpDzqqYsKmnXs1CTZSpmWdBZymmfGTc
 qJJY3dPpNt4GzA2u2bBqvNEL7IBmAQBo8nrPc6iiwBL2Oywf1eW7wirTlR4DMRvZ
 epcnettFPXDFCFR01TubsOIHhf9cgoyim3WoBQHCmTLWron48dTQgixcjmXXkKYf
 pkcUEKJ4e6zeeyTyqiqQwarGErQJc6PTqzgmVymCAxDdW2OJmhFdbZdnJNKINt6S
 1x/Fkb/84gPgbQ==
X-ME-Sender: <xms:2C87YSBEKBrLsbWsh83TVwUCal4aWAMnhb7LJ-3pUxUWNgdEl9ZUEQ>
 <xme:2C87YcjdzyUkQsWC8XkUdAsZdFbYLSb6VGwG9A9PWiU_rl8PufV223nz2yOObSJEI
 FD-wWWipiY-aeRviPU>
X-ME-Received: <xmr:2C87YVl2g7YBKQP8asOpbB-htWhVVDqgCyUMQVPdnL7xDXw8JEnGZZqCV2nQ-V04Y2tnHAJownChPnfmjGmoonUIbEjcxWNC_gk5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2C87YQzGPF9-QSr9wiUXmbXqzDZZeJV4cnPkNh6jDlXMR_7rWj1Ssg>
 <xmx:2C87YXTfIl4ET6vhBfPEOFPaNjd1E5aN9e1v4n7uu4qPb1deVMrQng>
 <xmx:2C87Ybb4cYHBX7k-zgleyf2XldkGfgSw-dN9-XbBKZl2DI-91WTNrg>
 <xmx:2C87YXy4HNE8mb59ma9DhmSV0-tFXl1cvjvj9MQfTvHOvj28EdxzvsmKXJM>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:13:43 -0400 (EDT)
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
Subject: [PATCH v4 14/24] drm/bridge: lt9611uxc: Register and attach our DSI
 device at probe
Date: Fri, 10 Sep 2021 12:12:08 +0200
Message-Id: <20210910101218.1632297-15-maxime@cerno.tech>
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
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 31 +++++++++++++---------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index e5083bdf4c89..78c4175e0a12 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -364,18 +364,6 @@ static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
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
 
@@ -955,8 +943,27 @@ static int lt9611uxc_probe(struct i2c_client *client,
 
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

