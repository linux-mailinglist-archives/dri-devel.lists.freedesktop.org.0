Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FCC6B29CB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:04:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCA810E8AB;
	Thu,  9 Mar 2023 16:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC9910E89F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7991422169;
 Thu,  9 Mar 2023 16:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OEolRl7Gtp6eBSHcZORJIpDzJ5v2DCmOHbu1CyAwA3Y=;
 b=AV+21/bVPDGAbr8VTqIZjqTw5fFW2X2dMnMFickwpWVWfsJ9W8Czdelk58P8hclKTQVsfr
 nQtXNuzPZMcOVkff5HAhRAKW13TtjUx2gWAlEdFIJPNKlML5K3rUCf+JCm/WnntJNAnVsy
 tXGGZbT+tlwCGTUDcrs5rPfR9acPHnc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377758;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OEolRl7Gtp6eBSHcZORJIpDzJ5v2DCmOHbu1CyAwA3Y=;
 b=MyGRnIxwQ5h/MHRygWADLYZfzgeWe1uSumvb2FyfsdkD+JY8UL/Rx7c6nweT1Tq2/NcUh1
 CqvYKFVmvLEjr9AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1E5CB1391B;
 Thu,  9 Mar 2023 16:02:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gJZ0Bh4DCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 084/101] fbdev/tmiofb: Remove unused option string
Date: Thu,  9 Mar 2023 17:01:44 +0100
Message-Id: <20230309160201.5163-85-tzimmermann@suse.de>
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
 drivers/video/fbdev/tmiofb.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/video/fbdev/tmiofb.c b/drivers/video/fbdev/tmiofb.c
index 50111966c981..8920cee52d7f 100644
--- a/drivers/video/fbdev/tmiofb.c
+++ b/drivers/video/fbdev/tmiofb.c
@@ -11,6 +11,7 @@
  *	code written by Sharp/Lineo for 2.4 kernels
  */
 
+#include <linux/cmdline.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -997,32 +998,11 @@ static struct platform_driver tmiofb_driver = {
 
 /*--------------------------------------------------------------------------*/
 
-#ifndef MODULE
-static void __init tmiofb_setup(char *options)
-{
-	char *this_opt;
-
-	if (!options || !*options)
-		return;
-
-	while ((this_opt = strsep(&options, ",")) != NULL) {
-		if (!*this_opt)
-			continue;
-		/*
-		 * FIXME
-		 */
-	}
-}
-#endif
-
 static int __init tmiofb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
-
-	if (fb_get_options("tmiofb", &option))
+	if (fb_get_options("tmiofb", NULL))
 		return -ENODEV;
-	tmiofb_setup(option);
 #endif
 	return platform_driver_register(&tmiofb_driver);
 }
-- 
2.39.2

