Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7B53F771D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 16:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874DA6E21C;
	Wed, 25 Aug 2021 14:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693446E21C;
 Wed, 25 Aug 2021 14:23:47 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id q68so6143757pga.9;
 Wed, 25 Aug 2021 07:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZiZptxAG6LZlwjR95iOzUI6M5xQ+c4I+M1PZ5LikpHE=;
 b=RzxG8pu8w4YOOOK4FVNo+JlPArpKTuVCTwWWvCvJDnOGsi2Y1P/irj/uCE8dPqXovA
 sEIkaZD9WgINE+wIy9d88PRM3W0ks8dIQSero+iw5ZmN0yrBgF9EsZ7gHBfAd1bJgb1E
 DlZSbjMaqJ8hWZ5SOWXV5EmAw6okbDVUZbbPUXaAt9kA2V/o/M/CVILHubusBpNNitl1
 /ogdvnUL5Gf+8hvhjFM1lexot7NoAHizQn26+UgJTFZ3xOLN3blSQw3HqOjOIMrVI33I
 3F6BWkEZBSGjtT/8t4u6wbuopXmoXh8jP0XTHFQDzsYVs+nS/uKrxntqgamg4W2vXR2B
 lEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZiZptxAG6LZlwjR95iOzUI6M5xQ+c4I+M1PZ5LikpHE=;
 b=BBnOsRuXkEs4ghU85Dr/w+YtKtL2u2OzqPMh3JrwrYCL/PuaBQ9VzP3hrPCudfmTf4
 CGvsncNWxugMi0YRbpO1TZLIt34EzcEreVskhOVVTP3dn+3EW55Illh2Q5iikS8qFlUy
 SMPzSdnapdXkOBrjfHf4Ef4ZW9RHfkyD3F22D2Hq2wlsq72wJQWN70J/wpbpfK5SvsV5
 y27voJKAMPxq6DyFkztcvxf7HuQtzqKOvkhz3Ns3VGvDReqO5z+L9OHnir3y28LyDTzr
 xbY7hFa4mgt7qpTiqwQ7VU5zLjZnMBelBm036B7aPco8i7o1wXcW8sZHHIaeXfEzccbL
 iEIw==
X-Gm-Message-State: AOAM532H2HhhmuUMSBy2OiUdRiOMwtbTJwhwLFzHo7NMcZteGgbYqYae
 97UJ55pqe7rQU/CvA915ELc=
X-Google-Smtp-Source: ABdhPJw0LZK/Nv/gYyhMv3eDyuyke5wlBz2/A9iphtLhVNAumbv354U2J4I57WHg25W73R63NHlwtQ==
X-Received: by 2002:a65:47c6:: with SMTP id f6mr8386967pgs.450.1629901427035; 
 Wed, 25 Aug 2021 07:23:47 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id n3sm54431pfo.101.2021.08.25.07.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 07:23:46 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com,
 matthew.auld@intel.com, dan.carpenter@oracle.com, tvrtko.ursulin@intel.com,
 matthew.d.roper@intel.com, lucas.demarchi@intel.com, karthik.b.s@intel.com,
 jose.souza@intel.com, manasi.d.navare@intel.com, airlied@redhat.com,
 aditya.swarup@intel.com, andrescj@chromium.org,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v7 7/7] drm: remove drm_file.master_lookup_lock
Date: Wed, 25 Aug 2021 22:22:05 +0800
Message-Id: <20210825142205.1376789-8-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825142205.1376789-1-desmondcheongzx@gmail.com>
References: <20210825142205.1376789-1-desmondcheongzx@gmail.com>
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

Previously, master_lookup_lock was introduced in
commit 0b0860a3cf5e ("drm: serialize drm_file.master with a new
spinlock") to serialize accesses to drm_file.master. This then allowed
us to write drm_file_get_master in commit 56f0729a510f ("drm: protect
drm_master pointers in drm_lease.c").

The rationale behind introducing a new spinlock at the time was that
the other lock that could have been used (drm_device.master_mutex) was
the outermost lock, so embedding calls to drm_file_get_master and
drm_is_current_master in various functions easily caused us to invert
the lock hierarchy.

Following the conversion of master_mutex into a rwsem, and its use to
plug races with modesetting rights, we've untangled some lock
hierarchies and removed the need for using drm_file_get_master and the
unlocked version of drm_is_current_master in multiple places.

Hence, we can take this opportunity to clean up the locking design by
replacing master_lookup_lock with drm_device.master_rwsem.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c     | 19 +++++++------------
 drivers/gpu/drm/drm_file.c     |  1 -
 drivers/gpu/drm/drm_internal.h |  1 +
 drivers/gpu/drm/drm_ioctl.c    |  4 ++--
 drivers/gpu/drm/drm_lease.c    | 18 ++++++++----------
 include/drm/drm_file.h         |  9 +--------
 6 files changed, 19 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index f2b2f197052a..232416119407 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -61,10 +61,9 @@
  * trusted clients.
  */
 
-static bool drm_is_current_master_locked(struct drm_file *fpriv)
+bool drm_is_current_master_locked(struct drm_file *fpriv)
 {
-	lockdep_assert_once(lockdep_is_held(&fpriv->master_lookup_lock) ||
-			    lockdep_is_held(&fpriv->minor->dev->master_rwsem));
+	lockdep_assert_held_once(&fpriv->minor->dev->master_rwsem);
 
 	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
 }
@@ -83,9 +82,9 @@ bool drm_is_current_master(struct drm_file *fpriv)
 {
 	bool ret;
 
-	spin_lock(&fpriv->master_lookup_lock);
+	down_read(&fpriv->minor->dev->master_rwsem);
 	ret = drm_is_current_master_locked(fpriv);
-	spin_unlock(&fpriv->master_lookup_lock);
+	up_read(&fpriv->minor->dev->master_rwsem);
 
 	return ret;
 }
@@ -120,7 +119,7 @@ int drm_authmagic(struct drm_device *dev, void *data,
 	DRM_DEBUG("%u\n", auth->magic);
 
 	down_write(&dev->master_rwsem);
-	if (unlikely(!drm_is_current_master(file_priv))) {
+	if (unlikely(!drm_is_current_master_locked(file_priv))) {
 		up_write(&dev->master_rwsem);
 		return -EACCES;
 	}
@@ -178,9 +177,7 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
 	new_master = drm_master_create(dev);
 	if (!new_master)
 		return -ENOMEM;
-	spin_lock(&fpriv->master_lookup_lock);
 	fpriv->master = new_master;
-	spin_unlock(&fpriv->master_lookup_lock);
 
 	fpriv->is_master = 1;
 	fpriv->authenticated = 1;
@@ -343,9 +340,7 @@ int drm_master_open(struct drm_file *file_priv)
 	if (!dev->master) {
 		ret = drm_new_set_master(dev, file_priv);
 	} else {
-		spin_lock(&file_priv->master_lookup_lock);
 		file_priv->master = drm_master_get(dev->master);
-		spin_unlock(&file_priv->master_lookup_lock);
 	}
 	up_write(&dev->master_rwsem);
 
@@ -413,13 +408,13 @@ struct drm_master *drm_file_get_master(struct drm_file *file_priv)
 	if (!file_priv)
 		return NULL;
 
-	spin_lock(&file_priv->master_lookup_lock);
+	down_read(&file_priv->minor->dev->master_rwsem);
 	if (!file_priv->master)
 		goto unlock;
 	master = drm_master_get(file_priv->master);
 
 unlock:
-	spin_unlock(&file_priv->master_lookup_lock);
+	up_read(&file_priv->minor->dev->master_rwsem);
 	return master;
 }
 EXPORT_SYMBOL(drm_file_get_master);
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 90b62f360da1..8c846e0179d7 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -176,7 +176,6 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 	init_waitqueue_head(&file->event_wait);
 	file->event_space = 4096; /* set aside 4k for event buffer */
 
-	spin_lock_init(&file->master_lookup_lock);
 	mutex_init(&file->event_read_lock);
 
 	if (drm_core_check_feature(dev, DRIVER_GEM))
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 17f3548c8ed2..5d421f749a17 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -132,6 +132,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
 				  struct drm_file *filp);
 
 /* drm_auth.c */
+bool drm_is_current_master_locked(struct drm_file *fpriv);
 int drm_getmagic(struct drm_device *dev, void *data,
 		 struct drm_file *file_priv);
 int drm_authmagic(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 8bea39ffc5c0..c728437466c3 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -386,7 +386,7 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
 	int if_version, retcode = 0;
 
 	down_write(&dev->master_rwsem);
-	if (unlikely(!drm_is_current_master(file_priv))) {
+	if (unlikely(!drm_is_current_master_locked(file_priv))) {
 		retcode = -EACCES;
 		goto unlock;
 	}
@@ -540,7 +540,7 @@ static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
 
 	/* MASTER is only for master or control clients */
 	if (unlikely((flags & DRM_MASTER) &&
-		     !drm_is_current_master(file_priv)))
+		     !drm_is_current_master_locked(file_priv)))
 		return -EACCES;
 
 	/* Render clients must be explicitly allowed */
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 15bf3a3c76d1..0eecf320b1ab 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -498,12 +498,12 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 		return PTR_ERR(lessee_file);
 
 	down_read(&dev->master_rwsem);
-	if (unlikely(!drm_is_current_master(lessor_priv))) {
+	if (unlikely(!drm_is_current_master_locked(lessor_priv))) {
 		ret = -EACCES;
 		goto out_file;
 	}
 
-	lessor = drm_file_get_master(lessor_priv);
+	lessor = lessor_priv->master;
 	/* Do not allow sub-leases */
 	if (lessor->lessor) {
 		DRM_DEBUG_LEASE("recursive leasing not allowed\n");
@@ -565,7 +565,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	/* Hook up the fd */
 	fd_install(fd, lessee_file);
 
-	drm_master_put(&lessor);
 	up_read(&dev->master_rwsem);
 	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl succeeded\n");
 	return 0;
@@ -600,7 +599,8 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
-	lessor = drm_file_get_master(lessor_priv);
+	lockdep_assert_held_once(&dev->master_rwsem);
+	lessor = lessor_priv->master;
 	DRM_DEBUG_LEASE("List lessees for %d\n", lessor->lessee_id);
 
 	mutex_lock(&dev->mode_config.idr_mutex);
@@ -624,7 +624,6 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 		arg->count_lessees = count;
 
 	mutex_unlock(&dev->mode_config.idr_mutex);
-	drm_master_put(&lessor);
 
 	return ret;
 }
@@ -650,7 +649,8 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
-	lessee = drm_file_get_master(lessee_priv);
+	lockdep_assert_held_once(&dev->master_rwsem);
+	lessee = lessee_priv->master;
 	DRM_DEBUG_LEASE("get lease for %d\n", lessee->lessee_id);
 
 	mutex_lock(&dev->mode_config.idr_mutex);
@@ -678,7 +678,6 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 		arg->count_objects = count;
 
 	mutex_unlock(&dev->mode_config.idr_mutex);
-	drm_master_put(&lessee);
 
 	return ret;
 }
@@ -703,11 +702,11 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 		return -EOPNOTSUPP;
 
 	down_write(&dev->master_rwsem);
-	if (unlikely(!drm_is_current_master(lessor_priv))) {
+	if (unlikely(!drm_is_current_master_locked(lessor_priv))) {
 		ret = -EACCES;
 		goto unlock;
 	}
-	lessor = drm_file_get_master(lessor_priv);
+	lessor = lessor_priv->master;
 	mutex_lock(&dev->mode_config.idr_mutex);
 
 	lessee = _drm_find_lessee(lessor, arg->lessee_id);
@@ -728,7 +727,6 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 
 fail:
 	mutex_unlock(&dev->mode_config.idr_mutex);
-	drm_master_put(&lessor);
 
 unlock:
 	up_write(&dev->master_rwsem);
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index d12bb2ba7814..e2d49fe3e32d 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -227,16 +227,12 @@ struct drm_file {
 	 * @master:
 	 *
 	 * Master this node is currently associated with. Protected by struct
-	 * &drm_device.master_rwsem, and serialized by @master_lookup_lock.
+	 * &drm_device.master_rwsem.
 	 *
 	 * Only relevant if drm_is_primary_client() returns true. Note that
 	 * this only matches &drm_device.master if the master is the currently
 	 * active one.
 	 *
-	 * To update @master, both &drm_device.master_rwsem and
-	 * @master_lookup_lock need to be held, therefore holding either of
-	 * them is safe and enough for the read side.
-	 *
 	 * When dereferencing this pointer, either hold struct
 	 * &drm_device.master_rwsem for the duration of the pointer's use, or
 	 * use drm_file_get_master() if struct &drm_device.master_rwsem is not
@@ -248,9 +244,6 @@ struct drm_file {
 	 */
 	struct drm_master *master;
 
-	/** @master_lock: Serializes @master. */
-	spinlock_t master_lookup_lock;
-
 	/** @pid: Process that opened this file. */
 	struct pid *pid;
 
-- 
2.25.1

