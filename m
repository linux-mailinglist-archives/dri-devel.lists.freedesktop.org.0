Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0802ECF0385
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 18:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C835B10E378;
	Sat,  3 Jan 2026 17:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="s1wJwRcL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 378 seconds by postgrey-1.36 at gabe;
 Sat, 03 Jan 2026 15:29:58 UTC
Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com
 [203.205.221.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A3310E1C3
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jan 2026 15:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1767454195; bh=D1NykMR6pr6A8VDRQDRtjrmNdSIxvA3GlcvAYxylwE0=;
 h=From:To:Cc:Subject:Date;
 b=s1wJwRcLE+OHk7Rpcmtn/sKUHxXgumhyDvT8gV4shYoLRq8i2MR3GmgA7dfYs+LZ4
 MQuwrZo/A7v0C9geZDdM2VvorBfahS7hrcdWsiYGVdUyNJ6Ctp4/QtqzORJA91uOjC
 qLgqhtG7O+X0AT9DD/vmcKNJVQZWHW723GjkctM8=
Received: from kali ([111.19.95.200])
 by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
 id 58905CCB; Sat, 03 Jan 2026 23:22:09 +0800
X-QQ-mid: xmsmtpt1767453729t5gycshi5
Message-ID: <tencent_2411FBA0D5386A96531A1093DCBB76AD0807@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5aZmRGre3+wBnyPCSpWGi0Uov+YHz1hjwpmVK8/EJyDfYl5F3E9
 hlLUmCbOMQMAUZjZd3gYldA8JbU1JlOOmhfyHpplHBmfnEC3xRsrf39UzKaJYFOsAshBeSjZ5w7R
 mthUZL9A4JnkcKgSlWPtThaXpTy70iQmQGwXUZKbCaxv9Oim6QYK5McjacEqqVBx74s3JcubpkEa
 qfpe1PXC3LStcOs21As6U2zUEfsieA+A9h7Pb5UXoIfrd7jKnN0KE1BGVRn/lrT71pmMB2umZ1zo
 WdrrdmurJBpPnRkGjAmcMAjRVw5G+AnXJ9u3p6I5g+BHxmj7n/ILcje3jdt3glaWBIaLOg27BX7Q
 xd28vbYxsTtOv1OZYf48mzpXgSVKJVn1swscsoxYZgktXALPMTzapO0bWGoteAQrS/xKuAs/Ed/I
 aoOlbr1vkuPfsSW32VYs/KEXihduWQWt0lOjO49YT2m2aafKsXXy6RKy40pvyfm8q16u1zlQl5WY
 0FKVrV3D9MBQybbDOyJHPGrH9Uur+lcoI8XupvqZWR4N5awapjANSkXPNXOewBJwhwa6NtLvE6wy
 /CW1493eGaMb04pB+ovmRUx41KQldFuphhv9oKu6gg+OVzfsbIIdRSpWYlBC+nCW6sRTxnIplgoh
 bYXL87l+bRddiqkbbbAeZN0tZwq0XtoHEEUckXxDy5e1XRHp5dSKDqknKFBPclYmbDrZz9/FC/2Z
 Q3mPxYMct7v99n+6Me1AHiopb3rm/dUhGWHyeuOqJdVQkYTKyffm4HHsNcUnBzQVysxCbecPU3Yt
 k4WjiEb3/kKgvz2ifvlMnyNQeIkvbRc62kTkG1gAOzPPFGAna+GRRYfyjzznHN6NS1UO9C7jDiHd
 0NlIIYY7q6p1N5cnegDZxCPtfiOyQZVQhgskIllqTrU627Z1g/kb2QIAWWzbghyB6wFsg/Umjhg9
 2HlkmVlftb3EBigI6Uq3KTdiiukGFqkUUtJfui1Mt28mqH5kP2vyd9ZwNB4nG8FbAXGeMCQZcIOu
 mT1mLyJdDb1pQVU5UCHPDXxwAUgi/CTStz1owQQsqEgtx36nIIP7EuvjFj9NVhM0JHVyVrA3q5gG
 1dCa4w6Oo/XwCmMvwc1pclP+v1W61qefPrbj/h/J+o66lRTkk=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Xiao Kan <814091656@qq.com>
To: w@1wt.eu
Cc: security@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kanxiao666@gmail.com, xiao.kan@samsung.com, Xiao Kan <814091656@qq.com>
Subject: [PATCH] drm: limit property blob creation per file
Date: Sat,  3 Jan 2026 10:21:55 -0500
X-OQ-MSGID: <20260103152155.2613-1-814091656@qq.com>
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

