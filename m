Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B31D6D1C0E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EB410F17F;
	Fri, 31 Mar 2023 09:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3C810F162
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:23:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1F9A51FE9A;
 Fri, 31 Mar 2023 09:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680254598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z+4eF9pBYT1mhMhgne9TTJ/ARusR32rV6EWDZHpQy1M=;
 b=XwOMRcRqADnRduB+QgW4KT2pejrtQeI/f+ggkYa9d5BmWl5KnWP4pqre6f4R11VvzKa0DI
 YHjXpPa1NE9trky4/K5TBk1tg8jCDWeDHcK00dT7WWWKffB16KH5sHx5Vj3Z2d12vkugKU
 30hrEHCXAc0yhYdjPFBtLE4rjAsU3P4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680254598;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z+4eF9pBYT1mhMhgne9TTJ/ARusR32rV6EWDZHpQy1M=;
 b=BWDULHPW+q8sXnldkYPmHi3Y96jKArO28cV0Z+inc6WlPpES63odSiX7xCU3HoQ98SesJt
 h8F4Vl6PVe96VfAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED96B13A0E;
 Fri, 31 Mar 2023 09:23:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gAkVOYWmJmTsOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Mar 2023 09:23:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Subject: [PATCH 09/15] fbdev/maxinefb: Remove trailing whitespaces
Date: Fri, 31 Mar 2023 11:23:08 +0200
Message-Id: <20230331092314.2209-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331092314.2209-1-tzimmermann@suse.de>
References: <20230331092314.2209-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix coding style. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/maxinefb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/maxinefb.c b/drivers/video/fbdev/maxinefb.c
index ae1a42bcb0ea..4e6b05232ae2 100644
--- a/drivers/video/fbdev/maxinefb.c
+++ b/drivers/video/fbdev/maxinefb.c
@@ -138,7 +138,7 @@ int __init maxinefb_init(void)
 		*(volatile unsigned char *)fboff = 0x0;
 
 	maxinefb_fix.smem_start = fb_start;
-	
+
 	/* erase hardware cursor */
 	for (i = 0; i < 512; i++) {
 		maxinefb_ims332_write_register(IMS332_REG_CURSOR_RAM + i,
-- 
2.40.0

