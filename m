Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6112560036
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16E014A676;
	Wed, 29 Jun 2022 12:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2F714A664
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:38:19 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B7FFE3200956;
 Wed, 29 Jun 2022 08:38:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 29 Jun 2022 08:38:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506298; x=1656592698; bh=hk
 iO6wxcPqyOCfVEWUbOVQgVaoTCUV3li2XqvsGCKbw=; b=jyt9z0ri8Q5WKX36Xx
 0WFsBvHMWjbXbtet7SxzfOUfrGJgYSpRmHgAeflfz+0821mZGzo7FnXY/MGLyG64
 7XDdyOFPa7CwwKXsS+mao1jQGL+b83x+hX9QhNHDuB8JsadN/g2dyrzeldKmn/As
 JjG5jJ02Mfgu8B0DKBFmGhYismVoITsjDtmKBXzv8IgdXf931hxnApuKmZo44Wje
 AFbRd4Kw5gZeAjyCUnum9jxpWP5S187g9uuUjjLoLiysmqmxXTweeZvuRBGNt7P0
 BsvUcBnUJ5ieV0vFfYqOQc08VtmjL9VZwQZdRgKOOgjVT0Uv47N6OhinY+EDxK9B
 nzSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506298; x=1656592698; bh=hkiO6wxcPqyOC
 fVEWUbOVQgVaoTCUV3li2XqvsGCKbw=; b=u5B3PwSQo9zdfxFnQe9SPGtbPd8/X
 rh6JDwI7LnxwMS8PGSDPIQ5HwSp66OGMe5Kwlb+dEtMm5nkTRhUBRQW48zYH5KDN
 Az0k+cLaMNAiO0Luq/IAzUB83Eii+591sokcEUcyDWvx9DEb9jzeqtT8blsVG3yn
 gjN9BNWIqlgM3EvvU8CdsZJzOci1NZjeTU7/+fOPxRthazyqRrxkAb0HQE4l4zTD
 szlXi/OFSEoMrDH5MyNup1NunXB5/MErhj6httZm2xmK2QytHXON7CqnrvM18zp9
 tcBDXPd/D76LpkPuf7OIg9OCGlj9Al60ZflzXHGhRjRkZKRFpgYxyYc1w==
X-ME-Sender: <xms:uke8YttHBWEGQNuTnXg3OmeBElVGmJ-wFbnF4MhxHtyuDn3ulTyO3w>
 <xme:uke8Ymd2qH2yEtEq4QWSFRFgRv-cK34uK_1pCxJWwFeEnFvsRY78f26UTpOM9gGwI
 xBzv8uzlXx15odO_38>
X-ME-Received: <xmr:uke8YgxMb0vppn4zuWyU9rtDlEVMnAWLl7cZRH7d9xRe27JZiIsi3vQziirhHsSm0IeMAq9i6090cDeObBhHBJ3rxUoZ3GdNII-Favw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uke8YkOVqeS5pqSz6G9A4-eLkAH0Beo3kwltUw6N5pV3s0PwqgpcRw>
 <xmx:uke8Yt-DVqgJkdpALpVy986f5EovS9qBzp3qWyZ3Z9F5cG54-1uDWw>
 <xmx:uke8YkUcy9syp8c9iDPA5lAyRI6Z6bD7hU20i2wa-_qMC3KYW0Txzw>
 <xmx:uke8Ypa9ufiSIr2-TuOrFuHTW6F4_xnXt2HJrG_YTKtYnvb1IS2IHQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:38:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 62/71] drm/vc4: vec: Protect device resources after removal
Date: Wed, 29 Jun 2022 14:35:01 +0200
Message-Id: <20220629123510.1915022-63-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Whenever the device and driver are unbound, the main device and all the
subdevices will be removed by calling their unbind() method.

However, the DRM device itself will only be freed when the last user will
have closed it.

It means that there is a time window where the device and its resources
aren't there anymore, but the userspace can still call into our driver.

Fortunately, the DRM framework provides the drm_dev_enter() and
drm_dev_exit() functions to make sure our underlying device is still there
for the section protected by those calls. Let's add them to the VEC driver.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 67 +++++++++++++++++++++++++++++++----
 1 file changed, 61 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 4b843b18c006..df6adef96050 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -14,6 +14,7 @@
  */
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
@@ -225,14 +226,30 @@ static const struct debugfs_reg32 vec_regs[] = {
 
 static void vc4_vec_ntsc_mode_set(struct vc4_vec *vec)
 {
+	struct drm_device *drm = vec->connector.dev;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
 	VEC_WRITE(VEC_CONFIG0, VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN);
 	VEC_WRITE(VEC_CONFIG1, VEC_CONFIG1_C_CVBS_CVBS);
+
+	drm_dev_exit(idx);
 }
 
 static void vc4_vec_ntsc_j_mode_set(struct vc4_vec *vec)
 {
+	struct drm_device *drm = vec->connector.dev;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
 	VEC_WRITE(VEC_CONFIG0, VEC_CONFIG0_NTSC_STD);
 	VEC_WRITE(VEC_CONFIG1, VEC_CONFIG1_C_CVBS_CVBS);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_display_mode ntsc_mode = {
@@ -244,17 +261,33 @@ static const struct drm_display_mode ntsc_mode = {
 
 static void vc4_vec_pal_mode_set(struct vc4_vec *vec)
 {
+	struct drm_device *drm = vec->connector.dev;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
 	VEC_WRITE(VEC_CONFIG0, VEC_CONFIG0_PAL_BDGHI_STD);
 	VEC_WRITE(VEC_CONFIG1, VEC_CONFIG1_C_CVBS_CVBS);
+
+	drm_dev_exit(idx);
 }
 
 static void vc4_vec_pal_m_mode_set(struct vc4_vec *vec)
 {
+	struct drm_device *drm = vec->connector.dev;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
 	VEC_WRITE(VEC_CONFIG0, VEC_CONFIG0_PAL_BDGHI_STD);
 	VEC_WRITE(VEC_CONFIG1,
 		  VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ);
 	VEC_WRITE(VEC_FREQ3_2, 0x223b);
 	VEC_WRITE(VEC_FREQ1_0, 0x61d1);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_display_mode pal_mode = {
@@ -344,8 +377,12 @@ static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
 
 static void vc4_vec_encoder_disable(struct drm_encoder *encoder)
 {
+	struct drm_device *drm = encoder->dev;
 	struct vc4_vec *vec = encoder_to_vc4_vec(encoder);
-	int ret;
+	int idx, ret;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
 
 	VEC_WRITE(VEC_CFG, 0);
 	VEC_WRITE(VEC_DAC_MISC,
@@ -359,19 +396,29 @@ static void vc4_vec_encoder_disable(struct drm_encoder *encoder)
 	ret = pm_runtime_put(&vec->pdev->dev);
 	if (ret < 0) {
 		DRM_ERROR("Failed to release power domain: %d\n", ret);
-		return;
+		goto err_dev_exit;
 	}
+
+	drm_dev_exit(idx);
+	return;
+
+err_dev_exit:
+	drm_dev_exit(idx);
 }
 
 static void vc4_vec_encoder_enable(struct drm_encoder *encoder)
 {
+	struct drm_device *drm = encoder->dev;
 	struct vc4_vec *vec = encoder_to_vc4_vec(encoder);
-	int ret;
+	int idx, ret;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
 
 	ret = pm_runtime_get_sync(&vec->pdev->dev);
 	if (ret < 0) {
 		DRM_ERROR("Failed to retain power domain: %d\n", ret);
-		return;
+		goto err_dev_exit;
 	}
 
 	/*
@@ -384,13 +431,13 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder)
 	ret = clk_set_rate(vec->clock, 108000000);
 	if (ret) {
 		DRM_ERROR("Failed to set clock rate: %d\n", ret);
-		return;
+		goto err_put_runtime_pm;
 	}
 
 	ret = clk_prepare_enable(vec->clock);
 	if (ret) {
 		DRM_ERROR("Failed to turn on core clock: %d\n", ret);
-		return;
+		goto err_put_runtime_pm;
 	}
 
 	/* Reset the different blocks */
@@ -426,6 +473,14 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder)
 	VEC_WRITE(VEC_DAC_MISC,
 		  VEC_DAC_MISC_VID_ACT | VEC_DAC_MISC_DAC_RST_N);
 	VEC_WRITE(VEC_CFG, VEC_CFG_VEC_EN);
+
+	drm_dev_exit(idx);
+	return;
+
+err_put_runtime_pm:
+	pm_runtime_put(&vec->pdev->dev);
+err_dev_exit:
+	drm_dev_exit(idx);
 }
 
 
-- 
2.36.1

