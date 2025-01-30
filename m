Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B08A22E11
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E33510E975;
	Thu, 30 Jan 2025 13:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Wfj7wTQF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A425F10E975
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 13:46:47 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-38632b8ae71so805224f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 05:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738244806; x=1738849606; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mJasIAc+/5zQ/00OMGOHTFdf8ftgo8VLUZwOmGiXO6w=;
 b=Wfj7wTQF2notMTe3AXfulPZ/6Ruwn+pDfItaszgsjHdiYqgpvOSVoHBfaqKuuPlo9u
 jziiMGqYs5tZ8Nm+/1vWcy4CB/NDCfA5FatFgJZ4OJcviWl1lzi7vRcI0Ej1fNdQyezc
 VmlCGfMimKXFysrmPhJ73LzU2/jzBOiQkTF/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738244806; x=1738849606;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mJasIAc+/5zQ/00OMGOHTFdf8ftgo8VLUZwOmGiXO6w=;
 b=iiLiFKJ9KDUrbC0YOmvG595OYo4k5rfB+nAKNNTYKKJqER3fCzy5zq/epr8IN4yNsH
 biNUAVjR9ZuVaM0In5NqVbEcDFG5jz9h69Q9O+IdDOLtJDz4U9Frifqlr3ICXqZ9rV4i
 rvZTp4igLhXfnr7+nkapZe7UYHw3xtwVPZ+GX4iKnYOHlHM4wJUa1myovOhRCamYaXfW
 S3MMfUkqYYvuoki4SAylSkPe8FRJYeMNMOobe7szeZOS0ohvYV2n66ybPMuLUvWN5zEh
 oiTueJExDQNKZf0ngcweFBV5wNlIDLdV4Mvn6IiffB94aMZjwSVkQDN2USgiRX0CFf87
 Knlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2LqxUMPjsrMYeqtWXiYeZ6/U+G/ggV1oUSvxa6aQxaEsRmyCZZAF+FdjEcecOUxxozeDl7BTfeUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZHmCqAgWzGfVGpja2spK6zmZ+h4EPtz0CMm3vIc1SAQrk0aHf
 VMvemx9bytI3s9QPaAycdd8hRHQ7+CKmWhXaKG92Oy+/kNVMmBDAIaX4VYyrQ+0=
X-Gm-Gg: ASbGncuHLVDRnImIcODLr1uHF3JEwRk4qabmQQm5JF01Y5XoFT94y3OorZ5hGXCpDbz
 hBOwp/mVHGogmsSNr2Ilr2x1NZH7+e3O6RkvhC68t2h1fkYu92qcDRMNvNW5a2Q5KrjChjK6V0m
 zISvjMNMRF3vbB5TC03P62ExT5xZQPTZXdhMjYQcMze9v/G5GYz98Ync9B9XmrJ/NTA9bk5Fxup
 Pe7ULtiviVRM6aYH1xvRAtS0VLnMktLOtpNY05prdPHdJ//NyOVGCYxNXOZPvQQBVrPEO3+TgUa
 2mtCaTs+30hJmLaxnJSDwgx0OQE=
X-Google-Smtp-Source: AGHT+IGdSZfZLQOHVK1r21iqNOl4e23FuuYaVf3iprdHv7WZNXjSKvTKz/U04S+uJRtaOX2SQzHhsw==
X-Received: by 2002:a5d:5988:0:b0:385:fd07:8616 with SMTP id
 ffacd0b85a97d-38c5167d80bmr6660415f8f.0.1738244806033; 
 Thu, 30 Jan 2025 05:46:46 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c0ec7e6sm2072886f8f.19.2025.01.30.05.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 05:46:45 -0800 (PST)
Date: Thu, 30 Jan 2025 14:46:43 +0100
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
Subject: Re: [PATCH v1 03/12] mm/rmap: convert make_device_exclusive_range()
 to make_device_exclusive()
Message-ID: <Z5uCw9nzN81B4N8Z@phenom.ffwll.local>
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
 <20250129115411.2077152-4-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129115411.2077152-4-david@redhat.com>
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

On Wed, Jan 29, 2025 at 12:54:01PM +0100, David Hildenbrand wrote:
> The single "real" user in the tree of make_device_exclusive_range() always
> requests making only a single address exclusive. The current implementation
> is hard to fix for properly supporting anonymous THP / large folios and
> for avoiding messing with rmap walks in weird ways.
> 
> So let's always process a single address/page and return folio + page to
> minimize page -> folio lookups. This is a preparation for further
> changes.
> 
> Reject any non-anonymous or hugetlb folios early, directly after GUP.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Yeah this makes sense. Even for pmd entries I think we want to make this
very explicit with an explicit hugetlb opt-in I think.

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>


> ---
>  Documentation/mm/hmm.rst                    |  2 +-
>  Documentation/translations/zh_CN/mm/hmm.rst |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_svm.c       |  5 +-
>  include/linux/mmu_notifier.h                |  2 +-
>  include/linux/rmap.h                        |  5 +-
>  lib/test_hmm.c                              | 45 +++++------
>  mm/rmap.c                                   | 90 +++++++++++----------
>  7 files changed, 75 insertions(+), 76 deletions(-)
> 
> diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
> index f6d53c37a2ca..7d61b7a8b65b 100644
> --- a/Documentation/mm/hmm.rst
> +++ b/Documentation/mm/hmm.rst
> @@ -400,7 +400,7 @@ Exclusive access memory
>  Some devices have features such as atomic PTE bits that can be used to implement
>  atomic access to system memory. To support atomic operations to a shared virtual
>  memory page such a device needs access to that page which is exclusive of any
> -userspace access from the CPU. The ``make_device_exclusive_range()`` function
> +userspace access from the CPU. The ``make_device_exclusive()`` function
>  can be used to make a memory range inaccessible from userspace.
>  
>  This replaces all mappings for pages in the given range with special swap
> diff --git a/Documentation/translations/zh_CN/mm/hmm.rst b/Documentation/translations/zh_CN/mm/hmm.rst
> index 0669f947d0bc..22c210f4e94f 100644
> --- a/Documentation/translations/zh_CN/mm/hmm.rst
> +++ b/Documentation/translations/zh_CN/mm/hmm.rst
> @@ -326,7 +326,7 @@ devm_memunmap_pages() 和 devm_release_mem_region() 当资源可以绑定到 ``s
>  
>  一些设备具有诸如原子PTE位的功能，可以用来实现对系统内存的原子访问。为了支持对一
>  个共享的虚拟内存页的原子操作，这样的设备需要对该页的访问是排他的，而不是来自CPU
> -的任何用户空间访问。  ``make_device_exclusive_range()`` 函数可以用来使一
> +的任何用户空间访问。  ``make_device_exclusive()`` 函数可以用来使一
>  个内存范围不能从用户空间访问。
>  
>  这将用特殊的交换条目替换给定范围内的所有页的映射。任何试图访问交换条目的行为都会
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index b4da82ddbb6b..39e3740980bb 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -609,10 +609,9 @@ static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
>  
>  		notifier_seq = mmu_interval_read_begin(&notifier->notifier);
>  		mmap_read_lock(mm);
> -		ret = make_device_exclusive_range(mm, start, start + PAGE_SIZE,
> -					    &page, drm->dev);
> +		page = make_device_exclusive(mm, start, drm->dev, &folio);
>  		mmap_read_unlock(mm);
> -		if (ret <= 0 || !page) {
> +		if (IS_ERR(page)) {
>  			ret = -EINVAL;
>  			goto out;
>  		}
> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
> index e2dd57ca368b..d4e714661826 100644
> --- a/include/linux/mmu_notifier.h
> +++ b/include/linux/mmu_notifier.h
> @@ -46,7 +46,7 @@ struct mmu_interval_notifier;
>   * @MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will no
>   * longer have exclusive access to the page. When sent during creation of an
>   * exclusive range the owner will be initialised to the value provided by the
> - * caller of make_device_exclusive_range(), otherwise the owner will be NULL.
> + * caller of make_device_exclusive(), otherwise the owner will be NULL.
>   */
>  enum mmu_notifier_event {
>  	MMU_NOTIFY_UNMAP = 0,
> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> index 683a04088f3f..86425d42c1a9 100644
> --- a/include/linux/rmap.h
> +++ b/include/linux/rmap.h
> @@ -663,9 +663,8 @@ int folio_referenced(struct folio *, int is_locked,
>  void try_to_migrate(struct folio *folio, enum ttu_flags flags);
>  void try_to_unmap(struct folio *, enum ttu_flags flags);
>  
> -int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
> -				unsigned long end, struct page **pages,
> -				void *arg);
> +struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
> +		void *owner, struct folio **foliop);
>  
>  /* Avoid racy checks */
>  #define PVMW_SYNC		(1 << 0)
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 056f2e411d7b..9e1b07a227a3 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -780,10 +780,8 @@ static int dmirror_exclusive(struct dmirror *dmirror,
>  	unsigned long start, end, addr;
>  	unsigned long size = cmd->npages << PAGE_SHIFT;
>  	struct mm_struct *mm = dmirror->notifier.mm;
> -	struct page *pages[64];
>  	struct dmirror_bounce bounce;
> -	unsigned long next;
> -	int ret;
> +	int ret = 0;
>  
>  	start = cmd->addr;
>  	end = start + size;
> @@ -795,36 +793,31 @@ static int dmirror_exclusive(struct dmirror *dmirror,
>  		return -EINVAL;
>  
>  	mmap_read_lock(mm);
> -	for (addr = start; addr < end; addr = next) {
> -		unsigned long mapped = 0;
> -		int i;
> -
> -		next = min(end, addr + (ARRAY_SIZE(pages) << PAGE_SHIFT));
> +	for (addr = start; addr < end; addr += PAGE_SIZE) {
> +		struct folio *folio;
> +		struct page *page;
>  
> -		ret = make_device_exclusive_range(mm, addr, next, pages, NULL);
> -		/*
> -		 * Do dmirror_atomic_map() iff all pages are marked for
> -		 * exclusive access to avoid accessing uninitialized
> -		 * fields of pages.
> -		 */
> -		if (ret == (next - addr) >> PAGE_SHIFT)
> -			mapped = dmirror_atomic_map(addr, next, pages, dmirror);
> -		for (i = 0; i < ret; i++) {
> -			if (pages[i]) {
> -				unlock_page(pages[i]);
> -				put_page(pages[i]);
> -			}
> +		page = make_device_exclusive(mm, addr, &folio, NULL);
> +		if (IS_ERR(page)) {
> +			ret = PTR_ERR(page);
> +			break;
>  		}
>  
> -		if (addr + (mapped << PAGE_SHIFT) < next) {
> -			mmap_read_unlock(mm);
> -			mmput(mm);
> -			return -EBUSY;
> -		}
> +		ret = dmirror_atomic_map(addr, addr + PAGE_SIZE, &page, dmirror);
> +		if (!ret)
> +			ret = -EBUSY;
> +		folio_unlock(folio);
> +		folio_put(folio);
> +
> +		if (ret)
> +			break;
>  	}
>  	mmap_read_unlock(mm);
>  	mmput(mm);
>  
> +	if (ret)
> +		return -EBUSY;
> +
>  	/* Return the migrated data for verification. */
>  	ret = dmirror_bounce_init(&bounce, start, size);
>  	if (ret)
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 17fbfa61f7ef..676df4fba5b0 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2495,70 +2495,78 @@ static bool folio_make_device_exclusive(struct folio *folio,
>  		.arg = &args,
>  	};
>  
> -	/*
> -	 * Restrict to anonymous folios for now to avoid potential writeback
> -	 * issues.
> -	 */
> -	if (!folio_test_anon(folio) || folio_test_hugetlb(folio))
> -		return false;
> -
>  	rmap_walk(folio, &rwc);
>  
>  	return args.valid && !folio_mapcount(folio);
>  }
>  
>  /**
> - * make_device_exclusive_range() - Mark a range for exclusive use by a device
> + * make_device_exclusive() - Mark an address for exclusive use by a device
>   * @mm: mm_struct of associated target process
> - * @start: start of the region to mark for exclusive device access
> - * @end: end address of region
> - * @pages: returns the pages which were successfully marked for exclusive access
> + * @addr: the virtual address to mark for exclusive device access
>   * @owner: passed to MMU_NOTIFY_EXCLUSIVE range notifier to allow filtering
> + * @foliop: folio pointer will be stored here on success.
> + *
> + * This function looks up the page mapped at the given address, grabs a
> + * folio reference, locks the folio and replaces the PTE with special
> + * device-exclusive non-swap entry, preventing userspace CPU access. The
> + * function will return with the folio locked and referenced.
>   *
> - * Returns: number of pages found in the range by GUP. A page is marked for
> - * exclusive access only if the page pointer is non-NULL.
> + * On fault these special device-exclusive entries are replaced with the
> + * original PTE under folio lock, after calling MMU notifiers.
>   *
> - * This function finds ptes mapping page(s) to the given address range, locks
> - * them and replaces mappings with special swap entries preventing userspace CPU
> - * access. On fault these entries are replaced with the original mapping after
> - * calling MMU notifiers.
> + * Only anonymous non-hugetlb folios are supported and the VMA must have
> + * write permissions such that we can fault in the anonymous page writable
> + * in order to mark it exclusive. The caller must hold the mmap_lock in read
> + * mode.
>   *
>   * A driver using this to program access from a device must use a mmu notifier
>   * critical section to hold a device specific lock during programming. Once
>   * programming is complete it should drop the page lock and reference after
>   * which point CPU access to the page will revoke the exclusive access.
> + *
> + * Returns: pointer to mapped page on success, otherwise a negative error.
>   */
> -int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
> -				unsigned long end, struct page **pages,
> -				void *owner)
> +struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
> +		void *owner, struct folio **foliop)
>  {
> -	long npages = (end - start) >> PAGE_SHIFT;
> -	long i;
> +	struct folio *folio;
> +	struct page *page;
> +	long npages;
> +
> +	mmap_assert_locked(mm);
>  
> -	npages = get_user_pages_remote(mm, start, npages,
> +	/*
> +	 * Fault in the page writable and try to lock it; note that if the
> +	 * address would already be marked for exclusive use by the device,
> +	 * the GUP call would undo that first by triggering a fault.
> +	 */
> +	npages = get_user_pages_remote(mm, addr, 1,
>  				       FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
> -				       pages, NULL);
> -	if (npages < 0)
> -		return npages;
> -
> -	for (i = 0; i < npages; i++, start += PAGE_SIZE) {
> -		struct folio *folio = page_folio(pages[i]);
> -		if (PageTail(pages[i]) || !folio_trylock(folio)) {
> -			folio_put(folio);
> -			pages[i] = NULL;
> -			continue;
> -		}
> +				       &page, NULL);
> +	if (npages != 1)
> +		return ERR_PTR(npages);
> +	folio = page_folio(page);
>  
> -		if (!folio_make_device_exclusive(folio, mm, start, owner)) {
> -			folio_unlock(folio);
> -			folio_put(folio);
> -			pages[i] = NULL;
> -		}
> +	if (!folio_test_anon(folio) || folio_test_hugetlb(folio)) {
> +		folio_put(folio);
> +		return ERR_PTR(-EOPNOTSUPP);
> +	}
> +
> +	if (!folio_trylock(folio)) {
> +		folio_put(folio);
> +		return ERR_PTR(-EBUSY);
>  	}
>  
> -	return npages;
> +	if (!folio_make_device_exclusive(folio, mm, addr, owner)) {
> +		folio_unlock(folio);
> +		folio_put(folio);
> +		return ERR_PTR(-EBUSY);
> +	}
> +	*foliop = folio;
> +	return page;
>  }
> -EXPORT_SYMBOL_GPL(make_device_exclusive_range);
> +EXPORT_SYMBOL_GPL(make_device_exclusive);
>  #endif
>  
>  void __put_anon_vma(struct anon_vma *anon_vma)
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
