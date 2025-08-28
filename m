Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C521BB3ACB9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 23:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D3F10EAE2;
	Thu, 28 Aug 2025 21:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="F5wZyP/t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC1B10EAE2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 21:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756416496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Lv6/zQCqAV4OX9ZdJAAYbVMFPNXv5eYlJHCs5O334rc=;
 b=F5wZyP/t39TwSaIC3FSMtE4QhNHdIAzZAJvwB3MK54Tdw7F/JFijwp/th+V4UJc4Cu9I9M
 wshi+XujZOyguZk6OqoS7GQxEojjy/eCyDYpl5nyftnenuCAnkmx5FF60Sdd/m0TnDn8bv
 CJbHXQw6mT3C/iLG/gs3KVPx6GLfsv4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-a40fxdtNPwmUzlmZKf79LA-1; Thu, 28 Aug 2025 17:28:14 -0400
X-MC-Unique: a40fxdtNPwmUzlmZKf79LA-1
X-Mimecast-MFC-AGG-ID: a40fxdtNPwmUzlmZKf79LA_1756416494
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3c85ac51732so561173f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 14:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756416493; x=1757021293;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lv6/zQCqAV4OX9ZdJAAYbVMFPNXv5eYlJHCs5O334rc=;
 b=M0tRlvpHY+iaxz4boBznwCwKOnefZI7mefbnCwgMtiUlVK/kyxRBqtxwHfvjL9h43a
 rTYa8dMtZRmj91jRozo0Qos+nN88ZtZXyGkTGsbM0aUfwWsIMgITL4v5u/47gTwcawYY
 NoOgN/h1zPVoCY1cEO3awc353ZoQJIGjfgFIlHKr5803Wx53PfOJodnTyt0/emhfHNfd
 eaAnTanKMHwe1UYPSOWixJNZdRiFQes4ByyASCX5a4gy6rE8dvzIDSA3PKW+VhQDAU5+
 S4LCpxaRXTrfGesoWRcNeHTxEkwoB44vH6vV/yUUzz8ibYiw8AAsEHa5mfAlcboUuBgL
 L80Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP4l94PsGdXa7FhipEJqJA6kb2/6PUCKv4t5YGK1tXxS4zzVa1C9KFE1bLCl9JFmgZTdSrFZLt9T0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3UP4rB2/s15XFc1vjmNka+zcb4hFxAsOWiVZVXF4yjVA5ODEn
 gd4IEU5oM2w6sKdu1vq1h8OA2pKRuKAtRijJaUWQnynTSe3VuL/3dcBltCw5862+H1BYERhIl2v
 9UuHFGrWQ2I6DvElXL7tU0zyK1l4EmuJCDxn+Qse/st46ncQZopl7ZoIfzobBd56eKziByw==
X-Gm-Gg: ASbGncvOJUaorFv+HPUrb2l5uP05sPlsi9WNPuJZgjm81UOMmdDtrxwBl2+IgqGEZFB
 MTRSW+3dzMBDa9TsoZvkY2678f2zIZ18VLY0APRUntC1gqK7pFlwa/Yxp3BmCwLEt0gcxts/aJr
 A97nVbK9xMZ+Ki4q9dgr2kKJtKs6lFqaKnMEsB4zJm1fq78FDS9YVRR0LIulNAfDof1yVcPSwlD
 kYMF0fZWau+TXaR965Uco5Dj6D1+F4v0JLBVCEx34gT3rofsyDE9bvUrZ4auXg9nrVn25o4uK6u
 hYqdoS/xp+va7n1DfanAgSKzrxNejjvgRmTWwRpIzE0umq4tTg6yUCQX8LcvPCak643DAIYPJkX
 gUhXeNmhOAd+egq5nNWqyeEotbdms75PpOLkTa8i8Xqn/pzY+mgkrZA/n6w+43itMhF8=
X-Received: by 2002:a5d:5f44:0:b0:3b7:905e:2a32 with SMTP id
 ffacd0b85a97d-3c5db8aae79mr20134715f8f.12.1756416493552; 
 Thu, 28 Aug 2025 14:28:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpPBB1UBrq7ouKLPRciUAnI93U7all+alRRSZw1tCrq3FgG7cFJaTXK6AO/BVAXPJcbW3u9w==
X-Received: by 2002:a5d:5f44:0:b0:3b7:905e:2a32 with SMTP id
 ffacd0b85a97d-3c5db8aae79mr20134700f8f.12.1756416493054; 
 Thu, 28 Aug 2025 14:28:13 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:c100:2225:10aa:f247:7b85?
 (p200300d82f28c100222510aaf2477b85.dip0.t-ipconnect.de.
 [2003:d8:2f28:c100:2225:10aa:f247:7b85])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e88785bsm9897325e9.14.2025.08.28.14.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 14:28:12 -0700 (PDT)
Message-ID: <3a91d9df-1536-490b-bbc6-268a3a32ac1c@redhat.com>
Date: Thu, 28 Aug 2025 23:28:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: stupid and complicated PAT :)
From: David Hildenbrand <david@redhat.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 x86@kernel.org
Cc: airlied@gmail.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
References: <20250820143739.3422-1-christian.koenig@amd.com>
 <edf4aee5-54eb-4fad-aa89-4913d44371fe@redhat.com>
 <4e5f4ef0-53f1-417e-8f3b-76fd7c64cd23@amd.com>
 <f983521c-b43d-4245-93fc-fcb847908573@redhat.com>
 <a1b95d23-1908-42c1-8ff6-da051fc140aa@amd.com>
 <6591105b-969d-44d6-80e1-233c1b84b121@redhat.com>
 <fc3e013c-e7f7-441d-a638-2ee3dd372775@amd.com>
 <75aca34d-3557-49e9-a523-bd3244c28190@redhat.com>
 <a01f7ca8-7930-4b04-b597-0ebf8500a748@amd.com>
 <d32fa753-66a1-451a-8cef-95c1f78fc366@redhat.com>
 <87050572-811e-4b0c-9ebd-8ebb05f3c617@amd.com>
 <e717c8b8-51f1-4332-b5fd-ade55aaba1b0@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <e717c8b8-51f1-4332-b5fd-ade55aaba1b0@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OGDCjTh1Ml5_kwhdBH4h_zlGrF4U5ez1HlKqUxMPyF8_1756416494
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

On 28.08.25 23:18, David Hildenbrand wrote:
> On 26.08.25 18:09, Christian König wrote:
>> On 26.08.25 14:07, David Hildenbrand wrote:
>>>>
>>>>> 2) We add another interface that consumes PFNs, but explicitly states
>>>>>       that it is only for ordinary system RAM, and that the user is
>>>>>       required for updating the direct map.
>>>>>
>>>>>       We could sanity-check the direct map in debug kernels.
>>>>
>>>> I would rather like to see vmf_insert_pfn_prot() fixed instead.
>>>>
>>>> That function was explicitly added to insert the PFN with the given attributes and as far as I can see all users of that function expect exactly that.
>>>
>>> It's all a bit tricky :(
>>
>> I would rather say horrible complicated :(
>>
>>>>>
>>>>> 3) We teach PAT code in pfnmap_setup_cachemode_pfn() about treating this
>>>>>       system RAM differently.
>>>>>
>>>>>
>>>>> There is also the option for a mixture between 1 and 2, where we get pages, but we map them non-refcounted in a VM_PFNMAP.
>>>>>
>>>>> In general, having pages makes it easier to assert that they are likely ordinary system ram pages, and that the interface is not getting abused for something else.
>>>>
>>>> Well, exactly that's the use case here and that is not abusive at all as far as I can see.
>>>>
>>>> What drivers want is to insert a PFN with a certain set of caching attributes regardless if it's system memory or iomem. That's why vmf_insert_pfn_prot() was created in the first place.
>>>
>>> I mean, the use case of "allocate pages from the buddy and fixup the linear map" sounds perfectly reasonable to me. Absolutely no reason to get PAT involved. Nobody else should be messing with that memory after all.
>>>
>>> As soon as we are talking about other memory ranges (iomem) that are not from the buddy, it gets weird to bypass PAT, and the question I am asking myself is, when is it okay, and when not.
>>
>> Ok let me try to explain parts of the history and the big picture for at least the graphics use case on x86.
>>
>> In 1996/97 Intel came up with the idea of AGP: https://en.wikipedia.org/wiki/Accelerated_Graphics_Port
>>
>> At that time the CPUs, PCI bus and system memory were all connected together through the north bridge: https://en.wikipedia.org/wiki/Northbridge_(computing)
>>
>> The problem was that AGP also introduced the concept of putting large amounts of data for the video controller (PCI device) into system memory when you don't have enough local device memory (VRAM).
>>
>> But that meant when that memory is cached that the north bridge always had to snoop the CPU cache over the front side bus for every access the video controller made. This meant a huge performance bottleneck, so the idea was born to access that data uncached.
> 
> Ack.
> 
>>
>>
>> Well that was nearly 30years ago, PCI, AGP and front side bus are long gone, but the concept of putting video controller (GPU) stuff into uncached system memory has prevailed.
>>
>> So for example even modern AMD CPU based laptops need uncached system memory if their local memory is not large enough to contain the picture to display on the monitor. And with modern 8k monitors that can actually happen quite fast...
>>
>> What drivers do today is to call vmf_insert_pfn_prot() either with the PFN of their local memory (iomem) or uncached/wc system memory.
> 
> That makes perfect sense. I assume we might or might not have "struct
> page" (pfn_valid) for the iomem, depending on where these areas reside,
> correct?
> 
>>
>>
>> To summarize that we have an interface to fill in the page tables with either iomem or system memory is actually part of the design. That's how the HW driver is expected to work.
>>
>>>> That drivers need to call set_pages_wc/uc() for the linear mapping on x86 manually is correct and checking that is clearly a good idea for debug kernels.
>>>
>>> I'll have to think about this a bit: assuming only vmf_insert_pfn() calls pfnmap_setup_cachemode_pfn() but vmf_insert_pfn_prot() doesn't, how could we sanity check that somebody is doing something against the will of PAT.
>>
>> I think the most defensive approach for a quick fix is this change here:
>>
>>    static inline void pgprot_set_cachemode(pgprot_t *prot, enum page_cache_mode pcm)
>>    {
>> -       *prot = __pgprot((pgprot_val(*prot) & ~_PAGE_CACHE_MASK) |
>> -                        cachemode2protval(pcm));
>> +       if (pcm != _PAGE_CACHE_MODE_WB)
>> +               *prot = __pgprot((pgprot_val(*prot) & ~_PAGE_CACHE_MASK) |
>> +                                cachemode2protval(pcm));
>>    }
>>
>> This applies the PAT value if it's anything else than _PAGE_CACHE_MODE_WB but still allows callers to use something different on normal WB system memory.
>>
>> What do you think?
> 
> This feels like too big of a hammer. In particular, it changes things
> like phys_mem_access_prot_allowed(), which requires more care.
> 
> First, I thought we should limit what we do to vmf_insert_pfn_prot()
> only. But then I realized that we have stuff like
> 
> 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> 
> I'm still trying to find out the easy way out that is not a complete hack.
> 
> Will the iomem ever be mapped by the driver again with a different cache
> mode? (e.g., WB -> UC -> WB)

What I am currently wondering is: assume we get a 
pfnmap_setup_cachemode_pfn() call and we could reliably identify whether 
there was a previous registration, then we could do

(a) No previous registration: don't modify pgprot. Hopefully the driver
     knows what it is doing. Maybe we can add sanity checks that the
     direct map was already updated etc.

(b) A previous registration: modify pgprot like we do today.

System RAM is the problem. I wonder how many of these registrations we 
really get and if we could just store them in the same tree as !system 
RAM instead of abusing page flags.

-- 
Cheers

David / dhildenb

