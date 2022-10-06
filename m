Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C33605F63E7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 11:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41AD210E2CE;
	Thu,  6 Oct 2022 09:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDAC10E281
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 09:54:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6E2501F92B;
 Thu,  6 Oct 2022 09:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665050039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zFVys5//JXE7NlehkrLrTu8OccP/UWYu+bo6cdeJw0A=;
 b=mwS387mtD8GCqzZs6PVVMiFd+ilSl9RF/YoO4ihAY6ETRIBpNlNU2hYsxEFLKPOfAkim7T
 AdE0913TpQGePMWU7sUgPy3NZZZ3bAx/13nGeSQpO2brMkpy1ou+RUYtTgcs6v5D107Q2P
 OmgZY5APZTudpl6n72SxSEkXlziZU0c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665050039;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zFVys5//JXE7NlehkrLrTu8OccP/UWYu+bo6cdeJw0A=;
 b=L7ELWAkVMC5lKvAOqEY4HpbzrVDs9Sce3lB5+T7zw2HUdDOUp7gA3mc+VndBeR7HXN9aB2
 1qxvx4nswHViZOCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4C22313AC8;
 Thu,  6 Oct 2022 09:53:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IIi0EbelPmNnYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Oct 2022 09:53:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch
Subject: [PATCH v2 15/16] drm/udl: Add register constants for framebuffer
 scanout addresses
Date: Thu,  6 Oct 2022 11:53:54 +0200
Message-Id: <20221006095355.23579-16-tzimmermann@suse.de>
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

Add register constants for the framebuffer scanout addresses and
update the related helper functions. No functional changes.

v2:
	* extract address bytes with helper macros (Javier)
	* fix comments

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/udl/udl_modeset.c | 33 ++++++++++++++++++++++---------
 drivers/gpu/drm/udl/udl_proto.h   | 14 +++++++++++++
 2 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index ea0388ccbd7e..4462653e6736 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -8,6 +8,8 @@
  * Copyright (C) 2009 Bernie Thompson <bernie@plugable.com>
  */
 
+#include <linux/bitfield.h>
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
@@ -59,23 +61,36 @@ static char *udl_set_color_depth(char *buf, u8 selection)
 	return udl_set_register(buf, UDL_REG_COLORDEPTH, selection);
 }
 
-static char *udl_set_base16bpp(char *wrptr, u32 base)
+static char *udl_set_base16bpp(char *buf, u32 base)
 {
-	/* the base pointer is 16 bits wide, 0x20 is hi byte. */
-	wrptr = udl_set_register(wrptr, 0x20, base >> 16);
-	wrptr = udl_set_register(wrptr, 0x21, base >> 8);
-	return udl_set_register(wrptr, 0x22, base);
+	/* the base pointer is 24 bits wide, 0x20 is hi byte. */
+	u8 reg20 = FIELD_GET(UDL_BASE_ADDR2_MASK, base);
+	u8 reg21 = FIELD_GET(UDL_BASE_ADDR1_MASK, base);
+	u8 reg22 = FIELD_GET(UDL_BASE_ADDR0_MASK, base);
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
+	/* the base pointer is 24 bits wide, 0x26 is hi byte. */
+	u8 reg26 = FIELD_GET(UDL_BASE_ADDR2_MASK, base);
+	u8 reg27 = FIELD_GET(UDL_BASE_ADDR1_MASK, base);
+	u8 reg28 = FIELD_GET(UDL_BASE_ADDR0_MASK, base);
+
+	buf = udl_set_register(buf, UDL_REG_BASE8BPP_ADDR2, reg26);
+	buf = udl_set_register(buf, UDL_REG_BASE8BPP_ADDR1, reg27);
+	buf = udl_set_register(buf, UDL_REG_BASE8BPP_ADDR0, reg28);
+
+	return buf;
 }
 
 static char *udl_set_register_16(char *wrptr, u8 reg, u16 value)
diff --git a/drivers/gpu/drm/udl/udl_proto.h b/drivers/gpu/drm/udl/udl_proto.h
index 8e7d1a090644..8f143e75e797 100644
--- a/drivers/gpu/drm/udl/udl_proto.h
+++ b/drivers/gpu/drm/udl/udl_proto.h
@@ -3,6 +3,8 @@
 #ifndef UDL_PROTO_H
 #define UDL_PROTO_H
 
+#include <linux/bits.h>
+
 /* Color depth */
 #define UDL_REG_COLORDEPTH		0x00
 #define UDL_COLORDEPTH_16BPP		0
@@ -31,6 +33,18 @@
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
+#define UDL_BASE_ADDR0_MASK		GENMASK(7, 0)
+#define UDL_BASE_ADDR1_MASK		GENMASK(15, 8)
+#define UDL_BASE_ADDR2_MASK		GENMASK(23, 16)
+
 /* Lock/unlock video registers */
 #define UDL_REG_VIDREG			0xff
 #define UDL_VIDREG_LOCK			0x00
-- 
2.37.3

