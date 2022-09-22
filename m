Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5215E60A0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 13:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B0110EAB9;
	Thu, 22 Sep 2022 11:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6516910EAB9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 11:12:33 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 p1-20020a17090a2d8100b0020040a3f75eso1759440pjd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 04:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=RZ+48UnAa8eecJxdZq6BiMyqwT/Ym9f2NYlp6Dy1smw=;
 b=G+jaEnK2EsNrSXni7xo2A5prc1siifdzoFue4z79INVmISHoJzmEC9GR9nYFQgsDIb
 I+dMTg2A+izoX3axTWSo/iYs6MjIzCmcdzB7dXax8chtAJiUZBX99VUNdhdppKGneXWq
 kYGXC1GYOzs1VjWq4+vqWobAy7LlMsBZFdMkrUYk942Mo7xIHHo97tyiWe9mlgU2Ni4u
 sX/UfkevtZ8mMh6n5HaMsQp+ivfAaex3bVTBLEN+6BskHMGics2YtdYw6Rq+h1kBbGkY
 geXieByTrSvc7tahia6awNomWGRXvkXfKN0rMilgYg11CJ2HrHEklB8Oi0KpiF2sgY/f
 QqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=RZ+48UnAa8eecJxdZq6BiMyqwT/Ym9f2NYlp6Dy1smw=;
 b=kF7RcWuz7bYb/oYlzF2vAyZLYlKe/hOmTsBSn6LmbZslPm5ed5UlTUrlz49IziYk1P
 bSKPUd316OhRh6l2zdNbb4QzTJ/0fDcWk5BWCqsXRXFUpe3eD19XevJsj1992876H19a
 Yu8OB/S8sWccCu4It2KuvOYZq6tHtUMJp20bL6Foa38VKQAYRatU2QKEPHTDBXE1XuEz
 uxYqtzar9FrPZ0f2QeYV++QBewaOwU5MiqeRATQtRpV9pYaY45EE8xSCnOiR1pWw5NQI
 wGgAYRobmt80zB3qABdxEIsGBcuRWfYeHvGL23tQ+2ZFvWYJFnvsESNATDTAU8ICf5qq
 hmJw==
X-Gm-Message-State: ACrzQf0hsMojGUIcXuHsGpnAcF9d8nwsE5h39XahL9MomL1+uJqTeLSS
 /Z7JzKcBIwFCW2boYXOpjPQ=
X-Google-Smtp-Source: AMsMyM71qTO+0u9YewSNaiOe7OR50cbfyQkUWC6xIKoR/xE2vrqrOeMi/1IfaO5sjL4VCWr3VgDTkw==
X-Received: by 2002:a17:90a:e513:b0:200:2275:2d27 with SMTP id
 t19-20020a17090ae51300b0020022752d27mr3211649pjy.162.1663845152925; 
 Thu, 22 Sep 2022 04:12:32 -0700 (PDT)
Received: from hyeyoo ([114.29.91.56]) by smtp.gmail.com with ESMTPSA id
 p189-20020a62d0c6000000b00541196bd2d9sm4098278pfg.68.2022.09.22.04.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 04:12:32 -0700 (PDT)
Date: Thu, 22 Sep 2022 20:12:21 +0900
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 01/12] slab: Introduce kmalloc_size_roundup()
Message-ID: <YyxDFfKmSNNkHBFi@hyeyoo>
References: <20220922031013.2150682-1-keescook@chromium.org>
 <20220922031013.2150682-2-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922031013.2150682-2-keescook@chromium.org>
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
Cc: linux-wireless@vger.kernel.org, Feng Tang <feng.tang@intel.com>,
 Jacob Shin <jacob.shin@amd.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 linaro-mm-sig@lists.linaro.org, Jakub Kicinski <kuba@kernel.org>,
 David Sterba <dsterba@suse.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Vlastimil Babka <vbabka@suse.cz>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 21, 2022 at 08:10:02PM -0700, Kees Cook wrote:
> In the effort to help the compiler reason about buffer sizes, the
> __alloc_size attribute was added to allocators. This improves the scope
> of the compiler's ability to apply CONFIG_UBSAN_BOUNDS and (in the near
> future) CONFIG_FORTIFY_SOURCE. For most allocations, this works well,
> as the vast majority of callers are not expecting to use more memory
> than what they asked for.
> 
> There is, however, one common exception to this: anticipatory resizing
> of kmalloc allocations. These cases all use ksize() to determine the
> actual bucket size of a given allocation (e.g. 128 when 126 was asked
> for). This comes in two styles in the kernel:
> 
> 1) An allocation has been determined to be too small, and needs to be
>    resized. Instead of the caller choosing its own next best size, it
>    wants to minimize the number of calls to krealloc(), so it just uses
>    ksize() plus some additional bytes, forcing the realloc into the next
>    bucket size, from which it can learn how large it is now. For example:
> 
> 	data = krealloc(data, ksize(data) + 1, gfp);
> 	data_len = ksize(data);
> 
> 2) The minimum size of an allocation is calculated, but since it may
>    grow in the future, just use all the space available in the chosen
>    bucket immediately, to avoid needing to reallocate later. A good
>    example of this is skbuff's allocators:
> 
> 	data = kmalloc_reserve(size, gfp_mask, node, &pfmemalloc);
> 	...
> 	/* kmalloc(size) might give us more room than requested.
> 	 * Put skb_shared_info exactly at the end of allocated zone,
> 	 * to allow max possible filling before reallocation.
> 	 */
> 	osize = ksize(data);
>         size = SKB_WITH_OVERHEAD(osize);
> 
> In both cases, the "how large is the allocation?" question is answered
> _after_ the allocation, where the compiler hinting is not in an easy place
> to make the association any more. This mismatch between the compiler's
> view of the buffer length and the code's intention about how much it is
> going to actually use has already caused problems[1]. It is possible to
> fix this by reordering the use of the "actual size" information.
> 
> We can serve the needs of users of ksize() and still have accurate buffer
> length hinting for the compiler by doing the bucket size calculation
> _before_ the allocation. Code can instead ask "how large an allocation
> would I get for a given size?".
> 
> Introduce kmalloc_size_roundup(), to serve this function so we can start
> replacing the "anticipatory resizing" uses of ksize().
>

Cc-ing Feng Tang who may welcome this series ;)

> [1] https://github.com/ClangBuiltLinux/linux/issues/1599
>     https://github.com/KSPP/linux/issues/183
> 
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Pekka Enberg <penberg@kernel.org>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  include/linux/slab.h | 31 +++++++++++++++++++++++++++++++
>  mm/slab_common.c     | 17 +++++++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 0fefdf528e0d..4fc41e4ed4a2 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -188,7 +188,21 @@ void * __must_check krealloc(const void *objp, size_t new_size, gfp_t flags) __a
>  void kfree(const void *objp);
>  void kfree_sensitive(const void *objp);
>  size_t __ksize(const void *objp);
> +
> +/**
> + * ksize - Report actual allocation size of associated object
> + *
> + * @objp: Pointer returned from a prior kmalloc()-family allocation.
> + *
> + * This should not be used for writing beyond the originally requested
> + * allocation size. Either use krealloc() or round up the allocation size
> + * with kmalloc_size_roundup() prior to allocation. If this is used to
> + * access beyond the originally requested allocation size, UBSAN_BOUNDS
> + * and/or FORTIFY_SOURCE may trip, since they only know about the
> + * originally allocated size via the __alloc_size attribute.
> + */
>  size_t ksize(const void *objp);

When users call ksize(), slab expects that it may access
beyond the originally requested allocation size.

(i.e. KASAN unpoisons the whole object.)
Maybe don't let KASAN unpoison to catch such users?

> +
>  #ifdef CONFIG_PRINTK
>  bool kmem_valid_obj(void *object);
>  void kmem_dump_obj(void *object);
> @@ -779,6 +793,23 @@ extern void kvfree(const void *addr);
>  extern void kvfree_sensitive(const void *addr, size_t len);
>  
>  unsigned int kmem_cache_size(struct kmem_cache *s);
> +
> +/**
> + * kmalloc_size_roundup - Report allocation bucket size for the given size
> + *
> + * @size: Number of bytes to round up from.
> + *
> + * This returns the number of bytes that would be available in a kmalloc()
> + * allocation of @size bytes. For example, a 126 byte request would be
> + * rounded up to the next sized kmalloc bucket, 128 bytes. (This is strictly
> + * for the general-purpose kmalloc()-based allocations, and is not for the
> + * pre-sized kmem_cache_alloc()-based allocations.)
> + *
> + * Use this to kmalloc() the full bucket size ahead of time instead of using
> + * ksize() to query the size after an allocation.
> + */
> +unsigned int kmalloc_size_roundup(size_t size);
> +
>  void __init kmem_cache_init_late(void);
>  
>  #if defined(CONFIG_SMP) && defined(CONFIG_SLAB)
> diff --git a/mm/slab_common.c b/mm/slab_common.c
> index 17996649cfe3..132d91a0f8c7 100644
> --- a/mm/slab_common.c
> +++ b/mm/slab_common.c
> @@ -721,6 +721,23 @@ struct kmem_cache *kmalloc_slab(size_t size, gfp_t flags)
>  	return kmalloc_caches[kmalloc_type(flags)][index];
>  }
>  
> +unsigned int kmalloc_size_roundup(size_t size)
> +{
> +	struct kmem_cache *c;
> +
> +	/* Short-circuit the 0 size case. */
> +	if (size == 0)
> +		return 0;
> +	/* Above the smaller buckets, size is a multiple of page size. */
> +	if (size > KMALLOC_MAX_CACHE_SIZE)
> +		return PAGE_SIZE << get_order(size);
> +
> +	/* The flags don't matter since size_index is common to all. */
> +	c = kmalloc_slab(size, GFP_KERNEL);
> +	return c ? c->object_size : 0;
> +}
> +EXPORT_SYMBOL(kmalloc_size_roundup);

This looks okay.

Thanks!

> +
>  #ifdef CONFIG_ZONE_DMA
>  #define KMALLOC_DMA_NAME(sz)	.name[KMALLOC_DMA] = "dma-kmalloc-" #sz,
>  #else
> -- 
> 2.34.1
> 
> 

-- 
Thanks,
Hyeonggon
