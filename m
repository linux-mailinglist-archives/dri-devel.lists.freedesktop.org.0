Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D69D73F999F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811746E93A;
	Fri, 27 Aug 2021 13:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392536E93B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:23:14 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id g18so2864858wrc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ULpCUTJyJhCkAiKSeT5EeP68IV5SsE1YltIgMJFsQQI=;
 b=jz8hJ0ZFArPQjxPBuyZtlrrisKzGsmMiC5ptXSVJJ92bT692L//xuSHoPvEQv0Shi0
 1f3X4IJ9LIt0/MghveQGca/XDf012HyoJjNE626NdHrFxvfNmz05s/BURS9AkU65o7/K
 TUN243Hm137606Cn2X4VPtd2V6ffJLe1sDLfA/tK/MJymx21HlpQTeToHm/AWf2lrsBS
 OJFLw6pvFnhHwYTt5a/ULlg8NgX2L22hNw6PUADn1Fcb/iCaqf8wNijt8iQEjBTkc27J
 3kM4QKiAiy4SHiA3ZBGPcibC8f/Zcfp+IMQ4LUsb9ZCVBkF5aANEQMSn/n3W5jN8Q0yN
 B7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ULpCUTJyJhCkAiKSeT5EeP68IV5SsE1YltIgMJFsQQI=;
 b=ZSDkxGV/FITUExR8Sf3z+gELAU08QagfpuAgDHKZ/WMIiRNax2w8vPAdqP9N6lO+i3
 qQgMMhL6o7RrGjZXSVcEtrVbzIkU8DIVA+c7o8hrpttQBzk3g+iqNiikR4Vs/f8PLeoz
 oL6mR6Dky0Cd3dLm1H5akr+D2jdoA7Dll0PVcsvvHm0ZPQiWXlyFdteJtZZNkfHSWgIP
 WK6zmb9hBTf9pFgZak3y/BLNZ06IA+L09rI9pGYQI6n+865anrpel69nO9W8upjxtRlR
 8CO1Al35uBuZSNzZ61wJm8q7zpL6kCBi/f1lRvOjMCao7XM82WorxcUnaTXaM8sL9lQb
 FbqQ==
X-Gm-Message-State: AOAM533kj9G97HqqbSsg1M6eU0ETXDHwxciMuaKaU21E1m6dymaPecE5
 MyqMfaBt2dwmbNARu1Ck9k2XZF40VuA=
X-Google-Smtp-Source: ABdhPJyg/9hFvGzvYwpRAsl8zbHX6mC7SmKl8toMqHRLYw7VCiV4Vqgs+HCQqOJ/k/tH3fdKo+e/ZQ==
X-Received: by 2002:adf:d184:: with SMTP id v4mr2274796wrc.229.1630070592629; 
 Fri, 27 Aug 2021 06:23:12 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id 13sm975523wmk.33.2021.08.27.06.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:23:11 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 01/25] tegra: Indent according to .editorconfig
Date: Fri, 27 Aug 2021 15:22:41 +0200
Message-Id: <20210827132305.3572077-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
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

From: Thierry Reding <treding@nvidia.com>

Reindent the sources according to the settings found in the newly added
.editorconfig.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/private.h         |  18 +-
 tegra/tegra.c           | 354 ++++++++++++++++++++--------------------
 tegra/tegra.h           |  12 +-
 tests/tegra/openclose.c |  52 +++---
 4 files changed, 220 insertions(+), 216 deletions(-)

diff --git a/tegra/private.h b/tegra/private.h
index bb6c1a516530..215dd3309bce 100644
--- a/tegra/private.h
+++ b/tegra/private.h
@@ -34,18 +34,18 @@
 #include "tegra.h"
 
 struct drm_tegra {
-	bool close;
-	int fd;
+    bool close;
+    int fd;
 };
 
 struct drm_tegra_bo {
-	struct drm_tegra *drm;
-	uint32_t handle;
-	uint32_t offset;
-	uint32_t flags;
-	uint32_t size;
-	atomic_t ref;
-	void *map;
+    struct drm_tegra *drm;
+    uint32_t handle;
+    uint32_t offset;
+    uint32_t flags;
+    uint32_t size;
+    atomic_t ref;
+    void *map;
 };
 
 #endif /* __DRM_TEGRA_PRIVATE_H__ */
diff --git a/tegra/tegra.c b/tegra/tegra.c
index cf00a3cac6d8..3caf0bc4e65e 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -37,292 +37,296 @@
 
 static void drm_tegra_bo_free(struct drm_tegra_bo *bo)
 {
-	struct drm_tegra *drm = bo->drm;
-	struct drm_gem_close args;
+    struct drm_tegra *drm = bo->drm;
+    struct drm_gem_close args;
 
-	if (bo->map)
-		munmap(bo->map, bo->size);
+    if (bo->map)
+        munmap(bo->map, bo->size);
 
-	memset(&args, 0, sizeof(args));
-	args.handle = bo->handle;
+    memset(&args, 0, sizeof(args));
+    args.handle = bo->handle;
 
-	drmIoctl(drm->fd, DRM_IOCTL_GEM_CLOSE, &args);
+    drmIoctl(drm->fd, DRM_IOCTL_GEM_CLOSE, &args);
 
-	free(bo);
+    free(bo);
 }
 
 static int drm_tegra_wrap(struct drm_tegra **drmp, int fd, bool close)
 {
-	struct drm_tegra *drm;
+    struct drm_tegra *drm;
 
-	if (fd < 0 || !drmp)
-		return -EINVAL;
+    if (fd < 0 || !drmp)
+        return -EINVAL;
 
-	drm = calloc(1, sizeof(*drm));
-	if (!drm)
-		return -ENOMEM;
+    drm = calloc(1, sizeof(*drm));
+    if (!drm)
+        return -ENOMEM;
 
-	drm->close = close;
-	drm->fd = fd;
+    drm->close = close;
+    drm->fd = fd;
 
-	*drmp = drm;
+    *drmp = drm;
 
-	return 0;
+    return 0;
 }
 
 drm_public int drm_tegra_new(struct drm_tegra **drmp, int fd)
 {
-	bool supported = false;
-	drmVersionPtr version;
+    bool supported = false;
+    drmVersionPtr version;
 
-	version = drmGetVersion(fd);
-	if (!version)
-		return -ENOMEM;
+    version = drmGetVersion(fd);
+    if (!version)
+        return -ENOMEM;
 
-	if (!strncmp(version->name, "tegra", version->name_len))
-		supported = true;
+    if (!strncmp(version->name, "tegra", version->name_len))
+        supported = true;
 
-	drmFreeVersion(version);
+    drmFreeVersion(version);
 
-	if (!supported)
-		return -ENOTSUP;
+    if (!supported)
+        return -ENOTSUP;
 
-	return drm_tegra_wrap(drmp, fd, false);
+    return drm_tegra_wrap(drmp, fd, false);
 }
 
 drm_public void drm_tegra_close(struct drm_tegra *drm)
 {
-	if (!drm)
-		return;
+    if (!drm)
+        return;
 
-	if (drm->close)
-		close(drm->fd);
+    if (drm->close)
+        close(drm->fd);
 
-	free(drm);
+    free(drm);
 }
 
-drm_public int drm_tegra_bo_new(struct drm_tegra_bo **bop, struct drm_tegra *drm,
-		     uint32_t flags, uint32_t size)
+drm_public int
+drm_tegra_bo_new(struct drm_tegra_bo **bop, struct drm_tegra *drm,
+                 uint32_t flags, uint32_t size)
 {
-	struct drm_tegra_gem_create args;
-	struct drm_tegra_bo *bo;
-	int err;
+    struct drm_tegra_gem_create args;
+    struct drm_tegra_bo *bo;
+    int err;
 
-	if (!drm || size == 0 || !bop)
-		return -EINVAL;
+    if (!drm || size == 0 || !bop)
+        return -EINVAL;
 
-	bo = calloc(1, sizeof(*bo));
-	if (!bo)
-		return -ENOMEM;
+    bo = calloc(1, sizeof(*bo));
+    if (!bo)
+        return -ENOMEM;
 
-	atomic_set(&bo->ref, 1);
-	bo->flags = flags;
-	bo->size = size;
-	bo->drm = drm;
+    atomic_set(&bo->ref, 1);
+    bo->flags = flags;
+    bo->size = size;
+    bo->drm = drm;
 
-	memset(&args, 0, sizeof(args));
-	args.flags = flags;
-	args.size = size;
+    memset(&args, 0, sizeof(args));
+    args.flags = flags;
+    args.size = size;
 
-	err = drmCommandWriteRead(drm->fd, DRM_TEGRA_GEM_CREATE, &args,
-				  sizeof(args));
-	if (err < 0) {
-		err = -errno;
-		free(bo);
-		return err;
-	}
+    err = drmCommandWriteRead(drm->fd, DRM_TEGRA_GEM_CREATE, &args,
+                              sizeof(args));
+    if (err < 0) {
+        err = -errno;
+        free(bo);
+        return err;
+    }
 
-	bo->handle = args.handle;
+    bo->handle = args.handle;
 
-	*bop = bo;
+    *bop = bo;
 
-	return 0;
+    return 0;
 }
 
-drm_public int drm_tegra_bo_wrap(struct drm_tegra_bo **bop, struct drm_tegra *drm,
-		      uint32_t handle, uint32_t flags, uint32_t size)
+drm_public int
+drm_tegra_bo_wrap(struct drm_tegra_bo **bop, struct drm_tegra *drm,
+                  uint32_t handle, uint32_t flags, uint32_t size)
 {
-	struct drm_tegra_bo *bo;
+    struct drm_tegra_bo *bo;
 
-	if (!drm || !bop)
-		return -EINVAL;
+    if (!drm || !bop)
+        return -EINVAL;
 
-	bo = calloc(1, sizeof(*bo));
-	if (!bo)
-		return -ENOMEM;
+    bo = calloc(1, sizeof(*bo));
+    if (!bo)
+        return -ENOMEM;
 
-	atomic_set(&bo->ref, 1);
-	bo->handle = handle;
-	bo->flags = flags;
-	bo->size = size;
-	bo->drm = drm;
+    atomic_set(&bo->ref, 1);
+    bo->handle = handle;
+    bo->flags = flags;
+    bo->size = size;
+    bo->drm = drm;
 
-	*bop = bo;
+    *bop = bo;
 
-	return 0;
+    return 0;
 }
 
 drm_public struct drm_tegra_bo *drm_tegra_bo_ref(struct drm_tegra_bo *bo)
 {
-	if (bo)
-		atomic_inc(&bo->ref);
+    if (bo)
+        atomic_inc(&bo->ref);
 
-	return bo;
+    return bo;
 }
 
 drm_public void drm_tegra_bo_unref(struct drm_tegra_bo *bo)
 {
-	if (bo && atomic_dec_and_test(&bo->ref))
-		drm_tegra_bo_free(bo);
+    if (bo && atomic_dec_and_test(&bo->ref))
+        drm_tegra_bo_free(bo);
 }
 
 drm_public int drm_tegra_bo_get_handle(struct drm_tegra_bo *bo, uint32_t *handle)
 {
-	if (!bo || !handle)
-		return -EINVAL;
+    if (!bo || !handle)
+        return -EINVAL;
 
-	*handle = bo->handle;
+    *handle = bo->handle;
 
-	return 0;
+    return 0;
 }
 
 drm_public int drm_tegra_bo_map(struct drm_tegra_bo *bo, void **ptr)
 {
-	struct drm_tegra *drm = bo->drm;
+    struct drm_tegra *drm = bo->drm;
 
-	if (!bo->map) {
-		struct drm_tegra_gem_mmap args;
-		int err;
+    if (!bo->map) {
+        struct drm_tegra_gem_mmap args;
+        int err;
 
-		memset(&args, 0, sizeof(args));
-		args.handle = bo->handle;
+        memset(&args, 0, sizeof(args));
+        args.handle = bo->handle;
 
-		err = drmCommandWriteRead(drm->fd, DRM_TEGRA_GEM_MMAP, &args,
-					  sizeof(args));
-		if (err < 0)
-			return -errno;
+        err = drmCommandWriteRead(drm->fd, DRM_TEGRA_GEM_MMAP, &args,
+                                  sizeof(args));
+        if (err < 0)
+            return -errno;
 
-		bo->offset = args.offset;
+        bo->offset = args.offset;
 
-		bo->map = mmap(0, bo->size, PROT_READ | PROT_WRITE, MAP_SHARED,
-			       drm->fd, bo->offset);
-		if (bo->map == MAP_FAILED) {
-			bo->map = NULL;
-			return -errno;
-		}
-	}
+        bo->map = mmap(0, bo->size, PROT_READ | PROT_WRITE, MAP_SHARED,
+                       drm->fd, bo->offset);
+        if (bo->map == MAP_FAILED) {
+            bo->map = NULL;
+            return -errno;
+        }
+    }
 
-	if (ptr)
-		*ptr = bo->map;
+    if (ptr)
+        *ptr = bo->map;
 
-	return 0;
+    return 0;
 }
 
 drm_public int drm_tegra_bo_unmap(struct drm_tegra_bo *bo)
 {
-	if (!bo)
-		return -EINVAL;
+    if (!bo)
+        return -EINVAL;
 
-	if (!bo->map)
-		return 0;
+    if (!bo->map)
+        return 0;
 
-	if (munmap(bo->map, bo->size))
-		return -errno;
+    if (munmap(bo->map, bo->size))
+        return -errno;
 
-	bo->map = NULL;
+    bo->map = NULL;
 
-	return 0;
+    return 0;
 }
 
 drm_public int drm_tegra_bo_get_flags(struct drm_tegra_bo *bo, uint32_t *flags)
 {
-	struct drm_tegra_gem_get_flags args;
-	struct drm_tegra *drm = bo->drm;
-	int err;
+    struct drm_tegra_gem_get_flags args;
+    struct drm_tegra *drm = bo->drm;
+    int err;
 
-	if (!bo)
-		return -EINVAL;
+    if (!bo)
+        return -EINVAL;
 
-	memset(&args, 0, sizeof(args));
-	args.handle = bo->handle;
+    memset(&args, 0, sizeof(args));
+    args.handle = bo->handle;
 
-	err = drmCommandWriteRead(drm->fd, DRM_TEGRA_GEM_GET_FLAGS, &args,
-				  sizeof(args));
-	if (err < 0)
-		return -errno;
+    err = drmCommandWriteRead(drm->fd, DRM_TEGRA_GEM_GET_FLAGS, &args,
+                              sizeof(args));
+    if (err < 0)
+        return -errno;
 
-	if (flags)
-		*flags = args.flags;
+    if (flags)
+        *flags = args.flags;
 
-	return 0;
+    return 0;
 }
 
 drm_public int drm_tegra_bo_set_flags(struct drm_tegra_bo *bo, uint32_t flags)
 {
-	struct drm_tegra_gem_get_flags args;
-	struct drm_tegra *drm = bo->drm;
-	int err;
+    struct drm_tegra_gem_get_flags args;
+    struct drm_tegra *drm = bo->drm;
+    int err;
 
-	if (!bo)
-		return -EINVAL;
+    if (!bo)
+        return -EINVAL;
 
-	memset(&args, 0, sizeof(args));
-	args.handle = bo->handle;
-	args.flags = flags;
+    memset(&args, 0, sizeof(args));
+    args.handle = bo->handle;
+    args.flags = flags;
 
-	err = drmCommandWriteRead(drm->fd, DRM_TEGRA_GEM_SET_FLAGS, &args,
-				  sizeof(args));
-	if (err < 0)
-		return -errno;
+    err = drmCommandWriteRead(drm->fd, DRM_TEGRA_GEM_SET_FLAGS, &args,
+                              sizeof(args));
+    if (err < 0)
+        return -errno;
 
-	return 0;
+    return 0;
 }
 
-drm_public int drm_tegra_bo_get_tiling(struct drm_tegra_bo *bo,
-			    struct drm_tegra_bo_tiling *tiling)
+drm_public int
+drm_tegra_bo_get_tiling(struct drm_tegra_bo *bo,
+                        struct drm_tegra_bo_tiling *tiling)
 {
-	struct drm_tegra_gem_get_tiling args;
-	struct drm_tegra *drm = bo->drm;
-	int err;
+    struct drm_tegra_gem_get_tiling args;
+    struct drm_tegra *drm = bo->drm;
+    int err;
 
-	if (!bo)
-		return -EINVAL;
+    if (!bo)
+        return -EINVAL;
 
-	memset(&args, 0, sizeof(args));
-	args.handle = bo->handle;
+    memset(&args, 0, sizeof(args));
+    args.handle = bo->handle;
 
-	err = drmCommandWriteRead(drm->fd, DRM_TEGRA_GEM_GET_TILING, &args,
-				  sizeof(args));
-	if (err < 0)
-		return -errno;
+    err = drmCommandWriteRead(drm->fd, DRM_TEGRA_GEM_GET_TILING, &args,
+                              sizeof(args));
+    if (err < 0)
+        return -errno;
 
-	if (tiling) {
-		tiling->mode = args.mode;
-		tiling->value = args.value;
-	}
+    if (tiling) {
+        tiling->mode = args.mode;
+        tiling->value = args.value;
+    }
 
-	return 0;
+    return 0;
 }
 
-drm_public int drm_tegra_bo_set_tiling(struct drm_tegra_bo *bo,
-			    const struct drm_tegra_bo_tiling *tiling)
+drm_public int
+drm_tegra_bo_set_tiling(struct drm_tegra_bo *bo,
+                        const struct drm_tegra_bo_tiling *tiling)
 {
-	struct drm_tegra_gem_set_tiling args;
-	struct drm_tegra *drm = bo->drm;
-	int err;
+    struct drm_tegra_gem_set_tiling args;
+    struct drm_tegra *drm = bo->drm;
+    int err;
 
-	if (!bo)
-		return -EINVAL;
+    if (!bo)
+        return -EINVAL;
 
-	memset(&args, 0, sizeof(args));
-	args.handle = bo->handle;
-	args.mode = tiling->mode;
-	args.value = tiling->value;
+    memset(&args, 0, sizeof(args));
+    args.handle = bo->handle;
+    args.mode = tiling->mode;
+    args.value = tiling->value;
 
-	err = drmCommandWriteRead(drm->fd, DRM_TEGRA_GEM_SET_TILING, &args,
-				  sizeof(args));
-	if (err < 0)
-		return -errno;
+    err = drmCommandWriteRead(drm->fd, DRM_TEGRA_GEM_SET_TILING, &args,
+                              sizeof(args));
+    if (err < 0)
+        return -errno;
 
-	return 0;
+    return 0;
 }
diff --git a/tegra/tegra.h b/tegra/tegra.h
index 31b0995ad691..62205a5174b4 100644
--- a/tegra/tegra.h
+++ b/tegra/tegra.h
@@ -35,9 +35,9 @@ int drm_tegra_new(struct drm_tegra **drmp, int fd);
 void drm_tegra_close(struct drm_tegra *drm);
 
 int drm_tegra_bo_new(struct drm_tegra_bo **bop, struct drm_tegra *drm,
-		     uint32_t flags, uint32_t size);
+                     uint32_t flags, uint32_t size);
 int drm_tegra_bo_wrap(struct drm_tegra_bo **bop, struct drm_tegra *drm,
-		      uint32_t handle, uint32_t flags, uint32_t size);
+                      uint32_t handle, uint32_t flags, uint32_t size);
 struct drm_tegra_bo *drm_tegra_bo_ref(struct drm_tegra_bo *bo);
 void drm_tegra_bo_unref(struct drm_tegra_bo *bo);
 int drm_tegra_bo_get_handle(struct drm_tegra_bo *bo, uint32_t *handle);
@@ -48,13 +48,13 @@ int drm_tegra_bo_get_flags(struct drm_tegra_bo *bo, uint32_t *flags);
 int drm_tegra_bo_set_flags(struct drm_tegra_bo *bo, uint32_t flags);
 
 struct drm_tegra_bo_tiling {
-	uint32_t mode;
-	uint32_t value;
+    uint32_t mode;
+    uint32_t value;
 };
 
 int drm_tegra_bo_get_tiling(struct drm_tegra_bo *bo,
-			    struct drm_tegra_bo_tiling *tiling);
+                            struct drm_tegra_bo_tiling *tiling);
 int drm_tegra_bo_set_tiling(struct drm_tegra_bo *bo,
-			    const struct drm_tegra_bo_tiling *tiling);
+                            const struct drm_tegra_bo_tiling *tiling);
 
 #endif /* __DRM_TEGRA_H__ */
diff --git a/tests/tegra/openclose.c b/tests/tegra/openclose.c
index f80f52d477ee..104e83806f3a 100644
--- a/tests/tegra/openclose.c
+++ b/tests/tegra/openclose.c
@@ -31,37 +31,37 @@ static const char default_device[] = "/dev/dri/card0";
 
 int main(int argc, char *argv[])
 {
-	struct drm_tegra *tegra;
-	drmVersionPtr version;
-	const char *device;
-	int err, fd;
+    struct drm_tegra *tegra;
+    drmVersionPtr version;
+    const char *device;
+    int err, fd;
 
-	if (argc < 2)
-		device = default_device;
-	else
-		device = argv[1];
+    if (argc < 2)
+        device = default_device;
+    else
+        device = argv[1];
 
-	fd = open(device, O_RDWR);
-	if (fd < 0)
-		return 1;
+    fd = open(device, O_RDWR);
+    if (fd < 0)
+        return 1;
 
-	version = drmGetVersion(fd);
-	if (version) {
-		printf("Version: %d.%d.%d\n", version->version_major,
-		       version->version_minor, version->version_patchlevel);
-		printf("  Name: %s\n", version->name);
-		printf("  Date: %s\n", version->date);
-		printf("  Description: %s\n", version->desc);
+    version = drmGetVersion(fd);
+    if (version) {
+        printf("Version: %d.%d.%d\n", version->version_major,
+               version->version_minor, version->version_patchlevel);
+        printf("  Name: %s\n", version->name);
+        printf("  Date: %s\n", version->date);
+        printf("  Description: %s\n", version->desc);
 
-		drmFreeVersion(version);
-	}
+        drmFreeVersion(version);
+    }
 
-	err = drm_tegra_new(&tegra, fd);
-	if (err < 0)
-		return 1;
+    err = drm_tegra_new(&tegra, fd);
+    if (err < 0)
+        return 1;
 
-	drm_tegra_close(tegra);
-	close(fd);
+    drm_tegra_close(tegra);
+    close(fd);
 
-	return 0;
+    return 0;
 }
-- 
2.32.0

