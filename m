Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3F1A736EA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 17:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F61710E1F4;
	Thu, 27 Mar 2025 16:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lLXOBR4+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A1710E178
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 16:36:08 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-226185948ffso27554065ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 09:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743093368; x=1743698168; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LmxjHPEoAvJ9V++u0ZZKt2L66dWQUhIJPZo7wO/C09Q=;
 b=lLXOBR4+oev+i+GKCk1E5Rhnb41p65RnrCshCPpwQzuvr7QUx+x903OKlQjmOiDGj7
 U7JVibmhDM+VlqR0YV2K21TrvUyMXl9TT/zxUMX7Z+XHv3zhZW4w5KBmFDucXbp6/mhE
 I2WwyucBkzlPbwd6LVpRuGjnUQ1ayV6iV5ClCXWYmbaJ7ZsFnSdH5eJwVl3kRy9SAZYc
 QRSZWdyA9749kBBldFCFEIY8LPrlgyXwKWj7kobaqI7Qq/B8g6H4wfnRLKiPFjKdhlQz
 F0DzQ6Jat6l9ggyKP1l8qNct8TMN7xcMf9QCHTiLQobGpgLmKbhXTE8y14Qrkn6FlRVO
 jBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743093368; x=1743698168;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LmxjHPEoAvJ9V++u0ZZKt2L66dWQUhIJPZo7wO/C09Q=;
 b=uK15yp7Hs4/2YudUt/BGvCALJ63idzNw4o5dVtPMEmKcUv92gtimx83DnXyQyTHqC/
 9WpxGUsI8Xu7gvIilvwcbScIj0ZwwuAQxcXl/bcpaXsEYYJnsvxbbOocodxQunf6kVkK
 ZNMXEm/IwKqQkjutCAoA15zYjNKXmLXnOEfebHKtyzD4AVmHtFA/UFF5Ydy1DDeFFZZV
 qIO39WrE8alf5pmd0YmWY7UmlDXhl0CF2reXP+dGj0u6QWGy4I9FSCwnf8AAyXDS1wvV
 r+oOpLbUMLTfvOW54YKphqNvD0cdp4phIl2T7f+5BSM6867pxEoMw6kfaPn8im5IO/do
 vQDg==
X-Gm-Message-State: AOJu0YzOhWhvMoHUjQmpHCqsdOZQV4ZT+s7hMecN3lst+FJbgw6EMhYD
 CvKIcebqSoVW3NSZTrMzpK523fAKwjw/E/08a23OIFZlzafNs57o1/fEDQ==
X-Gm-Gg: ASbGncvFtOj7QclekGXgznCxbW2CyKveiluGTG9LKHJM0QBIL4yZRiM2JuTmSaB5c5Y
 DDZyyOqaVZp2LHl74Z/jreJJ+tdYp+tfdoCNjMyGRkwPClqU8eB/t2ojkN7UrHr3ndpuYVRAAnO
 +dpTD0WRWgsLA8OZYrtFUTunvTirPDWWkjwcFMhDBRTfl+vluxtDgQ0idxa+aIN8a8PaFMoiiLq
 GjWUVP8fHo5V9QdliWQUQNAj95lb0OBJsT4NsJsHtC/OwL4RYwmaiEin2RrZrIh+k/xnOX4U/qM
 APv81Fbtv3D5pbGDFhrvOU011nS+kIXUK3Ek0tbBrBUniXTF+Q+3kKyGrTibdGBb5rBYuWCnQ3+
 lp1oC7iY7IWthpSbk3aE=
X-Google-Smtp-Source: AGHT+IHWZDl5zkqZIwHY29NR0GM8Q+CqAF9P42JqdFTTVI0DfFTzZMOYU6wY0UHJwzx2ehMvee/T6w==
X-Received: by 2002:a17:902:db0f:b0:223:525b:2a7 with SMTP id
 d9443c01a7336-228048b23ccmr63535595ad.15.1743093367707; 
 Thu, 27 Mar 2025 09:36:07 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291f1dece6sm1539855ad.192.2025.03.27.09.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 09:36:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-kernel@vger.kernel.org (open list),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v3] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs
Date: Thu, 27 Mar 2025 09:36:05 -0700
Message-ID: <20250327163605.54760-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
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

From: Rob Clark <robdclark@chromium.org>

Add support for exporting a dma_fence fd for a specific point on a
timeline.  This is needed for vtest/vpipe[1][2] to implement timeline
syncobj support, as it needs a way to turn a point on a timeline back
into a dma_fence fd.  It also closes an odd omission from the syncobj
UAPI.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33433
[2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/805

v2: Add DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE
v3: Add unstaged uabi header hunk

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_syncobj.c | 18 +++++++++++++-----
 include/uapi/drm/drm.h        |  3 +++
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 4f2ab8a7b50f..bc57d6f1a22e 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -762,7 +762,7 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 }
 
 static int drm_syncobj_export_sync_file(struct drm_file *file_private,
-					int handle, int *p_fd)
+					int handle, u64 point, int *p_fd)
 {
 	int ret;
 	struct dma_fence *fence;
@@ -772,7 +772,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
 	if (fd < 0)
 		return fd;
 
-	ret = drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
+	ret = drm_syncobj_find_fence(file_private, handle, point, 0, &fence);
 	if (ret)
 		goto err_put_fd;
 
@@ -869,6 +869,9 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 				   struct drm_file *file_private)
 {
 	struct drm_syncobj_handle *args = data;
+	unsigned valid_flags = DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE |
+			       DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE;
+	u64 point = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
 		return -EOPNOTSUPP;
@@ -876,13 +879,18 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
-	if (args->flags != 0 &&
-	    args->flags != DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
+	if (args->flags != 0 && (args->flags & ~valid_flags))
 		return -EINVAL;
 
+	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE)
+		point = args->point;
+
 	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
 		return drm_syncobj_export_sync_file(file_private, args->handle,
-						    &args->fd);
+						    point, &args->fd);
+
+	if (args->point)
+		return -EINVAL;
 
 	return drm_syncobj_handle_to_fd(file_private, args->handle,
 					&args->fd);
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 7fba37b94401..dd0fd13eadbd 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -906,12 +906,15 @@ struct drm_syncobj_destroy {
 
 #define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE (1 << 0)
 #define DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE (1 << 0)
+#define DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE         (1 << 1)
 struct drm_syncobj_handle {
 	__u32 handle;
 	__u32 flags;
 
 	__s32 fd;
 	__u32 pad;
+
+	__u64 point;
 };
 
 struct drm_syncobj_transfer {
-- 
2.49.0

