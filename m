Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CA6BC8431
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 11:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B928210E998;
	Thu,  9 Oct 2025 09:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gk842VPf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27ACD10E99C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 09:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760001633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nig+QThvSoNq9uOJUVuoYK6Ng7PXDFkVUD8omncLNk0=;
 b=gk842VPfyfIwF1lmQC6CnmosL9B2aSk/etE/AWfJEKKMU9sEYftpQgvAAe5rLvs7eD4xTT
 THyEkMUQ2Cdh9b3ie+h5zJfzs4LHIpmuiq1ySj9FsFx0dnCyHHoNDv+bu+V+yu5Qy1nNxY
 7CSdx5z1mWx6H2RUEQ8Ewuvi58mk6lI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-62UHjcXjPpGRFsZ_A5yfvw-1; Thu, 09 Oct 2025 05:20:31 -0400
X-MC-Unique: 62UHjcXjPpGRFsZ_A5yfvw-1
X-Mimecast-MFC-AGG-ID: 62UHjcXjPpGRFsZ_A5yfvw_1760001630
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-46e41c32209so3962055e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 02:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760001630; x=1760606430;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nig+QThvSoNq9uOJUVuoYK6Ng7PXDFkVUD8omncLNk0=;
 b=D1G6TTMDB7jcmv9OXEyKmN/JJk0foGLs1VAFqQ3fjFnU+tSEOkoqbDd9pqzQ1069Pr
 O63PdfW9zMVQc0/r/OviP1/J1NZ3cc/8l55EoGJdVFGUMF9uhuon7xiQ/KfsEsfWoOpy
 qIAZlO9pevpnM5nI2+/JkCCHh5HsyIMj2wK4yMsJyBtzHZ2UPEYw4gfQoeQ8SbBEe12/
 aFxfBUzSzh3Kkv4QmqOSl9nPIOMj4FExNAA2uZ1HYaJIZCYgfA598VNxxsUEGSjhKTuh
 4XmrvGVLdcekYNsvPE7VavWukgHk5yaFD6NJ8Mz9UnLs0b8bLXLTCru4+HtApaTyrNGD
 +nqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAEyw3lFYlT8h9IRshZrchKhmibRIxaO7FW/0bwwSar9mM1V46zO9PR/Ufm+YXw8fvY/8OG2GZ1zw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsFFAqDUyp527ttzW4hSpIwZCNKFmmLy5O1vJKMUTQJFrIrAwq
 YUay7UywOiX3Ex7KsD45sTDNiiESLG/8/Kwe6mv9Wp23WUZJV5gxN8cvaBNrVLf3NPxYz+8j1so
 jF+ZYn8eMhNxjHcluxALzc/u5KFFHeOt5LkgAQBSnPOY/mIkfsMLeZDg2tXgu2IcNLnrwAQ==
X-Gm-Gg: ASbGnctY7GCMYL/F2p4yS6TGufdGzxPD2tSuktl+r16lJpI0tj0Q8zdnDwBKHBNmtUz
 ujguHQ71OCndEz+RYRKt1tx1ZX39aZ4ifyNy7+H6W4sxrOC3dCfFWBuNz/juEl801EkX5WjkanM
 M2hjtiy4ZV9U3r6Js3aEq/31iXssMvYKTlYpnFqtBmIKtzsT+tLafPcux0sipyQb/gCgX9QPVdx
 KFLsH5LLKA6yCW3OMKQLE6Vz+N+a4kqDqiF62oFA6Rpb+acInpsf4OwChDvpMdSRe70Q19C7ykj
 im8Pm/CwOJgEyIxlsaF1WE2tN5qw4bUMXfdOqxzs/5hXPqqMFXnmZAHOg4kVNucJaEYOSamoSYN
 b9zRpuctn
X-Received: by 2002:a05:600c:4ed4:b0:45d:f88f:9304 with SMTP id
 5b1f17b1804b1-46fa9b0e7b3mr48455115e9.30.1760001630390; 
 Thu, 09 Oct 2025 02:20:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH6dryW1Hp7SOcSF5pIq+EEl2O3Y7bdewmy6HJCehEpHpUM9rQ1drgsPXfQB4HV8Mtnkhnzg==
X-Received: by 2002:a05:600c:4ed4:b0:45d:f88f:9304 with SMTP id
 5b1f17b1804b1-46fa9b0e7b3mr48454685e9.30.1760001629923; 
 Thu, 09 Oct 2025 02:20:29 -0700 (PDT)
Received: from [192.168.3.141] (tmo-083-189.customers.d1-online.com.
 [80.187.83.189]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8ab8b0sm33676902f8f.18.2025.10.09.02.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 02:20:29 -0700 (PDT)
Message-ID: <1db15a30-72d6-4045-8aa1-68bd8411b0ba@redhat.com>
Date: Thu, 9 Oct 2025 11:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (bisected) [PATCH v2 08/37] mm/hugetlb: check for unreasonable
 folio sizes when registering hstate
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-kernel@vger.kernel.org
Cc: Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20250901150359.867252-1-david@redhat.com>
 <20250901150359.867252-9-david@redhat.com>
 <3e043453-3f27-48ad-b987-cc39f523060a@csgroup.eu>
 <d3fc12d4-0b59-4b1f-bb5c-13189a01e13d@redhat.com>
 <faf62f20-8844-42a0-a7a7-846d8ead0622@csgroup.eu>
 <9361c75a-ab37-4d7f-8680-9833430d93d4@redhat.com>
 <03671aa8-4276-4707-9c75-83c96968cbb2@csgroup.eu>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <03671aa8-4276-4707-9c75-83c96968cbb2@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CiCjbtlmJ899V0Bqi2lWdAXcM3R-Tn8NB4RFBZvKNMI_1760001630
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

On 09.10.25 11:16, Christophe Leroy wrote:
> 
> 
> Le 09/10/2025 à 10:14, David Hildenbrand a écrit :
>> On 09.10.25 10:04, Christophe Leroy wrote:
>>>
>>>
>>> Le 09/10/2025 à 09:22, David Hildenbrand a écrit :
>>>> On 09.10.25 09:14, Christophe Leroy wrote:
>>>>> Hi David,
>>>>>
>>>>> Le 01/09/2025 à 17:03, David Hildenbrand a écrit :
>>>>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>>>>> index 1e777cc51ad04..d3542e92a712e 100644
>>>>>> --- a/mm/hugetlb.c
>>>>>> +++ b/mm/hugetlb.c
>>>>>> @@ -4657,6 +4657,7 @@ static int __init hugetlb_init(void)
>>>>>>          BUILD_BUG_ON(sizeof_field(struct page, private) *
>>>>>> BITS_PER_BYTE <
>>>>>>                  __NR_HPAGEFLAGS);
>>>>>> +    BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
>>>>>>          if (!hugepages_supported()) {
>>>>>>              if (hugetlb_max_hstate || default_hstate_max_huge_pages)
>>>>>> @@ -4740,6 +4741,7 @@ void __init hugetlb_add_hstate(unsigned int
>>>>>> order)
>>>>>>          }
>>>>>>          BUG_ON(hugetlb_max_hstate >= HUGE_MAX_HSTATE);
>>>>>>          BUG_ON(order < order_base_2(__NR_USED_SUBPAGE));
>>>>>> +    WARN_ON(order > MAX_FOLIO_ORDER);
>>>>>>          h = &hstates[hugetlb_max_hstate++];
>>>>>>          __mutex_init(&h->resize_lock, "resize mutex", &h->resize_key);
>>>>>>          h->order = order;
>>>>
>>>> We end up registering hugetlb folios that are bigger than
>>>> MAX_FOLIO_ORDER. So we have to figure out how a config can trigger that
>>>> (and if we have to support that).
>>>>
>>>
>>> MAX_FOLIO_ORDER is defined as:
>>>
>>> #ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
>>> #define MAX_FOLIO_ORDER        PUD_ORDER
>>> #else
>>> #define MAX_FOLIO_ORDER        MAX_PAGE_ORDER
>>> #endif
>>>
>>> MAX_PAGE_ORDER is the limit for dynamic creation of hugepages via
>>> /sys/kernel/mm/hugepages/ but bigger pages can be created at boottime
>>> with kernel boot parameters without CONFIG_ARCH_HAS_GIGANTIC_PAGE:
>>>
>>>      hugepagesz=64m hugepages=1 hugepagesz=256m hugepages=1
>>>
>>> Gives:
>>>
>>> HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
>>> HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
>>> HugeTLB: registered 64.0 MiB page size, pre-allocated 1 pages
>>> HugeTLB: 0 KiB vmemmap can be freed for a 64.0 MiB page
>>> HugeTLB: registered 256 MiB page size, pre-allocated 1 pages
>>> HugeTLB: 0 KiB vmemmap can be freed for a 256 MiB page
>>> HugeTLB: registered 4.00 MiB page size, pre-allocated 0 pages
>>> HugeTLB: 0 KiB vmemmap can be freed for a 4.00 MiB page
>>> HugeTLB: registered 16.0 MiB page size, pre-allocated 0 pages
>>> HugeTLB: 0 KiB vmemmap can be freed for a 16.0 MiB page
>>
>> I think it's a violation of CONFIG_ARCH_HAS_GIGANTIC_PAGE. The existing
>> folio_dump() code would not handle it correctly as well.
> 
> I'm trying to dig into history and when looking at commit 4eb0716e868e
> ("hugetlb: allow to free gigantic pages regardless of the
> configuration") I understand that CONFIG_ARCH_HAS_GIGANTIC_PAGE is
> needed to be able to allocate gigantic pages at runtime. It is not
> needed to reserve gigantic pages at boottime.
> 
> What am I missing ?

That CONFIG_ARCH_HAS_GIGANTIC_PAGE has nothing runtime-specific in its name.

Can't we just select CONFIG_ARCH_HAS_GIGANTIC_PAGE for the relevant 
hugetlb config that allows for *gigantic pages*.

-- 
Cheers

David / dhildenb

