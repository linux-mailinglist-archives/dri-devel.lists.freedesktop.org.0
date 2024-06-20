Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68121910A84
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FC110EAAE;
	Thu, 20 Jun 2024 15:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="X1MAWL2S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f100.google.com (mail-wr1-f100.google.com
 [209.85.221.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6162710EAA4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:47:12 +0000 (UTC)
Received: by mail-wr1-f100.google.com with SMTP id
 ffacd0b85a97d-364b2f92388so718106f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898430; x=1719503230;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KvGPQOraUGm/w/PWega4TojUDhfw0oljtzXXWJOOQg0=;
 b=X1MAWL2SYaTxwCNo7TaDvwvOxnoQfr/c6aBuGVM3dpSI8/KOyujubgOzVhXpxc4Uhr
 dPwd7OmPIlYewfjFTmSPqbfN+N+69Zfflj+9IIuzYJB1Hdj9yRYTuqj6TDuiyQBpf/1Z
 QJBdA1xdeTIb4X6IGEpd6Q1LcVXU53qn3zKpJpk0LFcSrdwGDV58FWfrAVpCYCGIDtCj
 NPjFU6b+16XtF8jyWocGrNBYZ7dsKRjZRk1mGLMsYlX1U/bi96DQOAHG/TtzwET0dBjd
 WGRS6D8QQA/nNn3dSFmYRTwVkKhyImtwGL+j42q4GKAs+09TSaIA9xAy3j8diwCJR63O
 NCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898430; x=1719503230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KvGPQOraUGm/w/PWega4TojUDhfw0oljtzXXWJOOQg0=;
 b=KTOYCS31+8hT9Tq1t9VVYPBuJsPlARkj048d7I6U7Bme5I6kwhYpruFNy1BqtAPVkQ
 hNQTt6yyRPI+gA6OrX8Ow4oa2S9vO58lTsTi7Oa6Hr+Uu7tnMu8Az8wUth7sMWMQMXEb
 NVDygwKxPyC5R4Yin30tlS8Amcp9q8hMFjKAenh+G4azIsXWcbqbxZKdJJ4K4aT98ZDB
 45rwNv8L5eREUEMC0Y34DzBKr1v2NjcWdnlSN8Cy4x+t71u6WQNZwpu8TA66OxNP3Ztt
 HFvRbf9eGvCxX9+iNkx9vToRKoo6nphOPqVw6RRaBEfYi6WyBBL+9Jz7a2XZpzXR2iQB
 Pv6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgQ9i9t+NlGbNwYyKZjUdBR3MA532Qjk32+SdpolZItyvOw6mUuPgGXM7nSIJaCw/Mn5V3CPS3a8U7vO75oQUjscwsEp5MOdU2IyfmTyzh
X-Gm-Message-State: AOJu0YzQoOLMegEld+kRJD0848urk2K5uKoW5os+TfmmtVwOxCuO+SJn
 P5uBbx7rFA9NGg+vRCHvWqQtwHKTRJdBAAWvyHw7ojqZMspbURCGUUZgIQEFp82REK2HPddQPvh
 fWcUrLrun4vN+IpRjZDCGvnqjIxBB3kUO
X-Google-Smtp-Source: AGHT+IE4GeUMR1C5KxzV3kpzkshJo0YNa/mnlKrB/5hZInoo9PGOo1jjAQLd0mCDtVZ/i9GWfTzRRY/k9B1F
X-Received: by 2002:adf:edd1:0:b0:35f:b03:bf45 with SMTP id
 ffacd0b85a97d-363175b92f4mr4459779f8f.24.1718898430727; 
 Thu, 20 Jun 2024 08:47:10 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 ffacd0b85a97d-3657e74f8dcsm56397f8f.11.2024.06.20.08.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:47:10 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <maxime@cerno.tech>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 22/31] drm/vc4: Make v3d paths unavailable on any generation
 newer than vc4
Date: Thu, 20 Jun 2024 16:46:23 +0100
Message-Id: <20240620154632.4125308-23-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <maxime@cerno.tech>

The V3D IP has been separate since BCM2711, so let's make sure we issue
a WARN if we're running not only on BCM2711, but also anything newer.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_bo.c               | 28 +++++++++++-----------
 drivers/gpu/drm/vc4/vc4_crtc.c             |  4 ++--
 drivers/gpu/drm/vc4/vc4_drv.c              |  8 +++----
 drivers/gpu/drm/vc4/vc4_gem.c              | 24 +++++++++----------
 drivers/gpu/drm/vc4/vc4_irq.c              | 10 ++++----
 drivers/gpu/drm/vc4/vc4_kms.c              |  2 +-
 drivers/gpu/drm/vc4/vc4_perfmon.c          | 20 ++++++++--------
 drivers/gpu/drm/vc4/vc4_render_cl.c        |  2 +-
 drivers/gpu/drm/vc4/vc4_v3d.c              | 10 ++++----
 drivers/gpu/drm/vc4/vc4_validate.c         |  8 +++----
 drivers/gpu/drm/vc4/vc4_validate_shaders.c |  2 +-
 11 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 89e427c9ed32..06c791ace2d8 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -251,7 +251,7 @@ void vc4_bo_add_to_purgeable_pool(struct vc4_bo *bo)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(bo->base.base.dev);
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
 	mutex_lock(&vc4->purgeable.lock);
@@ -265,7 +265,7 @@ static void vc4_bo_remove_from_purgeable_pool_locked(struct vc4_bo *bo)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(bo->base.base.dev);
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
 	/* list_del_init() is used here because the caller might release
@@ -396,7 +396,7 @@ struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_bo *bo;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return ERR_PTR(-ENODEV);
 
 	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
@@ -427,7 +427,7 @@ struct vc4_bo *vc4_bo_create(struct drm_device *dev, size_t unaligned_size,
 	struct drm_gem_dma_object *dma_obj;
 	struct vc4_bo *bo;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return ERR_PTR(-ENODEV);
 
 	if (size == 0)
@@ -496,7 +496,7 @@ int vc4_bo_dumb_create(struct drm_file *file_priv,
 	struct vc4_bo *bo = NULL;
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	ret = vc4_dumb_fixup_args(args);
@@ -622,7 +622,7 @@ int vc4_bo_inc_usecnt(struct vc4_bo *bo)
 	struct vc4_dev *vc4 = to_vc4_dev(bo->base.base.dev);
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	/* Fast path: if the BO is already retained by someone, no need to
@@ -661,7 +661,7 @@ void vc4_bo_dec_usecnt(struct vc4_bo *bo)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(bo->base.base.dev);
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
 	/* Fast path: if the BO is still retained by someone, no need to test
@@ -783,7 +783,7 @@ int vc4_create_bo_ioctl(struct drm_device *dev, void *data,
 	struct vc4_bo *bo = NULL;
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	ret = vc4_grab_bin_bo(vc4, vc4file);
@@ -813,7 +813,7 @@ int vc4_mmap_bo_ioctl(struct drm_device *dev, void *data,
 	struct drm_vc4_mmap_bo *args = data;
 	struct drm_gem_object *gem_obj;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	gem_obj = drm_gem_object_lookup(file_priv, args->handle);
@@ -839,7 +839,7 @@ vc4_create_shader_bo_ioctl(struct drm_device *dev, void *data,
 	struct vc4_bo *bo = NULL;
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	if (args->size == 0)
@@ -918,7 +918,7 @@ int vc4_set_tiling_ioctl(struct drm_device *dev, void *data,
 	struct vc4_bo *bo;
 	bool t_format;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	if (args->flags != 0)
@@ -964,7 +964,7 @@ int vc4_get_tiling_ioctl(struct drm_device *dev, void *data,
 	struct drm_gem_object *gem_obj;
 	struct vc4_bo *bo;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	if (args->flags != 0 || args->modifier != 0)
@@ -1007,7 +1007,7 @@ int vc4_bo_cache_init(struct drm_device *dev)
 	int ret;
 	int i;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	/* Create the initial set of BO labels that the kernel will
@@ -1071,7 +1071,7 @@ int vc4_label_bo_ioctl(struct drm_device *dev, void *data,
 	struct drm_gem_object *gem_obj;
 	int ret = 0, label;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	if (!args->len)
diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 7220c4a62e12..575900ee67a5 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1008,7 +1008,7 @@ static int vc4_async_page_flip(struct drm_crtc *crtc,
 	struct vc4_bo *bo = to_vc4_bo(&dma_bo->base);
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	/*
@@ -1051,7 +1051,7 @@ int vc4_page_flip(struct drm_crtc *crtc,
 		struct drm_device *dev = crtc->dev;
 		struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-		if (vc4->gen == VC4_GEN_5)
+		if (vc4->gen > VC4_GEN_4)
 			return vc5_async_page_flip(crtc, fb, event, flags);
 		else
 			return vc4_async_page_flip(crtc, fb, event, flags);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 550324819f37..8c104ace3dc6 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -98,7 +98,7 @@ static int vc4_get_param_ioctl(struct drm_device *dev, void *data,
 	if (args->pad != 0)
 		return -EINVAL;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	if (!vc4->v3d)
@@ -147,7 +147,7 @@ static int vc4_open(struct drm_device *dev, struct drm_file *file)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_file *vc4file;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	vc4file = kzalloc(sizeof(*vc4file), GFP_KERNEL);
@@ -165,7 +165,7 @@ static void vc4_close(struct drm_device *dev, struct drm_file *file)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_file *vc4file = file->driver_priv;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
 	if (vc4file->bin_bo_used)
@@ -301,7 +301,7 @@ static int vc4_drm_bind(struct device *dev)
 	else
 		gen = VC4_GEN_4;
 
-	if (gen == VC4_GEN_5)
+	if (gen > VC4_GEN_4)
 		driver = &vc5_drm_driver;
 	else
 		driver = &vc4_drm_driver;
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index b4f72f2aaf1b..0d94165d4b6b 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -76,7 +76,7 @@ vc4_get_hang_state_ioctl(struct drm_device *dev, void *data,
 	u32 i;
 	int ret = 0;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	if (!vc4->v3d) {
@@ -389,7 +389,7 @@ vc4_wait_for_seqno(struct drm_device *dev, uint64_t seqno, uint64_t timeout_ns,
 	unsigned long timeout_expire;
 	DEFINE_WAIT(wait);
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	if (vc4->finished_seqno >= seqno)
@@ -474,7 +474,7 @@ vc4_submit_next_bin_job(struct drm_device *dev)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_exec_info *exec;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
 again:
@@ -522,7 +522,7 @@ vc4_submit_next_render_job(struct drm_device *dev)
 	if (!exec)
 		return;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
 	/* A previous RCL may have written to one of our textures, and
@@ -543,7 +543,7 @@ vc4_move_job_to_render(struct drm_device *dev, struct vc4_exec_info *exec)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	bool was_empty = list_empty(&vc4->render_job_list);
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
 	list_move_tail(&exec->head, &vc4->render_job_list);
@@ -970,7 +970,7 @@ vc4_job_handle_completed(struct vc4_dev *vc4)
 	unsigned long irqflags;
 	struct vc4_seqno_cb *cb, *cb_temp;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
 	spin_lock_irqsave(&vc4->job_lock, irqflags);
@@ -1009,7 +1009,7 @@ int vc4_queue_seqno_cb(struct drm_device *dev,
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	unsigned long irqflags;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	cb->func = func;
@@ -1065,7 +1065,7 @@ vc4_wait_seqno_ioctl(struct drm_device *dev, void *data,
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_vc4_wait_seqno *args = data;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	return vc4_wait_for_seqno_ioctl_helper(dev, args->seqno,
@@ -1082,7 +1082,7 @@ vc4_wait_bo_ioctl(struct drm_device *dev, void *data,
 	struct drm_gem_object *gem_obj;
 	struct vc4_bo *bo;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	if (args->pad != 0)
@@ -1131,7 +1131,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
 				  args->shader_rec_size,
 				  args->bo_handle_count);
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	if (!vc4->v3d) {
@@ -1268,7 +1268,7 @@ int vc4_gem_init(struct drm_device *dev)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	vc4->dma_fence_context = dma_fence_context_alloc(1);
@@ -1327,7 +1327,7 @@ int vc4_gem_madvise_ioctl(struct drm_device *dev, void *data,
 	struct vc4_bo *bo;
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	switch (args->madv) {
diff --git a/drivers/gpu/drm/vc4/vc4_irq.c b/drivers/gpu/drm/vc4/vc4_irq.c
index c006d20b5a78..8581cc212a12 100644
--- a/drivers/gpu/drm/vc4/vc4_irq.c
+++ b/drivers/gpu/drm/vc4/vc4_irq.c
@@ -263,7 +263,7 @@ vc4_irq_enable(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
 	if (!vc4->v3d)
@@ -280,7 +280,7 @@ vc4_irq_disable(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
 	if (!vc4->v3d)
@@ -303,7 +303,7 @@ int vc4_irq_install(struct drm_device *dev, int irq)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	if (irq == IRQ_NOTCONNECTED)
@@ -324,7 +324,7 @@ void vc4_irq_uninstall(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
 	vc4_irq_disable(dev);
@@ -337,7 +337,7 @@ void vc4_irq_reset(struct drm_device *dev)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	unsigned long irqflags;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
 	/* Acknowledge any stale IRQs. */
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index bddfcad10950..58bbb9efc2df 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -461,7 +461,7 @@ static struct drm_framebuffer *vc4_fb_create(struct drm_device *dev,
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_mode_fb_cmd2 mode_cmd_local;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return ERR_PTR(-ENODEV);
 
 	/* If the user didn't specify a modifier, use the
diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc4_perfmon.c
index 31ee7ef80274..4cd3643c3ba7 100644
--- a/drivers/gpu/drm/vc4/vc4_perfmon.c
+++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
@@ -23,7 +23,7 @@ void vc4_perfmon_get(struct vc4_perfmon *perfmon)
 		return;
 
 	vc4 = perfmon->dev;
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
 	refcount_inc(&perfmon->refcnt);
@@ -37,7 +37,7 @@ void vc4_perfmon_put(struct vc4_perfmon *perfmon)
 		return;
 
 	vc4 = perfmon->dev;
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
 	if (refcount_dec_and_test(&perfmon->refcnt))
@@ -49,7 +49,7 @@ void vc4_perfmon_start(struct vc4_dev *vc4, struct vc4_perfmon *perfmon)
 	unsigned int i;
 	u32 mask;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
 	if (WARN_ON_ONCE(!perfmon || vc4->active_perfmon))
@@ -69,7 +69,7 @@ void vc4_perfmon_stop(struct vc4_dev *vc4, struct vc4_perfmon *perfmon,
 {
 	unsigned int i;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
 	if (WARN_ON_ONCE(!vc4->active_perfmon ||
@@ -90,7 +90,7 @@ struct vc4_perfmon *vc4_perfmon_find(struct vc4_file *vc4file, int id)
 	struct vc4_dev *vc4 = vc4file->dev;
 	struct vc4_perfmon *perfmon;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return NULL;
 
 	mutex_lock(&vc4file->perfmon.lock);
@@ -105,7 +105,7 @@ void vc4_perfmon_open_file(struct vc4_file *vc4file)
 {
 	struct vc4_dev *vc4 = vc4file->dev;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
 	mutex_init(&vc4file->perfmon.lock);
@@ -126,7 +126,7 @@ void vc4_perfmon_close_file(struct vc4_file *vc4file)
 {
 	struct vc4_dev *vc4 = vc4file->dev;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
 	mutex_lock(&vc4file->perfmon.lock);
@@ -146,7 +146,7 @@ int vc4_perfmon_create_ioctl(struct drm_device *dev, void *data,
 	unsigned int i;
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	if (!vc4->v3d) {
@@ -200,7 +200,7 @@ int vc4_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
 	struct drm_vc4_perfmon_destroy *req = data;
 	struct vc4_perfmon *perfmon;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	if (!vc4->v3d) {
@@ -228,7 +228,7 @@ int vc4_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
 	struct vc4_perfmon *perfmon;
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	if (!vc4->v3d) {
diff --git a/drivers/gpu/drm/vc4/vc4_render_cl.c b/drivers/gpu/drm/vc4/vc4_render_cl.c
index ae4ad956f04f..14079853338e 100644
--- a/drivers/gpu/drm/vc4/vc4_render_cl.c
+++ b/drivers/gpu/drm/vc4/vc4_render_cl.c
@@ -599,7 +599,7 @@ int vc4_get_rcl(struct drm_device *dev, struct vc4_exec_info *exec)
 	bool has_bin = args->bin_cl_size != 0;
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	if (args->min_x_tile > args->max_x_tile ||
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index f703e6e9ace8..14d268f80fa5 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -127,7 +127,7 @@ static int vc4_v3d_debugfs_ident(struct seq_file *m, void *unused)
 int
 vc4_v3d_pm_get(struct vc4_dev *vc4)
 {
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	mutex_lock(&vc4->power_lock);
@@ -148,7 +148,7 @@ vc4_v3d_pm_get(struct vc4_dev *vc4)
 void
 vc4_v3d_pm_put(struct vc4_dev *vc4)
 {
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
 	mutex_lock(&vc4->power_lock);
@@ -178,7 +178,7 @@ int vc4_v3d_get_bin_slot(struct vc4_dev *vc4)
 	uint64_t seqno = 0;
 	struct vc4_exec_info *exec;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 try_again:
@@ -325,7 +325,7 @@ int vc4_v3d_bin_bo_get(struct vc4_dev *vc4, bool *used)
 {
 	int ret = 0;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	mutex_lock(&vc4->bin_bo_lock);
@@ -360,7 +360,7 @@ static void bin_bo_release(struct kref *ref)
 
 void vc4_v3d_bin_bo_put(struct vc4_dev *vc4)
 {
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
 	mutex_lock(&vc4->bin_bo_lock);
diff --git a/drivers/gpu/drm/vc4/vc4_validate.c b/drivers/gpu/drm/vc4/vc4_validate.c
index 4f14cba6b46f..722c0f8909d2 100644
--- a/drivers/gpu/drm/vc4/vc4_validate.c
+++ b/drivers/gpu/drm/vc4/vc4_validate.c
@@ -109,7 +109,7 @@ vc4_use_bo(struct vc4_exec_info *exec, uint32_t hindex)
 	struct drm_gem_dma_object *obj;
 	struct vc4_bo *bo;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return NULL;
 
 	if (hindex >= exec->bo_count) {
@@ -169,7 +169,7 @@ vc4_check_tex_size(struct vc4_exec_info *exec, struct drm_gem_dma_object *fbo,
 	uint32_t utile_w = utile_width(cpp);
 	uint32_t utile_h = utile_height(cpp);
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return false;
 
 	/* The shaded vertex format stores signed 12.4 fixed point
@@ -495,7 +495,7 @@ vc4_validate_bin_cl(struct drm_device *dev,
 	uint32_t dst_offset = 0;
 	uint32_t src_offset = 0;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	while (src_offset < len) {
@@ -942,7 +942,7 @@ vc4_validate_shader_recs(struct drm_device *dev,
 	uint32_t i;
 	int ret = 0;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
 	for (i = 0; i < exec->shader_state_count; i++) {
diff --git a/drivers/gpu/drm/vc4/vc4_validate_shaders.c b/drivers/gpu/drm/vc4/vc4_validate_shaders.c
index afb1a4d82684..2d74e786914c 100644
--- a/drivers/gpu/drm/vc4/vc4_validate_shaders.c
+++ b/drivers/gpu/drm/vc4/vc4_validate_shaders.c
@@ -786,7 +786,7 @@ vc4_validate_shader(struct drm_gem_dma_object *shader_obj)
 	struct vc4_validated_shader_info *validated_shader = NULL;
 	struct vc4_shader_validation_state validation_state;
 
-	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
+	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return NULL;
 
 	memset(&validation_state, 0, sizeof(validation_state));
-- 
2.34.1

