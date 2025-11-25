Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E617DC8517D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 14:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA31C10E3DD;
	Tue, 25 Nov 2025 13:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="FGCFp5HQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hj+bWIsv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FGCFp5HQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hj+bWIsv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EDD10E3DD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 13:06:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9569E5BD12;
 Tue, 25 Nov 2025 13:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764076002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+U4vrIbgsgliUNxgUtxijRtJqOxydX2VEPK/MIi84Fo=;
 b=FGCFp5HQ63OodYpyDIJt2551sLCB1Scd6uNRs6OdqP4fT1OcV2jbLC4iw+IdIsUZr0FxaX
 2uHqAjTxai3rSexI1uEscKuVSqD8IaKkRfsE9vHy8KpeA+/6eveo6Ii8Flx69/mkoP68sT
 B5Zo0HM8KyJi18dQ79nHW/CQOoKd0ro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764076002;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+U4vrIbgsgliUNxgUtxijRtJqOxydX2VEPK/MIi84Fo=;
 b=hj+bWIsv2zq+rBDW+akfq9R91Et4iwN9vh95lhyiecqFlP/NT9NHZU8PZSQBE0V1ZK1NS/
 Cl2PxTttZSALhXBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764076002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+U4vrIbgsgliUNxgUtxijRtJqOxydX2VEPK/MIi84Fo=;
 b=FGCFp5HQ63OodYpyDIJt2551sLCB1Scd6uNRs6OdqP4fT1OcV2jbLC4iw+IdIsUZr0FxaX
 2uHqAjTxai3rSexI1uEscKuVSqD8IaKkRfsE9vHy8KpeA+/6eveo6Ii8Flx69/mkoP68sT
 B5Zo0HM8KyJi18dQ79nHW/CQOoKd0ro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764076002;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+U4vrIbgsgliUNxgUtxijRtJqOxydX2VEPK/MIi84Fo=;
 b=hj+bWIsv2zq+rBDW+akfq9R91Et4iwN9vh95lhyiecqFlP/NT9NHZU8PZSQBE0V1ZK1NS/
 Cl2PxTttZSALhXBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 150173EA65;
 Tue, 25 Nov 2025 13:06:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oMS1A+KpJWkDFAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Nov 2025 13:06:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, lyude@redhat.com, dakr@kernel.org, deller@gmx.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jason.wessel@windriver.com, danielt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/5] drm/radeon: Do not implement mode_set_base_atomic callback
Date: Tue, 25 Nov 2025 13:52:15 +0100
Message-ID: <20251125130634.1080966-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251125130634.1080966-1-tzimmermann@suse.de>
References: <20251125130634.1080966-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_TWELVE(0.00)[19];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,amd.com,redhat.com,kernel.org,gmx.de,linux.intel.com,windriver.com,chromium.org];
 RCVD_TLS_ALL(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLq3cifbxyhc6qbbynzfc6amns)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
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

Remove the implementation of the CRTC helper mode_set_base_atomic
from radeon. It pretends to provide mode setting for kdb debugging,
but has been broken for some time.

Kdb output has been supported only for non-atomic mode setting since
commit 9c79e0b1d096 ("drm/fb-helper: Give up on kgdb for atomic drivers")
from 2017.

While radeon provides non-atomic mode setting, kdb assumes that the GEM
buffer object is at a fixed location in video memory. This assumption
currently blocks radeon from converting to generic fbdev emulation.
Fbdev-ttm helpers use a shadow buffer with a movable GEM buffer object.
Triggering kdb does therefore not update the display.

Another problem is that the current implementation does not handle
USB keyboard input. Therefore a serial terminal is required. Then when
continuing from the debugger, radeon fails with an error:

[7]kdb> go
[   40.345523][    C7] BUG: scheduling while atomic: bash/1580/0x00110003
[...]
[   40.345613][    C7]  schedule+0x27/0xd0
[   40.345615][    C7]  schedule_timeout+0x7b/0x100
[   40.345617][    C7]  ? __pfx_process_timeout+0x10/0x10
[   40.345619][    C7]  msleep+0x31/0x50
[   40.345621][    C7]  radeon_crtc_load_lut+0x2e4/0xcb0 [radeon 31c1ee785de120fcfd0babcc09babb3770252b4e]
[   40.345698][    C7]  radeon_crtc_gamma_set+0xe/0x20 [radeon 31c1ee785de120fcfd0babcc09babb3770252b4e]
[   40.345760][    C7]  drm_fb_helper_debug_leave+0xd8/0x130
[   40.345763][    C7]  kgdboc_post_exp_handler+0x54/0x70
[...]

and the system hangs.

Support for kdb feels pretty much broken. Hence remove the whole kdb
support from radeon.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/atombios_crtc.c      | 74 ++++++---------------
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c | 23 ++-----
 drivers/gpu/drm/radeon/radeon_mode.h        | 10 +--
 3 files changed, 26 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/radeon/atombios_crtc.c
index 9b3a3a9d60e2..2fc0334e0d6c 100644
--- a/drivers/gpu/drm/radeon/atombios_crtc.c
+++ b/drivers/gpu/drm/radeon/atombios_crtc.c
@@ -1133,7 +1133,7 @@ static void atombios_crtc_set_pll(struct drm_crtc *crtc, struct drm_display_mode
 
 static int dce4_crtc_do_set_base(struct drm_crtc *crtc,
 				 struct drm_framebuffer *fb,
-				 int x, int y, int atomic)
+				 int x, int y)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
@@ -1150,33 +1150,23 @@ static int dce4_crtc_do_set_base(struct drm_crtc *crtc,
 	bool bypass_lut = false;
 
 	/* no fb bound */
-	if (!atomic && !crtc->primary->fb) {
+	if (!crtc->primary->fb) {
 		DRM_DEBUG_KMS("No FB bound\n");
 		return 0;
 	}
 
-	if (atomic)
-		target_fb = fb;
-	else
-		target_fb = crtc->primary->fb;
+	target_fb = crtc->primary->fb;
 
-	/* If atomic, assume fb object is pinned & idle & fenced and
-	 * just update base pointers
-	 */
 	obj = target_fb->obj[0];
 	rbo = gem_to_radeon_bo(obj);
 	r = radeon_bo_reserve(rbo, false);
 	if (unlikely(r != 0))
 		return r;
 
-	if (atomic)
-		fb_location = radeon_bo_gpu_offset(rbo);
-	else {
-		r = radeon_bo_pin(rbo, RADEON_GEM_DOMAIN_VRAM, &fb_location);
-		if (unlikely(r != 0)) {
-			radeon_bo_unreserve(rbo);
-			return -EINVAL;
-		}
+	r = radeon_bo_pin(rbo, RADEON_GEM_DOMAIN_VRAM, &fb_location);
+	if (unlikely(r != 0)) {
+		radeon_bo_unreserve(rbo);
+		return -EINVAL;
 	}
 
 	radeon_bo_get_tiling_flags(rbo, &tiling_flags, NULL);
@@ -1437,7 +1427,7 @@ static int dce4_crtc_do_set_base(struct drm_crtc *crtc,
 	/* set pageflip to happen anywhere in vblank interval */
 	WREG32(EVERGREEN_MASTER_UPDATE_MODE + radeon_crtc->crtc_offset, 0);
 
-	if (!atomic && fb && fb != crtc->primary->fb) {
+	if (fb && fb != crtc->primary->fb) {
 		rbo = gem_to_radeon_bo(fb->obj[0]);
 		r = radeon_bo_reserve(rbo, false);
 		if (unlikely(r != 0))
@@ -1454,7 +1444,7 @@ static int dce4_crtc_do_set_base(struct drm_crtc *crtc,
 
 static int avivo_crtc_do_set_base(struct drm_crtc *crtc,
 				  struct drm_framebuffer *fb,
-				  int x, int y, int atomic)
+				  int x, int y)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
@@ -1470,15 +1460,12 @@ static int avivo_crtc_do_set_base(struct drm_crtc *crtc,
 	bool bypass_lut = false;
 
 	/* no fb bound */
-	if (!atomic && !crtc->primary->fb) {
+	if (!crtc->primary->fb) {
 		DRM_DEBUG_KMS("No FB bound\n");
 		return 0;
 	}
 
-	if (atomic)
-		target_fb = fb;
-	else
-		target_fb = crtc->primary->fb;
+	target_fb = crtc->primary->fb;
 
 	obj = target_fb->obj[0];
 	rbo = gem_to_radeon_bo(obj);
@@ -1486,17 +1473,10 @@ static int avivo_crtc_do_set_base(struct drm_crtc *crtc,
 	if (unlikely(r != 0))
 		return r;
 
-	/* If atomic, assume fb object is pinned & idle & fenced and
-	 * just update base pointers
-	 */
-	if (atomic)
-		fb_location = radeon_bo_gpu_offset(rbo);
-	else {
-		r = radeon_bo_pin(rbo, RADEON_GEM_DOMAIN_VRAM, &fb_location);
-		if (unlikely(r != 0)) {
-			radeon_bo_unreserve(rbo);
-			return -EINVAL;
-		}
+	r = radeon_bo_pin(rbo, RADEON_GEM_DOMAIN_VRAM, &fb_location);
+	if (unlikely(r != 0)) {
+		radeon_bo_unreserve(rbo);
+		return -EINVAL;
 	}
 	radeon_bo_get_tiling_flags(rbo, &tiling_flags, NULL);
 	radeon_bo_unreserve(rbo);
@@ -1645,7 +1625,7 @@ static int avivo_crtc_do_set_base(struct drm_crtc *crtc,
 	/* set pageflip to happen only at start of vblank interval (front porch) */
 	WREG32(AVIVO_D1MODE_MASTER_UPDATE_MODE + radeon_crtc->crtc_offset, 3);
 
-	if (!atomic && fb && fb != crtc->primary->fb) {
+	if (fb && fb != crtc->primary->fb) {
 		rbo = gem_to_radeon_bo(fb->obj[0]);
 		r = radeon_bo_reserve(rbo, false);
 		if (unlikely(r != 0))
@@ -1667,26 +1647,11 @@ int atombios_crtc_set_base(struct drm_crtc *crtc, int x, int y,
 	struct radeon_device *rdev = dev->dev_private;
 
 	if (ASIC_IS_DCE4(rdev))
-		return dce4_crtc_do_set_base(crtc, old_fb, x, y, 0);
-	else if (ASIC_IS_AVIVO(rdev))
-		return avivo_crtc_do_set_base(crtc, old_fb, x, y, 0);
-	else
-		return radeon_crtc_do_set_base(crtc, old_fb, x, y, 0);
-}
-
-int atombios_crtc_set_base_atomic(struct drm_crtc *crtc,
-				  struct drm_framebuffer *fb,
-				  int x, int y, enum mode_set_atomic state)
-{
-	struct drm_device *dev = crtc->dev;
-	struct radeon_device *rdev = dev->dev_private;
-
-	if (ASIC_IS_DCE4(rdev))
-		return dce4_crtc_do_set_base(crtc, fb, x, y, 1);
+		return dce4_crtc_do_set_base(crtc, old_fb, x, y);
 	else if (ASIC_IS_AVIVO(rdev))
-		return avivo_crtc_do_set_base(crtc, fb, x, y, 1);
+		return avivo_crtc_do_set_base(crtc, old_fb, x, y);
 	else
-		return radeon_crtc_do_set_base(crtc, fb, x, y, 1);
+		return radeon_crtc_do_set_base(crtc, old_fb, x, y);
 }
 
 /* properly set additional regs when using atombios */
@@ -2215,7 +2180,6 @@ static const struct drm_crtc_helper_funcs atombios_helper_funcs = {
 	.mode_fixup = atombios_crtc_mode_fixup,
 	.mode_set = atombios_crtc_mode_set,
 	.mode_set_base = atombios_crtc_set_base,
-	.mode_set_base_atomic = atombios_crtc_set_base_atomic,
 	.prepare = atombios_crtc_prepare,
 	.commit = atombios_crtc_commit,
 	.disable = atombios_crtc_disable,
diff --git a/drivers/gpu/drm/radeon/radeon_legacy_crtc.c b/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
index 825b351ff53c..a1054c8094d4 100644
--- a/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
+++ b/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
@@ -360,19 +360,12 @@ static void radeon_crtc_dpms(struct drm_crtc *crtc, int mode)
 int radeon_crtc_set_base(struct drm_crtc *crtc, int x, int y,
 			 struct drm_framebuffer *old_fb)
 {
-	return radeon_crtc_do_set_base(crtc, old_fb, x, y, 0);
-}
-
-int radeon_crtc_set_base_atomic(struct drm_crtc *crtc,
-				struct drm_framebuffer *fb,
-				int x, int y, enum mode_set_atomic state)
-{
-	return radeon_crtc_do_set_base(crtc, fb, x, y, 1);
+	return radeon_crtc_do_set_base(crtc, old_fb, x, y);
 }
 
 int radeon_crtc_do_set_base(struct drm_crtc *crtc,
 			 struct drm_framebuffer *fb,
-			 int x, int y, int atomic)
+			 int x, int y)
 {
 	struct drm_device *dev = crtc->dev;
 	struct radeon_device *rdev = dev->dev_private;
@@ -390,15 +383,12 @@ int radeon_crtc_do_set_base(struct drm_crtc *crtc,
 
 	DRM_DEBUG_KMS("\n");
 	/* no fb bound */
-	if (!atomic && !crtc->primary->fb) {
+	if (!crtc->primary->fb) {
 		DRM_DEBUG_KMS("No FB bound\n");
 		return 0;
 	}
 
-	if (atomic)
-		target_fb = fb;
-	else
-		target_fb = crtc->primary->fb;
+	target_fb = crtc->primary->fb;
 
 	switch (target_fb->format->cpp[0] * 8) {
 	case 8:
@@ -445,7 +435,7 @@ int radeon_crtc_do_set_base(struct drm_crtc *crtc,
 		 * We don't shutdown the display controller because new buffer
 		 * will end up in same spot.
 		 */
-		if (!atomic && fb && fb != crtc->primary->fb) {
+		if (fb && fb != crtc->primary->fb) {
 			struct radeon_bo *old_rbo;
 			unsigned long nsize, osize;
 
@@ -555,7 +545,7 @@ int radeon_crtc_do_set_base(struct drm_crtc *crtc,
 	WREG32(RADEON_CRTC_OFFSET + radeon_crtc->crtc_offset, crtc_offset);
 	WREG32(RADEON_CRTC_PITCH + radeon_crtc->crtc_offset, crtc_pitch);
 
-	if (!atomic && fb && fb != crtc->primary->fb) {
+	if (fb && fb != crtc->primary->fb) {
 		rbo = gem_to_radeon_bo(fb->obj[0]);
 		r = radeon_bo_reserve(rbo, false);
 		if (unlikely(r != 0))
@@ -1108,7 +1098,6 @@ static const struct drm_crtc_helper_funcs legacy_helper_funcs = {
 	.mode_fixup = radeon_crtc_mode_fixup,
 	.mode_set = radeon_crtc_mode_set,
 	.mode_set_base = radeon_crtc_set_base,
-	.mode_set_base_atomic = radeon_crtc_set_base_atomic,
 	.prepare = radeon_crtc_prepare,
 	.commit = radeon_crtc_commit,
 	.disable = radeon_crtc_disable,
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 9e34da2cacef..088af85902f7 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -804,10 +804,6 @@ extern bool radeon_encoder_is_digital(struct drm_encoder *encoder);
 extern void radeon_crtc_load_lut(struct drm_crtc *crtc);
 extern int atombios_crtc_set_base(struct drm_crtc *crtc, int x, int y,
 				   struct drm_framebuffer *old_fb);
-extern int atombios_crtc_set_base_atomic(struct drm_crtc *crtc,
-					 struct drm_framebuffer *fb,
-					 int x, int y,
-					 enum mode_set_atomic state);
 extern int atombios_crtc_mode_set(struct drm_crtc *crtc,
 				   struct drm_display_mode *mode,
 				   struct drm_display_mode *adjusted_mode,
@@ -817,13 +813,9 @@ extern void atombios_crtc_dpms(struct drm_crtc *crtc, int mode);
 
 extern int radeon_crtc_set_base(struct drm_crtc *crtc, int x, int y,
 				 struct drm_framebuffer *old_fb);
-extern int radeon_crtc_set_base_atomic(struct drm_crtc *crtc,
-				       struct drm_framebuffer *fb,
-				       int x, int y,
-				       enum mode_set_atomic state);
 extern int radeon_crtc_do_set_base(struct drm_crtc *crtc,
 				   struct drm_framebuffer *fb,
-				   int x, int y, int atomic);
+				   int x, int y);
 extern int radeon_crtc_cursor_set2(struct drm_crtc *crtc,
 				   struct drm_file *file_priv,
 				   uint32_t handle,
-- 
2.51.1

