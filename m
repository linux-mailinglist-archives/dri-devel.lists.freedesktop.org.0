Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864C2A718B0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 15:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28C710E6D9;
	Wed, 26 Mar 2025 14:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IgAfrfLc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2937F10E6D9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 14:39:08 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-22548a28d0cso158077855ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 07:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742999947; x=1743604747; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y6eqkhZ1Vwmt9gRQ04JNUAxBEvP0I4y2gPx1o8AAFWU=;
 b=IgAfrfLc2r06xYZk0P+L+JEe0MAm9n2od/kHAfdVzQiCHi+QM1L5VB9pUAmFAkEMFT
 /yC4og+Z3ZWc0IAhB39rDO7S3Jo0ttdAlwxlu2RUO5BdoFr9yWFLXJryD+02zpLum2Qo
 vELk47j0AX7telib0C2HEg6yfko6mtJsppdEMsK9rex8JGgO5njA4HwNKDjjDcjLb+45
 FJMAwDprz4gPpqukZmooDWxPTYmmi//EfmrHXzkfIC1l/qt4e8IBtQES7k+n+fG/TeKa
 aOXTCWCKVjuaC1YRJVwmeMPZgO9bR9LxZRoQpbysJQ+MN6vYvklcqGYj09dHOPvzsNnA
 MgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742999947; x=1743604747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y6eqkhZ1Vwmt9gRQ04JNUAxBEvP0I4y2gPx1o8AAFWU=;
 b=A4QmeorBNQms2X6adqavyjfssc1tjiFyq/pEXtBHmxQ5tk/65oHDwLAKmO/9i74nGi
 t3hRcp2g61SqUTauiq/J3rpCE3njtk0uMT1igOAk0te4R6ZPM8L4xDAJn+w++7BN9JP8
 XFqAwFM++Z0ktCUTa7pU/fkPnPOZVYWv7FEW7g6iO3q4l20fgaxrqpra/04O0NrMaRs9
 1NGjn9sZk6GsJ8jZ/iALzv7gYLz8oJrACu6qrP/DtFuPbYFs41/g3vPGUedQPnWwH0eq
 JI4GzvlAvhA+ClxHSCR6pXkWEpnCnIiDx+9EpZJft7s2hu70em72tvPDQrlsAXMGZ6CT
 ss8A==
X-Gm-Message-State: AOJu0Yzj3aQJvHt1mcSlEnElTpNehVeYgvZSzSv+nHAQg7cFNsWrKAOs
 rgEz64XD5GqC8+6bfQ0cVksD9J0HHPBnl/bCzwZH2NYJG5By3XUVdB9oeA==
X-Gm-Gg: ASbGncvlt1WMQ+WTj+pCbE/Kj9Cyg1q0YdSFdEN3uGMKszay2x0lvVYuo3XA6qzv41n
 A20SspmwvqZHrdQXvLLpKbChGGtnPP4PBFyPcDXQpEvCnubgvSSn4Qjipc6KYZLvlr6h/fgrjuS
 3rGujGRmydA7gL9iwkJLIoe8j0sSakdh4qq84mDb5rX++bfYRvkUq0ZwBtzxByOLl5Wqouah8X5
 SK5tkTXxkYPSPS0xKUtuMnQP7xmrBd0ZwmWIpQvdgo7r2G/Qrc6Y9g+h1FFyBKyVQHvfb5xph42
 L5IvjmCkI/I8rrmB1NFK88Zm8/jogRyOZQ4JXKzDVxE5wGF8EwzyBjB2FbNYeKC1ze2iLgAB4LA
 4Zx7quvyrmkWTDuDqh1s=
X-Google-Smtp-Source: AGHT+IEBdj4C54pk495ep9DblHTWWweUHbck96M9LKkZuKckCu/4LFHmW8yUHZCPndAEkbi38ZOc+w==
X-Received: by 2002:a17:902:db01:b0:223:5c33:56b4 with SMTP id
 d9443c01a7336-22780d77ee1mr278798465ad.20.1742999947013; 
 Wed, 26 Mar 2025 07:39:07 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af8a2846270sm11011904a12.36.2025.03.26.07.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 07:39:06 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org (open list),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs
Date: Wed, 26 Mar 2025 07:39:03 -0700
Message-ID: <20250326143903.24380-1-robdclark@gmail.com>
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
timeline.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_syncobj.c | 8 ++++++--
 include/uapi/drm/drm.h        | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 4f2ab8a7b50f..eb7a2dd2e261 100644
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
 
@@ -882,8 +882,12 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 
 	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
 		return drm_syncobj_export_sync_file(file_private, args->handle,
+						    args->point,
 						    &args->fd);
 
+	if (args->point)
+		return -EINVAL;
+
 	return drm_syncobj_handle_to_fd(file_private, args->handle,
 					&args->fd);
 }
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

