Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFF4751B77
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CBF10E62C;
	Thu, 13 Jul 2023 08:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15210882AF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:25:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcf-0005wd-SY; Thu, 13 Jul 2023 10:24:25 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrce-00E4jn-Va; Thu, 13 Jul 2023 10:24:24 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcd-004VhK-UH; Thu, 13 Jul 2023 10:24:23 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Julia Lawall <julia.lawall@inria.fr>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>,
 Luben Tuikov <luben.tuikov@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sean Paul <seanpaul@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 10/17] drm/framebuffer: Rename struct drm_framebuffer::dev to
 drm
Date: Thu, 13 Jul 2023 10:24:01 +0200
Message-Id: <20230713082408.2266984-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=39521;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=7jc7ZTixNdxPkSpxFCdYVchieH4T0tvxaZYeBTNQWq0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkr7SVtC9yBjBibL6dcl130sZn7Db4mArBAS8/0
 MjtXcolgCWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK+0lQAKCRCPgPtYfRL+
 Tv4UCACf80SCnLcCzm0K+DfPPM/SXO3zUuVFUPVLFCLsUP/OZ7ziJphUrZe5PFSJP21dx+DbRLX
 DbM697ftgdbxP/Fa0k8TTipgChXBZ4YDoKBmeDpmTkwitlVduiMrY90SgbZKXrIqix3/71y0X+F
 a9r/IQbPnR3Xw7EU3HpZ0vSx5w94gdtOVVM57H17B68mN7OahRYdBkZzRMJ5DJRQUCTXueToirf
 /VCDq+Q5dE6PImaWQ8+h/Cj8Trv99DP+4GxAK2LVedNFlqGao8ayqXY9o0qXawURPo9zHVsPWjg
 SJJCVNM2e7kTgsz99NdkGaoyQe7zFhfbTsbEflX7svHP+WV5
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"dev" is usually used for struct device pointers. Using it for struct
drm_device pointers is irritating (for me at least). Replace it
by "drm" and adapt all users.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 16 +++----
 .../arm/display/komeda/komeda_framebuffer.c   |  2 +-
 drivers/gpu/drm/drm_damage_helper.c           |  6 +--
 drivers/gpu/drm/drm_format_helper.c           |  8 ++--
 drivers/gpu/drm/drm_framebuffer.c             | 18 ++++----
 drivers/gpu/drm/drm_gem_framebuffer_helper.c  |  5 ++-
 drivers/gpu/drm/drm_mipi_dbi.c                |  8 ++--
 drivers/gpu/drm/drm_modeset_helper.c          |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c     |  2 +-
 drivers/gpu/drm/gud/gud_pipe.c                |  4 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |  2 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_fb.c       | 42 +++++++++----------
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |  4 +-
 .../drm/i915/display/skl_universal_plane.c    |  4 +-
 drivers/gpu/drm/loongson/lsdc_plane.c         |  2 +-
 drivers/gpu/drm/msm/msm_fb.c                  |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c       |  2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c     |  2 +-
 drivers/gpu/drm/omapdrm/omap_fb.c             | 12 +++---
 drivers/gpu/drm/qxl/qxl_display.c             |  7 ++--
 drivers/gpu/drm/solomon/ssd130x.c             |  2 +-
 drivers/gpu/drm/tiny/gm12u320.c               |  2 +-
 drivers/gpu/drm/tiny/ili9225.c                |  7 ++--
 drivers/gpu/drm/tiny/repaper.c                |  4 +-
 drivers/gpu/drm/tiny/st7586.c                 |  7 ++--
 drivers/gpu/drm/udl/udl_modeset.c             |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c         |  2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c         |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c           |  4 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c       |  4 +-
 include/drm/drm_framebuffer.h                 |  4 +-
 32 files changed, 99 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index f28090ecc603..032290c459c3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -700,7 +700,7 @@ extract_render_dcc_offset(struct amdgpu_device *adev,
 
 static int convert_tiling_flags_to_modifier(struct amdgpu_framebuffer *afb)
 {
-	struct amdgpu_device *adev = drm_to_adev(afb->base.dev);
+	struct amdgpu_device *adev = drm_to_adev(afb->base.drm);
 	uint64_t modifier = 0;
 	int num_pipes = 0;
 	int num_pkrs = 0;
@@ -899,7 +899,7 @@ static int check_tiling_flags_gfx6(struct amdgpu_framebuffer *afb)
 	case 3: /* RENDER */
 		return 0;
 	default:
-		drm_dbg_kms(afb->base.dev,
+		drm_dbg_kms(afb->base.drm,
 			    "Micro tile mode %llu not supported for scanout\n",
 			    micro_tile_mode);
 		return -EINVAL;
@@ -964,13 +964,13 @@ static int amdgpu_display_verify_plane(struct amdgpu_framebuffer *rfb, int plane
 	uint64_t size;
 
 	if (rfb->base.pitches[plane] % block_pitch) {
-		drm_dbg_kms(rfb->base.dev,
+		drm_dbg_kms(rfb->base.drm,
 			    "pitch %d for plane %d is not a multiple of block pitch %d\n",
 			    rfb->base.pitches[plane], plane, block_pitch);
 		return -EINVAL;
 	}
 	if (rfb->base.pitches[plane] < min_pitch) {
-		drm_dbg_kms(rfb->base.dev,
+		drm_dbg_kms(rfb->base.drm,
 			    "pitch %d for plane %d is less than minimum pitch %d\n",
 			    rfb->base.pitches[plane], plane, min_pitch);
 		return -EINVAL;
@@ -978,7 +978,7 @@ static int amdgpu_display_verify_plane(struct amdgpu_framebuffer *rfb, int plane
 
 	/* Force at least natural alignment. */
 	if (rfb->base.offsets[plane] % block_size) {
-		drm_dbg_kms(rfb->base.dev,
+		drm_dbg_kms(rfb->base.drm,
 			    "offset 0x%x for plane %d is not a multiple of block pitch 0x%x\n",
 			    rfb->base.offsets[plane], plane, block_size);
 		return -EINVAL;
@@ -989,7 +989,7 @@ static int amdgpu_display_verify_plane(struct amdgpu_framebuffer *rfb, int plane
 		block_size * DIV_ROUND_UP(height, block_height);
 
 	if (rfb->base.obj[0]->size < size) {
-		drm_dbg_kms(rfb->base.dev,
+		drm_dbg_kms(rfb->base.drm,
 			    "BO size 0x%zx is less than 0x%llx required for plane %d\n",
 			    rfb->base.obj[0]->size, size, plane);
 		return -EINVAL;
@@ -1006,7 +1006,7 @@ static int amdgpu_display_verify_sizes(struct amdgpu_framebuffer *rfb)
 	int ret;
 	unsigned int i, block_width, block_height, block_size_log2;
 
-	if (rfb->base.dev->mode_config.fb_modifiers_not_supported)
+	if (rfb->base.drm->mode_config.fb_modifiers_not_supported)
 		return 0;
 
 	for (i = 0; i < format_info->num_planes; ++i) {
@@ -1034,7 +1034,7 @@ static int amdgpu_display_verify_sizes(struct amdgpu_framebuffer *rfb)
 				block_size_log2 = 18;
 				break;
 			default:
-				drm_dbg_kms(rfb->base.dev,
+				drm_dbg_kms(rfb->base.drm,
 					    "Swizzle mode with unknown block size: %d\n", swizzle);
 				return -EINVAL;
 			}
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index df5da5a44755..78138427c210 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -268,7 +268,7 @@ bool komeda_fb_is_layer_supported(struct komeda_fb *kfb, u32 layer_type,
 				  u32 rot)
 {
 	struct drm_framebuffer *fb = &kfb->base;
-	struct komeda_dev *mdev = fb->dev->dev_private;
+	struct komeda_dev *mdev = fb->drm->dev_private;
 	u32 fourcc = fb->format->format;
 	u64 modifier = fb->modifier;
 	bool supported;
diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
index d8b2955e88fd..5381c57991c5 100644
--- a/drivers/gpu/drm/drm_damage_helper.c
+++ b/drivers/gpu/drm/drm_damage_helper.c
@@ -123,7 +123,7 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
 	drm_modeset_acquire_init(&ctx,
 		file_priv ? DRM_MODESET_ACQUIRE_INTERRUPTIBLE : 0);
 
-	state = drm_atomic_state_alloc(fb->dev);
+	state = drm_atomic_state_alloc(fb->drm);
 	if (!state) {
 		ret = -ENOMEM;
 		goto out_drop_locks;
@@ -145,7 +145,7 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
 		}
 
 		convert_clip_rect_to_rect(clips, rects, num_clips, inc);
-		damage = drm_property_create_blob(fb->dev,
+		damage = drm_property_create_blob(fb->drm,
 						  num_clips * sizeof(*rects),
 						  rects);
 		if (IS_ERR(damage)) {
@@ -156,7 +156,7 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
 	}
 
 retry:
-	drm_for_each_plane(plane, fb->dev) {
+	drm_for_each_plane(plane, fb->drm) {
 		struct drm_plane_state *plane_state;
 
 		ret = drm_modeset_lock(&plane->mutex, state->acquire_ctx);
diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index f93a4efcee90..cdc723856215 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -263,7 +263,8 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
 		swab_line = drm_fb_swab16_line;
 		break;
 	default:
-		drm_warn_once(fb->dev, "Format %p4cc has unsupported pixel size.\n",
+		drm_warn_once(fb->drm,
+			      "Format %p4cc has unsupported pixel size.\n",
 			      &format->format);
 		return;
 	}
@@ -946,7 +947,8 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		}
 	}
 
-	drm_warn_once(fb->dev, "No conversion helper from %p4cc to %p4cc found.\n",
+	drm_warn_once(fb->drm,
+		      "No conversion helper from %p4cc to %p4cc found.\n",
 		      &fb_format, &dst_format);
 
 	return -EINVAL;
@@ -1011,7 +1013,7 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
 	unsigned int lines = drm_rect_height(clip);
 	unsigned int cpp = fb->format->cpp[0];
 	unsigned int len_src32 = linepixels * cpp;
-	struct drm_device *dev = fb->dev;
+	struct drm_device *dev = fb->drm;
 	void *vaddr = src[0].vaddr;
 	unsigned int dst_pitch_0;
 	unsigned int y;
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 38a118e51a6f..882a8b1eaa16 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -87,7 +87,7 @@ int drm_framebuffer_check_src_coords(uint32_t src_x, uint32_t src_y,
 	    src_x > fb_width - src_w ||
 	    src_h > fb_height ||
 	    src_y > fb_height - src_h) {
-		drm_dbg_kms(fb->dev, "Invalid source coordinates "
+		drm_dbg_kms(fb->drm, "Invalid source coordinates "
 			    "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
 			    src_w >> 16, ((src_w & 0xffff) * 15625) >> 10,
 			    src_h >> 16, ((src_h & 0xffff) * 15625) >> 10,
@@ -404,7 +404,7 @@ static void drm_mode_rmfb_work_fn(struct work_struct *w)
 		struct drm_framebuffer *fb =
 			list_first_entry(&arg->fbs, typeof(*fb), filp_head);
 
-		drm_dbg_kms(fb->dev,
+		drm_dbg_kms(fb->drm,
 			    "Removing [FB:%d] from all active usage due to RMFB ioctl\n",
 			    fb->base.id);
 		list_del_init(&fb->filp_head);
@@ -812,7 +812,7 @@ void drm_framebuffer_free(struct kref *kref)
 {
 	struct drm_framebuffer *fb =
 			container_of(kref, struct drm_framebuffer, base.refcount);
-	struct drm_device *dev = fb->dev;
+	struct drm_device *dev = fb->drm;
 
 	/*
 	 * The lookup idr holds a weak reference, which has not necessarily been
@@ -846,7 +846,7 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
 {
 	int ret;
 
-	if (WARN_ON_ONCE(fb->dev != dev || !fb->format))
+	if (WARN_ON_ONCE(fb->drm != dev || !fb->format))
 		return -EINVAL;
 
 	INIT_LIST_HEAD(&fb->filp_head);
@@ -915,7 +915,7 @@ void drm_framebuffer_unregister_private(struct drm_framebuffer *fb)
 	if (!fb)
 		return;
 
-	dev = fb->dev;
+	dev = fb->drm;
 
 	/* Mark fb as reaped and drop idr ref. */
 	drm_mode_object_unregister(dev, &fb->base);
@@ -941,7 +941,7 @@ EXPORT_SYMBOL(drm_framebuffer_unregister_private);
  */
 void drm_framebuffer_cleanup(struct drm_framebuffer *fb)
 {
-	struct drm_device *dev = fb->dev;
+	struct drm_device *dev = fb->drm;
 
 	mutex_lock(&dev->mode_config.fb_lock);
 	list_del(&fb->head);
@@ -953,7 +953,7 @@ EXPORT_SYMBOL(drm_framebuffer_cleanup);
 static int atomic_remove_fb(struct drm_framebuffer *fb)
 {
 	struct drm_modeset_acquire_ctx ctx;
-	struct drm_device *dev = fb->dev;
+	struct drm_device *dev = fb->drm;
 	struct drm_atomic_state *state;
 	struct drm_plane *plane;
 	struct drm_connector *conn __maybe_unused;
@@ -1056,7 +1056,7 @@ static int atomic_remove_fb(struct drm_framebuffer *fb)
 
 static void legacy_remove_fb(struct drm_framebuffer *fb)
 {
-	struct drm_device *dev = fb->dev;
+	struct drm_device *dev = fb->drm;
 	struct drm_crtc *crtc;
 	struct drm_plane *plane;
 
@@ -1104,7 +1104,7 @@ void drm_framebuffer_remove(struct drm_framebuffer *fb)
 	if (!fb)
 		return;
 
-	dev = fb->dev;
+	dev = fb->drm;
 
 	WARN_ON(!list_empty(&fb->filp_head));
 
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index b8a615a138cd..50cfcd7ec1c0 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -53,7 +53,7 @@ MODULE_IMPORT_NS(DMA_BUF);
 struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
 					  unsigned int plane)
 {
-	struct drm_device *dev = fb->dev;
+	struct drm_device *dev = fb->drm;
 
 	if (drm_WARN_ON_ONCE(dev, plane >= ARRAY_SIZE(fb->obj)))
 		return NULL;
@@ -433,7 +433,8 @@ static void __drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_dat
 			continue;
 		ret = dma_buf_end_cpu_access(import_attach->dmabuf, dir);
 		if (ret)
-			drm_err(fb->dev, "dma_buf_end_cpu_access(%u, %d) failed: %d\n",
+			drm_err(fb->drm,
+				"dma_buf_end_cpu_access(%u, %d) failed: %d\n",
 				ret, num_planes, dir);
 	}
 }
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index bd8a3802583f..7b85ebaac7c8 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -223,7 +223,7 @@ int mipi_dbi_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *
 		drm_fb_xrgb8888_to_rgb565(&dst_map, NULL, src, fb, clip, swap);
 		break;
 	default:
-		drm_err_once(fb->dev, "Format is not supported: %p4cc\n",
+		drm_err_once(fb->drm, "Format is not supported: %p4cc\n",
 			     &fb->format->format);
 		ret = -EINVAL;
 	}
@@ -254,7 +254,7 @@ static void mipi_dbi_set_window_address(struct mipi_dbi_dev *dbidev,
 static void mipi_dbi_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 			      struct drm_rect *rect)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->drm);
 	unsigned int height = rect->y2 - rect->y1;
 	unsigned int width = rect->x2 - rect->x1;
 	struct mipi_dbi *dbi = &dbidev->dbi;
@@ -284,7 +284,7 @@ static void mipi_dbi_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 				   width * height * 2);
 err_msg:
 	if (ret)
-		drm_err_once(fb->dev, "Failed to update display %d\n", ret);
+		drm_err_once(fb->drm, "Failed to update display %d\n", ret);
 }
 
 /**
@@ -328,7 +328,7 @@ void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (WARN_ON(!fb))
 		return;
 
-	if (!drm_dev_enter(fb->dev, &idx))
+	if (!drm_dev_enter(fb->drm, &idx))
 		return;
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
index f858dfedf2cf..14dc6b62868a 100644
--- a/drivers/gpu/drm/drm_modeset_helper.c
+++ b/drivers/gpu/drm/drm_modeset_helper.c
@@ -83,7 +83,7 @@ void drm_helper_mode_fill_fb_struct(struct drm_device *dev,
 {
 	int i;
 
-	fb->dev = dev;
+	fb->drm = dev;
 	fb->format = drm_get_format_info(dev, mode_cmd);
 	fb->width = mode_cmd->width;
 	fb->height = mode_cmd->height;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 31955e948ea2..0b5ce24597ae 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -178,7 +178,7 @@ exynos_drm_plane_check_format(const struct exynos_drm_plane_config *config,
 			      struct exynos_drm_plane_state *state)
 {
 	struct drm_framebuffer *fb = state->base.fb;
-	struct drm_device *dev = fb->dev;
+	struct drm_device *dev = fb->drm;
 
 	switch (fb->modifier) {
 	case DRM_FORMAT_MOD_SAMSUNG_64_32_TILE:
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index a87997c2c043..a6407b670c85 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -344,7 +344,7 @@ static void gud_flush_damage(struct gud_device *gdrm, struct drm_framebuffer *fb
 		if (ret) {
 			if (ret != -ENODEV && ret != -ECONNRESET &&
 			    ret != -ESHUTDOWN && ret != -EPROTO)
-				dev_err_ratelimited(fb->dev->dev,
+				dev_err_ratelimited(fb->drm->dev,
 						    "Failed to flush framebuffer: error=%d\n", ret);
 			gdrm->prev_flush_failed = true;
 			break;
@@ -543,7 +543,7 @@ int gud_pipe_check(struct drm_simple_display_pipe *pipe,
 		num_properties++;
 	}
 
-	if (drm_dev_enter(fb->dev, &idx)) {
+	if (drm_dev_enter(fb->drm, &idx)) {
 		len = struct_size(req, properties, num_properties);
 		ret = gud_usb_set(gdrm, GUD_REQ_SET_STATE_CHECK, 0, req, len);
 		drm_dev_exit(idx);
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index 3b614baf835f..2d93fb2ce6c0 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -23,7 +23,7 @@ static int hyperv_blit_to_vram_rect(struct drm_framebuffer *fb,
 				    const struct iosys_map *vmap,
 				    struct drm_rect *rect)
 {
-	struct hyperv_drm_device *hv = to_hv(fb->dev);
+	struct hyperv_drm_device *hv = to_hv(fb->drm);
 	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(hv->vram);
 	int idx;
 
diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index d43430c4d539..be31ce8ebb10 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -999,7 +999,7 @@ i9xx_get_initial_plane_config(struct intel_crtc *crtc,
 
 	fb = &intel_fb->base;
 
-	fb->dev = dev;
+	fb->drm = dev;
 
 	val = intel_de_read(dev_priv, DSPCNTR(i9xx_plane));
 
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 446bbf7986b6..4109c894abd3 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -542,7 +542,7 @@ int intel_fb_rc_ccs_cc_plane(const struct drm_framebuffer *fb)
 	if (!md->ccs.cc_planes)
 		return -1;
 
-	drm_WARN_ON_ONCE(fb->dev, hweight8(md->ccs.cc_planes) > 1);
+	drm_WARN_ON_ONCE(fb->drm, hweight8(md->ccs.cc_planes) > 1);
 
 	return ilog2((int)md->ccs.cc_planes);
 }
@@ -567,7 +567,7 @@ bool is_surface_linear(const struct drm_framebuffer *fb, int color_plane)
 
 int main_to_ccs_plane(const struct drm_framebuffer *fb, int main_plane)
 {
-	drm_WARN_ON(fb->dev, !intel_fb_is_ccs_modifier(fb->modifier) ||
+	drm_WARN_ON(fb->drm, !intel_fb_is_ccs_modifier(fb->modifier) ||
 		    (main_plane && main_plane >= fb->format->num_planes / 2));
 
 	return fb->format->num_planes / 2 + main_plane;
@@ -575,7 +575,7 @@ int main_to_ccs_plane(const struct drm_framebuffer *fb, int main_plane)
 
 int skl_ccs_to_main_plane(const struct drm_framebuffer *fb, int ccs_plane)
 {
-	drm_WARN_ON(fb->dev, !intel_fb_is_ccs_modifier(fb->modifier) ||
+	drm_WARN_ON(fb->drm, !intel_fb_is_ccs_modifier(fb->modifier) ||
 		    ccs_plane < fb->format->num_planes / 2);
 
 	if (is_gen12_ccs_cc_plane(fb, ccs_plane))
@@ -596,7 +596,7 @@ static unsigned int gen12_ccs_aux_stride(struct intel_framebuffer *fb, int ccs_p
 int skl_main_to_aux_plane(const struct drm_framebuffer *fb, int main_plane)
 {
 	const struct intel_modifier_desc *md = lookup_modifier(fb->modifier);
-	struct drm_i915_private *i915 = to_i915(fb->dev);
+	struct drm_i915_private *i915 = to_i915(fb->drm);
 
 	if (md->ccs.packed_aux_planes | md->ccs.planar_aux_planes)
 		return main_to_ccs_plane(fb, main_plane);
@@ -615,7 +615,7 @@ unsigned int intel_tile_size(const struct drm_i915_private *i915)
 unsigned int
 intel_tile_width_bytes(const struct drm_framebuffer *fb, int color_plane)
 {
-	struct drm_i915_private *dev_priv = to_i915(fb->dev);
+	struct drm_i915_private *dev_priv = to_i915(fb->drm);
 	unsigned int cpp = fb->format->cpp[color_plane];
 
 	switch (fb->modifier) {
@@ -681,7 +681,7 @@ intel_tile_width_bytes(const struct drm_framebuffer *fb, int color_plane)
 
 unsigned int intel_tile_height(const struct drm_framebuffer *fb, int color_plane)
 {
-	return intel_tile_size(to_i915(fb->dev)) /
+	return intel_tile_size(to_i915(fb->drm)) /
 		intel_tile_width_bytes(fb, color_plane);
 }
 
@@ -760,8 +760,8 @@ bool intel_fb_modifier_uses_dpt(struct drm_i915_private *i915, u64 modifier)
 
 bool intel_fb_uses_dpt(const struct drm_framebuffer *fb)
 {
-	return fb && to_i915(fb->dev)->params.enable_dpt &&
-		intel_fb_modifier_uses_dpt(to_i915(fb->dev), fb->modifier);
+	return fb && to_i915(fb->drm)->params.enable_dpt &&
+		intel_fb_modifier_uses_dpt(to_i915(fb->drm), fb->modifier);
 }
 
 unsigned int intel_cursor_alignment(const struct drm_i915_private *i915)
@@ -792,7 +792,7 @@ static unsigned int intel_linear_alignment(const struct drm_i915_private *dev_pr
 unsigned int intel_surf_alignment(const struct drm_framebuffer *fb,
 				  int color_plane)
 {
-	struct drm_i915_private *dev_priv = to_i915(fb->dev);
+	struct drm_i915_private *dev_priv = to_i915(fb->drm);
 
 	if (intel_fb_uses_dpt(fb))
 		return 512 * 4096;
@@ -954,7 +954,7 @@ static u32 intel_adjust_aligned_offset(int *x, int *y,
 				       unsigned int pitch,
 				       u32 old_offset, u32 new_offset)
 {
-	struct drm_i915_private *i915 = to_i915(fb->dev);
+	struct drm_i915_private *i915 = to_i915(fb->drm);
 	unsigned int cpp = fb->format->cpp[color_plane];
 
 	drm_WARN_ON(&i915->drm, new_offset > old_offset);
@@ -1093,7 +1093,7 @@ static int intel_fb_offset_to_xy(int *x, int *y,
 				 const struct drm_framebuffer *fb,
 				 int color_plane)
 {
-	struct drm_i915_private *i915 = to_i915(fb->dev);
+	struct drm_i915_private *i915 = to_i915(fb->drm);
 	unsigned int height;
 	u32 alignment;
 
@@ -1139,7 +1139,7 @@ static int intel_fb_offset_to_xy(int *x, int *y,
 
 static int intel_fb_check_ccs_xy(const struct drm_framebuffer *fb, int ccs_plane, int x, int y)
 {
-	struct drm_i915_private *i915 = to_i915(fb->dev);
+	struct drm_i915_private *i915 = to_i915(fb->drm);
 	const struct intel_framebuffer *intel_fb = to_intel_framebuffer(fb);
 	int main_plane;
 	int hsub, vsub;
@@ -1228,7 +1228,7 @@ static bool intel_plane_can_remap(const struct intel_plane_state *plane_state)
 
 bool intel_fb_needs_pot_stride_remap(const struct intel_framebuffer *fb)
 {
-	struct drm_i915_private *i915 = to_i915(fb->base.dev);
+	struct drm_i915_private *i915 = to_i915(fb->base.drm);
 
 	return (IS_ALDERLAKE_P(i915) || DISPLAY_VER(i915) >= 14) &&
 		intel_fb_uses_dpt(&fb->base);
@@ -1280,7 +1280,7 @@ static int convert_plane_offset_to_xy(const struct intel_framebuffer *fb, int co
 
 	ret = intel_fb_offset_to_xy(x, y, &fb->base, color_plane);
 	if (ret) {
-		drm_dbg_kms(fb->base.dev,
+		drm_dbg_kms(fb->base.drm,
 			    "bad fb plane %d offset: 0x%x\n",
 			    color_plane, fb->base.offsets[color_plane]);
 		return ret;
@@ -1301,7 +1301,7 @@ static int convert_plane_offset_to_xy(const struct intel_framebuffer *fb, int co
 	 */
 	if (color_plane == 0 && i915_gem_object_is_tiled(obj) &&
 	    (*x + plane_width) * fb->base.format->cpp[color_plane] > fb->base.pitches[color_plane]) {
-		drm_dbg_kms(fb->base.dev,
+		drm_dbg_kms(fb->base.drm,
 			    "bad fb plane %d offset: 0x%x\n",
 			    color_plane, fb->base.offsets[color_plane]);
 		return -EINVAL;
@@ -1312,7 +1312,7 @@ static int convert_plane_offset_to_xy(const struct intel_framebuffer *fb, int co
 
 static u32 calc_plane_aligned_offset(const struct intel_framebuffer *fb, int color_plane, int *x, int *y)
 {
-	struct drm_i915_private *i915 = to_i915(fb->base.dev);
+	struct drm_i915_private *i915 = to_i915(fb->base.drm);
 	unsigned int tile_size = intel_tile_size(i915);
 	u32 offset;
 
@@ -1367,7 +1367,7 @@ plane_view_scanout_stride(const struct intel_framebuffer *fb, int color_plane,
 			  unsigned int tile_width,
 			  unsigned int src_stride_tiles, unsigned int dst_stride_tiles)
 {
-	struct drm_i915_private *i915 = to_i915(fb->base.dev);
+	struct drm_i915_private *i915 = to_i915(fb->base.drm);
 	unsigned int stride_tiles;
 
 	if (IS_ALDERLAKE_P(i915) || DISPLAY_VER(i915) >= 14)
@@ -1399,7 +1399,7 @@ plane_view_linear_tiles(const struct intel_framebuffer *fb, int color_plane,
 			const struct fb_plane_view_dims *dims,
 			int x, int y)
 {
-	struct drm_i915_private *i915 = to_i915(fb->base.dev);
+	struct drm_i915_private *i915 = to_i915(fb->base.drm);
 	unsigned int size;
 
 	size = (y + dims->height) * fb->base.pitches[color_plane] +
@@ -1424,7 +1424,7 @@ static u32 calc_plane_remap_info(const struct intel_framebuffer *fb, int color_p
 				 u32 obj_offset, u32 gtt_offset, int x, int y,
 				 struct intel_fb_view *view)
 {
-	struct drm_i915_private *i915 = to_i915(fb->base.dev);
+	struct drm_i915_private *i915 = to_i915(fb->base.drm);
 	struct intel_remapped_plane_info *remap_info = &view->gtt.remapped.plane[color_plane];
 	struct i915_color_plane_view *color_plane_info = &view->color_plane[color_plane];
 	unsigned int tile_width = dims->tile_width;
@@ -1571,7 +1571,7 @@ static void intel_fb_view_init(struct drm_i915_private *i915, struct intel_fb_vi
 
 bool intel_fb_supports_90_270_rotation(const struct intel_framebuffer *fb)
 {
-	if (DISPLAY_VER(to_i915(fb->base.dev)) >= 13)
+	if (DISPLAY_VER(to_i915(fb->base.drm)) >= 13)
 		return false;
 
 	return fb->base.modifier == I915_FORMAT_MOD_Y_TILED ||
@@ -1759,7 +1759,7 @@ u32 intel_fb_max_stride(struct drm_i915_private *dev_priv,
 static u32
 intel_fb_stride_alignment(const struct drm_framebuffer *fb, int color_plane)
 {
-	struct drm_i915_private *dev_priv = to_i915(fb->dev);
+	struct drm_i915_private *dev_priv = to_i915(fb->drm);
 	u32 tile_width;
 
 	if (is_surface_linear(fb, color_plane)) {
diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
index fffd568070d4..bee4ee229182 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
@@ -23,7 +23,7 @@ intel_pin_fb_obj_dpt(struct drm_framebuffer *fb,
 		     unsigned long *out_flags,
 		     struct i915_address_space *vm)
 {
-	struct drm_device *dev = fb->dev;
+	struct drm_device *dev = fb->drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
 	struct i915_gem_ww_ctx ww;
@@ -109,7 +109,7 @@ intel_pin_and_fence_fb_obj(struct drm_framebuffer *fb,
 			   bool uses_fence,
 			   unsigned long *out_flags)
 {
-	struct drm_device *dev = fb->dev;
+	struct drm_device *dev = fb->drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
 	intel_wakeref_t wakeref;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index f60e17d3e019..e4a398224b91 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1847,7 +1847,7 @@ static bool skl_fb_scalable(const struct drm_framebuffer *fb)
 	case DRM_FORMAT_ARGB16161616F:
 	case DRM_FORMAT_XBGR16161616F:
 	case DRM_FORMAT_ABGR16161616F:
-		return DISPLAY_VER(to_i915(fb->dev)) >= 11;
+		return DISPLAY_VER(to_i915(fb->drm)) >= 11;
 	default:
 		return true;
 	}
@@ -2420,7 +2420,7 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 
 	fb = &intel_fb->base;
 
-	fb->dev = dev;
+	fb->drm = dev;
 
 	val = intel_de_read(dev_priv, PLANE_CTL(pipe, plane_id));
 
diff --git a/drivers/gpu/drm/loongson/lsdc_plane.c b/drivers/gpu/drm/loongson/lsdc_plane.c
index 2ab3db982aa3..bd8a27106d16 100644
--- a/drivers/gpu/drm/loongson/lsdc_plane.c
+++ b/drivers/gpu/drm/loongson/lsdc_plane.c
@@ -41,7 +41,7 @@ static unsigned int lsdc_get_fb_offset(struct drm_framebuffer *fb,
 
 static u64 lsdc_fb_base_addr(struct drm_framebuffer *fb)
 {
-	struct lsdc_device *ldev = to_lsdc(fb->dev);
+	struct lsdc_device *ldev = to_lsdc(fb->drm);
 	struct lsdc_bo *lbo = gem_to_lsdc_bo(fb->obj[0]);
 
 	return lsdc_bo_gpu_offset(lbo) + ldev->vram_base;
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index e3f61c39df69..5235c908b13a 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -89,7 +89,7 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb,
 
 	for (i = 0; i < n; i++) {
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], aspace, &msm_fb->iova[i]);
-		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)",
+		drm_dbg_state(fb->drm, "FB[%u]: iova[%d]: %08llx (%d)",
 			      fb->base.id, i, msm_fb->iova[i], ret);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 7a2cceaee6e9..0f48af3f2008 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -50,7 +50,7 @@ nv50_wndw_ctxdma_del(struct nv50_wndw_ctxdma *ctxdma)
 static struct nv50_wndw_ctxdma *
 nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct drm_framebuffer *fb)
 {
-	struct nouveau_drm *drm = nouveau_drm(fb->dev);
+	struct nouveau_drm *drm = nouveau_drm(fb->drm);
 	struct nv50_wndw_ctxdma *ctxdma;
 	u32 handle;
 	u32 unused;
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 1d005473a488..5dff54f83f46 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -165,7 +165,7 @@ nouveau_framebuffer_get_layout(struct drm_framebuffer *fb,
 			       uint8_t *kind)
 {
 	if (fb->flags & DRM_MODE_FB_MODIFIERS) {
-		struct nouveau_drm *drm = nouveau_drm(fb->dev);
+		struct nouveau_drm *drm = nouveau_drm(fb->drm);
 
 		nouveau_decode_mod(drm, fb->modifier, tile_mode, kind);
 	} else {
diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
index 1d414b33fee3..01b7a4bef3ec 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.c
+++ b/drivers/gpu/drm/omapdrm/omap_fb.c
@@ -65,12 +65,12 @@ static int omap_framebuffer_dirty(struct drm_framebuffer *fb,
 {
 	struct drm_crtc *crtc;
 
-	drm_modeset_lock_all(fb->dev);
+	drm_modeset_lock_all(fb->drm);
 
-	drm_for_each_crtc(crtc, fb->dev)
+	drm_for_each_crtc(crtc, fb->drm)
 		omap_crtc_flush(crtc);
 
-	drm_modeset_unlock_all(fb->dev);
+	drm_modeset_unlock_all(fb->drm);
 
 	return 0;
 }
@@ -196,9 +196,9 @@ void omap_framebuffer_update_scanout(struct drm_framebuffer *fb,
 			break;
 
 		default:
-			dev_warn(fb->dev->dev,
-				"rotation '%d' ignored for non-tiled fb\n",
-				state->rotation);
+			dev_warn(fb->drm->dev,
+				 "rotation '%d' ignored for non-tiled fb\n",
+				 state->rotation);
 			break;
 		}
 
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 3f86e1072f6a..d123a59c0c9f 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -407,14 +407,15 @@ static int qxl_framebuffer_surface_dirty(struct drm_framebuffer *fb,
 					 unsigned int num_clips)
 {
 	/* TODO: vmwgfx where this was cribbed from had locking. Why? */
-	struct qxl_device *qdev = to_qxl(fb->dev);
+	struct qxl_device *qdev = to_qxl(fb->drm);
 	struct drm_clip_rect norect;
 	struct qxl_bo *qobj;
 	struct drm_modeset_acquire_ctx ctx;
 	bool is_primary;
 	int inc = 1, ret;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
+	DRM_MODESET_LOCK_ALL_BEGIN(fb->drm, ctx,
+				   DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
 
 	qobj = gem_to_qxl_bo(fb->obj[0]);
 	/* if we aren't primary surface ignore this */
@@ -437,7 +438,7 @@ static int qxl_framebuffer_surface_dirty(struct drm_framebuffer *fb,
 			  clips, num_clips, inc, 0);
 
 out_lock_end:
-	DRM_MODESET_LOCK_ALL_END(fb->dev, ctx, ret);
+	DRM_MODESET_LOCK_ALL_END(fb->drm, ctx, ret);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 251d0a11ed86..5d94b494a545 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -582,7 +582,7 @@ static void ssd130x_clear_screen(struct ssd130x_device *ssd130x)
 static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_map *vmap,
 				struct drm_rect *rect)
 {
-	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->drm);
 	unsigned int page_height = ssd130x->device_info->page_height;
 	struct iosys_map dst;
 	unsigned int dst_pitch;
diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index e6279a9916ef..7e839cae9bdd 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -402,7 +402,7 @@ static void gm12u320_fb_mark_dirty(struct drm_framebuffer *fb,
 				   const struct iosys_map *map,
 				   struct drm_rect *dirty)
 {
-	struct gm12u320_device *gm12u320 = to_gm12u320(fb->dev);
+	struct gm12u320_device *gm12u320 = to_gm12u320(fb->drm);
 	struct drm_framebuffer *old_fb = NULL;
 	bool wakeup = false;
 
diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index ec33dc530a17..f44667cf0f7b 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -80,7 +80,7 @@ static inline int ili9225_command(struct mipi_dbi *dbi, u8 cmd, u16 data)
 static void ili9225_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 			     struct drm_rect *rect)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->drm);
 	unsigned int height = rect->y2 - rect->y1;
 	unsigned int width = rect->x2 - rect->x1;
 	struct mipi_dbi *dbi = &dbidev->dbi;
@@ -152,7 +152,8 @@ static void ili9225_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 				   width * height * 2);
 err_msg:
 	if (ret)
-		dev_err_once(fb->dev->dev, "Failed to update display %d\n", ret);
+		dev_err_once(fb->drm->dev, "Failed to update display %d\n",
+		             ret);
 }
 
 static void ili9225_pipe_update(struct drm_simple_display_pipe *pipe,
@@ -167,7 +168,7 @@ static void ili9225_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (!pipe->crtc.state->active)
 		return;
 
-	if (!drm_dev_enter(fb->dev, &idx))
+	if (!drm_dev_enter(fb->drm, &idx))
 		return;
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 2a459960d10c..156468a473df 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -512,14 +512,14 @@ static void repaper_get_temperature(struct repaper_epd *epd)
 static int repaper_fb_dirty(struct drm_framebuffer *fb)
 {
 	struct drm_gem_dma_object *dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
-	struct repaper_epd *epd = drm_to_epd(fb->dev);
+	struct repaper_epd *epd = drm_to_epd(fb->drm);
 	unsigned int dst_pitch = 0;
 	struct iosys_map dst, vmap;
 	struct drm_rect clip;
 	int idx, ret = 0;
 	u8 *buf = NULL;
 
-	if (!drm_dev_enter(fb->dev, &idx))
+	if (!drm_dev_enter(fb->drm, &idx))
 		return -ENODEV;
 
 	/* repaper can't do partial updates */
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 493dee2446d8..1240b9d5809f 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -111,7 +111,7 @@ static int st7586_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuf
 static void st7586_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 			    struct drm_rect *rect)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->drm);
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	int start, end, ret = 0;
 
@@ -141,7 +141,8 @@ static void st7586_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 				   (end - start) * (rect->y2 - rect->y1));
 err_msg:
 	if (ret)
-		dev_err_once(fb->dev->dev, "Failed to update display %d\n", ret);
+		dev_err_once(fb->drm->dev, "Failed to update display %d\n",
+		             ret);
 }
 
 static void st7586_pipe_update(struct drm_simple_display_pipe *pipe,
@@ -156,7 +157,7 @@ static void st7586_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (!pipe->crtc.state->active)
 		return;
 
-	if (!drm_dev_enter(fb->dev, &idx))
+	if (!drm_dev_enter(fb->drm, &idx))
 		return;
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 5a36bb90dbd3..bc0accd155c6 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -203,7 +203,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb,
 			     const struct iosys_map *map,
 			     const struct drm_rect *clip)
 {
-	struct drm_device *dev = fb->dev;
+	struct drm_device *dev = fb->drm;
 	void *vaddr = map->vaddr; /* TODO: Use mapping abstraction properly */
 	int i, ret;
 	char *cmd;
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index ea5ceb51bd70..f8f2dc3d3b1b 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -281,7 +281,7 @@ static void vbox_primary_atomic_update(struct drm_plane *plane,
 									   plane);
 	struct drm_crtc *crtc = new_state->crtc;
 	struct drm_framebuffer *fb = new_state->fb;
-	struct vbox_private *vbox = to_vbox_dev(fb->dev);
+	struct vbox_private *vbox = to_vbox_dev(fb->drm);
 	struct drm_mode_rect *clips;
 	uint32_t num_clips, i;
 
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 9850ed02ac76..a4f669f49f6c 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -111,7 +111,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 
 	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
 
-	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
+	vkmsdev = drm_device_to_vkms_device(job->fb->drm);
 	vkms_set_composer(&vkmsdev->output, false);
 	kfree(vkmsjob);
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index a82fa9700370..289165b1b976 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -142,7 +142,7 @@ static int vmw_ldu_commit_list(struct vmw_private *dev_priv)
  */
 static int vmw_ldu_fb_pin(struct vmw_framebuffer *vfb)
 {
-	struct vmw_private *dev_priv = vmw_priv(vfb->base.dev);
+	struct vmw_private *dev_priv = vmw_priv(vfb->base.drm);
 	struct vmw_bo *buf;
 	int ret;
 
@@ -165,7 +165,7 @@ static int vmw_ldu_fb_pin(struct vmw_framebuffer *vfb)
 
 static int vmw_ldu_fb_unpin(struct vmw_framebuffer *vfb)
 {
-	struct vmw_private *dev_priv = vmw_priv(vfb->base.dev);
+	struct vmw_private *dev_priv = vmw_priv(vfb->base.drm);
 	struct vmw_bo *buf;
 
 	buf = vfb->bo ?  vmw_framebuffer_to_vfbd(&vfb->base)->buffer :
diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index da01d713b87f..65d53f0f992e 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -37,10 +37,10 @@ to_xen_drm_pipeline(struct drm_simple_display_pipe *pipe)
 
 static void fb_destroy(struct drm_framebuffer *fb)
 {
-	struct xen_drm_front_drm_info *drm_info = fb->dev->dev_private;
+	struct xen_drm_front_drm_info *drm_info = fb->drm->dev_private;
 	int idx;
 
-	if (drm_dev_enter(fb->dev, &idx)) {
+	if (drm_dev_enter(fb->drm, &idx)) {
 		xen_drm_front_fb_detach(drm_info->front_info,
 					xen_drm_front_fb_to_cookie(fb));
 		drm_dev_exit(idx);
diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
index 0dcc07b68654..cb20de345776 100644
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -116,9 +116,9 @@ struct drm_framebuffer_funcs {
  */
 struct drm_framebuffer {
 	/**
-	 * @dev: DRM device this framebuffer belongs to
+	 * @drm: DRM device this framebuffer belongs to
 	 */
-	struct drm_device *dev;
+	struct drm_device *drm;
 	/**
 	 * @head: Place on the &drm_mode_config.fb_list, access protected by
 	 * &drm_mode_config.fb_lock.
-- 
2.39.2

