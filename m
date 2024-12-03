Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B36A79E2595
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 17:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192E710EA8F;
	Tue,  3 Dec 2024 16:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BU3vKIM4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1AB10EA8F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 16:02:20 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id
 d75a77b69052e-4668978858aso39642001cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 08:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733241739; x=1733846539; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+WTzDeex6MvV2fYh0DDtmM+R3bGWHPFsxwrTc0tB2Uk=;
 b=BU3vKIM4fnGSRcdkugAV/YO37bXbyOa84gHlKwvS9TbnrAsfoUCwqNaAbE7XoyQM+Y
 aj9bBNP8dcSLVZAtJvbs3KLoWaTAnIczv4fFkBhPLRf011aajVq6tv+hSkUM6PtR9rPU
 udrzklwsakJnN0QAm9Vih7XY13zFjrQOZlMfGRNJjAIm9rDhmOF1BTy2teSWuGw+ZiRq
 ftKmNhoS9xmAYma7qAqNPRvzyCc26Fl32LKlHTpvxeS6duDIDTkAQZrntie/VCzId+kE
 JGxhGwqrlx+H8HpWsKZtZ5c1wDewkGx8X7UsiKm3o5psT05Ht3BKkuh2hiPxH29+vEJf
 86Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733241739; x=1733846539;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+WTzDeex6MvV2fYh0DDtmM+R3bGWHPFsxwrTc0tB2Uk=;
 b=hIwyeLyZgNyCi7H90Fp5m9x7AQmniSu9SQmL7n0RESqLSuhQMzjdHm0XUuASLyIYUR
 mvp2ykfunp9bLmvr7JcEfTbvLAqsazboErdNS+dF8Ma+pg3W5BaXLhdorL9GvO7G1IvH
 j8/xMSW9+TXW1QjJ9A2Dy7BFHA/wwqSM4q2cM0sZjHWRAu5/3ytnOFq2zP7xwOqQE7AT
 e9T690dLJvbGwsAJqJUJ8INtuVzw1I+sEpqLEGVqtGBDDO5inb5PVTKq1Q5j+UqVf6IN
 04JrGVI0J8FyUBUGr9HWGmgY8oV6FqI2jdIWALC1QVHQkznbwyJmQXWnF1LMCe1zBgVH
 G8hg==
X-Gm-Message-State: AOJu0YyvpzxFqVMhImUJlHIJncUjQxFpd4mzT/f4k0TF+MTVx0L7I1h+
 RodUlT/DVaPMb7ek125op8AEYZwSpFu9yx0o+ZEfl3kRX17j/17n
X-Gm-Gg: ASbGnctg9479zIx4pQbIIkFru52lBkhx61DiPfBQEO7OpeYv4EaTWPeCQCkpacBAw7U
 8fvWLVvgRj969sD4qbw/wN7iOb8Oe43BPoLrJL2mcofBGrJmzL/hG5i3Hi9JcrMHGIScRjxD+tr
 IY7upgBCmEz7i0eNnkZ9ngxBPh5FVaGAwMEO05vF1WSGCZEGG2YFaPEOrp8fM8ROZlZk0OUQ7i5
 fldwJCoc4h/PTxHdXVqxDz95hJ0SHYAQN789hgZ+5uozXFOcN45Oj1UG7VMi8ZLXnDMzmggeNqr
 4A6wWhm1AK84ryU48biPsLZ5ACz9F5g4s5qMSc2V4/vaxRlNNvvJrLXtzSE=
X-Google-Smtp-Source: AGHT+IGDeeGWcRCTKyUCOq7c8fevpRJKKIBDhzv1JtFZuhU7+1av0GGQHLhd5L0WUnUDcgzYEzYebw==
X-Received: by 2002:ac8:5a8b:0:b0:466:ad0d:f0ca with SMTP id
 d75a77b69052e-4670c6c5432mr40809661cf.50.1733241739116; 
 Tue, 03 Dec 2024 08:02:19 -0800 (PST)
Received: from localhost.localdomain
 (host-36-26.ilcul54.champaign.il.us.clients.pavlovmedia.net. [68.180.36.26])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-466c42319b6sm62809341cf.77.2024.12.03.08.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 08:02:18 -0800 (PST)
From: Gax-c <zichenxie0106@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, thierry.reding@gmail.com,
 mperttunen@nvidia.com, jonathanh@nvidia.com, kraxel@redhat.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, mst@redhat.com, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Zichen Xie <zichenxie0106@gmail.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm: cast calculation to __u64 to fix potential integer
 overflow
Date: Tue,  3 Dec 2024 10:02:00 -0600
Message-Id: <20241203160159.8129-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Zichen Xie <zichenxie0106@gmail.com>

Like commit b0b0d811eac6 ("drm/mediatek: Fix coverity issue with
unintentional integer overflow"), directly multiply pitch and
height may lead to integer overflow. Add a cast to avoid it.

Fixes: 6d1782919dc9 ("drm/cma: Introduce drm_gem_cma_dumb_create_internal()")
Fixes: dc5698e80cf7 ("Add virtio gpu driver.")
Fixes: dc6057ecb39e ("drm/tegra: gem: dumb: pitch and size are outputs")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/drm_gem_dma_helper.c | 6 +++---
 drivers/gpu/drm/tegra/gem.c          | 2 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 870b90b78bc4..020c3b17fc02 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -272,8 +272,8 @@ int drm_gem_dma_dumb_create_internal(struct drm_file *file_priv,
 	if (args->pitch < min_pitch)
 		args->pitch = min_pitch;
 
-	if (args->size < args->pitch * args->height)
-		args->size = args->pitch * args->height;
+	if (args->size < (__u64)args->pitch * args->height)
+		args->size = (__u64)args->pitch * args->height;
 
 	dma_obj = drm_gem_dma_create_with_handle(file_priv, drm, args->size,
 						 &args->handle);
@@ -306,7 +306,7 @@ int drm_gem_dma_dumb_create(struct drm_file *file_priv,
 	struct drm_gem_dma_object *dma_obj;
 
 	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	args->size = args->pitch * args->height;
+	args->size = (__u64)args->pitch * args->height;
 
 	dma_obj = drm_gem_dma_create_with_handle(file_priv, drm, args->size,
 						 &args->handle);
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index d275404ad0e9..a84acdbbbe3f 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -548,7 +548,7 @@ int tegra_bo_dumb_create(struct drm_file *file, struct drm_device *drm,
 	struct tegra_bo *bo;
 
 	args->pitch = round_up(min_pitch, tegra->pitch_align);
-	args->size = args->pitch * args->height;
+	args->size = (__u64)args->pitch * args->height;
 
 	bo = tegra_bo_create_with_handle(file, drm, args->size, 0,
 					 &args->handle);
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 7db48d17ee3a..d5407316b12e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -72,7 +72,7 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 		return -EINVAL;
 
 	pitch = args->width * 4;
-	args->size = pitch * args->height;
+	args->size = (__u64)pitch * args->height;
 	args->size = ALIGN(args->size, PAGE_SIZE);
 
 	params.format = virtio_gpu_translate_format(DRM_FORMAT_HOST_XRGB8888);
-- 
2.34.1

