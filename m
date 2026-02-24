Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIcLItxgnWkDPAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:27:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CD1183A32
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BF310E4DD;
	Tue, 24 Feb 2026 08:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LjYlSUgA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JA/FUlew";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q3uhmZ5h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3PIsUzK8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B54010E4DD
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 08:27:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB1185BCD8;
 Tue, 24 Feb 2026 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771921623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zKgv6GmScnxBwgsoBKm1eRaTV6wy+Bj6bYhpX3Me+f0=;
 b=LjYlSUgAHelb7HTn5lt/TnB5i5POfPSpZv7iVdGfhiXh0TJNMt0FLocAUZYbire8RlLYmX
 tdJovBqbt+fAIijwwTXZTrSMVEAHm4JnAYnPTPFpm2z/aOk7PcX/F6YrrJBBDdI4xZBy2q
 xraVcRr9FCGIIHxYFYjRWuph+iqFV7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771921623;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zKgv6GmScnxBwgsoBKm1eRaTV6wy+Bj6bYhpX3Me+f0=;
 b=JA/FUlewt0pC4uMsBOPeAfEsQWgyTOvLi1DJHondI/iXjahqpVAfPr6XoE7pieP5R6TI59
 ChgdVd8LmP8YDrAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771921622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zKgv6GmScnxBwgsoBKm1eRaTV6wy+Bj6bYhpX3Me+f0=;
 b=Q3uhmZ5hNP549csTnZYOzhACH+ICgPgFa6M2oWNaDGuZho5X5jDonk9ENtgwG1N2HBG9u4
 7TRDY0sbXK2W4Qabf7a7CngYSOqXXimrIJQuZmk73upeXgKpZTTBSNCH9+UCYP8zIjkDak
 HXH2vb34PtH5kUFkbEE2I3GK7kngjbA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771921622;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zKgv6GmScnxBwgsoBKm1eRaTV6wy+Bj6bYhpX3Me+f0=;
 b=3PIsUzK80PpQyF/a708aQQ6orpXC4b425kwA7dF9L30dspRmB0gy0V5tcM/b0BlTQsbFF1
 J6S3oWyFJAx76aAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 99E7A3EA6B;
 Tue, 24 Feb 2026 08:27:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2N9fJNZgnWnVQAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Feb 2026 08:27:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	simona@ffwll.ch,
	jayalk@intworks.biz
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/4] fbdev: defio: Move variable state into struct
 fb_deferred_io_state
Date: Tue, 24 Feb 2026 09:25:56 +0100
Message-ID: <20260224082657.207284-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224082657.207284-1-tzimmermann@suse.de>
References: <20260224082657.207284-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:simona@ffwll.ch,m:jayalk@intworks.biz,m:linux-fbdev@vger.kernel.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,ffwll.ch,intworks.biz];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email]
X-Rspamd-Queue-Id: 88CD1183A32
X-Rspamd-Action: no action

Move variable fields from struct fb_deferred_io into struct
fb_deferred_io_state. These fields are internal to the defio code
and should not be exposed to drivers. At some later point, struct
fb_defered_io might become const in all defio code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fb_defio.c | 37 +++++++++++++++++------------
 include/linux/fb.h                  |  3 ---
 2 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 56030eb42f71..35ac13727da1 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -25,6 +25,8 @@
 #include <linux/rmap.h>
 #include <linux/pagemap.h>
 
+struct address_space;
+
 /*
  * struct fb_deferred_io_state
  */
@@ -32,9 +34,13 @@
 struct fb_deferred_io_state {
 	struct kref ref;
 
+	int open_count; /* number of opened files; protected by fb_info lock */
+	struct address_space *mapping; /* page cache object for fb device */
+
 	struct mutex lock; /* mutex that protects the pageref list */
 	/* fields protected by lock */
 	struct fb_info *info;
+	struct list_head pagereflist; /* list of pagerefs for touched pages */
 };
 
 static struct fb_deferred_io_state *fb_deferred_io_state_alloc(void)
@@ -48,11 +54,14 @@ static struct fb_deferred_io_state *fb_deferred_io_state_alloc(void)
 	kref_init(&fbdefio_state->ref);
 	mutex_init(&fbdefio_state->lock);
 
+	INIT_LIST_HEAD(&fbdefio_state->pagereflist);
+
 	return fbdefio_state;
 }
 
 static void fb_deferred_io_state_release(struct fb_deferred_io_state *fbdefio_state)
 {
+	WARN_ON(!list_empty(&fbdefio_state->pagereflist));
 	mutex_destroy(&fbdefio_state->lock);
 
 	kfree(fbdefio_state);
@@ -147,7 +156,8 @@ static struct fb_deferred_io_pageref *fb_deferred_io_pageref_get(struct fb_info
 								 struct page *page)
 {
 	struct fb_deferred_io *fbdefio = info->fbdefio;
-	struct list_head *pos = &fbdefio->pagereflist;
+	struct fb_deferred_io_state *fbdefio_state = info->fbdefio_state;
+	struct list_head *pos = &fbdefio_state->pagereflist;
 	struct fb_deferred_io_pageref *pageref, *cur;
 
 	pageref = fb_deferred_io_pageref_lookup(info, offset, page);
@@ -171,7 +181,7 @@ static struct fb_deferred_io_pageref *fb_deferred_io_pageref_get(struct fb_info
 		 * pages. If possible, drivers should try to work with
 		 * unsorted page lists instead.
 		 */
-		list_for_each_entry(cur, &fbdefio->pagereflist, list) {
+		list_for_each_entry(cur, &fbdefio_state->pagereflist, list) {
 			if (cur->offset > pageref->offset)
 				break;
 		}
@@ -222,7 +232,7 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
 	if (!vmf->vma->vm_file)
 		fb_err(info, "no mapping available\n");
 
-	BUG_ON(!info->fbdefio->mapping);
+	fb_WARN_ON_ONCE(info, !fbdefio_state->mapping);
 
 	mutex_unlock(&fbdefio_state->lock);
 
@@ -364,20 +374,20 @@ static void fb_deferred_io_work(struct work_struct *work)
 	/* here we wrprotect the page's mappings, then do all deferred IO. */
 	mutex_lock(&fbdefio_state->lock);
 #ifdef CONFIG_MMU
-	list_for_each_entry(pageref, &fbdefio->pagereflist, list) {
+	list_for_each_entry(pageref, &fbdefio_state->pagereflist, list) {
 		struct page *page = pageref->page;
 		pgoff_t pgoff = pageref->offset >> PAGE_SHIFT;
 
-		mapping_wrprotect_range(fbdefio->mapping, pgoff,
+		mapping_wrprotect_range(fbdefio_state->mapping, pgoff,
 					page_to_pfn(page), 1);
 	}
 #endif
 
 	/* driver's callback with pagereflist */
-	fbdefio->deferred_io(info, &fbdefio->pagereflist);
+	fbdefio->deferred_io(info, &fbdefio_state->pagereflist);
 
 	/* clear the list */
-	list_for_each_entry_safe(pageref, next, &fbdefio->pagereflist, list)
+	list_for_each_entry_safe(pageref, next, &fbdefio_state->pagereflist, list)
 		fb_deferred_io_pageref_put(pageref, info);
 
 	mutex_unlock(&fbdefio_state->lock);
@@ -402,7 +412,6 @@ int fb_deferred_io_init(struct fb_info *info)
 	fbdefio_state->info = info;
 
 	INIT_DELAYED_WORK(&info->deferred_work, fb_deferred_io_work);
-	INIT_LIST_HEAD(&fbdefio->pagereflist);
 	if (fbdefio->delay == 0) /* set a default of 1 s */
 		fbdefio->delay = HZ;
 
@@ -431,11 +440,11 @@ void fb_deferred_io_open(struct fb_info *info,
 			 struct inode *inode,
 			 struct file *file)
 {
-	struct fb_deferred_io *fbdefio = info->fbdefio;
+	struct fb_deferred_io_state *fbdefio_state = info->fbdefio_state;
 
-	fbdefio->mapping = file->f_mapping;
+	fbdefio_state->mapping = file->f_mapping;
 	file->f_mapping->a_ops = &fb_deferred_io_aops;
-	fbdefio->open_count++;
+	fbdefio_state->open_count++;
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_open);
 
@@ -446,16 +455,15 @@ static void fb_deferred_io_lastclose(struct fb_info *info)
 
 void fb_deferred_io_release(struct fb_info *info)
 {
-	struct fb_deferred_io *fbdefio = info->fbdefio;
+	struct fb_deferred_io_state *fbdefio_state = info->fbdefio_state;
 
-	if (!--fbdefio->open_count)
+	if (!--fbdefio_state->open_count)
 		fb_deferred_io_lastclose(info);
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_release);
 
 void fb_deferred_io_cleanup(struct fb_info *info)
 {
-	struct fb_deferred_io *fbdefio = info->fbdefio;
 	struct fb_deferred_io_state *fbdefio_state = info->fbdefio_state;
 
 	fb_deferred_io_lastclose(info);
@@ -469,6 +477,5 @@ void fb_deferred_io_cleanup(struct fb_info *info)
 	fb_deferred_io_state_put(fbdefio_state);
 
 	kvfree(info->pagerefs);
-	fbdefio->mapping = NULL;
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
diff --git a/include/linux/fb.h b/include/linux/fb.h
index aed17567fe50..2791777f3a50 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -217,9 +217,6 @@ struct fb_deferred_io {
 	/* delay between mkwrite and deferred handler */
 	unsigned long delay;
 	bool sort_pagereflist; /* sort pagelist by offset */
-	int open_count; /* number of opened files; protected by fb_info lock */
-	struct list_head pagereflist; /* list of pagerefs for touched pages */
-	struct address_space *mapping; /* page cache object for fb device */
 	/* callback */
 	struct page *(*get_page)(struct fb_info *info, unsigned long offset);
 	void (*deferred_io)(struct fb_info *info, struct list_head *pagelist);
-- 
2.52.0

