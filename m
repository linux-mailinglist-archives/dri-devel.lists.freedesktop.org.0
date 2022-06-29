Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7430B560038
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0FB14A683;
	Wed, 29 Jun 2022 12:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B91914A673
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:38:31 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 46B0F3200951;
 Wed, 29 Jun 2022 08:38:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 29 Jun 2022 08:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506309; x=1656592709; bh=Gw
 64BkbUOwsq0mFj+RUxUEXVSSpyBWLMe66De5/XmNE=; b=3DhMuJIGaRSoWs7soE
 t2Fd8GSFR80TE+LYhZn+d7ngTBmrQjyWcs2BoWmKg1Xq01H+L9IgSGGkYjTvhcvp
 56p6P5SjrJJ/n9KsAgud1Hvj5SAyqfSs/vOuIPTsSGF+JD47R7IXbkUrMp0d9sy7
 xL84O2I0/uwDoqrfsSDL8JLjBEhX09s9Ngt8geoo6ht1lrLx135fdyck5UQqMFi5
 pxAltpDiKi/hfPBjpaNj4i7Jg2xirv7oW4rhDh9T9cpuC8jsQcQRvf9by3Xea+o0
 g/QXiRZRvRn1t8FqdgF6En4M2sZiK7jGAl02o2sAK2N7cBuM0TxaFSlV2Qkofd+F
 pQpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506309; x=1656592709; bh=Gw64BkbUOwsq0
 mFj+RUxUEXVSSpyBWLMe66De5/XmNE=; b=Ks8+QKcflCsoTZZylFLWFBh1GjKRD
 WpJJ4WqC4qniFDXkij6XVJa+7lrrI2wiEuIHMDCW5F8a1nUZsungaRB+b1YRLtXr
 XOIKMW6alfxPN9HVbc0N9OCS/nDLXnWQpzVicuPqx85Tp9dcxtQxYSNKzMVXVYzK
 8Rmm3KD/TAeSFWNmf9NWxxNjNNZb96VKPalYI0P9wIlJ84uhYNNnxlAx3p3PrYZA
 VHBDEGTV9gs1uKjIK38QKdniOGyynIWB9g+OOiP1i4p0w1KPWXbh3b0yM6nZJRi3
 155jfHuxQTStwWi1IFvK9kHUDgF/dNlt+ej0yOWEkkhh57CXBOH13ZzrA==
X-ME-Sender: <xms:xUe8Ypuou6CYQfd3d9HBXUIb2wAq78cCK4aDdphDxknITO0igZU_4A>
 <xme:xUe8YicoPCojWf9KCh6-5mzcNH9Pu856ZOLTWtwk193ABegKu1GGzm-B9H7I_59fW
 m0rP8KzYjT5qdhbEbw>
X-ME-Received: <xmr:xUe8Ysx6BNUq_SPcZQRpNBaokzkDBWJ1uOzJjbs8EenOoU18JOdp-gkKuKLoAbJvk_K1mPzCwyGkxrkPjrbM9Nky3HSSUIj_I-5Cc4o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:xUe8YgP9LhoyS8eGdFgMD7QeSffq9GWnt-5JVBK_FzAceROD-XiN_w>
 <xmx:xUe8Yp8wWnLvdhrqz-60UN4r0z0uqn82WLpd4_Qw6hpC_T6qfA7A4w>
 <xmx:xUe8YgUqkO0vJNfm0MFy6_LrqwDbAvDcNutWDOtaAGIakiIfSiCg4A>
 <xmx:xUe8YlawQ74rFEm1mi2epxhQ-bIpufXYhCNPgwgJJ2w2zBmcWcblqw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:38:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 66/71] drm/vc4: debugfs: Simplify debugfs registration
Date: Wed, 29 Jun 2022 14:35:05 +0200
Message-Id: <20220629123510.1915022-67-maxime@cerno.tech>
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

The vc4 has a custom API to allow components to register a debugfs file
before the DRM driver has been registered and the debugfs_init hook has
been called.

However, the .late_register hook allows to have the debugfs file creation
deferred after that time already.

Let's remove our custom code to only register later our debugfs entries as
part of either debugfs_init or after it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_bo.c      | 20 +++++++++++--
 drivers/gpu/drm/vc4/vc4_crtc.c    | 19 ++++++++++--
 drivers/gpu/drm/vc4/vc4_debugfs.c | 50 ++++++++++---------------------
 drivers/gpu/drm/vc4/vc4_dpi.c     | 21 +++++++++++--
 drivers/gpu/drm/vc4/vc4_drv.h     | 12 +++++---
 drivers/gpu/drm/vc4/vc4_dsi.c     | 22 ++++++++++++--
 drivers/gpu/drm/vc4/vc4_hdmi.c    | 26 ++++++++++++----
 drivers/gpu/drm/vc4/vc4_hvs.c     | 39 ++++++++++++++++++++----
 drivers/gpu/drm/vc4/vc4_txp.c     |  3 +-
 drivers/gpu/drm/vc4/vc4_v3d.c     | 25 ++++++++++++++--
 drivers/gpu/drm/vc4/vc4_vec.c     | 22 ++++++++++++--
 11 files changed, 190 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 0846d56f74f2..9706fec47bcd 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -984,6 +984,23 @@ int vc4_get_tiling_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
+int vc4_bo_debugfs_init(struct drm_minor *minor)
+{
+	struct drm_device *drm = minor->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
+	int ret;
+
+	if (!vc4->v3d)
+		return -ENODEV;
+
+	ret = vc4_debugfs_add_file(minor, "bo_stats",
+				   vc4_bo_stats_debugfs, NULL);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static void vc4_bo_cache_destroy(struct drm_device *dev, void *unused);
 int vc4_bo_cache_init(struct drm_device *dev)
 {
@@ -1008,9 +1025,6 @@ int vc4_bo_cache_init(struct drm_device *dev)
 		vc4->bo_labels[i].name = bo_type_names[i];
 
 	mutex_init(&vc4->bo_lock);
-
-	vc4_debugfs_add_file(dev, "bo_stats", vc4_bo_stats_debugfs, NULL);
-
 	INIT_LIST_HEAD(&vc4->bo_cache.time_list);
 
 	INIT_WORK(&vc4->bo_cache.time_work, vc4_bo_cache_time_work);
diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 3768a2a57ca9..d3efa7e5b5ed 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1052,6 +1052,21 @@ void vc4_crtc_reset(struct drm_crtc *crtc)
 	__drm_atomic_helper_crtc_reset(crtc, &vc4_crtc_state->base);
 }
 
+int vc4_crtc_late_register(struct drm_crtc *crtc)
+{
+	struct drm_device *drm = crtc->dev;
+	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	const struct vc4_crtc_data *crtc_data = vc4_crtc_to_vc4_crtc_data(vc4_crtc);
+	int ret;
+
+	ret = vc4_debugfs_add_regset32(drm->primary, crtc_data->debugfs_name,
+				       &vc4_crtc->regset);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static const struct drm_crtc_funcs vc4_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = vc4_page_flip,
@@ -1064,6 +1079,7 @@ static const struct drm_crtc_funcs vc4_crtc_funcs = {
 	.enable_vblank = vc4_enable_vblank,
 	.disable_vblank = vc4_disable_vblank,
 	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
+	.late_register = vc4_crtc_late_register,
 };
 
 static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
@@ -1318,9 +1334,6 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 
 	platform_set_drvdata(pdev, vc4_crtc);
 
-	vc4_debugfs_add_regset32(drm, pv_data->base.debugfs_name,
-				 &vc4_crtc->regset);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index b857fb9c94bc..b40d6a44b16b 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -14,11 +14,6 @@
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
-struct vc4_debugfs_info_entry {
-	struct list_head link;
-	struct drm_info_list info;
-};
-
 /*
  * Called at drm_dev_register() time on each of the minors registered
  * by the DRM device, to attach the debugfs files.
@@ -27,16 +22,12 @@ void
 vc4_debugfs_init(struct drm_minor *minor)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(minor->dev);
-	struct vc4_debugfs_info_entry *entry;
 
-	if (!of_device_is_compatible(vc4->hvs->pdev->dev.of_node,
-				     "brcm,bcm2711-vc5"))
-		debugfs_create_bool("hvs_load_tracker", S_IRUGO | S_IWUSR,
-				    minor->debugfs_root, &vc4->load_tracker_enabled);
+	WARN_ON(vc4_hvs_debugfs_init(minor));
 
-	list_for_each_entry(entry, &vc4->debugfs_list, link) {
-		drm_debugfs_create_files(&entry->info, 1,
-					 minor->debugfs_root, minor);
+	if (vc4->v3d) {
+		WARN_ON(vc4_bo_debugfs_init(minor));
+		WARN_ON(vc4_v3d_debugfs_init(minor));
 	}
 }
 
@@ -58,40 +49,31 @@ static int vc4_debugfs_regset32(struct seq_file *m, void *unused)
 	return 0;
 }
 
-/*
- * Registers a debugfs file with a callback function for a vc4 component.
- *
- * This is like drm_debugfs_create_files(), but that can only be
- * called a given DRM minor, while the various VC4 components want to
- * register their debugfs files during the component bind process.  We
- * track the request and delay it to be called on each minor during
- * vc4_debugfs_init().
- */
-int vc4_debugfs_add_file(struct drm_device *dev,
+int vc4_debugfs_add_file(struct drm_minor *minor,
 			 const char *name,
 			 int (*show)(struct seq_file*, void*),
 			 void *data)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct drm_device *dev = minor->dev;
+	struct dentry *root = minor->debugfs_root;
+	struct drm_info_list *file;
 
-	struct vc4_debugfs_info_entry *entry =
-		devm_kzalloc(dev->dev, sizeof(*entry), GFP_KERNEL);
-
-	if (!entry)
+	file = drmm_kzalloc(dev, sizeof(*file), GFP_KERNEL);
+	if (!file)
 		return -ENOMEM;
 
-	entry->info.name = name;
-	entry->info.show = show;
-	entry->info.data = data;
+	file->name = name;
+	file->show = show;
+	file->data = data;
 
-	list_add(&entry->link, &vc4->debugfs_list);
+	drm_debugfs_create_files(file, 1, root, minor);
 
 	return 0;
 }
 
-int vc4_debugfs_add_regset32(struct drm_device *drm,
+int vc4_debugfs_add_regset32(struct drm_minor *minor,
 			     const char *name,
 			     struct debugfs_regset32 *regset)
 {
-	return vc4_debugfs_add_file(drm, name, vc4_debugfs_regset32, regset);
+	return vc4_debugfs_add_file(minor, name, vc4_debugfs_regset32, regset);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index e892ac853f64..d3c728b77cdd 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -243,6 +243,23 @@ static const struct drm_encoder_helper_funcs vc4_dpi_encoder_helper_funcs = {
 	.mode_valid = vc4_dpi_encoder_mode_valid,
 };
 
+static int vc4_dpi_late_register(struct drm_encoder *encoder)
+{
+	struct drm_device *drm = encoder->dev;
+	struct vc4_dpi *dpi = to_vc4_dpi(encoder);
+	int ret;
+
+	ret = vc4_debugfs_add_regset32(drm->primary, "dpi_regs", &dpi->regset);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct drm_encoder_funcs vc4_dpi_encoder_funcs = {
+	.late_register = vc4_dpi_late_register,
+};
+
 static const struct of_device_id vc4_dpi_dt_match[] = {
 	{ .compatible = "brcm,bcm2835-dpi", .data = NULL },
 	{}
@@ -331,7 +348,7 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 
 	ret = drmm_encoder_init(drm, &dpi->encoder.base,
-				NULL,
+				&vc4_dpi_encoder_funcs,
 				DRM_MODE_ENCODER_DPI,
 				NULL);
 	if (ret)
@@ -345,8 +362,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 
 	dev_set_drvdata(dev, dpi);
 
-	vc4_debugfs_add_regset32(drm, "dpi_regs", &dpi->regset);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index e029dbd4567b..b7e3821100b5 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -840,6 +840,7 @@ int vc4_bo_inc_usecnt(struct vc4_bo *bo);
 void vc4_bo_dec_usecnt(struct vc4_bo *bo);
 void vc4_bo_add_to_purgeable_pool(struct vc4_bo *bo);
 void vc4_bo_remove_from_purgeable_pool(struct vc4_bo *bo);
+int vc4_bo_debugfs_init(struct drm_minor *minor);
 
 /* vc4_crtc.c */
 extern struct platform_driver vc4_crtc_driver;
@@ -858,6 +859,7 @@ void vc4_crtc_destroy_state(struct drm_crtc *crtc,
 void vc4_crtc_reset(struct drm_crtc *crtc);
 void vc4_crtc_handle_vblank(struct vc4_crtc *crtc);
 void vc4_crtc_send_vblank(struct drm_crtc *crtc);
+int vc4_crtc_late_register(struct drm_crtc *crtc);
 void vc4_crtc_get_margins(struct drm_crtc_state *state,
 			  unsigned int *left, unsigned int *right,
 			  unsigned int *top, unsigned int *bottom);
@@ -865,15 +867,15 @@ void vc4_crtc_get_margins(struct drm_crtc_state *state,
 /* vc4_debugfs.c */
 void vc4_debugfs_init(struct drm_minor *minor);
 #ifdef CONFIG_DEBUG_FS
-int vc4_debugfs_add_file(struct drm_device *drm,
+int vc4_debugfs_add_file(struct drm_minor *minor,
 			 const char *filename,
 			 int (*show)(struct seq_file*, void*),
 			 void *data);
-int vc4_debugfs_add_regset32(struct drm_device *drm,
+int vc4_debugfs_add_regset32(struct drm_minor *minor,
 			     const char *filename,
 			     struct debugfs_regset32 *regset);
 #else
-static inline int vc4_debugfs_add_file(struct drm_device *drm,
+static inline int vc4_debugfs_add_file(struct drm_minor *minor,
 				       const char *filename,
 				       int (*show)(struct seq_file*, void*),
 				       void *data)
@@ -881,7 +883,7 @@ static inline int vc4_debugfs_add_file(struct drm_device *drm,
 	return 0;
 }
 
-static inline int vc4_debugfs_add_regset32(struct drm_device *drm,
+static inline int vc4_debugfs_add_regset32(struct drm_minor *minor,
 					   const char *filename,
 					   struct debugfs_regset32 *regset)
 {
@@ -951,6 +953,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
 void vc4_hvs_dump_state(struct vc4_hvs *hvs);
 void vc4_hvs_unmask_underrun(struct vc4_hvs *hvs, int channel);
 void vc4_hvs_mask_underrun(struct vc4_hvs *hvs, int channel);
+int vc4_hvs_debugfs_init(struct drm_minor *minor);
 
 /* vc4_kms.c */
 int vc4_kms_load(struct drm_device *dev);
@@ -973,6 +976,7 @@ int vc4_v3d_bin_bo_get(struct vc4_dev *vc4, bool *used);
 void vc4_v3d_bin_bo_put(struct vc4_dev *vc4);
 int vc4_v3d_pm_get(struct vc4_dev *vc4);
 void vc4_v3d_pm_put(struct vc4_dev *vc4);
+int vc4_v3d_debugfs_init(struct drm_minor *minor);
 
 /* vc4_validate.c */
 int
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 52c3215fef49..878e05d79e81 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1372,6 +1372,24 @@ static const struct drm_encoder_helper_funcs vc4_dsi_encoder_helper_funcs = {
 	.mode_fixup = vc4_dsi_encoder_mode_fixup,
 };
 
+static int vc4_dsi_late_register(struct drm_encoder *encoder)
+{
+	struct drm_device *drm = encoder->dev;
+	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
+	int ret;
+
+	ret = vc4_debugfs_add_regset32(drm->primary, dsi->variant->debugfs_name,
+				       &dsi->regset);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct drm_encoder_funcs vc4_dsi_encoder_funcs = {
+	.late_register = vc4_dsi_late_register,
+};
+
 static const struct vc4_dsi_variant bcm2711_dsi1_variant = {
 	.port			= 1,
 	.debugfs_name		= "dsi1_regs",
@@ -1721,7 +1739,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 
 	ret = drmm_encoder_init(drm, encoder,
-				NULL,
+				&vc4_dsi_encoder_funcs,
 				DRM_MODE_ENCODER_DSI,
 				NULL);
 	if (ret)
@@ -1743,8 +1761,6 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	 */
 	list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
 
-	vc4_debugfs_add_regset32(drm, dsi->variant->debugfs_name, &dsi->regset);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 166d22d62d99..4acc865576f0 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1839,6 +1839,26 @@ static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
 	.mode_valid = vc4_hdmi_encoder_mode_valid,
 };
 
+static int vc4_hdmi_late_register(struct drm_encoder *encoder)
+{
+	struct drm_device *drm = encoder->dev;
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	const struct vc4_hdmi_variant *variant = vc4_hdmi->variant;
+	int ret;
+
+	ret = vc4_debugfs_add_file(drm->primary, variant->debugfs_name,
+				   vc4_hdmi_debugfs_regs,
+				   vc4_hdmi);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct drm_encoder_funcs vc4_hdmi_encoder_funcs = {
+	.late_register = vc4_hdmi_late_register,
+};
+
 static u32 vc4_hdmi_channel_map(struct vc4_hdmi *vc4_hdmi, u32 channel_mask)
 {
 	int i;
@@ -3335,7 +3355,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	ret = drmm_encoder_init(drm, encoder,
-				NULL,
+				&vc4_hdmi_encoder_funcs,
 				DRM_MODE_ENCODER_TMDS,
 				NULL);
 	if (ret)
@@ -3359,10 +3379,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		goto err_put_runtime_pm;
 
-	vc4_debugfs_add_file(drm, variant->debugfs_name,
-			     vc4_hdmi_debugfs_regs,
-			     vc4_hdmi);
-
 	pm_runtime_put_sync(dev);
 
 	return 0;
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index a62f222255ce..9e823e0de197 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -733,6 +733,39 @@ static irqreturn_t vc4_hvs_irq_handler(int irq, void *data)
 	return irqret;
 }
 
+int vc4_hvs_debugfs_init(struct drm_minor *minor)
+{
+	struct drm_device *drm = minor->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
+	struct vc4_hvs *hvs = vc4->hvs;
+	int ret;
+
+	if (!vc4->hvs)
+		return -ENODEV;
+
+	if (!vc4->is_vc5)
+		debugfs_create_bool("hvs_load_tracker", S_IRUGO | S_IWUSR,
+				    minor->debugfs_root,
+				    &vc4->load_tracker_enabled);
+
+	ret = vc4_debugfs_add_file(minor, "hvs_dlists",
+				   vc4_hvs_debugfs_dlist, NULL);
+	if (ret)
+		return ret;
+
+	ret = vc4_debugfs_add_file(minor, "hvs_underrun",
+				   vc4_hvs_debugfs_underrun, NULL);
+	if (ret)
+		return ret;
+
+	ret = vc4_debugfs_add_regset32(minor, "hvs_regs",
+				       &hvs->regset);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -858,12 +891,6 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	vc4_debugfs_add_regset32(drm, "hvs_regs", &hvs->regset);
-	vc4_debugfs_add_file(drm, "hvs_underrun", vc4_hvs_debugfs_underrun,
-			     NULL);
-	vc4_debugfs_add_file(drm, "hvs_dlists", vc4_hvs_debugfs_dlist,
-			     NULL);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index f6f61cf5f3f7..913e26dd62d4 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -398,6 +398,7 @@ static const struct drm_crtc_funcs vc4_txp_crtc_funcs = {
 	.atomic_destroy_state	= vc4_crtc_destroy_state,
 	.enable_vblank		= vc4_txp_enable_vblank,
 	.disable_vblank		= vc4_txp_disable_vblank,
+	.late_register		= vc4_crtc_late_register,
 };
 
 static int vc4_txp_atomic_check(struct drm_crtc *crtc,
@@ -541,8 +542,6 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 
 	dev_set_drvdata(dev, txp);
 
-	vc4_debugfs_add_regset32(drm, "txp_regs", &vc4_crtc->regset);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index cc714dcfe1f2..e7990bed0a96 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -401,6 +401,28 @@ static int vc4_v3d_runtime_resume(struct device *dev)
 }
 #endif
 
+int vc4_v3d_debugfs_init(struct drm_minor *minor)
+{
+	struct drm_device *drm = minor->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
+	struct vc4_v3d *v3d = vc4->v3d;
+	int ret;
+
+	if (!vc4->v3d)
+		return -ENODEV;
+
+	ret = vc4_debugfs_add_file(minor, "v3d_ident",
+				   vc4_v3d_debugfs_ident, NULL);
+	if (ret)
+		return ret;
+
+	ret = vc4_debugfs_add_regset32(minor, "v3d_regs", &v3d->regset);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -477,9 +499,6 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
 	pm_runtime_set_autosuspend_delay(dev, 40); /* a little over 2 frames. */
 	pm_runtime_enable(dev);
 
-	vc4_debugfs_add_file(drm, "v3d_ident", vc4_v3d_debugfs_ident, NULL);
-	vc4_debugfs_add_regset32(drm, "v3d_regs", &v3d->regset);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index d356ffa52866..4a788c1c9058 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -523,6 +523,24 @@ static const struct drm_encoder_helper_funcs vc4_vec_encoder_helper_funcs = {
 	.atomic_mode_set = vc4_vec_encoder_atomic_mode_set,
 };
 
+static int vc4_vec_late_register(struct drm_encoder *encoder)
+{
+	struct drm_device *drm = encoder->dev;
+	struct vc4_vec *vec = encoder_to_vc4_vec(encoder);
+	int ret;
+
+	ret = vc4_debugfs_add_regset32(drm->primary, "vec_regs",
+				       &vec->regset);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct drm_encoder_funcs vc4_vec_encoder_funcs = {
+	.late_register = vc4_vec_late_register,
+};
+
 static const struct vc4_vec_variant bcm2835_vec_variant = {
 	.dac_config = VEC_DAC_CONFIG_DAC_CTRL(0xc) |
 		      VEC_DAC_CONFIG_DRIVER_CTRL(0xc) |
@@ -588,7 +606,7 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 
 	ret = drmm_encoder_init(drm, &vec->encoder.base,
-				NULL,
+				&vc4_vec_encoder_funcs,
 				DRM_MODE_ENCODER_TVDAC,
 				NULL);
 	if (ret)
@@ -602,8 +620,6 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	dev_set_drvdata(dev, vec);
 
-	vc4_debugfs_add_regset32(drm, "vec_regs", &vec->regset);
-
 	return 0;
 }
 
-- 
2.36.1

