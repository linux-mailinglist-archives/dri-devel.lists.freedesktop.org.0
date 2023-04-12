Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7A36DF902
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 16:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69B310E868;
	Wed, 12 Apr 2023 14:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145B610E858
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:52:19 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s2so7923100wra.7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 07:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681311138; x=1683903138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WWTnrFykzAVsDlg0EqV6AAhjfUnyTRXI0fxN6NfNK94=;
 b=cUacbSJrEvfPJNGj68WjqihVFYl/8HSo1rOH1zejFGPH55SzvJtOZVvprzfcI8QZxp
 CjQgKJ2JOOpVVICAwwIk++7BWXV8bHyA3SC+qXwS9ap4FwR+D2U+aZnCiW/UEPe8tdxz
 VXKBEIZkcTTkPhsw5WYcUMUzn9xFZD891p4tfLanS2ZmRqSAUCzSZMBa7aZ7A8DXfjBo
 ZWBbt45EDTbANnTKnpBmdthgzli2ural5yX9sdXF0g3PbvpKLTGXJUb/m2rlYxblVIp4
 F1ZggzxhUyr8OLg8/aiA/4M+oFXaAPJ7spr5l0LSvpgalG8VMR9J7+MWNZMk/1f7Bb98
 8org==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681311138; x=1683903138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WWTnrFykzAVsDlg0EqV6AAhjfUnyTRXI0fxN6NfNK94=;
 b=Co23CvrozNMv4JEU9mU/mTg09CzORjJbQG1xvyuhWYCgxmxHcXW5boeJMh1nkVEPSp
 gsVHSreVgYlE5vbKYYSIJyUcujaEuABl2aGixsS+j7na+61S7QxEUfWFIxtDZnLryTgO
 sP6gLQgRcaXw1hURzc9osE7y7UOH/6l0KQrOrUv9IeVPWs3yDkwyJZIQUKsGhox2aECm
 cjK+wfnMlqukpIi5bfcnCibfd2L7VTJcsWd6o3rG+ykwWiRs3Le/8zc8ousn2J3nD+pt
 uosCyQUA/zUTpcfr34Jl+070O08tUisi0Q/Mbd3LP5okoDnoeOj0qlZFwDSrdakQ0EAb
 gTRA==
X-Gm-Message-State: AAQBX9dwAH8gIJkrrhX2K3o0Uj1TheRI5ChAE1v3nudEVjE3//AVnMAM
 j7vVD0OIabAX+C4EBl6IGzE=
X-Google-Smtp-Source: AKy350ZcGru6uJNYCZ9S3+6L3N05uFljdsgdDxyfnwSpp6n7bPOeTnqMN8wGmIBbsAM2fQuQXo8kww==
X-Received: by 2002:a5d:5510:0:b0:2ce:9877:84ae with SMTP id
 b16-20020a5d5510000000b002ce987784aemr13199048wrv.16.1681311138302; 
 Wed, 12 Apr 2023 07:52:18 -0700 (PDT)
Received: from able.fritz.box (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 e18-20020adfe392000000b002c56013c07fsm17304166wrm.109.2023.04.12.07.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 07:52:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: mcanal@igalia.com, stanislaw.gruszka@linux.intel.com, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 mwen@igalia.com, maxime@cerno.tech, wambui.karugax@gmail.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/debugfs: rework drm_debugfs_create_files
 implementation
Date: Wed, 12 Apr 2023 16:52:05 +0200
Message-Id: <20230412145206.2483-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412145206.2483-1-christian.koenig@amd.com>
References: <20230412145206.2483-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use managed memory allocation for this. That allows us to not keep
track of all the files any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/accel/drm_accel.c      |  2 -
 drivers/gpu/drm/drm_debugfs.c  | 75 +++++++++-------------------------
 drivers/gpu/drm/drm_drv.c      |  2 -
 drivers/gpu/drm/drm_internal.h |  5 ---
 drivers/gpu/drm/tegra/dc.c     |  9 +++-
 drivers/gpu/drm/tegra/dsi.c    |  1 +
 drivers/gpu/drm/tegra/hdmi.c   |  3 +-
 drivers/gpu/drm/tegra/sor.c    |  1 +
 include/drm/drm_debugfs.h      |  4 +-
 include/drm/drm_file.h         |  4 --
 10 files changed, 34 insertions(+), 72 deletions(-)

diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
index e28fb64cbd5e..82c54bc2dcad 100644
--- a/drivers/accel/drm_accel.c
+++ b/drivers/accel/drm_accel.c
@@ -100,8 +100,6 @@ void accel_debugfs_register(struct drm_device *dev)
 {
 	struct drm_minor *minor = dev->accel;
 
-	INIT_LIST_HEAD(&minor->debugfs_list);
-	mutex_init(&minor->debugfs_lock);
 	minor->debugfs_root = dev->debugfs_root;
 
 	drm_debugfs_create_files(accel_debugfs_list, ACCEL_DEBUGFS_ENTRIES,
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 427c5eb4eca0..c8e2d4f9f00d 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -201,7 +201,7 @@ void drm_debugfs_create_files(const struct drm_info_list *files, int count,
 		if (features && !drm_core_check_all_features(dev, features))
 			continue;
 
-		tmp = kmalloc(sizeof(struct drm_info_node), GFP_KERNEL);
+		tmp = drmm_kzalloc(dev, sizeof(*tmp), GFP_KERNEL);
 		if (tmp == NULL)
 			continue;
 
@@ -210,14 +210,28 @@ void drm_debugfs_create_files(const struct drm_info_list *files, int count,
 						0444, root, tmp,
 						&drm_debugfs_fops);
 		tmp->info_ent = &files[i];
-
-		mutex_lock(&minor->debugfs_lock);
-		list_add(&tmp->list, &minor->debugfs_list);
-		mutex_unlock(&minor->debugfs_lock);
 	}
 }
 EXPORT_SYMBOL(drm_debugfs_create_files);
 
+int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
+			     struct dentry *root, struct drm_minor *minor)
+{
+	int i;
+
+	for (i = 0; i < count; i++) {
+		struct dentry *dent = debugfs_lookup(files[i].name, root);
+
+		if (!dent)
+			continue;
+
+		drmm_kfree(minor->dev, d_inode(dent)->i_private);
+		debugfs_remove(dent);
+	}
+	return 0;
+}
+EXPORT_SYMBOL(drm_debugfs_remove_files);
+
 void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
 {
 	dev->debugfs_root = debugfs_create_dir(dev->unique, root);
@@ -247,11 +261,8 @@ int drm_debugfs_register(struct drm_minor *minor, int minor_id,
 	struct drm_device *dev = minor->dev;
 	char name[64];
 
-	INIT_LIST_HEAD(&minor->debugfs_list);
-	mutex_init(&minor->debugfs_lock);
 	sprintf(name, "%d", minor_id);
-	minor->debugfs_symlink = debugfs_create_symlink(name, root,
-							dev->unique);
+	debugfs_create_symlink(name, root, dev->unique);
 
 	/* TODO: Only for compatibility with drivers */
 	minor->debugfs_root = dev->debugfs_root;
@@ -262,52 +273,6 @@ int drm_debugfs_register(struct drm_minor *minor, int minor_id,
 	return 0;
 }
 
-int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
-			     struct drm_minor *minor)
-{
-	struct list_head *pos, *q;
-	struct drm_info_node *tmp;
-	int i;
-
-	mutex_lock(&minor->debugfs_lock);
-	for (i = 0; i < count; i++) {
-		list_for_each_safe(pos, q, &minor->debugfs_list) {
-			tmp = list_entry(pos, struct drm_info_node, list);
-			if (tmp->info_ent == &files[i]) {
-				debugfs_remove(tmp->dent);
-				list_del(pos);
-				kfree(tmp);
-			}
-		}
-	}
-	mutex_unlock(&minor->debugfs_lock);
-	return 0;
-}
-EXPORT_SYMBOL(drm_debugfs_remove_files);
-
-static void drm_debugfs_remove_all_files(struct drm_minor *minor)
-{
-	struct drm_info_node *node, *tmp;
-
-	mutex_lock(&minor->debugfs_lock);
-	list_for_each_entry_safe(node, tmp, &minor->debugfs_list, list) {
-		debugfs_remove(node->dent);
-		list_del(&node->list);
-		kfree(node);
-	}
-	mutex_unlock(&minor->debugfs_lock);
-}
-
-void drm_debugfs_cleanup(struct drm_minor *minor)
-{
-	if (!minor->debugfs_symlink)
-		return;
-
-	drm_debugfs_remove_all_files(minor);
-	debugfs_remove(minor->debugfs_symlink);
-	minor->debugfs_symlink = NULL;
-}
-
 /**
  * drm_debugfs_add_file - Add a given file to the DRM device debugfs file list
  * @dev: drm device for the ioctl
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index f928b4490ece..9466349769fa 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -198,7 +198,6 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 	return 0;
 
 err_debugfs:
-	drm_debugfs_cleanup(minor);
 	return ret;
 }
 
@@ -222,7 +221,6 @@ static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
 
 	device_del(minor->kdev);
 	dev_set_drvdata(minor->kdev, NULL); /* safety belt */
-	drm_debugfs_cleanup(minor);
 }
 
 /*
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index c5fadbd3fd7d..fb2d6601cba8 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -184,7 +184,6 @@ void drm_debugfs_dev_fini(struct drm_device *dev);
 void drm_debugfs_dev_register(struct drm_device *dev);
 int drm_debugfs_register(struct drm_minor *minor, int minor_id,
 			 struct dentry *root);
-void drm_debugfs_cleanup(struct drm_minor *minor);
 void drm_debugfs_connector_add(struct drm_connector *connector);
 void drm_debugfs_connector_remove(struct drm_connector *connector);
 void drm_debugfs_crtc_add(struct drm_crtc *crtc);
@@ -201,10 +200,6 @@ static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id,
 	return 0;
 }
 
-static inline void drm_debugfs_cleanup(struct drm_minor *minor)
-{
-}
-
 static inline void drm_debugfs_connector_add(struct drm_connector *connector)
 {
 }
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index a67453cee883..e53d1b88dc99 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1745,8 +1745,15 @@ static void tegra_dc_early_unregister(struct drm_crtc *crtc)
 	unsigned int count = ARRAY_SIZE(debugfs_files);
 	struct drm_minor *minor = crtc->dev->primary;
 	struct tegra_dc *dc = to_tegra_dc(crtc);
+	struct dentry *root;
+
+#ifdef CONFIG_DEBUG_FS
+	root = crtc->debugfs_entry;
+#else
+	root = NULL;
+#endif
 
-	drm_debugfs_remove_files(dc->debugfs_files, count, minor);
+	drm_debugfs_remove_files(dc->debugfs_files, count, root, minor);
 	kfree(dc->debugfs_files);
 	dc->debugfs_files = NULL;
 }
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index de1333dc0d86..90c6782a663c 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -256,6 +256,7 @@ static void tegra_dsi_early_unregister(struct drm_connector *connector)
 	struct tegra_dsi *dsi = to_dsi(output);
 
 	drm_debugfs_remove_files(dsi->debugfs_files, count,
+				 connector->debugfs_entry,
 				 connector->dev->primary);
 	kfree(dsi->debugfs_files);
 	dsi->debugfs_files = NULL;
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 40ec3e6cf204..53387aa8b147 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1114,7 +1114,8 @@ static void tegra_hdmi_early_unregister(struct drm_connector *connector)
 	unsigned int count = ARRAY_SIZE(debugfs_files);
 	struct tegra_hdmi *hdmi = to_hdmi(output);
 
-	drm_debugfs_remove_files(hdmi->debugfs_files, count, minor);
+	drm_debugfs_remove_files(hdmi->debugfs_files, count,
+				 connector->debugfs_entry, minor);
 	kfree(hdmi->debugfs_files);
 	hdmi->debugfs_files = NULL;
 }
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 34af6724914f..0ca7a52030e5 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1707,6 +1707,7 @@ static void tegra_sor_early_unregister(struct drm_connector *connector)
 	struct tegra_sor *sor = to_sor(output);
 
 	drm_debugfs_remove_files(sor->debugfs_files, count,
+				 connector->debugfs_entry,
 				 connector->dev->primary);
 	kfree(sor->debugfs_files);
 	sor->debugfs_files = NULL;
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index 7616f457ce70..84ee27dc2317 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -126,8 +126,8 @@ struct drm_debugfs_entry {
 void drm_debugfs_create_files(const struct drm_info_list *files,
 			      int count, struct dentry *root,
 			      struct drm_minor *minor);
-int drm_debugfs_remove_files(const struct drm_info_list *files,
-			     int count, struct drm_minor *minor);
+int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
+			     struct dentry *root, struct drm_minor *minor);
 
 void drm_debugfs_add_file(struct drm_device *dev, const char *name,
 			  int (*show)(struct seq_file*, void*), void *data);
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 1fe08fcaa149..e687ce27624e 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -78,11 +78,7 @@ struct drm_minor {
 	struct device *kdev;		/* Linux device */
 	struct drm_device *dev;
 
-	struct dentry *debugfs_symlink;
 	struct dentry *debugfs_root;
-
-	struct list_head debugfs_list;
-	struct mutex debugfs_lock; /* Protects debugfs_list. */
 };
 
 /**
-- 
2.34.1

