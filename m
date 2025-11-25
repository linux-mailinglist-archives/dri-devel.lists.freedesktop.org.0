Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E54B5C85168
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 14:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6110110E080;
	Tue, 25 Nov 2025 13:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PvrdcP/4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i+WvfWyp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PvrdcP/4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i+WvfWyp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D469E10E3D8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 13:06:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7A27F5BD0D;
 Tue, 25 Nov 2025 13:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764076001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0sC2HJYxKCzy96Ro96xgmCeeBmGBvc+kZjWBpAXpVtA=;
 b=PvrdcP/4RwHsOxcWskpYm/MUChy1s0hRFoPT4nejjtypeWjmXSYHwOcoo0bmin3H3xI/Tn
 vpxwaGhzYHOII0CB2CwJK3B2inw1VDuBrSxwjq9REU4Q+LkaxqVNaDeyx/xJVLY+aLqZKW
 CdZtfLF3hlvn3OEvDoPXGoAd2U3tiyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764076001;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0sC2HJYxKCzy96Ro96xgmCeeBmGBvc+kZjWBpAXpVtA=;
 b=i+WvfWyp3SKoSMBItTJ6aSp4JRw1wrsDO11R/4XTPaonjudptsuLRO1hAnJWs2qvGJQ7/f
 ktUu20xPNW4RU6Dg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="PvrdcP/4";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=i+WvfWyp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764076001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0sC2HJYxKCzy96Ro96xgmCeeBmGBvc+kZjWBpAXpVtA=;
 b=PvrdcP/4RwHsOxcWskpYm/MUChy1s0hRFoPT4nejjtypeWjmXSYHwOcoo0bmin3H3xI/Tn
 vpxwaGhzYHOII0CB2CwJK3B2inw1VDuBrSxwjq9REU4Q+LkaxqVNaDeyx/xJVLY+aLqZKW
 CdZtfLF3hlvn3OEvDoPXGoAd2U3tiyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764076001;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0sC2HJYxKCzy96Ro96xgmCeeBmGBvc+kZjWBpAXpVtA=;
 b=i+WvfWyp3SKoSMBItTJ6aSp4JRw1wrsDO11R/4XTPaonjudptsuLRO1hAnJWs2qvGJQ7/f
 ktUu20xPNW4RU6Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ECAE63EA65;
 Tue, 25 Nov 2025 13:06:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +GNcOOCpJWkDFAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Nov 2025 13:06:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, lyude@redhat.com, dakr@kernel.org, deller@gmx.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jason.wessel@windriver.com, danielt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/5] drm/amdgpu: Do not implement mode_set_base_atomic callback
Date: Tue, 25 Nov 2025 13:52:13 +0100
Message-ID: <20251125130634.1080966-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251125130634.1080966-1-tzimmermann@suse.de>
References: <20251125130634.1080966-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7A27F5BD0D
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[19];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,amd.com,redhat.com,kernel.org,gmx.de,linux.intel.com,windriver.com,chromium.org];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 R_RATELIMIT(0.00)[to_ip_from(RLgosu6qu4h11rje89ht7rjgg5)];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
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

Remove all implementations of the CRTC helper mode_set_base_atomic
from amdgpu. It pretends to provide mode setting for kdb debugging,
but has been broken for some time.

Kdb output has been supported only for non-atomic mode setting since
commit 9c79e0b1d096 ("drm/fb-helper: Give up on kgdb for atomic drivers")
from 2017.

While amdgpu provides non-atomic mode setting for some devices, kdb
assumes that the GEM buffer object is at a fixed location in video
memory. This has not been the case since commit 087451f372bf ("drm/amdgpu:
use generic fb helpers instead of setting up AMD own's.") from 2021.
Fbdev-ttm helpers use a shadow buffer with a movable GEM buffer object.
Triggering kdb does not update the display.

Hence remove the whole kdb support from amdgpu.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c | 35 ++++++++------------------
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c  | 35 ++++++++------------------
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c  | 35 ++++++++------------------
 3 files changed, 33 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 72ca6538b2e4..61302204e9b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -1838,7 +1838,7 @@ static void dce_v10_0_grph_enable(struct drm_crtc *crtc, bool enable)
 
 static int dce_v10_0_crtc_do_set_base(struct drm_crtc *crtc,
 				     struct drm_framebuffer *fb,
-				     int x, int y, int atomic)
+				     int x, int y)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
@@ -1855,15 +1855,12 @@ static int dce_v10_0_crtc_do_set_base(struct drm_crtc *crtc,
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
 
 	/* If atomic, assume fb object is pinned & idle & fenced and
 	 * just update base pointers
@@ -1874,13 +1871,11 @@ static int dce_v10_0_crtc_do_set_base(struct drm_crtc *crtc,
 	if (unlikely(r != 0))
 		return r;
 
-	if (!atomic) {
-		abo->flags |= AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
-		r = amdgpu_bo_pin(abo, AMDGPU_GEM_DOMAIN_VRAM);
-		if (unlikely(r != 0)) {
-			amdgpu_bo_unreserve(abo);
-			return -EINVAL;
-		}
+	abo->flags |= AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
+	r = amdgpu_bo_pin(abo, AMDGPU_GEM_DOMAIN_VRAM);
+	if (unlikely(r != 0)) {
+		amdgpu_bo_unreserve(abo);
+		return -EINVAL;
 	}
 	fb_location = amdgpu_bo_gpu_offset(abo);
 
@@ -2068,7 +2063,7 @@ static int dce_v10_0_crtc_do_set_base(struct drm_crtc *crtc,
 	/* set pageflip to happen anywhere in vblank interval */
 	WREG32(mmMASTER_UPDATE_MODE + amdgpu_crtc->crtc_offset, 0);
 
-	if (!atomic && fb && fb != crtc->primary->fb) {
+	if (fb && fb != crtc->primary->fb) {
 		abo = gem_to_amdgpu_bo(fb->obj[0]);
 		r = amdgpu_bo_reserve(abo, true);
 		if (unlikely(r != 0))
@@ -2611,7 +2606,7 @@ static int dce_v10_0_crtc_mode_set(struct drm_crtc *crtc,
 
 	amdgpu_atombios_crtc_set_pll(crtc, adjusted_mode);
 	amdgpu_atombios_crtc_set_dtd_timing(crtc, adjusted_mode);
-	dce_v10_0_crtc_do_set_base(crtc, old_fb, x, y, 0);
+	dce_v10_0_crtc_do_set_base(crtc, old_fb, x, y);
 	amdgpu_atombios_crtc_overscan_setup(crtc, mode, adjusted_mode);
 	amdgpu_atombios_crtc_scaler_setup(crtc);
 	dce_v10_0_cursor_reset(crtc);
@@ -2659,14 +2654,7 @@ static bool dce_v10_0_crtc_mode_fixup(struct drm_crtc *crtc,
 static int dce_v10_0_crtc_set_base(struct drm_crtc *crtc, int x, int y,
 				  struct drm_framebuffer *old_fb)
 {
-	return dce_v10_0_crtc_do_set_base(crtc, old_fb, x, y, 0);
-}
-
-static int dce_v10_0_crtc_set_base_atomic(struct drm_crtc *crtc,
-					 struct drm_framebuffer *fb,
-					 int x, int y, enum mode_set_atomic state)
-{
-	return dce_v10_0_crtc_do_set_base(crtc, fb, x, y, 1);
+	return dce_v10_0_crtc_do_set_base(crtc, old_fb, x, y);
 }
 
 static const struct drm_crtc_helper_funcs dce_v10_0_crtc_helper_funcs = {
@@ -2674,7 +2662,6 @@ static const struct drm_crtc_helper_funcs dce_v10_0_crtc_helper_funcs = {
 	.mode_fixup = dce_v10_0_crtc_mode_fixup,
 	.mode_set = dce_v10_0_crtc_mode_set,
 	.mode_set_base = dce_v10_0_crtc_set_base,
-	.mode_set_base_atomic = dce_v10_0_crtc_set_base_atomic,
 	.prepare = dce_v10_0_crtc_prepare,
 	.commit = dce_v10_0_crtc_commit,
 	.disable = dce_v10_0_crtc_disable,
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index acc887a58518..8f4b4c2e36b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -1876,7 +1876,7 @@ static void dce_v6_0_grph_enable(struct drm_crtc *crtc, bool enable)
 
 static int dce_v6_0_crtc_do_set_base(struct drm_crtc *crtc,
 				     struct drm_framebuffer *fb,
-				     int x, int y, int atomic)
+				     int x, int y)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
@@ -1892,15 +1892,12 @@ static int dce_v6_0_crtc_do_set_base(struct drm_crtc *crtc,
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
 
 	/* If atomic, assume fb object is pinned & idle & fenced and
 	 * just update base pointers
@@ -1911,13 +1908,11 @@ static int dce_v6_0_crtc_do_set_base(struct drm_crtc *crtc,
 	if (unlikely(r != 0))
 		return r;
 
-	if (!atomic) {
-		abo->flags |= AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
-		r = amdgpu_bo_pin(abo, AMDGPU_GEM_DOMAIN_VRAM);
-		if (unlikely(r != 0)) {
-			amdgpu_bo_unreserve(abo);
-			return -EINVAL;
-		}
+	abo->flags |= AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
+	r = amdgpu_bo_pin(abo, AMDGPU_GEM_DOMAIN_VRAM);
+	if (unlikely(r != 0)) {
+		amdgpu_bo_unreserve(abo);
+		return -EINVAL;
 	}
 	fb_location = amdgpu_bo_gpu_offset(abo);
 
@@ -2083,7 +2078,7 @@ static int dce_v6_0_crtc_do_set_base(struct drm_crtc *crtc,
 	/* set pageflip to happen anywhere in vblank interval */
 	WREG32(mmMASTER_UPDATE_MODE + amdgpu_crtc->crtc_offset, 0);
 
-	if (!atomic && fb && fb != crtc->primary->fb) {
+	if (fb && fb != crtc->primary->fb) {
 		abo = gem_to_amdgpu_bo(fb->obj[0]);
 		r = amdgpu_bo_reserve(abo, true);
 		if (unlikely(r != 0))
@@ -2578,7 +2573,7 @@ static int dce_v6_0_crtc_mode_set(struct drm_crtc *crtc,
 
 	amdgpu_atombios_crtc_set_pll(crtc, adjusted_mode);
 	amdgpu_atombios_crtc_set_dtd_timing(crtc, adjusted_mode);
-	dce_v6_0_crtc_do_set_base(crtc, old_fb, x, y, 0);
+	dce_v6_0_crtc_do_set_base(crtc, old_fb, x, y);
 	amdgpu_atombios_crtc_overscan_setup(crtc, mode, adjusted_mode);
 	amdgpu_atombios_crtc_scaler_setup(crtc);
 	dce_v6_0_cursor_reset(crtc);
@@ -2626,14 +2621,7 @@ static bool dce_v6_0_crtc_mode_fixup(struct drm_crtc *crtc,
 static int dce_v6_0_crtc_set_base(struct drm_crtc *crtc, int x, int y,
 				  struct drm_framebuffer *old_fb)
 {
-	return dce_v6_0_crtc_do_set_base(crtc, old_fb, x, y, 0);
-}
-
-static int dce_v6_0_crtc_set_base_atomic(struct drm_crtc *crtc,
-					 struct drm_framebuffer *fb,
-					 int x, int y, enum mode_set_atomic state)
-{
-	return dce_v6_0_crtc_do_set_base(crtc, fb, x, y, 1);
+	return dce_v6_0_crtc_do_set_base(crtc, old_fb, x, y);
 }
 
 static const struct drm_crtc_helper_funcs dce_v6_0_crtc_helper_funcs = {
@@ -2641,7 +2629,6 @@ static const struct drm_crtc_helper_funcs dce_v6_0_crtc_helper_funcs = {
 	.mode_fixup = dce_v6_0_crtc_mode_fixup,
 	.mode_set = dce_v6_0_crtc_mode_set,
 	.mode_set_base = dce_v6_0_crtc_set_base,
-	.mode_set_base_atomic = dce_v6_0_crtc_set_base_atomic,
 	.prepare = dce_v6_0_crtc_prepare,
 	.commit = dce_v6_0_crtc_commit,
 	.disable = dce_v6_0_crtc_disable,
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index 2ccd6aad8dd6..9d1853c41fcd 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -1785,7 +1785,7 @@ static void dce_v8_0_grph_enable(struct drm_crtc *crtc, bool enable)
 
 static int dce_v8_0_crtc_do_set_base(struct drm_crtc *crtc,
 				     struct drm_framebuffer *fb,
-				     int x, int y, int atomic)
+				     int x, int y)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
@@ -1802,15 +1802,12 @@ static int dce_v8_0_crtc_do_set_base(struct drm_crtc *crtc,
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
 
 	/* If atomic, assume fb object is pinned & idle & fenced and
 	 * just update base pointers
@@ -1821,13 +1818,11 @@ static int dce_v8_0_crtc_do_set_base(struct drm_crtc *crtc,
 	if (unlikely(r != 0))
 		return r;
 
-	if (!atomic) {
-		abo->flags |= AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
-		r = amdgpu_bo_pin(abo, AMDGPU_GEM_DOMAIN_VRAM);
-		if (unlikely(r != 0)) {
-			amdgpu_bo_unreserve(abo);
-			return -EINVAL;
-		}
+	abo->flags |= AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
+	r = amdgpu_bo_pin(abo, AMDGPU_GEM_DOMAIN_VRAM);
+	if (unlikely(r != 0)) {
+		amdgpu_bo_unreserve(abo);
+		return -EINVAL;
 	}
 	fb_location = amdgpu_bo_gpu_offset(abo);
 
@@ -1995,7 +1990,7 @@ static int dce_v8_0_crtc_do_set_base(struct drm_crtc *crtc,
 	/* set pageflip to happen anywhere in vblank interval */
 	WREG32(mmMASTER_UPDATE_MODE + amdgpu_crtc->crtc_offset, 0);
 
-	if (!atomic && fb && fb != crtc->primary->fb) {
+	if (fb && fb != crtc->primary->fb) {
 		abo = gem_to_amdgpu_bo(fb->obj[0]);
 		r = amdgpu_bo_reserve(abo, true);
 		if (unlikely(r != 0))
@@ -2537,7 +2532,7 @@ static int dce_v8_0_crtc_mode_set(struct drm_crtc *crtc,
 
 	amdgpu_atombios_crtc_set_pll(crtc, adjusted_mode);
 	amdgpu_atombios_crtc_set_dtd_timing(crtc, adjusted_mode);
-	dce_v8_0_crtc_do_set_base(crtc, old_fb, x, y, 0);
+	dce_v8_0_crtc_do_set_base(crtc, old_fb, x, y);
 	amdgpu_atombios_crtc_overscan_setup(crtc, mode, adjusted_mode);
 	amdgpu_atombios_crtc_scaler_setup(crtc);
 	dce_v8_0_cursor_reset(crtc);
@@ -2585,14 +2580,7 @@ static bool dce_v8_0_crtc_mode_fixup(struct drm_crtc *crtc,
 static int dce_v8_0_crtc_set_base(struct drm_crtc *crtc, int x, int y,
 				  struct drm_framebuffer *old_fb)
 {
-	return dce_v8_0_crtc_do_set_base(crtc, old_fb, x, y, 0);
-}
-
-static int dce_v8_0_crtc_set_base_atomic(struct drm_crtc *crtc,
-					 struct drm_framebuffer *fb,
-					 int x, int y, enum mode_set_atomic state)
-{
-	return dce_v8_0_crtc_do_set_base(crtc, fb, x, y, 1);
+	return dce_v8_0_crtc_do_set_base(crtc, old_fb, x, y);
 }
 
 static const struct drm_crtc_helper_funcs dce_v8_0_crtc_helper_funcs = {
@@ -2600,7 +2588,6 @@ static const struct drm_crtc_helper_funcs dce_v8_0_crtc_helper_funcs = {
 	.mode_fixup = dce_v8_0_crtc_mode_fixup,
 	.mode_set = dce_v8_0_crtc_mode_set,
 	.mode_set_base = dce_v8_0_crtc_set_base,
-	.mode_set_base_atomic = dce_v8_0_crtc_set_base_atomic,
 	.prepare = dce_v8_0_crtc_prepare,
 	.commit = dce_v8_0_crtc_commit,
 	.disable = dce_v8_0_crtc_disable,
-- 
2.51.1

