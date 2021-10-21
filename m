Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A67435BF5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CE46EBA0;
	Thu, 21 Oct 2021 07:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD8A6EBA0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:40:20 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 066E02B0130E;
 Thu, 21 Oct 2021 03:40:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 21 Oct 2021 03:40:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=l+O22JDiqkqJM
 EtaGeqIDet4bD6VhA1ltwhW7Yd/nGM=; b=MvCKg0zoZmQWIofgJY+5SG7pqi3NB
 ei5Iu+F6jCd48HZh81CVZfRXUKwkB3avnEIqBuaqRZVSzig+OoKW/ih0whOuqVNP
 +HR1lPXKAlVP6LxBc2RBTXisk6k+j95nxDuexTPFFP1ulWvWWaRz3PxhFKka3iVF
 EbPKp9yxH+tExTymDFfR0qnop5aP6b3wUFT0+YiBNSqO5+I59lKhKhloZF8Z/dGY
 p4vD5RTnKbKQd/Dm84Nkroa3S8CHKwgJnwpXHw+gE7TZEuTIdduOagGpJWH90xHz
 AoUESWF2bZdvsJ6F7/bs98ZLZ51yk3pMzLnsxvX7eReU5BolJurRj9HSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=l+O22JDiqkqJMEtaGeqIDet4bD6VhA1ltwhW7Yd/nGM=; b=MgheI22t
 5ZdDf4eT0DljKZ+0jkSAcm8PZaqysfnOzsk0mKCKDz8f7CwoH3OBFh9jhP7m2mJV
 eXfD+FTMX9hRFd34qOFKOfFIgBSU7aUMilbygr1aIqalbtI2Le3YL5dxAWt9SmqI
 vd2ppDGAHs8ZA7dPynm+AVXEyNNqRWYiAecSkjGS1ldmk5wn2plwW44tzUEUdp4L
 DEBmatllV5kmoTB+ulI3DdHr1k0w4LsTXAM9S1phQHJTiHPi3uS+SmkvZvpq2m8V
 beDMKS9rV+y7e8K7gdMPBv601F/HH7vMboCQIEwBYA1VlPTUIAtwPgcGKUo+ijVx
 UQ2nPEFZmKibBQ==
X-ME-Sender: <xms:YRlxYcBxwseWDqRtZeumYOrGv-q_sGOZxEAMYqcpieTKBakI0xnJbw>
 <xme:YRlxYegK82TwUBkbrXNEGM0h75Pw50I67GPMxpWdX3JhTYYA0nTF2PKhS4Ncez6fY
 nuNvgFmdNsYPhjYHYk>
X-ME-Received: <xmr:YRlxYflsiIwKVuR9ZAkWizzuR7aihsfuxKw6u2yhoiTd1bD3XeaP2lfXq6bbR1cqLZYEhXfmhJSQ60I8nc88caO6KnKpAfOIFF403UsK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YRlxYSyIbRBL4CiSfcltUQZH9WY7clAgTKJ0jMm6C9nbRgnyBaeisw>
 <xmx:YRlxYRRHzlONk7bF8Yt8eWgjdrnqBptyNYdtwOi8ha7Jq8n51IFQCA>
 <xmx:YRlxYdbXBmJxLU_Ubh3LnMFZ11ZX8r3KQ8cWWDeEKAxRY0YC4o-anA>
 <xmx:YRlxYZynL24_m2KBdQNskyFh_ugeGcz-OIQ3mwwrRCqyHN25sgxVpgym1BA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:40:16 -0400 (EDT)
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
Subject: [PATCH v5 05/21] drm/bridge: lt8912b: Switch to devm MIPI-DSI helpers
Date: Thu, 21 Oct 2021 09:39:31 +0200
Message-Id: <20211021073947.499373-6-maxime@cerno.tech>
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

