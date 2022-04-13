Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5AE5001AD
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 00:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D5010F15A;
	Wed, 13 Apr 2022 22:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9973B10F146
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 22:19:42 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E983F5C033A;
 Wed, 13 Apr 2022 18:19:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 13 Apr 2022 18:19:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649888381; x=1649974781; bh=7b
 bIqqy2mMtv+LMNn04scZFEsK5Ygh9hQ+hXBLs4DCI=; b=De+yP95f0xqDeVLgAN
 i0kBEYBFk47F+1kVQkC2z3T/1xVRXqi83dqUEXMoyIhuEnGvqmHND+UKhlpLNa6K
 ZZ6BlXpFYniLjetsBoi2ge4SgaCs6VH9IbjN/8eH7JjVe+VEFPtcT5ViOxDA1/QY
 HYClCuLWVPlzk1zfnvYAXNssRzD8byhMMJRGerXNszdvlBcJYbD2DQmEb8Rg5Bhc
 VFY2mHhPRAX5uCwgQiOfj5UGvYlwYOdjXyzkkQ+I/8CeFxJ7EGcumh4tLwfV+RbY
 nYIB79MSKpl2JdGk8v9uQA+ATWaeIPFHnU6fIGr756PNCuhcbxPTnk2062uhUU5/
 5fiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1649888381; x=1649974781; bh=7bbIqqy2mMtv+LMNn04scZFEsK5Ygh9hQ+h
 XBLs4DCI=; b=HJcnNONuVResbsVXjNVr3+qBWtwl2lp518gpSXHsuQVfYa311gu
 WQZTPiy+Irpdchd5Y2OMRK5rcAc/4G9M/q0k9Wd9v9/056aC3KwfBeaYsPx/rUH2
 10tqr27CyrtRDVMaZbM6qeC2JNkXwRpXZ9npa668xkA0nnrOifOdbXdLMGsna3tq
 B/pzt02CepHZLtWEWK7DfPkCx8mIoalbsKg/CBlT155nB9VpwZuV8gfqusrxBrA8
 zSQ6lHCxYY+Y8DIB6aHzJ+tEH28JTeVU0FR4/5id0VE6Ioy9B/9P9ycbT4lVjLl0
 k3LrioKlZJi0mPdmdZK/q6ubTYH2pMuzqcg==
X-ME-Sender: <xms:fUxXYtN3aSY5upsyhJRyMzyZ6CIMM86PXUGsneK3hfAp3QEosQQiow>
 <xme:fUxXYv-yCdWnz8MuI60RUA498Idy6O2DR0aaTwMTPo_gDUelIBFsqk-zTvXCJIB9k
 HvrPCbhx7UgjksqkA>
X-ME-Received: <xmr:fUxXYsSoZoiReBxVCvFKVHnpkXFRGnZk-cI9M0xxc5qIszk7oT0Vbi-K5Nzb3x_XkKg9rg2NvJm6XMAghGCbJqsJGOUM0aPXYmz5iYQxVFMAR_KsZDEKM2C0O1OoIyYaDIqeKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelvddguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:fUxXYptf6SAwn3N0QEdk-qKwMUFU719IGXyP0wYFDul9_kckW2ZpKg>
 <xmx:fUxXYle7anhvYtKBEYqV0Nut9O_lfpg-TfirYUFyXKhLKg97RI3xjw>
 <xmx:fUxXYl2K3NBlUSawRgTMMEMy9YsIjlE1MkTy_IPGoN4-WO6TB9YEGQ>
 <xmx:fUxXYncOtwwtIlcJrBjFVY3reJ3y2AAynbCqXsKu_KP76l_45FRwqw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Apr 2022 18:19:40 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 10/16] drm/rockchip: ebc: Implement partial refreshes
Date: Wed, 13 Apr 2022 17:19:10 -0500
Message-Id: <20220413221916.50995-11-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413221916.50995-1-samuel@sholland.org>
References: <20220413221916.50995-1-samuel@sholland.org>
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ond=C5=99ej=20Jirman?= <x@xff.cz>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Samuel Holland <samuel@sholland.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Andreas Kemnade <andreas@kemnade.info>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peter Geis <pgwipeout@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Several areas of the display can be refreshed concurrently, but only if
they do not overlap. This commit adds a queue of damaged areas, and
schedules them for refresh based on collision with other areas. While
the queue is unbounded, there is logic to quickly drop duplicate areas.

Because three-window mode disables the hardware's frame counter, a
separate buffer is required for each frame. (In other words, there is no
automatic increment.) To minimize overhead, swap between two buffers for
phase numbers. This requires extending the loop for one extra frame to
clear the phase numbers in both buffers when an area completes. (This
extra frame is a no-op and is not sent to the hardware.)

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/rockchip/rockchip_ebc.c | 346 +++++++++++++++++++++++-
 1 file changed, 344 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_ebc.c b/drivers/gpu/drm/rockchip/rockchip_ebc.c
index cb6dc567e94c..c3e4b65bdee6 100644
--- a/drivers/gpu/drm/rockchip/rockchip_ebc.c
+++ b/drivers/gpu/drm/rockchip/rockchip_ebc.c
@@ -17,6 +17,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_epd_helper.h>
 #include <drm/drm_fb_helper.h>
@@ -123,10 +124,14 @@
 #define EBC_WIN_MST2			0x0058
 #define EBC_LUT_DATA			0x1000
 
+#define EBC_FRAME_PENDING		(-1U)
+
 #define EBC_MAX_PHASES			256
+
 #define EBC_NUM_LUT_REGS		0x1000
 #define EBC_NUM_SUPPLIES		3
 
+#define EBC_FRAME_TIMEOUT		msecs_to_jiffies(25)
 #define EBC_REFRESH_TIMEOUT		msecs_to_jiffies(3000)
 #define EBC_SUSPEND_DELAY_MS		2000
 
@@ -177,10 +182,25 @@ static const struct drm_mode_config_funcs rockchip_ebc_mode_config_funcs = {
 	.atomic_commit		= drm_atomic_helper_commit,
 };
 
+/**
+ * struct rockchip_ebc_area - describes a damaged area of the display
+ *
+ * @list: Used to put this area in the state/context/refresh thread list
+ * @clip: The rectangular clip of this damage area
+ * @frame_begin: The frame number when this damage area starts being refreshed
+ */
+struct rockchip_ebc_area {
+	struct list_head		list;
+	struct drm_rect			clip;
+	u32				frame_begin;
+};
+
 /**
  * struct rockchip_ebc_ctx - context for performing display refreshes
  *
  * @kref: Reference count, maintained as part of the CRTC's atomic state
+ * @queue: Queue of damaged areas to be refreshed
+ * @queue_lock: Lock protecting access to @queue
  * @prev: Display contents (Y4) before this refresh
  * @next: Display contents (Y4) after this refresh
  * @final: Display contents (Y4) after all pending refreshes
@@ -192,6 +212,8 @@ static const struct drm_mode_config_funcs rockchip_ebc_mode_config_funcs = {
  */
 struct rockchip_ebc_ctx {
 	struct kref			kref;
+	struct list_head		queue;
+	spinlock_t			queue_lock;
 	u8				*prev;
 	u8				*next;
 	u8				*final;
@@ -204,6 +226,10 @@ struct rockchip_ebc_ctx {
 
 static void rockchip_ebc_ctx_free(struct rockchip_ebc_ctx *ctx)
 {
+	struct rockchip_ebc_area *area;
+
+	list_for_each_entry(area, &ctx->queue, list)
+		kfree(area);
 	kfree(ctx->prev);
 	kfree(ctx->next);
 	kfree(ctx->final);
@@ -234,6 +260,8 @@ static struct rockchip_ebc_ctx *rockchip_ebc_ctx_alloc(u32 width, u32 height)
 	}
 
 	kref_init(&ctx->kref);
+	INIT_LIST_HEAD(&ctx->queue);
+	spin_lock_init(&ctx->queue_lock);
 	ctx->gray4_pitch = width / 2;
 	ctx->gray4_size  = gray4_size;
 	ctx->phase_pitch = width;
@@ -291,12 +319,204 @@ static void rockchip_ebc_global_refresh(struct rockchip_ebc *ebc,
 	memcpy(ctx->prev, ctx->next, gray4_size);
 }
 
+static bool rockchip_ebc_schedule_area(struct list_head *areas,
+				       struct rockchip_ebc_area *area,
+				       u32 current_frame, u32 num_phases)
+{
+	struct rockchip_ebc_area *other;
+	u32 frame_begin = current_frame;
+
+	list_for_each_entry(other, areas, list) {
+		struct drm_rect intersection;
+		u32 other_end;
+
+		/* Only consider areas before this one in the list. */
+		if (other == area)
+			break;
+
+		/* Skip areas that finish refresh before this area begins. */
+		other_end = other->frame_begin + num_phases;
+		if (other_end <= frame_begin)
+			continue;
+
+		/* If there is no collision, the areas are independent. */
+		intersection = area->clip;
+		if (!drm_rect_intersect(&intersection, &other->clip))
+			continue;
+
+		/* If the other area already started, wait until it finishes. */
+		if (other->frame_begin < current_frame) {
+			frame_begin = other_end;
+			continue;
+		}
+
+		/*
+		 * If the other area has not started yet, and completely
+		 * contains this area, then this area is redundant.
+		 */
+		if (drm_rect_equals(&area->clip, &intersection))
+			return false;
+
+		/* Otherwise, start at the same time as the other area. */
+		frame_begin = other->frame_begin;
+	}
+
+	area->frame_begin = frame_begin;
+
+	return true;
+}
+
+static void rockchip_ebc_blit_phase(const struct rockchip_ebc_ctx *ctx,
+				    u8 *dst, u8 phase,
+				    const struct drm_rect *clip)
+{
+	unsigned int pitch = ctx->phase_pitch;
+	unsigned int width = clip->x2 - clip->x1;
+	unsigned int y;
+	u8 *dst_line;
+
+	dst_line = dst + clip->y1 * pitch + clip->x1;
+
+	for (y = clip->y1; y < clip->y2; y++) {
+		memset(dst_line, phase, width);
+
+		dst_line += pitch;
+	}
+}
+
+static void rockchip_ebc_blit_pixels(const struct rockchip_ebc_ctx *ctx,
+				     u8 *dst, const u8 *src,
+				     const struct drm_rect *clip)
+{
+	unsigned int x1_bytes = clip->x1 / 2;
+	unsigned int x2_bytes = clip->x2 / 2;
+	unsigned int pitch = ctx->gray4_pitch;
+	unsigned int width = x2_bytes - x1_bytes;
+	const u8 *src_line;
+	unsigned int y;
+	u8 *dst_line;
+
+	dst_line = dst + clip->y1 * pitch + x1_bytes;
+	src_line = src + clip->y1 * pitch + x1_bytes;
+
+	for (y = clip->y1; y < clip->y2; y++) {
+		memcpy(dst_line, src_line, width);
+
+		dst_line += pitch;
+		src_line += pitch;
+	}
+}
+
 static void rockchip_ebc_partial_refresh(struct rockchip_ebc *ebc,
 					 struct rockchip_ebc_ctx *ctx)
 {
+	dma_addr_t next_handle = virt_to_phys(ctx->next);
+	dma_addr_t prev_handle = virt_to_phys(ctx->prev);
+	struct rockchip_ebc_area *area, *next_area;
+	u32 last_phase = ebc->lut.num_phases - 1;
 	struct drm_device *drm = &ebc->drm;
+	u32 gray4_size = ctx->gray4_size;
+	struct device *dev = drm->dev;
+	LIST_HEAD(areas);
+	u32 frame;
+
+	for (frame = 0;; frame++) {
+		/* Swap phase buffers to minimize latency between frames. */
+		u8 *phase_buffer = ctx->phase[frame % 2];
+		dma_addr_t phase_handle = virt_to_phys(phase_buffer);
+		bool sync_next = false;
+		bool sync_prev = false;
+
+		/* Move the queued damage areas to the local list. */
+		spin_lock(&ctx->queue_lock);
+		list_splice_tail_init(&ctx->queue, &areas);
+		spin_unlock(&ctx->queue_lock);
+
+		list_for_each_entry_safe(area, next_area, &areas, list) {
+			s32 frame_delta;
+			u32 phase;
+
+			/*
+			 * Determine when this area can start its refresh.
+			 * If the area is redundant, drop it immediately.
+			 */
+			if (area->frame_begin == EBC_FRAME_PENDING &&
+			    !rockchip_ebc_schedule_area(&areas, area, frame,
+							ebc->lut.num_phases)) {
+				list_del(&area->list);
+				kfree(area);
+				continue;
+			}
+
+			frame_delta = frame - area->frame_begin;
+			if (frame_delta < 0)
+				continue;
+
+			/* Copy ctx->final to ctx->next on the first frame. */
+			if (frame_delta == 0) {
+				rockchip_ebc_blit_pixels(ctx, ctx->next,
+							 ctx->final,
+							 &area->clip);
+				sync_next = true;
+			}
+
+			/*
+			 * Take advantage of the fact that the last phase in a
+			 * waveform is always zero (neutral polarity). Instead
+			 * of writing the actual phase number, write 0xff (the
+			 * last possible phase number), which is guaranteed to
+			 * be neutral for every waveform.
+			 */
+			phase = frame_delta >= last_phase ? 0xff : frame_delta;
+			rockchip_ebc_blit_phase(ctx, phase_buffer, phase,
+						&area->clip);
+
+			/*
+			 * Copy ctx->next to ctx->prev after the last phase.
+			 * Technically, this races with the hardware computing
+			 * the last phase, but the last phase is all zeroes
+			 * anyway, regardless of prev/next (see above).
+			 *
+			 * Keeping the area in the list for one extra frame
+			 * also ensures both phase buffers get set to 0xff.
+			 */
+			if (frame_delta > last_phase) {
+				rockchip_ebc_blit_pixels(ctx, ctx->prev,
+							 ctx->next,
+							 &area->clip);
+				sync_prev = true;
+
+				list_del(&area->list);
+				kfree(area);
+			}
+		}
+
+		if (sync_next)
+			dma_sync_single_for_device(dev, next_handle,
+						   gray4_size, DMA_TO_DEVICE);
+		if (sync_prev)
+			dma_sync_single_for_device(dev, prev_handle,
+						   gray4_size, DMA_TO_DEVICE);
+		dma_sync_single_for_device(dev, phase_handle,
+					   ctx->phase_size, DMA_TO_DEVICE);
+
+		if (frame) {
+			if (!wait_for_completion_timeout(&ebc->display_end,
+							 EBC_FRAME_TIMEOUT))
+				drm_err(drm, "Frame %d timed out!\n", frame);
+		}
 
-	drm_dbg(drm, "partial refresh\n");
+		if (list_empty(&areas))
+			break;
+
+		regmap_write(ebc->regmap, EBC_WIN_MST2,
+			     phase_handle);
+		regmap_write(ebc->regmap, EBC_CONFIG_DONE,
+			     EBC_CONFIG_DONE_REG_CONFIG_DONE);
+		regmap_write(ebc->regmap, EBC_DSP_START,
+			     ebc->dsp_start |
+			     EBC_DSP_START_DSP_FRM_START);
+	}
 }
 
 static void rockchip_ebc_refresh(struct rockchip_ebc *ebc,
@@ -438,7 +658,8 @@ static int rockchip_ebc_refresh_thread(void *data)
 			rockchip_ebc_refresh(ebc, ctx, false, default_waveform);
 
 			set_current_state(TASK_IDLE);
-			schedule();
+			if (list_empty(&ctx->queue))
+				schedule();
 			__set_current_state(TASK_RUNNING);
 		}
 
@@ -686,6 +907,7 @@ static const struct drm_crtc_funcs rockchip_ebc_crtc_funcs = {
 
 struct ebc_plane_state {
 	struct drm_shadow_plane_state	base;
+	struct list_head		areas;
 };
 
 static inline struct ebc_plane_state *
@@ -702,8 +924,13 @@ static inline struct rockchip_ebc *plane_to_ebc(struct drm_plane *plane)
 static int rockchip_ebc_plane_atomic_check(struct drm_plane *plane,
 					   struct drm_atomic_state *state)
 {
+	struct drm_atomic_helper_damage_iter iter;
+	struct ebc_plane_state *ebc_plane_state;
+	struct drm_plane_state *old_plane_state;
 	struct drm_plane_state *plane_state;
 	struct drm_crtc_state *crtc_state;
+	struct rockchip_ebc_area *area;
+	struct drm_rect clip;
 	int ret;
 
 	plane_state = drm_atomic_get_new_plane_state(state, plane);
@@ -718,19 +945,126 @@ static int rockchip_ebc_plane_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	ebc_plane_state = to_ebc_plane_state(plane_state);
+	old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
+	drm_atomic_for_each_plane_damage(&iter, &clip) {
+		area = kmalloc(sizeof(*area), GFP_KERNEL);
+		if (!area)
+			return -ENOMEM;
+
+		area->frame_begin = EBC_FRAME_PENDING;
+		area->clip = clip;
+
+		list_add_tail(&area->list, &ebc_plane_state->areas);
+	}
+
 	return 0;
 }
 
+static bool rockchip_ebc_blit_fb(const struct rockchip_ebc_ctx *ctx,
+				 const struct drm_rect *dst_clip,
+				 const void *vaddr,
+				 const struct drm_framebuffer *fb,
+				 const struct drm_rect *src_clip)
+{
+	unsigned int dst_pitch = ctx->gray4_pitch;
+	unsigned int src_pitch = fb->pitches[0];
+	unsigned int x, y;
+	const void *src;
+	u8 changed = 0;
+	void *dst;
+
+	dst = ctx->final + dst_clip->y1 * dst_pitch + dst_clip->x1 / 2;
+	src = vaddr + src_clip->y1 * src_pitch + src_clip->x1 * fb->format->cpp[0];
+
+	for (y = src_clip->y1; y < src_clip->y2; y++) {
+		const u32 *sbuf = src;
+		u8 *dbuf = dst;
+
+		for (x = src_clip->x1; x < src_clip->x2; x += 2) {
+			u32 rgb0 = *sbuf++;
+			u32 rgb1 = *sbuf++;
+			u8 gray;
+
+			/* Truncate the RGB values to 5 bits each. */
+			rgb0 &= 0x00f8f8f8U; rgb1 &= 0x00f8f8f8U;
+			/* Put the sum 2R+5G+B in bits 24-31. */
+			rgb0 *= 0x0020a040U; rgb1 *= 0x0020a040U;
+			/* Unbias the value for rounding to 4 bits. */
+			rgb0 += 0x07000000U; rgb1 += 0x07000000U;
+
+			gray = rgb0 >> 28 | rgb1 >> 28 << 4;
+			changed |= gray ^ *dbuf;
+			*dbuf++ = gray;
+		}
+
+		dst += dst_pitch;
+		src += src_pitch;
+	}
+
+	return !!changed;
+}
+
 static void rockchip_ebc_plane_atomic_update(struct drm_plane *plane,
 					     struct drm_atomic_state *state)
 {
 	struct rockchip_ebc *ebc = plane_to_ebc(plane);
+	struct rockchip_ebc_area *area, *next_area;
+	struct ebc_plane_state *ebc_plane_state;
 	struct drm_plane_state *plane_state;
+	struct drm_crtc_state *crtc_state;
+	struct rockchip_ebc_ctx *ctx;
+	int translate_x, translate_y;
+	struct drm_rect src;
+	const void *vaddr;
 
 	plane_state = drm_atomic_get_new_plane_state(state, plane);
 	if (!plane_state->crtc)
 		return;
 
+	crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
+	ctx = to_ebc_crtc_state(crtc_state)->ctx;
+
+	drm_rect_fp_to_int(&src, &plane_state->src);
+	translate_x = plane_state->dst.x1 - src.x1;
+	translate_y = plane_state->dst.y1 - src.y1;
+
+	ebc_plane_state = to_ebc_plane_state(plane_state);
+	vaddr = ebc_plane_state->base.data[0].vaddr;
+
+	list_for_each_entry_safe(area, next_area, &ebc_plane_state->areas, list) {
+		struct drm_rect *dst_clip = &area->clip;
+		struct drm_rect src_clip = area->clip;
+		int adjust;
+
+		/* Convert from plane coordinates to CRTC coordinates. */
+		drm_rect_translate(dst_clip, translate_x, translate_y);
+
+		/* Adjust the clips to always process full bytes (2 pixels). */
+		adjust = dst_clip->x1 & 1;
+		dst_clip->x1 -= adjust;
+		src_clip.x1  -= adjust;
+
+		adjust = dst_clip->x2 & 1;
+		dst_clip->x2 += adjust;
+		src_clip.x2  += adjust;
+
+		if (!rockchip_ebc_blit_fb(ctx, dst_clip, vaddr,
+					  plane_state->fb, &src_clip)) {
+			/* Drop the area if the FB didn't actually change. */
+			list_del(&area->list);
+			kfree(area);
+		}
+	}
+
+	if (list_empty(&ebc_plane_state->areas))
+		return;
+
+	spin_lock(&ctx->queue_lock);
+	list_splice_tail_init(&ebc_plane_state->areas, &ctx->queue);
+	spin_unlock(&ctx->queue_lock);
+
 	wake_up_process(ebc->refresh_thread);
 }
 
@@ -756,6 +1090,8 @@ static void rockchip_ebc_plane_reset(struct drm_plane *plane)
 		return;
 
 	__drm_gem_reset_shadow_plane(plane, &ebc_plane_state->base);
+
+	INIT_LIST_HEAD(&ebc_plane_state->areas);
 }
 
 static struct drm_plane_state *
@@ -772,6 +1108,8 @@ rockchip_ebc_plane_duplicate_state(struct drm_plane *plane)
 
 	__drm_gem_duplicate_shadow_plane_state(plane, &ebc_plane_state->base);
 
+	INIT_LIST_HEAD(&ebc_plane_state->areas);
+
 	return &ebc_plane_state->base.base;
 }
 
@@ -779,6 +1117,10 @@ static void rockchip_ebc_plane_destroy_state(struct drm_plane *plane,
 					     struct drm_plane_state *plane_state)
 {
 	struct ebc_plane_state *ebc_plane_state = to_ebc_plane_state(plane_state);
+	struct rockchip_ebc_area *area, *next_area;
+
+	list_for_each_entry_safe(area, next_area, &ebc_plane_state->areas, list)
+		kfree(area);
 
 	__drm_gem_destroy_shadow_plane_state(&ebc_plane_state->base);
 
-- 
2.35.1

