Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBVrJt1gnWkDPAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:27:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE80183A3A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C07710E4DF;
	Tue, 24 Feb 2026 08:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Q2lCbdqB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PW55RTtm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0hZuf8ps";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jVArQgqY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815F610E4DF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 08:27:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A46C43F103;
 Tue, 24 Feb 2026 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771921623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OI4baw2/36ZS5OmXr1TUT1WjqsmWmX/KkcxFcE7zL80=;
 b=Q2lCbdqBkNz+FiiapOQHOioXYfXhkXmXyDTdeWg0JLjg7qI0WA0ubAU5Inasp4tTUXcSZT
 5M/bqjti+gMHNKzFqFAcXKBvl44W6JpDvM5ls5N/2XMXlhxUFsnun4YEjThXez+4+aI+t8
 ae3ADXelKQY1GWURrxkVO1IfzVJdzr8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771921623;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OI4baw2/36ZS5OmXr1TUT1WjqsmWmX/KkcxFcE7zL80=;
 b=PW55RTtmiFp4Mk0YumuCH1e7V3lWB7wmmzYYBXpnHOzopcIxWyqohfCoySKGgyXl5gdev9
 8/6gkPR0P0esNaBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771921622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OI4baw2/36ZS5OmXr1TUT1WjqsmWmX/KkcxFcE7zL80=;
 b=0hZuf8pssM5Z5DxySA44dV3YCbmLnI9XgY5DuF8HzAR4gTfsgToJAQnCMEaKhZVVJIeqIW
 99qLX/8aWFgTQm1hjns3tKFLTmAIMOS6//IKB2swVSqWGqQEecwqiLR0LiunSN88kofPJp
 x0Y2Yq8eEvvUCX9ImTYSVzHnum82D5s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771921622;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OI4baw2/36ZS5OmXr1TUT1WjqsmWmX/KkcxFcE7zL80=;
 b=jVArQgqYP5xkGTfl5YNGronxNUs4vHwsWcCTauBzQ1+8z3nE4e6yVQqcZ0ny+tNoHsuO+N
 t57CRdsj7s4MpACw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6710D3EA6A;
 Tue, 24 Feb 2026 08:27:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +E38F9ZgnWnVQAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Feb 2026 08:27:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	simona@ffwll.ch,
	jayalk@intworks.biz
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/4] fbdev: defio: Keep module reference from VMAs
Date: Tue, 24 Feb 2026 09:25:55 +0100
Message-ID: <20260224082657.207284-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224082657.207284-1-tzimmermann@suse.de>
References: <20260224082657.207284-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4BE80183A3A
X-Rspamd-Action: no action

Acquire a module reference on each mmap and VMA open; hold it until
the kernel closes the VMA. Protects against unloading the module
while user space still has a mapping of the graphics memory. The
VMA page-fault handling would then call into undefined code.

This situation can happen if the underlying device has been unplugged
and the driver has been unloaded. It would then be possible to trigger
the bug by unloading the fbdev core module.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fb_defio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 93bd2f696fa4..56030eb42f71 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -14,6 +14,7 @@
 #include <linux/export.h>
 #include <linux/string.h>
 #include <linux/mm.h>
+#include <linux/module.h>
 #include <linux/vmalloc.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
@@ -83,6 +84,7 @@ static void fb_deferred_io_vm_open(struct vm_area_struct *vma)
 {
 	struct fb_deferred_io_state *fbdefio_state = vma->vm_private_data;
 
+	WARN_ON_ONCE(!try_module_get(THIS_MODULE));
 	fb_deferred_io_state_get(fbdefio_state);
 }
 
@@ -91,6 +93,7 @@ static void fb_deferred_io_vm_close(struct vm_area_struct *vma)
 	struct fb_deferred_io_state *fbdefio_state = vma->vm_private_data;
 
 	fb_deferred_io_state_put(fbdefio_state);
+	module_put(THIS_MODULE);
 }
 
 static struct page *fb_deferred_io_get_page(struct fb_info *info, unsigned long offs)
@@ -335,6 +338,9 @@ int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 
+	if (!try_module_get(THIS_MODULE))
+		return -EINVAL;
+
 	vma->vm_ops = &fb_deferred_io_vm_ops;
 	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
 	if (!(info->flags & FBINFO_VIRTFB))
-- 
2.52.0

