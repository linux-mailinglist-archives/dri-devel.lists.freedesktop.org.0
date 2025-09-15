Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3DDB572CB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 10:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D79D10E341;
	Mon, 15 Sep 2025 08:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EF8M1DEn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36C010E341
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 08:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757924613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JqhshB8TYPsb+g5TmZKbNKCw5pbdQvF7Hb0F2Aj5puM=;
 b=EF8M1DEnmtsb4IDyQM2JoSORAFLsbQZJNVbK+iLmFsccISGs51f4GlW6QnldmO1lg8lbdo
 um7AUbDHOAAov247qjYWsutqhw6Mo3sH+YRXCLXA6tAjJQeoYsUEwMjE8OF80NuFkV0zIM
 17XUy/KU8tBhx7eC6tJVaDVjmWLerG4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-6I_OjBevNFWjh68uvjbEJQ-1; Mon, 15 Sep 2025 04:23:31 -0400
X-MC-Unique: 6I_OjBevNFWjh68uvjbEJQ-1
X-Mimecast-MFC-AGG-ID: 6I_OjBevNFWjh68uvjbEJQ_1757924610
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3e9c932a4dfso467784f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757924610; x=1758529410;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JqhshB8TYPsb+g5TmZKbNKCw5pbdQvF7Hb0F2Aj5puM=;
 b=HkfDt0LeaPx/MJykpLjIXhsliPPSsDj+ilKdt1KSCgjsjIQ4snMaA5gTkCcUgT1AeL
 fIiViaJ1iQSIccTaCVvrcm6KzYeHym1ztqGkv9mSoOaKpl6ErTiWCfvm6TkrmO2U1Db0
 pX62g1IhmucwL0HpSy2IrSEh8wpuF1Gy8e8nHJNeGaSiJNSZUesLz3iOpJyH2zm+OXAz
 BQwiAlyZfY/d9iq4ZMZv+LQoLaWkuFwk5SoeNtny1KHZixXZ3IOegB6DM6SzmyOaDlyb
 J4q4gmNg/ba1oBc2tm2sgGif5/SuE8tEhRyrhRAFDZCaEUR0w0wQETjonNbt5bDYnk25
 MtZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4kG8YVhDO2pLiQHdfXOpAROOX9jgpPXD90hZzCtY/rx7T58wytLXOwMxxgKZi6uBsHoTwZq0uqpY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUKlmD6lSeraKAcntC+ICSuLkKLlndKiME5FOC9KkLVpdvrE4K
 6ijvxD4AZqfrPMuxZPFCteUh+m7OUZaUS0MTLCeSt6tZ0hSjvVyRP1K+KYI3xGN025VY5AXuGm3
 n/tA6jYKeECxQ6wJPWHStHuisVKs1XrlT+Clt6a456HifOVC2Pj7vv06LI6qs3r+SE8djrA==
X-Gm-Gg: ASbGncsdaHWGlNX3MJWQaNI/VbdwBuJh7FL2oo/+utyC56+R+7vSrmonujB2BIi/hsU
 Kclt+2d4t4vi56/VloN08AAtl62k7Jl82PyGvHP4thPIX6JX7mhbTacp0otUUH5l+mDY8WJZhmv
 +9Vwe1w/csVChud3FgQlACT5Ps3BU36Eu6r88GkwxRTEuTlUnXGsigG9jq4ITqG9KSS4mF676aT
 NLGgpUqLXWkIjgdI30OrWNSjL6pjXLcivf1mJhblND+aGZBEzg4Ym/eMzh3psHWr8nx0Kd+fgzR
 hhRXvyWx/zmWyzbBTqH4IY3/2bg3mV8eF1gBhQHng7c9iyeoSnZhD6W/S8ChSMrbIKcxdlfmd1a
 bh9QBWcZF9m/27acdxYg7Q7wbGI0mU6PIKDkWCZzAarsaeQZL1qw1ZvRdv/VwlpfF1tI=
X-Received: by 2002:adf:e8c9:0:b0:3ea:f4a1:f067 with SMTP id
 ffacd0b85a97d-3eaf4a1f3b9mr1182521f8f.48.1757924610376; 
 Mon, 15 Sep 2025 01:23:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN3XeyCLaRYHldjOQ9OEelMTey5LNlW0frPUT1EYWkvYswnHtxiqghkiDAMSUmTm6fMzozBQ==
X-Received: by 2002:adf:e8c9:0:b0:3ea:f4a1:f067 with SMTP id
 ffacd0b85a97d-3eaf4a1f3b9mr1182484f8f.48.1757924609866; 
 Mon, 15 Sep 2025 01:23:29 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:f900:e0ae:65d5:8bf8:8cfd?
 (p200300d82f18f900e0ae65d58bf88cfd.dip0.t-ipconnect.de.
 [2003:d8:2f18:f900:e0ae:65d5:8bf8:8cfd])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ea9abd7234sm3683870f8f.59.2025.09.15.01.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 01:23:29 -0700 (PDT)
Message-ID: <12299d6a-487a-4d29-a74a-a53928b83dd0@redhat.com>
Date: Mon, 15 Sep 2025 10:23:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 04/15] mm/huge_memory: implement device-private THP splitting
To: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
 <20250908000448.180088-5-balbirs@nvidia.com>
 <ca592d4a-3e91-48ea-970e-a5ff12f215be@redhat.com>
 <dbb631dc-32d3-4b2d-a23c-968c7a61001c@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZoEEwEIAEQCGwMCF4ACGQEFCwkIBwICIgIG
 FQoJCAsCBBYCAwECHgcWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaJzangUJJlgIpAAKCRBN
 3hD3AP+DWhAxD/9wcL0A+2rtaAmutaKTfxhTP0b4AAp1r/eLxjrbfbCCmh4pqzBhmSX/4z11
 opn2KqcOsueRF1t2ENLOWzQu3Roiny2HOU7DajqB4dm1BVMaXQya5ae2ghzlJN9SIoopTWlR
 0Af3hPj5E2PYvQhlcqeoehKlBo9rROJv/rjmr2x0yOM8qeTroH/ZzNlCtJ56AsE6Tvl+r7cW
 3x7/Jq5WvWeudKrhFh7/yQ7eRvHCjd9bBrZTlgAfiHmX9AnCCPRPpNGNedV9Yty2Jnxhfmbv
 Pw37LA/jef8zlCDyUh2KCU1xVEOWqg15o1RtTyGV1nXV2O/mfuQJud5vIgzBvHhypc3p6VZJ
 lEf8YmT+Ol5P7SfCs5/uGdWUYQEMqOlg6w9R4Pe8d+mk8KGvfE9/zTwGg0nRgKqlQXrWRERv
 cuEwQbridlPAoQHrFWtwpgYMXx2TaZ3sihcIPo9uU5eBs0rf4mOERY75SK+Ekayv2ucTfjxr
 Kf014py2aoRJHuvy85ee/zIyLmve5hngZTTe3Wg3TInT9UTFzTPhItam6dZ1xqdTGHZYGU0O
 otRHcwLGt470grdiob6PfVTXoHlBvkWRadMhSuG4RORCDpq89vu5QralFNIf3EysNohoFy2A
 LYg2/D53xbU/aa4DDzBb5b1Rkg/udO1gZocVQWrDh6I2K3+cCs7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <dbb631dc-32d3-4b2d-a23c-968c7a61001c@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -saLZh9gZV-hsiDsQEQMOdVzz3O9jsFLA0qOcJYHGI4_1757924610
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

[...]

>>>          VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
>>>        VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
>>>        VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
>>> -    VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd));
>>> +
>>> +    VM_WARN_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd) &&
>>> +            !is_pmd_device_private_entry(*pmd));
>>>    
>>
>> Indentation. But I do wonder if we want a helper to do a more
>> efficient
>>
> 
> The indentation at my end is fine, do you mean you want to see the conditions aligned?
> 

If that's the case then all good (sometimes the added +/-/" " in the 
diff mess it up and confuse me)

>> is_pmd_migration_entry() || is_pmd_device_private_entry()
>>
>> If only I could come up with a good name ... any ideas?
>>
>> is_non_present_folio_entry()
>>
>> maybe?
>>
> 
> There is is_pfn_swap_entry(), but that includes hwpoison entries as well.

Yes, we could just use that I guess. Or alternatively add a

is_non_present_folio_entry() that does not include hwpoison (because 
they are special).

> 
> 
>> Well, there is device-exclusive .... but that would not be reachable on these paths yet, ever.
>>
>>
>>>        count_vm_event(THP_SPLIT_PMD);
>>>    @@ -2937,18 +2940,43 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>>            return __split_huge_zero_page_pmd(vma, haddr, pmd);
>>>        }
>>>    -    pmd_migration = is_pmd_migration_entry(*pmd);
>>> -    if (unlikely(pmd_migration)) {
>>> -        swp_entry_t entry;
>>>    +    present = pmd_present(*pmd);
>>> +    if (unlikely(!present)) {
>>
>> I hate this whole function. But maybe in this case it's better
>> to just have here
>>
>> if (is_pmd_migration_entry(old_pmd)) {
>>
>> } else if (is_pmd_device_private_entry(old_pmd)) {
>>
>> There is not much shared code and the helps reduce the indentation level.
>>
> 
> We can definitely try this
> 
>>> +        swp_entry = pmd_to_swp_entry(*pmd);
>>>            old_pmd = *pmd;
>>> -        entry = pmd_to_swp_entry(old_pmd);
>>> -        page = pfn_swap_entry_to_page(entry);
>>> -        write = is_writable_migration_entry(entry);
>>> -        if (PageAnon(page))
>>> -            anon_exclusive = is_readable_exclusive_migration_entry(entry);
>>> -        young = is_migration_entry_young(entry);
>>> -        dirty = is_migration_entry_dirty(entry);
>>> +
>>> +        folio = pfn_swap_entry_folio(swp_entry);
>>> +        VM_WARN_ON(!is_migration_entry(swp_entry) &&
>>> +                !is_device_private_entry(swp_entry));
>>
>> Indentation.
> 
> Same as above, checkpatch.pl does not seem to complain

Make sure that both "!" are equally indented. checkpatch does not catch 
what we usually do in MM (if you read other code).

[...]

>>>            soft_dirty = pmd_swp_soft_dirty(old_pmd);
>>>            uffd_wp = pmd_swp_uffd_wp(old_pmd);
>>>        } else {
>>> @@ -3034,30 +3062,49 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>>         * Note that NUMA hinting access restrictions are not transferred to
>>>         * avoid any possibility of altering permissions across VMAs.
>>>         */
>>> -    if (freeze || pmd_migration) {
>>> +    if (freeze || !present) {
>>
>> Here too, I wonder if we should just handle device-private completely separately for now.
>>
> 
> For all practical purposes they are inside the if statement. freeze and is_migration need to go together.
> 

Right, but there is only the loop part share between

freeze || is_migration_entry(swp_entry)

and device_private entries.

So we can just avoid that churn and handle device_private entries 
separately, right?


-- 
Cheers

David / dhildenb

