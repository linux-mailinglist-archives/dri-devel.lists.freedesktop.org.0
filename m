Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A4D56B6D4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F301D1138BA;
	Fri,  8 Jul 2022 10:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A54A1138CA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 10:00:10 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 2106932009F8;
 Fri,  8 Jul 2022 06:00:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 08 Jul 2022 06:00:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274408; x=1657360808; bh=lU
 9T4Kwh0eAFHKZGmniiqPCv4eGOB9uAg6ioqqTRo6M=; b=Rlf/tR0gW/fY3VOtx3
 zDvrSzCZtJ8YyaRYbWdlOIGNHJhtY4rN2dm21rvh0LvPXKPPUWgiAW/E2xVn0r8e
 zFM/WPhShzVv955ODlAzRqsoxv2zJhQDXJKfDTtub0lia5kUkuCW3dM8KEri/fVE
 MToih5i1hzllY6rJKneSSj/4FtmLsULlX9mUXKGDFz66TCsz9R57Bh3gNu8sKOAr
 lafiq6Z8jYTwTj2wkifuuPUJs2VVgK2755eoZzKHqzYn85u0FsZQKbG4cT3jbpMD
 5/xfwNYM16/2vB76Vgl6qo0Rd8sha0wNCEI53etm4IA0P5POcxAvvX+Q2XEEjvXY
 osrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274408; x=1657360808; bh=lU9T4Kwh0eAFH
 KZGmniiqPCv4eGOB9uAg6ioqqTRo6M=; b=3Kd2dWUmFED3em0XhHs22eNeLlh6E
 YKQewUCmP2jaiPaYVkVGse4Hk9t9GROyGKhu7Nbj2GpYvdckHIz02z78S7r1l12l
 sXGtDbQUiOdQGgVczsYnwDNVCpd8HKFy1D7mEg8+xqZdYA47YRJmrrcyJ8AF+4Lc
 h3DOgVKqzExpMQdiUIdz7DhnVNhNrIq7SMCN6sddlYoDdlY1dX8an21DXl1r+cyl
 4i7T+ro+Gt8N3IezK8bFlr/hddW3aoi1GbFJ18XfgVG7kRMBhIknFvrXdiaSNk3h
 P+zU5Bp06fBpBdXo5KyO4NGMw7PwpA9qqxIYNZd8BamopI/xWWSPbYtAg==
X-ME-Sender: <xms:KADIYioraBMyWVjU-ZMigtlalFaKZjq9V38dj9_S-p2pON9fM9L6tA>
 <xme:KADIYgo50FjuTnLSA8ipbzh7d2q7naLgFsZMm5KE9smQWWjeqqBfdC6ml-SPdcU-_
 clQrCGeUJ4DO7DBXis>
X-ME-Received: <xmr:KADIYnOdfxyE3ctA9laHq-2kgI72PPjLaoBTwPG_uAq0jXSjMhqUTvQsRr-9cImuKwW3qKugkAHHXOIE9cavJW2_GGyHxB4bj4Jjxms>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KADIYh7Isu6EhLJ4Wt8Ps9WuwPUqyAsyJawVUBe3CVURq23kx0__rA>
 <xmx:KADIYh7t1f178_o_AwJWsQesMJIjOkcRIlggc1TkiouVrdsoYiYxMQ>
 <xmx:KADIYhiGrWNeqcF_hA7kWHmgwub2GLoTi_41v6-zOY3f2Fto8K-Oww>
 <xmx:KADIYk0ChZUF-z3mf6kleWkkJvDK03Oy2gknuOD418UqCQ3muHqFew>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 06:00:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 60/69] drm/vc4: vec: Protect device resources after removal
Date: Fri,  8 Jul 2022 11:56:58 +0200
Message-Id: <20220708095707.257937-61-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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

