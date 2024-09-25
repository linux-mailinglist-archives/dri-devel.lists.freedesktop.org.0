Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A219858C3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD6910E92E;
	Wed, 25 Sep 2024 11:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="P3HyE21H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C3A10E92D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 11:47:01 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a9018103214so922032166b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 04:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727264820; x=1727869620; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2Tj8OK7kAZuX6f62M6xEEAJ7JItwlIyoheBJHCTZORU=;
 b=P3HyE21HpEm4IUoi3vh5u3jskMG/+MLMeOR7H1o0Bj5D7xsiMNrW+rtoZRkpmKYtyR
 wCkHKN7vwulc+DM1Ralei9EL5scBwGRHg2DGaGvFQTRb8vq8tVywycimAWFaFbcy1KkB
 EVHeqmIZPU5j3g6OXySJmyLFLp4l3TTJjek4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727264820; x=1727869620;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Tj8OK7kAZuX6f62M6xEEAJ7JItwlIyoheBJHCTZORU=;
 b=Pg1DfC3OR37PJR9UvW6mYcitmHnatuXesGSnfY1dyZTOlTzLm5NveIaz68aNISEVHS
 adxlfLt6QX7R+lxCQ2q0p2pdJACIjRm0zW6OAzRacedJeoNbodp/+p/BmBWqtm2RHGhq
 0gqyM1psmRcxbGLGasFEo7b/iQGGSmnZ5VmMZ3jjqGdslH5h9RTjhhQ+b7V69t4fPMYX
 lw34604aQfbGmzJXmJ1ecHJli/TP7YI2Ni4+weEUVG3xrTpu6oGVVOOzO+0oBCNWQgAo
 G41+H/2ihPLQ+9/sEOTAxN0TzTlaX6ArfhuY4KrobgB1nbbOCYjWVw/oXMB5gx8XeUhZ
 4Xog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUksJDP+ju0CKB9tdG8xGX5Vy7RgsaFfKBElLIugoUwv0qEkFMFHUNXTBXqIZ/Zk6f2NZTbIXRBTg8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZNTT9rCDISxuzahFIyqBOkZdoZpX/rAXhcLQf+nE577Jqcozx
 IP006evEwpxnC4JCMJb97yWavtI8g0nYckMpCU4+rKcu0BVfnk7OXr3uJm69rww=
X-Google-Smtp-Source: AGHT+IHA+kTMtzXW+qfkLE7ljWb+OA36okKl+ArJf1qTHHurl9kG5RKfiHFN0x1MY0ci0Ts+ytgVvw==
X-Received: by 2002:a17:906:c144:b0:a8a:5bfb:7d1a with SMTP id
 a640c23a62f3a-a93a03c10a8mr226914366b.35.1727264820005; 
 Wed, 25 Sep 2024 04:47:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f54691sm199912266b.85.2024.09.25.04.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 04:46:59 -0700 (PDT)
Date: Wed, 25 Sep 2024 13:46:57 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Alistair Popple <apopple@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, simona.vetter@ffwll.ch,
 Philip.Yang@amd.com, akpm@linux-foundation.org,
 felix.kuehling@amd.com, christian.koenig@amd.com
Subject: Re: [PATCH 1/1] mm/migrate: Trylock device page in do_swap_page
Message-ID: <ZvP4MX762EnyRTBR@phenom.ffwll.local>
Mail-Followup-To: Alistair Popple <apopple@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Philip.Yang@amd.com, akpm@linux-foundation.org,
 felix.kuehling@amd.com, christian.koenig@amd.com
References: <20240911030337.870160-1-matthew.brost@intel.com>
 <20240911030337.870160-2-matthew.brost@intel.com>
 <87mskehjtc.fsf@nvdebian.thelocal>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mskehjtc.fsf@nvdebian.thelocal>
X-Operating-System: Linux phenom 6.10.6-amd64 
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

On Wed, Sep 11, 2024 at 02:53:31PM +1000, Alistair Popple wrote:
> 
> Matthew Brost <matthew.brost@intel.com> writes:
> 
> > Avoid multiple CPU page faults to the same device page racing by locking
> > the page in do_swap_page before taking an additional reference to the
> > page. This prevents scenarios where multiple CPU page faults each take
> > an extra reference to a device page, which could abort migration in
> > folio_migrate_mapping. With the device page locked in do_swap_page, the
> > migrate_vma_* functions need to be updated to avoid locking the
> > fault_page argument.
> 
> I added the get_page() and therefore the fault_page argument to deal
> with another lifetime issue. Neither Felix nor I particularly liked the
> solution though (see
> https://lore.kernel.org/all/cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com/T/#m715589d57716448386ff9af41da27a952d94615a)
> and this seems to make it even uglier, so I have suggested an
> alternative solution below.

Just an aside, I don't fine the fault_page special handling all that
offensive, because fundamentally fault_page _is_ special: It's the one
page we _really_ have to migrate or userspace blows up because the kernel
sucks.

But maybe we shold stuff it into the vmf struct instead and pass that
around? I think that would be conceptually a notch cleaner.
-Sima

> 
> > Prior to this change, a livelock scenario could occur in Xe's (Intel GPU
> > DRM driver) SVM implementation if enough threads faulted the same device
> > page.
> 
> I haven't seen the same in the NVIDIA UVM driver (out-of-tree, I know)
> but theoretically it seems like it should be possible. However we
> serialize migrations of the same virtual address range to avoid these
> kind of issues as they can happen the other way too (ie. multiple
> threads trying to migrate to GPU).
> 
> So I suspect what happens in UVM is that one thread wins and installs
> the migration entry while the others fail to get the driver migration
> lock and bail out sufficiently early in the fault path to avoid the
> live-lock.
> 
> > Cc: Philip Yang <Philip.Yang@amd.com>
> > Cc: Felix Kuehling <felix.kuehling@amd.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  mm/memory.c         | 13 +++++++---
> >  mm/migrate_device.c | 60 +++++++++++++++++++++++++++++++--------------
> >  2 files changed, 50 insertions(+), 23 deletions(-)
> >
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 3c01d68065be..bbd97d16a96a 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -4046,10 +4046,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> >  			 * Get a page reference while we know the page can't be
> >  			 * freed.
> >  			 */
> > -			get_page(vmf->page);
> > -			pte_unmap_unlock(vmf->pte, vmf->ptl);
> > -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > -			put_page(vmf->page);
> > +			if (trylock_page(vmf->page)) {
> > +				get_page(vmf->page);
> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> 
> This is all beginning to look a lot like migrate_vma_collect_pmd(). So
> rather than do this and then have to pass all this context
> (ie. fault_page) down to the migrate_vma_* functions could we instead
> just do what migrate_vma_collect_pmd() does here? Ie. we already have
> the PTL and the page lock so there's no reason we couldn't just setup
> the migration entry prior to calling migrate_to_ram().
> 
> Obviously calling migrate_vma_setup() would show the page as not
> migrating, but drivers could easily just fill in the src_pfn info after
> calling migrate_vma_setup().
> 
> This would eliminate the whole fault_page ugliness.
> 
> > +				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > +				put_page(vmf->page);
> > +				unlock_page(vmf->page);
> > +			} else {
> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > +			}
> >  		} else if (is_hwpoison_entry(entry)) {
> >  			ret = VM_FAULT_HWPOISON;
> >  		} else if (is_pte_marker_entry(entry)) {
> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > index 6d66dc1c6ffa..049893a5a179 100644
> > --- a/mm/migrate_device.c
> > +++ b/mm/migrate_device.c
> > @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  				   struct mm_walk *walk)
> >  {
> >  	struct migrate_vma *migrate = walk->private;
> > +	struct folio *fault_folio = migrate->fault_page ?
> > +		page_folio(migrate->fault_page) : NULL;
> >  	struct vm_area_struct *vma = walk->vma;
> >  	struct mm_struct *mm = vma->vm_mm;
> >  	unsigned long addr = start, unmapped = 0;
> > @@ -88,11 +90,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  
> >  			folio_get(folio);
> >  			spin_unlock(ptl);
> > -			if (unlikely(!folio_trylock(folio)))
> > +			if (unlikely(fault_folio != folio &&
> > +				     !folio_trylock(folio)))
> >  				return migrate_vma_collect_skip(start, end,
> >  								walk);
> >  			ret = split_folio(folio);
> > -			folio_unlock(folio);
> > +			if (fault_folio != folio)
> > +				folio_unlock(folio);
> >  			folio_put(folio);
> >  			if (ret)
> >  				return migrate_vma_collect_skip(start, end,
> > @@ -192,7 +196,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  		 * optimisation to avoid walking the rmap later with
> >  		 * try_to_migrate().
> >  		 */
> > -		if (folio_trylock(folio)) {
> > +		if (fault_folio == folio || folio_trylock(folio)) {
> >  			bool anon_exclusive;
> >  			pte_t swp_pte;
> >  
> > @@ -204,7 +208,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  
> >  				if (folio_try_share_anon_rmap_pte(folio, page)) {
> >  					set_pte_at(mm, addr, ptep, pte);
> > -					folio_unlock(folio);
> > +					if (fault_folio != folio)
> > +						folio_unlock(folio);
> >  					folio_put(folio);
> >  					mpfn = 0;
> >  					goto next;
> > @@ -363,6 +368,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> >  					  unsigned long npages,
> >  					  struct page *fault_page)
> >  {
> > +	struct folio *fault_folio = fault_page ?
> > +		page_folio(fault_page) : NULL;
> >  	unsigned long i, restore = 0;
> >  	bool allow_drain = true;
> >  	unsigned long unmapped = 0;
> > @@ -427,7 +434,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> >  		remove_migration_ptes(folio, folio, false);
> >  
> >  		src_pfns[i] = 0;
> > -		folio_unlock(folio);
> > +		if (fault_folio != folio)
> > +			folio_unlock(folio);
> >  		folio_put(folio);
> >  		restore--;
> >  	}
> > @@ -536,6 +544,8 @@ int migrate_vma_setup(struct migrate_vma *args)
> >  		return -EINVAL;
> >  	if (args->fault_page && !is_device_private_page(args->fault_page))
> >  		return -EINVAL;
> > +	if (args->fault_page && !PageLocked(args->fault_page))
> > +		return -EINVAL;
> >  
> >  	memset(args->src, 0, sizeof(*args->src) * nr_pages);
> >  	args->cpages = 0;
> > @@ -799,19 +809,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
> >  }
> >  EXPORT_SYMBOL(migrate_vma_pages);
> >  
> > -/*
> > - * migrate_device_finalize() - complete page migration
> > - * @src_pfns: src_pfns returned from migrate_device_range()
> > - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > - * @npages: number of pages in the range
> > - *
> > - * Completes migration of the page by removing special migration entries.
> > - * Drivers must ensure copying of page data is complete and visible to the CPU
> > - * before calling this.
> > - */
> > -void migrate_device_finalize(unsigned long *src_pfns,
> > -			unsigned long *dst_pfns, unsigned long npages)
> > +static void __migrate_device_finalize(unsigned long *src_pfns,
> > +				      unsigned long *dst_pfns,
> > +				      unsigned long npages,
> > +				      struct page *fault_page)
> >  {
> > +	struct folio *fault_folio = fault_page ?
> > +		page_folio(fault_page) : NULL;
> >  	unsigned long i;
> >  
> >  	for (i = 0; i < npages; i++) {
> > @@ -838,7 +842,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >  		src = page_folio(page);
> >  		dst = page_folio(newpage);
> >  		remove_migration_ptes(src, dst, false);
> > -		folio_unlock(src);
> > +		if (fault_folio != src)
> > +			folio_unlock(src);
> >  
> >  		if (is_zone_device_page(page))
> >  			put_page(page);
> > @@ -854,6 +859,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >  		}
> >  	}
> >  }
> > +
> > +/*
> > + * migrate_device_finalize() - complete page migration
> > + * @src_pfns: src_pfns returned from migrate_device_range()
> > + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > + * @npages: number of pages in the range
> > + *
> > + * Completes migration of the page by removing special migration entries.
> > + * Drivers must ensure copying of page data is complete and visible to the CPU
> > + * before calling this.
> > + */
> > +void migrate_device_finalize(unsigned long *src_pfns,
> > +			unsigned long *dst_pfns, unsigned long npages)
> > +{
> > +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
> > +}
> >  EXPORT_SYMBOL(migrate_device_finalize);
> >  
> >  /**
> > @@ -869,7 +890,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
> >   */
> >  void migrate_vma_finalize(struct migrate_vma *migrate)
> >  {
> > -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
> > +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
> > +				  migrate->fault_page);
> >  }
> >  EXPORT_SYMBOL(migrate_vma_finalize);
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
