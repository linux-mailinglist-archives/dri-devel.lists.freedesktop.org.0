Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DcJN3rReGmNtQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:53:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A68296105
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FE710E58A;
	Tue, 27 Jan 2026 14:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SEekw7BU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zmp1gJ0b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SEekw7BU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zmp1gJ0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022D710E58A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 14:53:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BC34A5BCC3;
 Tue, 27 Jan 2026 14:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769525621; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IRIApCgKGYxC2DppFnFx5NvIXuyDk1qFzdf/rcXhHGE=;
 b=SEekw7BUT+gh8ltKvxV08Rc67bXN/9nbrQaOHAVxCt5t+MOKNE3T/mq4ArGPCqRy7pniBW
 r85kFKf3wX3OrWCKD/u2Ot8MGFt7Fo2BUm/PqSbcHhpPgapXZCUc+qTm/4+6K3tkV4/O8Y
 SGwPH5adQK7l6jLCZzM3hP9GTw9Fkxc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769525621;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IRIApCgKGYxC2DppFnFx5NvIXuyDk1qFzdf/rcXhHGE=;
 b=zmp1gJ0bswcoRvW93hZJGL4sU15PL3jxp2NHycxHZwA+NLx6CpAqZcB1/CMnlf7OjpkWZQ
 yLxzcDc0wfU2QtBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769525621; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IRIApCgKGYxC2DppFnFx5NvIXuyDk1qFzdf/rcXhHGE=;
 b=SEekw7BUT+gh8ltKvxV08Rc67bXN/9nbrQaOHAVxCt5t+MOKNE3T/mq4ArGPCqRy7pniBW
 r85kFKf3wX3OrWCKD/u2Ot8MGFt7Fo2BUm/PqSbcHhpPgapXZCUc+qTm/4+6K3tkV4/O8Y
 SGwPH5adQK7l6jLCZzM3hP9GTw9Fkxc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769525621;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IRIApCgKGYxC2DppFnFx5NvIXuyDk1qFzdf/rcXhHGE=;
 b=zmp1gJ0bswcoRvW93hZJGL4sU15PL3jxp2NHycxHZwA+NLx6CpAqZcB1/CMnlf7OjpkWZQ
 yLxzcDc0wfU2QtBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 634473EA61;
 Tue, 27 Jan 2026 14:53:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8R3NFnXReGmgXAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Jan 2026 14:53:41 +0000
Message-ID: <2bcc0da5-e3b8-4980-8e26-d8215ae53120@suse.de>
Date: Tue, 27 Jan 2026 15:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/gem-shmem: Map pages in mmap fault handler
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: loic.molinari@collabora.com, willy@infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, frank.binns@imgtec.com, matt.coster@imgtec.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
References: <20260127132938.429288-1-tzimmermann@suse.de>
 <20260127132938.429288-2-tzimmermann@suse.de>
 <20260127154511.6e2b9008@fedora>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20260127154511.6e2b9008@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,infradead.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,imgtec.com,lists.freedesktop.org,kvack.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:loic.molinari@collabora.com,m:willy@infradead.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:linux-mm@kvack.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:email,suse.de:dkim,suse.de:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4A68296105
X-Rspamd-Action: no action

Hi,

thanks for reviewing.

Am 27.01.26 um 15:45 schrieb Boris Brezillon:
> Hello Thomas,
>
> On Tue, 27 Jan 2026 14:16:36 +0100
> Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
>> Gem-shmem operates on pages instead of I/O memory ranges, so use them
>> for mmap. This will allow for tracking page dirty/accessed flags. If
>> hugepage support is available, insert the page's folio if possible.
>> Otherwise fall back to mapping individual pages.
>>
>> As the PFN is no longer required for hugepage mappings, simplify the
>> related code and make it depend on CONFIG_TRANSPARENT_HUGEPAGE. Prepare
>> for tracking folio status.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_gem_shmem_helper.c | 58 ++++++++++++++++----------
>>   1 file changed, 35 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index 3871a6d92f77..b6ddabbfcc52 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -553,17 +553,18 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
>>   static bool drm_gem_shmem_try_map_pmd(struct vm_fault *vmf, unsigned long addr,
>>   				      struct page *page)
>>   {
>> -#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
>> -	unsigned long pfn = page_to_pfn(page);
>> -	unsigned long paddr = pfn << PAGE_SHIFT;
>> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> +	phys_addr_t paddr = page_to_phys(page);
>>   	bool aligned = (addr & ~PMD_MASK) == (paddr & ~PMD_MASK);
>>   
>> -	if (aligned &&
>> -	    pmd_none(*vmf->pmd) &&
>> -	    folio_test_pmd_mappable(page_folio(page))) {
>> -		pfn &= PMD_MASK >> PAGE_SHIFT;
>> -		if (vmf_insert_pfn_pmd(vmf, pfn, false) == VM_FAULT_NOPAGE)
>> -			return true;
>> +	if (aligned && pmd_none(*vmf->pmd)) {
>> +		struct folio *folio = page_folio(page);
>> +
>> +		if (folio_test_pmd_mappable(folio)) {
>> +			/* Read-only mapping; split upon write fault */
>> +			if (vmf_insert_folio_pmd(vmf, folio, false) == VM_FAULT_NOPAGE)
>> +				return true;
>> +		}
>>   	}
>>   #endif
>>   
>> @@ -576,13 +577,10 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>>   	struct drm_gem_object *obj = vma->vm_private_data;
>>   	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
>>   	loff_t num_pages = obj->size >> PAGE_SHIFT;
>> -	vm_fault_t ret;
>>   	struct page **pages = shmem->pages;
>> -	pgoff_t page_offset;
>> -	unsigned long pfn;
>> -
>> -	/* Offset to faulty address in the VMA. */
>> -	page_offset = vmf->pgoff - vma->vm_pgoff;
>> +	pgoff_t page_offset = vmf->pgoff - vma->vm_pgoff; /* page offset within VMA */
>> +	struct page *page = pages[page_offset];
>> +	vm_fault_t ret;
>>   
>>   	dma_resv_lock(shmem->base.resv, NULL);
>>   
>> @@ -590,21 +588,35 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>>   	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
>>   	    shmem->madv < 0) {
>>   		ret = VM_FAULT_SIGBUS;
>> -		goto out;
>> +		goto err_dma_resv_unlock;
>>   	}
>>   
>> -	if (drm_gem_shmem_try_map_pmd(vmf, vmf->address, pages[page_offset])) {
>> -		ret = VM_FAULT_NOPAGE;
>> -		goto out;
>> +	page = pages[page_offset];
>> +	if (!page) {
>> +		ret = VM_FAULT_SIGBUS;
>> +		goto err_dma_resv_unlock;
>>   	}
>>   
>> -	pfn = page_to_pfn(pages[page_offset]);
>> -	ret = vmf_insert_pfn(vma, vmf->address, pfn);
>> +	if (drm_gem_shmem_try_map_pmd(vmf, vmf->address, page)) {
>> +		ret = VM_FAULT_NOPAGE;
>> +	} else {
>> +		struct folio *folio = page_folio(page);
>> +
>> +		get_page(page);
>> +
>> +		folio_lock(folio);
>> +
>> +		vmf->page = page;
>> +		ret = VM_FAULT_LOCKED;
>> +	}
>>   
>> - out:
>>   	dma_resv_unlock(shmem->base.resv);
>>   
>>   	return ret;
>> +
>> +err_dma_resv_unlock:
>> +	dma_resv_unlock(shmem->base.resv);
>> +	return ret;
> Why do we need an error path that's exactly the same as the success
> path?

I just found the explicit roll-back code easier to work with. But the 
other style does it as well. Noted for the next iteration.

Best regards
Thomas

>
>>   }
>>   
>>   static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
>> @@ -691,7 +703,7 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
>>   	if (ret)
>>   		return ret;
>>   
>> -	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
>> +	vm_flags_mod(vma, VM_DONTEXPAND | VM_DONTDUMP, VM_PFNMAP);
>>   	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>>   	if (shmem->map_wc)
>>   		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> The rest looks reasonable, if everyone is happy with the less
> restrictive aspect that !PFNMAP implies, as mentioned by Matthew.

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


