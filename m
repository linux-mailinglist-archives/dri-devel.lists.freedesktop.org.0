Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A780B546264
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E4C12B558;
	Fri, 10 Jun 2022 09:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6165911BA7D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:31:05 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id BF6545C0064;
 Fri, 10 Jun 2022 05:31:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:31:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853464; x=1654939864; bh=B4
 6ls04lOW6M6AGEa5M99cxKlU2rtz8/ILA9YVBbrIY=; b=eBL5v4T8MMrAUvP+Be
 sEirMMgtd5tKhFxTiJuID+61vrNg+QCI5v25jP5Qxm7uXR0dNuWITELSFqivIFBn
 5Lk8BY+BGA63FkLR4/HUtbi71Gq8p9FkAS4I1s5ZKkcoya2jkqUbPILY/hR7nqrB
 xam6i/LFjctb3czR5vGtNTItS8lDgUyk3be4ovZ6ameClMd/k78kJb84KeEaDhfP
 v9JGyJPb9eZvOpTBq4zxhGbXfRP5b4U2PWBFxFm78pR+Jr2PNVUwDVvnm9nRisqf
 X0gJvzaNUmgecmM5ng079BV+tGCmWmNqD/pIUIANoWlAYNN6cfW1d/SUtcgV0IPr
 +Otg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853464; x=1654939864; bh=B46ls04lOW6M6
 AGEa5M99cxKlU2rtz8/ILA9YVBbrIY=; b=ilMiqrLtPMpq8R4gtIphLcLVwoqQF
 5X3sKWfzpEOuh9YWNzpU3ZortD//rbqT2CBMkxeFl6V7GQ3nugJWXk8FM8245Maf
 Ff1ph0KhsUxqDaJcDYXy49ZhAkQNo8gMch3D8CNw7cSu3HPh77eTykMzyfPp6U01
 uA7QVp6KEZ3QsWzwdhEcwicDA4Yh1fIsJWcG9lPoHl1QwzuAFStHYIl3S9dE1Oot
 w5F6W2370WcEkd3nbbRJTmcHpVEwad6Msjud4VnmN7H5jOCjWRM3wfXOPj9B3FlI
 bMsbbJJxMGXJPOCoIuMwPtq4GervFIDdN3EA2/BNi/1fkoLWR+x4kpjpA==
X-ME-Sender: <xms:WA-jYsHyjYlty99jXVD1Jeh2FLDRmVr_YlNngBk8gbT4kZ7QxCRLIA>
 <xme:WA-jYlXea4mXjg7LEA8NmErCs7zmllWSM3VzApPDLlXqOf-rRGoFbCq6jhotJA8He
 3O9PTAlGcc_QjGlE_g>
X-ME-Received: <xmr:WA-jYmJgahDLRJiO8wVp98DLHbK0rEMycUR6tPI6LDYcX0ER9HbhvvRX9A4yTw63_6L5dCGdNyASKPaNP6itpyNXSxA10apQebeCMas>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedukeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WA-jYuGBHqsrs6ywGTJawbZI8wxhchL82VdYqMzSZh1CGU6Ea5DFYQ>
 <xmx:WA-jYiU3XVpuGKN1mvbxdI2Qa4_pK5ySyt96jnINLhp2avm0QxqBWA>
 <xmx:WA-jYhNVPqZcby-SOB6NcKl_f4PiuE_IeyFUUN2AwiPPHnyVT6P39w>
 <xmx:WA-jYgyCHvC6_TjyVz4csNuDB-ixD_pCuMWEBEPqlpInxICa0bwnMA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:31:04 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 55/64] drm/vc4: vec: Protect device resources after removal
Date: Fri, 10 Jun 2022 11:29:15 +0200
Message-Id: <20220610092924.754942-56-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
index c63701503141..2a72644d99c5 100644
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

