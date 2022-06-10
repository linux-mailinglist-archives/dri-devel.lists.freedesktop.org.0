Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80961546268
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A7312B614;
	Fri, 10 Jun 2022 09:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE1F12B227
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:31:11 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 51AEB5C0121;
 Fri, 10 Jun 2022 05:31:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 10 Jun 2022 05:31:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853471; x=1654939871; bh=Ps
 Obuuka2kvI6zZAXmyvQp7+7hi1Y5M+KwkJPXpBm1E=; b=iiyeHKFPe4QWwo2qVH
 4IjmeCu069vCpVTHvIsRmppDDTKCN1bB5jGg3orF8qmojwrEXvAvDOkLhpyaOe9M
 a7gJBt7qbz4PI74A09brLS/+zHL+upvYO0xYkeOeDh0fWFadSjduXS1T+XLeBPXW
 OAkWkNmxe35/C4UAEUXiNSXjiaZAJUhxWkyxz2Kgm4rLD0G4i/qUQfuvgXWh9EoQ
 aPkQyXzPIoQB20OEd2/BKnhLC96avFxNyxkERpgMEgalF/AgX33WfIdNfynksaty
 cNLWvg98Q1sx/Y2YAgtitpbVHbZyjcMhSbIdXJfNgowzGgBgVR+PzFPFAOJAYP6B
 Zcgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853471; x=1654939871; bh=PsObuuka2kvI6
 zZAXmyvQp7+7hi1Y5M+KwkJPXpBm1E=; b=v1pVOUkHptBm9ACQ1b87RnXLYGdpS
 dgTe/CBdbbkwh9SUsRaQrCrsDOLLP/z8TvPfzcui2sErCMhJWovg6o0gblIyiQEQ
 12WZJ4+MwMP1zrl6ap+Nm9UHea2I9p9Ba4NSzu8fWvRf2nKsQmTinBHJAxN070nh
 SsZjnQcDjxbVQ53O1YyTmGBnkEQIi2SUC8ycJxim09TjzxLH/K4D2Q3+xVRuXPSZ
 BO6iyotF+8xq29uQAiJSiPNsjIXao9VuEKF8SoJgieTKZFBZJzpa1vqoLmGK/n0l
 zEvfkgEi/k0nwpKy5eruTbfXxcC/34u2sEborPk2k7lqE7rZSrdPtgMgg==
X-ME-Sender: <xms:Xw-jYuOrkzsAMi2k1RBgudaQiAvmhkORl9BgxVEMPF1kVZ3l6X6oCA>
 <xme:Xw-jYs89iKHRSoddWsynhudvke25AXHkevhLO9NNZLrNerQmdPEvKYycCAecyP2g5
 gWB0sL_eHZey8zjbdM>
X-ME-Received: <xmr:Xw-jYlSjvqLL7cTOLKbFA5bDVFFQfsOY58Y7XcldLlSoBkKWYP83aFd4VLl7DqgaT19di4F74ebpvojx8YdJprX0ELrm1RrBDUScDGE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedugeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Xw-jYutuPEAnTFTZp888Z_X1lF5B9i93h-2FjyJMyScXBXr4J0PYjQ>
 <xmx:Xw-jYmcgSuxNT9rmqGMQ98QMmPt-DLt5Ae0uggjPIe3ZQVK46wyl_A>
 <xmx:Xw-jYi3yhuaRnIr7ePXI8Mv8S2vvwY3REaCKhCQPl4JY-NOekHhrgQ>
 <xmx:Xw-jYl7yk_30TyIFd9vpE8a0JtjIYGkEMkn054nmhj5iobqH3NAuTw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:31:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 59/64] drm/vc4: debugfs: Simplify debugfs registration
Date: Fri, 10 Jun 2022 11:29:19 +0200
Message-Id: <20220610092924.754942-60-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_dpi.c     | 24 +++++++++++++--
 drivers/gpu/drm/vc4/vc4_drv.h     | 12 +++++---
 drivers/gpu/drm/vc4/vc4_dsi.c     | 23 ++++++++++++--
 drivers/gpu/drm/vc4/vc4_hdmi.c    | 45 ++++++++++++++++++++--------
 drivers/gpu/drm/vc4/vc4_hdmi.h    |  3 +-
 drivers/gpu/drm/vc4/vc4_hvs.c     | 32 +++++++++++++++++---
 drivers/gpu/drm/vc4/vc4_txp.c     |  3 +-
 drivers/gpu/drm/vc4/vc4_v3d.c     | 25 ++++++++++++++--
 drivers/gpu/drm/vc4/vc4_vec.c     | 25 ++++++++++++++--
 12 files changed, 206 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 49c0f2ac868b..68fe9903947d 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -942,6 +942,23 @@ int vc4_get_tiling_ioctl(struct drm_device *dev, void *data,
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
@@ -963,9 +980,6 @@ int vc4_bo_cache_init(struct drm_device *dev)
 		vc4->bo_labels[i].name = bo_type_names[i];
 
 	mutex_init(&vc4->bo_lock);
-
-	vc4_debugfs_add_file(dev, "bo_stats", vc4_bo_stats_debugfs, NULL);
-
 	INIT_LIST_HEAD(&vc4->bo_cache.time_list);
 
 	INIT_WORK(&vc4->bo_cache.time_work, vc4_bo_cache_time_work);
diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 24de4706b61a..4a9f68362137 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -946,6 +946,21 @@ void vc4_crtc_reset(struct drm_crtc *crtc)
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
@@ -958,6 +973,7 @@ static const struct drm_crtc_funcs vc4_crtc_funcs = {
 	.enable_vblank = vc4_enable_vblank,
 	.disable_vblank = vc4_disable_vblank,
 	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
+	.late_register = vc4_crtc_late_register,
 };
 
 static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
@@ -1212,9 +1228,6 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 
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
index ea3d20651f43..0445357597f0 100644
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
@@ -311,7 +328,10 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	ret = drmm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
+	ret = drmm_encoder_init(drm, &dpi->encoder.base,
+				&vc4_dpi_encoder_funcs,
+				DRM_MODE_ENCODER_DPI,
+				NULL);
 	if (ret)
 		return ret;
 
@@ -323,8 +343,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 
 	dev_set_drvdata(dev, dpi);
 
-	vc4_debugfs_add_regset32(drm, "dpi_regs", &dpi->regset);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 3d1482f414c8..ccde56be3a9c 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -835,6 +835,7 @@ int vc4_bo_inc_usecnt(struct vc4_bo *bo);
 void vc4_bo_dec_usecnt(struct vc4_bo *bo);
 void vc4_bo_add_to_purgeable_pool(struct vc4_bo *bo);
 void vc4_bo_remove_from_purgeable_pool(struct vc4_bo *bo);
+int vc4_bo_debugfs_init(struct drm_minor *minor);
 
 /* vc4_crtc.c */
 extern struct platform_driver vc4_crtc_driver;
@@ -852,6 +853,7 @@ void vc4_crtc_destroy_state(struct drm_crtc *crtc,
 			    struct drm_crtc_state *state);
 void vc4_crtc_reset(struct drm_crtc *crtc);
 void vc4_crtc_handle_vblank(struct vc4_crtc *crtc);
+int vc4_crtc_late_register(struct drm_crtc *crtc);
 void vc4_crtc_get_margins(struct drm_crtc_state *state,
 			  unsigned int *left, unsigned int *right,
 			  unsigned int *top, unsigned int *bottom);
@@ -859,15 +861,15 @@ void vc4_crtc_get_margins(struct drm_crtc_state *state,
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
@@ -875,7 +877,7 @@ static inline int vc4_debugfs_add_file(struct drm_device *drm,
 	return 0;
 }
 
-static inline int vc4_debugfs_add_regset32(struct drm_device *drm,
+static inline int vc4_debugfs_add_regset32(struct drm_minor *minor,
 					   const char *filename,
 					   struct debugfs_regset32 *regset)
 {
@@ -944,6 +946,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
 void vc4_hvs_dump_state(struct vc4_hvs *hvs);
 void vc4_hvs_unmask_underrun(struct vc4_hvs *hvs, int channel);
 void vc4_hvs_mask_underrun(struct vc4_hvs *hvs, int channel);
+int vc4_hvs_debugfs_init(struct drm_minor *minor);
 
 /* vc4_kms.c */
 int vc4_kms_load(struct drm_device *dev);
@@ -966,6 +969,7 @@ int vc4_v3d_bin_bo_get(struct vc4_dev *vc4, bool *used);
 void vc4_v3d_bin_bo_put(struct vc4_dev *vc4);
 int vc4_v3d_pm_get(struct vc4_dev *vc4);
 void vc4_v3d_pm_put(struct vc4_dev *vc4);
+int vc4_v3d_debugfs_init(struct drm_minor *minor);
 
 /* vc4_validate.c */
 int
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 741db2dce8ab..77afbdfac897 100644
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
@@ -1616,7 +1634,8 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	ret = drmm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_DSI);
+	ret = drmm_encoder_init(drm, encoder, &vc4_dsi_encoder_funcs,
+				DRM_MODE_ENCODER_DSI, NULL);
 	if (ret)
 		return ret;
 
@@ -1636,8 +1655,6 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	 */
 	list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
 
-	vc4_debugfs_add_regset32(drm, dsi->variant->debugfs_name, &dsi->regset);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b31487547070..2092231001c8 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1793,6 +1793,26 @@ static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
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
@@ -2922,11 +2942,11 @@ static void vc4_hdmi_free_regset(struct drm_device *drm, void *ptr)
 	kfree(regs);
 }
 
-static int vc4_hdmi_build_regset(struct vc4_hdmi *vc4_hdmi,
+static int vc4_hdmi_build_regset(struct drm_device *drm,
+				 struct vc4_hdmi *vc4_hdmi,
 				 struct debugfs_regset32 *regset,
 				 enum vc4_hdmi_regs reg)
 {
-	struct drm_device *drm = vc4_hdmi->connector.dev;
 	const struct vc4_hdmi_variant *variant = vc4_hdmi->variant;
 	struct debugfs_reg32 *regs, *new_regs;
 	unsigned int count = 0;
@@ -2964,7 +2984,8 @@ static int vc4_hdmi_build_regset(struct vc4_hdmi *vc4_hdmi,
 	return 0;
 }
 
-static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
+static int vc4_hdmi_init_resources(struct drm_device *drm,
+				   struct vc4_hdmi *vc4_hdmi)
 {
 	struct platform_device *pdev = vc4_hdmi->pdev;
 	struct device *dev = &pdev->dev;
@@ -2978,11 +2999,11 @@ static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 	if (IS_ERR(vc4_hdmi->hd_regs))
 		return PTR_ERR(vc4_hdmi->hd_regs);
 
-	ret = vc4_hdmi_build_regset(vc4_hdmi, &vc4_hdmi->hd_regset, VC4_HD);
+	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->hd_regset, VC4_HD);
 	if (ret)
 		return ret;
 
-	ret = vc4_hdmi_build_regset(vc4_hdmi, &vc4_hdmi->hdmi_regset, VC4_HDMI);
+	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->hdmi_regset, VC4_HDMI);
 	if (ret)
 		return ret;
 
@@ -3005,7 +3026,8 @@ static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 	return 0;
 }
 
-static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
+static int vc5_hdmi_init_resources(struct drm_device *drm,
+				   struct vc4_hdmi *vc4_hdmi)
 {
 	struct platform_device *pdev = vc4_hdmi->pdev;
 	struct device *dev = &pdev->dev;
@@ -3175,7 +3197,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (variant->max_pixel_clock > HDMI_14_MAX_TMDS_CLK)
 		vc4_hdmi->scdc_enabled = true;
 
-	ret = variant->init_resources(vc4_hdmi);
+	ret = variant->init_resources(drm, vc4_hdmi);
 	if (ret)
 		return ret;
 
@@ -3243,7 +3265,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 		clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
 	}
 
-	ret = drmm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
+	ret = drmm_encoder_init(drm, encoder,
+				&vc4_hdmi_encoder_funcs,
+				DRM_MODE_ENCODER_TMDS,
+				NULL);
 	if (ret)
 		goto err_put_runtime_pm;
 
@@ -3265,10 +3290,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		goto err_put_runtime_pm;
 
-	vc4_debugfs_add_file(drm, variant->debugfs_name,
-			     vc4_hdmi_debugfs_regs,
-			     vc4_hdmi);
-
 	pm_runtime_put_sync(dev);
 
 	return 0;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 51b27dcdcd9b..f6be92f33383 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -58,7 +58,8 @@ struct vc4_hdmi_variant {
 	/* Callback to get the resources (memory region, interrupts,
 	 * clocks, etc) for that variant.
 	 */
-	int (*init_resources)(struct vc4_hdmi *vc4_hdmi);
+	int (*init_resources)(struct drm_device *drm,
+			      struct vc4_hdmi *vc4_hdmi);
 
 	/* Callback to reset the HDMI block */
 	void (*reset)(struct vc4_hdmi *vc4_hdmi);
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index b0906bb96c32..f336ada6c84c 100644
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
+	if (!hvs->hvs5)
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
@@ -821,10 +849,6 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	vc4_debugfs_add_regset32(drm, "hvs_regs", &hvs->regset);
-	vc4_debugfs_add_file(drm, "hvs_underrun", vc4_hvs_debugfs_underrun,
-			     NULL);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index fee00b7003ab..19d3cfac40f2 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -396,6 +396,7 @@ static const struct drm_crtc_funcs vc4_txp_crtc_funcs = {
 	.atomic_destroy_state	= vc4_crtc_destroy_state,
 	.enable_vblank		= vc4_txp_enable_vblank,
 	.disable_vblank		= vc4_txp_disable_vblank,
+	.late_register		= vc4_crtc_late_register,
 };
 
 static int vc4_txp_atomic_check(struct drm_crtc *crtc,
@@ -538,8 +539,6 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 
 	dev_set_drvdata(dev, txp);
 
-	vc4_debugfs_add_regset32(drm, "txp_regs", &vc4_crtc->regset);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 7bb3067f8425..8fd16ece5b5c 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -386,6 +386,28 @@ static int vc4_v3d_runtime_resume(struct device *dev)
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
@@ -462,9 +484,6 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
 	pm_runtime_set_autosuspend_delay(dev, 40); /* a little over 2 frames. */
 	pm_runtime_enable(dev);
 
-	vc4_debugfs_add_file(drm, "v3d_ident", vc4_v3d_debugfs_ident, NULL);
-	vc4_debugfs_add_regset32(drm, "v3d_regs", &v3d->regset);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index a75b82de3796..4502a83ad16f 100644
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
@@ -587,7 +605,10 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	ret = drmm_simple_encoder_init(drm, &vec->encoder.base, DRM_MODE_ENCODER_TVDAC);
+	ret = drmm_encoder_init(drm, &vec->encoder.base,
+				&vc4_vec_encoder_funcs,
+				DRM_MODE_ENCODER_TVDAC,
+				NULL);
 	if (ret)
 		return ret;
 
@@ -599,8 +620,6 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	dev_set_drvdata(dev, vec);
 
-	vc4_debugfs_add_regset32(drm, "vec_regs", &vec->regset);
-
 	return 0;
 }
 
-- 
2.36.1

