Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BC0951850
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 12:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583C210E27D;
	Wed, 14 Aug 2024 10:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NyR4qyMU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B369810E27D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 10:06:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98AA324000D;
 Wed, 14 Aug 2024 10:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723630008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ea7pVN4/fiWlgVdZQ+grfVtQw6oY9NFZLxK+AjxJGtA=;
 b=NyR4qyMU832FCiAia9GW3rFrVmSoJ44LfSu9KK3VeL9H4kiM+ukpQa8qfzjzMB68BtLcwG
 hsby1z/GNuFVjHzzHtk3jGErawwZFb5jpSwxSLzuws3e02J7QX66GKemGKolg6RDdiYsbx
 u9z0ct2ExB7A1EChd5SEHxQh3ALJWzggQZUcOKftxOcHLyIoDptTIT2lX7k32FrndOjRjc
 oLV+dX9RFJ59B3QrPSNhZkqMEx/A7hStNKZJ9wwOh+SERkx9w7KcK9woeZYFK7ZJwcISt6
 ODaiRL4u4wvIIKRFlszzQvkHW0cZWuq0ZvF4ikf6dvuaGmASEVH42YzjWB/BZw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 12:06:37 +0200
Subject: [PATCH RFC 4/4] drm/vkms: Rename all vkms_crtc instance to be
 consistent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-vkms-managed-v1-4-7ab8b8921103@bootlin.com>
References: <20240814-google-vkms-managed-v1-0-7ab8b8921103@bootlin.com>
In-Reply-To: <20240814-google-vkms-managed-v1-0-7ab8b8921103@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11324;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ki/lFkpR1RrA123peJlktjkk+feg0St36zz0X5xujE4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvIGzwH4/6a2ovZgPAqsi1cTj7ZqKRe0GYdgTI
 Bt0y9cLfBiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZryBswAKCRAgrS7GWxAs
 4q09D/9FturdGjy0wC4VisWT8ev2JLI1K5QJT/4NscwouO4A51sQPMsoGF2+0JmuMoNvQ8jqHnM
 0SB8KifPsWW6P3FAEIlHg0CMYJqkH9h4jwgZQBbNQ9047+R0wTR7tMZnqmtOhLTSq2fZGQCBu1n
 qmdLnE3LdZd5Gm+Ly2Ycvo0iJ1s60iuSdVpDoaAUhOtm4cODT+oD7QyibQtnmIISePZ1WU0OkZb
 M6aXjySsZ6KCsw3vfksQ2Vyl2hfaqztEdqSuBoetDfGZyeg/MntR8DzfMtHW6xLSb3CmPbDMQER
 /5S8plQNtPeQ8QymCQpTp1ZxO2xl5umcsvo9ujtMFki4SX+5/lsP1CgJna8DBdW3OQMyuvrRtEU
 fuRyjmCcOic+dWsAb+x7/h6syh8WzEvdpWO40IcA430aokaq4yWP3ml+d6HrsBodK8YgjmRSKHv
 O2RTF4q0A/a0ieZUjNZFrM3YVHpDLY41KXybOD/e0++0hwleIww2xhjbQsw5SRNmCDvRiw5ABEL
 G/XK/KbhgG+8ip4XgyG8S37RDtjIGv1Rp6/OAizJ/dxKV3ESXhC7BKge+R+WdG1r4xmR0HY75qF
 qRqdSC0NIk0TY/T43V/ieMp+kBPBnQQ5/nl+MIDClEbJlVA5o9Wh8DRH7rILs9tT8FchLiwR75g
 kxg77mtmYPz7bRg==
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

To avoid inconsistency in the VKMS code, rename all struct vkms_crtc
instances to vkms_crtc. This should not change the behavior of the driver.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c  | 30 ++++++++++----------
 drivers/gpu/drm/vkms/vkms_composer.h  |  2 +-
 drivers/gpu/drm/vkms/vkms_crtc.c      | 52 +++++++++++++++++------------------
 drivers/gpu/drm/vkms/vkms_writeback.c | 12 ++++----
 4 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 9b2f578c2eb1..4376900b4986 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -515,13 +515,13 @@ void vkms_composer_worker(struct work_struct *work)
 							  composer_work);
 	struct drm_crtc *crtc = crtc_state->base.crtc;
 	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
-	struct vkms_crtc *out = drm_crtc_to_vkms_crtc(crtc);
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
@@ -545,7 +545,7 @@ void vkms_composer_worker(struct work_struct *work)
 		crtc_state->gamma_lut.base = NULL;
 	}
 
-	spin_unlock_irq(&out->composer_lock);
+	spin_unlock_irq(&vkms_crtc->composer_lock);
 
 	/*
 	 * We raced with the vblank hrtimer and previous work already computed
@@ -563,10 +563,10 @@ void vkms_composer_worker(struct work_struct *work)
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
@@ -616,31 +616,31 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
 	return 0;
 }
 
-void vkms_set_composer(struct vkms_crtc *out, bool enabled)
+void vkms_set_composer(struct vkms_crtc *vkms_crtc, bool enabled)
 {
 	bool old_enabled;
 
 	if (enabled)
-		drm_crtc_vblank_get(&out->base);
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
-		drm_crtc_vblank_put(&out->base);
+		drm_crtc_vblank_put(&vkms_crtc->base);
 }
 
 int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 {
-	struct vkms_crtc *out = drm_crtc_to_vkms_crtc(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 	bool enabled = false;
 	int ret = 0;
 
 	ret = vkms_crc_parse_source(src_name, &enabled);
 
-	vkms_set_composer(out, enabled);
+	vkms_set_composer(vkms_crtc, enabled);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
index 77efd2e3a63a..5a676b9960aa 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.h
+++ b/drivers/gpu/drm/vkms/vkms_composer.h
@@ -7,7 +7,7 @@
 #include "vkms_crtc.h"
 
 void vkms_composer_worker(struct work_struct *work);
-void vkms_set_composer(struct vkms_crtc *out, bool enabled);
+void vkms_set_composer(struct vkms_crtc *vkms_crtc, bool enabled);
 
 /* CRC Support */
 const char *const *vkms_get_crc_sources(struct drm_crtc *crtc, size_t *count);
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 47e62fb3e404..6f6d3118b2f2 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -16,34 +16,34 @@
 
 static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 {
-	struct vkms_crtc *output = hrtimer_to_vkms_crtc(timer);
-	struct drm_crtc *crtc = &output->base;
+	struct vkms_crtc *vkms_crtc = hrtimer_to_vkms_crtc(timer);
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
@@ -51,9 +51,9 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
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
@@ -67,23 +67,23 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
-	struct vkms_crtc *out = drm_crtc_to_vkms_crtc(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 
 	drm_calc_timestamping_constants(crtc, &crtc->mode);
 
-	hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	out->vblank_hrtimer.function = &vkms_vblank_simulate;
-	out->period_ns = ktime_set(0, vblank->framedur_ns);
-	hrtimer_start(&out->vblank_hrtimer, out->period_ns, HRTIMER_MODE_REL);
+	hrtimer_init(&vkms_crtc->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	vkms_crtc->vblank_hrtimer.function = &vkms_vblank_simulate;
+	vkms_crtc->period_ns = ktime_set(0, vblank->framedur_ns);
+	hrtimer_start(&vkms_crtc->vblank_hrtimer, vkms_crtc->period_ns, HRTIMER_MODE_REL);
 
 	return 0;
 }
 
 static void vkms_disable_vblank(struct drm_crtc *crtc)
 {
-	struct vkms_crtc *out = drm_crtc_to_vkms_crtc(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 
-	hrtimer_cancel(&out->vblank_hrtimer);
+	hrtimer_cancel(&vkms_crtc->vblank_hrtimer);
 }
 
 static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
@@ -91,7 +91,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 				      bool in_vblank_irq)
 {
 	struct drm_device *dev = crtc->dev;
-	struct vkms_crtc *output = drm_crtc_to_vkms_crtc(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 
 	if (!READ_ONCE(vblank->enabled)) {
@@ -99,7 +99,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 		return true;
 	}
 
-	*vblank_time = READ_ONCE(output->vblank_hrtimer.node.expires);
+	*vblank_time = READ_ONCE(vkms_crtc->vblank_hrtimer.node.expires);
 
 	if (WARN_ON(*vblank_time == vblank->time))
 		return true;
@@ -111,7 +111,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 	 * the vblank core expects. Therefore we need to always correct the
 	 * timestampe by one frame.
 	 */
-	*vblank_time -= output->period_ns;
+	*vblank_time -= vkms_crtc->period_ns;
 
 	return true;
 }
@@ -235,18 +235,18 @@ static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
 static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct vkms_crtc *vkms_output = drm_crtc_to_vkms_crtc(crtc);
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
-	struct vkms_crtc *vkms_output = drm_crtc_to_vkms_crtc(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 
 	if (crtc->state->event) {
 		spin_lock(&crtc->dev->event_lock);
@@ -261,9 +261,9 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 		crtc->state->event = NULL;
 	}
 
-	vkms_output->composer_state = drm_crtc_state_to_vkms_crtc_state(crtc->state);
+	vkms_crtc->composer_state = drm_crtc_state_to_vkms_crtc_state(crtc->state);
 
-	spin_unlock_irq(&vkms_output->lock);
+	spin_unlock_irq(&vkms_crtc->lock);
 }
 
 static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 322e247979b2..69c710f21e57 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -128,9 +128,9 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 {
 	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
 											 conn);
-	struct vkms_crtc *output = drm_crtc_to_vkms_crtc(connector_state->crtc);
-	struct drm_writeback_connector *wb_conn = &output->wb_connector;
-	struct vkms_crtc_state *crtc_state = output->composer_state;
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(connector_state->crtc);
+	struct drm_writeback_connector *wb_conn = &vkms_crtc->wb_connector;
+	struct vkms_crtc_state *crtc_state = vkms_crtc->composer_state;
 	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
 	u16 crtc_height = crtc_state->base.crtc->mode.vdisplay;
 	u16 crtc_width = crtc_state->base.crtc->mode.hdisplay;
@@ -141,15 +141,15 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	if (!connector_state)
 		return;
 
-	vkms_set_composer(output, true);
+	vkms_set_composer(vkms_crtc, true);
 
 	active_wb = connector_state->writeback_job->priv;
 	wb_frame_info = &active_wb->wb_frame_info;
 
-	spin_lock_irq(&output->composer_lock);
+	spin_lock_irq(&vkms_crtc->composer_lock);
 	crtc_state->active_writeback = active_wb;
 	crtc_state->wb_pending = true;
-	spin_unlock_irq(&output->composer_lock);
+	spin_unlock_irq(&vkms_crtc->composer_lock);
 	drm_writeback_queue_job(wb_conn, connector_state);
 	active_wb->pixel_write = get_pixel_write_line_function(wb_format);
 	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);

-- 
2.44.2

