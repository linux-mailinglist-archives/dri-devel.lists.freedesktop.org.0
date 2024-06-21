Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917F291297F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C5310F1DC;
	Fri, 21 Jun 2024 15:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="DbPtoYtD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f97.google.com (mail-ej1-f97.google.com
 [209.85.218.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B51810F1E6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:43 +0000 (UTC)
Received: by mail-ej1-f97.google.com with SMTP id
 a640c23a62f3a-a6ef46d25efso250580266b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983302; x=1719588102;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TEcLKeWkiN6+hbegtNUmbJ0a1d5A/uihQVv0tTbUw6E=;
 b=DbPtoYtDSBz7NgE4wJ0p6rmwd+cnaru2uw4mR+Qh2wtcQYG73Ce3ae1P15k3osWVgd
 TtE11EDoM87syV3bUG0oUUQRu1DFMEjCxsG85MNVZx5NnJfWebYir1EFjH5Hy8jZAY2s
 yT/vVtFw0Y7ZDG7nYbNeyO1Fbe2mWfOAXT58rFvtyhlfMLpCv5etT2d3DAjauYI8eeoW
 MPS7b0co6Me/L5t0MrEhjbhl4XWrfkfVb9p1GHjnXMJntYR3BbRw5EcazTHLnJCODMgr
 RDg+/JUbtFtxmcyiEwn5jpnzVh/llCXuj6afJpVRSIm7SbH0nIZ920Q3LU9Bjw3cFUhL
 f9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983302; x=1719588102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TEcLKeWkiN6+hbegtNUmbJ0a1d5A/uihQVv0tTbUw6E=;
 b=IHD4oHkifyX0LXD2y97YvSFqByhWElbuPOLvNBztsBOIW5HKJEHJXpprA1hDnLf54F
 dstyqQ/19Ai+jtkwcqEp+v2NauUS21Gk6f5DQ/EAne4cG6khnugE6gvVRC+/Ov3BMqtG
 cpQMOCLQew3vHCSqxww10iuUjIbGWUZBN92pztuUB8O3YqMn/QcDykv3Hb3ZzgW2GSq+
 iE4J6vrko/RWAeLXJm71j7pT6+YT3Sfmdwe6eb5dyQbwLabpchQb/uStgDy2bUDINaD6
 Xq9r1qLS2PmLijf0ykx3s1PRJUdVS2Ml8SdKXQYtEhPlposD4Q5pun/rV0dsW4cFVyZf
 lxDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq8gffCic2xyjH8w4/BqrhDOFyI7hTNtH164gjTEhf8+w3jKnlOtZsv5sH6uYaxPgSHjgIhhWgBN6/GZvbYsCKvhKaVHa3elGRfs5ikEGT
X-Gm-Message-State: AOJu0YxF9DSaa82hxSShorjt0XTg0n2jKQZOboMP3+ebPIEP9UbwSqZ4
 SV2tvR4cMfQwq+Uqu1Im66inhz1/7GHfSf+fAqYf7DcvBZV/7wq72VX6aZiGXJbDdSQewE/b8NI
 8WNEYDIP+xCXqCteA7Kar7vJPKKCTBJQq
X-Google-Smtp-Source: AGHT+IGT+1xbJ0vEl1mFSCfd1hAfnwWvt2bPjJQea2FBAH5j9RVpYIVo3myzcJyFFhzrJGhs7nbXAU1lbeL8
X-Received: by 2002:a17:906:7148:b0:a6f:6292:2425 with SMTP id
 a640c23a62f3a-a6fab648959mr466203966b.38.1718983301966; 
 Fri, 21 Jun 2024 08:21:41 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fd6056401sm1785866b.43.2024.06.21.08.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:41 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 20/31] drm/vc4: Introduce generation number enum
Date: Fri, 21 Jun 2024 16:20:44 +0100
Message-Id: <20240621152055.4180873-21-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
References: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <mripard@kernel.org>

With the introduction of the BCM2712 support, we will get yet another
generation of display engine to support.

The binary check of whether it's VC5 or not thus doesn't work anymore,
especially since some parts of the driver will have changed with BCM2711,
and some others with BCM2712.

Let's introduce an enum to store the generation the driver is running
on, which should provide more flexibility.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/tests/vc4_mock.c       | 12 +++----
 drivers/gpu/drm/vc4/vc4_bo.c               | 28 +++++++--------
 drivers/gpu/drm/vc4/vc4_crtc.c             | 13 ++++---
 drivers/gpu/drm/vc4/vc4_drv.c              | 22 +++++++-----
 drivers/gpu/drm/vc4/vc4_drv.h              |  7 +++-
 drivers/gpu/drm/vc4/vc4_gem.c              | 24 ++++++-------
 drivers/gpu/drm/vc4/vc4_hdmi.c             |  2 +-
 drivers/gpu/drm/vc4/vc4_hvs.c              | 42 ++++++++++++----------
 drivers/gpu/drm/vc4/vc4_irq.c              | 10 +++---
 drivers/gpu/drm/vc4/vc4_kms.c              | 14 ++++----
 drivers/gpu/drm/vc4/vc4_perfmon.c          | 20 +++++------
 drivers/gpu/drm/vc4/vc4_plane.c            | 12 +++----
 drivers/gpu/drm/vc4/vc4_render_cl.c        |  2 +-
 drivers/gpu/drm/vc4/vc4_v3d.c              | 10 +++---
 drivers/gpu/drm/vc4/vc4_validate.c         |  8 ++---
 drivers/gpu/drm/vc4/vc4_validate_shaders.c |  2 +-
 16 files changed, 121 insertions(+), 107 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.c b/drivers/gpu/drm/vc4/tests/vc4_mock.c
index 0731a7d85d7a..922849dd4b47 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock.c
@@ -155,11 +155,11 @@ KUNIT_DEFINE_ACTION_WRAPPER(kunit_action_drm_dev_unregister,
 			    drm_dev_unregister,
 			    struct drm_device *);
 
-static struct vc4_dev *__mock_device(struct kunit *test, bool is_vc5)
+static struct vc4_dev *__mock_device(struct kunit *test, enum vc4_gen gen)
 {
 	struct drm_device *drm;
-	const struct drm_driver *drv = is_vc5 ? &vc5_drm_driver : &vc4_drm_driver;
-	const struct vc4_mock_desc *desc = is_vc5 ? &vc5_mock : &vc4_mock;
+	const struct drm_driver *drv = (gen == VC4_GEN_5) ? &vc5_drm_driver : &vc4_drm_driver;
+	const struct vc4_mock_desc *desc = (gen == VC4_GEN_5) ? &vc5_mock : &vc4_mock;
 	struct vc4_dev *vc4;
 	struct device *dev;
 	int ret;
@@ -173,7 +173,7 @@ static struct vc4_dev *__mock_device(struct kunit *test, bool is_vc5)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
 
 	vc4->dev = dev;
-	vc4->is_vc5 = is_vc5;
+	vc4->gen = gen;
 
 	vc4->hvs = __vc4_hvs_alloc(vc4, NULL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4->hvs);
@@ -198,10 +198,10 @@ static struct vc4_dev *__mock_device(struct kunit *test, bool is_vc5)
 
 struct vc4_dev *vc4_mock_device(struct kunit *test)
 {
-	return __mock_device(test, false);
+	return __mock_device(test, VC4_GEN_4);
 }
 
 struct vc4_dev *vc5_mock_device(struct kunit *test)
 {
-	return __mock_device(test, true);
+	return __mock_device(test, VC4_GEN_5);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 86d629e45307..89e427c9ed32 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -251,7 +251,7 @@ void vc4_bo_add_to_purgeable_pool(struct vc4_bo *bo)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(bo->base.base.dev);
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return;
 
 	mutex_lock(&vc4->purgeable.lock);
@@ -265,7 +265,7 @@ static void vc4_bo_remove_from_purgeable_pool_locked(struct vc4_bo *bo)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(bo->base.base.dev);
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return;
 
 	/* list_del_init() is used here because the caller might release
@@ -396,7 +396,7 @@ struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_bo *bo;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return ERR_PTR(-ENODEV);
 
 	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
@@ -427,7 +427,7 @@ struct vc4_bo *vc4_bo_create(struct drm_device *dev, size_t unaligned_size,
 	struct drm_gem_dma_object *dma_obj;
 	struct vc4_bo *bo;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return ERR_PTR(-ENODEV);
 
 	if (size == 0)
@@ -496,7 +496,7 @@ int vc4_bo_dumb_create(struct drm_file *file_priv,
 	struct vc4_bo *bo = NULL;
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	ret = vc4_dumb_fixup_args(args);
@@ -622,7 +622,7 @@ int vc4_bo_inc_usecnt(struct vc4_bo *bo)
 	struct vc4_dev *vc4 = to_vc4_dev(bo->base.base.dev);
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	/* Fast path: if the BO is already retained by someone, no need to
@@ -661,7 +661,7 @@ void vc4_bo_dec_usecnt(struct vc4_bo *bo)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(bo->base.base.dev);
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return;
 
 	/* Fast path: if the BO is still retained by someone, no need to test
@@ -783,7 +783,7 @@ int vc4_create_bo_ioctl(struct drm_device *dev, void *data,
 	struct vc4_bo *bo = NULL;
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	ret = vc4_grab_bin_bo(vc4, vc4file);
@@ -813,7 +813,7 @@ int vc4_mmap_bo_ioctl(struct drm_device *dev, void *data,
 	struct drm_vc4_mmap_bo *args = data;
 	struct drm_gem_object *gem_obj;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	gem_obj = drm_gem_object_lookup(file_priv, args->handle);
@@ -839,7 +839,7 @@ vc4_create_shader_bo_ioctl(struct drm_device *dev, void *data,
 	struct vc4_bo *bo = NULL;
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	if (args->size == 0)
@@ -918,7 +918,7 @@ int vc4_set_tiling_ioctl(struct drm_device *dev, void *data,
 	struct vc4_bo *bo;
 	bool t_format;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	if (args->flags != 0)
@@ -964,7 +964,7 @@ int vc4_get_tiling_ioctl(struct drm_device *dev, void *data,
 	struct drm_gem_object *gem_obj;
 	struct vc4_bo *bo;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	if (args->flags != 0 || args->modifier != 0)
@@ -1007,7 +1007,7 @@ int vc4_bo_cache_init(struct drm_device *dev)
 	int ret;
 	int i;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	/* Create the initial set of BO labels that the kernel will
@@ -1071,7 +1071,7 @@ int vc4_label_bo_ioctl(struct drm_device *dev, void *data,
 	struct drm_gem_object *gem_obj;
 	int ret = 0, label;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	if (!args->len)
diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index ef5ad0ca4c2d..7220c4a62e12 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -264,7 +264,7 @@ static u32 vc4_get_fifo_full_level(struct vc4_crtc *vc4_crtc, u32 format)
 		 * Removing 1 from the FIFO full level however
 		 * seems to completely remove that issue.
 		 */
-		if (!vc4->is_vc5)
+		if (vc4->gen == VC4_GEN_4)
 			return fifo_len_bytes - 3 * HVS_FIFO_LATENCY_PIX - 1;
 
 		return fifo_len_bytes - 3 * HVS_FIFO_LATENCY_PIX;
@@ -429,7 +429,7 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encode
 	if (is_dsi)
 		CRTC_WRITE(PV_HACT_ACT, mode->hdisplay * pixel_rep);
 
-	if (vc4->is_vc5)
+	if (vc4->gen == VC4_GEN_5)
 		CRTC_WRITE(PV_MUX_CFG,
 			   VC4_SET_FIELD(PV_MUX_CFG_RGB_PIXEL_MUX_MODE_NO_SWAP,
 					 PV_MUX_CFG_RGB_PIXEL_MUX_MODE));
@@ -921,7 +921,7 @@ static int vc4_async_set_fence_cb(struct drm_device *dev,
 	struct dma_fence *fence;
 	int ret;
 
-	if (!vc4->is_vc5) {
+	if (vc4->gen == VC4_GEN_4) {
 		struct vc4_bo *bo = to_vc4_bo(&dma_bo->base);
 
 		return vc4_queue_seqno_cb(dev, &flip_state->cb.seqno, bo->seqno,
@@ -1008,7 +1008,7 @@ static int vc4_async_page_flip(struct drm_crtc *crtc,
 	struct vc4_bo *bo = to_vc4_bo(&dma_bo->base);
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	/*
@@ -1051,7 +1051,7 @@ int vc4_page_flip(struct drm_crtc *crtc,
 		struct drm_device *dev = crtc->dev;
 		struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-		if (vc4->is_vc5)
+		if (vc4->gen == VC4_GEN_5)
 			return vc5_async_page_flip(crtc, fb, event, flags);
 		else
 			return vc4_async_page_flip(crtc, fb, event, flags);
@@ -1346,9 +1346,8 @@ int __vc4_crtc_init(struct drm_device *drm,
 
 	drm_crtc_helper_add(crtc, crtc_helper_funcs);
 
-	if (!vc4->is_vc5) {
+	if (vc4->gen == VC4_GEN_4) {
 		drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
-
 		drm_crtc_enable_color_mgmt(crtc, 0, false, crtc->gamma_size);
 
 		/* We support CTM, but only for one CRTC at a time. It's therefore
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index c133e96b8aca..550324819f37 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -98,7 +98,7 @@ static int vc4_get_param_ioctl(struct drm_device *dev, void *data,
 	if (args->pad != 0)
 		return -EINVAL;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	if (!vc4->v3d)
@@ -147,7 +147,7 @@ static int vc4_open(struct drm_device *dev, struct drm_file *file)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_file *vc4file;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	vc4file = kzalloc(sizeof(*vc4file), GFP_KERNEL);
@@ -165,7 +165,7 @@ static void vc4_close(struct drm_device *dev, struct drm_file *file)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_file *vc4file = file->driver_priv;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return;
 
 	if (vc4file->bin_bo_used)
@@ -291,13 +291,17 @@ static int vc4_drm_bind(struct device *dev)
 	struct vc4_dev *vc4;
 	struct device_node *node;
 	struct drm_crtc *crtc;
-	bool is_vc5;
+	enum vc4_gen gen;
 	int ret = 0;
 
 	dev->coherent_dma_mask = DMA_BIT_MASK(32);
 
-	is_vc5 = of_device_is_compatible(dev->of_node, "brcm,bcm2711-vc5");
-	if (is_vc5)
+	if (of_device_is_compatible(dev->of_node, "brcm,bcm2711-vc5"))
+		gen = VC4_GEN_5;
+	else
+		gen = VC4_GEN_4;
+
+	if (gen == VC4_GEN_5)
 		driver = &vc5_drm_driver;
 	else
 		driver = &vc4_drm_driver;
@@ -315,13 +319,13 @@ static int vc4_drm_bind(struct device *dev)
 	vc4 = devm_drm_dev_alloc(dev, driver, struct vc4_dev, base);
 	if (IS_ERR(vc4))
 		return PTR_ERR(vc4);
-	vc4->is_vc5 = is_vc5;
+	vc4->gen = gen;
 	vc4->dev = dev;
 
 	drm = &vc4->base;
 	platform_set_drvdata(pdev, drm);
 
-	if (!is_vc5) {
+	if (gen == VC4_GEN_4) {
 		ret = drmm_mutex_init(drm, &vc4->bin_bo_lock);
 		if (ret)
 			goto err;
@@ -335,7 +339,7 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret)
 		goto err;
 
-	if (!is_vc5) {
+	if (gen == VC4_GEN_4) {
 		ret = vc4_gem_init(drm);
 		if (ret)
 			goto err;
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 6908b36d5953..294858d59e27 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -80,11 +80,16 @@ struct vc4_perfmon {
 	u64 counters[] __counted_by(ncounters);
 };
 
+enum vc4_gen {
+	VC4_GEN_4,
+	VC4_GEN_5,
+};
+
 struct vc4_dev {
 	struct drm_device base;
 	struct device *dev;
 
-	bool is_vc5;
+	enum vc4_gen gen;
 
 	unsigned int irq;
 
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 03648f954985..b4f72f2aaf1b 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -76,7 +76,7 @@ vc4_get_hang_state_ioctl(struct drm_device *dev, void *data,
 	u32 i;
 	int ret = 0;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	if (!vc4->v3d) {
@@ -389,7 +389,7 @@ vc4_wait_for_seqno(struct drm_device *dev, uint64_t seqno, uint64_t timeout_ns,
 	unsigned long timeout_expire;
 	DEFINE_WAIT(wait);
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	if (vc4->finished_seqno >= seqno)
@@ -474,7 +474,7 @@ vc4_submit_next_bin_job(struct drm_device *dev)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_exec_info *exec;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return;
 
 again:
@@ -522,7 +522,7 @@ vc4_submit_next_render_job(struct drm_device *dev)
 	if (!exec)
 		return;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return;
 
 	/* A previous RCL may have written to one of our textures, and
@@ -543,7 +543,7 @@ vc4_move_job_to_render(struct drm_device *dev, struct vc4_exec_info *exec)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	bool was_empty = list_empty(&vc4->render_job_list);
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return;
 
 	list_move_tail(&exec->head, &vc4->render_job_list);
@@ -970,7 +970,7 @@ vc4_job_handle_completed(struct vc4_dev *vc4)
 	unsigned long irqflags;
 	struct vc4_seqno_cb *cb, *cb_temp;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return;
 
 	spin_lock_irqsave(&vc4->job_lock, irqflags);
@@ -1009,7 +1009,7 @@ int vc4_queue_seqno_cb(struct drm_device *dev,
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	unsigned long irqflags;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	cb->func = func;
@@ -1065,7 +1065,7 @@ vc4_wait_seqno_ioctl(struct drm_device *dev, void *data,
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_vc4_wait_seqno *args = data;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	return vc4_wait_for_seqno_ioctl_helper(dev, args->seqno,
@@ -1082,7 +1082,7 @@ vc4_wait_bo_ioctl(struct drm_device *dev, void *data,
 	struct drm_gem_object *gem_obj;
 	struct vc4_bo *bo;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	if (args->pad != 0)
@@ -1131,7 +1131,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
 				  args->shader_rec_size,
 				  args->bo_handle_count);
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	if (!vc4->v3d) {
@@ -1268,7 +1268,7 @@ int vc4_gem_init(struct drm_device *dev)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	vc4->dma_fence_context = dma_fence_context_alloc(1);
@@ -1327,7 +1327,7 @@ int vc4_gem_madvise_ioctl(struct drm_device *dev, void *data,
 	struct vc4_bo *bo;
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	switch (args->madv) {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index fa1f94e29871..171e6a4d0b90 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2104,7 +2104,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 					     VC4_HDMI_AUDIO_PACKET_CEA_MASK);
 
 	/* Set the MAI threshold */
-	if (vc4->is_vc5)
+	if (vc4->gen >= VC4_GEN_5)
 		HDMI_WRITE(HDMI_MAI_THR,
 			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICHIGH) |
 			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICLOW) |
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 933177cb8d66..7380a02a69a2 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -224,7 +224,7 @@ static void vc4_hvs_lut_load(struct vc4_hvs *hvs,
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
-	if (hvs->vc4->is_vc5)
+	if (hvs->vc4->gen == VC4_GEN_4)
 		return;
 
 	/* The LUT memory is laid out with each HVS channel in order,
@@ -296,7 +296,7 @@ int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output)
 	u32 reg;
 	int ret;
 
-	if (!vc4->is_vc5)
+	if (vc4->gen == VC4_GEN_4)
 		return output;
 
 	/*
@@ -377,7 +377,7 @@ static int vc4_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 	dispctrl = SCALER_DISPCTRLX_ENABLE;
 	dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(chan));
 
-	if (!vc4->is_vc5) {
+	if (vc4->gen == VC4_GEN_4) {
 		dispctrl |= VC4_SET_FIELD(mode->hdisplay,
 					  SCALER_DISPCTRLX_WIDTH) |
 			    VC4_SET_FIELD(mode->vdisplay,
@@ -399,7 +399,7 @@ static int vc4_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 	dispbkgndx &= ~SCALER_DISPBKGND_INTERLACE;
 
 	HVS_WRITE(SCALER_DISPBKGNDX(chan), dispbkgndx |
-		  ((!vc4->is_vc5) ? SCALER_DISPBKGND_GAMMA : 0) |
+		  ((vc4->gen == VC4_GEN_4) ? SCALER_DISPBKGND_GAMMA : 0) |
 		  (interlace ? SCALER_DISPBKGND_INTERLACE : 0));
 
 	/* Reload the LUT, since the SRAMs would have been disabled if
@@ -685,7 +685,8 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 
 void vc4_hvs_mask_underrun(struct vc4_hvs *hvs, int channel)
 {
-	struct drm_device *drm = &hvs->vc4->base;
+	struct vc4_dev *vc4 = hvs->vc4;
+	struct drm_device *drm = &vc4->base;
 	u32 dispctrl;
 	int idx;
 
@@ -693,8 +694,9 @@ void vc4_hvs_mask_underrun(struct vc4_hvs *hvs, int channel)
 		return;
 
 	dispctrl = HVS_READ(SCALER_DISPCTRL);
-	dispctrl &= ~(hvs->vc4->is_vc5 ? SCALER5_DISPCTRL_DSPEISLUR(channel) :
-					 SCALER_DISPCTRL_DSPEISLUR(channel));
+	dispctrl &= ~((vc4->gen == VC4_GEN_5) ?
+		      SCALER5_DISPCTRL_DSPEISLUR(channel) :
+		      SCALER_DISPCTRL_DSPEISLUR(channel));
 
 	HVS_WRITE(SCALER_DISPCTRL, dispctrl);
 
@@ -703,7 +705,8 @@ void vc4_hvs_mask_underrun(struct vc4_hvs *hvs, int channel)
 
 void vc4_hvs_unmask_underrun(struct vc4_hvs *hvs, int channel)
 {
-	struct drm_device *drm = &hvs->vc4->base;
+	struct vc4_dev *vc4 = hvs->vc4;
+	struct drm_device *drm = &vc4->base;
 	u32 dispctrl;
 	int idx;
 
@@ -711,8 +714,9 @@ void vc4_hvs_unmask_underrun(struct vc4_hvs *hvs, int channel)
 		return;
 
 	dispctrl = HVS_READ(SCALER_DISPCTRL);
-	dispctrl |= (hvs->vc4->is_vc5 ? SCALER5_DISPCTRL_DSPEISLUR(channel) :
-					SCALER_DISPCTRL_DSPEISLUR(channel));
+	dispctrl |= ((vc4->gen == VC4_GEN_5) ?
+		     SCALER5_DISPCTRL_DSPEISLUR(channel) :
+		     SCALER_DISPCTRL_DSPEISLUR(channel));
 
 	HVS_WRITE(SCALER_DISPSTAT,
 		  SCALER_DISPSTAT_EUFLOW(channel));
@@ -755,8 +759,10 @@ static irqreturn_t vc4_hvs_irq_handler(int irq, void *data)
 	control = HVS_READ(SCALER_DISPCTRL);
 
 	for (channel = 0; channel < SCALER_CHANNELS_COUNT; channel++) {
-		dspeislur = vc4->is_vc5 ? SCALER5_DISPCTRL_DSPEISLUR(channel) :
-					  SCALER_DISPCTRL_DSPEISLUR(channel);
+		dspeislur = (vc4->gen == VC4_GEN_5) ?
+			SCALER5_DISPCTRL_DSPEISLUR(channel) :
+			SCALER_DISPCTRL_DSPEISLUR(channel);
+
 		/* Interrupt masking is not always honored, so check it here. */
 		if (status & SCALER_DISPSTAT_EUFLOW(channel) &&
 		    control & dspeislur) {
@@ -784,7 +790,7 @@ int vc4_hvs_debugfs_init(struct drm_minor *minor)
 	if (!vc4->hvs)
 		return -ENODEV;
 
-	if (!vc4->is_vc5)
+	if (vc4->gen == VC4_GEN_4)
 		debugfs_create_bool("hvs_load_tracker", S_IRUGO | S_IWUSR,
 				    minor->debugfs_root,
 				    &vc4->load_tracker_enabled);
@@ -827,7 +833,7 @@ struct vc4_hvs *__vc4_hvs_alloc(struct vc4_dev *vc4, struct platform_device *pde
 	 * between planes when they don't overlap on the screen, but
 	 * for now we just allocate globally.
 	 */
-	if (!vc4->is_vc5)
+	if (vc4->gen == VC4_GEN_4)
 		/* 48k words of 2x12-bit pixels */
 		drm_mm_init(&hvs->lbm_mm, 0, 48 * 1024);
 	else
@@ -861,7 +867,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	hvs->regset.regs = hvs_regs;
 	hvs->regset.nregs = ARRAY_SIZE(hvs_regs);
 
-	if (vc4->is_vc5) {
+	if (vc4->gen == VC4_GEN_5) {
 		struct rpi_firmware *firmware;
 		struct device_node *node;
 		unsigned int max_rate;
@@ -899,7 +905,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		}
 	}
 
-	if (!vc4->is_vc5)
+	if (vc4->gen == VC4_GEN_4)
 		hvs->dlist = hvs->regs + SCALER_DLIST_START;
 	else
 		hvs->dlist = hvs->regs + SCALER5_DLIST_START;
@@ -940,7 +946,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		    SCALER_DISPCTRL_DISPEIRQ(1) |
 		    SCALER_DISPCTRL_DISPEIRQ(2);
 
-	if (!vc4->is_vc5)
+	if (vc4->gen == VC4_GEN_4)
 		dispctrl &= ~(SCALER_DISPCTRL_DMAEIRQ |
 			      SCALER_DISPCTRL_SLVWREIRQ |
 			      SCALER_DISPCTRL_SLVRDEIRQ |
@@ -995,7 +1001,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 
 	/* Recompute Composite Output Buffer (COB) allocations for the displays
 	 */
-	if (!vc4->is_vc5) {
+	if (vc4->gen == VC4_GEN_4) {
 		/* The COB is 20736 pixels, or just over 10 lines at 2048 wide.
 		 * The bottom 2048 pixels are full 32bpp RGBA (intended for the
 		 * TXP composing RGBA to memory), whilst the remainder are only
diff --git a/drivers/gpu/drm/vc4/vc4_irq.c b/drivers/gpu/drm/vc4/vc4_irq.c
index 563b3dfeb9b9..c006d20b5a78 100644
--- a/drivers/gpu/drm/vc4/vc4_irq.c
+++ b/drivers/gpu/drm/vc4/vc4_irq.c
@@ -263,7 +263,7 @@ vc4_irq_enable(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return;
 
 	if (!vc4->v3d)
@@ -280,7 +280,7 @@ vc4_irq_disable(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return;
 
 	if (!vc4->v3d)
@@ -303,7 +303,7 @@ int vc4_irq_install(struct drm_device *dev, int irq)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	if (irq == IRQ_NOTCONNECTED)
@@ -324,7 +324,7 @@ void vc4_irq_uninstall(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return;
 
 	vc4_irq_disable(dev);
@@ -337,7 +337,7 @@ void vc4_irq_reset(struct drm_device *dev)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	unsigned long irqflags;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return;
 
 	/* Acknowledge any stale IRQs. */
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 5495f2a94fa9..bddfcad10950 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -369,7 +369,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 		old_hvs_state->fifo_state[channel].pending_commit = NULL;
 	}
 
-	if (vc4->is_vc5) {
+	if (vc4->gen == VC4_GEN_5) {
 		unsigned long state_rate = max(old_hvs_state->core_clock_rate,
 					       new_hvs_state->core_clock_rate);
 		unsigned long core_rate = clamp_t(unsigned long, state_rate,
@@ -388,7 +388,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 
 	vc4_ctm_commit(vc4, state);
 
-	if (vc4->is_vc5)
+	if (vc4->gen == VC4_GEN_5)
 		vc5_hvs_pv_muxing_commit(vc4, state);
 	else
 		vc4_hvs_pv_muxing_commit(vc4, state);
@@ -406,7 +406,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 
 	drm_atomic_helper_cleanup_planes(dev, state);
 
-	if (vc4->is_vc5) {
+	if (vc4->gen == VC4_GEN_5) {
 		unsigned long core_rate = min_t(unsigned long,
 						hvs->max_core_rate,
 						new_hvs_state->core_clock_rate);
@@ -461,7 +461,7 @@ static struct drm_framebuffer *vc4_fb_create(struct drm_device *dev,
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_mode_fb_cmd2 mode_cmd_local;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return ERR_PTR(-ENODEV);
 
 	/* If the user didn't specify a modifier, use the
@@ -1040,7 +1040,7 @@ int vc4_kms_load(struct drm_device *dev)
 	 * the BCM2711, but the load tracker computations are used for
 	 * the core clock rate calculation.
 	 */
-	if (!vc4->is_vc5) {
+	if (vc4->gen == VC4_GEN_4) {
 		/* Start with the load tracker enabled. Can be
 		 * disabled through the debugfs load_tracker file.
 		 */
@@ -1056,7 +1056,7 @@ int vc4_kms_load(struct drm_device *dev)
 		return ret;
 	}
 
-	if (vc4->is_vc5) {
+	if (vc4->gen == VC4_GEN_5) {
 		dev->mode_config.max_width = 7680;
 		dev->mode_config.max_height = 7680;
 	} else {
@@ -1064,7 +1064,7 @@ int vc4_kms_load(struct drm_device *dev)
 		dev->mode_config.max_height = 2048;
 	}
 
-	dev->mode_config.funcs = vc4->is_vc5 ? &vc5_mode_funcs : &vc4_mode_funcs;
+	dev->mode_config.funcs = (vc4->gen > VC4_GEN_4) ? &vc5_mode_funcs : &vc4_mode_funcs;
 	dev->mode_config.helper_private = &vc4_mode_config_helpers;
 	dev->mode_config.preferred_depth = 24;
 	dev->mode_config.async_page_flip = true;
diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc4_perfmon.c
index c4ac2c946238..31ee7ef80274 100644
--- a/drivers/gpu/drm/vc4/vc4_perfmon.c
+++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
@@ -23,7 +23,7 @@ void vc4_perfmon_get(struct vc4_perfmon *perfmon)
 		return;
 
 	vc4 = perfmon->dev;
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return;
 
 	refcount_inc(&perfmon->refcnt);
@@ -37,7 +37,7 @@ void vc4_perfmon_put(struct vc4_perfmon *perfmon)
 		return;
 
 	vc4 = perfmon->dev;
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return;
 
 	if (refcount_dec_and_test(&perfmon->refcnt))
@@ -49,7 +49,7 @@ void vc4_perfmon_start(struct vc4_dev *vc4, struct vc4_perfmon *perfmon)
 	unsigned int i;
 	u32 mask;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return;
 
 	if (WARN_ON_ONCE(!perfmon || vc4->active_perfmon))
@@ -69,7 +69,7 @@ void vc4_perfmon_stop(struct vc4_dev *vc4, struct vc4_perfmon *perfmon,
 {
 	unsigned int i;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return;
 
 	if (WARN_ON_ONCE(!vc4->active_perfmon ||
@@ -90,7 +90,7 @@ struct vc4_perfmon *vc4_perfmon_find(struct vc4_file *vc4file, int id)
 	struct vc4_dev *vc4 = vc4file->dev;
 	struct vc4_perfmon *perfmon;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return NULL;
 
 	mutex_lock(&vc4file->perfmon.lock);
@@ -105,7 +105,7 @@ void vc4_perfmon_open_file(struct vc4_file *vc4file)
 {
 	struct vc4_dev *vc4 = vc4file->dev;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return;
 
 	mutex_init(&vc4file->perfmon.lock);
@@ -126,7 +126,7 @@ void vc4_perfmon_close_file(struct vc4_file *vc4file)
 {
 	struct vc4_dev *vc4 = vc4file->dev;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return;
 
 	mutex_lock(&vc4file->perfmon.lock);
@@ -146,7 +146,7 @@ int vc4_perfmon_create_ioctl(struct drm_device *dev, void *data,
 	unsigned int i;
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	if (!vc4->v3d) {
@@ -200,7 +200,7 @@ int vc4_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
 	struct drm_vc4_perfmon_destroy *req = data;
 	struct vc4_perfmon *perfmon;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	if (!vc4->v3d) {
@@ -228,7 +228,7 @@ int vc4_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
 	struct vc4_perfmon *perfmon;
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	if (!vc4->v3d) {
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 4cd1721d2389..a61a29f02be0 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -647,10 +647,10 @@ static u32 vc4_lbm_size(struct drm_plane_state *state)
 	}
 
 	/* Align it to 64 or 128 (hvs5) bytes */
-	lbm = roundup(lbm, vc4->is_vc5 ? 128 : 64);
+	lbm = roundup(lbm, vc4->gen == VC4_GEN_5 ? 128 : 64);
 
 	/* Each "word" of the LBM memory contains 2 or 4 (hvs5) pixels */
-	lbm /= vc4->is_vc5 ? 4 : 2;
+	lbm /= vc4->gen == VC4_GEN_5 ? 4 : 2;
 
 	return lbm;
 }
@@ -772,7 +772,7 @@ static int vc4_plane_allocate_lbm(struct drm_plane_state *state)
 		ret = drm_mm_insert_node_generic(&vc4->hvs->lbm_mm,
 						 &vc4_state->lbm,
 						 lbm_size,
-						 vc4->is_vc5 ? 64 : 32,
+						 vc4->gen == VC4_GEN_5 ? 64 : 32,
 						 0, 0);
 		spin_unlock_irqrestore(&vc4->hvs->mm_lock, irqflags);
 
@@ -1155,7 +1155,7 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 	mix_plane_alpha = state->alpha != DRM_BLEND_ALPHA_OPAQUE &&
 			  fb->format->has_alpha;
 
-	if (!vc4->is_vc5) {
+	if (vc4->gen == VC4_GEN_4) {
 	/* Control word */
 		vc4_dlist_write(vc4_state,
 				SCALER_CTL0_VALID |
@@ -1730,7 +1730,7 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 	};
 
 	for (i = 0; i < ARRAY_SIZE(hvs_formats); i++) {
-		if (!hvs_formats[i].hvs5_only || vc4->is_vc5) {
+		if (!hvs_formats[i].hvs5_only || vc4->gen == VC4_GEN_5) {
 			formats[num_formats] = hvs_formats[i].drm;
 			num_formats++;
 		}
@@ -1745,7 +1745,7 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 		return ERR_CAST(vc4_plane);
 	plane = &vc4_plane->base;
 
-	if (vc4->is_vc5)
+	if (vc4->gen == VC4_GEN_5)
 		drm_plane_helper_add(plane, &vc5_plane_helper_funcs);
 	else
 		drm_plane_helper_add(plane, &vc4_plane_helper_funcs);
diff --git a/drivers/gpu/drm/vc4/vc4_render_cl.c b/drivers/gpu/drm/vc4/vc4_render_cl.c
index 1bda5010f15a..ae4ad956f04f 100644
--- a/drivers/gpu/drm/vc4/vc4_render_cl.c
+++ b/drivers/gpu/drm/vc4/vc4_render_cl.c
@@ -599,7 +599,7 @@ int vc4_get_rcl(struct drm_device *dev, struct vc4_exec_info *exec)
 	bool has_bin = args->bin_cl_size != 0;
 	int ret;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	if (args->min_x_tile > args->max_x_tile ||
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 04ac7805e6d5..f703e6e9ace8 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -127,7 +127,7 @@ static int vc4_v3d_debugfs_ident(struct seq_file *m, void *unused)
 int
 vc4_v3d_pm_get(struct vc4_dev *vc4)
 {
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	mutex_lock(&vc4->power_lock);
@@ -148,7 +148,7 @@ vc4_v3d_pm_get(struct vc4_dev *vc4)
 void
 vc4_v3d_pm_put(struct vc4_dev *vc4)
 {
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return;
 
 	mutex_lock(&vc4->power_lock);
@@ -178,7 +178,7 @@ int vc4_v3d_get_bin_slot(struct vc4_dev *vc4)
 	uint64_t seqno = 0;
 	struct vc4_exec_info *exec;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 try_again:
@@ -325,7 +325,7 @@ int vc4_v3d_bin_bo_get(struct vc4_dev *vc4, bool *used)
 {
 	int ret = 0;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	mutex_lock(&vc4->bin_bo_lock);
@@ -360,7 +360,7 @@ static void bin_bo_release(struct kref *ref)
 
 void vc4_v3d_bin_bo_put(struct vc4_dev *vc4)
 {
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return;
 
 	mutex_lock(&vc4->bin_bo_lock);
diff --git a/drivers/gpu/drm/vc4/vc4_validate.c b/drivers/gpu/drm/vc4/vc4_validate.c
index 7dff3ca5af6b..4f14cba6b46f 100644
--- a/drivers/gpu/drm/vc4/vc4_validate.c
+++ b/drivers/gpu/drm/vc4/vc4_validate.c
@@ -109,7 +109,7 @@ vc4_use_bo(struct vc4_exec_info *exec, uint32_t hindex)
 	struct drm_gem_dma_object *obj;
 	struct vc4_bo *bo;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return NULL;
 
 	if (hindex >= exec->bo_count) {
@@ -169,7 +169,7 @@ vc4_check_tex_size(struct vc4_exec_info *exec, struct drm_gem_dma_object *fbo,
 	uint32_t utile_w = utile_width(cpp);
 	uint32_t utile_h = utile_height(cpp);
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return false;
 
 	/* The shaded vertex format stores signed 12.4 fixed point
@@ -495,7 +495,7 @@ vc4_validate_bin_cl(struct drm_device *dev,
 	uint32_t dst_offset = 0;
 	uint32_t src_offset = 0;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	while (src_offset < len) {
@@ -942,7 +942,7 @@ vc4_validate_shader_recs(struct drm_device *dev,
 	uint32_t i;
 	int ret = 0;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return -ENODEV;
 
 	for (i = 0; i < exec->shader_state_count; i++) {
diff --git a/drivers/gpu/drm/vc4/vc4_validate_shaders.c b/drivers/gpu/drm/vc4/vc4_validate_shaders.c
index 9745f8810eca..afb1a4d82684 100644
--- a/drivers/gpu/drm/vc4/vc4_validate_shaders.c
+++ b/drivers/gpu/drm/vc4/vc4_validate_shaders.c
@@ -786,7 +786,7 @@ vc4_validate_shader(struct drm_gem_dma_object *shader_obj)
 	struct vc4_validated_shader_info *validated_shader = NULL;
 	struct vc4_shader_validation_state validation_state;
 
-	if (WARN_ON_ONCE(vc4->is_vc5))
+	if (WARN_ON_ONCE(vc4->gen == VC4_GEN_5))
 		return NULL;
 
 	memset(&validation_state, 0, sizeof(validation_state));
-- 
2.34.1

