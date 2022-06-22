Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0570C554D6C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3F31133B5;
	Wed, 22 Jun 2022 14:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C531133B7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:35:33 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id E831532009B6;
 Wed, 22 Jun 2022 10:35:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 10:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908531; x=1655994931; bh=D3
 b3KrP9jcMbGz09A3FgbwNafb0r9G5mOxwokbK9DHk=; b=unwvBb2kHipzVDO7/m
 DnWMTEYG/lZICLVkFmJLuVvB+DffbmGLAgd9QReioB+R+Za1lGQ3HV1ohsVC5OAW
 dcJpB2yGDy9b2HTxnu9PaLpSsk4lDEXNtlRN90rpfdq8CG0lk8vhWYwdu2sc8rlv
 ZglgKCksC5bj1L8C3XWdxTDKyXsO6AZpx7Wgjtmfmd5+r9/1I5X5WxV8geTnR1UD
 BswUWOcrOgBZLnehgJqnkAYGUQaqdJULqPyeBkruN8tFTYuClojOMumNXYxjELqd
 1nL2MoyPA2Fb1+QiD1lkH2lyd0yo/OUSm71JBgRM8xR0wgJoozNS1thg3R9ueTaW
 8UXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908531; x=1655994931; bh=D3b3KrP9jcMbG
 z09A3FgbwNafb0r9G5mOxwokbK9DHk=; b=EZu7CjbW11x6WqwnWlCq+Wrz82/54
 7EvDE4ZlJSRiopoUHahwMZ9wX7YBw0QGQ4zbH53H5Row/RLvUnS3Pvzawwu2Auun
 0ehvlH4dV2l2afdpAU/AOS+CQxjwBo7yZLRNoiq2JZHhwZGJxvWBUPUs7izbd+Rb
 eDXLm66f351R+KmOeTBnRq/98pAPk7zN+gidk6jVqxuAxFAW6KaMDv9ogMz6Rqso
 9TmJ4vMQRRknjdpAxl+UBQ9OeRZ7e2alcXX6fU3T3CAOg23i3oZz9fwqwm+C976Q
 2cfTzggciIFWw8DAS+7ER1CRK3RiCQQfN2FQvqaWX1u/VW+4JjNh3+mBQ==
X-ME-Sender: <xms:syizYkuGR_YYSyKOLfN5VFfjiCkiew1ShAVtcvGGKeu5zIc7iVtyUQ>
 <xme:syizYhesNT6Rf2cyxNo5HWtFsW9ltgLrHVe4hYYKEhJatSYao7uKWgtNejbwY9_Ke
 7AqwEBGmO-t2FOc2JQ>
X-ME-Received: <xmr:syizYvxHC0SveYv8x03KILRQLznHYyS_9CAXLPQWMIT6b65zK6CVhXCBvZNsMFfdnitSpVgzdqrd4hZ7YCECn_K16aO5yxaGGD7AdoU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduieenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:syizYnN6rUQxVE_Vx73rNoBLXM4C0CJN4dn-G7hh3ghslNKe7xycMg>
 <xmx:syizYk85KPLPkC2IVZ51RlgRhRMH7180vpCHPliycvLJ9q0Q9mT1UA>
 <xmx:syizYvX8VxbXzE082mNI2jniHKxPLSDJOPwTXKuqx81JzQZwIMfnVg>
 <xmx:syizYob2x-dMkfX8AH1tzvfe-qTudUHfF8wbmz-Bn8ijrtMipXpXkg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:35:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 63/68] drm/vc4: debugfs: Simplify debugfs registration
Date: Wed, 22 Jun 2022 16:32:04 +0200
Message-Id: <20220622143209.600298-64-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_hvs.c     | 32 +++++++++++++++++---
 drivers/gpu/drm/vc4/vc4_txp.c     |  3 +-
 drivers/gpu/drm/vc4/vc4_v3d.c     | 25 ++++++++++++++--
 drivers/gpu/drm/vc4/vc4_vec.c     | 22 ++++++++++++--
 11 files changed, 185 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index b8d856312846..19807e4e0c55 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -982,6 +982,23 @@ int vc4_get_tiling_ioctl(struct drm_device *dev, void *data,
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
@@ -1006,9 +1023,6 @@ int vc4_bo_cache_init(struct drm_device *dev)
 		vc4->bo_labels[i].name = bo_type_names[i];
 
 	mutex_init(&vc4->bo_lock);
-
-	vc4_debugfs_add_file(dev, "bo_stats", vc4_bo_stats_debugfs, NULL);
-
 	INIT_LIST_HEAD(&vc4->bo_cache.time_list);
 
 	INIT_WORK(&vc4->bo_cache.time_work, vc4_bo_cache_time_work);
diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 851e4a470939..59bdb308252a 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1047,6 +1047,21 @@ void vc4_crtc_reset(struct drm_crtc *crtc)
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
@@ -1059,6 +1074,7 @@ static const struct drm_crtc_funcs vc4_crtc_funcs = {
 	.enable_vblank = vc4_enable_vblank,
 	.disable_vblank = vc4_disable_vblank,
 	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
+	.late_register = vc4_crtc_late_register,
 };
 
 static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
@@ -1313,9 +1329,6 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 
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
index 75b4ea3ab7e3..0445357597f0 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -224,6 +224,23 @@ static const struct drm_encoder_helper_funcs vc4_dpi_encoder_helper_funcs = {
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
@@ -312,7 +329,7 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 
 	ret = drmm_encoder_init(drm, &dpi->encoder.base,
-				NULL,
+				&vc4_dpi_encoder_funcs,
 				DRM_MODE_ENCODER_DPI,
 				NULL);
 	if (ret)
@@ -326,8 +343,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 
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
index 1157bf549633..7aa9b47b2eb2 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1314,6 +1314,24 @@ static const struct drm_encoder_helper_funcs vc4_dsi_encoder_helper_funcs = {
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
@@ -1627,7 +1645,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 
 	ret = drmm_encoder_init(drm, encoder,
-				NULL,
+				&vc4_dsi_encoder_funcs,
 				DRM_MODE_ENCODER_DSI,
 				NULL);
 	if (ret)
@@ -1649,8 +1667,6 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	 */
 	list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
 
-	vc4_debugfs_add_regset32(drm, dsi->variant->debugfs_name, &dsi->regset);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 85686a8eb49e..ef46dc34316a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1801,6 +1801,26 @@ static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
 	.enable = vc4_hdmi_encoder_enable,
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
@@ -3269,7 +3289,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	ret = drmm_encoder_init(drm, encoder,
-				NULL,
+				&vc4_hdmi_encoder_funcs,
 				DRM_MODE_ENCODER_TMDS,
 				NULL);
 	if (ret)
@@ -3293,10 +3313,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		goto err_put_runtime_pm;
 
-	vc4_debugfs_add_file(drm, variant->debugfs_name,
-			     vc4_hdmi_debugfs_regs,
-			     vc4_hdmi);
-
 	pm_runtime_put_sync(dev);
 
 	return 0;
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 1994136a377e..4454009ef09f 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -693,6 +693,34 @@ static irqreturn_t vc4_hvs_irq_handler(int irq, void *data)
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
@@ -818,10 +846,6 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	vc4_debugfs_add_regset32(drm, "hvs_regs", &hvs->regset);
-	vc4_debugfs_add_file(drm, "hvs_underrun", vc4_hvs_debugfs_underrun,
-			     NULL);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 0748e3f6d40f..7a4f0d8c1549 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -397,6 +397,7 @@ static const struct drm_crtc_funcs vc4_txp_crtc_funcs = {
 	.atomic_destroy_state	= vc4_crtc_destroy_state,
 	.enable_vblank		= vc4_txp_enable_vblank,
 	.disable_vblank		= vc4_txp_disable_vblank,
+	.late_register		= vc4_crtc_late_register,
 };
 
 static int vc4_txp_atomic_check(struct drm_crtc *crtc,
@@ -540,8 +541,6 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 
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
index 7e02fbad3208..4502a83ad16f 100644
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

