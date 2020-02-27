Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1742171815
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 14:00:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1668E6ECB9;
	Thu, 27 Feb 2020 12:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5816E885
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:02:46 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id m3so3114886wmi.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=peQxcIwm+53AZheiLwWVbUK9WDSs/oWzD+2yvLVaFDQ=;
 b=sSNUPEjUQ4P/FmERt8XhONyzKkRQaD7ZGIwPeYhmN25NcUNbTsckK3pXW/4lpN0nPH
 FIHBTRB51szqJbtG2pxhVutWcyhWABcBWVTMjLF0TvaagvGR9omRwsaz4XE+7EgoQDWA
 lJC6LHBqY8hjtg2VOEuzwIsu5m5Bs7bYwyRTunNjCdvBhN4WV6AOx+DWAnWSEvCLhg8y
 udzF37krHLLtAD2A8QLeK6cBbvuxXOWz+cf5OteaBoh2xQDUnNf+LyRIRHNvnHUOH3Dh
 wIKVRhQIL891JC1j3qCyglBsxuTa+VNPtGldxMkIImoTLurQ8zBOsopSQgY12xnvLU39
 KzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=peQxcIwm+53AZheiLwWVbUK9WDSs/oWzD+2yvLVaFDQ=;
 b=EgVnvIVN7ggYwVV2ULrIf0Ur/fh96K5UdJAhazJjk4GqYjGy3SZHB5MeocdBJYi5qe
 rfzbehWYfCxNMaFFgrCh8BRFs8yCyk3xWlo9PEgm1LZSlNI1w2CgIJfX2/JzqvaeknYs
 NKhRY6x3ZIQS2KYWbEevvuyVELuIkZrCFV6s7Gg6f2zOcwwZCLi2/M3mWuezNYB8DFQe
 /CZPOg4RLiKt7WE6PT3uWiWZctzFsRj6dQ5lMv5ne2U3E3iVJdTlefMrklBMk/3xNYuv
 KI/pB1nbAvN7hIHUtdJcy04i01qXPDwa8KPKkavqA+wO4pfPcLrL2IjRLYRrdsypH01z
 JPkQ==
X-Gm-Message-State: APjAAAWHncOhI5pTYr1FFbf+gwQdIGR67nR5s1zflgSfmsi5G/BP+YwM
 NqbC5DxecDuJlCxLrRzpxI0=
X-Google-Smtp-Source: APXvYqwUpYHhUiPj+1sUDyusbZPVe/8nAXMpyaeuNf1rhtqmIlfapyheEuIWIS8xSNqoryCbmKC7fQ==
X-Received: by 2002:a05:600c:21c4:: with SMTP id
 x4mr5045200wmj.147.1582804964957; 
 Thu, 27 Feb 2020 04:02:44 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:02:44 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH 01/21] drm/debugfs: remove checks for return value of
 drm_debugfs functions.
Date: Thu, 27 Feb 2020 15:02:12 +0300
Message-Id: <20200227120232.19413-2-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200227120232.19413-1-wambui.karugax@gmail.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 12:59:10 +0000
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since 987d65d01356 (drm: debugfs: make drm_debugfs_create_files() never
fail), there is no need to check the return value of
drm_debugfs_create_files(). Therefore, remove remove unnecessary checks
and error handling statement blocks for its return value.

These changes also enable changing drm_debugfs_create_files() to return
void.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/drm_debugfs.c | 49 ++++++++---------------------------
 include/drm/drm_debugfs.h     |  6 ++---
 2 files changed, 14 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 4e673d318503..d77d2bdcfb2d 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -172,8 +172,8 @@ static const struct file_operations drm_debugfs_fops = {
  * &struct drm_info_list in the given root directory. These files will be removed
  * automatically on drm_debugfs_cleanup().
  */
-int drm_debugfs_create_files(const struct drm_info_list *files, int count,
-			     struct dentry *root, struct drm_minor *minor)
+void drm_debugfs_create_files(const struct drm_info_list *files, int count,
+			      struct dentry *root, struct drm_minor *minor)
 {
 	struct drm_device *dev = minor->dev;
 	struct drm_info_node *tmp;
@@ -199,7 +199,6 @@ int drm_debugfs_create_files(const struct drm_info_list *files, int count,
 		list_add(&tmp->list, &minor->debugfs_list);
 		mutex_unlock(&minor->debugfs_lock);
 	}
-	return 0;
 }
 EXPORT_SYMBOL(drm_debugfs_create_files);
 
@@ -208,56 +207,30 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 {
 	struct drm_device *dev = minor->dev;
 	char name[64];
-	int ret;
 
 	INIT_LIST_HEAD(&minor->debugfs_list);
 	mutex_init(&minor->debugfs_lock);
 	sprintf(name, "%d", minor_id);
 	minor->debugfs_root = debugfs_create_dir(name, root);
 
-	ret = drm_debugfs_create_files(drm_debugfs_list, DRM_DEBUGFS_ENTRIES,
-				       minor->debugfs_root, minor);
-	if (ret) {
-		debugfs_remove(minor->debugfs_root);
-		minor->debugfs_root = NULL;
-		DRM_ERROR("Failed to create core drm debugfs files\n");
-		return ret;
-	}
+	drm_debugfs_create_files(drm_debugfs_list, DRM_DEBUGFS_ENTRIES,
+				 minor->debugfs_root, minor);
 
-	if (drm_drv_uses_atomic_modeset(dev)) {
-		ret = drm_atomic_debugfs_init(minor);
-		if (ret) {
-			DRM_ERROR("Failed to create atomic debugfs files\n");
-			return ret;
-		}
-	}
+	if (drm_drv_uses_atomic_modeset(dev))
+		drm_atomic_debugfs_init(minor);
 
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
-		ret = drm_framebuffer_debugfs_init(minor);
-		if (ret) {
-			DRM_ERROR("Failed to create framebuffer debugfs file\n");
-			return ret;
-		}
+		drm_framebuffer_debugfs_init(minor);
 
-		ret = drm_client_debugfs_init(minor);
-		if (ret) {
-			DRM_ERROR("Failed to create client debugfs file\n");
-			return ret;
-		}
+		drm_client_debugfs_init(minor);
 	}
 
-	if (dev->driver->debugfs_init) {
-		ret = dev->driver->debugfs_init(minor);
-		if (ret) {
-			DRM_ERROR("DRM: Driver failed to initialize "
-				  "/sys/kernel/debug/dri.\n");
-			return ret;
-		}
-	}
+	if (dev->driver->debugfs_init)
+		dev->driver->debugfs_init(minor);
+
 	return 0;
 }
 
-
 int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
 			     struct drm_minor *minor)
 {
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index 7501e323d383..4d028cc1fd37 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -80,9 +80,9 @@ struct drm_info_node {
 };
 
 #if defined(CONFIG_DEBUG_FS)
-int drm_debugfs_create_files(const struct drm_info_list *files,
-			     int count, struct dentry *root,
-			     struct drm_minor *minor);
+void drm_debugfs_create_files(const struct drm_info_list *files,
+			      int count, struct dentry *root,
+			      struct drm_minor *minor);
 int drm_debugfs_remove_files(const struct drm_info_list *files,
 			     int count, struct drm_minor *minor);
 #else
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
