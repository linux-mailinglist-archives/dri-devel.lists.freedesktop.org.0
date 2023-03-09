Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 645346B2A1F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E04D10E8BD;
	Thu,  9 Mar 2023 16:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E99A10E038
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BA93B22142;
 Thu,  9 Mar 2023 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=orZgFs2QhwCWX9f0KA+V1/nLVg0I8YGwHRr+Xo7enX4=;
 b=w2M1ASgu0lZrCMsHXHgnXvxWhi2LBlHQCDDLgWuIP0gFC5e6mu5hzpWJzazJOov2ElhEYC
 ulE40vpfEzs48sPfMh/R3esYMAiK47tSrCWDWDWSKGYbPSZ6QJZd1C4ZdtffnJKduHIGVx
 Q1EPOozEEYnFkboac+0B+vVedCm/SYY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377725;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=orZgFs2QhwCWX9f0KA+V1/nLVg0I8YGwHRr+Xo7enX4=;
 b=IilZvr3APCBNyl1rJ4raIBeZJOQqVsdBC5cVa5NCgCiQiHv0KknIZilA6kKT3GZJkSEnLU
 FrMnow3H6WtNcrCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4A6A11391B;
 Thu,  9 Mar 2023 16:02:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eDdJEf0CCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 003/101] fbdev/68328fb: Remove unused option string
Date: Thu,  9 Mar 2023 17:00:23 +0100
Message-Id: <20230309160201.5163-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309160201.5163-1-tzimmermann@suse.de>
References: <20230309160201.5163-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The option string is unused. Remove the variable and a related
helper function. No functional change.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/68328fb.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/68328fb.c b/drivers/video/fbdev/68328fb.c
index 7fe56ecbe4e6..f2d70df4104b 100644
--- a/drivers/video/fbdev/68328fb.c
+++ b/drivers/video/fbdev/68328fb.c
@@ -400,13 +400,6 @@ static int mc68x328fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 #endif
 }
 
-static int __init mc68x328fb_setup(char *options)
-{
-	if (!options || !*options)
-		return 1;
-	return 1;
-}
-
     /*
      *  Initialisation
      */
@@ -414,11 +407,8 @@ static int __init mc68x328fb_setup(char *options)
 static int __init mc68x328fb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
-
-	if (fb_get_options("68328fb", &option))
+	if (fb_get_options("68328fb", NULL))
 		return -ENODEV;
-	mc68x328fb_setup(option);
 #endif
 	/*
 	 *  initialize the default mode from the LCD controller registers
-- 
2.39.2

