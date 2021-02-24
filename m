Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C647F323ADD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 11:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB916E8B4;
	Wed, 24 Feb 2021 10:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882456E8B4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 10:55:14 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id n10so1187243pgl.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 02:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=OZmIVnGmRqkHE37MUl/fX1v3MBrD7OJUk4oQyf7Ar5g=;
 b=Fu+y56orWSMafFuHJB2gQRcLudSEvPXsixZHWx3Vzhm2lfXeA7URLfZREhMOQa9sT5
 janTkD99fgLif91bCE6c+8aSnxVAgrdZYJ4OuRQvAEkRd6dK/cz9L96Gy5Z5X/2O6Ee2
 zaJ/IjrC/aCL+3ObzCALLw9T7D2sydC5HAEgRun1cAy3ylEHZInXS4B86pFHUHj07BeF
 AMG3PCWCZ90V8FPYhlRgggq6AM5KJ3WSu0yKFZ6oC9zoQt0HQ8w/PH5pUh+o4hnwvGDu
 Dc8qx9/oe3DohUddBCu3C3x988pov4KHCsHljoU2L01q0/JM4/zRD7arrZm2Vu6wGdCU
 vTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=OZmIVnGmRqkHE37MUl/fX1v3MBrD7OJUk4oQyf7Ar5g=;
 b=aAvXuDUGOgRgdk5SqW/Tph0jRkG8OmLP/ZdrvJg9fc4nSexwHmlSnrxFzxZSgMWlyc
 wjeoSakZHXzw5gx7uZ5YSAFEgPCUox+71lCQvaB5qttcAestpfqiaCYVxcsCkBzixzSj
 3fCoF3A+2i2omxe9YuQbk6tq5xx5akbhAF39KaMXR7nMfLxlfJFOg7ssnGxCIJXLa3po
 FE4r9J6PqjEB9KPEkCBxOW63PiiOnYmny81BHv+/We3907p6G3JnHwnW7iO0RSMe6YTC
 gzGVhKsfY9xbACNMTk6U3FfhfHfkS+ILFSu6aSSk33NZABxmh7x9dfBiASibn7Udcfax
 7P0w==
X-Gm-Message-State: AOAM5311WhC/iQ/9Upv5iCt2Jj6laVXko4R0L5vMVgs8cEtZkEIJ3S0n
 0du/gUjZb2Sk2vwEzxchwFUQegja/U/hb6S2
X-Google-Smtp-Source: ABdhPJx2XG1jvVXnVdy5x9YOEOPUi1q6X7TnP1iA4ycsuVFhLsB7/6g4EQ16mHtGGG8vOjHLZqlilg==
X-Received: by 2002:a63:1409:: with SMTP id u9mr27776845pgl.312.1614164114133; 
 Wed, 24 Feb 2021 02:55:14 -0800 (PST)
Received: from adolin ([49.207.196.12])
 by smtp.gmail.com with ESMTPSA id x2sm2269603pfi.220.2021.02.24.02.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 02:55:13 -0800 (PST)
Date: Wed, 24 Feb 2021 16:25:09 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Subject: [RFC PATCH] drm/vkms: Add support for virtual hardware mode
Message-ID: <20210224105509.yzdimgbu2jwe3auf@adolin>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a virtual hardware or vblank-less mode as a module to enable
VKMS to emulate virtual graphic drivers. This mode can be enabled
by setting enable_virtual_hw=1 at the time of loading VKMS.

A new function vkms_crtc_composer() has been added to bypass the
vblank mode and is called directly in the atomic hook in
vkms_atomic_begin(). However, some crc captures still use vblanks
which causes the crc-based igt tests to crash. Currently, I am unsure
about how to approach one-shot implementation of crc reads so I am
still working on that.

This patch has been tested with the igt tests, kms_writeback, kms_atomic,
kms_lease, kms_flip, kms_pipe_get_crc and preserves results except for
subtests related to crc reads and skips tests that rely on vertical
blanking. This patch must be tested after incorporating the
igt-tests patch: https://lists.freedesktop.org/archives/igt-dev/2021-February/029355.html .

The patch is based on Rodrigo Siqueira's
patch(https://patchwork.freedesktop.org/patch/316851/?series=48469&rev=3)
and the ensuing review.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 46 ++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_crtc.c     | 17 ++++++++--
 drivers/gpu/drm/vkms/vkms_drv.c      | 18 ++++++++---
 drivers/gpu/drm/vkms/vkms_drv.h      |  2 ++
 4 files changed, 75 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 66c6842d70db..7a8aaf5c5555 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -247,6 +247,52 @@ void vkms_composer_worker(struct work_struct *work)
 		drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
 }
 
+void vkms_crtc_composer(struct vkms_crtc_state *crtc_state)
+{
+	struct drm_crtc *crtc = crtc_state->base.crtc;
+	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_composer *primary_composer = NULL;
+	struct vkms_composer *cursor_composer = NULL;
+	void *vaddr_out = NULL;
+	u32 crc32 = 0;
+	int ret;
+	bool wb_pending;
+
+	wb_pending = crtc_state->wb_pending;
+
+	if (crtc_state->num_active_planes >= 1)
+		primary_composer = crtc_state->active_planes[0]->composer;
+
+	if (crtc_state->num_active_planes == 2)
+		cursor_composer = crtc_state->active_planes[1]->composer;
+
+	if (!primary_composer)
+		return;
+
+	if (wb_pending)
+		vaddr_out = crtc_state->active_writeback;
+
+	ret = compose_planes(&vaddr_out, primary_composer, cursor_composer);
+	if (ret) {
+		if (ret == -EINVAL && !wb_pending)
+			kfree(vaddr_out);
+		return;
+	}
+
+	crc32 = compute_crc(vaddr_out, primary_composer);
+
+	if (wb_pending) {
+		drm_writeback_signal_completion(&out->wb_connector, 0);
+		spin_lock_irq(&out->composer_lock);
+		crtc_state->wb_pending = false;
+		spin_unlock_irq(&out->composer_lock);
+	} else {
+		kfree(vaddr_out);
+	}
+
+	drm_crtc_add_crc_entry(crtc, true, 0, &crc32);
+}
+
 static const char * const pipe_crc_sources[] = {"auto"};
 
 const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 6164349cdf11..38de791a4882 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -224,13 +224,19 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 static void vkms_crtc_atomic_enable(struct drm_crtc *crtc,
 				    struct drm_atomic_state *state)
 {
-	drm_crtc_vblank_on(crtc);
+	struct vkms_device *vkmsdev = drm_device_to_vkms_device(crtc->dev);
+
+	if (!vkmsdev->config->virtual_hw)
+		drm_crtc_vblank_on(crtc);
 }
 
 static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
-	drm_crtc_vblank_off(crtc);
+	struct vkms_device *vkmsdev = drm_device_to_vkms_device(crtc->dev);
+
+	if (!vkmsdev->config->virtual_hw)
+		drm_crtc_vblank_off(crtc);
 }
 
 static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
@@ -248,8 +254,13 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
 	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc_state *vkms_state = to_vkms_crtc_state(crtc->state);
+	struct vkms_device *vkmsdev = drm_device_to_vkms_device(crtc->dev);
+
+	if (vkmsdev->config->virtual_hw)
+		vkms_crtc_composer(vkms_state);
 
-	if (crtc->state->event) {
+	if (crtc->state->event && !vkmsdev->config->virtual_hw) {
 		spin_lock(&crtc->dev->event_lock);
 
 		if (drm_crtc_vblank_get(crtc) != 0)
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 2173b82606f6..945c4495d62a 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -44,6 +44,11 @@ static bool enable_writeback = true;
 module_param_named(enable_writeback, enable_writeback, bool, 0444);
 MODULE_PARM_DESC(enable_writeback, "Enable/Disable writeback connector support");
 
+static bool enable_virtual_hw = false;
+module_param_named(enable_virtual_hw, enable_virtual_hw, bool, 0444);
+MODULE_PARM_DESC(enable_virtual_hw, "Enable/Disable virtual hardware mode(virtual \
+hardware mode disables vblank interrupts)");
+
 DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 
 static void vkms_release(struct drm_device *dev)
@@ -159,12 +164,14 @@ static int vkms_create(struct vkms_config *config)
 		goto out_devres;
 	}
 
-	vkms_device->drm.irq_enabled = true;
+	vkms_device->drm.irq_enabled = !vkms_device->config->virtual_hw;
 
-	ret = drm_vblank_init(&vkms_device->drm, 1);
-	if (ret) {
-		DRM_ERROR("Failed to vblank\n");
-		goto out_devres;
+	if (!vkms_device->config->virtual_hw) {
+		ret = drm_vblank_init(&vkms_device->drm, 1);
+		if (ret) {
+			DRM_ERROR("Failed to vblank\n");
+			goto out_devres;
+		}
 	}
 
 	ret = vkms_modeset_init(vkms_device);
@@ -198,6 +205,7 @@ static int __init vkms_init(void)
 
 	config->cursor = enable_cursor;
 	config->writeback = enable_writeback;
+	config->virtual_hw = enable_virtual_hw;
 
 	return vkms_create(config);
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 35540c7c4416..d4a45518639c 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -85,6 +85,7 @@ struct vkms_device;
 struct vkms_config {
 	bool writeback;
 	bool cursor;
+	bool virtual_hw;
 	/* only set when instantiated */
 	struct vkms_device *dev;
 };
@@ -127,6 +128,7 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 /* Composer Support */
 void vkms_composer_worker(struct work_struct *work);
 void vkms_set_composer(struct vkms_output *out, bool enabled);
+void vkms_crtc_composer(struct vkms_crtc_state *crtc_state);
 
 /* Writeback */
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
