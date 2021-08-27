Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C46233F99A8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A546E93C;
	Fri, 27 Aug 2021 13:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB98F6E93B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:23:16 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id g18so2865079wrc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EZTSlK8m9j6jEUpGDQkFFtC2HGi55bNPj2cNJA6xJ8c=;
 b=Ut2M5UGog9gO8G/Ppn2E520PORW/21cWPF7Lpas1VlsVQjA7cfuHnWSeRLneRjVctu
 sijJ4KhJeez+nb9o3LOTR+hN863b4WG+Q92129i8G89+b2R0w4fFc7j4fmOaT7IudCis
 a/AWCJFsIFvHJ6xu/xzwI+cN1D6wpwMjEEVcsSDP8oRo93AUbcnOe8c2ME4sUoLgLX4q
 eEwZzJJjm1o0VkY9eAgQAweeZA4ixPpNKFGvEwAFGLCc0Mf/JZ+Lp5KffVspv5r4AyZW
 Q+ewpme+vkc14zOPmVpiqAZzRYEpJJ3U4NqenowejWaLYUWn4TCWwAheFGUI3OHT7sUl
 nwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EZTSlK8m9j6jEUpGDQkFFtC2HGi55bNPj2cNJA6xJ8c=;
 b=EtdUQum/ftBS7mnqnli8zzTzvlmmfosRwiYPzK9MZf771WShL7w38RvQoTIs/7St/H
 MU+rHCY6iByT8iC8WoGbhcdTYnB9fwoyaA5vE1QbeGFmKRw/UhwrwfwZ966EHyqu8yNZ
 b7S5H0atcDpI30XGFP+RHxrnytv69n4KPpTxkcUxYXKbtD7705bwT+bUn48QlpbmvjYN
 tcS9WXrCywiRQQW2jVzY2qhrVC1AknNq73iKC+ooegyXMt6ZIO1l3julCSq+NcG9Z680
 yLsA3GG4yFumso/ljUUNOu19SBY89QFNNYKLi0j0h22hoNuNEg/xvyBZwLxFKUm7DvJq
 DChw==
X-Gm-Message-State: AOAM531mkYOYLJruKCo8fQ4xO9tHO3c36Ho2NEZRYVfaaaEPEhNBSxFT
 mIXjRwTFO3LMbW8RHMtZHDpxFOOCOD4=
X-Google-Smtp-Source: ABdhPJxdn+04LLfydGRCS++9ob2AqrmhbAQFRaMa3sSrpUj0QdAcfqWJOtmWb4ZODh7l+h9ajJt7Lg==
X-Received: by 2002:a5d:6483:: with SMTP id o3mr10127268wri.197.1630070595517; 
 Fri, 27 Aug 2021 06:23:15 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id o26sm1090196wmc.17.2021.08.27.06.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:23:14 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 02/25] tegra: Remove unused IOCTL implementations
Date: Fri, 27 Aug 2021 15:22:42 +0200
Message-Id: <20210827132305.3572077-3-thierry.reding@gmail.com>
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

The DRM_TEGRA_GEM_{GET,SET}_FLAGS and DRM_TEGRA_GEM_{GET,SET}_TILING
IOCTLs were badly designed and have since been obsoleted by framebuffer
modifiers. Remove these implementations to make it clear their usage is
discouraged.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/tegra-symbols.txt |  4 --
 tegra/tegra.c           | 95 -----------------------------------------
 tegra/tegra.h           | 12 ------
 3 files changed, 111 deletions(-)

diff --git a/tegra/tegra-symbols.txt b/tegra/tegra-symbols.txt
index 5e3e955f2901..9422696c1416 100644
--- a/tegra/tegra-symbols.txt
+++ b/tegra/tegra-symbols.txt
@@ -1,11 +1,7 @@
-drm_tegra_bo_get_flags
 drm_tegra_bo_get_handle
-drm_tegra_bo_get_tiling
 drm_tegra_bo_map
 drm_tegra_bo_new
 drm_tegra_bo_ref
-drm_tegra_bo_set_flags
-drm_tegra_bo_set_tiling
 drm_tegra_bo_unmap
 drm_tegra_bo_unref
 drm_tegra_bo_wrap
diff --git a/tegra/tegra.c b/tegra/tegra.c
index 3caf0bc4e65e..94840ad42795 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -235,98 +235,3 @@ drm_public int drm_tegra_bo_unmap(struct drm_tegra_bo *bo)
 
     return 0;
 }
-
-drm_public int drm_tegra_bo_get_flags(struct drm_tegra_bo *bo, uint32_t *flags)
-{
-    struct drm_tegra_gem_get_flags args;
-    struct drm_tegra *drm = bo->drm;
-    int err;
-
-    if (!bo)
-        return -EINVAL;
-
-    memset(&args, 0, sizeof(args));
-    args.handle = bo->handle;
-
-    err = drmCommandWriteRead(drm->fd, DRM_TEGRA_GEM_GET_FLAGS, &args,
-                              sizeof(args));
-    if (err < 0)
-        return -errno;
-
-    if (flags)
-        *flags = args.flags;
-
-    return 0;
-}
-
-drm_public int drm_tegra_bo_set_flags(struct drm_tegra_bo *bo, uint32_t flags)
-{
-    struct drm_tegra_gem_get_flags args;
-    struct drm_tegra *drm = bo->drm;
-    int err;
-
-    if (!bo)
-        return -EINVAL;
-
-    memset(&args, 0, sizeof(args));
-    args.handle = bo->handle;
-    args.flags = flags;
-
-    err = drmCommandWriteRead(drm->fd, DRM_TEGRA_GEM_SET_FLAGS, &args,
-                              sizeof(args));
-    if (err < 0)
-        return -errno;
-
-    return 0;
-}
-
-drm_public int
-drm_tegra_bo_get_tiling(struct drm_tegra_bo *bo,
-                        struct drm_tegra_bo_tiling *tiling)
-{
-    struct drm_tegra_gem_get_tiling args;
-    struct drm_tegra *drm = bo->drm;
-    int err;
-
-    if (!bo)
-        return -EINVAL;
-
-    memset(&args, 0, sizeof(args));
-    args.handle = bo->handle;
-
-    err = drmCommandWriteRead(drm->fd, DRM_TEGRA_GEM_GET_TILING, &args,
-                              sizeof(args));
-    if (err < 0)
-        return -errno;
-
-    if (tiling) {
-        tiling->mode = args.mode;
-        tiling->value = args.value;
-    }
-
-    return 0;
-}
-
-drm_public int
-drm_tegra_bo_set_tiling(struct drm_tegra_bo *bo,
-                        const struct drm_tegra_bo_tiling *tiling)
-{
-    struct drm_tegra_gem_set_tiling args;
-    struct drm_tegra *drm = bo->drm;
-    int err;
-
-    if (!bo)
-        return -EINVAL;
-
-    memset(&args, 0, sizeof(args));
-    args.handle = bo->handle;
-    args.mode = tiling->mode;
-    args.value = tiling->value;
-
-    err = drmCommandWriteRead(drm->fd, DRM_TEGRA_GEM_SET_TILING, &args,
-                              sizeof(args));
-    if (err < 0)
-        return -errno;
-
-    return 0;
-}
diff --git a/tegra/tegra.h b/tegra/tegra.h
index 62205a5174b4..c6b4f984de45 100644
--- a/tegra/tegra.h
+++ b/tegra/tegra.h
@@ -44,17 +44,5 @@ int drm_tegra_bo_get_handle(struct drm_tegra_bo *bo, uint32_t *handle);
 int drm_tegra_bo_map(struct drm_tegra_bo *bo, void **ptr);
 int drm_tegra_bo_unmap(struct drm_tegra_bo *bo);
 
-int drm_tegra_bo_get_flags(struct drm_tegra_bo *bo, uint32_t *flags);
-int drm_tegra_bo_set_flags(struct drm_tegra_bo *bo, uint32_t flags);
-
-struct drm_tegra_bo_tiling {
-    uint32_t mode;
-    uint32_t value;
-};
-
-int drm_tegra_bo_get_tiling(struct drm_tegra_bo *bo,
-                            struct drm_tegra_bo_tiling *tiling);
-int drm_tegra_bo_set_tiling(struct drm_tegra_bo *bo,
-                            const struct drm_tegra_bo_tiling *tiling);
 
 #endif /* __DRM_TEGRA_H__ */
-- 
2.32.0

