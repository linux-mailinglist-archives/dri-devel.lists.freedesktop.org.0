Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEn2K/nQeGmNtQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:51:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D579608B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C38010E039;
	Tue, 27 Jan 2026 14:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="tEcTh/k0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GfYXPRDM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tEcTh/k0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GfYXPRDM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BEE10E039
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 14:51:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 98CA75BCEE;
 Tue, 27 Jan 2026 14:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769525490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=M3tqet/7U9w5GkoOfLDlX8vgaZNJQICiKO6Ia2zmu4Y=;
 b=tEcTh/k0XSDTWpNvxt9WeeO+qABZKMsw1MIn59edlh/BbXGULGPHqw33Iu2YIKETNAFZyT
 RcfEwbcuDsjIfY7iKYwmdd87kRGI8dYZS2WlvWAhJeE+c3rhY6CtwCNyJPNlNST23ilbnP
 /GpZkUaWnj2dhTuLpVy0fcqu2mqf2Ys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769525490;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=M3tqet/7U9w5GkoOfLDlX8vgaZNJQICiKO6Ia2zmu4Y=;
 b=GfYXPRDMPODzkZmCAiK7mjM7cwVYPenOe/UFYrDEye2QQjL+HRCXh8oEzEvaTq3oCc2XD0
 wZ5WhvwcdridTrAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="tEcTh/k0";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GfYXPRDM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769525490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=M3tqet/7U9w5GkoOfLDlX8vgaZNJQICiKO6Ia2zmu4Y=;
 b=tEcTh/k0XSDTWpNvxt9WeeO+qABZKMsw1MIn59edlh/BbXGULGPHqw33Iu2YIKETNAFZyT
 RcfEwbcuDsjIfY7iKYwmdd87kRGI8dYZS2WlvWAhJeE+c3rhY6CtwCNyJPNlNST23ilbnP
 /GpZkUaWnj2dhTuLpVy0fcqu2mqf2Ys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769525490;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=M3tqet/7U9w5GkoOfLDlX8vgaZNJQICiKO6Ia2zmu4Y=;
 b=GfYXPRDMPODzkZmCAiK7mjM7cwVYPenOe/UFYrDEye2QQjL+HRCXh8oEzEvaTq3oCc2XD0
 wZ5WhvwcdridTrAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3704D3EA61;
 Tue, 27 Jan 2026 14:51:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8W0PDPLQeGlXWgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Jan 2026 14:51:30 +0000
Message-ID: <ab2651eb-918b-4be0-9ee7-7af33f87378e@suse.de>
Date: Tue, 27 Jan 2026 15:51:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/gem-shmem: Map pages in mmap fault handler
To: Matthew Wilcox <willy@infradead.org>
Cc: boris.brezillon@collabora.com, loic.molinari@collabora.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, frank.binns@imgtec.com, matt.coster@imgtec.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
References: <20260127132938.429288-1-tzimmermann@suse.de>
 <20260127132938.429288-2-tzimmermann@suse.de>
 <aXjEjaYsqo6oIsAl@casper.infradead.org>
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
In-Reply-To: <aXjEjaYsqo6oIsAl@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.51
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,imgtec.com,lists.freedesktop.org,kvack.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:boris.brezillon@collabora.com,m:loic.molinari@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:linux-mm@kvack.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 02D579608B
X-Rspamd-Action: no action

Hi,

thanks for reviewing.

Am 27.01.26 um 14:58 schrieb Matthew Wilcox:
> On Tue, Jan 27, 2026 at 02:16:36PM +0100, Thomas Zimmermann wrote:
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
> It would feel more natural to me to have this function return vm_fault_t
> instead of a bool.  What do you think?

I took what was already there, but I had the same thought.

>
>> +	pgoff_t page_offset = vmf->pgoff - vma->vm_pgoff; /* page offset within VMA */
>> +	struct page *page = pages[page_offset];
>> +	vm_fault_t ret;
> [...]
>
>> -	if (drm_gem_shmem_try_map_pmd(vmf, vmf->address, pages[page_offset])) {
>> -		ret = VM_FAULT_NOPAGE;
>> -		goto out;
>> +	page = pages[page_offset];
> Can page_offset have changed at this point?

No, that's a mistake in the patch.  This line is left over from an 
earlier prototype. Apologies.

>
>> +	if (drm_gem_shmem_try_map_pmd(vmf, vmf->address, page)) {
>> +		ret = VM_FAULT_NOPAGE;
>> +	} else {
>> +		struct folio *folio = page_folio(page);
>> +
>> +		get_page(page);
> folio_get(folio);
>
>> -	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
>> +	vm_flags_mod(vma, VM_DONTEXPAND | VM_DONTDUMP, VM_PFNMAP);
> Just so you know, this is going to change observable behaviour, maybe
> in a good way.  For example, we'll now be able to do O_DIRECT I/O to
> this range and ptrace accesses.  I think everything will be fine, but
> VM_PFNMAP does prohibit some things which are now allowed.

Out of curiosity: how does this interact with the hugetable support? 
Using any of these new features would implicitly disable them for that 
mapping?

Best regards
Thomas


-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


