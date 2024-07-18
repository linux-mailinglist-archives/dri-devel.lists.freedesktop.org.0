Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D50934BD9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 12:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7353810E73A;
	Thu, 18 Jul 2024 10:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DE910E73C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 10:45:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5482B1FBBC;
 Thu, 18 Jul 2024 10:45:55 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 13DDE136F7;
 Thu, 18 Jul 2024 10:45:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GO2rA2PymGbeUAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Jul 2024 10:45:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, sam@ravnborg.org,
 emil.l.velikov@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 2/7] drm/mgag200: Align register field names with
 documentation
Date: Thu, 18 Jul 2024 12:44:12 +0200
Message-ID: <20240718104551.575912-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718104551.575912-1-tzimmermann@suse.de>
References: <20240718104551.575912-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: 5482B1FBBC
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 TAGGED_RCPT(0.00)[]
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Score: -4.00
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
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 54 +++++++++++++-------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 18b127841dd9..6a0477426c07 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -204,12 +204,12 @@ void mgag200_init_registers(struct mga_device *mdev)
 void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode,
 			   bool set_vidrst)
 {
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
+		   ((hdispend & 0x100) >> 7) |
+		   ((hsyncstr & 0x100) >> 6) |
 		    (htotal & 0x40);
 	if (set_vidrst)
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

