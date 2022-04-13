Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42805001A7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 00:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DD610F142;
	Wed, 13 Apr 2022 22:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D748810F136
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 22:19:36 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 2ED0C5C02A7;
 Wed, 13 Apr 2022 18:19:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 13 Apr 2022 18:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649888376; x=1649974776; bh=l5
 vU5WVwRKKm13piTZRihQEkEUzFfrdwYn8dVCn/ts4=; b=RhC4uciPnKD/nHp08D
 rkLH3SIALFBBE73efUXxMXrQflRgBa2qt9+Seupl4Eb6Tg1iRzG7D/K5avrx02ja
 CLvdHpaOC5ggGnL7APMAP4R23FPyhCHKB6Ry55ydGc7J0W5CDvkA5nAOI/leoBBs
 b/MP9vnLdU9yUdSXO7+Pkc8YWe9Gide2gjosvr8UFrAXvVxyIGUWXGXBIX53WYyF
 4RK74vG1OsORMiixKNyejncrlyI+mjYMXgwd8UFJZF+Oy+aH1kjmRU35Ngt64M/l
 17LD3NXTE/xzKQiYGUrWS3U+bBn0cALMJxzt8kqXSNmdtCApUsy+VpGijI13XccI
 YP8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1649888376; x=1649974776; bh=l5vU5WVwRKKm13piTZRihQEkEUzFfrdwYn8
 dVCn/ts4=; b=ZP64vNZlztWAPDchOWL+nFnpNOVOIXM8fuw8FZxBiymWB5DwYdw
 r2zR081fRDlGhYq9rOFaYdQCPDzCTVSlpJLvFbuMh5aA/ozx7F0s20fHe/+bxumT
 Ox5wC3ZIf3ewo1ZmB90dlG0dmyKCzrw6yTzmGo37Vi/Er6L6+ubyVCjqRtNCesmS
 6CDYk8yPZMXI7Ij+r2CPVZtZTqobBHQLONC5EhwyUOLY1Yhc4kRF9ZXO9Y9431WT
 AcVx00xaaE+JsxaLk/Q5UVcE7XTPtFaUeh89KPed+UNJZRs91p/YgJu5u/hJpAdC
 6U3bn5gGCMpH0fTZe3rhUvLuGEAT22+D3Zw==
X-ME-Sender: <xms:eExXYvV2VPJvsKjnBZPTyg9sfVdpO5dTQ4hxALTgyXDRDi7NlKef3g>
 <xme:eExXYnngqHiy45H_uKNL5sy7e2NiOCrFgHe6QhmBvTIAbuzo_v54RJgSkHIcgZ4t6
 X72__k0kK4HNit5GQ>
X-ME-Received: <xmr:eExXYrahgO7bLGI3SsZyssvPzFmUwu1AJzTIqqhQf4MKVfPmGoHcnTn575Xlyv1ZQ7OLnkrwAfYfuQE5ymL-I0RowVe0DSNS3T_kltSeK72dhkMeqJuO2e44qhW--5zCQrFETA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelvddgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:eExXYqXKuUreuZyDG-GMTlhysU2c6ZEmf0h-wMYNyiHNgtrZAkgS3Q>
 <xmx:eExXYplKi99SZRYaMq8_5zC5oMloV6oLflQIQCGCm_trj_1HLUdL3g>
 <xmx:eExXYnfVRkce8H0owgFN4ePKX-FEDMpHzK22bDlUdBXA2SzdYzz7rw>
 <xmx:eExXYvGAbE2uXd7dfnpDyBX7_MKMTx_eotd6PvhOrrUBVMWEhQ2FDA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Apr 2022 18:19:35 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 07/16] drm/rockchip: ebc: Add CRTC buffer management
Date: Wed, 13 Apr 2022 17:19:07 -0500
Message-Id: <20220413221916.50995-8-samuel@sholland.org>
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

This commit adds the "context" structure which holds all buffers needed
to refresh the display. It is allocated separately from the CRTC state
because it is reused as long as no mode change occurs.

There are three buffers holding Y4 (grayscale 4 bits/pixel) pixel data:
  - "prev" - contents of the display at the beginning of a refresh.
  - "next" - contents of the display at the end of that refresh. When a
    refresh finishes, the "next" buffer is copied into "prev".
  - "final" - contents of the display at the end of the final refresh.
    This buffer is necessary because a refresh waveform cannot be
    modified or interrupted once it is started. If a pixel's value is
    changed while it is already being refreshed, the "next" buffer
    cannot be updated until the first waveform completes. At that time,
    the "final" buffer is copied into "next", and another refresh is
    started. The name "final" refers to the write-combining behavior of
    this buffer; any number of plane updates can change this buffer
    while waiting for the current refresh to complete.

Then there are two buffers holding "phase" data. These are only used
during partial refreshes. The phase represents the time component (the X
coordinate) of the waveform. Since the EBC supports a maximum of 256
phases in a waveform, the phase number requires one byte per pixel. The
driver swaps between two buffers to minimize the delay between phases,
as these buffers must be updated for every phase in the waveform.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/rockchip/rockchip_ebc.c | 166 +++++++++++++++++++++++-
 1 file changed, 163 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_ebc.c b/drivers/gpu/drm/rockchip/rockchip_ebc.c
index ebe60d5e011a..095d66e67c2f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_ebc.c
+++ b/drivers/gpu/drm/rockchip/rockchip_ebc.c
@@ -17,6 +17,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_epd_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -141,6 +142,10 @@ struct rockchip_ebc {
 	bool				reset_complete;
 };
 
+static int default_waveform = DRM_EPD_WF_GC16;
+module_param(default_waveform, int, 0644);
+MODULE_PARM_DESC(default_waveform, "waveform to use for display updates");
+
 static bool skip_reset;
 module_param(skip_reset, bool, 0444);
 MODULE_PARM_DESC(skip_reset, "skip the initial display reset");
@@ -165,12 +170,86 @@ static const struct drm_mode_config_funcs rockchip_ebc_mode_config_funcs = {
 	.atomic_commit		= drm_atomic_helper_commit,
 };
 
+/**
+ * struct rockchip_ebc_ctx - context for performing display refreshes
+ *
+ * @kref: Reference count, maintained as part of the CRTC's atomic state
+ * @prev: Display contents (Y4) before this refresh
+ * @next: Display contents (Y4) after this refresh
+ * @final: Display contents (Y4) after all pending refreshes
+ * @phase: Buffers for selecting a phase from the EBC's LUT, 1 byte/pixel
+ * @gray4_pitch: Horizontal line length of a Y4 pixel buffer in bytes
+ * @gray4_size: Size of a Y4 pixel buffer in bytes
+ * @phase_pitch: Horizontal line length of a phase buffer in bytes
+ * @phase_size: Size of a phase buffer in bytes
+ */
+struct rockchip_ebc_ctx {
+	struct kref			kref;
+	u8				*prev;
+	u8				*next;
+	u8				*final;
+	u8				*phase[2];
+	u32				gray4_pitch;
+	u32				gray4_size;
+	u32				phase_pitch;
+	u32				phase_size;
+};
+
+static void rockchip_ebc_ctx_free(struct rockchip_ebc_ctx *ctx)
+{
+	kfree(ctx->prev);
+	kfree(ctx->next);
+	kfree(ctx->final);
+	kfree(ctx->phase[0]);
+	kfree(ctx->phase[1]);
+	kfree(ctx);
+}
+
+static struct rockchip_ebc_ctx *rockchip_ebc_ctx_alloc(u32 width, u32 height)
+{
+	u32 gray4_size = width * height / 2;
+	u32 phase_size = width * height;
+	struct rockchip_ebc_ctx *ctx;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return NULL;
+
+	ctx->prev = kmalloc(gray4_size, GFP_KERNEL);
+	ctx->next = kmalloc(gray4_size, GFP_KERNEL);
+	ctx->final = kmalloc(gray4_size, GFP_KERNEL);
+	ctx->phase[0] = kmalloc(phase_size, GFP_KERNEL);
+	ctx->phase[1] = kmalloc(phase_size, GFP_KERNEL);
+	if (!ctx->prev || !ctx->next || !ctx->final ||
+	    !ctx->phase[0] || !ctx->phase[1]) {
+		rockchip_ebc_ctx_free(ctx);
+		return NULL;
+	}
+
+	kref_init(&ctx->kref);
+	ctx->gray4_pitch = width / 2;
+	ctx->gray4_size  = gray4_size;
+	ctx->phase_pitch = width;
+	ctx->phase_size  = phase_size;
+
+	return ctx;
+}
+
+static void rockchip_ebc_ctx_release(struct kref *kref)
+{
+	struct rockchip_ebc_ctx *ctx =
+		container_of(kref, struct rockchip_ebc_ctx, kref);
+
+	return rockchip_ebc_ctx_free(ctx);
+}
+
 /*
  * CRTC
  */
 
 struct ebc_crtc_state {
 	struct drm_crtc_state		base;
+	struct rockchip_ebc_ctx		*ctx;
 };
 
 static inline struct ebc_crtc_state *
@@ -179,11 +258,70 @@ to_ebc_crtc_state(struct drm_crtc_state *crtc_state)
 	return container_of(crtc_state, struct ebc_crtc_state, base);
 }
 
+static void rockchip_ebc_global_refresh(struct rockchip_ebc *ebc,
+					const struct rockchip_ebc_ctx *ctx)
+{
+	struct drm_device *drm = &ebc->drm;
+	u32 gray4_size = ctx->gray4_size;
+
+	drm_dbg(drm, "global refresh\n");
+
+	memcpy(ctx->prev, ctx->next, gray4_size);
+}
+
+static void rockchip_ebc_partial_refresh(struct rockchip_ebc *ebc,
+					 struct rockchip_ebc_ctx *ctx)
+{
+	struct drm_device *drm = &ebc->drm;
+
+	drm_dbg(drm, "partial refresh\n");
+}
+
+static void rockchip_ebc_refresh(struct rockchip_ebc *ebc,
+				 struct rockchip_ebc_ctx *ctx,
+				 bool global_refresh,
+				 enum drm_epd_waveform waveform)
+{
+	if (global_refresh)
+		rockchip_ebc_global_refresh(ebc, ctx);
+	else
+		rockchip_ebc_partial_refresh(ebc, ctx);
+}
+
 static int rockchip_ebc_refresh_thread(void *data)
 {
 	struct rockchip_ebc *ebc = data;
+	struct rockchip_ebc_ctx *ctx;
 
 	while (!kthread_should_stop()) {
+		/* The context will change each time the thread is unparked. */
+		ctx = to_ebc_crtc_state(READ_ONCE(ebc->crtc.state))->ctx;
+
+		/*
+		 * Initialize the buffers before use. This is deferred to the
+		 * kthread to avoid slowing down atomic_check.
+		 *
+		 * ctx->prev and ctx->next are set to 0xff, all white, because:
+		 *  1) the display is set to white by the reset waveform, and
+		 *  2) the driver maintains the invariant that the display is
+		 *     all white whenever the CRTC is disabled.
+		 *
+		 * ctx->final is initialized by the first plane update.
+		 *
+		 * ctx->phase is set to 0xff, the number of the last possible
+		 * phase, because the LUT for that phase is known to be all
+		 * zeroes. (The last real phase in a waveform is zero in order
+		 * to discharge the display, and unused phases in the LUT are
+		 * zeroed out.) This prevents undesired driving of the display
+		 * in 3-window mode between when the framebuffer is blitted
+		 * (and thus prev != next) and when the refresh thread starts
+		 * counting phases for that region.
+		 */
+		memset(ctx->prev, 0xff, ctx->gray4_size);
+		memset(ctx->next, 0xff, ctx->gray4_size);
+		memset(ctx->phase[0], 0xff, ctx->phase_size);
+		memset(ctx->phase[1], 0xff, ctx->phase_size);
+
 		/*
 		 * LUTs use both the old and the new pixel values as inputs.
 		 * However, the initial contents of the display are unknown.
@@ -192,11 +330,11 @@ static int rockchip_ebc_refresh_thread(void *data)
 		 */
 		if (!ebc->reset_complete) {
 			ebc->reset_complete = true;
-			drm_dbg(&ebc->drm, "display reset\n");
+			rockchip_ebc_refresh(ebc, ctx, true, DRM_EPD_WF_RESET);
 		}
 
 		while (!kthread_should_park()) {
-			drm_dbg(&ebc->drm, "display update\n");
+			rockchip_ebc_refresh(ebc, ctx, false, default_waveform);
 
 			set_current_state(TASK_IDLE);
 			schedule();
@@ -207,7 +345,8 @@ static int rockchip_ebc_refresh_thread(void *data)
 		 * Clear the display before disabling the CRTC. Use the
 		 * highest-quality waveform to minimize visible artifacts.
 		 */
-		drm_dbg(&ebc->drm, "display clear\n");
+		memset(ctx->next, 0xff, ctx->gray4_size);
+		rockchip_ebc_refresh(ebc, ctx, true, DRM_EPD_WF_GC16);
 
 		kthread_parkme();
 	}
@@ -312,7 +451,9 @@ static int rockchip_ebc_crtc_atomic_check(struct drm_crtc *crtc,
 					  struct drm_atomic_state *state)
 {
 	struct rockchip_ebc *ebc = crtc_to_ebc(crtc);
+	struct ebc_crtc_state *ebc_crtc_state;
 	struct drm_crtc_state *crtc_state;
+	struct rockchip_ebc_ctx *ctx;
 
 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (!crtc_state->mode_changed)
@@ -320,14 +461,26 @@ static int rockchip_ebc_crtc_atomic_check(struct drm_crtc *crtc,
 
 	if (crtc_state->enable) {
 		struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+
 		long rate = mode->clock * 1000;
 
 		rate = clk_round_rate(ebc->dclk, rate);
 		if (rate < 0)
 			return rate;
 		mode->clock = rate / 1000;
+
+		ctx = rockchip_ebc_ctx_alloc(mode->hdisplay, mode->vdisplay);
+		if (!ctx)
+			return -ENOMEM;
+	} else {
+		ctx = NULL;
 	}
 
+	ebc_crtc_state = to_ebc_crtc_state(crtc_state);
+	if (ebc_crtc_state->ctx)
+		kref_put(&ebc_crtc_state->ctx->kref, rockchip_ebc_ctx_release);
+	ebc_crtc_state->ctx = ctx;
+
 	return 0;
 }
 
@@ -397,6 +550,10 @@ rockchip_ebc_crtc_duplicate_state(struct drm_crtc *crtc)
 
 	__drm_atomic_helper_crtc_duplicate_state(crtc, &ebc_crtc_state->base);
 
+	ebc_crtc_state->ctx = to_ebc_crtc_state(crtc->state)->ctx;
+	if (ebc_crtc_state->ctx)
+		kref_get(&ebc_crtc_state->ctx->kref);
+
 	return &ebc_crtc_state->base;
 }
 
@@ -405,6 +562,9 @@ static void rockchip_ebc_crtc_destroy_state(struct drm_crtc *crtc,
 {
 	struct ebc_crtc_state *ebc_crtc_state = to_ebc_crtc_state(crtc_state);
 
+	if (ebc_crtc_state->ctx)
+		kref_put(&ebc_crtc_state->ctx->kref, rockchip_ebc_ctx_release);
+
 	__drm_atomic_helper_crtc_destroy_state(&ebc_crtc_state->base);
 
 	kfree(ebc_crtc_state);
-- 
2.35.1

