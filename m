Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB73A22BBB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 11:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D6310E17A;
	Thu, 30 Jan 2025 10:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="WCSXH+IM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA13610E17A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 10:37:28 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-436202dd730so4081285e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 02:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738233447; x=1738838247; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tyqvf2GtMB8eYUA6roFvIAKJ3MrPvA1f4ISzNSrvZw0=;
 b=WCSXH+IMYMUnJPXpUWNS98v1mV3aMpS+puZV1K+cF44QHroIlzt8KJ32forkpk6Iwx
 fs9oi4iANZ+R/sJkN08HwM7maI0Mf88LdgcASd3c+tVKsdwRmO8f376s3Gj3H3NXV0Er
 eHLrYSAYppfUEAb3OLMIpMDXX75mBZAW+/RDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738233447; x=1738838247;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tyqvf2GtMB8eYUA6roFvIAKJ3MrPvA1f4ISzNSrvZw0=;
 b=j3r4v+e1lT5HkEwm3m3vXNhKAeOECZ4PxedfJjl0AxauuGwLmHngvT0c/1HTZ2q+kM
 Kq/Zid/7yImgSJvSwGg1XJ5QZgsgzvKhLXRWpqYyf02/LDrer+ze52XzdWAjwrm2Bphe
 E7DPu9WKoC3+CEBQena9sCcnOVyxnUuwUV7caCXkdHCRBxpG3DGmlKIly9w+LUS6KyCS
 qnRQDjPtDRYcPYethKBj1pv6VrslM7PgTzWeRQPkwxzbLYEGwn66b5Xp5GloKEhKtrzI
 E6EVt94D0UbHy6X+pFXWh5Mpwy4YWgBHV7hXfe3IT+bd3ssnCb9wFz3jjndKRWmBcSrD
 /GpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4rLJliF5VRcMNqWYurfAN7ZIWXOa77ovDyWEyieQ7G48dBRxqAm8C7Nbc5afeK7YcKi4vNVHNnrk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhpQI/Bx7GY6AjjEELmCtNCqHJd2WUK44CZQqNadgGg+OyqxD4
 QKBE/a8dET2XCpAsaDbOpSjucSXXN+6tXPHt6I5i1CUB9WRIPyAUXHs7oA+oH+M=
X-Gm-Gg: ASbGncsa+c/rcNxQYjwCAk3uxYNVWOJtBbDSCCmjM1K2Dxwe5QkyXSMNHh+Yh8+EHMi
 LuqpW2++G6JfAUVd9vz8/1n9A35FXBaZmdK8Ef/av6BVyWghPH/Gtpio6Spl4OmOWXs9ZhNIs/n
 ctuVx3jE33q2Mf9ZjDhCsxGVmNw16osCyWzsQYQr1Lw1wEzXqoUIdW1E0bUHfE7HJbqINjMwA9S
 kWszQWNJt4Z1TV9oMpgqfXBsF0hAPyfnSO14yfva/Y6EfeAGjv+inU7AMEu22w/UG4tx+81kCl9
 Hlerb6byzlmNh8fx8E+bLK5bOGo=
X-Google-Smtp-Source: AGHT+IFg7SYWGB7s8CQ+QgL5BM/h37wU8TOAK/f2xIHq4oWzFN+REfQ6LxpHzU72JzdfiBY831Ddbw==
X-Received: by 2002:a05:600c:3ba7:b0:435:306:e5dd with SMTP id
 5b1f17b1804b1-438dc3fc40bmr54907245e9.22.1738233446986; 
 Thu, 30 Jan 2025 02:37:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438d7aac93asm64284585e9.1.2025.01.30.02.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 02:37:24 -0800 (PST)
Date: Thu, 30 Jan 2025 11:37:22 +0100
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
Subject: Re: [PATCH v1 12/12] mm/rmap: keep mapcount untouched for
 device-exclusive entries
Message-ID: <Z5tWYpwpUfgEmeKj@phenom.ffwll.local>
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
 <20250129115411.2077152-13-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115411.2077152-13-david@redhat.com>
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

On Wed, Jan 29, 2025 at 12:54:10PM +0100, David Hildenbrand wrote:
> Now that conversion to device-exclusive does no longer perform an
> rmap walk and the main page_vma_mapped_walk() users were taught to
> properly handle nonswap entries, let's treat device-exclusive entries just
> as if they would be present, similar to how we handle device-private
> entries already.

So the reason for handling device-private entries in rmap is so that
drivers can rely on try_to_migrate and related code to invalidate all the
various ptes even for device private memory. Otherwise no one should hit
this path, at least if my understanding is correct.

So I'm very much worried about opening a can of worms here because I think
this adds a genuine new case to all the various callers.

> This fixes swapout/migration of folios with device-exclusive entries.
> 
> Likely there are still some page_vma_mapped_walk() callers that are not
> fully prepared for these entries, and where we simply want to refuse
> !pte_present() entries. They have to be fixed independently; the ones in
> mm/rmap.c are prepared.

The other worry is that maybe breaking migration is a feature, at least in
parts. If thp constantly reassembles a pmd entry because hey all the
memory is contig and userspace allocated a chunk of memory to place
atomics that alternate between cpu and gpu nicely separated by 4k pages,
then we'll thrash around invalidating ptes to no end. So might be more
fallout here.
-Sima

> 
> Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/memory.c | 17 +----------------
>  mm/rmap.c   |  7 -------
>  2 files changed, 1 insertion(+), 23 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index db38d6ae4e74..cd689cd8a7c8 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -743,20 +743,6 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
>  
>  	VM_BUG_ON_FOLIO(pte_write(pte) && (!folio_test_anon(folio) &&
>  					   PageAnonExclusive(page)), folio);
> -
> -	/*
> -	 * No need to take a page reference as one was already
> -	 * created when the swap entry was made.
> -	 */
> -	if (folio_test_anon(folio))
> -		folio_add_anon_rmap_pte(folio, page, vma, address, RMAP_NONE);
> -	else
> -		/*
> -		 * Currently device exclusive access only supports anonymous
> -		 * memory so the entry shouldn't point to a filebacked page.
> -		 */
> -		WARN_ON_ONCE(1);
> -
>  	set_pte_at(vma->vm_mm, address, ptep, pte);
>  
>  	/*
> @@ -1628,8 +1614,7 @@ static inline int zap_nonpresent_ptes(struct mmu_gather *tlb,
>  		 */
>  		WARN_ON_ONCE(!vma_is_anonymous(vma));
>  		rss[mm_counter(folio)]--;
> -		if (is_device_private_entry(entry))
> -			folio_remove_rmap_pte(folio, page, vma);
> +		folio_remove_rmap_pte(folio, page, vma);
>  		folio_put(folio);
>  	} else if (!non_swap_entry(entry)) {
>  		/* Genuine swap entries, hence a private anon pages */
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 9e2002d97d6f..4acc9f6d743a 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2495,13 +2495,6 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
>  	/* The pte is writable, uffd-wp does not apply. */
>  	set_pte_at(mm, addr, fw.ptep, swp_pte);
>  
> -	/*
> -	 * TODO: The device-exclusive non-swap PTE holds a folio reference but
> -	 * does not count as a mapping (mapcount), which is wrong and must be
> -	 * fixed, otherwise RMAP walks don't behave as expected.
> -	 */
> -	folio_remove_rmap_pte(folio, page, vma);
> -
>  	folio_walk_end(&fw, vma);
>  	*foliop = folio;
>  	return page;
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
