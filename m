Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E2CA35BA1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 11:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFE810EC46;
	Fri, 14 Feb 2025 10:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eykAJ98o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E6410EC46
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 10:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739529471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v1ELqJmSBEXwSdcynoIWjIw5bhWZWQeX4Q07dCSIZyk=;
 b=eykAJ98oF3Vxl2aXTAb55Zn8yPpPK4W0YOee/UuXo4qkb/tiIA82DvKSNkxBap37heW5HQ
 qehXDEdX/2LPu/rOp9UkCRcroEe5RB5D7uW7XGhsLurLKIWlK2VI6VZLlfYSj30dxGMM/9
 vUsE3CjqbrkW/l/PDyexcOiAPdGilws=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-scGdk3SfMES02VPa9AyAsA-1; Fri, 14 Feb 2025 05:37:48 -0500
X-MC-Unique: scGdk3SfMES02VPa9AyAsA-1
X-Mimecast-MFC-AGG-ID: scGdk3SfMES02VPa9AyAsA_1739529467
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38dd8d11139so1586547f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 02:37:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739529467; x=1740134267;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=v1ELqJmSBEXwSdcynoIWjIw5bhWZWQeX4Q07dCSIZyk=;
 b=blX0Y6KVtBCKMvMnUWQd66joD4RBuYCUnioE2+7EsLv9PbVOvdqBD7xbE16INkP3vl
 WILt9l2/R0ierIE4cqaoNMyBthCrtE0yd333EDTLm3nl9HqoJRqhSdCTY483rv2JXk1A
 InYu7HK1CbDJzcAQC+rQ9j42crPRkGDoTKuJgiX+7xWyJ/Ex8rUlhT6a8UagjSgjW9Ik
 5i1LrFQqogexykFuD61v+xXdLDAsVzsTB0g9V4mCQH78uhDT/7+bqYKTEb1JVBcpne/3
 hqF7+RO/SriLSq0QE4jXR1RNjWAqQ0uhJTtTXNzr+Apw0WGvtfkYGPKf+WXlOluRAdcg
 Wj2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9kMWHGd5upEC/XWy+HNpJmfloPiW4HTcJILVfxhLaim/W3F1oLr9a8uvQPRQmqqu54nyLrIBkio8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+NNjvPjq3eUy0m4s+wRTvwQDjShXQM1tV4Ox64LphydNrntjz
 nfT3tIlNvjbv+xG5I1SxvdpcvOD2V9MzW5A2KEIWMu64W4gNXJgAFdLB0e6lAr82Y51mOrnobAf
 bay2WQwVeXrBmCMMyupFyh3fNQ2Lo3aXFpdrZjSwKIcZeWVL44KVZ8QDhemDvP3eblw==
X-Gm-Gg: ASbGncu8gL46Bf6I7Ix2ouKMq+CimR5nbAshj9/JDiFzPDJQycfkbfyPfJGaBYkM7ET
 s7hliaL2XYPBqXF6U0sF2oL3ukh/d0dwW+8MCWSA31ROvuNKDwr4QQaFcgY6LyyqYQtlJDnv0p6
 MpP+QseFlY4oUBJdaWgSv6TiZa+YHwPwi5QtVmJtMdcXC2cWRjqVR4UTj5saIADE8j/UaGJ3tjx
 LVYw0i3bXX3d6i13vVuzSMjYabCUpjVbyPCZsi0PaidJNW6z4qJpWi7DmL4lpiHi2H1FViRIGzw
 Mwx3WUDh/AnrO+L1G9X1BUwOThjdjBtLGVtB1G/hwswi79WQfHXj6XMNY99U5jUeoE99Lq5CjSf
 rBnwVhLTZrXNBOCnatKes9cGJdTH9YQ==
X-Received: by 2002:a05:6000:18a8:b0:38f:2413:2622 with SMTP id
 ffacd0b85a97d-38f24132bb7mr9218043f8f.47.1739529466890; 
 Fri, 14 Feb 2025 02:37:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4ObsXSu+uaHBcCGCpcGtfSdrcoS3HhFa3rCOolNFcAYKhUug8deHKDOqr2tqK+ZhCEHYNXw==
X-Received: by 2002:a05:6000:18a8:b0:38f:2413:2622 with SMTP id
 ffacd0b85a97d-38f24132bb7mr9218011f8f.47.1739529466461; 
 Fri, 14 Feb 2025 02:37:46 -0800 (PST)
Received: from ?IPV6:2003:cb:c709:a00:7d7d:3665:5fe4:7127?
 (p200300cbc7090a007d7d36655fe47127.dip0.t-ipconnect.de.
 [2003:cb:c709:a00:7d7d:3665:5fe4:7127])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43961e07252sm39337615e9.14.2025.02.14.02.37.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 02:37:45 -0800 (PST)
Message-ID: <1404d6a3-c27d-4d51-8e3a-e10dc040dc6e@redhat.com>
Date: Fri, 14 Feb 2025 11:37:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/17] mm: fixes for device-exclusive entries (hmm)
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, damon@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Masami Hiramatsu <mhiramat@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 SeongJae Park <sj@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250210193801.781278-1-david@redhat.com>
 <6sejv2hauce3il5lq6sw53xmjjjglxkhz5copm62oryga6jioi@u66wl2nc3hoy>
 <039b2e48-1d7c-48dc-b832-24db12af216a@redhat.com>
 <pqxzfmb2ydjgplkiswb5oxtbvpxyzmfroh2fbeqeuywklmrw6i@jbj73xssektr>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <pqxzfmb2ydjgplkiswb5oxtbvpxyzmfroh2fbeqeuywklmrw6i@jbj73xssektr>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SHvyOmNWzb0XkrdFH7evQD09heGlatyC5hYZm2jJ29E_1739529467
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

On 14.02.25 02:25, Alistair Popple wrote:
> On Thu, Feb 13, 2025 at 12:15:58PM +0100, David Hildenbrand wrote:
>> On 13.02.25 12:03, Alistair Popple wrote:
>>> On Mon, Feb 10, 2025 at 08:37:42PM +0100, David Hildenbrand wrote:
>>>> Against mm-hotfixes-stable for now.
>>>>
>>>> Discussing the PageTail() call in make_device_exclusive_range() with
>>>> Willy, I recently discovered [1] that device-exclusive handling does
>>>> not properly work with THP, making the hmm-tests selftests fail if THPs
>>>> are enabled on the system.
>>>>
>>>> Looking into more details, I found that hugetlb is not properly fenced,
>>>> and I realized that something that was bugging me for longer -- how
>>>> device-exclusive entries interact with mapcounts -- completely breaks
>>>> migration/swapout/split/hwpoison handling of these folios while they have
>>>> device-exclusive PTEs.
>>>>
>>>> The program below can be used to allocate 1 GiB worth of pages and
>>>> making them device-exclusive on a kernel with CONFIG_TEST_HMM.
>>>>
>>>> Once they are device-exclusive, these folios cannot get swapped out
>>>> (proc$pid/smaps_rollup will always indicate 1 GiB RSS no matter how
>>>> much one forces memory reclaim), and when having a memory block onlined
>>>> to ZONE_MOVABLE, trying to offline it will loop forever and complain about
>>>> failed migration of a page that should be movable.
>>>>
>>>> # echo offline > /sys/devices/system/memory/memory136/state
>>>> # echo online_movable > /sys/devices/system/memory/memory136/state
>>>> # ./hmm-swap &
>>>> ... wait until everything is device-exclusive
>>>> # echo offline > /sys/devices/system/memory/memory136/state
>>>> [  285.193431][T14882] page: refcount:2 mapcount:0 mapping:0000000000000000
>>>>     index:0x7f20671f7 pfn:0x442b6a
>>>> [  285.196618][T14882] memcg:ffff888179298000
>>>> [  285.198085][T14882] anon flags: 0x5fff0000002091c(referenced|uptodate|
>>>>     dirty|active|owner_2|swapbacked|node=1|zone=3|lastcpupid=0x7ff)
>>>> [  285.201734][T14882] raw: ...
>>>> [  285.204464][T14882] raw: ...
>>>> [  285.207196][T14882] page dumped because: migration failure
>>>> [  285.209072][T14882] page_owner tracks the page as allocated
>>>> [  285.210915][T14882] page last allocated via order 0, migratetype
>>>>     Movable, gfp_mask 0x140dca(GFP_HIGHUSER_MOVABLE|__GFP_COMP|__GFP_ZERO),
>>>>     id 14926, tgid 14926 (hmm-swap), ts 254506295376, free_ts 227402023774
>>>> [  285.216765][T14882]  post_alloc_hook+0x197/0x1b0
>>>> [  285.218874][T14882]  get_page_from_freelist+0x76e/0x3280
>>>> [  285.220864][T14882]  __alloc_frozen_pages_noprof+0x38e/0x2740
>>>> [  285.223302][T14882]  alloc_pages_mpol+0x1fc/0x540
>>>> [  285.225130][T14882]  folio_alloc_mpol_noprof+0x36/0x340
>>>> [  285.227222][T14882]  vma_alloc_folio_noprof+0xee/0x1a0
>>>> [  285.229074][T14882]  __handle_mm_fault+0x2b38/0x56a0
>>>> [  285.230822][T14882]  handle_mm_fault+0x368/0x9f0
>>>> ...
>>>>
>>>> This series fixes all issues I found so far. There is no easy way to fix
>>>> without a bigger rework/cleanup. I have a bunch of cleanups on top (some
>>>> previous sent, some the result of the discussion in v1) that I will send
>>>> out separately once this landed and I get to it.
>>>> I wish we could just use some special present PROT_NONE PTEs instead of
> 
> Yeah, that was my initial instinct when I first investigated this. As you point
> out a lack of spare PTE bits made it hard/impossible. Of course I'm about to
> give you all one back, maybe I should keep it :) I'm only kidding though - I'm
> sure there's more interesting things to spend it on.

Yes. And I think it could actually be valuable to have the option for 
more fake-prot-none things.

For example, right now we cannot really distinguish NUMA-hinting 
prot-none from ordinary prot-none without guessing based on some VMA flags.

One could implement NUMA-hinting using a PFN swap entry in an 
arch-independent way I guess.

So there are pros and cons to it. The biggest con is, that while RMAP 
can now handle it, other page table walkers mostly skip these entries.

> 
>>>
>>> First off David thanks for finding and fixing these issues. If you have further
>>> clean-ups in mind that you need help with please let me know as I'd be happy
>>> to help.
>>
>> Sure! I have some cleanups TBD as result of the previous discussion, but
>> nothing bigger so far.
>>
>> (removing the folio lock could be considered bigger, if we want to go down
>> that path)
>>
>>>
>>>> these (non-present, non-none) fake-swap entries; but that just results in
>>>> the same problem we keep having (lack of spare PTE bits), and staring at
>>>> other similar fake-swap entries, that ship has sailed.
>>>>
>>>> With this series, make_device_exclusive() doesn't actually belong into
>>>> mm/rmap.c anymore, but I'll leave moving that for another day.
>>>>
>>>> I only tested this series with the hmm-tests selftests due to lack of HW,
>>>> so I'd appreciate some testing, especially if the interaction between
>>>> two GPUs wanting a device-exclusive entry works as expected.
>>>
>>> I'm still reviewing the series but so far testing on my single GPU system
>>> appears to be working as expected. I will try and fire up a dual GPU system
>>> tomorrow and test it there as well.
>>
>> Great, thanks a bunch for testing!
>>
>> Out of interest: does the nvidia driver make use of this interface as well,
>> and are you testing with that or with the nouveau driver? I saw some reports
>> that nvidia at least checks for it [1] when building the module:
> 
> Both. I have tested Nouveau with the Mesa OpenCL stack and a simple stress test
> that just thrashes atomic accesses between CPU and GPU and a similar test for
> the nvidia driver.
> 
> In practice the nvidia driver probably doesn't use this that often as it
> more aggressively migrates data but it does use this as a fallback. Also it's
> possible for users to force residency on the CPU in which case this is used,
> which is what the test does.

Cool, thanks! (so even though nouveau is not enabled in RHEL, we'd 
effectively be using that functionality in RHEL kernels using the nvidia 
driver)

> 
> Anyway I have just finished testing on a multi-GPU setup so please feel free to
> add for the series:
> 
> Tested-by: Alistair Popple <apopple@nvidia.com>

Thanks a bunch!

-- 
Cheers,

David / dhildenb

