Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJ9mMUPziWnGEgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 15:46:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A664110EC4
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 15:46:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC4B10E407;
	Mon,  9 Feb 2026 14:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xA4TTeHC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z7p2bqVa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xA4TTeHC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z7p2bqVa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE6E10E407
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 14:46:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8272F3E6E7;
 Mon,  9 Feb 2026 14:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770648382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DSGfxZ/EEIX/zXxMZVu8MV7eH8W1DRl9z/K8tChKiW0=;
 b=xA4TTeHCJ7TlIXSdLLZb/zW5GhyL4smc7HDQFRml8dnvNKnPX14PpRB//l7k59kRJ1Gvk4
 VFjBy4pPvHX7E5bXETbCIgouklLBF9WgVLateMdm7Jz7j5afBGM4Rt+0woD+oyA2Zz4pW/
 jOqrHUTAe67z6h0ckm9AftDIDIlQ2x0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770648382;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DSGfxZ/EEIX/zXxMZVu8MV7eH8W1DRl9z/K8tChKiW0=;
 b=z7p2bqVa7t2sf6anYYtLo54Dtftdw4dIX8baa1BvBNssCLhkwNzt5JXR8gJju7MtYlhLXf
 Nw6XobUKsjEoNWCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xA4TTeHC;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=z7p2bqVa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770648382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DSGfxZ/EEIX/zXxMZVu8MV7eH8W1DRl9z/K8tChKiW0=;
 b=xA4TTeHCJ7TlIXSdLLZb/zW5GhyL4smc7HDQFRml8dnvNKnPX14PpRB//l7k59kRJ1Gvk4
 VFjBy4pPvHX7E5bXETbCIgouklLBF9WgVLateMdm7Jz7j5afBGM4Rt+0woD+oyA2Zz4pW/
 jOqrHUTAe67z6h0ckm9AftDIDIlQ2x0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770648382;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DSGfxZ/EEIX/zXxMZVu8MV7eH8W1DRl9z/K8tChKiW0=;
 b=z7p2bqVa7t2sf6anYYtLo54Dtftdw4dIX8baa1BvBNssCLhkwNzt5JXR8gJju7MtYlhLXf
 Nw6XobUKsjEoNWCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 118413EA63;
 Mon,  9 Feb 2026 14:46:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ZR5mAj7ziWkUQQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Feb 2026 14:46:22 +0000
Message-ID: <0d00a0f6-d0e4-41db-b48b-77157cd2e968@suse.de>
Date: Mon, 9 Feb 2026 15:46:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] drm/gem-shmem: Track folio accessed/dirty status
 in mmap
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: loic.molinari@collabora.com, willy@infradead.org, frank.binns@imgtec.com, 
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
References: <20260209133241.238813-1-tzimmermann@suse.de>
 <20260209133241.238813-6-tzimmermann@suse.de>
 <20260209152340.16f9b30a@fedora>
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
In-Reply-To: <20260209152340.16f9b30a@fedora>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,infradead.org,imgtec.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,kvack.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:loic.molinari@collabora.com,m:willy@infradead.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
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
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email]
X-Rspamd-Queue-Id: 2A664110EC4
X-Rspamd-Action: no action

Hi Boris,

thanks for reviewing the series.

Am 09.02.26 um 15:23 schrieb Boris Brezillon:
> On Mon,  9 Feb 2026 14:27:14 +0100
> Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
>> Invoke folio_mark_accessed() in mmap page faults to add the folio to
>> the memory manager's LRU list. Userspace invokes mmap to get the memory
>> for software rendering. Compositors do the same when creating the final
>> on-screen image, so keeping the pages in LRU makes sense. Avoids paging
>> out graphics buffers when under memory pressure.
>>
>> In pfn_mkwrite, further invoke the folio_mark_dirty() to add the folio
>> for writeback should the underlying file be paged out from system memory.
>> This rarely happens in practice, yet it would corrupt the buffer content.
>>
>> This has little effect on a system's hardware-accelerated rendering, which
>> only mmaps for an initial setup of textures, meshes, shaders, etc.
>>
>> v3:
>> - rewrite for VM_PFNMAP
>> v2:
>> - adapt to changes in drm_gem_shmem_try_mmap_pmd()
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>> ---
>>   drivers/gpu/drm/drm_gem_shmem_helper.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index c3a054899ba3..0c86ad40a049 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -598,6 +598,9 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>>   	if (ret != VM_FAULT_NOPAGE)
>>   		ret = vmf_insert_pfn(vma, vmf->address, pfn);
>>   
>> +	if (likely(!(ret & VM_FAULT_ERROR)))
> Can't we just go
>
> 	if (ret == VM_FAULT_NOPAGE)
>
> here?

After reviewing the code in vmf_insert_pfn, I think so. All we'll see is 
_OOM and _SIGBUS; or _NOPAGE on success.  I'll change it then.


>
>> +		folio_mark_accessed(folio);
>> +
>>   out:
>>   	dma_resv_unlock(obj->resv);
>>   
>> @@ -638,10 +641,27 @@ static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
>>   	drm_gem_vm_close(vma);
>>   }
>>   
>> +static vm_fault_t drm_gem_shmem_pfn_mkwrite(struct vm_fault *vmf)
>> +{
>> +	struct vm_area_struct *vma = vmf->vma;
>> +	struct drm_gem_object *obj = vma->vm_private_data;
>> +	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
>> +	pgoff_t page_offset = vmf->pgoff - vma->vm_pgoff; /* page offset within VMA */
>> +	struct page *page = shmem->pages[page_offset];
> Should we have a
>
> 	if (WARN_ON(!shmem->pages ||
> 		    page_offset <= (obj->size >> PAGE_SHIFT)))
> 		return VM_FAULT_SIGBUS;
>
>
> ?

I left it out because it doesn't seem necessary.  In the fault handler 
in drm_gem_shmem_fault(), I can see that we could get an OOB access. But 
we only call pfn_mkwrite() after going through _fault() first. I don't 
see a way of getting here unless we've already tested for the page in 
_fault().

Best regards
Thomas

>
>> +	struct folio *folio = page_folio(page);
>> +
>> +	file_update_time(vma->vm_file);
>> +
>> +	folio_mark_dirty(folio);
>> +
>> +	return 0;
>> +}
>> +
>>   const struct vm_operations_struct drm_gem_shmem_vm_ops = {
>>   	.fault = drm_gem_shmem_fault,
>>   	.open = drm_gem_shmem_vm_open,
>>   	.close = drm_gem_shmem_vm_close,
>> +	.pfn_mkwrite = drm_gem_shmem_pfn_mkwrite,
>>   };
>>   EXPORT_SYMBOL_GPL(drm_gem_shmem_vm_ops);
>>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


