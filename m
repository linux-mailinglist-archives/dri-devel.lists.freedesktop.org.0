Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6263B3AB92
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 22:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEB210EAB9;
	Thu, 28 Aug 2025 20:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SY9R0dav";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5065210EAB9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 20:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756412578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iCw6S1c4Czg1r6M7ZHaUoX4qfCo09yOzs1izbaqUr5M=;
 b=SY9R0davtR+Rtkm/XgRylqZ7uJYz2FlsDT5Ab9PTD5fI4GX2ggxU0c6oeU6fTM6jvGHJKl
 ooc9+NMLs+xeXIAA9QkSWGVYe8s0NL5uX6ydfSYUpT/h41bkC131mwOSz/5bHYbuWiQk2i
 fkeHvzXzj3CCQ5XjO0DzfB7Qo1PEHqM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372--61vO_ZVNsKHEecWIVq-bw-1; Thu, 28 Aug 2025 16:22:56 -0400
X-MC-Unique: -61vO_ZVNsKHEecWIVq-bw-1
X-Mimecast-MFC-AGG-ID: -61vO_ZVNsKHEecWIVq-bw_1756412575
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3cf12498799so99533f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 13:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756412575; x=1757017375;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iCw6S1c4Czg1r6M7ZHaUoX4qfCo09yOzs1izbaqUr5M=;
 b=vdndB1wBZxcKYqa+HmCq5t2B29Fx0P0OKRcTQCWciuksAB9hfnmGL1AaW71ojj+cU9
 FQ5+qeNT6LmWDRqe4e0WGX7X281u1eHO22BJxLR8/wOM+PN8Ibtl9m3U4QWrx1OdpoYg
 tk3zs8Nlyzy96yeU3xi1cIlhlBubCSkxnGXXJJzYLwGYB1EGsYe1V8qg3a0sSwYRXhr2
 GeG3irLeVNntUeabcKXNTYuv+gUkhuFgBPM854f/XekNMuL+5YTiQHsTbzp27rqzvGWD
 oLAkpwseCNLmvmaCRcaCd3Q5Px2THcoG6JwyzXHJFuPrdrQrsDxe9bdkT7TUtw/tHSoX
 iyxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHn43jx06E5oPwt427mw89ROY3OqcfpYtI7wL0PMxcN8dNgT12btEmdAJbU8fpd8xfn4FLIq+I2Ws=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCyliWXMuBFHBRKwpTXqIr4kepi9a22wauUD6vPwv/1zHuwQrl
 rVVTS4LFUFLPo9KjKWTNWdfmSI36G3HInj8jDbLFECzoo4slgIuz/4o3DM0cLtspbNfaHrZ0yrC
 QWSZABTDE/q4SKLohyhOtjtX+wO87XXHyQe1K7YHkDkg2fYxnC/LdATgzFkuVowYNp0m24A==
X-Gm-Gg: ASbGncspS6zo+o4uDxmBB5bNI9N+ZkIYp8hAxZQjC2EwzedP9dsIfLPWbpO+dInz5Nu
 GhQ7Bjh8CAtzXYuCxijN3+hISS18sMsZisnauLerC2qhjGDj8uiUSHaYx/OllNsrJV6csXt6GLp
 Sx2dYpJhf4ZwfUbog6C7VsQmNQ5XYa3p3bE/RfNqFallz0uHbsBqi8F6wUibBcZRo+1OXQRUk7m
 Z44ETyIT4/UYiKmdaCoi2T+6h/Imp7L+1Qh4E4+PQlG0vqmQVGtkdH34tRfzgVjOGyGGUo+1bNg
 Jx7OKwt0e34MDfPyktsm4S4FypOLvI8E50biLolfS1nc5tW6YxyLRSyGDUDDFLE8vlKZQ4VT374
 zIpQ/WJVocxO+1Aa1lX0aWQG17yDBDgzphw6+iRjiDdoiueKCIIvd/J7WWMv7OD3YGbc=
X-Received: by 2002:a05:6000:2c02:b0:3cb:2fbb:cbec with SMTP id
 ffacd0b85a97d-3cb2fbbcfacmr9199146f8f.2.1756412575187; 
 Thu, 28 Aug 2025 13:22:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1bdB/M72bSY/WXb2DaG2tpHGVwgtZZzzvekQUCsScziZOca1dV+TjSk1aAgRBOQI1EyT87Q==
X-Received: by 2002:a05:6000:2c02:b0:3cb:2fbb:cbec with SMTP id
 ffacd0b85a97d-3cb2fbbcfacmr9199122f8f.2.1756412574722; 
 Thu, 28 Aug 2025 13:22:54 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:c100:2225:10aa:f247:7b85?
 (p200300d82f28c100222510aaf2477b85.dip0.t-ipconnect.de.
 [2003:d8:2f28:c100:2225:10aa:f247:7b85])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f30fe02sm86293885e9.18.2025.08.28.13.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 13:22:54 -0700 (PDT)
Message-ID: <80a7b182-6bd4-49f5-ba3c-1ef53f51557c@redhat.com>
Date: Thu, 28 Aug 2025 22:22:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 02/11] mm/thp: zone_device awareness in THP handling code
To: Matthew Brost <matthew.brost@intel.com>
Cc: Balbir Singh <balbirs@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
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
 Francois Dugast <francois.dugast@intel.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
 <20250812024036.690064-3-balbirs@nvidia.com>
 <aLC2bfpIQo/a22gr@lstrano-desk.jf.intel.com>
 <00d58bba-7695-4f72-8ebd-d2db23fccec3@redhat.com>
 <aLC5SC7jUgUE2rKh@lstrano-desk.jf.intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <aLC5SC7jUgUE2rKh@lstrano-desk.jf.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tX1Jb5xAtqno46Wf-Ad490lTLUcNpcSZZGNmz7WOrUo_1756412575
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

On 28.08.25 22:17, Matthew Brost wrote:
> On Thu, Aug 28, 2025 at 10:12:53PM +0200, David Hildenbrand wrote:
>> On 28.08.25 22:05, Matthew Brost wrote:
>>> On Tue, Aug 12, 2025 at 12:40:27PM +1000, Balbir Singh wrote:
>>>> Make THP handling code in the mm subsystem for THP pages aware of zone
>>>> device pages. Although the code is designed to be generic when it comes
>>>> to handling splitting of pages, the code is designed to work for THP
>>>> page sizes corresponding to HPAGE_PMD_NR.
>>>>
>>>> Modify page_vma_mapped_walk() to return true when a zone device huge
>>>> entry is present, enabling try_to_migrate() and other code migration
>>>> paths to appropriately process the entry. page_vma_mapped_walk() will
>>>> return true for zone device private large folios only when
>>>> PVMW_THP_DEVICE_PRIVATE is passed. This is to prevent locations that are
>>>> not zone device private pages from having to add awareness. The key
>>>> callback that needs this flag is try_to_migrate_one(). The other
>>>> callbacks page idle, damon use it for setting young/dirty bits, which is
>>>> not significant when it comes to pmd level bit harvesting.
>>>>
>>>> pmd_pfn() does not work well with zone device entries, use
>>>> pfn_pmd_entry_to_swap() for checking and comparison as for zone device
>>>> entries.
>>>>
>>>> Support partial unmapping of zone device private entries, which happens
>>>> via munmap(). munmap() causes the device private entry pmd to be split,
>>>> but the corresponding folio is not split. Deferred split does not work for
>>>> zone device private folios due to the need to split during fault
>>>> handling. Get migrate_vma_collect_pmd() to handle this case by splitting
>>>> partially unmapped device private folios.
>>>>
>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>> Cc: David Hildenbrand <david@redhat.com>
>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>>> Cc: Byungchul Park <byungchul@sk.com>
>>>> Cc: Gregory Price <gourry@gourry.net>
>>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>>> Cc: Nico Pache <npache@redhat.com>
>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>> Cc: Dev Jain <dev.jain@arm.com>
>>>> Cc: Barry Song <baohua@kernel.org>
>>>> Cc: Lyude Paul <lyude@redhat.com>
>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>>> Cc: Mika Penttilä <mpenttil@redhat.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>>> ---
>>>>    include/linux/rmap.h    |   2 +
>>>>    include/linux/swapops.h |  17 ++++
>>>>    lib/test_hmm.c          |   2 +-
>>>>    mm/huge_memory.c        | 214 +++++++++++++++++++++++++++++++---------
>>>>    mm/migrate_device.c     |  47 +++++++++
>>>>    mm/page_vma_mapped.c    |  13 ++-
>>>>    mm/pgtable-generic.c    |   6 ++
>>>>    mm/rmap.c               |  24 ++++-
>>>>    8 files changed, 272 insertions(+), 53 deletions(-)
>>>>
>>>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>>>> index 6cd020eea37a..dfb7aae3d77b 100644
>>>> --- a/include/linux/rmap.h
>>>> +++ b/include/linux/rmap.h
>>>> @@ -927,6 +927,8 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
>>>>    #define PVMW_SYNC		(1 << 0)
>>>>    /* Look for migration entries rather than present PTEs */
>>>>    #define PVMW_MIGRATION		(1 << 1)
>>>> +/* Look for device private THP entries */
>>>> +#define PVMW_THP_DEVICE_PRIVATE	(1 << 2)
>>>>    struct page_vma_mapped_walk {
>>>>    	unsigned long pfn;
>>>> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
>>>> index 64ea151a7ae3..2641c01bd5d2 100644
>>>> --- a/include/linux/swapops.h
>>>> +++ b/include/linux/swapops.h
>>>> @@ -563,6 +563,7 @@ static inline int is_pmd_migration_entry(pmd_t pmd)
>>>>    {
>>>>    	return is_swap_pmd(pmd) && is_migration_entry(pmd_to_swp_entry(pmd));
>>>>    }
>>>> +
>>>>    #else  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
>>>>    static inline int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
>>>>    		struct page *page)
>>>> @@ -594,6 +595,22 @@ static inline int is_pmd_migration_entry(pmd_t pmd)
>>>>    }
>>>>    #endif  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
>>>> +#if defined(CONFIG_ZONE_DEVICE) && defined(CONFIG_ARCH_ENABLE_THP_MIGRATION)
>>>> +
>>>> +static inline int is_pmd_device_private_entry(pmd_t pmd)
>>>> +{
>>>> +	return is_swap_pmd(pmd) && is_device_private_entry(pmd_to_swp_entry(pmd));
>>>> +}
>>>> +
>>>> +#else /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
>>>> +
>>>> +static inline int is_pmd_device_private_entry(pmd_t pmd)
>>>> +{
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +#endif /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
>>>> +
>>>>    static inline int non_swap_entry(swp_entry_t entry)
>>>>    {
>>>>    	return swp_type(entry) >= MAX_SWAPFILES;
>>>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>>>> index 761725bc713c..297f1e034045 100644
>>>> --- a/lib/test_hmm.c
>>>> +++ b/lib/test_hmm.c
>>>> @@ -1408,7 +1408,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>>>>    	 * the mirror but here we use it to hold the page for the simulated
>>>>    	 * device memory and that page holds the pointer to the mirror.
>>>>    	 */
>>>> -	rpage = vmf->page->zone_device_data;
>>>> +	rpage = folio_page(page_folio(vmf->page), 0)->zone_device_data;
>>>>    	dmirror = rpage->zone_device_data;
>>>>    	/* FIXME demonstrate how we can adjust migrate range */
>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>> index 9c38a95e9f09..2495e3fdbfae 100644
>>>> --- a/mm/huge_memory.c
>>>> +++ b/mm/huge_memory.c
>>>> @@ -1711,8 +1711,11 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>>>>    	if (unlikely(is_swap_pmd(pmd))) {
>>>>    		swp_entry_t entry = pmd_to_swp_entry(pmd);
>>>> -		VM_BUG_ON(!is_pmd_migration_entry(pmd));
>>>> -		if (!is_readable_migration_entry(entry)) {
>>>> +		VM_WARN_ON(!is_pmd_migration_entry(pmd) &&
>>>> +				!is_pmd_device_private_entry(pmd));
>>>> +
>>>> +		if (is_migration_entry(entry) &&
>>>> +			is_writable_migration_entry(entry)) {
>>>>    			entry = make_readable_migration_entry(
>>>>    							swp_offset(entry));
>>>>    			pmd = swp_entry_to_pmd(entry);
>>>> @@ -1722,6 +1725,32 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>>>>    				pmd = pmd_swp_mkuffd_wp(pmd);
>>>>    			set_pmd_at(src_mm, addr, src_pmd, pmd);
>>>>    		}
>>>> +
>>>> +		if (is_device_private_entry(entry)) {
>>>> +			if (is_writable_device_private_entry(entry)) {
>>>> +				entry = make_readable_device_private_entry(
>>>> +					swp_offset(entry));
>>>> +				pmd = swp_entry_to_pmd(entry);
>>>> +
>>>> +				if (pmd_swp_soft_dirty(*src_pmd))
>>>> +					pmd = pmd_swp_mksoft_dirty(pmd);
>>>> +				if (pmd_swp_uffd_wp(*src_pmd))
>>>> +					pmd = pmd_swp_mkuffd_wp(pmd);
>>>> +				set_pmd_at(src_mm, addr, src_pmd, pmd);
>>>> +			}
>>>> +
>>>> +			src_folio = pfn_swap_entry_folio(entry);
>>>> +			VM_WARN_ON(!folio_test_large(src_folio));
>>>> +
>>>> +			folio_get(src_folio);
>>>> +			/*
>>>> +			 * folio_try_dup_anon_rmap_pmd does not fail for
>>>> +			 * device private entries.
>>>> +			 */
>>>> +			VM_WARN_ON(folio_try_dup_anon_rmap_pmd(src_folio,
>>>> +					  &src_folio->page, dst_vma, src_vma));
>>>
>>> VM_WARN_ON compiles out in non-debug builds. I hit this running the
>>> fork self I shared with a non-debug build.
>>
>>
>> folio_try_dup_anon_rmap_pmd() will never fail for
>> folio_is_device_private(folio) -- unless something is deeply messed up that
>> we wouldn't identify this folio as being device-private.
>>
>> Can you elaborate, what were you able to trigger, and in what kind of
>> environment?
>>
> 
> Maybe this was bad phrasing. I compilied the kernel with a non-debug
> build and fork() broke for THP device pages because the above call to
> folio_try_dup_anon_rmap_pmd compiled out (i.e., it wasn't called).

Ah, yes!

As I said in my reply, we should not do any kind of WARN here, like in 
the PTE case.

-- 
Cheers

David / dhildenb

