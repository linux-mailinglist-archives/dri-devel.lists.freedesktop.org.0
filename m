Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7504BB23CF5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 02:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0046D10E66B;
	Wed, 13 Aug 2025 00:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NP28mxgK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26C710E66B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 00:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755043655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0a9MFRY1h7MOvR8Wbw07bYMzAo5BjE+mq1YNqJVPV/0=;
 b=NP28mxgKsKYzigdZ2ZymBK/rQgL1x5wmbgo0nQUx8H+KQz0AW2GDNrRvL7lRd4oq+JujGe
 /L9ux3x+zZKeIloqdPmMo3rMnAITioyUi3E3KRdYVVP0JsxYf2gFFXBE8lp6GAWcZ0lZJU
 qDKkM5cca/+5+wjdwc0SdLBX6S7G0K8=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-PJ1DoSaVNiWa4Fd4hDLIhQ-1; Tue, 12 Aug 2025 20:07:33 -0400
X-MC-Unique: PJ1DoSaVNiWa4Fd4hDLIhQ-1
X-Mimecast-MFC-AGG-ID: PJ1DoSaVNiWa4Fd4hDLIhQ_1755043650
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-55b9f899bd5so2801272e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 17:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755043650; x=1755648450;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0a9MFRY1h7MOvR8Wbw07bYMzAo5BjE+mq1YNqJVPV/0=;
 b=La/MUb7R+efvSXSDUtboeVWw7XceefMikOIKX2WriAmtIgGwxkpuxOye3zh5+5VUrb
 7f4QKiS/Q+DLe88loOr4Y5W9k+lQ2lFdpkmJx3cuYGV1liZhNTTJtO8mrA2Ofm/X0xJ+
 4kCxdsjOlpkHjtw+tbkXSMEeMG5R8UchGuYkhz/vbkQmvobBaPKo7MJTYf1QV5D+Q++g
 F1iCr4e4OPW92HB6w/pGt+z08OaNchxpoGYPlDTI11r15UsZoKDkc7tQ5J0JEv+wIZBF
 6G/dES+Pq/4MF9jU2VUUsmzdT+6nQOa0XT+jGn1AlWNeLCfOrqAR3FbFSKqShzb8XDWk
 aMeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/s46+i2KxOaX3N/QOPzJOqjXsV1d8adhKgIxg+l6PrBgbzEpLjzg7p5EkIUBIaGMfXquXMSXJhsc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvjKbXQVaCKFXgw6cyNL+BpBuRMOxvRz5EBWBEJYeNbzAtgKgb
 Em8EhrVMa/L6KE+9Ce5vIYvx9oTEIZJ5VG25epllJW7HkgJRCXm9uIOmXelYaw8Y/yvc6pSgxCQ
 6gcAj3c1neeNKIAI/+jy3GYEOuSee16iBbJjQCNUawc70ZWV9wDTKC3Dd2o1NnUIsF7mu
X-Gm-Gg: ASbGncswgxe9kRHTEQUzhgYbVlZbuLkF3VG+EYwQaWmenUkR7zcYs7ndTuDa2Rp4CQU
 fYPD7zAkp+uLEshcQmjvfQliH9/P7pZOrGrg9qlrgoYaAm9lG1mDGcQOo3/fb0f3MGEagyMdJNW
 R8KswFsJEancRjTnoebwmBEVH3kO+6kRSZWqYniy7901HX5sX9KnS9nKwEgGtIet3Wh18AREkjE
 mZM4rC2RFksgJkRCMidSEjkPwnTNHMHRvdTaE1yUEndb6rhOFVXeZXZINoJt/Fr4N9EDXkvPzJE
 3LqA2IU7gjvMd7DiKKnb5Ighy6iDsVNylnzqL+cOrXq2688H2Cm56AL3SbcvytaU1Q==
X-Received: by 2002:a05:6512:ba1:b0:55b:8afb:e638 with SMTP id
 2adb3069b0e04-55ce03b91b8mr315103e87.28.1755043650218; 
 Tue, 12 Aug 2025 17:07:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoQmb2RmNCvZXTt3hToKciHGnkn/S73hvzckTVORzr7wB8qpotmzY9QkrR7LiLIPfgHMO0bA==
X-Received: by 2002:a05:6512:ba1:b0:55b:8afb:e638 with SMTP id
 2adb3069b0e04-55ce03b91b8mr315092e87.28.1755043649706; 
 Tue, 12 Aug 2025 17:07:29 -0700 (PDT)
Received: from [192.168.1.86] (85-23-48-6.bb.dnainternet.fi. [85.23.48.6])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898be9bsm5046839e87.12.2025.08.12.17.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 17:07:29 -0700 (PDT)
Message-ID: <23a3e9b9-ad35-4469-884d-279aac0868de@redhat.com>
Date: Wed, 13 Aug 2025 03:07:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 03/11] mm/migrate_device: THP migration of zone device pages
To: Balbir Singh <balbirs@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
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
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
 <20250812024036.690064-4-balbirs@nvidia.com>
 <81ca37d5-b1ff-46de-8dcc-b222af350c77@redhat.com>
 <9207451b-ebd1-46d5-b277-2adf3028f361@nvidia.com>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <9207451b-ebd1-46d5-b277-2adf3028f361@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iEg4ul7ekxp0APf5P0ETgpRq-msWLKcw5p6RI8JbSKw_1755043650
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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


On 8/13/25 02:36, Balbir Singh wrote:

> On 8/12/25 15:35, Mika Penttilä wrote:
>> Hi,
>>
>> On 8/12/25 05:40, Balbir Singh wrote:
>>
>>> MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
>>> migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
>>> device pages as compound pages during device pfn migration.
>>>
>>> migrate_device code paths go through the collect, setup
>>> and finalize phases of migration.
>>>
>>> The entries in src and dst arrays passed to these functions still
>>> remain at a PAGE_SIZE granularity. When a compound page is passed,
>>> the first entry has the PFN along with MIGRATE_PFN_COMPOUND
>>> and other flags set (MIGRATE_PFN_MIGRATE, MIGRATE_PFN_VALID), the
>>> remaining entries (HPAGE_PMD_NR - 1) are filled with 0's. This
>>> representation allows for the compound page to be split into smaller
>>> page sizes.
>>>
>>> migrate_vma_collect_hole(), migrate_vma_collect_pmd() are now THP
>>> page aware. Two new helper functions migrate_vma_collect_huge_pmd()
>>> and migrate_vma_insert_huge_pmd_page() have been added.
>>>
>>> migrate_vma_collect_huge_pmd() can collect THP pages, but if for
>>> some reason this fails, there is fallback support to split the folio
>>> and migrate it.
>>>
>>> migrate_vma_insert_huge_pmd_page() closely follows the logic of
>>> migrate_vma_insert_page()
>>>
>>> Support for splitting pages as needed for migration will follow in
>>> later patches in this series.
>>>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Cc: Zi Yan <ziy@nvidia.com>
>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>> Cc: Byungchul Park <byungchul@sk.com>
>>> Cc: Gregory Price <gourry@gourry.net>
>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>> Cc: Alistair Popple <apopple@nvidia.com>
>>> Cc: Oscar Salvador <osalvador@suse.de>
>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>> Cc: Nico Pache <npache@redhat.com>
>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>> Cc: Dev Jain <dev.jain@arm.com>
>>> Cc: Barry Song <baohua@kernel.org>
>>> Cc: Lyude Paul <lyude@redhat.com>
>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>> Cc: Mika Penttilä <mpenttil@redhat.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>
>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>> ---
>>>  include/linux/migrate.h |   2 +
>>>  mm/migrate_device.c     | 457 ++++++++++++++++++++++++++++++++++------
>>>  2 files changed, 396 insertions(+), 63 deletions(-)
>>>
>>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>>> index acadd41e0b5c..d9cef0819f91 100644
>>> --- a/include/linux/migrate.h
>>> +++ b/include/linux/migrate.h
>>> @@ -129,6 +129,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
>>>  #define MIGRATE_PFN_VALID	(1UL << 0)
>>>  #define MIGRATE_PFN_MIGRATE	(1UL << 1)
>>>  #define MIGRATE_PFN_WRITE	(1UL << 3)
>>> +#define MIGRATE_PFN_COMPOUND	(1UL << 4)
>>>  #define MIGRATE_PFN_SHIFT	6
>>>  
>>>  static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
>>> @@ -147,6 +148,7 @@ enum migrate_vma_direction {
>>>  	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
>>>  	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
>>>  	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
>>> +	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
>>>  };
>>>  
>>>  struct migrate_vma {
>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>> index 0ed337f94fcd..6621bba62710 100644
>>> --- a/mm/migrate_device.c
>>> +++ b/mm/migrate_device.c
>>> @@ -14,6 +14,7 @@
>>>  #include <linux/pagewalk.h>
>>>  #include <linux/rmap.h>
>>>  #include <linux/swapops.h>
>>> +#include <asm/pgalloc.h>
>>>  #include <asm/tlbflush.h>
>>>  #include "internal.h"
>>>  
>>> @@ -44,6 +45,23 @@ static int migrate_vma_collect_hole(unsigned long start,
>>>  	if (!vma_is_anonymous(walk->vma))
>>>  		return migrate_vma_collect_skip(start, end, walk);
>>>  
>>> +	if (thp_migration_supported() &&
>>> +		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
>>> +		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
>>> +		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
>>> +		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE |
>>> +						MIGRATE_PFN_COMPOUND;
>>> +		migrate->dst[migrate->npages] = 0;
>>> +		migrate->npages++;
>>> +		migrate->cpages++;
>>> +
>>> +		/*
>>> +		 * Collect the remaining entries as holes, in case we
>>> +		 * need to split later
>>> +		 */
>>> +		return migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
>>> +	}
>>> +
>>>  	for (addr = start; addr < end; addr += PAGE_SIZE) {
>>>  		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE;
>>>  		migrate->dst[migrate->npages] = 0;
>>> @@ -54,57 +72,151 @@ static int migrate_vma_collect_hole(unsigned long start,
>>>  	return 0;
>>>  }
>>>  
>>> -static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>> -				   unsigned long start,
>>> -				   unsigned long end,
>>> -				   struct mm_walk *walk)
>>> +/**
>>> + * migrate_vma_collect_huge_pmd - collect THP pages without splitting the
>>> + * folio for device private pages.
>>> + * @pmdp: pointer to pmd entry
>>> + * @start: start address of the range for migration
>>> + * @end: end address of the range for migration
>>> + * @walk: mm_walk callback structure
>>> + *
>>> + * Collect the huge pmd entry at @pmdp for migration and set the
>>> + * MIGRATE_PFN_COMPOUND flag in the migrate src entry to indicate that
>>> + * migration will occur at HPAGE_PMD granularity
>>> + */
>>> +static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
>>> +					unsigned long end, struct mm_walk *walk,
>>> +					struct folio *fault_folio)
>>>  {
>>> +	struct mm_struct *mm = walk->mm;
>>> +	struct folio *folio;
>>>  	struct migrate_vma *migrate = walk->private;
>>> -	struct folio *fault_folio = migrate->fault_page ?
>>> -		page_folio(migrate->fault_page) : NULL;
>>> -	struct vm_area_struct *vma = walk->vma;
>>> -	struct mm_struct *mm = vma->vm_mm;
>>> -	unsigned long addr = start, unmapped = 0;
>>>  	spinlock_t *ptl;
>>> -	pte_t *ptep;
>>> +	swp_entry_t entry;
>>> +	int ret;
>>> +	unsigned long write = 0;
>>>  
>>> -again:
>>> -	if (pmd_none(*pmdp))
>>> +	ptl = pmd_lock(mm, pmdp);
>>> +	if (pmd_none(*pmdp)) {
>>> +		spin_unlock(ptl);
>>>  		return migrate_vma_collect_hole(start, end, -1, walk);
>>> +	}
>>>  
>>>  	if (pmd_trans_huge(*pmdp)) {
>>> -		struct folio *folio;
>>> -
>>> -		ptl = pmd_lock(mm, pmdp);
>>> -		if (unlikely(!pmd_trans_huge(*pmdp))) {
>>> +		if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
>>>  			spin_unlock(ptl);
>>> -			goto again;
>>> +			return migrate_vma_collect_skip(start, end, walk);
>>>  		}
>>>  
>>>  		folio = pmd_folio(*pmdp);
>>>  		if (is_huge_zero_folio(folio)) {
>>>  			spin_unlock(ptl);
>>> -			split_huge_pmd(vma, pmdp, addr);
>>> -		} else {
>>> -			int ret;
>>> +			return migrate_vma_collect_hole(start, end, -1, walk);
>>> +		}
>>> +		if (pmd_write(*pmdp))
>>> +			write = MIGRATE_PFN_WRITE;
>>> +	} else if (!pmd_present(*pmdp)) {
>>> +		entry = pmd_to_swp_entry(*pmdp);
>>> +		folio = pfn_swap_entry_folio(entry);
>>> +
>>> +		if (!is_device_private_entry(entry) ||
>>> +			!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
>>> +			(folio->pgmap->owner != migrate->pgmap_owner)) {
>>> +			spin_unlock(ptl);
>>> +			return migrate_vma_collect_skip(start, end, walk);
>>> +		}
>>>  
>>> -			folio_get(folio);
>>> +		if (is_migration_entry(entry)) {
>>> +			migration_entry_wait_on_locked(entry, ptl);
>>>  			spin_unlock(ptl);
>>> -			/* FIXME: we don't expect THP for fault_folio */
>>> -			if (WARN_ON_ONCE(fault_folio == folio))
>>> -				return migrate_vma_collect_skip(start, end,
>>> -								walk);
>>> -			if (unlikely(!folio_trylock(folio)))
>>> -				return migrate_vma_collect_skip(start, end,
>>> -								walk);
>>> -			ret = split_folio(folio);
>>> -			if (fault_folio != folio)
>>> -				folio_unlock(folio);
>>> -			folio_put(folio);
>>> -			if (ret)
>>> -				return migrate_vma_collect_skip(start, end,
>>> -								walk);
>>> +			return -EAGAIN;
>>>  		}
>>> +
>>> +		if (is_writable_device_private_entry(entry))
>>> +			write = MIGRATE_PFN_WRITE;
>>> +	} else {
>>> +		spin_unlock(ptl);
>>> +		return -EAGAIN;
>>> +	}
>>> +
>>> +	folio_get(folio);
>>> +	if (folio != fault_folio && unlikely(!folio_trylock(folio))) {
>>> +		spin_unlock(ptl);
>>> +		folio_put(folio);
>>> +		return migrate_vma_collect_skip(start, end, walk);
>>> +	}
>>> +
>>> +	if (thp_migration_supported() &&
>>> +		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
>>> +		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
>>> +		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
>>> +
>>> +		struct page_vma_mapped_walk pvmw = {
>>> +			.ptl = ptl,
>>> +			.address = start,
>>> +			.pmd = pmdp,
>>> +			.vma = walk->vma,
>>> +		};
>>> +
>>> +		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
>>> +
>>> +		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
>>> +						| MIGRATE_PFN_MIGRATE
>>> +						| MIGRATE_PFN_COMPOUND;
>>> +		migrate->dst[migrate->npages++] = 0;
>>> +		migrate->cpages++;
>>> +		ret = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
>>> +		if (ret) {
>>> +			migrate->npages--;
>>> +			migrate->cpages--;
>>> +			migrate->src[migrate->npages] = 0;
>>> +			migrate->dst[migrate->npages] = 0;
>>> +			goto fallback;
>>> +		}
>>> +		migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
>>> +		spin_unlock(ptl);
>>> +		return 0;
>>> +	}
>>> +
>>> +fallback:
>>> +	spin_unlock(ptl);
>>> +	if (!folio_test_large(folio))
>>> +		goto done;
>>> +	ret = split_folio(folio);
>>> +	if (fault_folio != folio)
>>> +		folio_unlock(folio);
>>> +	folio_put(folio);
>>> +	if (ret)
>>> +		return migrate_vma_collect_skip(start, end, walk);
>>> +	if (pmd_none(pmdp_get_lockless(pmdp)))
>>> +		return migrate_vma_collect_hole(start, end, -1, walk);
>>> +
>>> +done:
>>> +	return -ENOENT;
>>> +}
>>> +
>>> +static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>> +				   unsigned long start,
>>> +				   unsigned long end,
>>> +				   struct mm_walk *walk)
>>> +{
>>> +	struct migrate_vma *migrate = walk->private;
>>> +	struct vm_area_struct *vma = walk->vma;
>>> +	struct mm_struct *mm = vma->vm_mm;
>>> +	unsigned long addr = start, unmapped = 0;
>>> +	spinlock_t *ptl;
>>> +	struct folio *fault_folio = migrate->fault_page ?
>>> +		page_folio(migrate->fault_page) : NULL;
>>> +	pte_t *ptep;
>>> +
>>> +again:
>>> +	if (pmd_trans_huge(*pmdp) || !pmd_present(*pmdp)) {
>>> +		int ret = migrate_vma_collect_huge_pmd(pmdp, start, end, walk, fault_folio);
>>> +
>>> +		if (ret == -EAGAIN)
>>> +			goto again;
>>> +		if (ret == 0)
>>> +			return 0;
>>>  	}
>>>  
>>>  	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
>>> @@ -222,8 +334,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>  			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
>>>  		}
>>>  
>>> -		/* FIXME support THP */
>>> -		if (!page || !page->mapping || PageTransCompound(page)) {
>>> +		if (!page || !page->mapping) {
>>>  			mpfn = 0;
>>>  			goto next;
>>>  		}
>>> @@ -394,14 +505,6 @@ static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
>>>  	 */
>>>  	int extra = 1 + (page == fault_page);
>>>  
>>> -	/*
>>> -	 * FIXME support THP (transparent huge page), it is bit more complex to
>>> -	 * check them than regular pages, because they can be mapped with a pmd
>>> -	 * or with a pte (split pte mapping).
>>> -	 */
>>> -	if (folio_test_large(folio))
>>> -		return false;
>>> -
>> You cannot remove this check unless support normal mTHP folios migrate to device, 
>> which I think this series doesn't do, but maybe should?
>>
> mTHP needs to be a follow up series, there are comments in the cover letter. I had an
> assert earlier to prevent other folio sizes, but I've removed it and the interface
> to drivers does not allow for mTHP device private folios.
>
> Balbir
>
pte mapped device private THPs with other sizes also can be created as a result of pmd and folio splits. 
Your should handle them in one place consistently not by different drivers. 
As pointed by Matthew, there's the problem with the fault_page if not split and just ignored.


--Mika

