Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 601BD5BCC7D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 15:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40BE10E60B;
	Mon, 19 Sep 2022 13:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9539110E270
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 13:04:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 49F851F920;
 Mon, 19 Sep 2022 13:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663592654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G1hVFFeHsPUQLe33SpugW+QKFeFsdza+sagxldA9ltw=;
 b=DXMl2KRMN3BiPWyntCQfwgjFahBJHxIJfYIw3hugSbVTDRf7fYjPBFCOdCNbdkiu3uNrCR
 NrBzLhgHYfSinTJIxaDD+X+c0VZvCx0nwqFXt/dm8wPFHFqyvu9DUJ64ED66fZBjbNWZ+c
 lF0rfgskv7kwkYrlSJjWjOgW9XW+JKc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663592654;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G1hVFFeHsPUQLe33SpugW+QKFeFsdza+sagxldA9ltw=;
 b=6RWCGCbRBDNLtgzydWlxtr90QvXyn0ZaDkjI26Y38LHhAMiI0Fu9unxt68Ze90jjR72b/v
 Hc1OgCxT8noifADg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2AEB713A96;
 Mon, 19 Sep 2022 13:04:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EEeVCc5oKGMzOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Sep 2022 13:04:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	daniel@ffwll.ch
Subject: [PATCH 14/16] drm/udl: Add register constants for video locks
Date: Mon, 19 Sep 2022 15:04:06 +0200
Message-Id: <20220919130408.21486-15-tzimmermann@suse.de>
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

Add register constants for the video lock. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_modeset.c | 4 ++--
 drivers/gpu/drm/udl/udl_proto.h   | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 1e28eb1e295f..b6aebfaae03d 100644
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

