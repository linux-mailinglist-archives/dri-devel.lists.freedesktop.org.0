Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC891B39751
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 10:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7140810E88C;
	Thu, 28 Aug 2025 08:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Ji8h1Cae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D4910E88C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 08:43:53 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-24456ce0b96so8419585ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 01:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756370633; x=1756975433;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jLT2osl3N94HJBBJWKPAk2avCo16Lo88yw1WJjz/wsM=;
 b=Ji8h1CaeHE+GbhOjp2OORH2Q/7usRsG45Z+YUXeptmguTr8gGwdhFhi08tw924Otpm
 l9hv2mf53X6bxk0ySDLRF9PjaExqr9HNItnJYcDc8JYF1wlnH6NPcnf9JS75sxXB3vti
 edijMj/rEeGEUVaKQ4U/u/4mFBMinKPjTU9abH7gKGJoe3chg4Sqkhl2Tvj0jCyLLUO9
 wthfOS0nePSK9c7cOVNNTAEHiDZq+KHQeZICtN9ZtbKBJuA5/v9YTlWroukwULAdwdsw
 cgx9NTUAXw4BDxesud8+Y8+4p3dXW6qEB379DVnol2m29aZWKmpvpc09WCf/RN2aIkch
 K2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756370633; x=1756975433;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jLT2osl3N94HJBBJWKPAk2avCo16Lo88yw1WJjz/wsM=;
 b=pBOP95+TxnkdKEoB4eUlHawWE1dA0WK/8Pc0qV3wAGu8XeQTW/0Hzl5s1H0fcevX6E
 hS6xV3bJoBVq25LIQcX5gkgxiiYasNmoWFbow2TYhJpB7rQ06aKoe8fPq8nbij2ZJEiZ
 hvxDm9bpG7DidDlsh7+unmQP5S5tLFQAXjLs+CSDb7xwUaMsWVf3C4NjNTOqjhubeoPJ
 bbm1lyTL1R4pXAegyz6LT7SOFm0svRjKuZSM0HJGbAigXe2edelYX8dzgW1VavnYN+AV
 vX9CJNGpIU4X5vl98oOwBkuLHzATEHTmxXO0bjKvhdRvQZYxaSI7qZ6Pe60rYWPazNif
 txfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqo5L7tFRFtm6ZY+OFtcBRVHjC+pi8iJrOi+xBIywKosP7ZqCcpy4Bmlvi85EqWvUuvAnir7VkNGw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVknBjOKpB1QkcpJq0jwMbXMp4BtPtwl+2z9WGbZHpSvs/5hXj
 VoccsJHF2bUUOWgMlFseYj+kSStolGo1+NGr+ACQZ/4fAue1d5PNyl3H1u0+9a2yWYIK24QEnt+
 DodaNInTuHfMInfQdY/8981F7HdVyQr8KOGMzLjVl
X-Gm-Gg: ASbGnctNvr33UWs9s55pc3+NH+uqyS6Vc9+19AtdfZk+KCwP/Fx3LfjqDEJij78qoPj
 IU4mckPp2q4C+hVQWEKj5ZCXm/2x+cUmSHjXj96xf14nWQtA9dV9mg/Yyp1h4ycQm3dZ2NmvIag
 KxfWejJiA7pTe+uTTDsoRLYb5tznnLi3ZMEF8u92O9gREUtZbP5FLTKr22HYwuhecZcpOfsFwea
 QJznpdW5lxOBaMaISvZ/jq6cDU=
X-Google-Smtp-Source: AGHT+IGJmjz+YHPyNxr90AMhiQNNDQu9deq8PWwNfyq+zFWi/YcgUyPYkmS3VX3aACMgtkUmoKeOvBcyBRDmMb3NDeE=
X-Received: by 2002:a17:903:3d06:b0:248:8063:a8b4 with SMTP id
 d9443c01a7336-2488063abcbmr89508125ad.22.1756370632768; Thu, 28 Aug 2025
 01:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-35-david@redhat.com>
In-Reply-To: <20250827220141.262669-35-david@redhat.com>
From: Marco Elver <elver@google.com>
Date: Thu, 28 Aug 2025 10:43:16 +0200
X-Gm-Features: Ac12FXwMzUnIHp_v7uH0kV3Hu6ram9vqgPmCMZ3TyuNNAlhDfe6K8rTgx1FpO8k
Message-ID: <CANpmjNP8-dM-cizCfsVOUNDS2jBaY6d=0Wx8OGen5RbXgaqcfQ@mail.gmail.com>
Subject: Re: [PATCH v1 34/36] kfence: drop nth_page() usage
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 iommu@lists.linux.dev, io-uring@vger.kernel.org, 
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, 
 John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org, 
 linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-mm@kvack.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, 
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, 
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 28 Aug 2025 at 00:11, 'David Hildenbrand' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> We want to get rid of nth_page(), and kfence init code is the last user.
>
> Unfortunately, we might actually walk a PFN range where the pages are
> not contiguous, because we might be allocating an area from memblock
> that could span memory sections in problematic kernel configs (SPARSEMEM
> without SPARSEMEM_VMEMMAP).
>
> We could check whether the page range is contiguous
> using page_range_contiguous() and failing kfence init, or making kfence
> incompatible these problemtic kernel configs.
>
> Let's keep it simple and simply use pfn_to_page() by iterating PFNs.
>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Marco Elver <elver@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Marco Elver <elver@google.com>

Thanks.

> ---
>  mm/kfence/core.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/mm/kfence/core.c b/mm/kfence/core.c
> index 0ed3be100963a..727c20c94ac59 100644
> --- a/mm/kfence/core.c
> +++ b/mm/kfence/core.c
> @@ -594,15 +594,14 @@ static void rcu_guarded_free(struct rcu_head *h)
>   */
>  static unsigned long kfence_init_pool(void)
>  {
> -       unsigned long addr;
> -       struct page *pages;
> +       unsigned long addr, start_pfn;
>         int i;
>
>         if (!arch_kfence_init_pool())
>                 return (unsigned long)__kfence_pool;
>
>         addr = (unsigned long)__kfence_pool;
> -       pages = virt_to_page(__kfence_pool);
> +       start_pfn = PHYS_PFN(virt_to_phys(__kfence_pool));
>
>         /*
>          * Set up object pages: they must have PGTY_slab set to avoid freeing
> @@ -613,11 +612,12 @@ static unsigned long kfence_init_pool(void)
>          * enters __slab_free() slow-path.
>          */
>         for (i = 0; i < KFENCE_POOL_SIZE / PAGE_SIZE; i++) {
> -               struct slab *slab = page_slab(nth_page(pages, i));
> +               struct slab *slab;
>
>                 if (!i || (i % 2))
>                         continue;
>
> +               slab = page_slab(pfn_to_page(start_pfn + i));
>                 __folio_set_slab(slab_folio(slab));
>  #ifdef CONFIG_MEMCG
>                 slab->obj_exts = (unsigned long)&kfence_metadata_init[i / 2 - 1].obj_exts |
> @@ -665,10 +665,12 @@ static unsigned long kfence_init_pool(void)
>
>  reset_slab:
>         for (i = 0; i < KFENCE_POOL_SIZE / PAGE_SIZE; i++) {
> -               struct slab *slab = page_slab(nth_page(pages, i));
> +               struct slab *slab;
>
>                 if (!i || (i % 2))
>                         continue;
> +
> +               slab = page_slab(pfn_to_page(start_pfn + i));
>  #ifdef CONFIG_MEMCG
>                 slab->obj_exts = 0;
>  #endif
> --
> 2.50.1
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/kasan-dev/20250827220141.262669-35-david%40redhat.com.
