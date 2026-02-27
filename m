Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIQdOuWDoWkRuAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 12:45:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFBD1B6BB2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 12:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5ED10EB18;
	Fri, 27 Feb 2026 11:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="G1y/HdiS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gi41mZhN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G1y/HdiS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gi41mZhN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B3A10EB11
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 11:45:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 780FD5C382;
 Fri, 27 Feb 2026 11:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772192719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qD9cPUjCfQIEcV1FM98VU8MENQsevxJO4ZITT1LTTK0=;
 b=G1y/HdiSDPHYCe8clvxQ+z5tm52Y5was9y2q0+78J26rAGBynXshDf8M9AvhOc/5XwtfM7
 0qTAdHRSRDcYXNr9jXtXiPZa6yaQSjtoHY+xAckUxhMIp+xgokvn7j/tyORTTIUpPogd5S
 mgvcCe3ixALpXqSDc7HIRFGAM9bKXnA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772192719;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qD9cPUjCfQIEcV1FM98VU8MENQsevxJO4ZITT1LTTK0=;
 b=gi41mZhND2bu5qxDH3+mFWHCvbOiwrHCQ4TIzvV0CFtkhYbaEb53XQfGioYXHTR6hGiFZY
 TBWQmBldfhScndDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772192719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qD9cPUjCfQIEcV1FM98VU8MENQsevxJO4ZITT1LTTK0=;
 b=G1y/HdiSDPHYCe8clvxQ+z5tm52Y5was9y2q0+78J26rAGBynXshDf8M9AvhOc/5XwtfM7
 0qTAdHRSRDcYXNr9jXtXiPZa6yaQSjtoHY+xAckUxhMIp+xgokvn7j/tyORTTIUpPogd5S
 mgvcCe3ixALpXqSDc7HIRFGAM9bKXnA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772192719;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qD9cPUjCfQIEcV1FM98VU8MENQsevxJO4ZITT1LTTK0=;
 b=gi41mZhND2bu5qxDH3+mFWHCvbOiwrHCQ4TIzvV0CFtkhYbaEb53XQfGioYXHTR6hGiFZY
 TBWQmBldfhScndDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 287D63EA6A;
 Fri, 27 Feb 2026 11:45:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6CKwCM+DoWkvOwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Feb 2026 11:45:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, loic.molinari@collabora.com,
 willy@infradead.org, frank.binns@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 5/6] drm/gem-shmem: Track folio accessed/dirty status in
 mmap
Date: Fri, 27 Feb 2026 12:42:10 +0100
Message-ID: <20260227114509.165572-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227114509.165572-1-tzimmermann@suse.de>
References: <20260227114509.165572-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.35
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
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:loic.molinari@collabora.com,m:willy@infradead.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-mm@kvack.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[collabora.com,infradead.org,imgtec.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,kvack.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,suse.de:mid,suse.de:dkim,suse.de:email]
X-Rspamd-Queue-Id: 8EFBD1B6BB2
X-Rspamd-Action: no action

Invoke folio_mark_accessed() in mmap page faults to add the folio to
the memory manager's LRU list. Userspace invokes mmap to get the memory
for software rendering. Compositors do the same when creating the final
on-screen image, so keeping the pages in LRU makes sense. Avoids paging
out graphics buffers when under memory pressure.

In pfn_mkwrite, further invoke the folio_mark_dirty() to add the folio
for writeback should the underlying file be paged out from system memory.
This rarely happens in practice, yet it would corrupt the buffer content.

This has little effect on a system's hardware-accelerated rendering, which
only mmaps for an initial setup of textures, meshes, shaders, etc.

v4:
- test for VM_FAULT_NOPAGE before marking folio as accessed (Boris)
- test page-array bounds in mkwrite handler (Boris)
v3:
- rewrite for VM_PFNMAP
v2:
- adapt to changes in drm_gem_shmem_try_mmap_pmd()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index cefa50eaf7a4..1ab2bbd3860c 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -598,6 +598,9 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	if (ret != VM_FAULT_NOPAGE)
 		ret = vmf_insert_pfn(vma, vmf->address, pfn);
 
+	if (ret == VM_FAULT_NOPAGE)
+		folio_mark_accessed(folio);
+
 out:
 	dma_resv_unlock(obj->resv);
 
@@ -638,10 +641,29 @@ static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
 	drm_gem_vm_close(vma);
 }
 
+static vm_fault_t drm_gem_shmem_pfn_mkwrite(struct vm_fault *vmf)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	struct drm_gem_object *obj = vma->vm_private_data;
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+	loff_t num_pages = obj->size >> PAGE_SHIFT;
+	pgoff_t page_offset = vmf->pgoff - vma->vm_pgoff; /* page offset within VMA */
+
+	if (drm_WARN_ON(obj->dev, !shmem->pages || page_offset >= num_pages))
+		return VM_FAULT_SIGBUS;
+
+	file_update_time(vma->vm_file);
+
+	folio_mark_dirty(page_folio(shmem->pages[page_offset]));
+
+	return 0;
+}
+
 const struct vm_operations_struct drm_gem_shmem_vm_ops = {
 	.fault = drm_gem_shmem_fault,
 	.open = drm_gem_shmem_vm_open,
 	.close = drm_gem_shmem_vm_close,
+	.pfn_mkwrite = drm_gem_shmem_pfn_mkwrite,
 };
 EXPORT_SYMBOL_GPL(drm_gem_shmem_vm_ops);
 
-- 
2.52.0

