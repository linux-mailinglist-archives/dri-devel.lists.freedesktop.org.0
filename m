Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 587134BA97D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D0210E3F8;
	Thu, 17 Feb 2022 19:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A9010E3F8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 19:16:32 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id p15so9550604ejc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KZQUJqYQtpwHm8Jw/glz0xQYWjJ+0JJKpnndECzGY4Q=;
 b=MvGRraKBkD72zS1FCzMhKwbni+LBYEmCCirMy0vRbZDKq9DWE4fBukwxiF2oBtyrdU
 b8DbwDimsmIee2ue+hFAmzCxsgC3/ffyoXpBv/W6uwVFCZNJVBI6hpk22hcojMRHeJT8
 VM7tebRaG8xf+KjnMXQ2pCmI0SqXxByiyoxKpN+Zrb3ogRSOY0bnSwVparW/RIvCRIAg
 k7Qox74uxDyHg/Thr+HONpWLOTlK4zdWNRWDqNzLMOCHuY1SaNR9E8Tgp+TU66C9A2QR
 lhyid0XKXZGct4mW8THN2XWqZM/ZDU33Oj6ERk0mdy57i/rdScj0x1ArtraqpOwxcOV1
 I9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KZQUJqYQtpwHm8Jw/glz0xQYWjJ+0JJKpnndECzGY4Q=;
 b=TXtwGl81hh5q5sTGRZ4zAGk2XpFWIPKWy4bjwUyj0w+SfDduW1X711sj+FI87yzxW3
 sZnWjhhzhG11VRTRV7Vi7VLN/dsDw7CbEv360ZRlHDrvUdGPfqMsyflI11Fcc8QmRG1d
 QcX6NE9iJiYmNcWJiTK+ORj/6UN6DvZ/MIorD2258xzBjv8PdX47JCYQ0ES0d/glHEnE
 jYx7O+S/H7/9L+vTrENpAqfIgSgnPWNe3VqYk7JZbKjIo/1/gqa5hZul13I4XVP8qCEC
 aBcchUj8IblMTh+hdvbkcefZUdXdxU/cn4eMQWhXF0lnn6yg9cKW9YVaBSvFWj4oH2A0
 jIgA==
X-Gm-Message-State: AOAM5314Dd42Oh6aTbim/vp43iaSwDa6vYKPn92cAfVSXmq7AtECONtR
 y5gpWzw+HxMyYCv+r59Iahs=
X-Google-Smtp-Source: ABdhPJwjQq45dOg8xjpujybY/9t0KYUaADfjXHElHT4jRAGbGUE61qMMqzS2NzYhEwCBnxAGH3gJyg==
X-Received: by 2002:a17:907:7663:b0:6ce:fdd:762d with SMTP id
 kk3-20020a170907766300b006ce0fdd762dmr3700362ejc.750.1645125391199; 
 Thu, 17 Feb 2022 11:16:31 -0800 (PST)
Received: from localhost
 (p200300e41f0a6900000000000000043a.dip0.t-ipconnect.de.
 [2003:e4:1f0a:6900::43a])
 by smtp.gmail.com with ESMTPSA id s30sm1464563ejm.158.2022.02.17.11.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 11:16:30 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH libdrm v2 02/25] tegra: Remove unused IOCTL implementations
Date: Thu, 17 Feb 2022 20:16:02 +0100
Message-Id: <20220217191625.2534521-3-thierry.reding@gmail.com>
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
index 95aaa4b35425..630aea45f957 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -231,98 +231,3 @@ drm_public int drm_tegra_bo_unmap(struct drm_tegra_bo *bo)
 
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
2.35.1

