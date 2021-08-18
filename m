Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A833EFDFD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 09:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B255B89A16;
	Wed, 18 Aug 2021 07:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52FA89E98;
 Wed, 18 Aug 2021 07:41:28 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id i133so1270791pfe.12;
 Wed, 18 Aug 2021 00:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1bkLMEw2t/totCFLQIzrVHXO8lyHlY0O9pr/RZGsdI0=;
 b=bLirg/ekc0It+7MhEmdqeKW1uskct7uSLEYEWb5Ts5xbzkUlwtt0MXY+lJk9DGWH0b
 Uqv9IwaVom6h+9HWW2VpWO/ZrDFqJx917Te1eyb59FUAVKaVVQ6cIDAYwQZGA/SqTxQ3
 okt1jnoVvDtYswWK6eXPFUwy4mbZ41c62jY+cFma3PrODfQ6olrM1dkWU8e+fnUdhuA6
 LcRvdhF2laqs5TgwKBgnqpmuons9CZfNplWWsgdfHzRXRlDU4/zxRj0MD2cYdlg/kgz6
 uQy/f3qvZI+gA9UJxHE+io77IuzIlxyEJuKlHcVdF3i4FEKKISV1yS+JwxrBszCcmW6+
 ed/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1bkLMEw2t/totCFLQIzrVHXO8lyHlY0O9pr/RZGsdI0=;
 b=Vd0BsOvi0gSrbnSZBysGD5jm7S7HuHjyLzeSr+aGMCwXhvOBZlfrmUHOmHDeFzdlBX
 OWstgwBcfcdMpY1rFJEyWdy1bTVxYvmJTAYTfc/W6yjpRi1f3g9ca44UPwy3kwSMAN0F
 EFhauO9xUOXLuo3Vm0BUti1mqjV6Qx0LXzY5asf6FYXv+QWONdIHEwkhu1uD8K4HUz1U
 MmiHOrxzapPPl3L7p0ZiN6HF9lC8uNYFIlr5Bh/X5qMt54uFYI8DQJ+wdQu43iKn6WEx
 oI7+xwi5QZ49nZcLN/LAyK9BQkg903dG6Pc1J4h17O6gdVmFg9Tk2IDrVfR8Zv5nKP/y
 ubjQ==
X-Gm-Message-State: AOAM532eVRTxaCh37HfytaTNHFB8xY7OuZk/lC2IPQSfbEsbBbvBr2ws
 /Ers/SC4J4HAiw/wM79Cu1I=
X-Google-Smtp-Source: ABdhPJys3HPHWTRsAjT+5YnD6rJNYZL136LiYwwEF8beumJZ6hVGWSIIaE7eeFYyLYOhAlW2I2XuJQ==
X-Received: by 2002:a05:6a00:181c:b029:3c6:2258:a844 with SMTP id
 y28-20020a056a00181cb02903c62258a844mr8044761pfa.6.1629272488381; 
 Wed, 18 Aug 2021 00:41:28 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:41:27 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
 tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 9/9] drm: avoid races with modesetting rights
Date: Wed, 18 Aug 2021 15:38:24 +0800
Message-Id: <20210818073824.1560124-10-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In drm_client_modeset.c and drm_fb_helper.c,
drm_master_internal_{acquire,release} are used to avoid races with DRM
userspace. These functions hold onto drm_device.master_rwsem while
committing, and bail if there's already a master.

However, there are other places where modesetting rights can race. A
time-of-check-to-time-of-use error can occur if an ioctl that changes
the modeset has its rights revoked after it validates its permissions,
but before it completes.

There are four places where modesetting permissions can change:

- DROP_MASTER ioctl removes rights for a master and its leases

- REVOKE_LEASE ioctl revokes rights for a specific lease

- SET_MASTER ioctl sets the device master if the master role hasn't
been acquired yet

- drm_open which can create a new master for a device if one does not
currently exist

These races can be avoided using drm_device.master_rwsem: users that
perform modesetting should hold a read lock on the new
drm_device.master_rwsem, and users that change these permissions
should either hold a write lock, or should flush readers before
returning to userspace.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c     | 29 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_internal.h |  1 +
 drivers/gpu/drm/drm_ioctl.c    |  8 ++++++--
 drivers/gpu/drm/drm_lease.c    |  1 +
 include/drm/drm_device.h       | 10 +++++++++-
 5 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index b65681ff42fc..84d00275ff8a 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -29,6 +29,7 @@
  */
 
 #include <linux/slab.h>
+#include <linux/task_work.h>
 
 #include <drm/drm_auth.h>
 #include <drm/drm_drv.h>
@@ -127,6 +128,7 @@ int drm_authmagic(struct drm_device *dev, void *data,
 
 	DRM_DEBUG("%u\n", auth->magic);
 
+	lockdep_assert_held_once(&dev->master_rwsem);
 	spin_lock(&dev->master_lookup_lock);
 	file = idr_find(&file_priv->master->magic_map, auth->magic);
 	if (file) {
@@ -485,3 +487,30 @@ void drm_master_internal_release(struct drm_device *dev)
 	up_read(&dev->master_rwsem);
 }
 EXPORT_SYMBOL(drm_master_internal_release);
+
+/* After flushing, all readers that might have seen old master/lease
+ * permissions are guaranteed to have completed.
+ */
+static void master_flush(struct callback_head *cb)
+{
+	struct drm_device *dev = container_of(cb, struct drm_device,
+					      master_flush_work);
+
+	down_write(&dev->master_rwsem);
+	up_write(&dev->master_rwsem);
+}
+
+/* Queues up work to flush all readers of master/lease permissions. This work
+ * is run before this task returns to user mode. Calling this function when a
+ * task changes modesetting rights ensures that other processes that perform
+ * modesetting do not race with userspace.
+ */
+void drm_master_flush(struct drm_device *dev)
+{
+	init_task_work(&dev->master_flush_work, master_flush);
+	task_work_add(current, &dev->master_flush_work, TWA_RESUME);
+	/* If task_work_add fails, then the task is exiting. In this case, it
+	 * doesn't matter if master_flush is run, so we don't need an
+	 * alternative mechanism for flushing.
+	 */
+}
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 17f3548c8ed2..b1cd39338756 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -144,6 +144,7 @@ int drm_master_open(struct drm_file *file_priv);
 void drm_master_release(struct drm_file *file_priv);
 bool drm_master_internal_acquire(struct drm_device *dev);
 void drm_master_internal_release(struct drm_device *dev);
+void drm_master_flush(struct drm_device *dev);
 
 /* drm_sysfs.c */
 extern struct class *drm_class;
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 2cb57378a787..7f523e1c5650 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -390,7 +390,7 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
 	struct drm_set_version *sv = data;
 	int if_version, retcode = 0;
 
-	down_read(&dev->master_rwsem);
+	lockdep_assert_held_once(&dev->master_rwsem);
 	if (sv->drm_di_major != -1) {
 		if (sv->drm_di_major != DRM_IF_MAJOR ||
 		    sv->drm_di_minor < 0 || sv->drm_di_minor > DRM_IF_MINOR) {
@@ -427,7 +427,6 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
 	sv->drm_di_minor = DRM_IF_MINOR;
 	sv->drm_dd_major = dev->driver->major;
 	sv->drm_dd_minor = dev->driver->minor;
-	up_read(&dev->master_rwsem);
 
 	return retcode;
 }
@@ -783,6 +782,9 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 	if (unlikely(drm_dev_needs_global_mutex(dev)) && !(flags & DRM_UNLOCKED))
 		mutex_lock(&drm_global_mutex);
 
+	if (unlikely(flags & DRM_MASTER))
+		down_read(&dev->master_rwsem);
+
 	retcode = drm_ioctl_permit(flags, file_priv);
 	if (unlikely(retcode))
 		goto out;
@@ -790,6 +792,8 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 	retcode = func(dev, kdata, file_priv);
 
 out:
+	if (unlikely(flags & DRM_MASTER))
+		up_read(&dev->master_rwsem);
 	if (unlikely(drm_dev_needs_global_mutex(dev)) && !(flags & DRM_UNLOCKED))
 		mutex_unlock(&drm_global_mutex);
 	return retcode;
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index dee4f24a1808..983701198ffd 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -723,6 +723,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 	}
 
 	_drm_lease_revoke(lessee);
+	drm_master_flush(dev);
 
 fail:
 	mutex_unlock(&dev->mode_config.idr_mutex);
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index f1ae4570a20a..617f7fe1d3bf 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -151,10 +151,18 @@ struct drm_device {
 	 * Synchronizes modesetting rights between multiple users. Users that
 	 * can change the modeset or display state must hold a read lock on
 	 * @master_rwsem, and users that change modesetting rights should hold
-	 * a write lock.
+	 * a write lock or flush readers before returning to userspace.
 	 */
 	struct rw_semaphore master_rwsem;
 
+	/**
+	 * @master_flush_work:
+	 *
+	 * Callback structure used internally to queue work to flush readers of
+	 * master/lease permissions.
+	 */
+	struct callback_head master_flush_work;
+
 	/**
 	 * @master_lookup_lock:
 	 *
-- 
2.25.1

