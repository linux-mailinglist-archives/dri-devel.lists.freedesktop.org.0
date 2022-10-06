Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 763985F63E4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 11:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FA410E2B2;
	Thu,  6 Oct 2022 09:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1135B10E276
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 09:54:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C2AED219A5;
 Thu,  6 Oct 2022 09:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665050038; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ldfnLyqQqLlW9Dad2ms3V6JG/Dgw3FtHNeOP8GYY1fM=;
 b=ON+earjizrb0aJFi8Zd42ESd3HUE4cC/8zJrPoQ9TCyJgqK7x/QR0kTngcCMIWENo2v8Hg
 UN0tpFVsiE3hS9kn7g5Cm6b0RLJpKpmwVB4+hF8Uw/hC8RsbJGB7/AKfKN1hoKX8Wz2O9m
 Xcp7fTjhWe9Z0hZ4/L/wEDg6SGYoq+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665050038;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ldfnLyqQqLlW9Dad2ms3V6JG/Dgw3FtHNeOP8GYY1fM=;
 b=ffeHOCxZ2haSe06tLpvITTrMWlC9XQghsZQzuHiQTPNJdCgHtjUFHHYZIjoa4/rLeCOslP
 zabt92p4TbuBDXAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8EB0A13ACC;
 Thu,  6 Oct 2022 09:53:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4NnTIbalPmNnYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Oct 2022 09:53:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch
Subject: [PATCH v2 11/16] drm/udl: Move register constants to udl_proto.h
Date: Thu,  6 Oct 2022 11:53:50 +0200
Message-Id: <20221006095355.23579-12-tzimmermann@suse.de>
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

Move the existing register constants to a new file in preparation of
adding more of them. Renaming is intentional. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
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
index aee4fe2b5b08..702731bcd322 100644
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
@@ -358,13 +357,13 @@ static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atom
 
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
 
@@ -390,7 +389,7 @@ static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_ato
 
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

