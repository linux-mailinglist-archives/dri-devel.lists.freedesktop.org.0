Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20579A735EC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 16:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAE110E90E;
	Thu, 27 Mar 2025 15:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jqVdrY9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF5910E90E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 15:49:02 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-22409077c06so38588475ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 08:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743090542; x=1743695342; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R+WkWznMaXIwTB3ZZo2m17BC/os/l608815ZqRblsww=;
 b=jqVdrY9M3Q//lr8YCM9PChZozuaCP+cEfinXUvFTsq8h7d9tp8IJaV+nTq1wEvtsoI
 iwAGt2BS14ofAXZLAQ4RHvVME5FuxLJV26VyhcUs2OxTrkwcjLdEyiexoCmgb3OOaYLB
 2B0OHYz9EGkx3jOgKLgO3kbD6LaA/n6Ug1Wd6wUUPkNqhBgumzB8KScF/j3j2sNYAW1s
 8dTcF+1h5mN9KQpqnV/ZVbN6uPumhOqd8TVoserJO1zkrFoYYJgrLv5FDbafRSy8HeJO
 gWwcaE2y+c2xorjBBYNV7UraoRs0esfM5hewJoxZhOdcWP0nnQG7p6PL1LAin8AA+slR
 fy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743090542; x=1743695342;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R+WkWznMaXIwTB3ZZo2m17BC/os/l608815ZqRblsww=;
 b=WAWCVIbxrmIZ6DP0g7TovlL8auGZgkbIkwYioAhtkl8XuPWRi3nQghUeoeu68xbTZw
 5SDtg2nBcCwfJiyMa1ZGshzGlrJ1JAJrBlwTJCbHw73rW/eB08xiLVp6rVknadRSAB/f
 nGLMC7vxWRwLPxvUJ/XucETSOmGoy1qvNH+sr7NoM/Bgeny3CfqkHQ1339MHOBlqa4w+
 2Y5+to9NxYh6OcwFbEPU/bkzPp91tApNXpcs6GSPMY495VuDb5wWZzuSLwn7+wkr9+Xw
 /FrIkT/Wm8jLNz72qsLKaFycbA+pkDqXKbtG1Vu3KI6BmwUxMLe/WKHnCu/QHLVsOQUG
 fySg==
X-Gm-Message-State: AOJu0Ywyu6JBME9t0F1o7pdd+7p0R+6aLkJxlWDp+HgOUSDqLfW/oHQg
 3IUP3/MHwLE0gXsUK1+gOVAUEpM+zuCdsMxyeDCsJ3lSluoJdB+T8jGgmA==
X-Gm-Gg: ASbGncuozXmD3E0ZEBiO9sfMA8m023ltbTHEE4vKmYbqI78Rav/gxgLE3PAnDIW6eLm
 JaFfqTgdmhPBbO+wb2M6+8cX2m1n87e/Us90d3lDKi2ybJDRi0KbU6b1HAUATua60aw6Owa2yaN
 yZAhSJyJ53YEEpep7BNrlPoTSutYw++LWVpEvpKPQsLR8cdXDrJg1jyHqkdT3ZTVJGAahfCNjsh
 UjsXII3zhbcAx/Qd0C+RHyxr3ZYylIMOQOAh6MuQBss91TfTaQAKHGuZyxoitD5KhQ/F9pbOD3w
 fL5sh/c6AfPPVX7bU9D/WPU5/Yj1WH9Cne/Rrg/EULpjx38qxEJn5O+7wYj8PFU5BbUl6hmZ8Bo
 OBkb9nVpTJHED/PWN5ac=
X-Google-Smtp-Source: AGHT+IF7lVVDeWONYnV60fwShndweA3eQmej77IbeLpBdfzNQHqiYnWKtVJhAFL9WRt9+k+RKBEwHw==
X-Received: by 2002:a17:902:d2d0:b0:224:76f:9e45 with SMTP id
 d9443c01a7336-22804840efdmr53269545ad.21.1743090541726; 
 Thu, 27 Mar 2025 08:49:01 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291f1df032sm962005ad.175.2025.03.27.08.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 08:49:00 -0700 (PDT)
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
Subject: [PATCH v2] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs
Date: Thu, 27 Mar 2025 08:48:57 -0700
Message-ID: <20250327154858.52308-1-robdclark@gmail.com>
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_syncobj.c | 18 +++++++++++++-----
 include/uapi/drm/drm.h        |  2 ++
 2 files changed, 15 insertions(+), 5 deletions(-)

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
index 7fba37b94401..c71a8f4439f2 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -912,6 +912,8 @@ struct drm_syncobj_handle {
 
 	__s32 fd;
 	__u32 pad;
+
+	__u64 point;
 };
 
 struct drm_syncobj_transfer {
-- 
2.49.0

