Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E39D65F63DE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 11:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B76810E276;
	Thu,  6 Oct 2022 09:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B3F10E04B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 09:54:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 01772219A7;
 Thu,  6 Oct 2022 09:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665050039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RAVHPHpfKxPs5HKAzUwTWd2iq15Brj348B8OYhSIkpY=;
 b=pyJq7qUQIZXqVsd9+J5a5slNxow9awzfc9mDYGaYkGhjkYjFsfa6dKrLmzJghiipPyqsGw
 5TkIQOr9p17H2UCTfhJ+BE/VXBKmeCeyVMMN/p+yZxU3g2CBMDkb7N3AA52v2LGlcoX5IB
 0NHkqEp48+T1SZ6gFwEsU8AfM9/ExDI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665050039;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RAVHPHpfKxPs5HKAzUwTWd2iq15Brj348B8OYhSIkpY=;
 b=NY98M6ATdFN8dInZkAZAu55GTfkoL0LUuSPWhCCVtQ3s1E3uq19A5uvhGjGq0S7reHQx6v
 gDsVZsctwL9CryCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B88D213AC8;
 Thu,  6 Oct 2022 09:53:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QOElLLalPmNnYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Oct 2022 09:53:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch
Subject: [PATCH v2 12/16] drm/udl: Add constants for display-mode registers
Date: Thu,  6 Oct 2022 11:53:51 +0200
Message-Id: <20221006095355.23579-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006095355.23579-1-tzimmermann@suse.de>
References: <20221006095355.23579-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add constants for the registers the contain various display-mode
parameters and update the mode-setting function. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/udl/udl_modeset.c | 102 ++++++++++--------------------
 drivers/gpu/drm/udl/udl_proto.h   |  15 +++++
 2 files changed, 47 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 702731bcd322..12385bcc71eb 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -126,78 +126,40 @@ static char *udl_set_register_lfsr16(char *wrptr, u8 reg, u16 value)
 }
 
 /*
- * This takes a standard fbdev screeninfo struct and all of its monitor mode
- * details and converts them into the DisplayLink equivalent register commands.
-  ERR(vreg(dev,               0x00, (color_depth == 16) ? 0 : 1));
-  ERR(vreg_lfsr16(dev,        0x01, xDisplayStart));
-  ERR(vreg_lfsr16(dev,        0x03, xDisplayEnd));
-  ERR(vreg_lfsr16(dev,        0x05, yDisplayStart));
-  ERR(vreg_lfsr16(dev,        0x07, yDisplayEnd));
-  ERR(vreg_lfsr16(dev,        0x09, xEndCount));
-  ERR(vreg_lfsr16(dev,        0x0B, hSyncStart));
-  ERR(vreg_lfsr16(dev,        0x0D, hSyncEnd));
-  ERR(vreg_big_endian(dev,    0x0F, hPixels));
-  ERR(vreg_lfsr16(dev,        0x11, yEndCount));
-  ERR(vreg_lfsr16(dev,        0x13, vSyncStart));
-  ERR(vreg_lfsr16(dev,        0x15, vSyncEnd));
-  ERR(vreg_big_endian(dev,    0x17, vPixels));
-  ERR(vreg_little_endian(dev, 0x1B, pixelClock5KHz));
-
-  ERR(vreg(dev,               0x1F, 0));
-
-  ERR(vbuf(dev, WRITE_VIDREG_UNLOCK, DSIZEOF(WRITE_VIDREG_UNLOCK)));
+ * Takes a DRM display mode and converts it into the DisplayLink
+ * equivalent register commands.
  */
-static char *udl_set_vid_cmds(char *wrptr, struct drm_display_mode *mode)
+static char *udl_set_display_mode(char *buf, struct drm_display_mode *mode)
 {
-	u16 xds, yds;
-	u16 xde, yde;
-	u16 yec;
+	u16 reg01 = mode->crtc_htotal - mode->crtc_hsync_start;
+	u16 reg03 = reg01 + mode->crtc_hdisplay;
+	u16 reg05 = mode->crtc_vtotal - mode->crtc_vsync_start;
+	u16 reg07 = reg05 + mode->crtc_vdisplay;
+	u16 reg09 = mode->crtc_htotal - 1;
+	u16 reg0b = 1; /* libdlo hardcodes hsync start to 1 */
+	u16 reg0d = mode->crtc_hsync_end - mode->crtc_hsync_start + 1;
+	u16 reg0f = mode->hdisplay;
+	u16 reg11 = mode->crtc_vtotal;
+	u16 reg13 = 0; /* libdlo hardcodes vsync start to 0 */
+	u16 reg15 = mode->crtc_vsync_end - mode->crtc_vsync_start;
+	u16 reg17 = mode->crtc_vdisplay;
+	u16 reg1b = mode->clock / 5;
+
+	buf = udl_set_register_lfsr16(buf, UDL_REG_XDISPLAYSTART, reg01);
+	buf = udl_set_register_lfsr16(buf, UDL_REG_XDISPLAYEND, reg03);
+	buf = udl_set_register_lfsr16(buf, UDL_REG_YDISPLAYSTART, reg05);
+	buf = udl_set_register_lfsr16(buf, UDL_REG_YDISPLAYEND, reg07);
+	buf = udl_set_register_lfsr16(buf, UDL_REG_XENDCOUNT, reg09);
+	buf = udl_set_register_lfsr16(buf, UDL_REG_HSYNCSTART, reg0b);
+	buf = udl_set_register_lfsr16(buf, UDL_REG_HSYNCEND, reg0d);
+	buf = udl_set_register_16(buf, UDL_REG_HPIXELS, reg0f);
+	buf = udl_set_register_lfsr16(buf, UDL_REG_YENDCOUNT, reg11);
+	buf = udl_set_register_lfsr16(buf, UDL_REG_VSYNCSTART, reg13);
+	buf = udl_set_register_lfsr16(buf, UDL_REG_VSYNCEND, reg15);
+	buf = udl_set_register_16(buf, UDL_REG_VPIXELS, reg17);
+	buf = udl_set_register_16be(buf, UDL_REG_PIXELCLOCK5KHZ, reg1b);
 
-	/* x display start */
-	xds = mode->crtc_htotal - mode->crtc_hsync_start;
-	wrptr = udl_set_register_lfsr16(wrptr, 0x01, xds);
-	/* x display end */
-	xde = xds + mode->crtc_hdisplay;
-	wrptr = udl_set_register_lfsr16(wrptr, 0x03, xde);
-
-	/* y display start */
-	yds = mode->crtc_vtotal - mode->crtc_vsync_start;
-	wrptr = udl_set_register_lfsr16(wrptr, 0x05, yds);
-	/* y display end */
-	yde = yds + mode->crtc_vdisplay;
-	wrptr = udl_set_register_lfsr16(wrptr, 0x07, yde);
-
-	/* x end count is active + blanking - 1 */
-	wrptr = udl_set_register_lfsr16(wrptr, 0x09,
-					mode->crtc_htotal - 1);
-
-	/* libdlo hardcodes hsync start to 1 */
-	wrptr = udl_set_register_lfsr16(wrptr, 0x0B, 1);
-
-	/* hsync end is width of sync pulse + 1 */
-	wrptr = udl_set_register_lfsr16(wrptr, 0x0D,
-					mode->crtc_hsync_end - mode->crtc_hsync_start + 1);
-
-	/* hpixels is active pixels */
-	wrptr = udl_set_register_16(wrptr, 0x0F, mode->hdisplay);
-
-	/* yendcount is vertical active + vertical blanking */
-	yec = mode->crtc_vtotal;
-	wrptr = udl_set_register_lfsr16(wrptr, 0x11, yec);
-
-	/* libdlo hardcodes vsync start to 0 */
-	wrptr = udl_set_register_lfsr16(wrptr, 0x13, 0);
-
-	/* vsync end is width of vsync pulse */
-	wrptr = udl_set_register_lfsr16(wrptr, 0x15, mode->crtc_vsync_end - mode->crtc_vsync_start);
-
-	/* vpixels is active pixels */
-	wrptr = udl_set_register_16(wrptr, 0x17, mode->crtc_vdisplay);
-
-	wrptr = udl_set_register_16be(wrptr, 0x1B,
-				      mode->clock / 5);
-
-	return wrptr;
+	return buf;
 }
 
 static char *udl_dummy_render(char *wrptr)
@@ -362,7 +324,7 @@ static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atom
 	buf = udl_set_base16bpp(buf, 0);
 	/* set base for 8bpp segment to end of fb */
 	buf = udl_set_base8bpp(buf, 2 * mode->vdisplay * mode->hdisplay);
-	buf = udl_set_vid_cmds(buf, mode);
+	buf = udl_set_display_mode(buf, mode);
 	buf = udl_set_blank_mode(buf, UDL_BLANKMODE_ON);
 	buf = udl_vidreg_unlock(buf);
 	buf = udl_dummy_render(buf);
diff --git a/drivers/gpu/drm/udl/udl_proto.h b/drivers/gpu/drm/udl/udl_proto.h
index 3f5b8e832b99..5a6c960bd10d 100644
--- a/drivers/gpu/drm/udl/udl_proto.h
+++ b/drivers/gpu/drm/udl/udl_proto.h
@@ -5,6 +5,21 @@
 
 #define UDL_COLORDEPTH_16BPP		0
 
+/* Display-mode settings */
+#define UDL_REG_XDISPLAYSTART		0x01
+#define UDL_REG_XDISPLAYEND		0x03
+#define UDL_REG_YDISPLAYSTART		0x05
+#define UDL_REG_YDISPLAYEND		0x07
+#define UDL_REG_XENDCOUNT		0x09
+#define UDL_REG_HSYNCSTART		0x0b
+#define UDL_REG_HSYNCEND		0x0d
+#define UDL_REG_HPIXELS			0x0f
+#define UDL_REG_YENDCOUNT		0x11
+#define UDL_REG_VSYNCSTART		0x13
+#define UDL_REG_VSYNCEND		0x15
+#define UDL_REG_VPIXELS			0x17
+#define UDL_REG_PIXELCLOCK5KHZ		0x1b
+
 /* On/Off for driving the DisplayLink framebuffer to the display */
 #define UDL_REG_BLANKMODE		0x1f
 #define UDL_BLANKMODE_ON		0x00 /* hsync and vsync on, visible */
-- 
2.37.3

