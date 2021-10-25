Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 022854399F4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8746E0C4;
	Mon, 25 Oct 2021 15:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94546E0AC;
 Mon, 25 Oct 2021 15:15:57 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1FE405806AA;
 Mon, 25 Oct 2021 11:15:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 25 Oct 2021 11:15:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=l+O22JDiqkqJM
 EtaGeqIDet4bD6VhA1ltwhW7Yd/nGM=; b=W7o0dR7XerMvD0oBoW20UGGbQaSc6
 HFl0q0Jo4zRjKew7usfbbH0990yX/LSDeJSzCBTAc+BWFyFjVy2CQnsxd2vk1Lok
 P6kUZwtWlulg3/fubQV8QL/CulTDQLA7apVwfpM/JPNY/Z5vR14kDPvJHcByjF2L
 EvfdluN7IcKUrCIYS4je3dxtQWB4jHXkWiepldBIhism9/a0osHc7Mh4ElbkZdR1
 MR0NXINqeuwDPe6COGHozAKU6LUwGrPsFxR0fl7X112Nl2RwIKb+XQ41IZqDM+i1
 Gt1UX/FHIcDOLFHmaSPZfsThU6ShHZMa+4mLARwcZ74DB3biw5kw/Iz2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=l+O22JDiqkqJMEtaGeqIDet4bD6VhA1ltwhW7Yd/nGM=; b=lcgr9+80
 zKKTr2puSm89L82xl5V/rk7Ju44KTR3jhR1ywBqteJoiGDt+tiVZsMlg8sbt19U0
 3R2CE5KM+Jnj+5mB298g6WcRnb43wupPLivWSfbmHQUP8E0UoDNxjRVXf6kzfDup
 LMfxf6AfN63Of3+FOv240GcYWOWpoF+z8KCLQiDsR0ZMRA7hl+OT08kYMhV0yeXr
 TS9fSa5SHMrImnTyod4NEOV/HdceUJEGbO/+4N9apmqkfjEZHgXaiSiDsNxrTER3
 D0DxN50yUCsfktNFKbgenwlLnMkQTNK7y9xLOEMiKNhbdJQFU/yVgsDGp353g798
 /UaSO3lkONXp6w==
X-ME-Sender: <xms:LMp2YQFNHB8kyPkBg9kYh_ARjoxX8BK4SYbGT1gWIkCwOpOS99jiTg>
 <xme:LMp2YZXLHc9LHtFDe-1wMtNnY0-jgNl5cyr1wJ1GC4hV_8m2igcwjVEZvTWSq7aVq
 HGsFcdEevjPLUh4M2Y>
X-ME-Received: <xmr:LMp2YaLkU89E52Jd_6nuk0NlOArlFT66RzqOQhW60wUIYPnbsJOoOkrQE9YK_q1OieoIX3aQr04Yrf9WQsdSmKJrZKGAe6iZD4-gMAZD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Lcp2YSFRXSxhZSsgUrSnscWY9tXSAikpe3H_CVUhDFcNKJ7zcuNDVQ>
 <xmx:Lcp2YWX1Tl8QrOf4bG-ukXCk0iHB1zFfQhP-5RUzrDRoqI3bTMV-Ng>
 <xmx:Lcp2YVPWGdVvRbG7qGztIq7Kqsp7QEx3UghNv7r3fykcgGR1RqtUXw>
 <xmx:Lcp2YZmoXCIMEHCrdfanuyEPu_5610zcegLxhA4BRUnjmXrAawLo1Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:15:56 -0400 (EDT)
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
Subject: [PATCH v6 05/21] drm/bridge: lt8912b: Switch to devm MIPI-DSI helpers
Date: Mon, 25 Oct 2021 17:15:20 +0200
Message-Id: <20211025151536.1048186-6-maxime@cerno.tech>
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

Let's switch to the new devm MIPI-DSI function to register and attach
our secondary device.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 1b0c7eaf6c84..cc968d65936b 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -472,11 +472,11 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 		return -EPROBE_DEFER;
 	}
 
-	dsi = mipi_dsi_device_register_full(host, &info);
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		ret = PTR_ERR(dsi);
 		dev_err(dev, "failed to create dsi device (%d)\n", ret);
-		goto err_dsi_device;
+		return ret;
 	}
 
 	lt->dsi = dsi;
@@ -489,24 +489,13 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 			  MIPI_DSI_MODE_LPM |
 			  MIPI_DSI_MODE_NO_EOT_PACKET;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "failed to attach dsi to host\n");
-		goto err_dsi_attach;
+		return ret;
 	}
 
 	return 0;
-
-err_dsi_attach:
-	mipi_dsi_device_unregister(dsi);
-err_dsi_device:
-	return ret;
-}
-
-static void lt8912_detach_dsi(struct lt8912 *lt)
-{
-	mipi_dsi_detach(lt->dsi);
-	mipi_dsi_device_unregister(lt->dsi);
 }
 
 static int lt8912_bridge_connector_init(struct drm_bridge *bridge)
@@ -573,7 +562,6 @@ static void lt8912_bridge_detach(struct drm_bridge *bridge)
 	struct lt8912 *lt = bridge_to_lt8912(bridge);
 
 	if (lt->is_attached) {
-		lt8912_detach_dsi(lt);
 		lt8912_hard_power_off(lt);
 		drm_connector_unregister(&lt->connector);
 		drm_connector_cleanup(&lt->connector);
-- 
2.31.1

