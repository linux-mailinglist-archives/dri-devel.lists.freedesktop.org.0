Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2C06AC6A9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273B110E3AE;
	Mon,  6 Mar 2023 16:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D6610E398
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 16:00:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CA1981FE85;
 Mon,  6 Mar 2023 16:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678118440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tdQ9Z0pKhccY3nAxYeCZXdxmClNrcqOqv/uxdQRKhl8=;
 b=dDysJK5IsCuhM1q2UWLb5Ii5to5sS5Q4BZGGCGE2pS/9vfUfk8TWhygJI3GxRCBxiQXwPA
 14gNMuSkMQG14LLNsdA/Oxqko5ax+4zmtSA0/fi4DV59JBXJsFyyl+NotQSNh+ym6cMPAn
 I1rrLDYRDERoY5W5mLEBXXWyycCB4rE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678118440;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tdQ9Z0pKhccY3nAxYeCZXdxmClNrcqOqv/uxdQRKhl8=;
 b=Dv4YwkluAuGRzM30rb8v2sbxU0FROOq1braDVs1pbDI8FImUyWqXz/rnLm9cufyF5noEbq
 XFU41H4GOayQQYAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6C54A13513;
 Mon,  6 Mar 2023 16:00:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4MCfGSgOBmQ/PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Mar 2023 16:00:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, timur@kernel.org,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@HansenPartnership.com, spock@gentoo.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net
Subject: [PATCH 43/99] fbdev/macfb: Remove trailing whitespaces
Date: Mon,  6 Mar 2023 16:59:20 +0100
Message-Id: <20230306160016.4459-44-tzimmermann@suse.de>
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

Fix coding style. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/macfb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/macfb.c b/drivers/video/fbdev/macfb.c
index 312e35c9aa6c..44ff860a3f37 100644
--- a/drivers/video/fbdev/macfb.c
+++ b/drivers/video/fbdev/macfb.c
@@ -339,7 +339,7 @@ static int civic_setpalette(unsigned int regno, unsigned int red,
 {
 	unsigned long flags;
 	int clut_status;
-	
+
 	local_irq_save(flags);
 
 	/* Set the register address */
@@ -439,7 +439,7 @@ static int macfb_setcolreg(unsigned regno, unsigned red, unsigned green,
 	 * (according to the entries in the `var' structure).
 	 * Return non-zero for invalid regno.
 	 */
-	
+
 	if (regno >= fb_info->cmap.len)
 		return 1;
 
@@ -548,7 +548,7 @@ static int __init macfb_init(void)
 		return -ENODEV;
 	macfb_setup(option);
 
-	if (!MACH_IS_MAC) 
+	if (!MACH_IS_MAC)
 		return -ENODEV;
 
 	if (mac_bi_data.id == MAC_MODEL_Q630 ||
@@ -644,7 +644,7 @@ static int __init macfb_init(void)
 		err = -EINVAL;
 		goto fail_unmap;
 	}
-	
+
 	/*
 	 * We take a wild guess that if the video physical address is
 	 * in nubus slot space, that the nubus card is driving video.
@@ -774,7 +774,7 @@ static int __init macfb_init(void)
 			civic_cmap_regs = ioremap(CIVIC_BASE, 0x1000);
 			break;
 
-		
+
 		/*
 		 * Assorted weirdos
 		 * We think this may be like the LC II
-- 
2.39.2

