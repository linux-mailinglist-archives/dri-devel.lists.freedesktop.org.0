Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4C55BCC8A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 15:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A7910E62D;
	Mon, 19 Sep 2022 13:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AB410E29F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 13:04:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 92B1D22346;
 Mon, 19 Sep 2022 13:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663592654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0m2R3EWS77KXe8IRoyZLU9BJr4E8FIKo7DvkJz/nAK4=;
 b=of22XT/PqpoqjoWIqFwTbCpIRPYujc2oLtCo02KIVISE6Oa2Vw9NsOqEY1xYOrwbc5y7jC
 zy7O0aQtBFbY++MGKyaxQtsVxztGqVjWcRNHsJbKv4OlW2u0Ntsvj2D4lulwajjUgetlxp
 OIeHaBruT0PhbRp/tNk2hWrCLh7iGFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663592654;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0m2R3EWS77KXe8IRoyZLU9BJr4E8FIKo7DvkJz/nAK4=;
 b=p6WH6KqD3kePCEnlwAWpjjW5Nd08hqGqjPt+9ktpzXVyKpm5ES1exus3aYmHFVKBBklzBK
 X25O23iXHO44noCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 71EEF13A96;
 Mon, 19 Sep 2022 13:04:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0B7sGs5oKGMzOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Sep 2022 13:04:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	daniel@ffwll.ch
Subject: [PATCH 16/16] drm/udl: Add constants for commands
Date: Mon, 19 Sep 2022 15:04:08 +0200
Message-Id: <20220919130408.21486-17-tzimmermann@suse.de>
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

Add constants for the various commands that the driver can send to
the device and update the respective helper functions. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_drv.h      | 10 ----------
 drivers/gpu/drm/udl/udl_modeset.c  | 16 +++++++++-------
 drivers/gpu/drm/udl/udl_proto.h    | 15 +++++++++++++++
 drivers/gpu/drm/udl/udl_transfer.c |  7 ++++---
 4 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index 580989087c54..282ebd6c02fd 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -102,14 +102,4 @@ int udl_render_hline(struct drm_device *dev, int log_bpp, struct urb **urb_ptr,
 int udl_drop_usb(struct drm_device *dev);
 int udl_select_std_channel(struct udl_device *udl);
 
-#define CMD_WRITE_RAW8   "\xAF\x60" /**< 8 bit raw write command. */
-#define CMD_WRITE_RL8    "\xAF\x61" /**< 8 bit run length command. */
-#define CMD_WRITE_COPY8  "\xAF\x62" /**< 8 bit copy command. */
-#define CMD_WRITE_RLX8   "\xAF\x63" /**< 8 bit extended run length command. */
-
-#define CMD_WRITE_RAW16  "\xAF\x68" /**< 16 bit raw write command. */
-#define CMD_WRITE_RL16   "\xAF\x69" /**< 16 bit run length command. */
-#define CMD_WRITE_COPY16 "\xAF\x6A" /**< 16 bit copy command. */
-#define CMD_WRITE_RLX16  "\xAF\x6B" /**< 16 bit extended run length command. */
-
 #endif
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index df0b70f3ddf1..1814bc84effe 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -27,15 +27,17 @@
 #include "udl_proto.h"
 
 /*
- * All DisplayLink bulk operations start with 0xAF, followed by specific code
- * All operations are written to buffers which then later get sent to device
+ * All DisplayLink bulk operations start with 0xaf (UDL_MSG_BULK), followed by
+ * a specific command code. All operations are written to a command buffer, which
+ * the driver sends to the device.
  */
 static char *udl_set_register(char *buf, u8 reg, u8 val)
 {
-	*buf++ = 0xAF;
-	*buf++ = 0x20;
+	*buf++ = UDL_MSG_BULK;
+	*buf++ = UDL_CMD_WRITEREG;
 	*buf++ = reg;
 	*buf++ = val;
+
 	return buf;
 }
 
@@ -176,8 +178,8 @@ static char *udl_set_display_mode(char *buf, struct drm_display_mode *mode)
 
 static char *udl_dummy_render(char *wrptr)
 {
-	*wrptr++ = 0xAF;
-	*wrptr++ = 0x6A; /* copy */
+	*wrptr++ = UDL_MSG_BULK;
+	*wrptr++ = UDL_CMD_WRITECOPY16;
 	*wrptr++ = 0x00; /* from addr */
 	*wrptr++ = 0x00;
 	*wrptr++ = 0x00;
@@ -232,7 +234,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb,
 		/* Send partial buffer remaining before exiting */
 		int len;
 		if (cmd < (char *)urb->transfer_buffer + urb->transfer_buffer_length)
-			*cmd++ = 0xAF;
+			*cmd++ = UDL_MSG_BULK;
 		len = cmd - (char *)urb->transfer_buffer;
 		ret = udl_submit_urb(dev, urb, len);
 	} else {
diff --git a/drivers/gpu/drm/udl/udl_proto.h b/drivers/gpu/drm/udl/udl_proto.h
index 3e7fcb43cb04..b3b199ffc616 100644
--- a/drivers/gpu/drm/udl/udl_proto.h
+++ b/drivers/gpu/drm/udl/udl_proto.h
@@ -3,6 +3,21 @@
 #ifndef UDL_PROTO_H
 #define UDL_PROTO_H
 
+#define UDL_MSG_BULK		0xaf
+
+/* Register access */
+#define UDL_CMD_WRITEREG	0x20 /* See register constants below */
+
+/* Framebuffer access */
+#define UDL_CMD_WRITERAW8	0x60 /* 8 bit raw write command. */
+#define UDL_CMD_WRITERL8	0x61 /* 8 bit run length command. */
+#define UDL_CMD_WRITECOPY8	0x62 /* 8 bit copy command. */
+#define UDL_CMD_WRITERLX8	0x63 /* 8 bit extended run length command. */
+#define UDL_CMD_WRITERAW16	0x68 /* 16 bit raw write command. */
+#define UDL_CMD_WRITERL16	0x69 /* 16 bit run length command. */
+#define UDL_CMD_WRITECOPY16	0x6a /* 16 bit copy command. */
+#define UDL_CMD_WRITERLX16	0x6b /* 16 bit extended run length command. */
+
 /* Color depth */
 #define UDL_REG_COLORDEPTH		0x00
 #define UDL_COLORDEPTH_16BPP		0
diff --git a/drivers/gpu/drm/udl/udl_transfer.c b/drivers/gpu/drm/udl/udl_transfer.c
index b57844632dbd..5ff1037a3453 100644
--- a/drivers/gpu/drm/udl/udl_transfer.c
+++ b/drivers/gpu/drm/udl/udl_transfer.c
@@ -10,6 +10,7 @@
 #include <asm/unaligned.h>
 
 #include "udl_drv.h"
+#include "udl_proto.h"
 
 #define MAX_CMD_PIXELS		255
 
@@ -89,8 +90,8 @@ static void udl_compress_hline16(
 		const u8 *cmd_pixel_start, *cmd_pixel_end = NULL;
 		uint16_t pixel_val16;
 
-		*cmd++ = 0xaf;
-		*cmd++ = 0x6b;
+		*cmd++ = UDL_MSG_BULK;
+		*cmd++ = UDL_CMD_WRITERLX16;
 		*cmd++ = (uint8_t) ((dev_addr >> 16) & 0xFF);
 		*cmd++ = (uint8_t) ((dev_addr >> 8) & 0xFF);
 		*cmd++ = (uint8_t) ((dev_addr) & 0xFF);
@@ -152,7 +153,7 @@ static void udl_compress_hline16(
 	if (cmd_buffer_end <= MIN_RLX_CMD_BYTES + cmd) {
 		/* Fill leftover bytes with no-ops */
 		if (cmd_buffer_end > cmd)
-			memset(cmd, 0xAF, cmd_buffer_end - cmd);
+			memset(cmd, UDL_MSG_BULK, cmd_buffer_end - cmd);
 		cmd = (uint8_t *) cmd_buffer_end;
 	}
 
-- 
2.37.3

