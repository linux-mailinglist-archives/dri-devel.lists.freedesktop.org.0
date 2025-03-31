Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BE5A7700E
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 23:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A3410E18D;
	Mon, 31 Mar 2025 21:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RlYrDqYn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5364110E18D
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 21:23:38 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-227a8cdd241so7135765ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 14:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743456217; x=1744061017; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oarhOv17S6NDCgmBz46l+qZChOY53z83EqBIJ4rTMrQ=;
 b=RlYrDqYnQx1pDipHxhzU+mUxzZYlzc57Kemp0KeJjRBYrqAqgw7GVKgrA2VnA5LmM8
 i4udSmd63Z+o3MbhpZCjNub8dJkGh5gKMSkMi9ySRmvk6aQf6ZXR6KaclP02ADIgkwI1
 DggE/GH3IN3iKS121WPwP+FPhtCwGyvP+PHFXDVFQkWdNqHaDbtMAVbziowm/cdzmzzJ
 EwOzb14qe/eCImX6G5569s9rWjlek1ky78kPB+k2mYQffUKyAZRkPERNf/cqijxgt+kv
 DrOUov3zlt7yCjjpzL3HTOdcRFX8RHkQjsW4sXJbAh+aAmPoSAph3b5CDkRF6rtG1iBW
 bs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743456217; x=1744061017;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oarhOv17S6NDCgmBz46l+qZChOY53z83EqBIJ4rTMrQ=;
 b=kS/s1nOtlSMvcZyyYjmHUBur/DO6SE2js+HH7EBcLxiGmPbOczn0o/nUGBtXx2aJ+F
 KCZ+BhtnZyHkfaYG0+089Gd/Yu4xs8KQ5snZE+FogZucJftoW/pSaD6hT6ytNCBN9Ox8
 ofpHoOduUPb7C+y+QYVPbSL81d5/t7/NGP7xvhbZvX6KUGqlViFmEEaosYrDHXsUtbgp
 L8K/gv9MAtjUYQyMFk2h/Nd+3hpr9I9tz8IyV8G2zBY+PWigjtLmaRTi8tQyzPdXymTW
 aKTLWFviGzYmHaeQIPL+llPY9FFtcn7gcipxAuqoFHvUrZOzC6RxdI3OutaTyDaZFRQR
 63AQ==
X-Gm-Message-State: AOJu0YypgQhkfAEVnr+clofw0VDGWWkjmUk6JfofvAOZzMsX79HEafbS
 ypy7rlBLABrlYmsxMK55cutiaoJjilJWKN7GoSgC4kLAFZg1DlWe9msDpw==
X-Gm-Gg: ASbGncumKzaMBNZPWYQYj+BZ82O2dEhI0Q4peeUC8RvEAu3+ZW86zAb7Li9RAWQpu53
 BrAGK1LTjHzenfnhi7uDLsBVS0rjedAuhPnhxJr2Jwfte3otKMoniO15FxxE88lkLBDEWzN31SF
 orD9mHKJ1cwD0t7h+3/dkcvBrgpPf6ZYuQrhrVTRGB8TP4E35uoXvnj6A3zUb5UgnBK9Tvfrw3S
 xfrIjaU/csxqRG/QTMbAbqh6ZE0YrPxew4MMcJrqNTBHybpOFFDDWSE4AH6H15ElVHM4o4Ts2cV
 rlD1a+1cdXQs1zQNY9d/BN+8GMXYlNPstTTa1WdHVxpD8/p1so3CwblIdkuGbYF06KJD+7/B9ya
 7FYYpQlD4QJHZfS1xCVU/RIlKIMQ3Zg==
X-Google-Smtp-Source: AGHT+IGpFHC2qe1Je4WLPc7fUp41YqQI35b103OmAbhxl9meKcz7jNtqw9rDYNQRmlxEKTc350gKaA==
X-Received: by 2002:a05:6a21:1190:b0:1f8:d245:616d with SMTP id
 adf61e73a8af0-2009f645256mr16990239637.21.1743456217342; 
 Mon, 31 Mar 2025 14:23:37 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af93b69d996sm6839433a12.22.2025.03.31.14.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 14:23:35 -0700 (PDT)
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
Subject: [PATCH v5] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs
Date: Mon, 31 Mar 2025 14:23:32 -0700
Message-ID: <20250331212333.16029-1-robdclark@gmail.com>
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
v4: Also handle IMPORT_SYNC_FILE case
v5: Address comments from Dmitry

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_syncobj.c | 45 +++++++++++++++++++++++++++--------
 include/uapi/drm/drm.h        |  4 ++++
 2 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 4f2ab8a7b50f..b0a4c58fe726 100644
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
@@ -755,14 +755,22 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 		return -ENOENT;
 	}
 
-	drm_syncobj_replace_fence(syncobj, fence);
+	if (point) {
+		struct dma_fence_chain *chain = dma_fence_chain_alloc();
+		if (!chain)
+			return -ENOMEM;
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
@@ -772,7 +780,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
 	if (fd < 0)
 		return fd;
 
-	ret = drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
+	ret = drm_syncobj_find_fence(file_private, handle, point, 0, &fence);
 	if (ret)
 		goto err_put_fd;
 
@@ -869,6 +877,9 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 				   struct drm_file *file_private)
 {
 	struct drm_syncobj_handle *args = data;
+	unsigned valid_flags = DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE |
+			       DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE;
+	u64 point = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
 		return -EOPNOTSUPP;
@@ -876,13 +887,18 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
-	if (args->flags != 0 &&
-	    args->flags != DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
+	if (args->flags & ~valid_flags)
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
@@ -893,6 +909,9 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 				   struct drm_file *file_private)
 {
 	struct drm_syncobj_handle *args = data;
+	unsigned valid_flags = DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE |
+			       DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE;
+	u64 point = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
 		return -EOPNOTSUPP;
@@ -900,14 +919,20 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
-	if (args->flags != 0 &&
-	    args->flags != DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
+	if (args->flags & ~valid_flags)
 		return -EINVAL;
 
+	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE)
+		point = args->point;
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

