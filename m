Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D29E5F63DB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 11:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E126210E04B;
	Thu,  6 Oct 2022 09:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A22310E09D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 09:54:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2030D219A8;
 Thu,  6 Oct 2022 09:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665050039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VBbotmM5AhA4gDhRj4GoSVLjO4VsqT1YVJztHKdEDTk=;
 b=y3Fv5W7Gvizzi6nGfJy7WD/6bDulLdtlVhPJVXqoUtraWqCutQ5FhPc+hjDOQUtyGO/0s2
 7z1wiGqmT94r3RQSkeC9V+euX0jmysOOhTOGW8Rtwcskc3cmdZiEtUKEonRNcM4vRJgVdQ
 yR8Qpx2P2mNyR+NfBxUZbs00laMWxD0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665050039;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VBbotmM5AhA4gDhRj4GoSVLjO4VsqT1YVJztHKdEDTk=;
 b=mKATQn1X18RTz5fqL4eagp0biBqT0Mtt4MaA+mCRz5JR19dEen3g2rXSTrSQhZkZO8yZe4
 YlzENAfJ3f/fM8CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EE72913ACC;
 Thu,  6 Oct 2022 09:53:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SApHObalPmNnYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Oct 2022 09:53:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch
Subject: [PATCH v2 13/16] drm/udl: Add register constants for color depth
Date: Thu,  6 Oct 2022 11:53:52 +0200
Message-Id: <20221006095355.23579-14-tzimmermann@suse.de>
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

Add the register constants for setting the color depth. The driver
only uses 16bpp. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/udl/udl_modeset.c | 2 +-
 drivers/gpu/drm/udl/udl_proto.h   | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 12385bcc71eb..f8562d46b707 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -56,7 +56,7 @@ static char *udl_set_blank_mode(char *buf, u8 mode)
 
 static char *udl_set_color_depth(char *buf, u8 selection)
 {
-	return udl_set_register(buf, 0x00, selection);
+	return udl_set_register(buf, UDL_REG_COLORDEPTH, selection);
 }
 
 static char *udl_set_base16bpp(char *wrptr, u32 base)
diff --git a/drivers/gpu/drm/udl/udl_proto.h b/drivers/gpu/drm/udl/udl_proto.h
index 5a6c960bd10d..22bc1ae8420c 100644
--- a/drivers/gpu/drm/udl/udl_proto.h
+++ b/drivers/gpu/drm/udl/udl_proto.h
@@ -3,7 +3,10 @@
 #ifndef UDL_PROTO_H
 #define UDL_PROTO_H
 
+/* Color depth */
+#define UDL_REG_COLORDEPTH		0x00
 #define UDL_COLORDEPTH_16BPP		0
+#define UDL_COLORDEPTH_24BPP		1
 
 /* Display-mode settings */
 #define UDL_REG_XDISPLAYSTART		0x01
-- 
2.37.3

