Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 505EB570934
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0407790352;
	Mon, 11 Jul 2022 17:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDC69034C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CF38D5C0102;
 Mon, 11 Jul 2022 13:41:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 11 Jul 2022 13:41:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561284; x=1657647684; bh=lU
 9T4Kwh0eAFHKZGmniiqPCv4eGOB9uAg6ioqqTRo6M=; b=SjsJ+RA+4uLEt4nZk3
 Qb0IjqAzAq3nR3aJ4JufJeSweWm8H0p6xmaGBSqHKT4REWqMdEAeFKYDINFx55UW
 NojvClg0A6Ua7GYfIiwjwivYT1ZLgKUgyP45NtzNWjMwVzjL+LOGBUHuqpnbU6qU
 DYut/eXapG1k/SeC2UzjYfJRQXCyN5Qn169XmaFTxWlRLdvZYE471esZ9v1SfVME
 iv6EJarJQ1IXBDJmugUoMgbJutyUIiBYadPNzfGzCl+yj69bI48BMPO7IDmr+R/L
 P8CO2Zmci9FTYS0SAJSiSVkj0CvfQimkI4DHkbVdPXwfdhktZsAzRZBuQhzYA/z8
 at/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561284; x=1657647684; bh=lU9T4Kwh0eAFH
 KZGmniiqPCv4eGOB9uAg6ioqqTRo6M=; b=n1mgrMHlvu7MokqiUVwzNIN8jvR+v
 SPBPsWR6uGZka8Jrnecvdg+AfrDJGF/SDjiJKA+bCuZGEWSuq2pSlUsix+NLoh3B
 8lv6RAH4yOOuKmQ6i59uvuYaW2SPI2sLYecaxVn/pY/4oZXblMsrhA40rMVplMzI
 16GhZ50u8raYRMjY3Bqdk3p3wXrfIRo4Siv3z1+LxUrMcOZtGXzh/ESbnBAQLMr4
 EedA8e2Zpvl/Q6Rp/FY6f27Ooi51QCl3SHU+SIrz8TsT5Fvq76hyvyF9FbQGBok4
 cykejAX5X1+mR9MNRpPN0FTP3fWeWtRULRU2bNAFg1B4botU7W42cY0jQ==
X-ME-Sender: <xms:xGDMYmYuoSgwnCRqJqQmkj5hd5v9OWtoCGTMw6NKqvrEHqJghU4W6g>
 <xme:xGDMYpaBTp5_7k-sv453U8n6220GSlMXr2GUYEQBid1tSW3JnBY52w-Qcl7aClaQ-
 mQFQdCm31WwvoygocQ>
X-ME-Received: <xmr:xGDMYg9JgnFZE-0tqtoiHwUYWIAEfAd2m0dijwWaz-oKWTSnhAJMt-lncvcHMnGlp0apHSkYkKVX4XOaX3SzLWUTRhzg_n4orNiipLo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepleenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xGDMYooB1AL_9ksYeDL1mtfpsXaVRhDZnolhlyCAyRVXAupur9Gi1g>
 <xmx:xGDMYhpoIgGoTq8xZQeHQ53DeWhUCkvVrgXfkRbZDF6twt6K_dz8qA>
 <xmx:xGDMYmRLDGqwEO6L9FalOXnPhylm-B5YVqbKU0JciaTCn4YGJTB1hw>
 <xmx:xGDMYimblrAyLDmoCDcWdPCbu4meRIJBqYy6X6mz3bO_cqBHVZejSQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:24 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 60/69] drm/vc4: vec: Protect device resources after removal
Date: Mon, 11 Jul 2022 19:39:30 +0200
Message-Id: <20220711173939.1132294-61-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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

