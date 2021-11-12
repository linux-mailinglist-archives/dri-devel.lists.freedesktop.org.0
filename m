Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEC744E859
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 15:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3681F6E334;
	Fri, 12 Nov 2021 14:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D2E6E334
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 14:16:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B8ACB21990;
 Fri, 12 Nov 2021 14:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636726590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bix4rQPSvnMVaQ6j0r+kOoKM3AANHXwwcPf222ytfmI=;
 b=ZkchdpLCNsBsy7fX+MFLmwZgIzoMxVWjDL8pMaapK0+BfJB7VrA2bUrZ+Fo5trgcyQWZNS
 Wk1UFn0lZ/17tCMACEwxKms5xb6bV/LJpBWFnn0Pn/5jAvogMT45+fvLzvUV87maPCFWYO
 j3eFJzkPg5qaVieMlL68HXhQCuOMFy0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636726590;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bix4rQPSvnMVaQ6j0r+kOoKM3AANHXwwcPf222ytfmI=;
 b=qnuAIS+8ww8qQ10DiTOPRyrWjAJGeodqC/52QLu21wpzs3heVg5eowSvxs3Pddj7ISNnFI
 daS8Mfmlv/4Bi9Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 878C213DB2;
 Fri, 12 Nov 2021 14:16:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GM0sID53jmHhPAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 12 Nov 2021 14:16:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel.vetter@ffwll.ch, arnd@arndb.de,
 gregkh@linuxfoundation.org, James.Bottomley@HansenPartnership.com,
 deller@gmx.de
Subject: [PATCH 1/7] agp: Remove trailing whitespaces
Date: Fri, 12 Nov 2021 15:16:22 +0100
Message-Id: <20211112141628.12904-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112141628.12904-1-tzimmermann@suse.de>
References: <20211112141628.12904-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Trivial coding-style fix.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/char/agp/ati-agp.c    | 2 +-
 drivers/char/agp/frontend.c   | 2 +-
 drivers/char/agp/sworks-agp.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/agp/ati-agp.c b/drivers/char/agp/ati-agp.c
index 20bf5f78a362..857b37141a07 100644
--- a/drivers/char/agp/ati-agp.c
+++ b/drivers/char/agp/ati-agp.c
@@ -303,7 +303,7 @@ static int ati_insert_memory(struct agp_memory * mem,
 	for (i = 0, j = pg_start; i < mem->page_count; i++, j++) {
 		addr = (j * PAGE_SIZE) + agp_bridge->gart_bus_addr;
 		cur_gatt = GET_GATT(addr);
-		writel(agp_bridge->driver->mask_memory(agp_bridge,	
+		writel(agp_bridge->driver->mask_memory(agp_bridge,
 						       page_to_phys(mem->pages[i]),
 						       mem->type),
 		       cur_gatt+GET_GATT_OFF(addr));
diff --git a/drivers/char/agp/frontend.c b/drivers/char/agp/frontend.c
index 00ff5fcb808a..6802a6bbf0f2 100644
--- a/drivers/char/agp/frontend.c
+++ b/drivers/char/agp/frontend.c
@@ -1017,7 +1017,7 @@ static long agp_ioctl(struct file *file,
 	case AGPIOC_UNBIND:
 		ret_val = agpioc_unbind_wrap(curr_priv, (void __user *) arg);
 		break;
-	       
+
 	case AGPIOC_CHIPSET_FLUSH:
 		break;
 	}
diff --git a/drivers/char/agp/sworks-agp.c b/drivers/char/agp/sworks-agp.c
index f875970bda65..b15d3d4f71d5 100644
--- a/drivers/char/agp/sworks-agp.c
+++ b/drivers/char/agp/sworks-agp.c
@@ -350,7 +350,7 @@ static int serverworks_insert_memory(struct agp_memory *mem,
 	for (i = 0, j = pg_start; i < mem->page_count; i++, j++) {
 		addr = (j * PAGE_SIZE) + agp_bridge->gart_bus_addr;
 		cur_gatt = SVRWRKS_GET_GATT(addr);
-		writel(agp_bridge->driver->mask_memory(agp_bridge, 
+		writel(agp_bridge->driver->mask_memory(agp_bridge,
 				page_to_phys(mem->pages[i]), mem->type),
 		       cur_gatt+GET_GATT_OFF(addr));
 	}
-- 
2.33.1

