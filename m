Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 690BB5BCC7F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 15:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D8910E623;
	Mon, 19 Sep 2022 13:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD6F10E621
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 13:04:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D33DB22342;
 Mon, 19 Sep 2022 13:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663592653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8bODnT4X0SXP9xq7lpQTceG4+5enQP0hPvpPLRiOKc=;
 b=BPBM7OoLSJ6tAVw9o74uhkajS8zZzdXUM6sHOSpJ/HjfJU+1J1SFvXyzV7Y2yGAVLnjEmN
 qXgI5Aj8e4lFh00Wz1krIIPTI41p/F9ExgkBi4HZ2EBmlJPNLb+4uSNbU9XMhvFlHscqo3
 lxM35F5+n2zBlEWoZo6xF7Jalf4qlWw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663592653;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8bODnT4X0SXP9xq7lpQTceG4+5enQP0hPvpPLRiOKc=;
 b=doJUfMaOTk88kw5jr2KVRTeGJZunU+MBbz2oUmOxF4DgaVUfRKougbz7SBO1BtMxpPt+l9
 wtbhMBSFVUNuw6AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B13D913A96;
 Mon, 19 Sep 2022 13:04:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MBQjKs1oKGMzOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Sep 2022 13:04:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	daniel@ffwll.ch
Subject: [PATCH 11/16] drm/udl: Move register constants to udl_proto.h
Date: Mon, 19 Sep 2022 15:04:03 +0200
Message-Id: <20220919130408.21486-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919130408.21486-1-tzimmermann@suse.de>
References: <20220919130408.21486-1-tzimmermann@suse.de>
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

Move the existing register constants to a new file in preparation of
adding more of them. Renaming is intentional. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_drv.h     |  9 ---------
 drivers/gpu/drm/udl/udl_modeset.c | 11 +++++------
 drivers/gpu/drm/udl/udl_proto.h   | 16 ++++++++++++++++
 3 files changed, 21 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/udl/udl_proto.h

diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index b090b6cebdc4..580989087c54 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -112,13 +112,4 @@ int udl_select_std_channel(struct udl_device *udl);
 #define CMD_WRITE_COPY16 "\xAF\x6A" /**< 16 bit copy command. */
 #define CMD_WRITE_RLX16  "\xAF\x6B" /**< 16 bit extended run length command. */
 
-/* On/Off for driving the DisplayLink framebuffer to the display */
-#define UDL_REG_BLANK_MODE		0x1f
-
-#define UDL_BLANK_MODE_ON		0x00 /* hsync and vsync on, visible */
-#define UDL_BLANK_MODE_BLANKED		0x01 /* hsync and vsync on, blanked */
-#define UDL_BLANK_MODE_VSYNC_OFF	0x03 /* vsync off, blanked */
-#define UDL_BLANK_MODE_HSYNC_OFF	0x05 /* hsync off, blanked */
-#define UDL_BLANK_MODE_POWERDOWN	0x07 /* powered off; requires modeset */
-
 #endif
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 6fa4c8b5c2c6..e80ed218563e 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -24,8 +24,7 @@
 #include <drm/drm_vblank.h>
 
 #include "udl_drv.h"
-
-#define UDL_COLOR_DEPTH_16BPP	0
+#include "udl_proto.h"
 
 /*
  * All DisplayLink bulk operations start with 0xAF, followed by specific code
@@ -52,7 +51,7 @@ static char *udl_vidreg_unlock(char *buf)
 
 static char *udl_set_blank_mode(char *buf, u8 mode)
 {
-	return udl_set_register(buf, UDL_REG_BLANK_MODE, mode);
+	return udl_set_register(buf, UDL_REG_BLANKMODE, mode);
 }
 
 static char *udl_set_color_depth(char *buf, u8 selection)
@@ -367,13 +366,13 @@ static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atom
 
 	buf = (char *)urb->transfer_buffer;
 	buf = udl_vidreg_lock(buf);
-	buf = udl_set_color_depth(buf, UDL_COLOR_DEPTH_16BPP);
+	buf = udl_set_color_depth(buf, UDL_COLORDEPTH_16BPP);
 	/* set base for 16bpp segment to 0 */
 	buf = udl_set_base16bpp(buf, 0);
 	/* set base for 8bpp segment to end of fb */
 	buf = udl_set_base8bpp(buf, 2 * mode->vdisplay * mode->hdisplay);
 	buf = udl_set_vid_cmds(buf, mode);
-	buf = udl_set_blank_mode(buf, UDL_BLANK_MODE_ON);
+	buf = udl_set_blank_mode(buf, UDL_BLANKMODE_ON);
 	buf = udl_vidreg_unlock(buf);
 	buf = udl_dummy_render(buf);
 
@@ -399,7 +398,7 @@ static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_ato
 
 	buf = (char *)urb->transfer_buffer;
 	buf = udl_vidreg_lock(buf);
-	buf = udl_set_blank_mode(buf, UDL_BLANK_MODE_POWERDOWN);
+	buf = udl_set_blank_mode(buf, UDL_BLANKMODE_POWERDOWN);
 	buf = udl_vidreg_unlock(buf);
 	buf = udl_dummy_render(buf);
 
diff --git a/drivers/gpu/drm/udl/udl_proto.h b/drivers/gpu/drm/udl/udl_proto.h
new file mode 100644
index 000000000000..3f5b8e832b99
--- /dev/null
+++ b/drivers/gpu/drm/udl/udl_proto.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef UDL_PROTO_H
+#define UDL_PROTO_H
+
+#define UDL_COLORDEPTH_16BPP		0
+
+/* On/Off for driving the DisplayLink framebuffer to the display */
+#define UDL_REG_BLANKMODE		0x1f
+#define UDL_BLANKMODE_ON		0x00 /* hsync and vsync on, visible */
+#define UDL_BLANKMODE_BLANKED		0x01 /* hsync and vsync on, blanked */
+#define UDL_BLANKMODE_VSYNC_OFF		0x03 /* vsync off, blanked */
+#define UDL_BLANKMODE_HSYNC_OFF		0x05 /* hsync off, blanked */
+#define UDL_BLANKMODE_POWERDOWN		0x07 /* powered off; requires modeset */
+
+#endif
-- 
2.37.3

