Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D60C9A78488
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 00:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B0E10E0CC;
	Tue,  1 Apr 2025 22:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b2gXNUyo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283A410E0CC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 22:16:49 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-224171d6826so95689155ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 15:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743545808; x=1744150608; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6pjJFrDt3l5lA2Y5cy0IcLmKsiR6lTrZ7yPV2lCZbZg=;
 b=b2gXNUyoxt+yomIeRnx6XLHpCWAq1Pcc7/js6OQo5b9s4c40bP39UjdL/mK6XvFHFx
 ejIJWCPqpsxeoqEfveQ3PrMFFNARNu4x7tyMqobgBkgYD85aqlwmzypH1no8qVFzrqH8
 kGGr/viVZbRRIOBZmutO7TPih8gsgED4VGmIykmkoAeS86A8XxlDJSfjQBA46AnxVCzm
 CP4NPykoTqQrHRLzgtBBK4AoxM0oRDviNHjA9mQdmYgFTBmmDhQeXJCdumnGVG+2q20O
 MFcRb8gJvcjMpPnEi31mIg0umyauj0rDemFzzI7UlDbAOMGk3K4Dr++/XZQDXpOQnwKQ
 oVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743545808; x=1744150608;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6pjJFrDt3l5lA2Y5cy0IcLmKsiR6lTrZ7yPV2lCZbZg=;
 b=GfBgaigXjT1f//UrfbXDEcr117AYBBELxKr2iThqayogryQu1dHMRhvWbQUol544g+
 wp2MRiDq3WF7f3TBlJwTG5kG5uIjizCKSUjqKcWY+cBC9WhxSbQeOnVk5iYUz0Dk/QxN
 c74iRfBLUg8rBGnmey3TEu6nX3ZbH84V3WK3HHH2Do9/EZmFk/0SD2y4NqY28Bhbh5vf
 irv0KgRoBjwGlPYFVzw6mcZ/bp4GO9UGgBBrI4wHHEzmbIY7xpMhSp+U4udrPjxUkOSy
 /zO/vn0yoEUJm2xb5Y4bhsQy1C/tSyeZGzVN0I1kDg7lzXTDsWIh9jLRtxMzaZuvEZEB
 5Jiw==
X-Gm-Message-State: AOJu0Yz1BboLRqoK2IxIMJmcFOfznt0AB1/85d24jJpVn1lQkqtsc21B
 HU2tmQKMBDEsqi1rX8vxENNnHBgVABXN4hJsobKYcs+bCDb0TQ5zEShjBQ==
X-Gm-Gg: ASbGncs1qFinXCzWLS9RlDt9aKCe4b6C30DXABzcTRTyX15K7bFuUblrf4Pq9kd5qnz
 T9CCmm9+PJn5+Qpwc7Lhs2ch4L4pn4GNODlvsAnNSU3xxfKEFU2LiQJ6LfqXDSeg8/IZP0yyNLO
 dpMMjrBi82zG0AYJr2AnY/5NQQ5gKaCRiLHIHUefnufkM5WcjjaEyfBZrEtPGpgZhJ8y9YWFCh/
 s13437qSNS+nzPzTQp+arjliMPrz/XOUS/0e+y1GLKAflW7azd3XChAmmzlCj9kksSnBqz2XcJ8
 oGU9wst+OqwExQiSIFJ7wK6y5NdwZdiPGv0MbAoq3tSBg4wO23mH1P+MKcDcb/4hoEmnVVM0b2P
 RN0wy4ShU8do02Pae+v8=
X-Google-Smtp-Source: AGHT+IFWsM/vg8gTEwV01NxefY3BYdtce+TTnANxhcuLyKtYcd30tGt/Vxio0MWSb+uhR603BU132w==
X-Received: by 2002:a17:903:11d2:b0:220:c86d:d7eb with SMTP id
 d9443c01a7336-2292f9e529dmr241352415ad.36.1743545808126; 
 Tue, 01 Apr 2025 15:16:48 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291f1cf14csm94451805ad.137.2025.04.01.15.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 15:16:47 -0700 (PDT)
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
Subject: [PATCH v7] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs
Date: Tue,  1 Apr 2025 15:16:43 -0700
Message-ID: <20250401221643.87504-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
v4: Also handle IMPORT_SYNC_FILE case
v5: Address comments from Dmitry
v6: checkpatch.pl nits
v7: Add check for DRIVER_SYNCOBJ_TIMELINE

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_syncobj.c | 53 ++++++++++++++++++++++++++++-------
 include/uapi/drm/drm.h        |  4 +++
 2 files changed, 47 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 4f2ab8a7b50f..3e41461eb9d6 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -741,7 +741,7 @@ static int drm_syncobj_fd_to_handle(struct drm_file *file_private,
 }
 
 static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
-					      int fd, int handle)
+					      int fd, int handle, u64 point)
 {
 	struct dma_fence *fence = sync_file_get_fence(fd);
 	struct drm_syncobj *syncobj;
@@ -755,14 +755,24 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 		return -ENOENT;
 	}
 
-	drm_syncobj_replace_fence(syncobj, fence);
+	if (point) {
+		struct dma_fence_chain *chain = dma_fence_chain_alloc();
+
+		if (!chain)
+			return -ENOMEM;
+
+		drm_syncobj_add_point(syncobj, chain, fence, point);
+	} else {
+		drm_syncobj_replace_fence(syncobj, fence);
+	}
+
 	dma_fence_put(fence);
 	drm_syncobj_put(syncobj);
 	return 0;
 }
 
 static int drm_syncobj_export_sync_file(struct drm_file *file_private,
-					int handle, int *p_fd)
+					int handle, u64 point, int *p_fd)
 {
 	int ret;
 	struct dma_fence *fence;
@@ -772,7 +782,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
 	if (fd < 0)
 		return fd;
 
-	ret = drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
+	ret = drm_syncobj_find_fence(file_private, handle, point, 0, &fence);
 	if (ret)
 		goto err_put_fd;
 
@@ -869,6 +879,9 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 				   struct drm_file *file_private)
 {
 	struct drm_syncobj_handle *args = data;
+	unsigned int valid_flags = DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE |
+				   DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE;
+	u64 point = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
 		return -EOPNOTSUPP;
@@ -876,13 +889,21 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
-	if (args->flags != 0 &&
-	    args->flags != DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
+	if (args->flags & ~valid_flags)
 		return -EINVAL;
 
+	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE) {
+		if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
+			return -EOPNOTSUPP;
+		point = args->point;
+	}
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
@@ -893,6 +914,9 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 				   struct drm_file *file_private)
 {
 	struct drm_syncobj_handle *args = data;
+	unsigned int valid_flags = DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE |
+				   DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE;
+	u64 point = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
 		return -EOPNOTSUPP;
@@ -900,14 +924,23 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
-	if (args->flags != 0 &&
-	    args->flags != DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
+	if (args->flags & ~valid_flags)
 		return -EINVAL;
 
+	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE) {
+		if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
+			return -EOPNOTSUPP;
+		point = args->point;
+	}
+
 	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
 		return drm_syncobj_import_sync_file_fence(file_private,
 							  args->fd,
-							  args->handle);
+							  args->handle,
+							  point);
+
+	if (args->point)
+		return -EINVAL;
 
 	return drm_syncobj_fd_to_handle(file_private, args->fd,
 					&args->handle);
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 7fba37b94401..e63a71d3c607 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -905,13 +905,17 @@ struct drm_syncobj_destroy {
 };
 
 #define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE (1 << 0)
+#define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE         (1 << 1)
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

