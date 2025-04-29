Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F026AAA1178
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 18:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0664010E207;
	Tue, 29 Apr 2025 16:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Gtc58P3h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314C110E207
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 16:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745943912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KDB+A8JwGIjcFsXzh2F+2beUTgBrxjq5rWh4M65ziJ4=;
 b=Gtc58P3hLfAg6FWY1K4bWTxyyG2w0ek/nBKoakgxY2vVfc5ajsR6y6ER0bYJFQ79Vnzfsw
 bXe18Pg+btoufxzCbUTkwNx9T0qe98mDUcojtNMEcG/SwIPktSZPLKnSfdbxDM9pBpuPzL
 XJZiyebIk5YEXLCqQxWXNCitT1GrI0g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-irLkVaviPnWdApBgpt96Iw-1; Tue, 29 Apr 2025 12:25:10 -0400
X-MC-Unique: irLkVaviPnWdApBgpt96Iw-1
X-Mimecast-MFC-AGG-ID: irLkVaviPnWdApBgpt96Iw_1745943909
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43eea5a5d80so30741345e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 09:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745943909; x=1746548709;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KDB+A8JwGIjcFsXzh2F+2beUTgBrxjq5rWh4M65ziJ4=;
 b=mO7SCTTyojnvs7rMRGcacGXdS6SZqSPo1+hCveRMygtcGsUqKTbd6K/vUHogr71boZ
 sxfYrff/ZmVgMYcyKaL42Uc7nan2CekmPi1vRIQZ6GuKhbGziDWhjrtu0g/LDINgUODv
 mQa09/b7uyeuV3gq3/e3zOPS8J7IiKb+PUrI5YcI7JJZl9IYjkiRuxAhcB0haRyUsgo+
 bbAP/KzdOUlCGpsZUjK+yCo2iz9SCMyL07PqYDlk3xQKiOj9qyhDXBuLRb/xwyv6H0MZ
 Zwsb85zPiSmBPs2wbNJto+tTK76MaUoKuQzT/Y9SqF6lVIJN/X5zL8b3OeKGUthpwql0
 dj0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYSGz4beVL2F+QVc5DT2dqq0Tgi9bGUIu6Fp8GZ7QgTTyqcn/7qr0HXNa6OsxhGLkC5eY3+7gfh34=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5yaMM4VpaaopQQy8+xHbwhjYKnKAJ1j98WlKEaDnoll2tUf/G
 JnKPQZ4WWLuPdJp29RfMQhMmzjHm2oFYuKRfDKWbbE466Qw5RBbl5RUhUCs+iMgOH4owvPiHcsJ
 7Zsg8oHZz+7zc/s08a+9a+3cwVBONBbsmvAJB0WC7P8kk9Ch7c59q/Vr6W3w517gwfg==
X-Gm-Gg: ASbGncvRElHJXXWEtDrAR83vUQKUHnHAQbajriVgG6cSLRN8KnJ3OF8fMsGFB5RG3pN
 ZR+UpSm3M7rbErCcWaXsN4aW0nl4mjGzQydHOrWklUVd5PZMIWWiVl9SW0CJaltL9pjImBssRCt
 EQBr7wmmQDWCVwlCXkTVi1sWBBO+0n24MCbrpyPHvNc8JZaYYbwj6Ep9Qdd9YW+1eZQwseI7P3W
 OL7oiNtXfiPDc5HXkpun6GOl0D09/fVEPGeTn/iE9wIrGNX4/gEMg9SCqijgdxitVr6ycyKbNJ8
 vomCGNiewvBTJ0CEV8Y2Wt2szyBq3xr40jHEH1lBMXondFMFRpplCkB1a6E9NoSBFAZJ9PT1sVN
 um5aRph0Lgt3I1ljUepX5R5ir+vaCwV52qBwikp0=
X-Received: by 2002:a05:600c:34c7:b0:43d:b3:fb1 with SMTP id
 5b1f17b1804b1-440ab8713a1mr114409225e9.27.1745943909404; 
 Tue, 29 Apr 2025 09:25:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPyseW42aAVvTvcPwXt1Q40dQmqumdD/rMq2TgAupyw7prLhxicloCCNmw5GFsMeHBi1jj+Q==
X-Received: by 2002:a05:600c:34c7:b0:43d:b3:fb1 with SMTP id
 5b1f17b1804b1-440ab8713a1mr114409015e9.27.1745943908861; 
 Tue, 29 Apr 2025 09:25:08 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73b:fa00:8909:2d07:8909:6a5a?
 (p200300cbc73bfa0089092d0789096a5a.dip0.t-ipconnect.de.
 [2003:cb:c73b:fa00:8909:2d07:8909:6a5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2ad112sm193653355e9.24.2025.04.29.09.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 09:25:08 -0700 (PDT)
Message-ID: <4a57e772-51f5-4341-a249-dd1b8fcf23b0@redhat.com>
Date: Tue, 29 Apr 2025 18:25:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/11] mm: convert track_pfn_insert() to
 pfnmap_sanitize_pgprot()
To: Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-3-david@redhat.com> <aAvjJOmvm5GsZ-JN@x1.local>
 <78f88303-6b00-42cf-8977-bf7541fa45a9@redhat.com> <aAwh6n058Hh490io@x1.local>
 <75998f7c-93d2-4b98-bb53-8d858b2c108e@redhat.com> <aA-q_PrThAw5v1PF@x1.local>
 <57f9480c-2f8c-4be8-864c-406fec917eb1@redhat.com> <aBDXr-Qp4z0tS50P@x1.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aBDXr-Qp4z0tS50P@x1.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TfqPR4dhjMfHQe0ttu8BoiEZwz1wyXP-o98_I5qLP8c_1745943909
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 29.04.25 15:44, Peter Xu wrote:
> On Mon, Apr 28, 2025 at 10:37:49PM +0200, David Hildenbrand wrote:
>> On 28.04.25 18:21, Peter Xu wrote:
>>> On Mon, Apr 28, 2025 at 04:58:46PM +0200, David Hildenbrand wrote:
>>>>
>>>>>> What it does on PAT (only implementation so far ...) is looking up the
>>>>>> memory type to select the caching mode that can be use.
>>>>>>
>>>>>> "sanitize" was IMHO a good fit, because we must make sure that we don't use
>>>>>> the wrong caching mode.
>>>>>>
>>>>>> update/setup/... don't make that quite clear. Any other suggestions?
>>>>>
>>>>> I'm very poor on naming.. :( So far anything seems slightly better than
>>>>> sanitize to me, as the word "sanitize" is actually also used in memtype.c
>>>>> for other purpose.. see sanitize_phys().
>>>>
>>>> Sure, one can sanitize a lot of things. Here it's the cachemode/pgrpot, in
>>>> the other functions it's an address.
>>>>
>>>> Likely we should just call it pfnmap_X_cachemode()/
>>>>
>>>> Set/update don't really fit for X in case pfnmap_X_cachemode() is a NOP.
>>>>
>>>> pfnmap_setup_cachemode() ? Hm.
>>>
>>> Sounds good here.
>>
>> Okay, I'll use that one. If ever something else besides PAT would require
>> different semantics, they can bother with finding a better name :)
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>>> + * @pfn: the start of the pfn range
>>>>>>>> + * @size: the size of the pfn range
>>>>>>>> + * @prot: the pgprot to sanitize
>>>>>>>> + *
>>>>>>>> + * Sanitize the given pgprot for a pfn range, for example, adjusting the
>>>>>>>> + * cachemode.
>>>>>>>> + *
>>>>>>>> + * This function cannot fail for a single page, but can fail for multiple
>>>>>>>> + * pages.
>>>>>>>> + *
>>>>>>>> + * Returns 0 on success and -EINVAL on error.
>>>>>>>> + */
>>>>>>>> +int pfnmap_sanitize_pgprot(unsigned long pfn, unsigned long size,
>>>>>>>> +		pgprot_t *prot);
>>>>>>>>      extern int track_pfn_copy(struct vm_area_struct *dst_vma,
>>>>>>>>      		struct vm_area_struct *src_vma, unsigned long *pfn);
>>>>>>>>      extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
>>>>>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>>>>>> index fdcf0a6049b9f..b8ae5e1493315 100644
>>>>>>>> --- a/mm/huge_memory.c
>>>>>>>> +++ b/mm/huge_memory.c
>>>>>>>> @@ -1455,7 +1455,9 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
>>>>>>>>      			return VM_FAULT_OOM;
>>>>>>>>      	}
>>>>>>>> -	track_pfn_insert(vma, &pgprot, pfn);
>>>>>>>> +	if (pfnmap_sanitize_pgprot(pfn_t_to_pfn(pfn), PAGE_SIZE, &pgprot))
>>>>>>>> +		return VM_FAULT_FALLBACK;
>>>>>>>
>>>>>>> Would "pgtable" leak if it fails?  If it's PAGE_SIZE, IIUC it won't ever
>>>>>>> trigger, though.
>>>>>>>
>>>>>>> Maybe we could have a "void pfnmap_sanitize_pgprot_pfn(&pgprot, pfn)" to
>>>>>>> replace track_pfn_insert() and never fail?  Dropping vma ref is definitely
>>>>>>> a win already in all cases.
>>>>>>
>>>>>> It could be a simple wrapper around pfnmap_sanitize_pgprot(), yes. That's
>>>>>> certainly helpful for the single-page case.
>>>>>>
>>>>>> Regarding never failing here: we should check the whole range. We have to
>>>>>> make sure that none of the pages has a memory type / caching mode that is
>>>>>> incompatible with what we setup.
>>>>>
>>>>> Would it happen in real world?
>>>>>> IIUC per-vma registration needs to happen first, which checks for
>>>> memtype
>>>>> conflicts in the first place, or reserve_pfn_range() could already have
>>>>> failed.
>>>>>> Here it's the fault path looking up the memtype, so I would expect it is
>>>>> guaranteed all pfns under the same vma is following the verified (and same)
>>>>> memtype?
>>>>
>>>> The whole point of track_pfn_insert() is that it is used when we *don't* use
>>>> reserve_pfn_range()->track_pfn_remap(), no?
>>>>
>>>> track_pfn_remap() would check the whole range that gets mapped, so
>>>> track_pfn_insert() user must similarly check the whole range that gets
>>>> mapped.
>>>>
>>>> Note that even track_pfn_insert() is already pretty clear on the intended
>>>> usage: "called when a _new_ single pfn is established"
>>>
>>> We need to define "new" then..  But I agree it's not crystal clear at
>>> least.  I think I just wasn't the first to assume it was reserved, see this
>>> (especially, the "Expectation" part..):
>>>
>>> commit 5180da410db6369d1f95c9014da1c9bc33fb043e
>>> Author: Suresh Siddha <suresh.b.siddha@intel.com>
>>> Date:   Mon Oct 8 16:28:29 2012 -0700
>>>
>>>       x86, pat: separate the pfn attribute tracking for remap_pfn_range and vm_insert_pfn
>>>       With PAT enabled, vm_insert_pfn() looks up the existing pfn memory
>>>       attribute and uses it.  Expectation is that the driver reserves the
>>>       memory attributes for the pfn before calling vm_insert_pfn().
>>
>> It's all confusing.
>>
>> We do have the following functions relevant in pat code:
>>
>> (1) memtype_reserve(): used by ioremap and set_memory_XX
>>
>> (2) memtype_reserve_io(): used by iomap
>>
>> (3) reserve_pfn_range(): only remap_pfn_range() calls it
>>
>> (4) arch_io_reserve_memtype_wc()
>>
>>
>> Which one would perform the reservation for, say, vfio?
> 
> My understanding is it was done via barmap.  See this stack:
> 
> vfio_pci_core_mmap
>    pci_iomap
>      pci_iomap_range
>        ...
>          __ioremap_caller
>            memtype_reserve
> 
>>
>>
>> I agree that if there would be a guarantee/expectation that all PFNs have
>> the same memtype (from previous reservation), it would be sufficient to
>> check a single PFN, and we could document that. I just don't easily see
>> where that reservation is happening.
>>
>> So a pointer to that would be appreciated!
> 
> I am not aware of any pointer.. maybe others could chime in.
> 
> IMHO, if there's anything uncertain, for this one we could always decouple
> this issue from the core issue you're working on, so at least it keeps the
> old behavior (which is pure lookup on pfn injections) until a solid issue
> occurs?  It avoids the case where we could introduce unnecessary code but
> then it's much harder to justify a removal.  What do you think?

I'll use the _pfn variant and document the behavior.

I do wonder why we even have to lookup the memtype again if the caller 
apparently reserved it (which implied checking it). All a bit weird.

-- 
Cheers,

David / dhildenb

