Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9B6464D3C
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 12:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16326F992;
	Wed,  1 Dec 2021 11:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0926F96F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 11:46:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 76B5221709;
 Wed,  1 Dec 2021 11:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638359207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Gu7gLZiN6VsE86HNHc+SUNTSQvlH22ahDlOjz+k8yo=;
 b=mJ25d5q+MbCUAz5TYRtit6wYRcU7OzcSNjuiVbjk6ZF2FjGuHVWrvq8A7Y0WNYr5zGaTKM
 MZmYuMGR0FpR0Hs4eR7z8zbckEGGDVBWCkwIrynfPsnj0iWCUf9oJem1BLD8DZm59icDmg
 zZMsadRkKH/qk55ftZRvU5duofh5pLk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638359207;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Gu7gLZiN6VsE86HNHc+SUNTSQvlH22ahDlOjz+k8yo=;
 b=KijKJUmNODotLqyJ20mGbiMmRAhHXeddscn3XGfp0e+spI//c/4RR0jWcwqZi9xEQvh4dU
 kTWSq9CUo5HXMhDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4547413B7E;
 Wed,  1 Dec 2021 11:46:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6IndD6dgp2HbDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Dec 2021 11:46:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel.vetter@ffwll.ch, arnd@arndb.de,
 gregkh@linuxfoundation.org, James.Bottomley@HansenPartnership.com,
 deller@gmx.de
Subject: [PATCH v2 1/7] agp: Remove trailing whitespaces
Date: Wed,  1 Dec 2021 12:46:39 +0100
Message-Id: <20211201114645.15384-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211201114645.15384-1-tzimmermann@suse.de>
References: <20211201114645.15384-1-tzimmermann@suse.de>
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
Acked-by: Helge Deller <deller@gmx.de>
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
2.34.0

