Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF29D3BE584
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 11:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A206E862;
	Wed,  7 Jul 2021 09:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8C26E85F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 09:23:12 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id E389B2B0091F;
 Wed,  7 Jul 2021 05:23:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 07 Jul 2021 05:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=I2VJNxyWsEW1E
 SERgvVulV0v+jv9/Mi8+mLYCSCOchI=; b=eq/Zib8kNwbiWleCf9Ebsp3LASrO4
 7JaEU/GCYX3QagwTKnSy6fxRPu0bfNwdlH00yNyaLbhwR+SsF42VpNxxMBXdE2K8
 00y4VA7Hom1eryYupjoYwjm8kCn4y+MvG84YASoeZ35nY49j3ORy3dvU40Kvknqt
 +QyopUz3w2u82+Ju9VFc6TINZpZJZ6dnU9r2ZKB6D3nYSnbvhhiDmPhLEQ0fTskx
 CU3ZMgI8XRX//ldpd+GzscddcmAzwH2C/awSgBn54puoQUUS5/1aY3yARpupaBcR
 gU3Pf5+0rrpaFyU4dYAs0IHqasuVe9taU+BfSQLUyKnb/4ya73Vktw+Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=I2VJNxyWsEW1ESERgvVulV0v+jv9/Mi8+mLYCSCOchI=; b=BdEMt7dQ
 cW2plhAX1ZsjchohheQVNBua+NE0E9eCtyVdBpuWo9ti5BfMoTyfQ9bglyGUZz/u
 GeH+GQjKlQwdXhOb8igbW8ldgLXStAIDPOBSPBEFx6sa3AGgNgjLM1wB+S55dfPq
 xc66KqJUUB2AXu/YAAvvAluLd5nUbNVwOc/SZ7dLGhbefPZBQRUHrkQ8M4XTvQ2e
 HOGGC+h5kVkeWWz3/dcSerRJoI6+MyDEaJnoXwAAJ6tVXyutYxc42AQZ/cN96XRy
 xlogHGrkv8jafvxfHoutRU0z0wyxEzgXl54IjQDE+W6D5a074oJXeZJhJAxzXcdl
 wPO6oqSnAVqoiA==
X-ME-Sender: <xms:fnLlYM6Rgl4Lyoms7eoHEBY3PP8ySqcFpu1QOaKtRAXSBO4iN8biaA>
 <xme:fnLlYN5EdeIsR6wnggk3FyV7OREaWRv8oBb64w6TT8VWG3YpLASzD9Z4p6BgOj2ci
 soFTIA83CWmgJ7r78U>
X-ME-Received: <xmr:fnLlYLce1r9PRxMHEwrCXYZ89Mp0U7vL2o2kPi0nRmgcOKjfO-cLCnB9SiqrBGMwxZ5rneWo_cA6bcGw9ByQDf899wMZMfiANbNd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fnLlYBLqWlUNuWORdAbK7djkIUkjJWPH3nGLsTW3PFCtUQLxWzi0rA>
 <xmx:fnLlYAKa3absnVbTG3DqGqbomZE2mJM-kHTSWB4AHrfcxrtHFymf_Q>
 <xmx:fnLlYCz7dluM-2WHx7ZOvO8GAUuSmjzZrAx7-xgRb56rmfUH0tPmXw>
 <xmx:fnLlYB5OOBxx6rrJJzgye--va6S6NSuCWcnGzsjApQL8bQ2o9Tw1GcXsYmM>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 05:23:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 2/5] drm/vc4: hdmi: Rework the pre_crtc_configure error
 handling
Date: Wed,  7 Jul 2021 11:22:54 +0200
Message-Id: <20210707092257.1465109-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707092257.1465109-1-maxime@cerno.tech>
References: <20210707092257.1465109-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 Tim Gover <tim.gover@raspberrypi.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since our pre_crtc_configure hook returned void, we didn't implement a
goto-based error path handling, leading to errors like failing to put
back the device in pm_runtime in all the error paths, but also failing
to disable the pixel clock if clk_set_min_rate on the HSM clock fails.

Move to a goto-based implementation to have an easier consitency.

Fixes: 4f6e3d66ac52 ("drm/vc4: Add runtime PM support to the HDMI encoder driver")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index dac47b100b8b..38eb3caf6c44 100644
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

