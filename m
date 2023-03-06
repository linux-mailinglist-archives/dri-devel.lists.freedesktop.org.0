Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBFF6AC6A0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F061A10E3A4;
	Mon,  6 Mar 2023 16:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE96810E292
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 16:00:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AFFB31FEE6;
 Mon,  6 Mar 2023 16:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678118456; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OEolRl7Gtp6eBSHcZORJIpDzJ5v2DCmOHbu1CyAwA3Y=;
 b=nSAPDps7b4eyqBSFBGX40iycf64sF9/x7zewiXbBXIgAwzGfjnbPkMl7H2bVusG+ypnnkQ
 09gZjxZA1bTyL+96HyqwGXH5nBzyBnV3iyb4kTnylRUbHh/vqFqjrN5JhjY/thXIzgoWwV
 hrmhdXkj6pM1gB8vff2/qhblJ37W5O4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678118456;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OEolRl7Gtp6eBSHcZORJIpDzJ5v2DCmOHbu1CyAwA3Y=;
 b=MieZldQrprtTBsfNXL0KzOsqbmwfoQDjj+0/IPsyDelLittK1mvKIo3Odip4IXy8GCTDxc
 7k+7tkeTmpW2x9CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A63413A6A;
 Mon,  6 Mar 2023 16:00:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oHFyDTgOBmQ/PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Mar 2023 16:00:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, timur@kernel.org,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@HansenPartnership.com, spock@gentoo.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net
Subject: [PATCH 84/99] fbdev/tmiofb: Remove unused option string
Date: Mon,  6 Mar 2023 17:00:01 +0100
Message-Id: <20230306160016.4459-85-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306160016.4459-1-tzimmermann@suse.de>
References: <20230306160016.4459-1-tzimmermann@suse.de>
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

