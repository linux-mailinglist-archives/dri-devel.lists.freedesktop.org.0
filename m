Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E31A22A91
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 10:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C860910E90E;
	Thu, 30 Jan 2025 09:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="C6r6Zbw9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BB510E90E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 09:40:14 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso3066385e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 01:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738230012; x=1738834812; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i//528DJ0ZQ/PMRElAHDERTNirRnwgk7bcm+UBSh/UY=;
 b=C6r6Zbw9oZSf5/NOzY2+osJlIs8dt7jff1aqiaVAmO9qPl6J5tZY4n5UPaY+A2M+3Y
 8JYFW0vXlsKxtGLuFNFaNkt5tglGBUkls5lwciBTpnjooOhN8/CcoMMHnvAu0FzG2wBm
 ngKpGdYd5QwaZIGfOZJ2JdjkNVEWvBOwdXE34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738230012; x=1738834812;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i//528DJ0ZQ/PMRElAHDERTNirRnwgk7bcm+UBSh/UY=;
 b=aeK7vfFHRPhEn7kbhhUHnh+1HhgNnUvo279xZxF5f4dXPsQjUDxCSt5oVsUL3Tyvh1
 NotZA8kvM5LCcCHoz0kaoXhfSkpQvXWyclhGQyNal/2jsablY51hJj9PL+3wkk3VUWU+
 HxVA8mZLnpmgKAclfGh52SdfwGm5fVu7+Ul7l4jgHU1zb9OviWSrw/ove4FNGraa412X
 Xkvd7xPa3LKsE+OFqaGy8iGmFqXMvmjP0weYEdovjXYIopM/3qhkVTDNXwCRBlDDZTbu
 FZfCL2B0tC+ltLPe1lRPBq4c5IMtuerXqePxW3wfbxFtNVKeEgsR8oLV7Ar6W0cdSAjf
 4X9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFwTfd3WhKopLRxA4D1tNWqmpBe10sdWp5RFggFK+f96KIYHj92WkWZwtXnu1cZa7/bO9ZVPHnUUA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyyc6p23p8MVvQvQZVwh1KUYIn8TN0hIadTt1NPAwhvFPQ/t7ri
 AOPTaCKHJzj5TgiTEhruBb5H2r5cBe8dgWafBUWyqi6d8wY1m5sgvbEGSBVMsxg=
X-Gm-Gg: ASbGncs1n1xvMSfiuNw0IqHcR72vtxvZCurUs5zxRXVDqE3I5E1xbs+4Di6KqkRhDaT
 dSj6oodxoPA9RAjOhlntb687dLevQZQkTQk2l8AbeiXsaqikhKQ0pfWbkCoTvU0rdQ39dt5OV4G
 NpB5sTACcGd0/kQnFAn2Du1SA4kFmflj718b5HC7+ulkPE1rjs740zLWqYV58pNEEOx2dN3HM8b
 QhWWuh8PFgUk9eui/6OdNwVawZIsBtxTgEPkMgqtlU0DXP7MUuLHJAxk/MqaZp45UAprcrwYPK+
 ZdFPPOz0h9/UPIzSOxbhLZDGbJ4=
X-Google-Smtp-Source: AGHT+IHELNdPunqNgpdAjDR3NKuJWudzqHHVDYg/asujGGhvRfTPwZ1lEqRiXSYsTCFWsh5kt+/SYQ==
X-Received: by 2002:a05:600c:4e03:b0:434:f9ad:7222 with SMTP id
 5b1f17b1804b1-438e15ee101mr21454555e9.7.1738230012440; 
 Thu, 30 Jan 2025 01:40:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e244ed3fsm16976735e9.31.2025.01.30.01.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 01:40:11 -0800 (PST)
Date: Thu, 30 Jan 2025 10:40:09 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Alistair Popple <apopple@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 04/12] mm/rmap: implement make_device_exclusive()
 using folio_walk instead of rmap walk
Message-ID: <Z5tI-cOSyzdLjoe_@phenom.ffwll.local>
Mail-Followup-To: Alistair Popple <apopple@nvidia.com>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-5-david@redhat.com>
 <7tzcpx23vufmp5cxutnzhjgdj7kwqrw5drwochpv5ern7zknhj@h2s6y2qjbr3f>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7tzcpx23vufmp5cxutnzhjgdj7kwqrw5drwochpv5ern7zknhj@h2s6y2qjbr3f>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Thu, Jan 30, 2025 at 05:11:49PM +1100, Alistair Popple wrote:
> On Wed, Jan 29, 2025 at 12:54:02PM +0100, David Hildenbrand wrote:
> > We require a writable PTE and only support anonymous folio: we can only
> > have exactly one PTE pointing at that page, which we can just lookup
> > using a folio walk, avoiding the rmap walk and the anon VMA lock.
> > 
> > So let's stop doing an rmap walk and perform a folio walk instead, so we
> > can easily just modify a single PTE and avoid relying on rmap/mapcounts.
> > 
> > We now effectively work on a single PTE instead of multiple PTEs of
> > a large folio, allowing for conversion of individual PTEs from
> > non-exclusive to device-exclusive -- note that the other way always
> > worked on single PTEs.
> > 
> > We can drop the MMU_NOTIFY_EXCLUSIVE MMU notifier call and document why
> > that is not required: GUP will already take care of the
> > MMU_NOTIFY_EXCLUSIVE call if required (there is already a device-exclusive
> > entry) when not finding a present PTE and having to trigger a fault and
> > ending up in remove_device_exclusive_entry().
> 
> I will have to look at this a bit more closely tomorrow but this doesn't seem
> right to me. We may be transitioning from a present PTE (ie. a writable
> anonymous mapping) to a non-present PTE (ie. a device-exclusive entry) and
> therefore any secondary processors (eg. other GPUs, iommus, etc.) will need to
> update their copies of the PTE. So I think the notifier call is needed.

I guess this is a question of semantics we want, for multiple gpus do we
require that device-exclusive also excludes other gpus or not. I'm leaning
towards agreeing with you here.

> > Note that the PTE is
> > always writable, and we can always create a writable-device-exclusive
> > entry.
> > 
> > With this change, device-exclusive is fully compatible with THPs /
> > large folios. We still require PMD-sized THPs to get PTE-mapped, and
> > supporting PMD-mapped THP (without the PTE-remapping) is a different
> > endeavour that might not be worth it at this point.

I'm not sure we actually want hugepages for device exclusive, since it has
an impact on what's allowed and what not. If we only ever do 4k entries
then userspace can assume that as long atomics are separated by a 4k page
there's no issue when both the gpu and cpu hammer on them. If we try to
keep thp entries then suddenly a workload that worked before will result
in endless ping-pong between gpu and cpu because the separate atomic
counters (or whatever) now all sit in the same 2m page.

So going with thp might result in userspace having to spread out atomics
even more, which is just wasting memory and not saving any tlb entries
since often you don't need that many.

tldr; I think not supporting thp entries for device exclusive is a
feature, not a bug.

Cheers, Sima

> > This gets rid of the "folio_mapcount()" usage and let's us fix ordinary
> > rmap walks (migration/swapout) next. Spell out that messing with the
> > mapcount is wrong and must be fixed.
> > 
> > Signed-off-by: David Hildenbrand <david@redhat.com>
> > ---
> >  mm/rmap.c | 188 ++++++++++++++++--------------------------------------
> >  1 file changed, 55 insertions(+), 133 deletions(-)
> > 
> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index 676df4fba5b0..49ffac6d27f8 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -2375,131 +2375,6 @@ void try_to_migrate(struct folio *folio, enum ttu_flags flags)
> >  }
> >  
> >  #ifdef CONFIG_DEVICE_PRIVATE
> > -struct make_exclusive_args {
> > -	struct mm_struct *mm;
> > -	unsigned long address;
> > -	void *owner;
> > -	bool valid;
> > -};
> > -
> > -static bool page_make_device_exclusive_one(struct folio *folio,
> > -		struct vm_area_struct *vma, unsigned long address, void *priv)
> > -{
> > -	struct mm_struct *mm = vma->vm_mm;
> > -	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
> > -	struct make_exclusive_args *args = priv;
> > -	pte_t pteval;
> > -	struct page *subpage;
> > -	bool ret = true;
> > -	struct mmu_notifier_range range;
> > -	swp_entry_t entry;
> > -	pte_t swp_pte;
> > -	pte_t ptent;
> > -
> > -	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0,
> > -				      vma->vm_mm, address, min(vma->vm_end,
> > -				      address + folio_size(folio)),
> > -				      args->owner);
> > -	mmu_notifier_invalidate_range_start(&range);
> > -
> > -	while (page_vma_mapped_walk(&pvmw)) {
> > -		/* Unexpected PMD-mapped THP? */
> > -		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
> > -
> > -		ptent = ptep_get(pvmw.pte);
> > -		if (!pte_present(ptent)) {
> > -			ret = false;
> > -			page_vma_mapped_walk_done(&pvmw);
> > -			break;
> > -		}
> > -
> > -		subpage = folio_page(folio,
> > -				pte_pfn(ptent) - folio_pfn(folio));
> > -		address = pvmw.address;
> > -
> > -		/* Nuke the page table entry. */
> > -		flush_cache_page(vma, address, pte_pfn(ptent));
> > -		pteval = ptep_clear_flush(vma, address, pvmw.pte);
> > -
> > -		/* Set the dirty flag on the folio now the pte is gone. */
> > -		if (pte_dirty(pteval))
> > -			folio_mark_dirty(folio);
> > -
> > -		/*
> > -		 * Check that our target page is still mapped at the expected
> > -		 * address.
> > -		 */
> > -		if (args->mm == mm && args->address == address &&
> > -		    pte_write(pteval))
> > -			args->valid = true;
> > -
> > -		/*
> > -		 * Store the pfn of the page in a special migration
> > -		 * pte. do_swap_page() will wait until the migration
> > -		 * pte is removed and then restart fault handling.
> > -		 */
> > -		if (pte_write(pteval))
> > -			entry = make_writable_device_exclusive_entry(
> > -							page_to_pfn(subpage));
> > -		else
> > -			entry = make_readable_device_exclusive_entry(
> > -							page_to_pfn(subpage));
> > -		swp_pte = swp_entry_to_pte(entry);
> > -		if (pte_soft_dirty(pteval))
> > -			swp_pte = pte_swp_mksoft_dirty(swp_pte);
> > -		if (pte_uffd_wp(pteval))
> > -			swp_pte = pte_swp_mkuffd_wp(swp_pte);
> > -
> > -		set_pte_at(mm, address, pvmw.pte, swp_pte);
> > -
> > -		/*
> > -		 * There is a reference on the page for the swap entry which has
> > -		 * been removed, so shouldn't take another.
> > -		 */
> > -		folio_remove_rmap_pte(folio, subpage, vma);
> > -	}
> > -
> > -	mmu_notifier_invalidate_range_end(&range);
> > -
> > -	return ret;
> > -}
> > -
> > -/**
> > - * folio_make_device_exclusive - Mark the folio exclusively owned by a device.
> > - * @folio: The folio to replace page table entries for.
> > - * @mm: The mm_struct where the folio is expected to be mapped.
> > - * @address: Address where the folio is expected to be mapped.
> > - * @owner: passed to MMU_NOTIFY_EXCLUSIVE range notifier callbacks
> > - *
> > - * Tries to remove all the page table entries which are mapping this
> > - * folio and replace them with special device exclusive swap entries to
> > - * grant a device exclusive access to the folio.
> > - *
> > - * Context: Caller must hold the folio lock.
> > - * Return: false if the page is still mapped, or if it could not be unmapped
> > - * from the expected address. Otherwise returns true (success).
> > - */
> > -static bool folio_make_device_exclusive(struct folio *folio,
> > -		struct mm_struct *mm, unsigned long address, void *owner)
> > -{
> > -	struct make_exclusive_args args = {
> > -		.mm = mm,
> > -		.address = address,
> > -		.owner = owner,
> > -		.valid = false,
> > -	};
> > -	struct rmap_walk_control rwc = {
> > -		.rmap_one = page_make_device_exclusive_one,
> > -		.done = folio_not_mapped,
> > -		.anon_lock = folio_lock_anon_vma_read,
> > -		.arg = &args,
> > -	};
> > -
> > -	rmap_walk(folio, &rwc);
> > -
> > -	return args.valid && !folio_mapcount(folio);
> > -}
> > -
> >  /**
> >   * make_device_exclusive() - Mark an address for exclusive use by a device
> >   * @mm: mm_struct of associated target process
> > @@ -2530,9 +2405,12 @@ static bool folio_make_device_exclusive(struct folio *folio,
> >  struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
> >  		void *owner, struct folio **foliop)
> >  {
> > -	struct folio *folio;
> > +	struct folio *folio, *fw_folio;
> > +	struct vm_area_struct *vma;
> > +	struct folio_walk fw;
> >  	struct page *page;
> > -	long npages;
> > +	swp_entry_t entry;
> > +	pte_t swp_pte;
> >  
> >  	mmap_assert_locked(mm);
> >  
> > @@ -2540,12 +2418,16 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
> >  	 * Fault in the page writable and try to lock it; note that if the
> >  	 * address would already be marked for exclusive use by the device,
> >  	 * the GUP call would undo that first by triggering a fault.
> > +	 *
> > +	 * If any other device would already map this page exclusively, the
> > +	 * fault will trigger a conversion to an ordinary
> > +	 * (non-device-exclusive) PTE and issue a MMU_NOTIFY_EXCLUSIVE.
> >  	 */
> > -	npages = get_user_pages_remote(mm, addr, 1,
> > -				       FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
> > -				       &page, NULL);
> > -	if (npages != 1)
> > -		return ERR_PTR(npages);
> > +	page = get_user_page_vma_remote(mm, addr,
> > +					FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
> > +					&vma);
> > +	if (IS_ERR(page))
> > +		return page;
> >  	folio = page_folio(page);
> >  
> >  	if (!folio_test_anon(folio) || folio_test_hugetlb(folio)) {
> > @@ -2558,11 +2440,51 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
> >  		return ERR_PTR(-EBUSY);
> >  	}
> >  
> > -	if (!folio_make_device_exclusive(folio, mm, addr, owner)) {
> > +	/*
> > +	 * Let's do a second walk and make sure we still find the same page
> > +	 * mapped writable. If we don't find what we expect, we will trigger
> > +	 * GUP again to fix it up. Note that a page of an anonymous folio can
> > +	 * only be mapped writable using exactly one page table mapping
> > +	 * ("exclusive"), so there cannot be other mappings.
> > +	 */
> > +	fw_folio = folio_walk_start(&fw, vma, addr, 0);
> > +	if (fw_folio != folio || fw.page != page ||
> > +	    fw.level != FW_LEVEL_PTE || !pte_write(fw.pte)) {
> > +		if (fw_folio)
> > +			folio_walk_end(&fw, vma);
> >  		folio_unlock(folio);
> >  		folio_put(folio);
> >  		return ERR_PTR(-EBUSY);
> >  	}
> > +
> > +	/* Nuke the page table entry so we get the uptodate dirty bit. */
> > +	flush_cache_page(vma, addr, page_to_pfn(page));
> > +	fw.pte = ptep_clear_flush(vma, addr, fw.ptep);
> > +
> > +	/* Set the dirty flag on the folio now the pte is gone. */
> > +	if (pte_dirty(fw.pte))
> > +		folio_mark_dirty(folio);
> > +
> > +	/*
> > +	 * Store the pfn of the page in a special device-exclusive non-swap pte.
> > +	 * do_swap_page() will trigger the conversion back while holding the
> > +	 * folio lock.
> > +	 */
> > +	entry = make_writable_device_exclusive_entry(page_to_pfn(page));
> > +	swp_pte = swp_entry_to_pte(entry);
> > +	if (pte_soft_dirty(fw.pte))
> > +		swp_pte = pte_swp_mksoft_dirty(swp_pte);
> > +	/* The pte is writable, uffd-wp does not apply. */
> > +	set_pte_at(mm, addr, fw.ptep, swp_pte);
> > +
> > +	/*
> > +	 * TODO: The device-exclusive non-swap PTE holds a folio reference but
> > +	 * does not count as a mapping (mapcount), which is wrong and must be
> > +	 * fixed, otherwise RMAP walks don't behave as expected.
> > +	 */
> > +	folio_remove_rmap_pte(folio, page, vma);
> > +
> > +	folio_walk_end(&fw, vma);
> >  	*foliop = folio;
> >  	return page;
> >  }
> > -- 
> > 2.48.1
> > 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
