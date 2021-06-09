Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 167893A1A72
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 18:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1795D6E982;
	Wed,  9 Jun 2021 16:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97BF6E987
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 16:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623254711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F9+g1I6U91zrPqFexpjaxQ/1X4+oKkXG1hR1XzuO5AM=;
 b=CB9rgzPgyeNpkc7pPfRNSb9eqREb+9xNVJyo05GumU6MVDcUFNKDo1+JanyChpI3CBbwrG
 RTak/RSDJS+x0MhSl4mEWrnitV/e/gRF5DFlxo5XF5927GBfNlkEpN4jIviYPP/mF5xoVM
 5FhN56AdyQM/L5tOOoE5JYA9uMXqH6Y=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-ZMO1S4BvOgWZHm66yYpcow-1; Wed, 09 Jun 2021 12:05:10 -0400
X-MC-Unique: ZMO1S4BvOgWZHm66yYpcow-1
Received: by mail-qk1-f200.google.com with SMTP id
 y5-20020a37af050000b02903a9c3f8b89fso17236233qke.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 09:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F9+g1I6U91zrPqFexpjaxQ/1X4+oKkXG1hR1XzuO5AM=;
 b=FP4R0eMn/ASdilW/U+efZLy+K2lcHS5A/25RQyvsfV6Xf+OXSm26SJNKtN8abdalk2
 xO357Bcd28rGkhq1jbDzXiAlN7k4zPD+8NNV5w5SJwVDWhvFcvG9IoLbh4nUxXkgTw8a
 Moyy+K5Y4+JEr4bZsajXf9dzagFm65vxZhTPIlaBzJ83zPQnin/7Uoz2/hOHX8cpoI/N
 mP+hiJTObfttGwg5r/WJewQR7IJIj9JHAcgBA3yOfccgs8heOwz4ldnGiiC3QSeFh5Lw
 gW6Y91xPH59fgPVpueDqg2L4N0rLgHp3W2dLq7uKtdetyKDe7RjSc+ZSkyH0dBLd6tMi
 JLAA==
X-Gm-Message-State: AOAM532zj9rf/uvcfnMci660rD0ngr3/IqeUQ+eM6TOGwtrPHq/4Z4cN
 VLw7MFqL3p69SZ7wyAcSzZUEGLwMcVaQdXV5MmmNgpO/hTLCivVF/J8ZwlZFPBYL5oDIWmVjCew
 dAKYDZXJyT+n4yESps2QofIBAgU7B
X-Received: by 2002:ac8:5c11:: with SMTP id i17mr686946qti.64.1623254709486;
 Wed, 09 Jun 2021 09:05:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKHB25K0M5fq8PrZmQE3smgbxPoTbC7XrVv7VMXvD1wpUPX622YvjCP+XWN7ApOcy6PmFRxw==
X-Received: by 2002:ac8:5c11:: with SMTP id i17mr686880qti.64.1623254708958;
 Wed, 09 Jun 2021 09:05:08 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca.
 [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id c68sm307689qkd.112.2021.06.09.09.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 09:05:08 -0700 (PDT)
Date: Wed, 9 Jun 2021 12:05:06 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v10 07/10] mm: Device exclusive memory access
Message-ID: <YMDmsha6GDtUf3Vs@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <20210607075855.5084-8-apopple@nvidia.com> <YL+4ENiwbn9QAa2V@t490s>
 <270551728.uXnuCZxQlr@nvdebian>
MIME-Version: 1.0
In-Reply-To: <270551728.uXnuCZxQlr@nvdebian>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 shakeelb@google.com, bskeggs@redhat.com, jgg@nvidia.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 09, 2021 at 07:38:04PM +1000, Alistair Popple wrote:
> On Wednesday, 9 June 2021 4:33:52 AM AEST Peter Xu wrote:
> > On Mon, Jun 07, 2021 at 05:58:52PM +1000, Alistair Popple wrote:
> > 
> > [...]
> > 
> > > +static bool page_make_device_exclusive_one(struct page *page,
> > > +             struct vm_area_struct *vma, unsigned long address, void *priv)
> > > +{
> > > +     struct mm_struct *mm = vma->vm_mm;
> > > +     struct page_vma_mapped_walk pvmw = {
> > > +             .page = page,
> > > +             .vma = vma,
> > > +             .address = address,
> > > +     };
> > > +     struct make_exclusive_args *args = priv;
> > > +     pte_t pteval;
> > > +     struct page *subpage;
> > > +     bool ret = true;
> > > +     struct mmu_notifier_range range;
> > > +     swp_entry_t entry;
> > > +     pte_t swp_pte;
> > > +
> > > +     mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0, vma,
> > > +                                   vma->vm_mm, address, min(vma->vm_end,
> > > +                                   address + page_size(page)), args->owner);
> > > +     mmu_notifier_invalidate_range_start(&range);
> > > +
> > > +     while (page_vma_mapped_walk(&pvmw)) {
> > > +             /* Unexpected PMD-mapped THP? */
> > > +             VM_BUG_ON_PAGE(!pvmw.pte, page);
> > 
> > [1]
> > 
> > > +
> > > +             if (!pte_present(*pvmw.pte)) {
> > > +                     ret = false;
> > > +                     page_vma_mapped_walk_done(&pvmw);
> > > +                     break;
> > > +             }
> > > +
> > > +             subpage = page - page_to_pfn(page) + pte_pfn(*pvmw.pte);
> > > +             address = pvmw.address;
> > 
> > I raised a question here previously and didn't get an answer...
> > 
> > https://lore.kernel.org/linux-mm/YLDr%2FRyAdUR4q0kk@t490s/
> 
> Sorry, I had overlooked that. Will continue the discussion here.

No problem.  I also didn't really express clearly last time, I'm happy we can
discuss this more thoroughly, even if it may be a corner case only.

> 
> > I think I get your point now and it does look possible that the split page can
> > still be mapped somewhere else as thp, then having some subpage maintainance
> > looks necessary.  The confusing part is above [1] you've also got that
> > VM_BUG_ON_PAGE() assuming it must not be a mapped pmd at all..
> 
> Going back I thought your original question was whether subpage != page is
> possible. My main point was it's possible if we get a thp head. In that case we
> need to replace all pte's with exclusive entries because I haven't (yet)
> defined a pmd version of device exclusive entries and also rmap_walk won't deal
> with tail pages (see below).
> 
> > Then I remembered these code majorly come from the try_to_unmap() so I looked
> > there.  I _think_ what's missing here is something like:
> > 
> >         if (flags & TTU_SPLIT_HUGE_PMD)
> >                 split_huge_pmd_address(vma, address, false, page);
> > 
> > at the entry of page_make_device_exclusive_one()?
> >
> > That !pte assertion in try_to_unmap() makes sense to me as long as it has split
> > the thp page first always.  However seems not the case for FOLL_SPLIT_PMD as
> > you previously mentioned.
> 
> At present this is limited to PageAnon pages which have had CoW broken, which I
> think means there shouldn't be other mappings so I expect the PMD will always
> have been split into small PTEs mapping subpages by GUP which is what that
> assertion [1] is checking. I could call split_huge_pmd_address() unconditionally
> as suggested but see the discussion below.

Yes, I think calling that unconditionally should be enough.

> 
> > Meanwhile, I also started to wonder whether it's even right to call rmap_walk()
> > with tail pages...  Please see below.
> > 
> > > +
> > > +             /* Nuke the page table entry. */
> > > +             flush_cache_page(vma, address, pte_pfn(*pvmw.pte));
> > > +             pteval = ptep_clear_flush(vma, address, pvmw.pte);
> > > +
> > > +             /* Move the dirty bit to the page. Now the pte is gone. */
> > > +             if (pte_dirty(pteval))
> > > +                     set_page_dirty(page);
> > > +
> > > +             /*
> > > +              * Check that our target page is still mapped at the expected
> > > +              * address.
> > > +              */
> > > +             if (args->mm == mm && args->address == address &&
> > > +                 pte_write(pteval))
> > > +                     args->valid = true;
> > > +
> > > +             /*
> > > +              * Store the pfn of the page in a special migration
> > > +              * pte. do_swap_page() will wait until the migration
> > > +              * pte is removed and then restart fault handling.
> > > +              */
> > > +             if (pte_write(pteval))
> > > +                     entry = make_writable_device_exclusive_entry(
> > > +                                                     page_to_pfn(subpage));
> > > +             else
> > > +                     entry = make_readable_device_exclusive_entry(
> > > +                                                     page_to_pfn(subpage));
> > > +             swp_pte = swp_entry_to_pte(entry);
> > > +             if (pte_soft_dirty(pteval))
> > > +                     swp_pte = pte_swp_mksoft_dirty(swp_pte);
> > > +             if (pte_uffd_wp(pteval))
> > > +                     swp_pte = pte_swp_mkuffd_wp(swp_pte);
> > > +
> > > +             set_pte_at(mm, address, pvmw.pte, swp_pte);
> > > +
> > > +             /*
> > > +              * There is a reference on the page for the swap entry which has
> > > +              * been removed, so shouldn't take another.
> > > +              */
> > > +             page_remove_rmap(subpage, false);
> > > +     }
> > > +
> > > +     mmu_notifier_invalidate_range_end(&range);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +/**
> > > + * page_make_device_exclusive - mark the page exclusively owned by a device
> > > + * @page: the page to replace page table entries for
> > > + * @mm: the mm_struct where the page is expected to be mapped
> > > + * @address: address where the page is expected to be mapped
> > > + * @owner: passed to MMU_NOTIFY_EXCLUSIVE range notifier callbacks
> > > + *
> > > + * Tries to remove all the page table entries which are mapping this page and
> > > + * replace them with special device exclusive swap entries to grant a device
> > > + * exclusive access to the page. Caller must hold the page lock.
> > > + *
> > > + * Returns false if the page is still mapped, or if it could not be unmapped
> > > + * from the expected address. Otherwise returns true (success).
> > > + */
> > > +static bool page_make_device_exclusive(struct page *page, struct mm_struct *mm,
> > > +                             unsigned long address, void *owner)
> > > +{
> > > +     struct make_exclusive_args args = {
> > > +             .mm = mm,
> > > +             .address = address,
> > > +             .owner = owner,
> > > +             .valid = false,
> > > +     };
> > > +     struct rmap_walk_control rwc = {
> > > +             .rmap_one = page_make_device_exclusive_one,
> > > +             .done = page_not_mapped,
> > > +             .anon_lock = page_lock_anon_vma_read,
> > > +             .arg = &args,
> > > +     };
> > > +
> > > +     /*
> > > +      * Restrict to anonymous pages for now to avoid potential writeback
> > > +      * issues.
> > > +      */
> > > +     if (!PageAnon(page))
> > > +             return false;
> > > +
> > > +     rmap_walk(page, &rwc);
> > 
> > Here we call rmap_walk() on each page we've got.  If it was thp then IIUC it'll
> > become the tail pages to walk as the outcome of FOLL_SPLIT_PMD gup (please
> > refer to the last reply of mine).  However now I'm uncertain whether we can do
> > rmap_walk on tail page at all...  As rmap_walk_anon() has thp_nr_pages() which
> > has:
> > 
> >         VM_BUG_ON_PGFLAGS(PageTail(page), page);
> 
> In either case (FOLL_SPLIT_PMD or not) my understanding is GUP will return a
> sub/tail page (perhaps I mixed up some terminology in the last thread but I
> think we're in agreement here).

Aha, I totally missed this when I read last time (of follow_trans_huge_pmd)..

	page += (addr & ~HPAGE_PMD_MASK) >> PAGE_SHIFT;

Now I agree it'll always return subpage, even if thp mapped.  And do
FOLL_SPLIT_PMD makes sense too to do early break on cow pages as you said
before.

> For thp this means we could end up passing
> tail pages to rmap_walk(), however it doesn't actually walk them.
> 
> Based on the results of previous testing I had done I assumed rmap_walk()
> filtered out tail pages. It does, and I didn't hit the BUG_ON above, but the
> filtering was not as deliberate as assumed.
> 
> I've gone back and looked at what was happening in my earlier tests and the
> tail pages get filtered because the VMA is not getting locked in
> page_lock_anon_vma_read() due to failing this check:
> 
> 	anon_mapping = (unsigned long)READ_ONCE(page->mapping);
> 	if ((anon_mapping & PAGE_MAPPING_FLAGS) != PAGE_MAPPING_ANON)
> 		goto out;
> 
> And now I'm not sure it makes sense to read page->mapping of a tail page. So
> it might be best if we explicitly ignore any tail pages returned from GUP, at
> least for now (a future series will improve thp support such as adding a pmd
> version for exclusive entries).

I feel like it's illegal to access page->mapping of tail pages; I looked at
what happens if we call page_anon_vma() on a tail page:

struct anon_vma *page_anon_vma(struct page *page)
{
	unsigned long mapping;

	page = compound_head(page);
	mapping = (unsigned long)page->mapping;
	if ((mapping & PAGE_MAPPING_FLAGS) != PAGE_MAPPING_ANON)
		return NULL;
	return __page_rmapping(page);
}

It'll just take the head's mapping instead.  It makes sense since the tail page
shouldn't have a different value against the head page, afaiu.

It would be great if thp experts could chim in.  Before that happens, I agree
with you that a safer approach is to explicitly not walk a tail page for its
rmap (and I think the rmap of a tail page will be the same of the head
anyways.. since they seem to share the anon_vma as quoted).

> 
> > So... for thp mappings, wondering whether we should do normal GUP (without
> > SPLIT), pass in always normal or head pages into rmap_walk(), but then
> > unconditionally split_huge_pmd_address() in page_make_device_exclusive_one()?
> 
> That could work (although I think GUP will still return tail pages - see
> follow_trans_huge_pmd() which is called from follow_pmd_mask() in gup).

Agreed.

> The main problem is split_huge_pmd_address() unconditionally calls a mmu
> notifier so I would need to plumb in passing an owner everywhere which could
> get messy.

Could I ask why?  split_huge_pmd_address() will notify with CLEAR, so I'm a bit
confused why we need to pass over the owner.

I thought plumb it right before your EXCLUSIVE notifier init would work?

---8<---
diff --git a/mm/rmap.c b/mm/rmap.c
index a94d9aed9d95..360ce86f3822 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2042,6 +2042,12 @@ static bool page_make_device_exclusive_one(struct page *page,
        swp_entry_t entry;
        pte_t swp_pte;
 
+       /*
+        * Make sure thps split as device exclusive entries only support pte
+        * level for now.
+        */
+       split_huge_pmd_address(vma, address, false, page);
+
        mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0, vma,
                                      vma->vm_mm, address, min(vma->vm_end,
                                      address + page_size(page)), args->owner);
---8<---

Thanks,

-- 
Peter Xu

