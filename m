Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7073CACC182
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 09:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C435810E0DC;
	Tue,  3 Jun 2025 07:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G8olZDzs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3540710E0DC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 07:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748937307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=G1YsxaZzNVXSMpkwIDY/Vgxq1q2wnOXQ1uhSwOyfMm4=;
 b=G8olZDzsapd8ibnaOqOH1H/2FTNLgQRXKUR+lSgnd8EKsG3Mfbs9QL6GdeKFNyipWP9qxF
 FJHrSFOdX4hS6I8DSBA6CbS0z3ItOK+3VOXZLJ/s20kBW7oEwiOdyqSUi3EyMrUwjhjNg2
 EzjIGkB6KqYlTaCi2sTGbJQBWw4FS1U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-4mkKH7B3Na-3meilW3BJCg-1; Tue, 03 Jun 2025 03:55:05 -0400
X-MC-Unique: 4mkKH7B3Na-3meilW3BJCg-1
X-Mimecast-MFC-AGG-ID: 4mkKH7B3Na-3meilW3BJCg_1748937305
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-450d886b9d5so13413925e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 00:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748937305; x=1749542105;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=G1YsxaZzNVXSMpkwIDY/Vgxq1q2wnOXQ1uhSwOyfMm4=;
 b=wYH9O8sQC503cwHNbO0QBWBk+dYLiDrZJ8t22T7PSPhmR2bZMmU9Gs8utlUlcfwpPZ
 10pOmkr/33x2T9Dx1bKacOZGr3VIqIHN38TvnSvLjSPIWTG3KNKNTd0OVcnInB2hWDZN
 jFTP/LQy+8ECbnESF17CQL7ep9B3Se7t7jrkZqM9dfoHo+xsw4FRA7L4LVdzTFqDoA6D
 GdopJDA3gv45kHgpm93QN6dVU9dmy0MYExSAro30K3PkMUEGFUOrvH80pshPEX6Xniop
 2g5GQEmAEoEtjNyVQWXK55dbBZpkv/OVX/Lg9l3rleegtMrZ+2aalIGLAFCSncWOeXyK
 7VHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHeWMcbtc0lJuXVg4Yip6tXFdTVUdDsrqG4ko6JDvHhekSqcYURpz18/z0+/MqLbHWFsg4pnRDXFM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRQefJyJUGe4ADPpDF5Q21Z1fWA+x8qE3NhkCg2cMIIXbQmPcK
 BrY4Ocg1ahnq4x5zZ2P/3+6c3ZYCsYOmAhMkyChWaPLQLsS+eTGsR4aC0qPfncaSq/WQ5/UAZcK
 fKHxFvuZ2Ul6B7Od0V1k66ByUvDso1BzFGIuL2hNIkomO6SoiX3ssxzr0K+U8KvJLQ+IDtg==
X-Gm-Gg: ASbGncsTwxs+lcWwNZ+SNOLBJUDgJNUZwEG3Db7GerCXH5JVSLr3xKNrLEZQBTrzVgr
 kXDjK29yw+4mWf9ej6w73IuOrXIoqjhgshCaGXsdrTl+KhBqymp++TKLpMSuVqb4sFusguN4jpO
 OFrEamadADQjQTQ94E2QCBP9WeyatBEzVg+t74o3QTzAO2m08+v6FOcTogiNpamnSAVgqjIg7ws
 DWT71EOVQTWuev7v0GosLoiR4CTLPwCIVwO7B+wgWsTv401holwZEMVQ0r0vo6SJWKCmDerIHQ1
 42o2cyK4cWSpxXBZ5b0p2cCbC6zlofrzk7QDVdTDbksXDRBzCbMSLCfagA2aGRGfvjZ6s9QViI8
 1LeByL+oiB8Q64EKQezZpE6oiow1YD8iRx4lrQ1QA28V2QPVPaw==
X-Received: by 2002:a05:600c:871b:b0:43c:f1b8:16ad with SMTP id
 5b1f17b1804b1-450d655c68bmr158484445e9.30.1748937304560; 
 Tue, 03 Jun 2025 00:55:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdpKGAL9uLgWdRyfKbmkAU2MRqQuatPEqpqyiMKeGYeLVT9fiHhki4elBuNd5uruv+niUUbA==
X-Received: by 2002:a05:600c:871b:b0:43c:f1b8:16ad with SMTP id
 5b1f17b1804b1-450d655c68bmr158484005e9.30.1748937304060; 
 Tue, 03 Jun 2025 00:55:04 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:f000:eec9:2b8d:4913:f32a?
 (p200300d82f0df000eec92b8d4913f32a.dip0.t-ipconnect.de.
 [2003:d8:2f0d:f000:eec9:2b8d:4913:f32a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe5b7b0sm17496378f8f.10.2025.06.03.00.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 00:55:03 -0700 (PDT)
Message-ID: <e069436f-764d-464d-98ac-36a086297632@redhat.com>
Date: Tue, 3 Jun 2025 09:55:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] fbdev/deferred-io: Support contiguous kernel
 memory framebuffers
To: Michael Kelley <mhklinux@outlook.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "deller@gmx.de" <deller@gmx.de>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "kys@microsoft.com" <kys@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Cc: "weh@microsoft.com" <weh@microsoft.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "hch@lst.de" <hch@lst.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <20250523161522.409504-1-mhklinux@outlook.com>
 <20250523161522.409504-4-mhklinux@outlook.com>
 <de0f2cb8-aed6-436f-b55e-d3f7b3fe6d81@redhat.com>
 <SN6PR02MB41573C075152ECD8428CAF5ED46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <SN6PR02MB41573C075152ECD8428CAF5ED46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3gd4zc7uSSMKoR96swtXHqvMsyveoRCGGbLuCDhHiW8_1748937305
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03.06.25 03:49, Michael Kelley wrote:
> From: David Hildenbrand <david@redhat.com> Sent: Monday, June 2, 2025 2:48 AM
>>
>> On 23.05.25 18:15, mhkelley58@gmail.com wrote:
>>> From: Michael Kelley <mhklinux@outlook.com>
>>>
>>> Current defio code works only for framebuffer memory that is allocated
>>> with vmalloc(). The code assumes that the underlying page refcount can
>>> be used by the mm subsystem to manage each framebuffer page's lifecycle,
>>> including freeing the page if the refcount goes to 0. This approach is
>>> consistent with vmalloc'ed memory, but not with contiguous kernel memory
>>> allocated via alloc_pages() or similar. The latter such memory pages
>>> usually have a refcount of 0 when allocated, and would be incorrectly
>>> freed page-by-page if used with defio. That free'ing corrupts the memory
>>> free lists and Linux eventually panics. Simply bumping the refcount after
>>> allocation doesn’t work because when the framebuffer memory is freed,
>>> __free_pages() complains about non-zero refcounts.
>>>
>>> Commit 37b4837959cb ("video: deferred io with physically contiguous
>>> memory") from the year 2008 purported to add support for contiguous
>>> kernel memory framebuffers. The motivating device, sh_mobile_lcdcfb, uses
>>> dma_alloc_coherent() to allocate framebuffer memory, which is likely to
>>> use alloc_pages(). It's unclear to me how this commit actually worked at
>>> the time, unless dma_alloc_coherent() was pulling from a CMA pool instead
>>> of alloc_pages(). Or perhaps alloc_pages() worked differently or on the
>>> arm32 architecture on which sh_mobile_lcdcfb is used.
>>>
>>> In any case, for x86 and arm64 today, commit 37b4837959cb9 is not
>>> sufficient to support contiguous kernel memory framebuffers. The problem
>>> can be seen with the hyperv_fb driver, which may allocate the framebuffer
>>> memory using vmalloc() or alloc_pages(), depending on the configuration
>>> of the Hyper-V guest VM (Gen 1 vs. Gen 2) and the size of the framebuffer.
>>>
>>> Fix this limitation by adding defio support for contiguous kernel memory
>>> framebuffers. A driver with a framebuffer allocated from contiguous
>>> kernel memory must set the FBINFO_KMEMFB flag to indicate such.
>>>
>>> Tested with the hyperv_fb driver in both configurations -- with a vmalloc()
>>> framebuffer and with an alloc_pages() framebuffer on x86. Also verified a
>>> vmalloc() framebuffer on arm64. Hardware is not available to me to verify
>>> that the older arm32 devices still work correctly, but the path for
>>> vmalloc() framebuffers is essentially unchanged.
>>>
>>> Even with these changes, defio does not support framebuffers in MMIO
>>> space, as defio code depends on framebuffer memory pages having
>>> corresponding 'struct page's.
>>>
>>> Fixes: 3a6fb6c4255c ("video: hyperv: hyperv_fb: Use physical memory for fb on HyperV Gen 1 VMs.")
>>> Signed-off-by: Michael Kelley <mhklinux@outlook.com>
>>> ---
>>> Changes in v3:
>>> * Moved definition of FBINFO_KMEMFB flag to a separate patch
>>>     preceeding this one in the patch set [Helge Deller]
>>> Changes in v2:
>>> * Tweaked code comments regarding framebuffers allocated with
>>>     dma_alloc_coherent() [Christoph Hellwig]
>>>
>>>    drivers/video/fbdev/core/fb_defio.c | 128 +++++++++++++++++++++++-----
>>>    1 file changed, 108 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
>>> index 4fc93f253e06..f8ae91a1c4df 100644
>>> --- a/drivers/video/fbdev/core/fb_defio.c
>>> +++ b/drivers/video/fbdev/core/fb_defio.c
>>> @@ -8,11 +8,40 @@
>>>     * for more details.
>>>     */
>>>
>>> +/*
>>> + * Deferred I/O ("defio") allows framebuffers that are mmap()'ed to user space
>>> + * to batch user space writes into periodic updates to the underlying
>>> + * framebuffer hardware or other implementation (such as with a virtualized
>>> + * framebuffer in a VM). At each batch interval, a callback is invoked in the
>>> + * framebuffer's kernel driver, and the callback is supplied with a list of
>>> + * pages that have been modified in the preceding interval. The callback can
>>> + * use this information to update the framebuffer hardware as necessary. The
>>> + * batching can improve performance and reduce the overhead of updating the
>>> + * hardware.
>>> + *
>>> + * Defio is supported on framebuffers allocated using vmalloc() and allocated
>>> + * as contiguous kernel memory using alloc_pages() or kmalloc(). These
>>> + * memory allocations all have corresponding "struct page"s. Framebuffers
>>> + * allocated using dma_alloc_coherent() should not be used with defio.
>>> + * Such allocations should be treated as a black box owned by the DMA
>>> + * layer, and should not be deconstructed into individual pages as defio
>>> + * does. Framebuffers in MMIO space are *not* supported because MMIO space
>>> + * does not have corrresponding "struct page"s.
>>> + *
>>> + * For framebuffers allocated using vmalloc(), struct fb_info must have
>>> + * "screen_buffer" set to the vmalloc address of the framebuffer. For
>>> + * framebuffers allocated from contiguous kernel memory, FBINFO_KMEMFB must
>>> + * be set, and "fix.smem_start" must be set to the physical address of the
>>> + * frame buffer. In both cases, "fix.smem_len" must be set to the framebuffer
>>> + * size in bytes.
>>> + */
>>> +
>>>    #include <linux/module.h>
>>>    #include <linux/kernel.h>
>>>    #include <linux/errno.h>
>>>    #include <linux/string.h>
>>>    #include <linux/mm.h>
>>> +#include <linux/pfn_t.h>
>>>    #include <linux/vmalloc.h>
>>>    #include <linux/delay.h>
>>>    #include <linux/interrupt.h>
>>> @@ -37,7 +66,7 @@ static struct page *fb_deferred_io_get_page(struct fb_info *info, unsigned long
>>>    	else if (info->fix.smem_start)
>>>    		page = pfn_to_page((info->fix.smem_start + offs) >> PAGE_SHIFT);
>>>
>>> -	if (page)
>>> +	if (page && !(info->flags & FBINFO_KMEMFB))
>>>    		get_page(page);
>>>
>>>    	return page;
>>> @@ -137,6 +166,15 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
>>>
>>>    	BUG_ON(!info->fbdefio->mapping);
>>>
>>> +	if (info->flags & FBINFO_KMEMFB)
>>> +		/*
>>> +		 * In this path, the VMA is marked VM_PFNMAP, so mm assumes
>>> +		 * there is no struct page associated with the page. The
>>> +		 * PFN must be directly inserted and the created PTE will be
>>> +		 * marked "special".
>>> +		 */
>>> +		return vmf_insert_pfn(vmf->vma, vmf->address, page_to_pfn(page));
>>> +
>>>    	vmf->page = page;
>>>    	return 0;
>>>    }
>>> @@ -163,13 +201,14 @@ EXPORT_SYMBOL_GPL(fb_deferred_io_fsync);
>>>
>>>    /*
>>>     * Adds a page to the dirty list. Call this from struct
>>> - * vm_operations_struct.page_mkwrite.
>>> + * vm_operations_struct.page_mkwrite or .pfn_mkwrite.
>>>     */
>>> -static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long offset,
>>> +static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, struct vm_fault *vmf,
>>>    					    struct page *page)
>>>    {
>>>    	struct fb_deferred_io *fbdefio = info->fbdefio;
>>>    	struct fb_deferred_io_pageref *pageref;
>>> +	unsigned long offset = vmf->pgoff << PAGE_SHIFT;
>>>    	vm_fault_t ret;
>>>
>>>    	/* protect against the workqueue changing the page list */
>>> @@ -182,20 +221,34 @@ static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long
>>>    	}
>>>
>>>    	/*
>>> -	 * We want the page to remain locked from ->page_mkwrite until
>>> -	 * the PTE is marked dirty to avoid mapping_wrprotect_range()
>>> -	 * being called before the PTE is updated, which would leave
>>> -	 * the page ignored by defio.
>>> -	 * Do this by locking the page here and informing the caller
>>> -	 * about it with VM_FAULT_LOCKED.
>>> +	 * The PTE must be marked writable before the defio deferred work runs
>>> +	 * again and potentially marks the PTE write-protected. If the order
>>> +	 * should be switched, the PTE would become writable without defio
>>> +	 * tracking the page, leaving the page forever ignored by defio.
>>> +	 *
>>> +	 * For vmalloc() framebuffers, the associated struct page is locked
>>> +	 * before releasing the defio lock. mm will later mark the PTE writaable
>>> +	 * and release the struct page lock. The struct page lock prevents
>>> +	 * the page from being prematurely being marked write-protected.
>>> +	 *
>>> +	 * For FBINFO_KMEMFB framebuffers, mm assumes there is no struct page,
>>> +	 * so the PTE must be marked writable while the defio lock is held.
>>>    	 */
>>> -	lock_page(pageref->page);
>>> +	if (info->flags & FBINFO_KMEMFB) {
>>> +		unsigned long pfn = page_to_pfn(pageref->page);
>>> +
>>> +		ret = vmf_insert_mixed_mkwrite(vmf->vma, vmf->address,
>>> +					       __pfn_to_pfn_t(pfn, PFN_SPECIAL));
>>
>> Will the VMA have VM_PFNMAP or VM_MIXEDMAP set? PFN_SPECIAL is a
>> horrible hack.
>>
>> In another thread, you mention that you use PFN_SPECIAL to bypass the
>> check in vm_mixed_ok(), so VM_MIXEDMAP is likely not set?
> 
> The VMA has VM_PFNMAP set, not VM_MIXEDMAP.  It seemed like
> VM_MIXEDMAP is somewhat of a superset of VM_PFNMAP, but maybe that's
> a wrong impression.

VM_PFNMAP: nothing is refcounted except anon pages

VM_MIXEDMAP: anything with a "struct page" (pfn_valid()) is refcounted


pte_special() is a way for GUP-fast to distinguish these refcounted (can 
GUP) from non-refcounted (camnnot GUP) pages mapped by PTEs without any 
locks or the VMA being available.


Setting pte_special() in VM_MIXEDMAP on ptes that have a "struct page" 
(pfn_valid()) is likely very bogus.

> vm_mixed_ok() does a thorough job of validating the
> use of __vm_insert_mixed(), and since what I did was allowed, I thought
> perhaps it was OK. Your feedback has set me straight, and that's what I
> needed. :-)

What exactly are you trying to achieve? :)

If it's mapping a page with a "struct page" and *not* refcounting it, 
then vmf_insert_pfn() is the current way to achieve that in a VM_PFNMAP 
mapping. It will set pte_special() automatically for you.

> 
> But the whole approach is moot with Alistair Popple's patch set that
> eliminates pfn_t. Is there an existing mm API that will do mkwrite on a
> special PTE in a VM_PFNMAP VMA? I didn't see one, but maybe I missed
> it. If there's not one, I'll take a crack at adding it in the next version of my
> patch set.

I assume you'd want vmf_insert_pfn_mkwrite(), correct? Probably 
vmf_insert_pfn_prot() can be used by adding PAGE_WRITE to pgprot. (maybe 
:) )

-- 
Cheers,

David / dhildenb

