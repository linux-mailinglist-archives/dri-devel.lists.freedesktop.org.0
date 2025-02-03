Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 606F1A25F34
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 16:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8370210E4AD;
	Mon,  3 Feb 2025 15:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="dN5YU5qx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D266510E4AD
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 15:49:38 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so46074605e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 07:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738597777; x=1739202577; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4swfrN/KXwv8DqI9T5BPiJD4bprbjtxNuz9fAJpEo2I=;
 b=dN5YU5qx1Y1F7fgcAjHn+fPJIHv3AWsy+AdDj8UDuDIskvLzvpK6l2DfiQoRbQT8Vh
 Ah4XLXblcHblAoqAk6F1E6UYt8ae5c67AxjgiZ/3MXoUv30IVe0h2lAXJ8I4GNvlgfOO
 foAACEuuHtAiJkBfaXKUAXaOeeFtw9nsVQ6M8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738597777; x=1739202577;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4swfrN/KXwv8DqI9T5BPiJD4bprbjtxNuz9fAJpEo2I=;
 b=ORXDig17JsajBdPWHi/9eVvnkUP1gqY0lITDdN2whVMdzzurI7ar5Xv9WRF1Ig8XqN
 Fbhp9kLnBV9nK/8j8FJDmEYIfSWsnou0HyeRgqPo38AybrHeFsyQf3mP5TdNHNBDRLzv
 NMcpt1051GgfIYzkDkniEVws6ixuy3/2fQ2NpRg6gthZ0k8UIO4JHb0J+nVXnbreA09/
 wQmpiMx4sCK7n1YTKM174tmxCxV6Ma0ffvxbQxgBueGA+HEMUroVBrTeNetbY3uta84N
 zsIdyQN7jLmJzOFWoI7U0FCeaZQu/BY9Yb38dECabfj42P9/VsgOHfDE2ybS2yA1urXR
 5Qsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQe+8iY0Ahf2nWbwwM+q5IHoek8yX1nKdE5sJPyQsYdbYTRCfBJgOR8tuk0vtkK3fh8JtsdAksW8E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3OO21KS9ARUtgbAEpUcvmx+ydBaHlhN5WJWfmpD8VeadHX85p
 L156EP20Kh2r5UMema3JUCijqKpa0YD4H6tquozbWJyibzhOQid/8kxyvQQlRYU=
X-Gm-Gg: ASbGncu8uqPsONcP5gImHkpFbG3ifdSO6mXy59MDpMnLuNwEYRrGGdAqqh2XxShbB+T
 WeUxUtDDrb/L+VqFOzePQR1E1bTELKeSHRK9noEGSWpZF2Ogv5CCa+8QZ03zGdAH/G20vZgQqUH
 KzeLsCJw/QaCqTGO+xCqEaRBaj+Foq39bfBgJW5n+mR4fJHmDcZPGnjqv3li8lFdRnN9BgI+aZZ
 ycYtQnmgwoaWY6k00fWGde4Rf+cYestYlcm63ycWXpX9oUXjD8DbXKWphKilRIRc/QVtkOnqSEs
 gGF5EA4Oa4rEkq2OhQaWjdC2bPo=
X-Google-Smtp-Source: AGHT+IFXuD8mylE+ZEqDPpJQ67LpqiN8TrZVlx/UkTqzZgwWZoSori+xM5ZHZR97fwIfxFA4qqZSOg==
X-Received: by 2002:a05:600c:4511:b0:438:a1f5:3e38 with SMTP id
 5b1f17b1804b1-438dc430931mr203886735e9.30.1738597777065; 
 Mon, 03 Feb 2025 07:49:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1d1d03sm13321752f8f.99.2025.02.03.07.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 07:49:36 -0800 (PST)
Date: Mon, 3 Feb 2025 16:49:34 +0100
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
Message-ID: <Z6DljlvHpjdFof42@phenom.ffwll.local>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c802c17cdba59e3455f3d7db07659d5da0ed6dc1.1738347308.git.lorenzo.stoakes@oracle.com>
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

On Fri, Jan 31, 2025 at 06:28:57PM +0000, Lorenzo Stoakes wrote:
> in the fb_defio video driver, page dirty state is used to determine when
> frame buffer pages have been changed, allowing for batched, deferred I/O to
> be performed for efficiency.
> 
> This implementation had only one means of doing so effectively - the use of
> the folio_mkclean() function.
> 
> However, this use of the function is inappropriate, as the fb_defio
> implementation allocates kernel memory to back the framebuffer, and then is
> forced to specified page->index, mapping fields in order to permit the
> folio_mkclean() rmap traversal to proceed correctly.
> 
> It is not correct to specify these fields on kernel-allocated memory, and
> moreover since these are not folios, page->index, mapping are deprecated
> fields, soon to be removed.
> 
> We therefore need to provide a means by which we can correctly traverse the
> reverse mapping and write-protect mappings for a page backing an
> address_space page cache object at a given offset.
> 
> This patch provides this - mapping_wrprotect_page() allows for this
> operation to be performed for a specified address_space, offset and page,
> without requiring a folio nor, of course, an inappropriate use of
> page->index, mapping.
> 
> With this provided, we can subequently adjust the fb_defio implementation
> to make use of this function and avoid incorrect invocation of
> folio_mkclean() and more importantly, incorrect manipulation of
> page->index, mapping fields.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  include/linux/rmap.h |  3 ++
>  mm/rmap.c            | 73 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 76 insertions(+)
> 
> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> index 683a04088f3f..0bf5f64884df 100644
> --- a/include/linux/rmap.h
> +++ b/include/linux/rmap.h
> @@ -739,6 +739,9 @@ unsigned long page_address_in_vma(const struct folio *folio,
>   */
>  int folio_mkclean(struct folio *);
>  
> +int mapping_wrprotect_page(struct address_space *mapping, pgoff_t pgoff,
> +		unsigned long nr_pages, struct page *page);
> +
>  int pfn_mkclean_range(unsigned long pfn, unsigned long nr_pages, pgoff_t pgoff,
>  		      struct vm_area_struct *vma);
>  
> diff --git a/mm/rmap.c b/mm/rmap.c
> index a2ff20c2eccd..bb5a42d95c48 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1127,6 +1127,79 @@ int folio_mkclean(struct folio *folio)
>  }
>  EXPORT_SYMBOL_GPL(folio_mkclean);
>  
> +struct wrprotect_file_state {
> +	int cleaned;
> +	pgoff_t pgoff;
> +	unsigned long pfn;
> +	unsigned long nr_pages;
> +};
> +
> +static bool mapping_wrprotect_page_one(struct folio *folio,
> +		struct vm_area_struct *vma, unsigned long address, void *arg)
> +{
> +	struct wrprotect_file_state *state = (struct wrprotect_file_state *)arg;
> +	struct page_vma_mapped_walk pvmw = {
> +		.pfn		= state->pfn,
> +		.nr_pages	= state->nr_pages,
> +		.pgoff		= state->pgoff,
> +		.vma		= vma,
> +		.address	= address,
> +		.flags		= PVMW_SYNC,
> +	};
> +
> +	state->cleaned += page_vma_mkclean_one(&pvmw);
> +
> +	return true;
> +}
> +
> +static void __rmap_walk_file(struct folio *folio, struct address_space *mapping,
> +			     pgoff_t pgoff_start, unsigned long nr_pages,
> +			     struct rmap_walk_control *rwc, bool locked);
> +
> +/**
> + * mapping_wrprotect_page() - Write protect all mappings of this page.
> + *
> + * @mapping:	The mapping whose reverse mapping should be traversed.
> + * @pgoff:	The page offset at which @page is mapped within @mapping.
> + * @nr_pages:	The number of physically contiguous base pages spanned.
> + * @page:	The page mapped in @mapping at @pgoff.
> + *
> + * Traverses the reverse mapping, finding all VMAs which contain a shared
> + * mapping of the single @page in @mapping at offset @pgoff and write-protecting
> + * the mappings.
> + *
> + * The page does not have to be a folio, but rather can be a kernel allocation
> + * that is mapped into userland. We therefore do not require that the page maps
> + * to a folio with a valid mapping or index field, rather these are specified in
> + * @mapping and @pgoff.
> + *
> + * Return: the number of write-protected PTEs, or an error.
> + */
> +int mapping_wrprotect_page(struct address_space *mapping, pgoff_t pgoff,
> +		unsigned long nr_pages, struct page *page)
> +{
> +	struct wrprotect_file_state state = {
> +		.cleaned = 0,
> +		.pgoff = pgoff,
> +		.pfn = page_to_pfn(page),

Could we go one step further and entirely drop the struct page? Similar to
unmap_mapping_range for VM_SPECIAL mappings, except it only updates the
write protection. The reason is that ideally we'd like fbdev defio to
entirely get rid of any struct page usage, because with some dma_alloc()
memory regions there's simply no struct page for them (it's a carveout).
See e.g.  Sa498d4d06d6 ("drm/fbdev-dma: Only install deferred I/O if
necessary") for some of the pain this has caused.

So entirely struct page less way to write protect a pfn would be best. And
it doesn't look like you need the page here at all?

Cheers, Sima


> +		.nr_pages = nr_pages,
> +	};
> +	struct rmap_walk_control rwc = {
> +		.arg = (void *)&state,
> +		.rmap_one = mapping_wrprotect_page_one,
> +		.invalid_vma = invalid_mkclean_vma,
> +	};
> +
> +	if (!mapping)
> +		return 0;
> +
> +	__rmap_walk_file(/* folio = */NULL, mapping, pgoff, nr_pages, &rwc,
> +			 /* locked = */false);
> +
> +	return state.cleaned;
> +}
> +EXPORT_SYMBOL_GPL(mapping_wrprotect_page);
> +
>  /**
>   * pfn_mkclean_range - Cleans the PTEs (including PMDs) mapped with range of
>   *                     [@pfn, @pfn + @nr_pages) at the specific offset (@pgoff)
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
