Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0782290B87B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 19:53:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0E710E486;
	Mon, 17 Jun 2024 17:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kOKJ7ga3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6463A10E486
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 17:52:56 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-35f1c490c13so5027392f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 10:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718646774; x=1719251574; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TpAELCdjsBD+JrbERWD7mTd4OMlGherBa7u+JgUwCuU=;
 b=kOKJ7ga3F4T+uh1TgdEBOG39KqKhtXhTEDkXiLLIwfPeBC1Ka1OEGiUETIDIlzyB6r
 +dJxmObM9w2VSmTXyYAKeu45MM9KWcu/x8rD6oNc/j7zfXcdhKFa6psD9lIO3WEL9aQL
 UN1FzA079K9MMYkspry+GNITlKdOBIZy6czfThw4QK7eLHiNF1b7ivjygxTR8DG8ILk1
 NiC1zE6G4Q2aJCQHFkfeARdvqrAlX9eQGpNaVB2ef/y0tWSh9lxHqAv2B/Zk2mWc1O04
 iIqr0wU/V/6LlpunKSAfKAWI4N08KcfZlDmlc3DRF+Z77OpyEtQw2EhYFGsccOQO/GVH
 VJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718646774; x=1719251574;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TpAELCdjsBD+JrbERWD7mTd4OMlGherBa7u+JgUwCuU=;
 b=AXYIuYCpXvD7JGw+IrK5ES7mY4pVLgDdgO6ATbHw0aFPSDSfkO4CrVhkH3YOe7Mpbk
 GxlpRPperyrm3hAidoEX2Yl8n1qElWGFydVqhOR3oKuBguv2KYXZeZ0hdqy1pt1sOe02
 ooSWDtZnzGgh7VbWVN3xjfX+582FZHOua4lDnA6TcxmzwDAdaZtkpHG5hwcomvyQa+SL
 Jrjb8P492cxJg1IPf++hAr+jKnb4MJ1Qy9xHiGr5+hEsVxbzRt4rYfx0aOXWoY3fU8he
 Qnm+Jm1XbQf7UwGp0pA3BhkKLM1iyYmGg/QXpOjPQjJnWTiwBtuxz+QacXde94dRAyA/
 PHAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDYqXMmKNtjh9eHogC7usBWkEh3DYL8acHekBnXvYpZ5grhdKT2VlztO1JjaX2P1mXaMRmPO6X3AqWpRo7KueGygjIDHmEC+UsDJevIsgn
X-Gm-Message-State: AOJu0Yxcqz2iUBprqJsOMLXoTK2wgYX+7Lir2qR99uwT1UsbR+oqcDRb
 YkKKyVUOoeydCdIiU/q2CAvpcpQCzK3LZftdYMMRWY5/AAK7hTrB
X-Google-Smtp-Source: AGHT+IGl45hl8z5GTV7cP0mMya2j77Ernk+fngMh6lTe4ik8n3cM/4R8lGNxKRhI8iXovlNIXIeAXQ==
X-Received: by 2002:adf:efc9:0:b0:35f:219d:e529 with SMTP id
 ffacd0b85a97d-3607a78338cmr10492439f8f.47.1718646774132; 
 Mon, 17 Jun 2024 10:52:54 -0700 (PDT)
Received: from [192.168.42.223] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ecdce5sm531595666b.108.2024.06.17.10.52.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 10:52:53 -0700 (PDT)
Message-ID: <fa9f8d25-9f68-4f63-a070-639e23917827@gmail.com>
Date: Mon, 17 Jun 2024 18:52:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 05/13] page_pool: convert to use netmem
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
References: <20240613013557.1169171-1-almasrymina@google.com>
 <20240613013557.1169171-6-almasrymina@google.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20240613013557.1169171-6-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 6/13/24 02:35, Mina Almasry wrote:
> Abstrace the memory type from the page_pool so we can later add support
> for new memory types. Convert the page_pool to use the new netmem type
> abstraction, rather than use struct page directly.
> 
> As of this patch the netmem type is a no-op abstraction: it's always a
> struct page underneath. All the page pool internals are converted to
> use struct netmem instead of struct page, and the page pool now exports
> 2 APIs:
> 
> 1. The existing struct page API.
> 2. The new struct netmem API.

nits below,

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>


> Keeping the existing API is transitional; we do not want to refactor all
> the current drivers using the page pool at once.
> 
> The netmem abstraction is currently a no-op. The page_pool uses
> page_to_netmem() to convert allocated pages to netmem, and uses
> netmem_to_page() to convert the netmem back to pages to pass to mm APIs,
> 
> Follow up patches to this series add non-paged netmem support to the
> page_pool. This change is factored out on its own to limit the code
> churn to this 1 patch, for ease of code review.
> 
> Signed-off-by: Mina Almasry <almasrymina@google.com>
>   #endif /* _NET_NETMEM_H */
> diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
> index 873631c79ab16..5e129d5304f53 100644
> --- a/include/net/page_pool/helpers.h
> +++ b/include/net/page_pool/helpers.h
> @@ -55,6 +55,8 @@
>   #include <linux/dma-mapping.h>
>   
>   #include <net/page_pool/types.h>
> +#include <net/net_debug.h>
> +#include <net/netmem.h>
>   
>   #ifdef CONFIG_PAGE_POOL_STATS
>   /* Deprecated driver-facing API, use netlink instead */
> @@ -103,7 +105,7 @@ static inline struct page *page_pool_dev_alloc_pages(struct page_pool *pool)
>    * Get a page fragment from the page allocator or page_pool caches.
>    *
>    * Return:
> - * Return allocated page fragment, otherwise return NULL.
> + * Return allocated page fragment, otherwise return 0.

It's a page_pool_dev_alloc_frag()'s comment, and the function
still returns a pointer.

...
>   static inline void *page_pool_alloc_va(struct page_pool *pool,
> @@ -172,7 +174,8 @@ static inline void *page_pool_alloc_va(struct page_pool *pool,
>   	struct page *page;
>   
>   	/* Mask off __GFP_HIGHMEM to ensure we can use page_address() */
> -	page = page_pool_alloc(pool, &offset, size, gfp & ~__GFP_HIGHMEM);
> +	page = netmem_to_page(
> +		page_pool_alloc(pool, &offset, size, gfp & ~__GFP_HIGHMEM));
>   	if (unlikely(!page))
>   		return NULL;
>   
> @@ -189,7 +192,7 @@ static inline void *page_pool_alloc_va(struct page_pool *pool,
>    * it returns va of the allocated page or page fragment.
>    *
>    * Return:
> - * Return the va for the allocated page or page fragment, otherwise return NULL.
> + * Return the va for the allocated page or page fragment, otherwise return 0.

ditto

>    */
>   static inline void *page_pool_dev_alloc_va(struct page_pool *pool,
>   					   unsigned int *size)
> @@ -212,6 +215,11 @@ page_pool_get_dma_dir(const struct page_pool *pool)
>   	return pool->p.dma_dir;
>   }
>   
> +static inline void page_pool_fragment_netmem(netmem_ref netmem, long nr)
> +{
> +	atomic_long_set(&netmem_to_page(netmem)->pp_ref_count, nr);
> +}
...

-- 
Pavel Begunkov
