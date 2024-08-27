Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E40960691
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 12:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C5A10E2C1;
	Tue, 27 Aug 2024 10:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="laygfAVs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC57010E222
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 10:01:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 934801C0007;
 Tue, 27 Aug 2024 10:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724752916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VLDA3mjNmG2t3rLv4Yud8tnGeWo3weAPMyHv+ylyq8A=;
 b=laygfAVstHot3z+UpU31/HvFyOr3NsAruzTvola2rbh1hXhFh1/hVIR7T73/E+MMTN7lqI
 mmwbCIGiqLHF26R8zwfnKy4g00V0bki6rCOVFHkhRD6WdEykoS2ddBEV0pQoNJKtPapwrh
 hlJncjDM+DF/pM/x7NRqejHTMBAeu7jvwMVsSwhECU3i6VXINorAaBvuPgu1BQCbb/0T2x
 yaXjUId3sQmdSch8PdMXBxwiHOX47AcqkmotGwK/woDSAkBNGpHIASRnB6UiANYvfRBfhh
 xPZkje2WNa4B394SWwePzr66dwvfu0WluEJa3iszbb3jp/rjzyZJy9fjqkz/7Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 27 Aug 2024 11:57:38 +0200
Subject: [PATCH v2 3/6] drm/vkms: Rename vkms_output to vkms_crtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-google-vkms-managed-v2-3-f41104553aeb@bootlin.com>
References: <20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com>
In-Reply-To: <20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=15063;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=MUXfMrHoYe99yLBLEUvLfqlRRqfmv9js/PWQccOW9kg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmzaQPV2dWXTebHFW5wDzFJ/JRZi1+zZPvXLyeu
 7fYY6tmzC6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZs2kDwAKCRAgrS7GWxAs
 4lFkEADKrNo8dTfNRM+LmvZ6isuNEwijxuwjtWCHNezdyrehImGzGzv5idOChMEU0DRfRMA0D5O
 H8HhJU6IJYSRxMyV+HF5TbkDRdMXiE34GuQved0Ty76WCFxiy3aLjqmbOEqbVHnlygcMIcaNmhf
 ExAUr79og3l2flBrAYGBHD0o8hDPkCIXKDlsIHmpHQij+FrRiCGUugoaIYrpZbCn3lUutigsbOc
 80exB4YHYC8x51t6KNVAR315gXhbtBG2eN+dJ0t4xXkZw6iEzx2eOpRI72jicKjg/3UUXfO5fVr
 HbkoN+gj8M3YAtEN3z4DWpF6XO0FFPn8gxAB8QvWZddGh9rcrOg1miREADzy8NeORQFaLmfPEZA
 myKRMBAQV/tcYgoA/i9yvuwz2OFItgzU0HO9wrMC4t+Oj290eRxpLT7Nz8bJiAVv/PAmT+2hJw8
 P5qPTd64hqfb9TdYhJ0smRchel1M+Zfw+6mqZIWXPp1lF3mtkdMbhctnReeGSl2hMgZceJYlAaY
 xrT3Yb8ieK0TJenEpATPL9cpa1Z5Ayb/rSgOAn4x3xb364NglEOPZuaAYX+ZOI+cY+NBUyf0RjA
 HnHJn7TQwnAP0Bad8mcPQwFaPNq77w9yPtaF2W7OzFRdzStHmcgVX1E3sY06D0/0P3g32o9GmUY
 oPn8/bzZ6SaJb3g==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

The current vkms_output structure only contains crtc-related members. In
preparation of the migration to drmm for crtc and to avoid confusion,
rename this structure and all its usage to vkms_crtc.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c  | 30 +++++++++----------
 drivers/gpu/drm/vkms/vkms_crtc.c      | 54 +++++++++++++++++------------------
 drivers/gpu/drm/vkms/vkms_drv.c       |  4 +--
 drivers/gpu/drm/vkms/vkms_drv.h       | 12 ++++----
 drivers/gpu/drm/vkms/vkms_output.c    |  4 +--
 drivers/gpu/drm/vkms/vkms_writeback.c | 16 +++++------
 6 files changed, 59 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index e7441b227b3c..b1723cf02ed3 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -306,13 +306,13 @@ void vkms_composer_worker(struct work_struct *work)
 						composer_work);
 	struct drm_crtc *crtc = crtc_state->base.crtc;
 	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
-	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 	bool crc_pending, wb_pending;
 	u64 frame_start, frame_end;
 	u32 crc32 = 0;
 	int ret;
 
-	spin_lock_irq(&out->composer_lock);
+	spin_lock_irq(&vkms_crtc->composer_lock);
 	frame_start = crtc_state->frame_start;
 	frame_end = crtc_state->frame_end;
 	crc_pending = crtc_state->crc_pending;
@@ -336,7 +336,7 @@ void vkms_composer_worker(struct work_struct *work)
 		crtc_state->gamma_lut.base = NULL;
 	}
 
-	spin_unlock_irq(&out->composer_lock);
+	spin_unlock_irq(&vkms_crtc->composer_lock);
 
 	/*
 	 * We raced with the vblank hrtimer and previous work already computed
@@ -354,10 +354,10 @@ void vkms_composer_worker(struct work_struct *work)
 		return;
 
 	if (wb_pending) {
-		drm_writeback_signal_completion(&out->wb_connector, 0);
-		spin_lock_irq(&out->composer_lock);
+		drm_writeback_signal_completion(&vkms_crtc->wb_connector, 0);
+		spin_lock_irq(&vkms_crtc->composer_lock);
 		crtc_state->wb_pending = false;
-		spin_unlock_irq(&out->composer_lock);
+		spin_unlock_irq(&vkms_crtc->composer_lock);
 	}
 
 	/*
@@ -407,31 +407,31 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
 	return 0;
 }
 
-void vkms_set_composer(struct vkms_output *out, bool enabled)
+void vkms_set_composer(struct vkms_crtc *vkms_crtc, bool enabled)
 {
 	bool old_enabled;
 
 	if (enabled)
-		drm_crtc_vblank_get(&out->crtc);
+		drm_crtc_vblank_get(&vkms_crtc->base);
 
-	spin_lock_irq(&out->lock);
-	old_enabled = out->composer_enabled;
-	out->composer_enabled = enabled;
-	spin_unlock_irq(&out->lock);
+	spin_lock_irq(&vkms_crtc->lock);
+	old_enabled = vkms_crtc->composer_enabled;
+	vkms_crtc->composer_enabled = enabled;
+	spin_unlock_irq(&vkms_crtc->lock);
 
 	if (old_enabled)
-		drm_crtc_vblank_put(&out->crtc);
+		drm_crtc_vblank_put(&vkms_crtc->base);
 }
 
 int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 {
-	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 	bool enabled = false;
 	int ret = 0;
 
 	ret = vkms_crc_parse_source(src_name, &enabled);
 
-	vkms_set_composer(out, enabled);
+	vkms_set_composer(vkms_crtc, enabled);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 40b4d084e3ce..013bf8336b54 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -11,35 +11,35 @@
 
 static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 {
-	struct vkms_output *output = container_of(timer, struct vkms_output,
+	struct vkms_crtc *vkms_crtc = container_of(timer, struct vkms_crtc,
 						  vblank_hrtimer);
-	struct drm_crtc *crtc = &output->crtc;
+	struct drm_crtc *crtc = &vkms_crtc->base;
 	struct vkms_crtc_state *state;
 	u64 ret_overrun;
 	bool ret, fence_cookie;
 
 	fence_cookie = dma_fence_begin_signalling();
 
-	ret_overrun = hrtimer_forward_now(&output->vblank_hrtimer,
-					  output->period_ns);
+	ret_overrun = hrtimer_forward_now(&vkms_crtc->vblank_hrtimer,
+					  vkms_crtc->period_ns);
 	if (ret_overrun != 1)
 		pr_warn("%s: vblank timer overrun\n", __func__);
 
-	spin_lock(&output->lock);
+	spin_lock(&vkms_crtc->lock);
 	ret = drm_crtc_handle_vblank(crtc);
 	if (!ret)
 		DRM_ERROR("vkms failure on handling vblank");
 
-	state = output->composer_state;
-	spin_unlock(&output->lock);
+	state = vkms_crtc->composer_state;
+	spin_unlock(&vkms_crtc->lock);
 
-	if (state && output->composer_enabled) {
+	if (state && vkms_crtc->composer_enabled) {
 		u64 frame = drm_crtc_accurate_vblank_count(crtc);
 
 		/* update frame_start only if a queued vkms_composer_worker()
 		 * has read the data
 		 */
-		spin_lock(&output->composer_lock);
+		spin_lock(&vkms_crtc->composer_lock);
 		if (!state->crc_pending)
 			state->frame_start = frame;
 		else
@@ -47,9 +47,9 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 					 state->frame_start, frame);
 		state->frame_end = frame;
 		state->crc_pending = true;
-		spin_unlock(&output->composer_lock);
+		spin_unlock(&vkms_crtc->composer_lock);
 
-		ret = queue_work(output->composer_workq, &state->composer_work);
+		ret = queue_work(vkms_crtc->composer_workq, &state->composer_work);
 		if (!ret)
 			DRM_DEBUG_DRIVER("Composer worker already queued\n");
 	}
@@ -62,7 +62,7 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 static int vkms_enable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
-	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *out = drm_crtc_to_vkms_crtc(crtc);
 
 	drm_calc_timestamping_constants(crtc, &crtc->mode);
 
@@ -76,7 +76,7 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
 
 static void vkms_disable_vblank(struct drm_crtc *crtc)
 {
-	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *out = drm_crtc_to_vkms_crtc(crtc);
 
 	hrtimer_cancel(&out->vblank_hrtimer);
 }
@@ -85,9 +85,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 				      int *max_error, ktime_t *vblank_time,
 				      bool in_vblank_irq)
 {
-	struct drm_device *dev = crtc->dev;
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
-	struct vkms_output *output = &vkmsdev->output;
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 
 	if (!READ_ONCE(vblank->enabled)) {
@@ -95,7 +93,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 		return true;
 	}
 
-	*vblank_time = READ_ONCE(output->vblank_hrtimer.node.expires);
+	*vblank_time = READ_ONCE(vkms_crtc->vblank_hrtimer.node.expires);
 
 	if (WARN_ON(*vblank_time == vblank->time))
 		return true;
@@ -107,7 +105,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 	 * the vblank core expects. Therefore we need to always correct the
 	 * timestampe by one frame.
 	 */
-	*vblank_time -= output->period_ns;
+	*vblank_time -= vkms_crtc->period_ns;
 
 	return true;
 }
@@ -233,18 +231,18 @@ static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
 static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 
 	/* This lock is held across the atomic commit to block vblank timer
 	 * from scheduling vkms_composer_worker until the composer is updated
 	 */
-	spin_lock_irq(&vkms_output->lock);
+	spin_lock_irq(&vkms_crtc->lock);
 }
 
 static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 
 	if (crtc->state->event) {
 		spin_lock(&crtc->dev->event_lock);
@@ -259,9 +257,9 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 		crtc->state->event = NULL;
 	}
 
-	vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
+	vkms_crtc->composer_state = to_vkms_crtc_state(crtc->state);
 
-	spin_unlock_irq(&vkms_output->lock);
+	spin_unlock_irq(&vkms_crtc->lock);
 }
 
 static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
@@ -275,7 +273,7 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
 int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 		   struct drm_plane *primary, struct drm_plane *cursor)
 {
-	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 	int ret;
 
 	ret = drmm_crtc_init_with_planes(dev, crtc, primary, cursor,
@@ -290,11 +288,11 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 	drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
 	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
 
-	spin_lock_init(&vkms_out->lock);
-	spin_lock_init(&vkms_out->composer_lock);
+	spin_lock_init(&vkms_crtc->lock);
+	spin_lock_init(&vkms_crtc->composer_lock);
 
-	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
-	if (!vkms_out->composer_workq)
+	vkms_crtc->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
+	if (!vkms_crtc->composer_workq)
 		return -ENOMEM;
 
 	return ret;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 0c1a713b7b7b..d1ed6bbe9559 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -57,8 +57,8 @@ static void vkms_release(struct drm_device *dev)
 {
 	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
 
-	if (vkms->output.composer_workq)
-		destroy_workqueue(vkms->output.composer_workq);
+	if (vkms->crtc.composer_workq)
+		destroy_workqueue(vkms->crtc.composer_workq);
 }
 
 static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 101993378b49..c55ab45ccb20 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -96,8 +96,8 @@ struct vkms_crtc_state {
 	u64 frame_end;
 };
 
-struct vkms_output {
-	struct drm_crtc crtc;
+struct vkms_crtc {
+	struct drm_crtc base;
 	struct drm_writeback_connector wb_connector;
 	struct hrtimer vblank_hrtimer;
 	ktime_t period_ns;
@@ -126,12 +126,12 @@ struct vkms_config {
 struct vkms_device {
 	struct drm_device drm;
 	struct platform_device *platform;
-	struct vkms_output output;
+	struct vkms_crtc crtc;
 	const struct vkms_config *config;
 };
 
-#define drm_crtc_to_vkms_output(target) \
-	container_of(target, struct vkms_output, crtc)
+#define drm_crtc_to_vkms_crtc(target) \
+	container_of(target, struct vkms_crtc, base)
 
 #define drm_device_to_vkms_device(target) \
 	container_of(target, struct vkms_device, drm)
@@ -160,7 +160,7 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 
 /* Composer Support */
 void vkms_composer_worker(struct work_struct *work);
-void vkms_set_composer(struct vkms_output *out, bool enabled);
+void vkms_set_composer(struct vkms_crtc *out, bool enabled);
 void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y);
 void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
 
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index bbec7c14229c..cd506dcfd50f 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -44,11 +44,11 @@ static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
 
 int vkms_output_init(struct vkms_device *vkmsdev, int index)
 {
-	struct vkms_output *output = &vkmsdev->output;
+	struct vkms_crtc *vkms_crtc = &vkmsdev->crtc;
 	struct drm_device *dev = &vkmsdev->drm;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
-	struct drm_crtc *crtc = &output->crtc;
+	struct drm_crtc *crtc = &vkms_crtc->base;
 	struct vkms_plane *primary, *cursor = NULL;
 	int ret;
 	int writeback;
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index bc724cbd5e3a..e055ad41241b 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -116,7 +116,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
 
 	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
-	vkms_set_composer(&vkmsdev->output, false);
+	vkms_set_composer(&vkmsdev->crtc, false);
 	kfree(vkmsjob);
 }
 
@@ -126,10 +126,10 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
 											 conn);
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
-	struct vkms_output *output = &vkmsdev->output;
-	struct drm_writeback_connector *wb_conn = &output->wb_connector;
+	struct vkms_crtc *vkms_crtc = &vkmsdev->crtc;
+	struct drm_writeback_connector *wb_conn = &vkms_crtc->wb_connector;
 	struct drm_connector_state *conn_state = wb_conn->base.state;
-	struct vkms_crtc_state *crtc_state = output->composer_state;
+	struct vkms_crtc_state *crtc_state = vkms_crtc->composer_state;
 	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
 	u16 crtc_height = crtc_state->base.crtc->mode.vdisplay;
 	u16 crtc_width = crtc_state->base.crtc->mode.hdisplay;
@@ -140,15 +140,15 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	if (!conn_state)
 		return;
 
-	vkms_set_composer(&vkmsdev->output, true);
+	vkms_set_composer(&vkmsdev->crtc, true);
 
 	active_wb = conn_state->writeback_job->priv;
 	wb_frame_info = &active_wb->wb_frame_info;
 
-	spin_lock_irq(&output->composer_lock);
+	spin_lock_irq(&vkms_crtc->composer_lock);
 	crtc_state->active_writeback = active_wb;
 	crtc_state->wb_pending = true;
-	spin_unlock_irq(&output->composer_lock);
+	spin_unlock_irq(&vkms_crtc->composer_lock);
 
 	wb_frame_info->offset = fb->offsets[0];
 	wb_frame_info->pitch = fb->pitches[0];
@@ -170,7 +170,7 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
 {
-	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
+	struct drm_writeback_connector *wb = &vkmsdev->crtc.wb_connector;
 
 	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
 

-- 
2.44.2

