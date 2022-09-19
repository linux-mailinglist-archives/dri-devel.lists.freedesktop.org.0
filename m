Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 798D95BCC8B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 15:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7F210E62F;
	Mon, 19 Sep 2022 13:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE2410E203
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 13:04:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6D11122344;
 Mon, 19 Sep 2022 13:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663592654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D7ebUwORzgiGtIEtjVDFuGyByFB2vJvWZ7twCzed2Rw=;
 b=Q3MsB10Op8vWX01Y4UCIc7SBo6hrWexxhArzWIFkzBgcvwkcDwNBstG4XYgmY9bMYP49WB
 elsI54fatqpTTi6xrwgITgCU+VHiBAvC/OWCNzAGkrobtc9L5BYov6+EnuWD6Jb5oHWjw8
 pFcbHA+rCtMVvuPHEBAoDqEaoMSvdb4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663592654;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D7ebUwORzgiGtIEtjVDFuGyByFB2vJvWZ7twCzed2Rw=;
 b=pezNRpXd0qBTIsEtraypArEwMwUDi4+v6wDoo2nAVCSTLwni8BovbUPOIaVDmhcNXmNxKY
 QtN6vIs2h220JXAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E99813A96;
 Mon, 19 Sep 2022 13:04:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AMhDEs5oKGMzOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Sep 2022 13:04:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	daniel@ffwll.ch
Subject: [PATCH 15/16] drm/udl: Add register constants for framebuffer scanout
 addresses
Date: Mon, 19 Sep 2022 15:04:07 +0200
Message-Id: <20220919130408.21486-16-tzimmermann@suse.de>
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

Add register constants for the framebuffer scanout addresses and
update the related helper functions. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_modeset.c | 28 ++++++++++++++++++++--------
 drivers/gpu/drm/udl/udl_proto.h   |  8 ++++++++
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index b6aebfaae03d..df0b70f3ddf1 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -59,23 +59,35 @@ static char *udl_set_color_depth(char *buf, u8 selection)
 	return udl_set_register(buf, UDL_REG_COLORDEPTH, selection);
 }
 
-static char *udl_set_base16bpp(char *wrptr, u32 base)
+static char *udl_set_base16bpp(char *buf, u32 base)
 {
 	/* the base pointer is 16 bits wide, 0x20 is hi byte. */
-	wrptr = udl_set_register(wrptr, 0x20, base >> 16);
-	wrptr = udl_set_register(wrptr, 0x21, base >> 8);
-	return udl_set_register(wrptr, 0x22, base);
+	u8 reg20 = (base & 0xff0000) >> 16;
+	u8 reg21 = (base & 0x00ff00) >> 8;
+	u8 reg22 = (base & 0x0000ff);
+
+	buf = udl_set_register(buf, UDL_REG_BASE16BPP_ADDR2, reg20);
+	buf = udl_set_register(buf, UDL_REG_BASE16BPP_ADDR1, reg21);
+	buf = udl_set_register(buf, UDL_REG_BASE16BPP_ADDR0, reg22);
+
+	return buf;
 }
 
 /*
  * DisplayLink HW has separate 16bpp and 8bpp framebuffers.
  * In 24bpp modes, the low 323 RGB bits go in the 8bpp framebuffer
  */
-static char *udl_set_base8bpp(char *wrptr, u32 base)
+static char *udl_set_base8bpp(char *buf, u32 base)
 {
-	wrptr = udl_set_register(wrptr, 0x26, base >> 16);
-	wrptr = udl_set_register(wrptr, 0x27, base >> 8);
-	return udl_set_register(wrptr, 0x28, base);
+	u8 reg26 = (base & 0xff0000) >> 16;
+	u8 reg27 = (base & 0x00ff00) >> 8;
+	u8 reg28 = (base & 0x0000ff);
+
+	buf = udl_set_register(buf, UDL_REG_BASE8BPP_ADDR2, reg26);
+	buf = udl_set_register(buf, UDL_REG_BASE8BPP_ADDR1, reg27);
+	buf = udl_set_register(buf, UDL_REG_BASE8BPP_ADDR0, reg28);
+
+	return buf;
 }
 
 static char *udl_set_register_16(char *wrptr, u8 reg, u16 value)
diff --git a/drivers/gpu/drm/udl/udl_proto.h b/drivers/gpu/drm/udl/udl_proto.h
index 8e7d1a090644..3e7fcb43cb04 100644
--- a/drivers/gpu/drm/udl/udl_proto.h
+++ b/drivers/gpu/drm/udl/udl_proto.h
@@ -31,6 +31,14 @@
 #define UDL_BLANKMODE_HSYNC_OFF		0x05 /* hsync off, blanked */
 #define UDL_BLANKMODE_POWERDOWN		0x07 /* powered off; requires modeset */
 
+/* Framebuffer address */
+#define UDL_REG_BASE16BPP_ADDR2		0x20
+#define UDL_REG_BASE16BPP_ADDR1		0x21
+#define UDL_REG_BASE16BPP_ADDR0		0x22
+#define UDL_REG_BASE8BPP_ADDR2		0x26
+#define UDL_REG_BASE8BPP_ADDR1		0x27
+#define UDL_REG_BASE8BPP_ADDR0		0x28
+
 /* Lock/unlock video registers */
 #define UDL_REG_VIDREG			0xff
 #define UDL_VIDREG_LOCK			0x00
-- 
2.37.3

