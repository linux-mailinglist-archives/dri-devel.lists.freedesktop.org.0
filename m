Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDD2A26F3A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 11:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1858410E304;
	Tue,  4 Feb 2025 10:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="KsRXYm4f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D54C10E304
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 10:19:40 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so36998395e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 02:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738664379; x=1739269179; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ls4rUpX9KWpzDW4b2Z40ClskRs4xRfQGCjUvTHygnvU=;
 b=KsRXYm4f3rIe3M1KNPrRk/rgwVEHM0f2uqDNFQsOJTJv+7LLHLxt8LFZBzkrb6yEAi
 rphWIh+30CX2pwMPI2GRMN8nwFUGL7E1u5E5b2L/lZnuTvRdxtLTg8crGL27TyoYQVwi
 n6gMOYE7TBY6rwEgzB+ISXGiFua3bHhT7+d3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738664379; x=1739269179;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ls4rUpX9KWpzDW4b2Z40ClskRs4xRfQGCjUvTHygnvU=;
 b=Je7TGfbecpCLpH+4hfsiQ56O8H/dsxN0mm2lfIUrGWzuk/TJbgX0N0IxbY/rZpg7+Z
 uz2akA++rDDwHRsjYFn1rsy3kJjgtuuXy3Pjy5mPhKvSVc3Wdm2nKu7x/8butZ8h6hZo
 +UhFRdKyZ3/FHLHlE2JbGTwx0/D0reswBreoZfd2oXHcbvgF5WJL0yfUVDG7Ds5tcgXF
 /7pSWsTr54ZlwD9ZyPCbAJX7KqqqI2yZfeFMMj4HtOl66emPnDIh5C6467MZk1EEWymE
 TdfTbIIw2NtDAo4gXvistt+sJCq6TBKo3IG9KdrkF8qXZAyw6sgkpElVny0sMHAispnz
 wb+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZuGXiI3cEjKoa6CipdkGpvTnt50fGKd18OgIfKQjXQXmaDK33IvalggBHnJxKAbynBuHReEnTj2g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8jyE2l7aZHQHNnrtUrsRWbOoGec8uX7T9vQTP5JyRrR0xHW3+
 tY8k1+25yagV8/H1LTO6Eze6A0pAoXpcpCpGqAEfPe6yQ5HEQQt64Uf1ioLWLeo=
X-Gm-Gg: ASbGncsyCEil+QDENx9QnR4OXEIDm604LzK+JiOzA/5u7aOj5AgRvHfwhx3jBI8x0V4
 3qDH8TAqeQ0WLSGnApB78fjsXgJXbE5e8LZDlyyT4oo2y5Ju4TvwAeRXkVpK7/uNSKsPQz09MM1
 8PJsHpktAFDbwfTZE+u1klyBqNWQWyYwcC/Jd9ry9wTiXZdnK2WFdp9pgICNgjc5Uh+KejnCJSv
 UHz/RnaA3TZIru0StYWWMXLmaRNDxWW8mkGFAGR3Qr1FaDtMMXk3d61Wusc5rsc9FPB3ndDWVZ7
 dZxio4VDjPPtLz5R2kkGENJ9iDY=
X-Google-Smtp-Source: AGHT+IGfnTZuu7x6vWbYmuRmysx88ve6RVrYfx4SVhj9Cnq16Qs0v8RQpAhNnfDl/p101BKPt5R/Qw==
X-Received: by 2002:a05:600c:6d5a:b0:436:e8b4:3cde with SMTP id
 5b1f17b1804b1-438e01febf7mr214271695e9.14.1738664378625; 
 Tue, 04 Feb 2025 02:19:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e245f492sm183438775e9.38.2025.02.04.02.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 02:19:38 -0800 (PST)
Date: Tue, 4 Feb 2025 11:19:35 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jaya Kumar <jayakumar.lkml@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@redhat.com>,
 Kajtar Zsolt <soci@c64.rulez.org>, Maira Canal <mcanal@igalia.com>
Subject: Re: [PATCH 2/3] mm: provide mapping_wrprotect_page() function
Message-ID: <Z6Hptwe_Ugo9Qwl8@phenom.ffwll.local>
Mail-Followup-To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jaya Kumar <jayakumar.lkml@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 Kajtar Zsolt <soci@c64.rulez.org>, Maira Canal <mcanal@igalia.com>
References: <cover.1738347308.git.lorenzo.stoakes@oracle.com>
 <c802c17cdba59e3455f3d7db07659d5da0ed6dc1.1738347308.git.lorenzo.stoakes@oracle.com>
 <Z6DljlvHpjdFof42@phenom.ffwll.local>
 <655f318b-d883-4ddd-9301-53a05ab06bc0@lucifer.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <655f318b-d883-4ddd-9301-53a05ab06bc0@lucifer.local>
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

On Mon, Feb 03, 2025 at 04:30:04PM +0000, Lorenzo Stoakes wrote:
> On Mon, Feb 03, 2025 at 04:49:34PM +0100, Simona Vetter wrote:
> > On Fri, Jan 31, 2025 at 06:28:57PM +0000, Lorenzo Stoakes wrote:
> > > in the fb_defio video driver, page dirty state is used to determine when
> > > frame buffer pages have been changed, allowing for batched, deferred I/O to
> > > be performed for efficiency.
> > >
> > > This implementation had only one means of doing so effectively - the use of
> > > the folio_mkclean() function.
> > >
> > > However, this use of the function is inappropriate, as the fb_defio
> > > implementation allocates kernel memory to back the framebuffer, and then is
> > > forced to specified page->index, mapping fields in order to permit the
> > > folio_mkclean() rmap traversal to proceed correctly.
> > >
> > > It is not correct to specify these fields on kernel-allocated memory, and
> > > moreover since these are not folios, page->index, mapping are deprecated
> > > fields, soon to be removed.
> > >
> > > We therefore need to provide a means by which we can correctly traverse the
> > > reverse mapping and write-protect mappings for a page backing an
> > > address_space page cache object at a given offset.
> > >
> > > This patch provides this - mapping_wrprotect_page() allows for this
> > > operation to be performed for a specified address_space, offset and page,
> > > without requiring a folio nor, of course, an inappropriate use of
> > > page->index, mapping.
> > >
> > > With this provided, we can subequently adjust the fb_defio implementation
> > > to make use of this function and avoid incorrect invocation of
> > > folio_mkclean() and more importantly, incorrect manipulation of
> > > page->index, mapping fields.
> > >
> > > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > ---
> > >  include/linux/rmap.h |  3 ++
> > >  mm/rmap.c            | 73 ++++++++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 76 insertions(+)
> > >
> > > diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> > > index 683a04088f3f..0bf5f64884df 100644
> > > --- a/include/linux/rmap.h
> > > +++ b/include/linux/rmap.h
> > > @@ -739,6 +739,9 @@ unsigned long page_address_in_vma(const struct folio *folio,
> > >   */
> > >  int folio_mkclean(struct folio *);
> > >
> > > +int mapping_wrprotect_page(struct address_space *mapping, pgoff_t pgoff,
> > > +		unsigned long nr_pages, struct page *page);
> > > +
> > >  int pfn_mkclean_range(unsigned long pfn, unsigned long nr_pages, pgoff_t pgoff,
> > >  		      struct vm_area_struct *vma);
> > >
> > > diff --git a/mm/rmap.c b/mm/rmap.c
> > > index a2ff20c2eccd..bb5a42d95c48 100644
> > > --- a/mm/rmap.c
> > > +++ b/mm/rmap.c
> > > @@ -1127,6 +1127,79 @@ int folio_mkclean(struct folio *folio)
> > >  }
> > >  EXPORT_SYMBOL_GPL(folio_mkclean);
> > >
> > > +struct wrprotect_file_state {
> > > +	int cleaned;
> > > +	pgoff_t pgoff;
> > > +	unsigned long pfn;
> > > +	unsigned long nr_pages;
> > > +};
> > > +
> > > +static bool mapping_wrprotect_page_one(struct folio *folio,
> > > +		struct vm_area_struct *vma, unsigned long address, void *arg)
> > > +{
> > > +	struct wrprotect_file_state *state = (struct wrprotect_file_state *)arg;
> > > +	struct page_vma_mapped_walk pvmw = {
> > > +		.pfn		= state->pfn,
> > > +		.nr_pages	= state->nr_pages,
> > > +		.pgoff		= state->pgoff,
> > > +		.vma		= vma,
> > > +		.address	= address,
> > > +		.flags		= PVMW_SYNC,
> > > +	};
> > > +
> > > +	state->cleaned += page_vma_mkclean_one(&pvmw);
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +static void __rmap_walk_file(struct folio *folio, struct address_space *mapping,
> > > +			     pgoff_t pgoff_start, unsigned long nr_pages,
> > > +			     struct rmap_walk_control *rwc, bool locked);
> > > +
> > > +/**
> > > + * mapping_wrprotect_page() - Write protect all mappings of this page.
> > > + *
> > > + * @mapping:	The mapping whose reverse mapping should be traversed.
> > > + * @pgoff:	The page offset at which @page is mapped within @mapping.
> > > + * @nr_pages:	The number of physically contiguous base pages spanned.
> > > + * @page:	The page mapped in @mapping at @pgoff.
> > > + *
> > > + * Traverses the reverse mapping, finding all VMAs which contain a shared
> > > + * mapping of the single @page in @mapping at offset @pgoff and write-protecting
> > > + * the mappings.
> > > + *
> > > + * The page does not have to be a folio, but rather can be a kernel allocation
> > > + * that is mapped into userland. We therefore do not require that the page maps
> > > + * to a folio with a valid mapping or index field, rather these are specified in
> > > + * @mapping and @pgoff.
> > > + *
> > > + * Return: the number of write-protected PTEs, or an error.
> > > + */
> > > +int mapping_wrprotect_page(struct address_space *mapping, pgoff_t pgoff,
> > > +		unsigned long nr_pages, struct page *page)
> > > +{
> > > +	struct wrprotect_file_state state = {
> > > +		.cleaned = 0,
> > > +		.pgoff = pgoff,
> > > +		.pfn = page_to_pfn(page),
> >
> > Could we go one step further and entirely drop the struct page? Similar to
> > unmap_mapping_range for VM_SPECIAL mappings, except it only updates the
> > write protection. The reason is that ideally we'd like fbdev defio to
> > entirely get rid of any struct page usage, because with some dma_alloc()
> > memory regions there's simply no struct page for them (it's a carveout).
> > See e.g.  Sa498d4d06d6 ("drm/fbdev-dma: Only install deferred I/O if
> > necessary") for some of the pain this has caused.
> >
> > So entirely struct page less way to write protect a pfn would be best. And
> > it doesn't look like you need the page here at all?
> 
> In the original version [1] we did indeed take a PFN, so this shouldn't be
> a problem to change.
> 
> Since we make it possible here to explicitly reference the address_space
> object mapping the range, and from that can find all the VMAs that map the
> page range [pgoff, pgoff + nr_pages), I don't think we do need to think
> about a struct page here at all.
> 
> The defio code does seem to have some questionable assumptions in place, or
> at least ones I couldn't explain away re: attempting to folio-lock (the
> non-folios...), so there'd need to be changes on that side, which I suggest
> would probably be best for a follow-up series given this one's urgency.

Yeah there's a bunch more things we need to do to get there. It was the
lack of a pfn-based core mm function that stopped us from doing that thus
far, plus also fbdev defio being very low priority. But it would
definitely avoid a bunch of corner cases and duplication in fbdev
emulation code in drivers/gpu/drm.

> But I'm more than happy to make this interface work with that by doing
> another revision where we export PFN only, I think something like:
> 
> int mapping_wrprotect_range(struct address_space *mapping, pgoff_t pgoff,
> 		unsigned long pfn, unsigned long nr_pages);
> 
> Should work?
> 
> [1]:https://lore.kernel.org/all/cover.1736352361.git.lorenzo.stoakes@oracle.com/


Yup that looks like the thing we'll need to wean defio of all that
questionable folio/page wrangling. But like you say, should be easy to
add/update when we get there.

Thanks, Sima

> 
> >
> > Cheers, Sima
> 
> Thanks!
> 
> >
> >
> > > +		.nr_pages = nr_pages,
> > > +	};
> > > +	struct rmap_walk_control rwc = {
> > > +		.arg = (void *)&state,
> > > +		.rmap_one = mapping_wrprotect_page_one,
> > > +		.invalid_vma = invalid_mkclean_vma,
> > > +	};
> > > +
> > > +	if (!mapping)
> > > +		return 0;
> > > +
> > > +	__rmap_walk_file(/* folio = */NULL, mapping, pgoff, nr_pages, &rwc,
> > > +			 /* locked = */false);
> > > +
> > > +	return state.cleaned;
> > > +}
> > > +EXPORT_SYMBOL_GPL(mapping_wrprotect_page);
> > > +
> > >  /**
> > >   * pfn_mkclean_range - Cleans the PTEs (including PMDs) mapped with range of
> > >   *                     [@pfn, @pfn + @nr_pages) at the specific offset (@pgoff)
> > > --
> > > 2.48.1
> > >
> >
> > --
> > Simona Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
