Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87CA92882F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 13:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1A510EB78;
	Fri,  5 Jul 2024 11:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="fqdu27Uf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="isPYFSLe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fqdu27Uf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="isPYFSLe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C8610EB78
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 11:49:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8BBD621923;
 Fri,  5 Jul 2024 11:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720180146; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UHHV4gQy76cYap6RseEXnINexEmR1KmikzjY62BR+wg=;
 b=fqdu27UfgPbrt7HyPHa4gerQEXy2CGHpx3v5fKd1+2lals43B8vI6qeI/f1acp3xZtPult
 fWvOPWCB/rrBai7FzP8vqTrcxwi4iwqPOlbv5ZiXqxEipH3Px5bkQNPHQ4Kdj7+YFUTVo2
 xTm1+Ts0a6gs0c9nHRLwDEhcRtc4w/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720180146;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UHHV4gQy76cYap6RseEXnINexEmR1KmikzjY62BR+wg=;
 b=isPYFSLeZEclAlHvg9rerH8ZveoyccHo19XLqNAEi+GIDVz5KixZJ7q1Gijof2GNyXWh1j
 +2C/fu3Bz0mscjBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fqdu27Uf;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=isPYFSLe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720180146; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UHHV4gQy76cYap6RseEXnINexEmR1KmikzjY62BR+wg=;
 b=fqdu27UfgPbrt7HyPHa4gerQEXy2CGHpx3v5fKd1+2lals43B8vI6qeI/f1acp3xZtPult
 fWvOPWCB/rrBai7FzP8vqTrcxwi4iwqPOlbv5ZiXqxEipH3Px5bkQNPHQ4Kdj7+YFUTVo2
 xTm1+Ts0a6gs0c9nHRLwDEhcRtc4w/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720180146;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UHHV4gQy76cYap6RseEXnINexEmR1KmikzjY62BR+wg=;
 b=isPYFSLeZEclAlHvg9rerH8ZveoyccHo19XLqNAEi+GIDVz5KixZJ7q1Gijof2GNyXWh1j
 +2C/fu3Bz0mscjBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 471AD13889;
 Fri,  5 Jul 2024 11:49:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MBssELLdh2bUcQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Jul 2024 11:49:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, sam@ravnborg.org,
 emil.l.velikov@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 2/7] drm/mgag200: Align register field names with
 documentation
Date: Fri,  5 Jul 2024 13:47:45 +0200
Message-ID: <20240705114900.572-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705114900.572-1-tzimmermann@suse.de>
References: <20240705114900.572-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 TO_DN_SOME(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ravnborg.org,gmail.com,linux.intel.com,kernel.org,ffwll.ch];
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[10]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 8BBD621923
X-Spam-Flag: NO
X-Spam-Score: -1.51
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

In mgag200_set_mode_regs(), align variable names with the field names
given in the Matrox programming manuals. Makes the code and docs grep-
able.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 56 +++++++++++++-------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 4ceaa33e8d42..09e2a5b80403 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -204,12 +204,12 @@ void mgag200_init_registers(struct mga_device *mdev)
 void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode)
 {
 	const struct mgag200_device_info *info = mdev->info;
-	unsigned int hdisplay, hsyncstart, hsyncend, htotal;
-	unsigned int vdisplay, vsyncstart, vsyncend, vtotal;
+	unsigned int hdispend, hsyncstr, hsyncend, htotal;
+	unsigned int vdispend, vsyncstr, vsyncend, vtotal;
 	u8 misc, crtcext1, crtcext2, crtcext5;
 
-	hdisplay = mode->hdisplay / 8 - 1;
-	hsyncstart = mode->hsync_start / 8 - 1;
+	hdispend = mode->hdisplay / 8 - 1;
+	hsyncstr = mode->hsync_start / 8 - 1;
 	hsyncend = mode->hsync_end / 8 - 1;
 	htotal = mode->htotal / 8 - 1;
 
@@ -217,8 +217,8 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
 	if ((htotal & 0x07) == 0x06 || (htotal & 0x07) == 0x04)
 		htotal++;
 
-	vdisplay = mode->vdisplay - 1;
-	vsyncstart = mode->vsync_start - 1;
+	vdispend = mode->vdisplay - 1;
+	vsyncstr = mode->vsync_start - 1;
 	vsyncend = mode->vsync_end - 1;
 	vtotal = mode->vtotal - 2;
 
@@ -235,45 +235,45 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
 		misc &= ~MGAREG_MISC_VSYNCPOL;
 
 	crtcext1 = (((htotal - 4) & 0x100) >> 8) |
-		   ((hdisplay & 0x100) >> 7) |
-		   ((hsyncstart & 0x100) >> 6) |
-		    (htotal & 0x40);
+		    ((hdispend & 0x100) >> 7) |
+		    ((hsyncstr & 0x100) >> 6) |
+		     (htotal & 0x40);
 	if (info->has_vidrst)
 		crtcext1 |= MGAREG_CRTCEXT1_VRSTEN |
 			    MGAREG_CRTCEXT1_HRSTEN;
 
 	crtcext2 = ((vtotal & 0xc00) >> 10) |
-		   ((vdisplay & 0x400) >> 8) |
-		   ((vdisplay & 0xc00) >> 7) |
-		   ((vsyncstart & 0xc00) >> 5) |
-		   ((vdisplay & 0x400) >> 3);
+		   ((vdispend & 0x400) >> 8) |
+		   ((vdispend & 0xc00) >> 7) |
+		   ((vsyncstr & 0xc00) >> 5) |
+		   ((vdispend & 0x400) >> 3);
 	crtcext5 = 0x00;
 
 	WREG_CRT(0x00, htotal - 4);
-	WREG_CRT(0x01, hdisplay);
-	WREG_CRT(0x02, hdisplay);
+	WREG_CRT(0x01, hdispend);
+	WREG_CRT(0x02, hdispend);
 	WREG_CRT(0x03, (htotal & 0x1f) | 0x80);
-	WREG_CRT(0x04, hsyncstart);
+	WREG_CRT(0x04, hsyncstr);
 	WREG_CRT(0x05, ((htotal & 0x20) << 2) | (hsyncend & 0x1f));
 	WREG_CRT(0x06, vtotal & 0xff);
 	WREG_CRT(0x07, ((vtotal & 0x100) >> 8) |
-		       ((vdisplay & 0x100) >> 7) |
-		       ((vsyncstart & 0x100) >> 6) |
-		       ((vdisplay & 0x100) >> 5) |
-		       ((vdisplay & 0x100) >> 4) | /* linecomp */
+		       ((vdispend & 0x100) >> 7) |
+		       ((vsyncstr & 0x100) >> 6) |
+		       ((vdispend & 0x100) >> 5) |
+		       ((vdispend & 0x100) >> 4) | /* linecomp */
 		       ((vtotal & 0x200) >> 4) |
-		       ((vdisplay & 0x200) >> 3) |
-		       ((vsyncstart & 0x200) >> 2));
-	WREG_CRT(0x09, ((vdisplay & 0x200) >> 4) |
-		       ((vdisplay & 0x200) >> 3));
-	WREG_CRT(0x10, vsyncstart & 0xff);
+		       ((vdispend & 0x200) >> 3) |
+		       ((vsyncstr & 0x200) >> 2));
+	WREG_CRT(0x09, ((vdispend & 0x200) >> 4) |
+		       ((vdispend & 0x200) >> 3));
+	WREG_CRT(0x10, vsyncstr & 0xff);
 	WREG_CRT(0x11, (vsyncend & 0x0f) | 0x20);
-	WREG_CRT(0x12, vdisplay & 0xff);
+	WREG_CRT(0x12, vdispend & 0xff);
 	WREG_CRT(0x14, 0);
-	WREG_CRT(0x15, vdisplay & 0xff);
+	WREG_CRT(0x15, vdispend & 0xff);
 	WREG_CRT(0x16, (vtotal + 1) & 0xff);
 	WREG_CRT(0x17, 0xc3);
-	WREG_CRT(0x18, vdisplay & 0xff);
+	WREG_CRT(0x18, vdispend & 0xff);
 
 	WREG_ECRT(0x01, crtcext1);
 	WREG_ECRT(0x02, crtcext2);
-- 
2.45.2

