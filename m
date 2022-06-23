Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 928E455749D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 09:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D375F11A09E;
	Thu, 23 Jun 2022 07:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EAC11A0A8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 07:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655971034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WRxmubYj/zvQx9FAer+eiq5WWKcFW5jnO5Ita3wHCwA=;
 b=Qvzi01Otyw70cSNnLIweoaShQTqoidgQeUY87AsdRLcZEWXVb5ZJvN/+aV9QmCbwJU36EE
 pv7NX5Pm6GKSFrC5mgvEFHMT00h7yp6o3HUSLqk0GkKTLJaOGg/oUEksA22IdRqmMbK0N3
 uptaHF9SwSW9vj/HhQxT/ywGsiQ463g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-yihX8cbVO8-D9JOD0ZA5KA-1; Thu, 23 Jun 2022 03:57:13 -0400
X-MC-Unique: yihX8cbVO8-D9JOD0ZA5KA-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay28-20020a05600c1e1c00b0039c5cbe76c1so1042524wmb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 00:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=WRxmubYj/zvQx9FAer+eiq5WWKcFW5jnO5Ita3wHCwA=;
 b=DWqIaU2psD7RehmvgQzDJcxdxa0E4DSdRrl7vFJ5lZF7DRTeT7ZBNTCVxXTsQzTcwK
 WFdjZ6ITRuqnr7HKULfmbN6deH6ZWo6t+BBJ8v00TaUVmJ2fFiMQC3TFF+ULCYmw3mBZ
 g3Z2+2HdCyoCT1rSHOS+224WguT1ElgvlzW5YO5WPTuxCrY6b7e5Y3cW59ytVEVbL7+p
 h2jcnm2I7YH/mYq3v0k205OV49Mv9wuOB6ThpI3RdriBPrTjnKVZmeNeNPS6j/ShA+zE
 Gry3MefWKjb9bQNJq6bNpzbEBdFOs+UDrYgUO5u53/hRP91KGrWAGHe8wt15eB98EnCr
 DbJw==
X-Gm-Message-State: AJIora9E0wgY/IQab9l7GE90sS0aJ48piGc5XhnehEtjPrdhuN1R6iEY
 1D4e9BSSWsnxMdVrFY2V0j+3gl+h6vGmmUSe43UUymoLBMykLoTIS05bxptmTZxYrRrOTpzCRHR
 SsW/R65J1QR+XRjBh7c910CFBUDLW
X-Received: by 2002:a05:6000:15c1:b0:21b:ad5e:2798 with SMTP id
 y1-20020a05600015c100b0021bad5e2798mr60436wry.237.1655971032242; 
 Thu, 23 Jun 2022 00:57:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tAWugolGpzgHOkBwbVZGJMITotRNGXISo3pRIWSqUMevICnP2uuhQ9eDf0QwZwMuJTe/4erg==
X-Received: by 2002:a05:6000:15c1:b0:21b:ad5e:2798 with SMTP id
 y1-20020a05600015c100b0021bad5e2798mr60416wry.237.1655971031851; 
 Thu, 23 Jun 2022 00:57:11 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:b100:7694:f34e:d0dd:95e7?
 (p200300cbc704b1007694f34ed0dd95e7.dip0.t-ipconnect.de.
 [2003:cb:c704:b100:7694:f34e:d0dd:95e7])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a05600c284a00b0039c41686421sm2066722wmb.17.2022.06.23.00.57.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 00:57:11 -0700 (PDT)
Message-ID: <9af76814-ee3a-0af4-7300-d432050b13a3@redhat.com>
Date: Thu, 23 Jun 2022 09:57:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>,
 Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org
References: <20220531200041.24904-1-alex.sierra@amd.com>
 <20220531200041.24904-2-alex.sierra@amd.com>
 <3ac89358-2ce0-7d0d-8b9c-8b0e5cc48945@redhat.com>
 <02ed2cb7-3ad3-8ffc-6032-04ae1853e234@amd.com>
 <7605beee-0a76-4ee9-e950-17419630f2cf@redhat.com>
 <ddcebcc1-fb0a-e565-f14d-77c9d48f2928@amd.com>
 <6aef4b7f-0ced-08cd-1f0c-50c22996aa41@redhat.com>
 <65987ab8-426d-e533-0295-069312b4f751@amd.com>
 <34e94bdb-675a-5d5c-6137-8aa1ee658d49@redhat.com>
 <87letq6wb5.fsf@nvdebian.thelocal>
 <643c44e7-48be-375b-c7ab-6a30b5ee2937@redhat.com>
 <f5b9f777-85a2-9c38-17f3-0c9be1eeb867@amd.com>
 <01cf9f24-d7fc-61e9-1c28-85dc5aabe645@redhat.com>
 <01cad0cf-9937-8699-6df3-7d5dfa681922@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v5 01/13] mm: add zone device coherent type memory support
In-Reply-To: <01cad0cf-9937-8699-6df3-7d5dfa681922@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: rcampbell@nvidia.com, willy@infradead.org,
 Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, linux-ext4@vger.kernel.org,
 hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23.06.22 01:16, Sierra Guiza, Alejandro (Alex) wrote:
> 
> On 6/21/2022 11:16 AM, David Hildenbrand wrote:
>> On 21.06.22 18:08, Sierra Guiza, Alejandro (Alex) wrote:
>>> On 6/21/2022 7:25 AM, David Hildenbrand wrote:
>>>> On 21.06.22 13:55, Alistair Popple wrote:
>>>>> David Hildenbrand<david@redhat.com>  writes:
>>>>>
>>>>>> On 21.06.22 13:25, Felix Kuehling wrote:
>>>>>>> Am 6/17/22 um 23:19 schrieb David Hildenbrand:
>>>>>>>> On 17.06.22 21:27, Sierra Guiza, Alejandro (Alex) wrote:
>>>>>>>>> On 6/17/2022 12:33 PM, David Hildenbrand wrote:
>>>>>>>>>> On 17.06.22 19:20, Sierra Guiza, Alejandro (Alex) wrote:
>>>>>>>>>>> On 6/17/2022 4:40 AM, David Hildenbrand wrote:
>>>>>>>>>>>> On 31.05.22 22:00, Alex Sierra wrote:
>>>>>>>>>>>>> Device memory that is cache coherent from device and CPU point of view.
>>>>>>>>>>>>> This is used on platforms that have an advanced system bus (like CAPI
>>>>>>>>>>>>> or CXL). Any page of a process can be migrated to such memory. However,
>>>>>>>>>>>>> no one should be allowed to pin such memory so that it can always be
>>>>>>>>>>>>> evicted.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Signed-off-by: Alex Sierra<alex.sierra@amd.com>
>>>>>>>>>>>>> Acked-by: Felix Kuehling<Felix.Kuehling@amd.com>
>>>>>>>>>>>>> Reviewed-by: Alistair Popple<apopple@nvidia.com>
>>>>>>>>>>>>> [hch: rebased ontop of the refcount changes,
>>>>>>>>>>>>>            removed is_dev_private_or_coherent_page]
>>>>>>>>>>>>> Signed-off-by: Christoph Hellwig<hch@lst.de>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>       include/linux/memremap.h | 19 +++++++++++++++++++
>>>>>>>>>>>>>       mm/memcontrol.c          |  7 ++++---
>>>>>>>>>>>>>       mm/memory-failure.c      |  8 ++++++--
>>>>>>>>>>>>>       mm/memremap.c            | 10 ++++++++++
>>>>>>>>>>>>>       mm/migrate_device.c      | 16 +++++++---------
>>>>>>>>>>>>>       mm/rmap.c                |  5 +++--
>>>>>>>>>>>>>       6 files changed, 49 insertions(+), 16 deletions(-)
>>>>>>>>>>>>>
>>>>>>>>>>>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>>>>>>>>>>>>> index 8af304f6b504..9f752ebed613 100644
>>>>>>>>>>>>> --- a/include/linux/memremap.h
>>>>>>>>>>>>> +++ b/include/linux/memremap.h
>>>>>>>>>>>>> @@ -41,6 +41,13 @@ struct vmem_altmap {
>>>>>>>>>>>>>        * A more complete discussion of unaddressable memory may be found in
>>>>>>>>>>>>>        * include/linux/hmm.h and Documentation/vm/hmm.rst.
>>>>>>>>>>>>>        *
>>>>>>>>>>>>> + * MEMORY_DEVICE_COHERENT:
>>>>>>>>>>>>> + * Device memory that is cache coherent from device and CPU point of view. This
>>>>>>>>>>>>> + * is used on platforms that have an advanced system bus (like CAPI or CXL). A
>>>>>>>>>>>>> + * driver can hotplug the device memory using ZONE_DEVICE and with that memory
>>>>>>>>>>>>> + * type. Any page of a process can be migrated to such memory. However no one
>>>>>>>>>>>> Any page might not be right, I'm pretty sure. ... just thinking about special pages
>>>>>>>>>>>> like vdso, shared zeropage, ... pinned pages ...
>>>>>>>>>> Well, you cannot migrate long term pages, that's what I meant :)
>>>>>>>>>>
>>>>>>>>>>>>> + * should be allowed to pin such memory so that it can always be evicted.
>>>>>>>>>>>>> + *
>>>>>>>>>>>>>        * MEMORY_DEVICE_FS_DAX:
>>>>>>>>>>>>>        * Host memory that has similar access semantics as System RAM i.e. DMA
>>>>>>>>>>>>>        * coherent and supports page pinning. In support of coordinating page
>>>>>>>>>>>>> @@ -61,6 +68,7 @@ struct vmem_altmap {
>>>>>>>>>>>>>       enum memory_type {
>>>>>>>>>>>>>       	/* 0 is reserved to catch uninitialized type fields */
>>>>>>>>>>>>>       	MEMORY_DEVICE_PRIVATE = 1,
>>>>>>>>>>>>> +	MEMORY_DEVICE_COHERENT,
>>>>>>>>>>>>>       	MEMORY_DEVICE_FS_DAX,
>>>>>>>>>>>>>       	MEMORY_DEVICE_GENERIC,
>>>>>>>>>>>>>       	MEMORY_DEVICE_PCI_P2PDMA,
>>>>>>>>>>>>> @@ -143,6 +151,17 @@ static inline bool folio_is_device_private(const struct folio *folio)
>>>>>>>>>>>> In general, this LGTM, and it should be correct with PageAnonExclusive I think.
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> However, where exactly is pinning forbidden?
>>>>>>>>>>> Long-term pinning is forbidden since it would interfere with the device
>>>>>>>>>>> memory manager owning the
>>>>>>>>>>> device-coherent pages (e.g. evictions in TTM). However, normal pinning
>>>>>>>>>>> is allowed on this device type.
>>>>>>>>>> I don't see updates to folio_is_pinnable() in this patch.
>>>>>>>>> Device coherent type pages should return true here, as they are pinnable
>>>>>>>>> pages.
>>>>>>>> That function is only called for long-term pinnings in try_grab_folio().
>>>>>>>>
>>>>>>>>>> So wouldn't try_grab_folio() simply pin these pages? What am I missing?
>>>>>>>>> As far as I understand this return NULL for long term pin pages.
>>>>>>>>> Otherwise they get refcount incremented.
>>>>>>>> I don't follow.
>>>>>>>>
>>>>>>>> You're saying
>>>>>>>>
>>>>>>>> a) folio_is_pinnable() returns true for device coherent pages
>>>>>>>>
>>>>>>>> and that
>>>>>>>>
>>>>>>>> b) device coherent pages don't get long-term pinned
>>>>>>>>
>>>>>>>>
>>>>>>>> Yet, the code says
>>>>>>>>
>>>>>>>> struct folio *try_grab_folio(struct page *page, int refs, unsigned int flags)
>>>>>>>> {
>>>>>>>> 	if (flags & FOLL_GET)
>>>>>>>> 		return try_get_folio(page, refs);
>>>>>>>> 	else if (flags & FOLL_PIN) {
>>>>>>>> 		struct folio *folio;
>>>>>>>>
>>>>>>>> 		/*
>>>>>>>> 		 * Can't do FOLL_LONGTERM + FOLL_PIN gup fast path if not in a
>>>>>>>> 		 * right zone, so fail and let the caller fall back to the slow
>>>>>>>> 		 * path.
>>>>>>>> 		 */
>>>>>>>> 		if (unlikely((flags & FOLL_LONGTERM) &&
>>>>>>>> 			     !is_pinnable_page(page)))
>>>>>>>> 			return NULL;
>>>>>>>> 		...
>>>>>>>> 		return folio;
>>>>>>>> 	}
>>>>>>>> }
>>>>>>>>
>>>>>>>>
>>>>>>>> What prevents these pages from getting long-term pinned as stated in this patch?
>>>>>>> Long-term pinning is handled by __gup_longterm_locked, which migrates
>>>>>>> pages returned by __get_user_pages_locked that cannot be long-term
>>>>>>> pinned. try_grab_folio is OK to grab the pages. Anything that can't be
>>>>>>> long-term pinned will be migrated afterwards, and
>>>>>>> __get_user_pages_locked will be retried. The migration of
>>>>>>> DEVICE_COHERENT pages was implemented by Alistair in patch 5/13
>>>>>>> ("mm/gup: migrate device coherent pages when pinning instead of failing").
>>>>>> Thanks.
>>>>>>
>>>>>> __gup_longterm_locked()->check_and_migrate_movable_pages()
>>>>>>
>>>>>> Which checks folio_is_pinnable() and doesn't do anything if set.
>>>>>>
>>>>>> Sorry to be dense here, but I don't see how what's stated in this patch
>>>>>> works without adjusting folio_is_pinnable().
>>>>> Ugh, I think you might be right about try_grab_folio().
>>>>>
>>>>> We didn't update folio_is_pinnable() to include device coherent pages
>>>>> because device coherent pages are pinnable. It is really just
>>>>> FOLL_LONGTERM that we want to prevent here.
>>>>>
>>>>> For normal PUP that is done by my change in
>>>>> check_and_migrate_movable_pages() which migrates pages being pinned with
>>>>> FOLL_LONGTERM. But I think I incorrectly assumed we would take the
>>>>> pte_devmap() path in gup_pte_range(), which we don't for coherent pages.
>>>>> So I think the check in try_grab_folio() needs to be:
>>>> I think I said it already (and I might be wrong without reading the
>>>> code), but folio_is_pinnable() is *only* called for long-term pinnings.
>>>>
>>>> It should actually be called folio_is_longterm_pinnable().
>>>>
>>>> That's where that check should go, no?
>>> David, I think you're right. We didn't catch this since the LONGTERM gup
>>> test we added to hmm-test only calls to pin_user_pages. Apparently
>>> try_grab_folio is called only from fast callers (ex.
>>> pin_user_pages_fast/get_user_pages_fast). I have added a conditional
>>> similar to what Alistair has proposed to return null on LONGTERM &&
>>> (coherent_pages || folio_is_pinnable) at try_grab_folio. Also a new gup
>>> test was added with LONGTERM set that calls pin_user_pages_fast.
>>> Returning null under this condition it does causes the migration from
>>> dev to system memory.
>>>
>> Why can't coherent memory simply put its checks into
>> folio_is_pinnable()? I don't get it why we have to do things differently
>> here.
>>
>>> Actually, Im having different problems with a call to PageAnonExclusive
>>> from try_to_migrate_one during page fault from a HMM test that first
>>> migrate pages to device private and forks to mark as COW these pages.
>>> Apparently is catching the first BUG VM_BUG_ON_PGFLAGS(!PageAnon(page),
>>> page)
>> With or without this series? A backtrace would be great.
> 
> Here's the back trace. This happens in a hmm-test added in this patch 
> series. However, I have tried to isolate this BUG by just adding the COW 
> test with private device memory only. This is only present as follows. 
> Allocate anonymous mem->Migrate to private device memory->fork->try to 
> access to parent's anonymous memory (which will suppose to trigger a 
> page fault and migration to system mem). Just for the record, if the 
> child is terminated before the parent's memory is accessed, this problem 
> is not present.


The only usage of PageAnonExclusive() in try_to_migrate_one() is:

anon_exclusive = folio_test_anon(folio) &&
		 PageAnonExclusive(subpage);

Which can only possibly fail if subpage is not actually part of the folio.


I see some controversial code in the the if (folio_is_zone_device(folio)) case later:

			 * The assignment to subpage above was computed from a
			 * swap PTE which results in an invalid pointer.
			 * Since only PAGE_SIZE pages can currently be
			 * migrated, just set it to page. This will need to be
			 * changed when hugepage migrations to device private
			 * memory are supported.
			 */
			subpage = &folio->page;

There we have our invalid pointer hint.

I don't see how it could have worked if the child quit, though? Maybe
just pure luck?


Does the following fix your issue:



From 09750c714739ef3ca317b4aec82bf20283c8fd2d Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Thu, 23 Jun 2022 09:38:45 +0200
Subject: [PATCH] mm/rmap: fix dereferencing invalid subpage pointer in
 try_to_migrate_one()

The subpage we calculate is an invalid pointer for device private pages,
because device private pages are mapped via non-present device private
entries, not ordinary present PTEs.

Let's just not compute broken pointers and fixup later. Move the proper
assignment of the correct subpage to the beginning of the function and
assert that we really only have a single page in our folio.

This currently results in a BUG when tying to compute anon_exclusive,
because:

[  528.727237] BUG: unable to handle page fault for address: ffffea1fffffffc0
[  528.739585] #PF: supervisor read access in kernel mode
[  528.745324] #PF: error_code(0x0000) - not-present page
[  528.751062] PGD 44eaf2067 P4D 44eaf2067 PUD 0
[  528.756026] Oops: 0000 [#1] PREEMPT SMP NOPTI
[  528.760890] CPU: 120 PID: 18275 Comm: hmm-tests Not tainted 5.19.0-rc3-kfd-alex #257
[  528.769542] Hardware name: AMD Corporation BardPeak/BardPeak, BIOS RTY1002BDS 09/17/2021
[  528.778579] RIP: 0010:try_to_migrate_one+0x21a/0x1000
[  528.784225] Code: f6 48 89 c8 48 2b 05 45 d1 6a 01 48 c1 f8 06 48 29
c3 48 8b 45 a8 48 c1 e3 06 48 01 cb f6 41 18 01 48 89 85 50 ff ff ff 74
0b <4c> 8b 33 49 c1 ee 11 41 83 e6 01 48 8b bd 48 ff ff ff e8 3f 99 02
[  528.805194] RSP: 0000:ffffc90003cdfaa0 EFLAGS: 00010202
[  528.811027] RAX: 00007ffff7ff4000 RBX: ffffea1fffffffc0 RCX: ffffeaffffffffc0
[  528.818995] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffc90003cdfaf8
[  528.826962] RBP: ffffc90003cdfb70 R08: 0000000000000000 R09: 0000000000000000
[  528.834930] R10: ffffc90003cdf910 R11: 0000000000000002 R12: ffff888194450540
[  528.842899] R13: ffff888160d057c0 R14: 0000000000000000 R15: 03ffffffffffffff
[  528.850865] FS:  00007ffff7fdb740(0000) GS:ffff8883b0600000(0000) knlGS:0000000000000000
[  528.859891] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  528.866308] CR2: ffffea1fffffffc0 CR3: 00000001562b4003 CR4: 0000000000770ee0
[  528.874275] PKRU: 55555554
[  528.877286] Call Trace:
[  528.880016]  <TASK>
[  528.882356]  ? lock_is_held_type+0xdf/0x130
[  528.887033]  rmap_walk_anon+0x167/0x410
[  528.891316]  try_to_migrate+0x90/0xd0
[  528.895405]  ? try_to_unmap_one+0xe10/0xe10
[  528.900074]  ? anon_vma_ctor+0x50/0x50
[  528.904260]  ? put_anon_vma+0x10/0x10
[  528.908347]  ? invalid_mkclean_vma+0x20/0x20
[  528.913114]  migrate_vma_setup+0x5f4/0x750
[  528.917691]  dmirror_devmem_fault+0x8c/0x250 [test_hmm]
[  528.923532]  do_swap_page+0xac0/0xe50
[  528.927623]  ? __lock_acquire+0x4b2/0x1ac0
[  528.932199]  __handle_mm_fault+0x949/0x1440
[  528.936876]  handle_mm_fault+0x13f/0x3e0
[  528.941256]  do_user_addr_fault+0x215/0x740
[  528.945928]  exc_page_fault+0x75/0x280
[  528.950115]  asm_exc_page_fault+0x27/0x30
[  528.954593] RIP: 0033:0x40366b
...

Fixes: 6c287605fd56 ("mm: remember exclusively mapped anonymous pages with PG_anon_exclusive")
Reported-by: Sierra Guiza, Alejandro (Alex) <alex.sierra@amd.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 5bcb334cd6f2..746c05acad27 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1899,8 +1899,23 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 		/* Unexpected PMD-mapped THP? */
 		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
 
-		subpage = folio_page(folio,
-				pte_pfn(*pvmw.pte) - folio_pfn(folio));
+		if (folio_is_zone_device(folio)) {
+			/*
+			 * Our PTE is a non-present device exclusive entry and
+			 * calculating the subpage as for the common case would
+			 * result in an invalid pointer.
+			 *
+			 * Since only PAGE_SIZE pages can currently be
+			 * migrated, just set it to page. This will need to be
+			 * changed when hugepage migrations to device private
+			 * memory are supported.
+			 */
+			VM_BUG_ON_FOLIO(folio_nr_pages(folio) > 1, folio);
+			subpage = &folio->page;
+		} else {
+			subpage = folio_page(folio,
+					pte_pfn(*pvmw.pte) - folio_pfn(folio));
+		}
 		address = pvmw.address;
 		anon_exclusive = folio_test_anon(folio) &&
 				 PageAnonExclusive(subpage);
@@ -1993,15 +2008,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			/*
 			 * No need to invalidate here it will synchronize on
 			 * against the special swap migration pte.
-			 *
-			 * The assignment to subpage above was computed from a
-			 * swap PTE which results in an invalid pointer.
-			 * Since only PAGE_SIZE pages can currently be
-			 * migrated, just set it to page. This will need to be
-			 * changed when hugepage migrations to device private
-			 * memory are supported.
 			 */
-			subpage = &folio->page;
 		} else if (PageHWPoison(subpage)) {
 			pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
 			if (folio_test_hugetlb(folio)) {
-- 
2.35.3






-- 
Thanks,

David / dhildenb

