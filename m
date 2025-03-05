Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7323CA5443C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 09:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C528610E914;
	Thu,  6 Mar 2025 08:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mWK7ZLa7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B52510E81C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 17:27:54 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-54964606482so3728976e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 09:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741195672; x=1741800472; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mQfPowMtzeZLUBwXZYQU5v1yt0PyPUIi7t8i3xRpFoI=;
 b=mWK7ZLa7xEyVWRYzokT7HaIncVDHbzMV2lBGK3+SBsrxvmqtJOHdZx8ZJxJndML76j
 setrpst/N4BB+0PWoqLrQ8vQI6J6a/ReJAeeKaptpdjOkigPImlMbFg+AwS53+kZlMsb
 +ADyeoZvtSflsDsE1NFiRB1LrAQkgM7ptxnkMgkaTOfpEPuobNrGlKFOrNJk6S+wdkU8
 bg6YRY5aUNv1BMc0/RfdjOPhnC+V6/MwAFaDN9g4PldJTWjVsY4NMbYpeRuYYtnvkagS
 9I2F5cKk/Vok9bp2HPdsUDfrvsJctpFOwlrKQsXZnxlFQsFdyyIVeH/TNOesZigS7GIQ
 BPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741195672; x=1741800472;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQfPowMtzeZLUBwXZYQU5v1yt0PyPUIi7t8i3xRpFoI=;
 b=mlJcPbwZEYV1kKQhvu894FbhDRXAdpyFzLlVS8+8SLNhqDxK3Wp83cUOSz1EAMc+BG
 /3HUJxXoOpfImisxwmSFNRMlIs1NoorTWtJgvIWv/gR14/8n6TyJGRrN8fjUgzfJ0wDi
 rqamQ09uFr+fQCTXuQjSyHu6+ZnYv9VwhGjOIM+WAzLTPIeTN9qcFhQ+s+hHXYxjiQja
 PTaoCwZWZst522xBLUqKvpG0JjtBbQYIXhj7RhnHtn5A4SatlNDn4vPcizF3S/bK7FCk
 sQu5RoS8MUNq8TtXGKKjGh9O+EhfPpq4FoxK5FKtNlpIkeaZQRslemQjLrK0B3oJ/v69
 HyxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXA2LUnAKeKW3OcjDDYMY+gb5kUVBJcybs7qYFErkjhqggqyB5SH7WCJuLRXerWNWyxNAV7N5UaRI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmsEPZwzR5+MvOm/4aqFPEiWD6Lk2J5Flo5d8K1olKK/xU1URR
 RscDC8qBMsfe/VqXvI4Mie4h9AqF3xBWs062ipBRxVPYbH2pZZLo
X-Gm-Gg: ASbGncvzjL/OsvuaGB0WnyG1bITa38PJcSIYKTkaFyn9lq/BhRYq9kyqm30NfO1A4ff
 vTR9VDbgSV9jYbqMOuMeG6bvAlDD8uq9A3ZzLueVpW+ZXE2o7YwGAdGrsjfaEh2G6+YJ0D5Ah/H
 j7VGcRvO8T+qeibB5bjrFHviMnCcbU51OKCr31P1F6+LQkoGDcly3N3MsRepxMGK/+jk3V/tTQJ
 q/z337ndZ/k/2Skp7WB9TVicIEE76U5CiekQtAViegFp0b2F74zUzmRq1IfmEGnooK4rljAEz4c
 WyANjJDC3rMqEeU8xFDNG0Uq/6u8EfxrjbCUnf1fs68r06iDKtBlokFSO95RFjdInjI=
X-Google-Smtp-Source: AGHT+IHyD6K0X+cwMdho8elbWUJdV3bSzGzUYT8hcFGebMzXlBqxa8XmfvT3QC4L7DaVDpeBC8TCQg==
X-Received: by 2002:a05:6512:39c5:b0:549:58d5:f899 with SMTP id
 2adb3069b0e04-5497d37a98cmr1313981e87.37.1741195671718; 
 Wed, 05 Mar 2025 09:27:51 -0800 (PST)
Received: from pc636 (host-95-203-6-24.mobileonline.telia.com. [95.203.6.24])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54963962fe4sm1070504e87.240.2025.03.05.09.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 09:27:51 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 5 Mar 2025 18:27:48 +0100
To: Ryosuke Yasuoka <ryasuoka@redhat.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 akpm@linux-foundation.org, urezki@gmail.com, hch@infradead.org,
 dmitry.osipenko@collabora.com, jfalempe@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-mm@kvack.org
Subject: Re: [PATCH drm-next 1/2] vmalloc: Add atomic_vmap
Message-ID: <Z8iJlOyBjsGfqvM_@pc636>
References: <20250305152555.318159-1-ryasuoka@redhat.com>
 <20250305152555.318159-2-ryasuoka@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305152555.318159-2-ryasuoka@redhat.com>
X-Mailman-Approved-At: Thu, 06 Mar 2025 08:07:52 +0000
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

On Thu, Mar 06, 2025 at 12:25:53AM +0900, Ryosuke Yasuoka wrote:
> Some drivers can use vmap in drm_panic, however, vmap is sleepable and
> takes locks. Since drm_panic will vmap in panic handler, atomic_vmap
> requests pages with GFP_ATOMIC and maps KVA without locks and sleep.
> 
> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> ---
>  include/linux/vmalloc.h |   2 +
>  mm/internal.h           |   5 ++
>  mm/vmalloc.c            | 105 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 112 insertions(+)
> 
> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
> index 31e9ffd936e3..c7a2a9a1976d 100644
> --- a/include/linux/vmalloc.h
> +++ b/include/linux/vmalloc.h
> @@ -190,6 +190,8 @@ void * __must_check vrealloc_noprof(const void *p, size_t size, gfp_t flags)
>  extern void vfree(const void *addr);
>  extern void vfree_atomic(const void *addr);
>  
> +extern void *atomic_vmap(struct page **pages, unsigned int count,
> +			 unsigned long flags, pgprot_t prot);
>  extern void *vmap(struct page **pages, unsigned int count,
>  			unsigned long flags, pgprot_t prot);
>  void *vmap_pfn(unsigned long *pfns, unsigned int count, pgprot_t prot);
> diff --git a/mm/internal.h b/mm/internal.h
> index 109ef30fee11..134b332bf5b9 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1278,6 +1278,11 @@ int numa_migrate_check(struct folio *folio, struct vm_fault *vmf,
>  void free_zone_device_folio(struct folio *folio);
>  int migrate_device_coherent_folio(struct folio *folio);
>  
> +struct vm_struct *atomic_get_vm_area_node(unsigned long size, unsigned long align,
> +					  unsigned long shift, unsigned long flags,
> +					  unsigned long start, unsigned long end, int node,
> +					  gfp_t gfp_mask, const void *caller);
> +
>  struct vm_struct *__get_vm_area_node(unsigned long size,
>  				     unsigned long align, unsigned long shift,
>  				     unsigned long flags, unsigned long start,
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index a6e7acebe9ad..f5c93779c60a 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -1945,6 +1945,57 @@ static inline void setup_vmalloc_vm(struct vm_struct *vm,
>  	va->vm = vm;
>  }
>  
> +static struct vmap_area *atomic_alloc_vmap_area(unsigned long size,
> +						unsigned long align,
> +						unsigned long vstart, unsigned long vend,
> +						int node, gfp_t gfp_mask,
> +						unsigned long va_flags, struct vm_struct *vm)
> +{
> +	struct vmap_node *vn;
> +	struct vmap_area *va;
> +	unsigned long addr;
> +
> +	if (unlikely(!size || offset_in_page(size) || !is_power_of_2(align)))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (unlikely(!vmap_initialized))
> +		return ERR_PTR(-EBUSY);
> +
> +	va = kmem_cache_alloc_node(vmap_area_cachep, gfp_mask, node);
> +	if (unlikely(!va))
> +		return ERR_PTR(-ENOMEM);
> +
> +	/*
> +	 * Only scan the relevant parts containing pointers to other objects
> +	 * to avoid false negatives.
> +	 */
> +	kmemleak_scan_area(&va->rb_node, SIZE_MAX, gfp_mask);
> +
> +	addr = __alloc_vmap_area(&free_vmap_area_root, &free_vmap_area_list,
> +				 size, align, vstart, vend);
> +
> +	trace_alloc_vmap_area(addr, size, align, vstart, vend, addr == vend);
> +
> +	va->va_start = addr;
> +	va->va_end = addr + size;
> +	va->vm = NULL;
> +	va->flags = va_flags;
> +
> +	vm->addr = (void *)va->va_start;
> +	vm->size = va_size(va);
> +	va->vm = vm;
> +
> +	vn = addr_to_node(va->va_start);
> +
> +	insert_vmap_area(va, &vn->busy.root, &vn->busy.head);
> +
> +	BUG_ON(!IS_ALIGNED(va->va_start, align));
> +	BUG_ON(va->va_start < vstart);
> +	BUG_ON(va->va_end > vend);
> +
> +	return va;
> +}
> +
>  /*
>   * Allocate a region of KVA of the specified size and alignment, within the
>   * vstart and vend. If vm is passed in, the two will also be bound.
> @@ -3106,6 +3157,33 @@ static void clear_vm_uninitialized_flag(struct vm_struct *vm)
>  	vm->flags &= ~VM_UNINITIALIZED;
>  }
>  
> +struct vm_struct *atomic_get_vm_area_node(unsigned long size, unsigned long align,
> +					  unsigned long shift, unsigned long flags,
> +					  unsigned long start, unsigned long end, int node,
> +					  gfp_t gfp_mask, const void *caller)
> +{
> +	struct vmap_area *va;
> +	struct vm_struct *area;
> +
> +	size = ALIGN(size, 1ul << shift);
> +	if (unlikely(!size))
> +		return NULL;
> +
> +	area = kzalloc_node(sizeof(*area), gfp_mask, node);
> +	if (unlikely(!area))
> +		return NULL;
> +
> +	size += PAGE_SIZE;
> +	area->flags = flags;
> +	area->caller = caller;
> +
> +	va = atomic_alloc_vmap_area(size, align, start, end, node, gfp_mask, 0, area);
> +	if (IS_ERR(va))
> +		return NULL;
> +
> +	return area;
> +}
> +
>  struct vm_struct *__get_vm_area_node(unsigned long size,
>  		unsigned long align, unsigned long shift, unsigned long flags,
>  		unsigned long start, unsigned long end, int node,
> @@ -3418,6 +3496,33 @@ void vunmap(const void *addr)
>  }
>  EXPORT_SYMBOL(vunmap);
>  
> +void *atomic_vmap(struct page **pages, unsigned int count,
> +		  unsigned long flags, pgprot_t prot)
> +{
> +	struct vm_struct *area;
> +	unsigned long addr;
> +	unsigned long size;		/* In bytes */
> +
> +	if (count > totalram_pages())
> +		return NULL;
> +
> +	size = (unsigned long)count << PAGE_SHIFT;
> +	area = atomic_get_vm_area_node(size, 1, PAGE_SHIFT, flags,
> +				       VMALLOC_START, VMALLOC_END,
> +				       NUMA_NO_NODE, GFP_ATOMIC,
> +				       __builtin_return_address(0));
> +	if (!area)
> +		return NULL;
> +
> +	addr = (unsigned long)area->addr;
> +	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
> +			     pages, PAGE_SHIFT) < 0) {
> +		return NULL;
> +	}
> +
> +	return area->addr;
> +}
> +
>  /**
>   * vmap - map an array of pages into virtually contiguous space
>   * @pages: array of page pointers
> -- 
> 2.48.1
> 
It is copy-paste code, so it is odd. The proposal is not a way forward
to me. Unfortunately vmalloc is not compatible with GFP_ATOMIC, there
is at least one place it is a page-table allocation entries where it is
hard-coded to the GFP_KERNEL.

Doing this without locks and synchronizations is not possible.

--
Uladzislau Rezki
