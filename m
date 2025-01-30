Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2894A22B58
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 11:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65DA10E922;
	Thu, 30 Jan 2025 10:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ibKg5JbF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41C810E923
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 10:10:59 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4368a293339so6659605e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 02:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738231858; x=1738836658; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=93vOIonXuhhlCsVZNUEtlATNESA+m5aY8gZZwzqgor4=;
 b=ibKg5JbFwr7qkxk/89t0unoCCl9ZPswtLoJlWl5P1SMVWY7mY7iwCgHIhfpDD/qqR4
 Lq5rv18kmJdwICPh7ZxrT0/FIRVfonFTMAlB2SDIbVpnupD3duByi4OFX3aAHUK7hF1J
 nf/oxD2/5/KB1L6wCPuTqSFxAnpOReCfDLvaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738231858; x=1738836658;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=93vOIonXuhhlCsVZNUEtlATNESA+m5aY8gZZwzqgor4=;
 b=OCsPj90Mk8cT7wEJDvBITGhaKiAoP467h1RppFRgGg5GKFrhCHTLDGTBDbAhcek9cP
 X1oSDWcN3u260EMDyhISzyyLGZBd6R2jqsPBI7H9DdYm+ZGd3LSOGYdjtSwOti9WBM11
 f0OlJjCJ/y1Ur+omGVkoDr+wPeGXi4kVhd5kwJtyRVikJrcoK82hiN7R7bgAhi9htRH5
 Xgw15dOuxDG4+J1wchj1Sm8d7jR2RwCvl/Kh90Nnt08lWdespbb5VxG3RK7g1ZQ6IZlf
 xis94MdLYjMJkWO8BK557jDmhH3ifbjJl8IrTC9prNKwBRoSENjaod4pzc/hKkk+l0E6
 eztA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYVM2y98UryAga3sXWDlP0hMf7YTLkkat4pIW1wV0LK+udDtXzWkK/QhFHGc3TuPFMgJLBhBQ8Qnc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeS3l6Ro6J7YfsglNf89YsWerTkwvO6ok/Ds5LrD0qgTsoiXfD
 95VB5v7Ay83gff0c81GXXwcozxXNbGNx5LJ4PrBSThWMuaFTM6snziWfJzUPYHA=
X-Gm-Gg: ASbGnct6oJixhA6PgvpOD3RJHyxk7pBla2ThrNB72355ieBJMlarjEMh4wH7JC4XXr7
 MWhip1yqbBwSSScOJ8BzWWxPkG9+i4asDbs4zPt0dt242mGrVDJIYc0CYlyRN1QxOtNBUFI3W9B
 ZCn/WlL2tMNJyvBXBL+y7QhFVck21SgBbFd4kAiWJOOqaRGKDoMnTDRi22BWGW2QuNdkXIt2wT6
 64xI6tQuvlSRFmQRDTi9fnA+J37HfFhR3vVlN5aQcrEgx/0tsZ18UiKRcRIpf3H38S1PzCMF2tf
 M8OM6medubV7xc8sb8gmcx9W5BM=
X-Google-Smtp-Source: AGHT+IGJbnpeQf8B7cOXmXj6f06PfyU+GyWQpPIgeE+bqBElNwC7Ri+H94bg3ZkKWdVeU5p3l70P8w==
X-Received: by 2002:a05:600c:3501:b0:434:a7e3:db5c with SMTP id
 5b1f17b1804b1-438e2446708mr19019575e9.11.1738231858001; 
 Thu, 30 Jan 2025 02:10:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81911sm52790125e9.38.2025.01.30.02.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 02:10:57 -0800 (PST)
Date: Thu, 30 Jan 2025 11:10:55 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
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
 Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 08/12] mm/rmap: handle device-exclusive entries
 correctly in try_to_unmap_one()
Message-ID: <Z5tQL60SNNGCkfQR@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org,
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
 Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-9-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115411.2077152-9-david@redhat.com>
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

On Wed, Jan 29, 2025 at 12:54:06PM +0100, David Hildenbrand wrote:
> Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
> we can return with a device-exclusive entry from page_vma_mapped_walk().
> 
> try_to_unmap_one() is not prepared for that, so teach it about these
> non-present nonswap PTEs.
> 
> Before that, could we also have triggered this case with device-private
> entries? Unlikely.

Just quick comment on this, I'm still pondering all the other aspects.

device-private memory is entirely owned by the driver, the core mm isn't
supposed to touch these beyond migrating it back to system memory in
do_swap_page. Plus using rmap when the driver asks for invalidating
mappings as needed.

So no lru, thp, migration or anything initiated by core mm should ever
happen on these device private pages. If it does, it'd be a bug.

device-exclusive is entirely different ofc since that's just normal system
memory managed by core mm/.
-Sima
> 
> Note that we could currently only run into this case with
> device-exclusive entries on THPs. For order-0 folios, we still adjust
> the mapcount on conversion to device-exclusive, making the rmap walk
> abort early (folio_mapcount() == 0 and breaking swapout). We'll fix
> that next, now that try_to_unmap_one() can handle it.
> 
> Further note that try_to_unmap() calls MMU notifiers and holds the
> folio lock, so any device-exclusive users should be properly prepared
> for this device-exclusive PTE to "vanish".
> 
> Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/rmap.c | 53 ++++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 40 insertions(+), 13 deletions(-)
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 65d9bbea16d0..12900f367a2a 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1648,9 +1648,9 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  {
>  	struct mm_struct *mm = vma->vm_mm;
>  	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
> +	bool anon_exclusive, ret = true;
>  	pte_t pteval;
>  	struct page *subpage;
> -	bool anon_exclusive, ret = true;
>  	struct mmu_notifier_range range;
>  	enum ttu_flags flags = (enum ttu_flags)(long)arg;
>  	unsigned long pfn;
> @@ -1722,7 +1722,19 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  		/* Unexpected PMD-mapped THP? */
>  		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
>  
> -		pfn = pte_pfn(ptep_get(pvmw.pte));
> +		/*
> +		 * We can end up here with selected non-swap entries that
> +		 * actually map pages similar to PROT_NONE; see
> +		 * page_vma_mapped_walk()->check_pte().
> +		 */
> +		pteval = ptep_get(pvmw.pte);
> +		if (likely(pte_present(pteval))) {
> +			pfn = pte_pfn(pteval);
> +		} else {
> +			pfn = swp_offset_pfn(pte_to_swp_entry(pteval));
> +			VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
> +		}
> +
>  		subpage = folio_page(folio, pfn - folio_pfn(folio));
>  		address = pvmw.address;
>  		anon_exclusive = folio_test_anon(folio) &&
> @@ -1778,7 +1790,9 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  				hugetlb_vma_unlock_write(vma);
>  			}
>  			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
> -		} else {
> +			if (pte_dirty(pteval))
> +				folio_mark_dirty(folio);
> +		} else if (likely(pte_present(pteval))) {
>  			flush_cache_page(vma, address, pfn);
>  			/* Nuke the page table entry. */
>  			if (should_defer_flush(mm, flags)) {
> @@ -1796,6 +1810,10 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  			} else {
>  				pteval = ptep_clear_flush(vma, address, pvmw.pte);
>  			}
> +			if (pte_dirty(pteval))
> +				folio_mark_dirty(folio);
> +		} else {
> +			pte_clear(mm, address, pvmw.pte);
>  		}
>  
>  		/*
> @@ -1805,10 +1823,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  		 */
>  		pte_install_uffd_wp_if_needed(vma, address, pvmw.pte, pteval);
>  
> -		/* Set the dirty flag on the folio now the pte is gone. */
> -		if (pte_dirty(pteval))
> -			folio_mark_dirty(folio);
> -
>  		/* Update high watermark before we lower rss */
>  		update_hiwater_rss(mm);
>  
> @@ -1822,8 +1836,8 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  				dec_mm_counter(mm, mm_counter(folio));
>  				set_pte_at(mm, address, pvmw.pte, pteval);
>  			}
> -
> -		} else if (pte_unused(pteval) && !userfaultfd_armed(vma)) {
> +		} else if (likely(pte_present(pteval)) && pte_unused(pteval) &&
> +			   !userfaultfd_armed(vma)) {
>  			/*
>  			 * The guest indicated that the page content is of no
>  			 * interest anymore. Simply discard the pte, vmscan
> @@ -1902,6 +1916,12 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  				set_pte_at(mm, address, pvmw.pte, pteval);
>  				goto walk_abort;
>  			}
> +
> +			/*
> +			 * arch_unmap_one() is expected to be a NOP on
> +			 * architectures where we could have non-swp entries
> +			 * here, so we'll not check/care.
> +			 */
>  			if (arch_unmap_one(mm, vma, address, pteval) < 0) {
>  				swap_free(entry);
>  				set_pte_at(mm, address, pvmw.pte, pteval);
> @@ -1926,10 +1946,17 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  			swp_pte = swp_entry_to_pte(entry);
>  			if (anon_exclusive)
>  				swp_pte = pte_swp_mkexclusive(swp_pte);
> -			if (pte_soft_dirty(pteval))
> -				swp_pte = pte_swp_mksoft_dirty(swp_pte);
> -			if (pte_uffd_wp(pteval))
> -				swp_pte = pte_swp_mkuffd_wp(swp_pte);
> +			if (likely(pte_present(pteval))) {
> +				if (pte_soft_dirty(pteval))
> +					swp_pte = pte_swp_mksoft_dirty(swp_pte);
> +				if (pte_uffd_wp(pteval))
> +					swp_pte = pte_swp_mkuffd_wp(swp_pte);
> +			} else {
> +				if (pte_swp_soft_dirty(pteval))
> +					swp_pte = pte_swp_mksoft_dirty(swp_pte);
> +				if (pte_swp_uffd_wp(pteval))
> +					swp_pte = pte_swp_mkuffd_wp(swp_pte);
> +			}
>  			set_pte_at(mm, address, pvmw.pte, swp_pte);
>  		} else {
>  			/*
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
