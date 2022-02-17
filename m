Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87E94BA97E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2CA10E432;
	Thu, 17 Feb 2022 19:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC82D10E3F8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 19:16:30 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id k25so9573327ejp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1y3fU4srGaYEMp31jhbVVcL8asWau+YRKnH+gv7Axl8=;
 b=iCLHdvmqJ97q6j08n6TzEvLnlAABp388Zj/kCcrAxM/ePphT4mwWVzGB9QayD9J+DP
 dW68QchfeKuZKuUYyJBK6cinz3hlUOn2nIZN931Oz+rPo+Zw7VUTeTtnSU3Wuem7m53l
 QLoS7gNhkaUo0CZvA3uItl4PNQv+ARtlEybG9eG1xQGEw+3Tn+Zx3DfCCKQbGgtDhaP/
 a0zYbQvG0seGu0KwcIOl+UO9FSUiJpFUw16RxNDSr6wsCwkPTUe2dj+/lZ5jWEKTLYJ/
 4TlEe0L8yyeoT9E32UxxmtlUqPdATTFMFymNqLxFeXRWQC2+MyIbc8D7+xFBQyxlg5Eb
 7fAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1y3fU4srGaYEMp31jhbVVcL8asWau+YRKnH+gv7Axl8=;
 b=16xx7Lki+ZjR9DvM4AeetO9BBIY8TgfacvXRFHsXMx5JUNKkyHOjo/2WsQKbiS5J9i
 37awBIhugMrY3jxoOAW7Y74wr3jI83KrlIvMISLyK7J3dHdfaFcqGmY58AItEHwnjLAH
 48wvVBrnIfgHYxT4SYEJaM1gMQnnum3voauaF2fLCcLn0pFjkBS++F0qHwZdm3a8vt9N
 tgIDelFr8VdGSlD/JPsqSTVHaMW3JdS/UrQKzK6Eh2Rq9kaiXW2j/bgYMoz0nZcawrmi
 xlTOGN93lztW2juEg5A/TJOSkoGBtGgMpH18WnSMhKgNBY9kDu5nQSVjB+c1/cEdJqCN
 q4cg==
X-Gm-Message-State: AOAM530RMZ+pVca6yW6G74x6SIrZiIqLS+pM4qsDIgniC6ADTwTctO1E
 wwkTj1V6n4Qq+51g78/m55o=
X-Google-Smtp-Source: ABdhPJwf48Xi8bTA+XiJxo1/ROLb8jyaFg8X+QymBUPLJr69QOLJ7VjPhrPX05PprWKLXiBqcVuqBQ==
X-Received: by 2002:a17:906:2a85:b0:6ce:36bd:bcd9 with SMTP id
 l5-20020a1709062a8500b006ce36bdbcd9mr3524676eje.318.1645125389334; 
 Thu, 17 Feb 2022 11:16:29 -0800 (PST)
Received: from localhost
 (p200300e41f0a6900000000000000043a.dip0.t-ipconnect.de.
 [2003:e4:1f0a:6900::43a])
 by smtp.gmail.com with ESMTPSA id 5sm1457659ejq.131.2022.02.17.11.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 11:16:28 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH libdrm v2 01/25] tegra: Indent according to .editorconfig
Date: Thu, 17 Feb 2022 20:16:01 +0100
Message-Id: <20220217191625.2534521-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217191625.2534521-1-thierry.reding@gmail.com>
References: <20220217191625.2534521-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Reindent the sources according to the settings found in the newly added
.editorconfig.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/private.h         |  18 +--
 tegra/tegra.c           | 348 ++++++++++++++++++++--------------------
 tegra/tegra.h           |  12 +-
 tests/tegra/openclose.c |  52 +++---
 4 files changed, 217 insertions(+), 213 deletions(-)

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
index 420b171c5dd5..95aaa4b35425 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -37,288 +37,292 @@
 
 static void drm_tegra_bo_free(struct drm_tegra_bo *bo)
 {
-	struct drm_tegra *drm = bo->drm;
+    struct drm_tegra *drm = bo->drm;
 
-	if (bo->map)
-		munmap(bo->map, bo->size);
+    if (bo->map)
+        munmap(bo->map, bo->size);
 
-	drmCloseBufferHandle(drm->fd, bo->handle);
+    drmCloseBufferHandle(drm->fd, bo->handle);
 
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
2.35.1

