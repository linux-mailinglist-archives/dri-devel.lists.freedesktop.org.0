Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F16926258
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 15:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C36010E862;
	Wed,  3 Jul 2024 13:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="MiQ101yk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GOfbp4zt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MiQ101yk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GOfbp4zt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77EA910E860
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 13:55:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1F3A821BBF;
 Wed,  3 Jul 2024 13:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720014906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7J+Cp+KDKQlmLBKQJNaMRIhBPt3b16PiyuSJ/bBzG2c=;
 b=MiQ101ykJyQx2jKu8EV2gJneOwYzlLFah9lDc5f2Zj8GmnVGX7kmNf3ml3loJ/oCWwP/sI
 BFIYe7GRmUYcUBdvgyUIJN6BR3gkWpfOSYuSBR0Go/4llo38Dbif1E5OnTcDmL1mjDXW48
 PwWN4XFCSPCWVoWuq7xU4YeZ7UiGxps=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720014906;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7J+Cp+KDKQlmLBKQJNaMRIhBPt3b16PiyuSJ/bBzG2c=;
 b=GOfbp4ztTAcz+BPRyht1ZRhbepqAlXNtSe4NU1utCxjvLenIK+teGlfE3RhKVVt9nME/0J
 5ysKLbSxA/YVTJBQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MiQ101yk;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GOfbp4zt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720014906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7J+Cp+KDKQlmLBKQJNaMRIhBPt3b16PiyuSJ/bBzG2c=;
 b=MiQ101ykJyQx2jKu8EV2gJneOwYzlLFah9lDc5f2Zj8GmnVGX7kmNf3ml3loJ/oCWwP/sI
 BFIYe7GRmUYcUBdvgyUIJN6BR3gkWpfOSYuSBR0Go/4llo38Dbif1E5OnTcDmL1mjDXW48
 PwWN4XFCSPCWVoWuq7xU4YeZ7UiGxps=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720014906;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7J+Cp+KDKQlmLBKQJNaMRIhBPt3b16PiyuSJ/bBzG2c=;
 b=GOfbp4ztTAcz+BPRyht1ZRhbepqAlXNtSe4NU1utCxjvLenIK+teGlfE3RhKVVt9nME/0J
 5ysKLbSxA/YVTJBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DC77613A7F;
 Wed,  3 Jul 2024 13:55:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kEOYNDlYhWZSMwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Jul 2024 13:55:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/4] drm/mgag200: Only set VIDRST bits in CRTC modesetting
Date: Wed,  3 Jul 2024 15:40:03 +0200
Message-ID: <20240703135502.29190-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703135502.29190-1-tzimmermann@suse.de>
References: <20240703135502.29190-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1F3A821BBF
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_COUNT_TWO(0.00)[2]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCPT_COUNT_SEVEN(0.00)[8];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FROM_HAS_DN(0.00)[]; DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

The VRSTEN and HRSTEN bits control whether a CRTC synchronizes its
display signal with an external source on the VIDRST pin. The G200WB
and G200EW3 models synchronize with a BMC chip, but different external
video encoders, such as the Matrox Maven, can also be attached to the
pin.

Only set VRSTEN and HRSTEN bits in the CRTC mode-setting code, so the
driver maintains the bits independently from the BMC. Add the field
set_vidrst to the CRTC state for this purpose. Off by default, control
the CRTC VIDRST setting from the BMC's atomic_check helper. So if a
BMC (or another external clock) requires synchronization, it instructs
the CRTC to synchronize.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_bmc.c    | 26 +++++++++++++++++++-----
 drivers/gpu/drm/mgag200/mgag200_drv.h    |  5 ++++-
 drivers/gpu/drm/mgag200/mgag200_g200er.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c   | 11 ++++++----
 6 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c b/drivers/gpu/drm/mgag200/mgag200_bmc.c
index 23ef85aa7e37..cb5400333862 100644
--- a/drivers/gpu/drm/mgag200/mgag200_bmc.c
+++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
@@ -77,11 +77,6 @@ void mgag200_bmc_enable_vidrst(struct mga_device *mdev)
 {
 	u8 tmp;
 
-	/* Ensure that the vrsten and hrsten are set */
-	WREG8(MGAREG_CRTCEXT_INDEX, 1);
-	tmp = RREG8(MGAREG_CRTCEXT_DATA);
-	WREG8(MGAREG_CRTCEXT_DATA, tmp | 0x88);
-
 	/* Assert rstlvl2 */
 	WREG8(DAC_INDEX, MGA1064_REMHEADCTL2);
 	tmp = RREG8(DAC_DATA);
@@ -108,6 +103,25 @@ void mgag200_bmc_enable_vidrst(struct mga_device *mdev)
 	WREG_DAC(MGA1064_GEN_IO_DATA, tmp);
 }
 
+static int mgag200_bmc_encoder_helper_atomic_check(struct drm_encoder *encoder,
+						   struct drm_crtc_state *crtc_state,
+						   struct drm_connector_state *conn_state)
+{
+	struct mga_device *mdev = to_mga_device(encoder->dev);
+	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
+
+	if (mdev->info->has_vidrst)
+		mgag200_crtc_state->set_vidrst = true;
+	else
+		mgag200_crtc_state->set_vidrst = false;
+
+	return 0;
+}
+
+static const struct drm_encoder_helper_funcs mgag200_bmc_encoder_helper_funcs = {
+	.atomic_check = mgag200_bmc_encoder_helper_atomic_check,
+};
+
 static const struct drm_encoder_funcs mgag200_bmc_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
@@ -190,6 +204,8 @@ int mgag200_bmc_output_init(struct mga_device *mdev, struct drm_connector *physi
 			       DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret)
 		return ret;
+	drm_encoder_helper_add(encoder, &mgag200_bmc_encoder_helper_funcs);
+
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
 	bmc_connector = &mdev->output.bmc.bmc_connector;
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 7f7dfbd0f013..4b75613de882 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -179,6 +179,8 @@ struct mgag200_crtc_state {
 	const struct drm_format_info *format;
 
 	struct mgag200_pll_values pixpllc;
+
+	bool set_vidrst;
 };
 
 static inline struct mgag200_crtc_state *to_mgag200_crtc_state(struct drm_crtc_state *base)
@@ -430,7 +432,8 @@ void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_st
 	.atomic_duplicate_state = mgag200_crtc_atomic_duplicate_state, \
 	.atomic_destroy_state = mgag200_crtc_atomic_destroy_state
 
-void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode);
+void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode,
+			   bool set_vidrst);
 void mgag200_set_format_regs(struct mga_device *mdev, const struct drm_format_info *format);
 void mgag200_enable_display(struct mga_device *mdev);
 void mgag200_init_registers(struct mga_device *mdev);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index 4e8a1756138d..abfbed6ec390 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -195,7 +195,7 @@ static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 		funcs->disable_vidrst(mdev);
 
 	mgag200_set_format_regs(mdev, format);
-	mgag200_set_mode_regs(mdev, adjusted_mode);
+	mgag200_set_mode_regs(mdev, adjusted_mode, mgag200_crtc_state->set_vidrst);
 
 	if (funcs->pixpllc_atomic_update)
 		funcs->pixpllc_atomic_update(crtc, old_state);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index d884f3cb0ec7..acc99999e2b5 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -196,7 +196,7 @@ static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 		funcs->disable_vidrst(mdev);
 
 	mgag200_set_format_regs(mdev, format);
-	mgag200_set_mode_regs(mdev, adjusted_mode);
+	mgag200_set_mode_regs(mdev, adjusted_mode, mgag200_crtc_state->set_vidrst);
 
 	if (funcs->pixpllc_atomic_update)
 		funcs->pixpllc_atomic_update(crtc, old_state);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index a824bb8ad579..be4e124102c6 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -327,7 +327,7 @@ static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 		funcs->disable_vidrst(mdev);
 
 	mgag200_set_format_regs(mdev, format);
-	mgag200_set_mode_regs(mdev, adjusted_mode);
+	mgag200_set_mode_regs(mdev, adjusted_mode, mgag200_crtc_state->set_vidrst);
 
 	if (funcs->pixpllc_atomic_update)
 		funcs->pixpllc_atomic_update(crtc, old_state);
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index bb6204002cb3..4f4612192e30 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -201,9 +201,9 @@ void mgag200_init_registers(struct mga_device *mdev)
 	WREG8(MGA_MISC_OUT, misc);
 }
 
-void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode)
+void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode,
+			   bool set_vidrst)
 {
-	const struct mgag200_device_info *info = mdev->info;
 	unsigned int hdisplay, hsyncstart, hsyncend, htotal;
 	unsigned int vdisplay, vsyncstart, vsyncend, vtotal;
 	u8 misc, crtcext1, crtcext2, crtcext5;
@@ -238,9 +238,11 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
 		   ((hdisplay & 0x100) >> 7) |
 		   ((hsyncstart & 0x100) >> 6) |
 		    (htotal & 0x40);
-	if (info->has_vidrst)
+	if (set_vidrst)
 		crtcext1 |= MGAREG_CRTCEXT1_VRSTEN |
 			    MGAREG_CRTCEXT1_HRSTEN;
+	else
+		crtcext1 &= ~(MGAREG_CRTCEXT1_VRSTEN | MGAREG_CRTCEXT1_HRSTEN);
 
 	crtcext2 = ((vtotal & 0xc00) >> 10) |
 		   ((vdisplay & 0x400) >> 8) |
@@ -656,7 +658,7 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
 		funcs->disable_vidrst(mdev);
 
 	mgag200_set_format_regs(mdev, format);
-	mgag200_set_mode_regs(mdev, adjusted_mode);
+	mgag200_set_mode_regs(mdev, adjusted_mode, mgag200_crtc_state->set_vidrst);
 
 	if (funcs->pixpllc_atomic_update)
 		funcs->pixpllc_atomic_update(crtc, old_state);
@@ -717,6 +719,7 @@ struct drm_crtc_state *mgag200_crtc_atomic_duplicate_state(struct drm_crtc *crtc
 	new_mgag200_crtc_state->format = mgag200_crtc_state->format;
 	memcpy(&new_mgag200_crtc_state->pixpllc, &mgag200_crtc_state->pixpllc,
 	       sizeof(new_mgag200_crtc_state->pixpllc));
+	new_mgag200_crtc_state->set_vidrst = mgag200_crtc_state->set_vidrst;
 
 	return &new_mgag200_crtc_state->base;
 }
-- 
2.45.2

