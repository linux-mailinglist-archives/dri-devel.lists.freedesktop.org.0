Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 464F75F63E2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 11:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A6410E27F;
	Thu,  6 Oct 2022 09:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A59010E27F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 09:54:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 47C621F928;
 Thu,  6 Oct 2022 09:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665050039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZeU55BNKbKBLOWgKxnOKMkR8psqkd9YN9fvqrnz/FEE=;
 b=adn99kzAkNETyEn0RFEAANmHJkq2tCLg7sAe8W/hqcfIoy/NEbmUsnxFybV/M7ML1I7pib
 HApD3RlbVywxuKffRduz+4Xc6wRFUf3eYQVLUme9diqbs/QEmT7zqI8z2hrCq4pv/fFTrr
 RjOy0Df7wVDwGeMR/py09piRGwKljMg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665050039;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZeU55BNKbKBLOWgKxnOKMkR8psqkd9YN9fvqrnz/FEE=;
 b=bdaBnCcPSMNgT1/JkHEjjbR4nE/jrjX+3NiFEIUVnmYARk7aDUQpc5zAQb3QoDlv2ADofY
 qlATBv/sX+NtvLCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2331213AC8;
 Thu,  6 Oct 2022 09:53:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iHqqB7elPmNnYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Oct 2022 09:53:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch
Subject: [PATCH v2 14/16] drm/udl: Add register constants for video locks
Date: Thu,  6 Oct 2022 11:53:53 +0200
Message-Id: <20221006095355.23579-15-tzimmermann@suse.de>
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

Add register constants for the video lock. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/udl/udl_modeset.c | 4 ++--
 drivers/gpu/drm/udl/udl_proto.h   | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index f8562d46b707..ea0388ccbd7e 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -41,12 +41,12 @@ static char *udl_set_register(char *buf, u8 reg, u8 val)
 
 static char *udl_vidreg_lock(char *buf)
 {
-	return udl_set_register(buf, 0xFF, 0x00);
+	return udl_set_register(buf, UDL_REG_VIDREG, UDL_VIDREG_LOCK);
 }
 
 static char *udl_vidreg_unlock(char *buf)
 {
-	return udl_set_register(buf, 0xFF, 0xFF);
+	return udl_set_register(buf, UDL_REG_VIDREG, UDL_VIDREG_UNLOCK);
 }
 
 static char *udl_set_blank_mode(char *buf, u8 mode)
diff --git a/drivers/gpu/drm/udl/udl_proto.h b/drivers/gpu/drm/udl/udl_proto.h
index 22bc1ae8420c..8e7d1a090644 100644
--- a/drivers/gpu/drm/udl/udl_proto.h
+++ b/drivers/gpu/drm/udl/udl_proto.h
@@ -31,4 +31,9 @@
 #define UDL_BLANKMODE_HSYNC_OFF		0x05 /* hsync off, blanked */
 #define UDL_BLANKMODE_POWERDOWN		0x07 /* powered off; requires modeset */
 
+/* Lock/unlock video registers */
+#define UDL_REG_VIDREG			0xff
+#define UDL_VIDREG_LOCK			0x00
+#define UDL_VIDREG_UNLOCK		0xff
+
 #endif
-- 
2.37.3

