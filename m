Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFRBIwTiiWnGCwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 14:32:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0B310FBD5
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 14:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A06689CAC;
	Mon,  9 Feb 2026 13:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="hpzWxrse";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ttksSl8q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hpzWxrse";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ttksSl8q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0E589CAC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 13:32:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C5F033E6FE;
 Mon,  9 Feb 2026 13:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770643966; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=boj9j/yGfFA2Etm+EvKg+xlbL/fVdgVk5fwC1+4q6MM=;
 b=hpzWxrseP1PXppnUk79PnOjOcaTbio3BXi5QtKGhtmvJ676U27eI/hJJrDbZ7t7KtpQAVG
 vtmIHx0zsJlFJ+aFbZxQJlY9b9l7lhJzA4xipS9hwEuAZPu5Xf+oX3UHQypI+zMC5kvFRK
 Vpw9KEBZv6hVBLNfd/e3dZbnoVk0YBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770643966;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=boj9j/yGfFA2Etm+EvKg+xlbL/fVdgVk5fwC1+4q6MM=;
 b=ttksSl8q4A6bVbY31sfbadXvxPQiSjsPFMuFVcYH8KxKtN9Hxb/plpH23/k6Rf3W4V8NpC
 5BeSpzVU3g5pVsCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770643966; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=boj9j/yGfFA2Etm+EvKg+xlbL/fVdgVk5fwC1+4q6MM=;
 b=hpzWxrseP1PXppnUk79PnOjOcaTbio3BXi5QtKGhtmvJ676U27eI/hJJrDbZ7t7KtpQAVG
 vtmIHx0zsJlFJ+aFbZxQJlY9b9l7lhJzA4xipS9hwEuAZPu5Xf+oX3UHQypI+zMC5kvFRK
 Vpw9KEBZv6hVBLNfd/e3dZbnoVk0YBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770643966;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=boj9j/yGfFA2Etm+EvKg+xlbL/fVdgVk5fwC1+4q6MM=;
 b=ttksSl8q4A6bVbY31sfbadXvxPQiSjsPFMuFVcYH8KxKtN9Hxb/plpH23/k6Rf3W4V8NpC
 5BeSpzVU3g5pVsCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6B32A3EA63;
 Mon,  9 Feb 2026 13:32:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QKS8GP7hiWmTIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Feb 2026 13:32:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, loic.molinari@collabora.com,
 willy@infradead.org, frank.binns@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 2/6] drm/gem-shmem: Test for existence of page in mmap
 fault handler
Date: Mon,  9 Feb 2026 14:27:11 +0100
Message-ID: <20260209133241.238813-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260209133241.238813-1-tzimmermann@suse.de>
References: <20260209133241.238813-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:loic.molinari@collabora.com,m:willy@infradead.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-mm@kvack.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[collabora.com,infradead.org,imgtec.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email]
X-Rspamd-Queue-Id: CA0B310FBD5
X-Rspamd-Action: no action

Not having a page pointer in the mmap fault handler is an error. Test
for this situation and return VM_FAULT_SIGBUS if so. Also replace several
lookups of the page with a local variable.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 5bced7db0f1f..3ee54c24e535 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -574,31 +574,31 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct drm_gem_object *obj = vma->vm_private_data;
+	struct drm_device *dev = obj->dev;
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 	loff_t num_pages = obj->size >> PAGE_SHIFT;
-	vm_fault_t ret;
+	vm_fault_t ret = VM_FAULT_SIGBUS;
 	struct page **pages = shmem->pages;
-	pgoff_t page_offset;
+	pgoff_t page_offset = vmf->pgoff - vma->vm_pgoff; /* page offset within VMA */
+	struct page *page;
 	unsigned long pfn;
 
-	/* Offset to faulty address in the VMA. */
-	page_offset = vmf->pgoff - vma->vm_pgoff;
-
 	dma_resv_lock(obj->resv, NULL);
 
-	if (page_offset >= num_pages ||
-	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
-	    shmem->madv < 0) {
-		ret = VM_FAULT_SIGBUS;
+	if (page_offset >= num_pages || drm_WARN_ON_ONCE(dev, !shmem->pages) ||
+	    shmem->madv < 0)
+		goto out;
+
+	page = pages[page_offset];
+	if (drm_WARN_ON_ONCE(dev, !page))
 		goto out;
-	}
 
-	if (drm_gem_shmem_try_map_pmd(vmf, vmf->address, pages[page_offset])) {
+	if (drm_gem_shmem_try_map_pmd(vmf, vmf->address, page)) {
 		ret = VM_FAULT_NOPAGE;
 		goto out;
 	}
 
-	pfn = page_to_pfn(pages[page_offset]);
+	pfn = page_to_pfn(page);
 	ret = vmf_insert_pfn(vma, vmf->address, pfn);
 
  out:
-- 
2.52.0

