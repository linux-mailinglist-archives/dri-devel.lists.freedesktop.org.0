Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E36AB3992C8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 20:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2D96EDEC;
	Wed,  2 Jun 2021 18:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2736EDEC
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 18:46:32 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ce15so5361421ejb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 11:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=DflWuocimO4x9Q/TZNXbFyNxyBL+jC9zi8j/Nmj5TM4=;
 b=QLgnNM/zpTVK7w6x0BklkQPx4tOPA80PRLPpoVK++Hzs1Jq9mTqlbioAghPStYE36S
 lvDjLSWZkLyA2sbEpyE15kbDCKoVBYHH7syU1TM0WtYYKgrCKzG7GXqsUKn8/pHoCfny
 lLPqtypl7ITjf+MgCY8wKNdeHlrmhTAuE2BHOllvT5hwTxuRraM9Mby2LA7H4f9P68wH
 qDr43jUHJE4oZB5iNQxH+LO7MZU0hO69L1hHWag2hGCuppt0KHIPogUiNH/7G9MqFHEj
 +z1fJHKNj8aRyrN22gPWdq5wi/ZuovCQuycFTZ4popL6MFy64wLSFvPP8ObvO9Y+OsrV
 aATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=DflWuocimO4x9Q/TZNXbFyNxyBL+jC9zi8j/Nmj5TM4=;
 b=J8SsOTjtLkqFQsbK+8Slpb+8aMDeZc0zPPhvrURaG8R8zjjfcnhwGuxl0Li9RMjujS
 bonmfck6KcwepxmTa/pT6v0g54Ez2tEp6efChOPv/dgzmrqG2Uen24WggFNKUcUQ5xSF
 2+lLHUxdxO4IUArwf00+AW/RVqVJjxHZ83F1/eshuHDukktQ1/jicbQw565+BQEOWgGZ
 /QMoIZr5ur5NyjaEGYwWjjd+P1tKJ0AdVgjh96E5mSUTSp/HXw9KZ1vA06BuDDjLjYau
 nPx+2+vuGJLBg0Zb55a5X37j6gsgh1ZqVRURYnHz1bC6NvwBpphbKq8qC5KDrAydj6rN
 CbbA==
X-Gm-Message-State: AOAM5333j11tHOuhj84Iio4nSpLJi8MQR1vVEyhnLSxnBwvzv/6shOC9
 vDAdjEMPhiuC6NtEIirzRSpK/l5ydpQ=
X-Google-Smtp-Source: ABdhPJwQNJjQecw7zHfYkDZYok/+66GsoZxpgnBEBrUSb+JX3itoH8y729YHsMNkY4rjRXEeJHwgHQ==
X-Received: by 2002:a17:906:27d6:: with SMTP id
 k22mr32817264ejc.323.1622659591681; 
 Wed, 02 Jun 2021 11:46:31 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:cd07:2759:3eec:1d00?
 ([2a02:908:1252:fb60:cd07:2759:3eec:1d00])
 by smtp.gmail.com with ESMTPSA id u15sm457543edy.29.2021.06.02.11.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 11:46:31 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: nuke VM_MIXEDMAP on BO mappings
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210602083013.1561-1-christian.koenig@amd.com>
 <YLfQEJy0PisO6eAh@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <afc8cb60-fa91-2d72-1e2f-24110dd0935c@gmail.com>
Date: Wed, 2 Jun 2021 20:46:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLfQEJy0PisO6eAh@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: jgg@ziepe.ca, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 02.06.21 um 20:38 schrieb Daniel Vetter:
> On Wed, Jun 02, 2021 at 10:30:13AM +0200, Christian König wrote:
>> We discussed if that is really the right approach for quite a while now, but
>> digging deeper into a bug report on arm turned out that this is actually
>> horrible broken right now.
>>
>> The reason for this is that vmf_insert_mixed_prot() always tries to grab
>> a reference to the underlaying page on architectures without
>> ARCH_HAS_PTE_SPECIAL and as far as I can see also enabled GUP.
>>
>> So nuke using VM_MIXEDMAP here and use VM_PFNMAP instead.
>>
>> Also set VM_SHARED, not 100% sure if that is needed with VM_PFNMAP, but better
>> save than sorry.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Bugs: https://gitlab.freedesktop.org/drm/amd/-/issues/1606#note_936174
> I thought we still have the same issue open for ttm_bo_vm_insert_huge()?
> Or at least a potentially pretty big bug, because our current huge entries
> don't stop gup (because there's no pmd_mkspecial right now in the kernel).
>
> So I think if you want to close this for good then we also need to
> (temporarily at least) disable the huge entry code?

That's already done (at least for ~vmwgfx) because we ran into problems 
we couldn't explain.

Going to add something which explicitly disable it with a comment.

What's the conclusion on VM_SHARED? Should I enforce this, warn about it 
or just ignore it because it doesn't matter for VM_PFNMAP?

Thanks,
Christian.

> -Daniel
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 29 +++++++----------------------
>>   1 file changed, 7 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> index 9bd15cb39145..bf86ae849340 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> @@ -359,12 +359,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>   		 * at arbitrary times while the data is mmap'ed.
>>   		 * See vmf_insert_mixed_prot() for a discussion.
>>   		 */
>> -		if (vma->vm_flags & VM_MIXEDMAP)
>> -			ret = vmf_insert_mixed_prot(vma, address,
>> -						    __pfn_to_pfn_t(pfn, PFN_DEV),
>> -						    prot);
>> -		else
>> -			ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>> +		ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>>   
>>   		/* Never error on prefaulted PTEs */
>>   		if (unlikely((ret & VM_FAULT_ERROR))) {
>> @@ -411,15 +406,9 @@ vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot)
>>   	pfn = page_to_pfn(page);
>>   
>>   	/* Prefault the entire VMA range right away to avoid further faults */
>> -	for (address = vma->vm_start; address < vma->vm_end; address += PAGE_SIZE) {
>> -
>> -		if (vma->vm_flags & VM_MIXEDMAP)
>> -			ret = vmf_insert_mixed_prot(vma, address,
>> -						    __pfn_to_pfn_t(pfn, PFN_DEV),
>> -						    prot);
>> -		else
>> -			ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>> -	}
>> +	for (address = vma->vm_start; address < vma->vm_end;
>> +	     address += PAGE_SIZE)
>> +		ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>>   
>>   	return ret;
>>   }
>> @@ -576,14 +565,10 @@ static void ttm_bo_mmap_vma_setup(struct ttm_buffer_object *bo, struct vm_area_s
>>   
>>   	vma->vm_private_data = bo;
>>   
>> -	/*
>> -	 * We'd like to use VM_PFNMAP on shared mappings, where
>> -	 * (vma->vm_flags & VM_SHARED) != 0, for performance reasons,
>> -	 * but for some reason VM_PFNMAP + x86 PAT + write-combine is very
>> -	 * bad for performance. Until that has been sorted out, use
>> -	 * VM_MIXEDMAP on all mappings. See freedesktop.org bug #75719
>> +	/* Enforce VM_SHARED here since no driver backend actually supports COW
>> +	 * on TTM buffer object mappings.
>>   	 */
>> -	vma->vm_flags |= VM_MIXEDMAP;
>> +	vma->vm_flags |= VM_PFNMAP | VM_SHARED;
>>   	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>>   }
>>   
>> -- 
>> 2.25.1
>>

