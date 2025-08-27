Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF08B3810D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 13:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EC410E7B6;
	Wed, 27 Aug 2025 11:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="g5c3P46Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A885410E7B6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 11:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756294130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2oQ4yyn+fuHtT1ZM0Ps0RKh7qw9mFPkcHlRbmx1CZxA=;
 b=g5c3P46QYmAHsGZAhrWD2eLJercr3oB2PxLVoS3MjHEqEcx/yorIHvPoBw8m2jtvkb+QCb
 DznjljCi5J22sYuAd/H+HYaIq/+z/Td/a73UCeQKSWvQaBsgd0y/0VXCKL5APgh9o4bx0n
 O8Nz1fRtFUrn6Bj4XVMsjPjohCzu5ig=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-6DZG-y5aOGmIqlotu-VI6A-1; Wed, 27 Aug 2025 07:28:49 -0400
X-MC-Unique: 6DZG-y5aOGmIqlotu-VI6A-1
X-Mimecast-MFC-AGG-ID: 6DZG-y5aOGmIqlotu-VI6A_1756294129
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e8706a5e78so2467504385a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 04:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756294129; x=1756898929;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2oQ4yyn+fuHtT1ZM0Ps0RKh7qw9mFPkcHlRbmx1CZxA=;
 b=ocd95pW+NAyv1qOcqumaXgxa0HjiQCcZqy3Ml3W18BF40ssaSRNGxM4YAEfWrHyDod
 +u9MLZB7c3AMRZgcJFUlo0oGgNWheST5hpVAh+wLJzaMieW9/ONHT4Ea5Qw7gP6rtJg+
 l0FNJ8HszMZw5oi0mPHUCgxcMh5N+AAofL6jvxGZ6cbQjnKLXMpSS0pci8KtlWIQ5W7Z
 FceZugbmuEQta2MIP1eMSBFJ/uVAjGM5swBaFdYrzor1hngg22UNZ8NjZTvXOMUN+ZuC
 1bGQEWLxDoMAUYN8wCEuouNxL8eIniMgsWtxx8KmLje0rgHkVk+LNtO9o7a4c4mHnFML
 u3rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbMihkSwoGMxm2SKHDU9c/WatdI9d+Iz6Bme94gVjrBx1ElFJbdxYPbhlSAC2j7MqlRAc31fFUTMs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQicb3ovkLw2/tP2aUxEz8SBF2WjlymnLEkYEn+O8wDHCIJSrF
 9W47kGeGNh9NRhWPJNUAUkGZl02Gs91zqn2ncug9mjRnzx60zLI7ddL9MiDKjzqwb3cLPBgHPy7
 7C/HOY76iN97+I3ubLY+KQJbwULRx9DNcUUdnRkN5A1gMOGb4KMfJDqo0dDtzG2/G1r+BgA==
X-Gm-Gg: ASbGncvok0y1yk9Brn4dMSRLJF1af0C3ajhldTWMTxO36kvhwoYBupXyzbJj/FYKztZ
 YwUUd/02ky07/mz3+9XZ/aug+vwPpQCNEwsnS//yG70lF+4b1/JBax1xyB0kKbzLi7bs4fLFqZw
 oW3yMG+cinjYhCc3IiM0H5jnIqZmMszEE8DfoZq8zXAT/4TcxL3HoIl/PGJT5ilVu3OBJSjcuAw
 V27PpA9IGo/jcaZEhAOsMOb2G3XyiRKNsa4p3q52rj6eazcsVv7vaWsIHLVSfx0aZijh5/WdUO3
 svLxwNatm6BDfHRfgdwwGrrVzcxk7nvz1Cx5mSVxLmbSNBNZQN3i92wuXs5j3w==
X-Received: by 2002:a05:620a:2894:b0:7e6:856d:bcb with SMTP id
 af79cd13be357-7ea10f94df7mr2661734285a.6.1756294128377; 
 Wed, 27 Aug 2025 04:28:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW8ZUPI6UYniG83VeXzqqz790E5oUSfgsxv/Czm9VchZxyn+4OUiu73ck2Pw5OQnBy/KIY8Q==
X-Received: by 2002:a05:620a:2894:b0:7e6:856d:bcb with SMTP id
 af79cd13be357-7ea10f94df7mr2661730185a.6.1756294127842; 
 Wed, 27 Aug 2025 04:28:47 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ebecb18cb4sm867878585a.2.2025.08.27.04.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 04:28:47 -0700 (PDT)
Message-ID: <7cdc05d8-899b-495a-8298-ad5f27fcf8ad@redhat.com>
Date: Wed, 27 Aug 2025 13:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 02/11] mm/thp: zone_device awareness in THP handling code
To: Balbir Singh <balbirs@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
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
References: <20250812024036.690064-1-balbirs@nvidia.com>
 <20250812024036.690064-3-balbirs@nvidia.com>
 <763e1fca-e4c4-467e-a1d0-ea911cad4714@redhat.com>
 <85ef9a34-f511-4306-ac28-bf90f614709a@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <85ef9a34-f511-4306-ac28-bf90f614709a@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _fgd0gou8slg9Z-uNuGre8gwmp_ewSrwMibLAqqwiEo_1756294129
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

>> Like teaching zap, mprotect, rmap walks .... code separately.
>>
>> I'm, sure you'll find a way to break this down so I don't walk out of a
>> review with an headake ;)
>>
> 
> :) I had smaller chunks earlier, but then ran into don't add the change unless you
> use the change problem
> 

It's perfectly reasonable to have something like

mm/huge_memory: teach copy_huge_pmd() about huge device-private entries
mm/huge_memory: support splitting device-private folios

...

etc :)

[...]

>> Careful: There is is_readable_exclusive_migration_entry(). So don't
>> change the !is_readable_migration_entry(entry) to is_writable_migration_entry(entry)(),
>> because it's wrong.
>>
> 
> Ack, I assume you are referring to potential prot_none entries?

readable_exclusive are used to maintain the PageAnonExclusive bit right
now for migration entries. So it's not realted to prot_none.

[...]

>>> -            WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
>>> +
>>> +            if (!thp_migration_supported())
>>> +                WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
>>> +
>>> +            if (is_pmd_device_private_entry(orig_pmd)) {
>>> +                folio_remove_rmap_pmd(folio, &folio->page, vma);
>>> +                WARN_ON_ONCE(folio_mapcount(folio) < 0);
>>
>> Can we jsut move that into the folio_is_device_private() check below.
> 
> The check you mean?

The whole thing like

if (...) {
	folio_remove_rmap_pmd(folio, &folio->page, vma);
	WARN_ON_ONCE(folio_mapcount(folio) < 0);
	folio_put(folio)
}


[...]

> 
>> Why do we have to flush? pmd_clear() might be sufficient? In the PTE case we use pte_clear().
> 
> Without the flush, other entities will not see the cleared pmd and isn't the pte_clear() only
> when should_defer_flush() is true?

It's a non-present page entry, so there should be no TLB entry to flush.

> 
>>
>> [...]
>>
>>>            pmde = pmd_mksoft_dirty(pmde);
>>>        if (is_writable_migration_entry(entry))
>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>> index e05e14d6eacd..0ed337f94fcd 100644
>>> --- a/mm/migrate_device.c
>>> +++ b/mm/migrate_device.c
>>> @@ -136,6 +136,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>                 * page table entry. Other special swap entries are not
>>>                 * migratable, and we ignore regular swapped page.
>>>                 */
>>> +            struct folio *folio;
>>> +
>>>                entry = pte_to_swp_entry(pte);
>>>                if (!is_device_private_entry(entry))
>>>                    goto next;
>>> @@ -147,6 +149,51 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>                    pgmap->owner != migrate->pgmap_owner)
>>>                    goto next;
>>>    +            folio = page_folio(page);
>>> +            if (folio_test_large(folio)) {
>>> +                struct folio *new_folio;
>>> +                struct folio *new_fault_folio = NULL;
>>> +
>>> +                /*
>>> +                 * The reason for finding pmd present with a
>>> +                 * device private pte and a large folio for the
>>> +                 * pte is partial unmaps. Split the folio now
>>> +                 * for the migration to be handled correctly
>>> +                 */
>>
>> There are also other cases, like any VMA splits. Not sure if that makes a difference,
>> the folio is PTE mapped.
>>
> 
> Ack, I can clarify that the folio is just pte mapped or remove the comment

Sounds good.


-- 
Cheers

David / dhildenb

