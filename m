Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3E3554D64
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A9D1133AE;
	Wed, 22 Jun 2022 14:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67ED41133AE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:35:21 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 38176320095B;
 Wed, 22 Jun 2022 10:35:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 10:35:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908519; x=1655994919; bh=Yx
 nB1triAKJz4qXw6/DEGbfR1CJNF0BjlUHfWblGC9g=; b=QaBj60oV8e3LKo/XGu
 WYHQ41u+n3oVOvz4L+JIh/BX05YrRGTnc47Oc4cOlyhxpxbyj73NQHpDpNMFuFMc
 QvMn/CoNNwK3J6rNV3WMzqq9ogapLIPdyBx2NZtuemsmBKenYwaXmKCQXc4wbqkU
 +ORRryGEZDdAbLsXjHBWE2PJDbIu4TV0pJGkWrKZzLpRysAJQcRWBFaAa96q06NY
 /J87O2N+Ru8cAtnW3aAjCiQ70BnnwldG90olTBeyOlMw4Nf0ah5oQtA999RzG6GR
 9mrThx3bccKk0a7tCso/8Zf4cS7EHh6F9v9N/If6ylVJpH59JSvxD4hAgoMLxQ8h
 6JCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908519; x=1655994919; bh=YxnB1triAKJz4
 qXw6/DEGbfR1CJNF0BjlUHfWblGC9g=; b=HhW7G1LlNupXOUXsAFEoA4UwVvucp
 y/GVfYxSXP7mdvnZgggkR47El1pUGoao8xzn5Zk41+kVN+j/BSrFCWV1F7/IDCKR
 +zXjeTIJSXdiuLMiDEl1nv5Rejxfn5B6SD2oWnivzkdbJjBJv6jZl99AI8VbkU01
 fPr0sRUHTp9P3CDBpQ5MuMnPcNfHFsdsftUJXgzWsoiy10LErIWeEYeYMwQYD42l
 SuAVxx/vIqDNMA/yyKUJDSDjhnzhfuMjpFaP/NA45MX8lFELNq7Cy4ijBlhQIYm0
 dwso2dZQJATlKvcv6+sIFaatS0krvaWZO+FJW8K2GwTd1BjauKCqr+Plg==
X-ME-Sender: <xms:pyizYkXSJPuu9jZuhISCBFURmMkI0zY5KYMd_su5Ib3WNN74oEg0Cw>
 <xme:pyizYomhKfk6b5TdUxLshiuiKZQgmXTIxzAYU-F_Qa07aaMbrrdWNmMj7s_OMy0hm
 6YookpEuMm5-vy-gis>
X-ME-Received: <xmr:pyizYoY1hy0fsbDQbD_vr3WdB1n6OaTA5-WBBc03IeAGupQKVGfjAoem2TvwxDEWSI80XnxsGVGqvOkiYZJzi9URdTgQ5PN_JiTuSiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduheenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:pyizYjWaE628vex37cX_v4Enfj8wXOAgQWj2HO9SX5hvDozdUERFAg>
 <xmx:pyizYukKBKlLOjQTqbhFouv0DC7No05ph-q585vmiJ3IhMwYlFbZNQ>
 <xmx:pyizYoeXODZSwIKKb8bOoewSewe03a5JMh9ttqlSt2lYNOzekTlHKg>
 <xmx:pyizYvCNsG9CcV5pmMa7TJs0R4oqxXRmiKwih4Nd0eP1SyzjmXuafg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:35:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 59/68] drm/vc4: vec: Protect device resources after removal
Date: Wed, 22 Jun 2022 16:32:00 +0200
Message-Id: <20220622143209.600298-60-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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
index f6858e40ddbc..b2a15c39939e 100644
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

