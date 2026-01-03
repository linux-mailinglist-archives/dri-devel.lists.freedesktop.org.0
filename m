Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40138CF0382
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 18:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA50210E376;
	Sat,  3 Jan 2026 17:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="L7/wD1H9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com
 [162.62.57.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E76C10E1C3
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jan 2026 15:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1767454160; bh=D1NykMR6pr6A8VDRQDRtjrmNdSIxvA3GlcvAYxylwE0=;
 h=From:To:Cc:Subject:Date;
 b=L7/wD1H9HRHOLVGB8YafH/PkgyziEOgSUKz+8sjrYHsUARX2U8HfSuiqJAKh8kyuw
 gY05zp7YCGJEb+VhrtxiFh5euN88+rnn1IWvqdS0SMFaqpJdbuY9AsWjc5B+XYlm6z
 TYwVDbzkBYWjFHPkbO+3rwQGrjD0BLIgXnZFmsHw=
Received: from kali ([111.19.95.200])
 by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
 id 66987664; Sat, 03 Jan 2026 23:25:41 +0800
X-QQ-mid: xmsmtpt1767453941t5c1hl65d
Message-ID: <tencent_B0A522AEEC81573BA9934E2340B672ABDA09@qq.com>
X-QQ-XMAILINFO: NlUcpr8OjS4BZkRQGyNc30FHRV6BcmR2T/EZFJAZwJz5TqVVsLES91hMucL0ZZ
 yl70CBCyVTl2rfzKar8B0K+2PdZ1L/6idrPdaZDD+HL7h/K5csq1CJPSIgom4a1iYni3tJ4bKwU+
 Q82VkwBYVe/q5qiCkLd/sk9hwTHbSqfpppG/RyU0ig/JHSd4qZG/vGHOrf5iVInuVTDhNIacg2XP
 uB+yjA/q2alRm4I/jAqGxwl933PYbnjdQyF++Yy3VXpNhLd2L2h74zqVI3GoXzvbg3AI00so86hV
 apTw/Am/2W37BjP2aNngIY57XC4wlw896dqPfG2rJk27HnYr0psYMp9dAsJIbFBk/04CuKvgE3fO
 dQVas8TAbQ3SznSEJ1I1/8L9og0w0fiNJCukpw7caBNn0Xfa5CrAEcETlErxfZNL6SHlQMBn4E5y
 tuHP3tD7lgcQcwmThhdwdK/HUwcOGajDO1Qox6Qy2JaOTGmgnjDsue0XDjFv5ZUBQNf+S6EWlKjq
 ADiYNWau35eaNfCU+095CzHGLEstt6MPkvXXr6JuOsbe3hnAI3DjuaG3+0Nx1Qx4oTqT9cbcSxHZ
 FUzFHVpW/vTCS6O5w9UNllw51A6Vm53fPrkiFW8Fq9Bo80Pgsp/xAIZ3rtA0PWgxrD2LWp7dIEbu
 6Ej/Si2nJSZmBiInPQ+H93UZRU7DpZYLCwWOZwYbBmr50B/RlfGO6PqOuge+8+mCXRs79GZYgx3L
 WRxXfFAKolMhWeM9ED/RqDwbRkBRIUBiBNwP6Iuw+MXiZyX02hK4gwmYJgAmpwyVknjWGCZHinMk
 q45sGEZo2rJjXg+amj3PLJaLLgJM92q361fCimaRVDI298LIFqhVfiD94nyEVH6P4Fy1tnLpCEDM
 fPicof/XLwRE0UESaw4mOEUYtzGn893hTUYWcidHbd7pe/ez4/dKulSdAlFjCX8yRL8JhUKUjcop
 LuHeoNFA+vUg9rWGQHL15JrhKe+IAjR1zkVdh3i95hmQX/lMFmnotgdC3JCBk45b7yHrqDW1b3Xk
 BDDEcJhXQJ6Oy7Cv745qVQ8htZEY8C5+T2X/ZxORoXE4zb//bVr1nilfcPGqgdcNh+MaN/b68QHD
 svrGxA9Qaesfg7yeVvrINkpqZqP0Qs3ll2g5xKHr+p2HI7cwAddpG9kQMJ6Vm+rs8ObfWiEMQQmS
 qSg9xNNszrQh8cZw==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Xiao Kan <814091656@qq.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: w@1wt.eu, security@kernel.org, kanxiao666@gmail.com, xiao.kan@samsung.com,
 Xiao Kan <814091656@qq.com>
Subject: [PATCH] drm: limit property blob creation per file
Date: Sat,  3 Jan 2026 10:25:29 -0500
X-OQ-MSGID: <20260103152529.4381-1-814091656@qq.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 03 Jan 2026 17:36:57 +0000
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

DRM_IOCTL_MODE_CREATEPROPBLOB allows userspace to create property blobs
whose lifetime is scoped to a drm_file.

Currently, a single drm_file may create an unbounded number of blobs.
Repeated ioctl calls can trigger unbounded kernel memory allocation and
lead to OOM, resulting in a denial-of-service.

Introduce a per-drm_file limit on the number of user-created property
blobs. The limit is enforced at the point where a blob becomes associated
with a drm_file, matching the existing ownership and lifetime model.
This bounds per-file allocations while the total number of DRM file
descriptors remains constrained by existing kernel limits.

Signed-off-by: Xiao Kan <814091656@qq.com>
Signed-off-by: Xiao Kan <xiao.kan@samsung.com>
---
 drivers/gpu/drm/drm_file.c     | 1 +
 drivers/gpu/drm/drm_property.c | 8 ++++++++
 include/drm/drm_file.h         | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index eebd1a05e..873bf6248 100755
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -152,6 +152,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 	INIT_LIST_HEAD(&file->fbs);
 	mutex_init(&file->fbs_lock);
 	INIT_LIST_HEAD(&file->blobs);
+	file->blob_count = 0;
 	INIT_LIST_HEAD(&file->pending_event_list);
 	INIT_LIST_HEAD(&file->event_list);
 	init_waitqueue_head(&file->event_wait);
diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index 596272149..00eac336a 100755
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -618,6 +618,7 @@ void drm_property_destroy_user_blobs(struct drm_device *dev,
 	 */
 	list_for_each_entry_safe(blob, bt, &file_priv->blobs, head_file) {
 		list_del_init(&blob->head_file);
+		file_priv->blob_count--;
 		drm_property_blob_put(blob);
 	}
 }
@@ -864,8 +865,14 @@ int drm_mode_createblob_ioctl(struct drm_device *dev,
 	 * as only the same file_priv can remove the blob; at this point, it is
 	 * not associated with any file_priv. */
 	mutex_lock(&dev->mode_config.blob_lock);
+	if (file_priv->blob_count >= DRM_FILE_MAX_PROPBLOBS) {
+		mutex_unlock(&dev->mode_config.blob_lock);
+		drm_property_blob_put(blob);
+		return -ENOSPC;
+	}
 	out_resp->blob_id = blob->base.id;
 	list_add_tail(&blob->head_file, &file_priv->blobs);
+	file_priv->blob_count++;
 	mutex_unlock(&dev->mode_config.blob_lock);
 
 	return 0;
@@ -907,6 +914,7 @@ int drm_mode_destroyblob_ioctl(struct drm_device *dev,
 	/* We must drop head_file here, because we may not be the last
 	 * reference on the blob. */
 	list_del_init(&blob->head_file);
+	file_priv->blob_count--;
 	mutex_unlock(&dev->mode_config.blob_lock);
 
 	/* One reference from lookup, and one from the filp. */
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 115763799..211c4284f 100755
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -38,6 +38,9 @@
 
 #include <drm/drm_prime.h>
 
+/* Maximum number of user-created property blobs per drm_file */
+#define DRM_FILE_MAX_PROPBLOBS 256
+
 struct dma_fence;
 struct drm_file;
 struct drm_device;
@@ -349,6 +352,9 @@ struct drm_file {
 	 */
 	struct list_head blobs;
 
+	/* Number of property blobs owned by this file */
+	unsigned int blob_count;
+
 	/** @event_wait: Waitqueue for new events added to @event_list. */
 	wait_queue_head_t event_wait;
 
-- 
2.51.0

