Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5D79D6260
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F4310EC19;
	Fri, 22 Nov 2024 16:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nQCLSNPa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9BE10EC0D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:35:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87B1FE0005;
 Fri, 22 Nov 2024 16:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732293316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j4Cmhqd3ZoatnNIjenWaqOm7SDejDJEFrM1u030RS1w=;
 b=nQCLSNPaULea6GhvALkRlNaO9MyyyAzH66zkYTRB9OmlFNbrJzgGoA2ccAvZ3dyYCLCnUq
 ziv3PT6WYvF906tCEMMT/b/xsHdeKQYoGsp+fAForwFnolHtySQ1MislDy/TYwDeyNKd7A
 hHZpPO1Fwd0EKqcTgMoD6fcq8aTdOSYdBK454Hm9T99Ch+effUzTxlVCXe2Hzc8hKdGx8e
 ND3K+pFrs1Fgou/ryipWdNb5PRf/DFnTBjzfNQNb4Wc1QBTvksJ93b6Kb63u/th1kG59kP
 v34Qznp5v8PekSreKsqOhSoCg9+yE5H7b1bFuKuZG/IRS2pT3s92wLfy3n+dDg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 17:35:12 +0100
Subject: [PATCH v2 4/4] drm/vkms: Rename vkms_output to vkms_crtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-b4-vkms-allocated-v2-4-ff7bddbf0bfb@bootlin.com>
References: <20241122-b4-vkms-allocated-v2-0-ff7bddbf0bfb@bootlin.com>
In-Reply-To: <20241122-b4-vkms-allocated-v2-0-ff7bddbf0bfb@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=18648;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=8UYTicrTAL2RnLk9LBeJSZdd/FvLXrRjwST+c2Y5hJY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQLK/pg4OPepF9gSSaMPwNh20UMrFDGwtYGWV7
 4QJTRGBy2aJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0CyvwAKCRAgrS7GWxAs
 4jACD/9SHKUv0c7lJcdECnkp6Fc/unDreCYYFCb3zO8L9I/1Y82ZXWrs0drmEf73LppFzV3qTqX
 kZ3T2pwj821rIaLZ2vYwdwvOZTUQciUaCMNeMC5rr1/H7+2n071MtmnBZiQT2bcd9byC0T7Udpq
 nl8rBp2qQwxrbnYAC1+na/bsnGI+xK78D9PQ9zLqfc0ZB3NFaqt6jNuwLSnN3EXqgOqPGfsv1Xz
 /cNH3/IGCQJAxz/Aq7GSswpL1t1scoutk/tV08JWXd5Ni/m6/nWRV1giWQEYqlfrxtofupOSDrq
 J3ztSZu5RHTNVKrj3ndloDYacGfeCjgO4Qyt8fOIU/X0HKYWTUs/mIzkvIgT3XHaQf4JJy7SsEy
 8ICr7t2Pkq8tSainir16rEmoPyX28Fj+HuckNAFhnh3X3I8C8EuIRLyKwCI9CVyB+lVWOqQPyvA
 SwQKeC0hCuns/To0j4yENvjISzpubOSlccQE9Tur9GpHnhA/SpypcEDTzB7rn6gvcCaDVSpfkFQ
 dkjNn7uczF7vBoJVtqnNlWRaDwQF7/cUoMJrC8W6c8k2K77NpKWhIRRwCQ2dtwEU7a6xiMT9uNx
 SLvnc1pNfBb78IJZeqLbp9Qham0X/720TL8slDz9BdRs4Ql9vxHd+E+LbE0jIXiuMnQvV7+B0dC
 TBZ5Wg67coRrYgA==
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

The current vkms_output structure only contains crtc-related members.
To avoid confusion, rename the structure to vkms_crtc and all its usage.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c  | 30 ++++++------
 drivers/gpu/drm/vkms/vkms_crtc.c      | 90 ++++++++++++++++++-----------------
 drivers/gpu/drm/vkms/vkms_drv.h       | 18 +++----
 drivers/gpu/drm/vkms/vkms_output.c    | 16 +++----
 drivers/gpu/drm/vkms/vkms_writeback.c | 24 +++++-----
 5 files changed, 90 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index b20ac170572622b34ba76b1a9c5dd626ca5da6fa..eaecb1f5d2319dc9c81d25df1d8cf0a8cbfb977c 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -495,13 +495,13 @@ void vkms_composer_worker(struct work_struct *work)
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
@@ -525,7 +525,7 @@ void vkms_composer_worker(struct work_struct *work)
 		crtc_state->gamma_lut.base = NULL;
 	}
 
-	spin_unlock_irq(&out->composer_lock);
+	spin_unlock_irq(&vkms_crtc->composer_lock);
 
 	/*
 	 * We raced with the vblank hrtimer and previous work already computed
@@ -543,10 +543,10 @@ void vkms_composer_worker(struct work_struct *work)
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
@@ -596,31 +596,31 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
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
index d014dec117e7d4ec7e9e38037a4a4cb4bc6be4ca..7851bcf335b7aa9a95848b3af8900812115b2189 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -12,35 +12,35 @@
 
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
@@ -48,9 +48,9 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
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
@@ -63,28 +63,30 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 static int vkms_enable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
-	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 
-	hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	out->vblank_hrtimer.function = &vkms_vblank_simulate;
-	out->period_ns = ktime_set(0, vblank->framedur_ns);
-	hrtimer_start(&out->vblank_hrtimer, out->period_ns, HRTIMER_MODE_REL);
+	hrtimer_init(&vkms_crtc->vblank_hrtimer, CLOCK_MONOTONIC,
+		     HRTIMER_MODE_REL);
+	vkms_crtc->vblank_hrtimer.function = &vkms_vblank_simulate;
+	vkms_crtc->period_ns = ktime_set(0, vblank->framedur_ns);
+	hrtimer_start(&vkms_crtc->vblank_hrtimer, vkms_crtc->period_ns,
+		      HRTIMER_MODE_REL);
 
 	return 0;
 }
 
 static void vkms_disable_vblank(struct drm_crtc *crtc)
 {
-	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 
-	hrtimer_cancel(&out->vblank_hrtimer);
+	hrtimer_cancel(&vkms_crtc->vblank_hrtimer);
 }
 
 static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 				      int *max_error, ktime_t *vblank_time,
 				      bool in_vblank_irq)
 {
-	struct vkms_output *output = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 
 	if (!READ_ONCE(vblank->enabled)) {
@@ -92,7 +94,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 		return true;
 	}
 
-	*vblank_time = READ_ONCE(output->vblank_hrtimer.node.expires);
+	*vblank_time = READ_ONCE(vkms_crtc->vblank_hrtimer.node.expires);
 
 	if (WARN_ON(*vblank_time == vblank->time))
 		return true;
@@ -104,7 +106,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 	 * the vblank core expects. Therefore we need to always correct the
 	 * timestampe by one frame.
 	 */
-	*vblank_time -= output->period_ns;
+	*vblank_time -= vkms_crtc->period_ns;
 
 	return true;
 }
@@ -229,19 +231,19 @@ static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 	__acquires(&vkms_output->lock)
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
 	__releases(&vkms_output->lock)
 {
-	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 
 	if (crtc->state->event) {
 		spin_lock(&crtc->dev->event_lock);
@@ -256,9 +258,9 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 		crtc->state->event = NULL;
 	}
 
-	vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
+	vkms_crtc->composer_state = to_vkms_crtc_state(crtc->state);
 
-	spin_unlock_irq(&vkms_output->lock);
+	spin_unlock_irq(&vkms_crtc->lock);
 }
 
 static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
@@ -270,29 +272,29 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
 };
 
 static void vkms_crtc_destroy_workqueue(struct drm_device *dev,
-					void *raw_vkms_out)
+					void *raw_vkms_crtc)
 {
-	struct vkms_output *vkms_out = raw_vkms_out;
+	struct vkms_crtc *vkms_crtc = raw_vkms_crtc;
 
-	destroy_workqueue(vkms_out->composer_workq);
+	destroy_workqueue(vkms_crtc->composer_workq);
 }
 
-struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *primary,
-				   struct drm_plane *cursor)
+struct vkms_crtc *vkms_crtc_init(struct drm_device *dev, struct drm_plane *primary,
+				 struct drm_plane *cursor)
 {
-	struct vkms_output *vkms_out;
+	struct vkms_crtc *vkms_crtc;
 	struct drm_crtc *crtc;
 	int ret;
 
-	vkms_out = drmm_crtc_alloc_with_planes(dev, struct vkms_output, crtc,
-					       primary, cursor,
-					       &vkms_crtc_funcs, NULL);
-	if (IS_ERR(vkms_out)) {
+	vkms_crtc = drmm_crtc_alloc_with_planes(dev, struct vkms_crtc, base,
+						primary, cursor,
+						&vkms_crtc_funcs, NULL);
+	if (IS_ERR(vkms_crtc)) {
 		DRM_DEV_ERROR(dev->dev, "Failed to init CRTC\n");
-		return vkms_out;
+		return vkms_crtc;
 	}
 
-	crtc = &vkms_out->crtc;
+	crtc = &vkms_crtc->base;
 
 	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
 
@@ -304,17 +306,17 @@ struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *pri
 
 	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
 
-	spin_lock_init(&vkms_out->lock);
-	spin_lock_init(&vkms_out->composer_lock);
+	spin_lock_init(&vkms_crtc->lock);
+	spin_lock_init(&vkms_crtc->composer_lock);
 
-	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
-	if (!vkms_out->composer_workq)
+	vkms_crtc->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
+	if (!vkms_crtc->composer_workq)
 		return ERR_PTR(-ENOMEM);
 
 	ret = drmm_add_action_or_reset(dev, vkms_crtc_destroy_workqueue,
-				       vkms_out);
+				       vkms_crtc);
 	if (ret)
 		return ERR_PTR(ret);
 
-	return vkms_out;
+	return vkms_crtc;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index fbe7de67fb9c6a6a6964d71b452b9a3ce573e0f8..cc956ab8f539c8ac6eed3c96845091883f4c1e98 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -174,8 +174,8 @@ struct vkms_crtc_state {
  * @composer_state: Protected by @lock, current state of this VKMS output
  * @composer_lock: Lock used internally to protect @composer_state members
  */
-struct vkms_output {
-	struct drm_crtc crtc;
+struct vkms_crtc {
+	struct drm_crtc base;
 	struct drm_writeback_connector wb_connector;
 	struct hrtimer vblank_hrtimer;
 	ktime_t period_ns;
@@ -221,8 +221,8 @@ struct vkms_device {
  * The following helpers are used to convert a member of a struct into its parent.
  */
 
-#define drm_crtc_to_vkms_output(target) \
-	container_of(target, struct vkms_output, crtc)
+#define drm_crtc_to_vkms_crtc(target) \
+	container_of(target, struct vkms_crtc, base)
 
 #define drm_device_to_vkms_device(target) \
 	container_of(target, struct vkms_device, drm)
@@ -240,9 +240,9 @@ struct vkms_device {
  * @primary: primary plane to attach to the CRTC
  * @cursor: plane to attach to the CRTC
  */
-struct vkms_output *vkms_crtc_init(struct drm_device *dev,
-				   struct drm_plane *primary,
-				   struct drm_plane *cursor);
+struct vkms_crtc *vkms_crtc_init(struct drm_device *dev,
+				 struct drm_plane *primary,
+				 struct drm_plane *cursor);
 
 /**
  * vkms_output_init() - Initialize all sub-components needed for a VKMS device.
@@ -269,11 +269,11 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 
 /* Composer Support */
 void vkms_composer_worker(struct work_struct *work);
-void vkms_set_composer(struct vkms_output *out, bool enabled);
+void vkms_set_composer(struct vkms_crtc *out, bool enabled);
 void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
 
 /* Writeback */
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
-				    struct vkms_output *vkms_out);
+				    struct vkms_crtc *vkms_crtc);
 
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 6a5cf6e7714938f23b4276a96991d05431bcd76e..1c6d41856e317eb7b9b79f56fdf7473d0a339250 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -33,7 +33,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	struct drm_device *dev = &vkmsdev->drm;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
-	struct vkms_output *output;
+	struct vkms_crtc *vkms_crtc;
 	struct vkms_plane *primary, *overlay, *cursor = NULL;
 	int ret;
 	int writeback;
@@ -55,11 +55,11 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 			return PTR_ERR(cursor);
 	}
 
-	output = vkms_crtc_init(dev, &primary->base,
-				cursor ? &cursor->base : NULL);
-	if (IS_ERR(output)) {
+	vkms_crtc = vkms_crtc_init(dev, &primary->base,
+				   cursor ? &cursor->base : NULL);
+	if (IS_ERR(vkms_crtc)) {
 		DRM_ERROR("Failed to allocate CRTC\n");
-		return PTR_ERR(output);
+		return PTR_ERR(vkms_crtc);
 	}
 
 	if (vkmsdev->config->overlay) {
@@ -69,7 +69,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 				DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
 				return PTR_ERR(overlay);
 			}
-			overlay->base.possible_crtcs = drm_crtc_mask(&output->crtc);
+			overlay->base.possible_crtcs = drm_crtc_mask(&vkms_crtc->base);
 		}
 	}
 
@@ -99,7 +99,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		DRM_ERROR("Failed to init encoder\n");
 		return ret;
 	}
-	encoder->possible_crtcs = drm_crtc_mask(&output->crtc);
+	encoder->possible_crtcs = drm_crtc_mask(&vkms_crtc->base);
 
 	/* Attach the encoder and the connector */
 	ret = drm_connector_attach_encoder(connector, encoder);
@@ -110,7 +110,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 
 	/* Initialize the writeback component */
 	if (vkmsdev->config->writeback) {
-		writeback = vkms_enable_writeback_connector(vkmsdev, output);
+		writeback = vkms_enable_writeback_connector(vkmsdev, vkms_crtc);
 		if (writeback) {
 			DRM_ERROR("Failed to init writeback connector\n");
 			return ret;
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index c9b6e161fa8698491f20082dfe0b713f27bcb918..adb2081326648cb2ca55757d14b9b4e2bcbd3eb6 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -105,9 +105,9 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 				struct drm_writeback_job *job)
 {
 	struct vkms_writeback_job *vkmsjob = job->priv;
-	struct vkms_output *vkms_output = container_of(connector,
-						       struct vkms_output,
-						       wb_connector);
+	struct vkms_crtc *vkms_crtc = container_of(connector,
+						   struct vkms_crtc,
+						   wb_connector);
 
 	if (!job->fb)
 		return;
@@ -116,7 +116,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 
 	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
 
-	vkms_set_composer(vkms_output, false);
+	vkms_set_composer(vkms_crtc, false);
 	kfree(vkmsjob);
 }
 
@@ -125,10 +125,10 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 {
 	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
 											 conn);
-	struct vkms_output *output = drm_crtc_to_vkms_output(connector_state->crtc);
-	struct drm_writeback_connector *wb_conn = &output->wb_connector;
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(connector_state->crtc);
+	struct drm_writeback_connector *wb_conn = &vkms_crtc->wb_connector;
 	struct drm_connector_state *conn_state = wb_conn->base.state;
-	struct vkms_crtc_state *crtc_state = output->composer_state;
+	struct vkms_crtc_state *crtc_state = vkms_crtc->composer_state;
 	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
 	u16 crtc_height = crtc_state->base.mode.vdisplay;
 	u16 crtc_width = crtc_state->base.mode.hdisplay;
@@ -139,15 +139,15 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	if (!conn_state)
 		return;
 
-	vkms_set_composer(output, true);
+	vkms_set_composer(vkms_crtc, true);
 
 	active_wb = conn_state->writeback_job->priv;
 	wb_frame_info = &active_wb->wb_frame_info;
 
-	spin_lock_irq(&output->composer_lock);
+	spin_lock_irq(&vkms_crtc->composer_lock);
 	crtc_state->active_writeback = active_wb;
 	crtc_state->wb_pending = true;
-	spin_unlock_irq(&output->composer_lock);
+	spin_unlock_irq(&vkms_crtc->composer_lock);
 	drm_writeback_queue_job(wb_conn, connector_state);
 	active_wb->pixel_write = get_pixel_write_function(wb_format);
 	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
@@ -163,9 +163,9 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 };
 
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
-				    struct vkms_output *vkms_output)
+				    struct vkms_crtc *vkms_crtc)
 {
-	struct drm_writeback_connector *wb = &vkms_output->wb_connector;
+	struct drm_writeback_connector *wb = &vkms_crtc->wb_connector;
 
 	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
 

-- 
2.47.0

