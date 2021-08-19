Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BBD3F1B0F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 15:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925466E988;
	Thu, 19 Aug 2021 13:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455246E989
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 13:59:51 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id DB3CA2B005D0;
 Thu, 19 Aug 2021 09:59:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 19 Aug 2021 09:59:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=B7PVCG/bjNEUB
 GbiDile2HwXPPbm4HndIsVkTjHJmZY=; b=tEyJoadMYYS67bulDamhewQ4S+MCa
 wHnSaLpdPydvx+j8hPDBSR6xZLwGsKSPl2cM5KUgdxp8XmtowlUIv91XMkdpjhny
 nmk20Tll51EbqJBn0kB6sdMkjdn4U6rGD4MppSsZltDimRdoQ13ETHCxszFU906P
 yuJ5vNwHJiHiZsAZsf/wevgKhjeKEyw3dIlLYZpGRZEQUDg1WC+8IEZ+7RhQtosl
 qDRUeJdFdjj2K7GqsGoCtOncUG1UtUIzuQ32IsKRKMwnU8p/391L9kGOxRIujqPH
 H1z7lq3XgJlGZPB37Up/d+GtBYpRvZG6kOZg/K6my6fIz9MBse2mPqY3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=B7PVCG/bjNEUBGbiDile2HwXPPbm4HndIsVkTjHJmZY=; b=iAz4GljU
 YPKcBJcAz6Q91TDmlIUDHnKboiDxoUBQ4UYJMgjc9Yn/Jfkbx36IV66yI4JnU3Nc
 ScBbZRnH7p9t0Hb6Wec9L60anNNEO2UzByAUy6gzpqKVhRFXpk8iVRIR8KVg+n3T
 R0N7pv10lvOfe8VOt8DZUduvAPNE6Am3zhRcOzfU/8SRcHtLUSnD/gnEVG7Nztm6
 hOVb10CEPcq+KB521hTUYeccXRIM/JwD9rOU613Shir8IhnR/K7m6zxuyZ3/ZINj
 7YamLfj9fzUkUWC+gxhl19fUU4wldiAy5osKiE1+9jnN0PRjgzKKD6xHZH4736Cp
 fk/GEAXvCJmfSQ==
X-ME-Sender: <xms:1GMeYV6XNEMt4R8iYY8ZGO0jNrLZWXCHEH-MQxCLHxelzxOLz2eJPg>
 <xme:1GMeYS4DATQDpVvjPVjahkySW1bUWgeX0ZmbRNH-yX58XTGMaMfmKMKtro0GvBkUX
 yWUP8jVpGS82pcsjkE>
X-ME-Received: <xmr:1GMeYccGEtdNyV8wl8OAXT5AG1v0JyjxfQi5ycW9wG1NxvuLK95pWhbqkkTufgRFLmxtCeiZ1Y-imcjPUUYO_te4LuchiDkntpFH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdejtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1GMeYeIYG9u9e5MFNTMKLZgEzez3JOCh5bZbC54GgZy1DbGooQqKww>
 <xmx:1GMeYZJogMsMmu5LqynxsSCxeYmt6b7kaPG9nnuPyAs1m7qiU8GHgA>
 <xmx:1GMeYXxOHocQr1EfDmipAhDBqed4wF_tr5zP9PDAA5Likc8F9k_X_Q>
 <xmx:1WMeYS7MDXr2z_heKe5PpxTI3mYnucFgxiLBd1Dgj3UnpGF9JTDQMgoOYDM>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 09:59:48 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: linux-kernel@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 bcm-kernel-feedback-list@broadcom.com, Emma Anholt <emma@anholt.net>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 3/6] drm/vc4: hdmi: Rework the pre_crtc_configure error
 handling
Date: Thu, 19 Aug 2021 15:59:28 +0200
Message-Id: <20210819135931.895976-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819135931.895976-1-maxime@cerno.tech>
References: <20210819135931.895976-1-maxime@cerno.tech>
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

Since our pre_crtc_configure hook returned void, we didn't implement a
goto-based error path handling, leading to errors like failing to put
back the device in pm_runtime in all the error paths, but also failing
to disable the pixel clock if clk_set_min_rate on the HSM clock fails.

Move to a goto-based implementation to have an easier consitency.

Fixes: 4f6e3d66ac52 ("drm/vc4: Add runtime PM support to the HDMI encoder driver")
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5dde3e5c1d7f..8458f38e2883 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -913,13 +913,13 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	ret = clk_set_rate(vc4_hdmi->pixel_clock, pixel_rate);
 	if (ret) {
 		DRM_ERROR("Failed to set pixel clock rate: %d\n", ret);
-		return;
+		goto err_put_runtime_pm;
 	}
 
 	ret = clk_prepare_enable(vc4_hdmi->pixel_clock);
 	if (ret) {
 		DRM_ERROR("Failed to turn on pixel clock: %d\n", ret);
-		return;
+		goto err_put_runtime_pm;
 	}
 
 	/*
@@ -942,7 +942,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	ret = clk_set_min_rate(vc4_hdmi->hsm_clock, hsm_rate);
 	if (ret) {
 		DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);
-		return;
+		goto err_disable_pixel_clock;
 	}
 
 	vc4_hdmi_cec_update_clk_div(vc4_hdmi);
@@ -957,15 +957,13 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock, bvb_rate);
 	if (ret) {
 		DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
-		clk_disable_unprepare(vc4_hdmi->pixel_clock);
-		return;
+		goto err_disable_pixel_clock;
 	}
 
 	ret = clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
 	if (ret) {
 		DRM_ERROR("Failed to turn on pixel bvb clock: %d\n", ret);
-		clk_disable_unprepare(vc4_hdmi->pixel_clock);
-		return;
+		goto err_disable_pixel_clock;
 	}
 
 	if (vc4_hdmi->variant->phy_init)
@@ -978,6 +976,15 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 
 	if (vc4_hdmi->variant->set_timings)
 		vc4_hdmi->variant->set_timings(vc4_hdmi, conn_state, mode);
+
+	return;
+
+err_disable_pixel_clock:
+	clk_disable_unprepare(vc4_hdmi->pixel_clock);
+err_put_runtime_pm:
+	pm_runtime_put(&vc4_hdmi->pdev->dev);
+
+	return;
 }
 
 static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
-- 
2.31.1

