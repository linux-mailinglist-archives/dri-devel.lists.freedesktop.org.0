Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBwtFdyDoWkRuAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 12:45:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDDF1B6BA9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 12:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBB410EB16;
	Fri, 27 Feb 2026 11:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="tMI6jRAc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qG3+1z7X";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tMI6jRAc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qG3+1z7X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A9C10EB15
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 11:45:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C21AE5C22F;
 Fri, 27 Feb 2026 11:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772192718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXmsRVNgGN1UEYffCzJXc2JoUfHkMdrrEX6fYCskzD4=;
 b=tMI6jRAc+qBlYoGDalcdzy9MIUOfZGYoZ8HR1TR0KIvrF+/bdMxUHRLt/y/oHa7nfd/mR1
 hj+LtzcWDH+Ou6nuYNyc4GBvHJV5PGtszwAXNj39p6T1gAwMTKiH2iD1w02lpTvgJ9m2pT
 nkbsyQYTSKJtZXE9qG8/cO3gBBqOdJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772192718;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXmsRVNgGN1UEYffCzJXc2JoUfHkMdrrEX6fYCskzD4=;
 b=qG3+1z7XUvOaZo8072OX5LtuEFrAxkDnhuPxdslXgt4CdehWKSd2IHXIip08wcRJ3KEMoT
 KJrvJcGuOPYI7YDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772192718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXmsRVNgGN1UEYffCzJXc2JoUfHkMdrrEX6fYCskzD4=;
 b=tMI6jRAc+qBlYoGDalcdzy9MIUOfZGYoZ8HR1TR0KIvrF+/bdMxUHRLt/y/oHa7nfd/mR1
 hj+LtzcWDH+Ou6nuYNyc4GBvHJV5PGtszwAXNj39p6T1gAwMTKiH2iD1w02lpTvgJ9m2pT
 nkbsyQYTSKJtZXE9qG8/cO3gBBqOdJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772192718;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXmsRVNgGN1UEYffCzJXc2JoUfHkMdrrEX6fYCskzD4=;
 b=qG3+1z7XUvOaZo8072OX5LtuEFrAxkDnhuPxdslXgt4CdehWKSd2IHXIip08wcRJ3KEMoT
 KJrvJcGuOPYI7YDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 70BDF3EA6A;
 Fri, 27 Feb 2026 11:45:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QE9WGs6DoWkvOwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Feb 2026 11:45:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, loic.molinari@collabora.com,
 willy@infradead.org, frank.binns@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 3/6] drm/gem-shmem: Return vm_fault_t from
 drm_gem_shmem_try_map_pmd()
Date: Fri, 27 Feb 2026 12:42:08 +0100
Message-ID: <20260227114509.165572-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227114509.165572-1-tzimmermann@suse.de>
References: <20260227114509.165572-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.33
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,infradead.org:email]
X-Rspamd-Queue-Id: BEDDF1B6BA9
X-Rspamd-Action: no action

Return the exact VM_FAULT_ mask from drm_gem_shmem_try_map_pmd(). Gives
the caller better insight into the result. Return 0 if nothing was done.

If the caller sees VM_FAULT_NOPAGE, drm_gem_shmem_try_map_pmd() added a
PMD entry to the page table. As before, return early from the page-fault
handler in that case.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Matthew Wilcox <willy@infradead.org>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index cf5361946030..3c261b53c974 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -550,8 +550,8 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
 
-static bool drm_gem_shmem_try_map_pmd(struct vm_fault *vmf, unsigned long addr,
-				      struct page *page)
+static vm_fault_t drm_gem_shmem_try_map_pmd(struct vm_fault *vmf, unsigned long addr,
+					    struct page *page)
 {
 #ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
 	unsigned long pfn = page_to_pfn(page);
@@ -562,12 +562,11 @@ static bool drm_gem_shmem_try_map_pmd(struct vm_fault *vmf, unsigned long addr,
 	    pmd_none(*vmf->pmd) &&
 	    folio_test_pmd_mappable(page_folio(page))) {
 		pfn &= PMD_MASK >> PAGE_SHIFT;
-		if (vmf_insert_pfn_pmd(vmf, pfn, false) == VM_FAULT_NOPAGE)
-			return true;
+		return vmf_insert_pfn_pmd(vmf, pfn, false);
 	}
 #endif
 
-	return false;
+	return 0;
 }
 
 static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
@@ -593,10 +592,9 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	if (drm_WARN_ON_ONCE(dev, !page))
 		goto out;
 
-	if (drm_gem_shmem_try_map_pmd(vmf, vmf->address, page)) {
-		ret = VM_FAULT_NOPAGE;
+	ret = drm_gem_shmem_try_map_pmd(vmf, vmf->address, page);
+	if (ret == VM_FAULT_NOPAGE)
 		goto out;
-	}
 
 	pfn = page_to_pfn(page);
 	ret = vmf_insert_pfn(vma, vmf->address, pfn);
-- 
2.52.0

