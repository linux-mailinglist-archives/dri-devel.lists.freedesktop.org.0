Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E7CB9982E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 12:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2056110E6F2;
	Wed, 24 Sep 2025 10:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Q5SoftSH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E9310E6F2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 10:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758711343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rgHkHNt67H2VR6SJIOZVX7+TtZfrS4aX97lbxdbd4Fs=;
 b=Q5SoftSHdUjuZ7rOGfqISTgJgZeJw9aR6dHRnTwuIfeNss4VkXId8yVZ2NkGU6tz7awKd/
 CNae8hw14TLnyKXzB7Vkdg83T3ezTV1TAvdhjQVgHdqcj/XKa/AZNWLV2U9wqo/4ra+Z6C
 IjDJjZlcqUlZJiEJRFi4JWGZev8kvck=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-bmR2ScGBOvGPRaAr-loT5A-1; Wed, 24 Sep 2025 06:55:36 -0400
X-MC-Unique: bmR2ScGBOvGPRaAr-loT5A-1
X-Mimecast-MFC-AGG-ID: bmR2ScGBOvGPRaAr-loT5A_1758711335
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3f42b54d159so3865352f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 03:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758711335; x=1759316135;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rgHkHNt67H2VR6SJIOZVX7+TtZfrS4aX97lbxdbd4Fs=;
 b=Plwx11ttKxaMfWlFtcey8u2EebncvQ4atGLOHf1FRPGopEObNRqJLmwaP5GhHLk7mH
 5KIgizJxCWel/LHLNtA/dmK9h3O2F1floy+0+XfM1xhXaX1Mrdeg6FhhzUGeiSKVvpxz
 h/3ImBsEOqCZj+kaTRAGpR0be4IizRysfdc6rSMxFL44wGYkeGjWpaCHpnMk6j/FL0Sg
 8vNJZLYr8lXgSpOG4gbAx28VeS8mFH3PxcgKFf9ZQ6M+LH0Wm+4XfwYQ+ZuNbQ3goev3
 iAGPkh/j1uEnj0rmuyuVVHNIZHZSrYOp0/17plWLtbRLYwXLow/P2y9BM2AAr0e+3fEA
 4/8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjiak+82X0YSMq/LSfzfpe5JQ3Uau9IIDGaBl/0InCc5c3PFgvEoaMIxTYX6fUT7eU0VQqMVhVUro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznpMRX/G+7dsz0v4e2swm1spMeMNqrJxQOTg4mFTHlhZgXvnZm
 5K+yOPmypnJEGgtte49HDQLVgnFtfVo6XLxPxD+ElW/gJhOn4soK5JhtN+BK0AVCpsYS9rATc5l
 m6k5byqnp4EhbwMatiLQyDpANDVE2NnlBs5uAM+SbPUf6ZbYqioNGL8tp74pXOZ6eY98/ZQ==
X-Gm-Gg: ASbGnct7dpw4G+PWLCNSLrf612NVLWgXNB8H8DHEC4QpMkaIYhqKuADcKqUD8ZjZYbY
 b9vzKY1HSo7bqhrwP+KjEFLIuOjg6YyW24+AexHZf8ZWocG/eSAnVVsJKpDMO88+YJEm9ZpCeMC
 Kg8dB4DPJzXEHbNb0YqyXA1MbnGS7hnajuKtIRgi2o1hK1wk/uAl/mVIO8Ukw3E8IQ+aLGS95D3
 YrRq/WwWHbCBLjvTY+9eQADzwKciIzU7zY8xO71kZKhUM//vYAxsoRCvVbm6Xcp8OtuXDN123HZ
 JAfvV+wys55gB54bfk0TLu8Jx1sam72aQYsYxFMO5y/G+c0uBAoTg8n5db4MdcWtYKC9eCsp4Aj
 QpaV8NPsYyDzhQ+2QfP1H7wGl0iWR9HWSYTkjQcKznH88blVpwTq+vX0myw4ugMpeWQ==
X-Received: by 2002:a05:6000:1a8b:b0:3dc:ca9d:e3d7 with SMTP id
 ffacd0b85a97d-405c49a2535mr4339945f8f.8.1758711335057; 
 Wed, 24 Sep 2025 03:55:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9F10QRVubpfPdlLgGPOfukR+lpWIlYHcLY3uqRro+BPclJ5g5KC9jcCzUQ8wVcmeE5m+5Mw==
X-Received: by 2002:a05:6000:1a8b:b0:3dc:ca9d:e3d7 with SMTP id
 ffacd0b85a97d-405c49a2535mr4339904f8f.8.1758711334526; 
 Wed, 24 Sep 2025 03:55:34 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f14:2400:afc:9797:137c:a25b?
 (p200300d82f1424000afc9797137ca25b.dip0.t-ipconnect.de.
 [2003:d8:2f14:2400:afc:9797:137c:a25b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2b610cf3sm11459255e9.1.2025.09.24.03.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 03:55:33 -0700 (PDT)
Message-ID: <9c263334-c0f3-4af0-88a8-8ed19ef6b83d@redhat.com>
Date: Wed, 24 Sep 2025 12:55:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 01/15] mm/zone_device: support large zone device private
 folios
To: Zi Yan <ziy@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, damon@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Oscar Salvador <osalvador@suse.de>,
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
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-2-balbirs@nvidia.com>
 <882D81FA-DA40-4FF9-8192-166DBE1709AF@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <882D81FA-DA40-4FF9-8192-166DBE1709AF@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hZCt06PNjLKeJFyb4QqZkDVT4hqfRWUOCNPrz_KjJ54_1758711335
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

On 18.09.25 04:49, Zi Yan wrote:
> On 16 Sep 2025, at 8:21, Balbir Singh wrote:
> 
>> Add routines to support allocation of large order zone device folios
>> and helper functions for zone device folios, to check if a folio is
>> device private and helpers for setting zone device data.
>>
>> When large folios are used, the existing page_free() callback in
>> pgmap is called when the folio is freed, this is true for both
>> PAGE_SIZE and higher order pages.
>>
>> Zone device private large folios do not support deferred split and
>> scan like normal THP folios.
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>> Cc: Rakie Kim <rakie.kim@sk.com>
>> Cc: Byungchul Park <byungchul@sk.com>
>> Cc: Gregory Price <gourry@gourry.net>
>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>> Cc: Alistair Popple <apopple@nvidia.com>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>> Cc: Nico Pache <npache@redhat.com>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Dev Jain <dev.jain@arm.com>
>> Cc: Barry Song <baohua@kernel.org>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>> Cc: Mika Penttilä <mpenttil@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>> ---
>>   include/linux/memremap.h | 10 +++++++++-
>>   mm/memremap.c            | 34 +++++++++++++++++++++-------------
>>   mm/rmap.c                |  6 +++++-
>>   3 files changed, 35 insertions(+), 15 deletions(-)
>>
>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>> index e5951ba12a28..9c20327c2be5 100644
>> --- a/include/linux/memremap.h
>> +++ b/include/linux/memremap.h
>> @@ -206,7 +206,7 @@ static inline bool is_fsdax_page(const struct page *page)
>>   }
>>
>>   #ifdef CONFIG_ZONE_DEVICE
>> -void zone_device_page_init(struct page *page);
>> +void zone_device_folio_init(struct folio *folio, unsigned int order);
>>   void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>>   void memunmap_pages(struct dev_pagemap *pgmap);
>>   void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
>> @@ -215,6 +215,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn);
>>   bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>>
>>   unsigned long memremap_compat_align(void);
>> +
>> +static inline void zone_device_page_init(struct page *page)
>> +{
>> +	struct folio *folio = page_folio(page);
>> +
>> +	zone_device_folio_init(folio, 0);
> 
> I assume it is for legacy code, where only non-compound page exists?
> 
> It seems that you assume @page is always order-0, but there is no check
> for it. Adding VM_WARN_ON_ONCE_FOLIO(folio_order(folio) != 0, folio)
> above it would be useful to detect misuse.
> 
>> +}
>> +
>>   #else
>>   static inline void *devm_memremap_pages(struct device *dev,
>>   		struct dev_pagemap *pgmap)
>> diff --git a/mm/memremap.c b/mm/memremap.c
>> index 46cb1b0b6f72..a8481ebf94cc 100644
>> --- a/mm/memremap.c
>> +++ b/mm/memremap.c
>> @@ -416,20 +416,19 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
>>   void free_zone_device_folio(struct folio *folio)
>>   {
>>   	struct dev_pagemap *pgmap = folio->pgmap;
>> +	unsigned long nr = folio_nr_pages(folio);
>> +	int i;
>>
>>   	if (WARN_ON_ONCE(!pgmap))
>>   		return;
>>
>>   	mem_cgroup_uncharge(folio);
>>
>> -	/*
>> -	 * Note: we don't expect anonymous compound pages yet. Once supported
>> -	 * and we could PTE-map them similar to THP, we'd have to clear
>> -	 * PG_anon_exclusive on all tail pages.
>> -	 */
>>   	if (folio_test_anon(folio)) {
>> -		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
>> -		__ClearPageAnonExclusive(folio_page(folio, 0));
>> +		for (i = 0; i < nr; i++)
>> +			__ClearPageAnonExclusive(folio_page(folio, i));
>> +	} else {
>> +		VM_WARN_ON_ONCE(folio_test_large(folio));
>>   	}
>>
>>   	/*
>> @@ -456,8 +455,8 @@ void free_zone_device_folio(struct folio *folio)
>>   	case MEMORY_DEVICE_COHERENT:
>>   		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
>>   			break;
>> -		pgmap->ops->page_free(folio_page(folio, 0));
>> -		put_dev_pagemap(pgmap);
>> +		pgmap->ops->page_free(&folio->page);
>> +		percpu_ref_put_many(&folio->pgmap->ref, nr);
>>   		break;
>>
>>   	case MEMORY_DEVICE_GENERIC:
>> @@ -480,14 +479,23 @@ void free_zone_device_folio(struct folio *folio)
>>   	}
>>   }
>>
>> -void zone_device_page_init(struct page *page)
>> +void zone_device_folio_init(struct folio *folio, unsigned int order)
>>   {
>> +	struct page *page = folio_page(folio, 0);
> 
> It is strange to see a folio is converted back to page in
> a function called zone_device_folio_init().
> 
>> +
>> +	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>> +
>>   	/*
>>   	 * Drivers shouldn't be allocating pages after calling
>>   	 * memunmap_pages().
>>   	 */
>> -	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
>> -	set_page_count(page, 1);
>> +	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
>> +	folio_set_count(folio, 1);
>>   	lock_page(page);
>> +
>> +	if (order > 1) {
>> +		prep_compound_page(page, order);
>> +		folio_set_large_rmappable(folio);
>> +	}
> 
> OK, so basically, @folio is not a compound page yet when zone_device_folio_init()
> is called.
> 
> I feel that your zone_device_page_init() and zone_device_folio_init()
> implementations are inverse. They should follow the same pattern
> as __alloc_pages_noprof() and __folio_alloc_noprof(), where
> zone_device_page_init() does the actual initialization and
> zone_device_folio_init() just convert a page to folio.
> 
> Something like:
> 
> void zone_device_page_init(struct page *page, unsigned int order)
> {
> 	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> 
> 	/*
> 	 * Drivers shouldn't be allocating pages after calling
> 	 * memunmap_pages().
> 	 */
> 
>      WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
> 	
> 	/*
> 	 * anonymous folio does not support order-1, high order file-backed folio
> 	 * is not supported at all.
> 	 */
> 	VM_WARN_ON_ONCE(order == 1);
> 
> 	if (order > 1)
> 		prep_compound_page(page, order);
> 
> 	/* page has to be compound head here */
> 	set_page_count(page, 1);
> 	lock_page(page);
> }
> 
> void zone_device_folio_init(struct folio *folio, unsigned int order)
> {
> 	struct page *page = folio_page(folio, 0);
> 
> 	zone_device_page_init(page, order);
> 	page_rmappable_folio(page);
> }
> 
> Or
> 
> struct folio *zone_device_folio_init(struct page *page, unsigned int order)
> {
> 	zone_device_page_init(page, order);
> 	return page_rmappable_folio(page);
> }

I think the problem is that it will all be weird once we dynamically 
allocate "struct folio".

I have not yet a clear understanding on how that would really work.

For example, should it be pgmap->ops->page_folio() ?

Who allocates the folio? Do we allocate all order-0 folios initially, to 
then merge them when constructing large folios? How do we manage the 
"struct folio" during such merging splitting?

With that in mind, I don't really know what the proper interface should 
be today.


zone_device_folio_init(struct page *page, unsigned int order)

looks cleaner, agreed.

> 
> 
> Then, it comes to free_zone_device_folio() above,
> I feel that pgmap->ops->page_free() should take an additional order
> parameter to free a compound page like free_frozen_pages().
> 

IIRC free_frozen_pages() does not operate on compound pages. If we know 
that we are operating on a compound page (or single page) then passing 
in the page (or better the folio) should work.

-- 
Cheers

David / dhildenb

