Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D980280AFF6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 23:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEA010EB56;
	Fri,  8 Dec 2023 22:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B71B10EB4D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 22:56:21 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3333224c7b9so2445590f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 14:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702076180; x=1702680980; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lb6bW5/0tabUFZtl8Q33e8tjxN2YuHNYvOt9IYVdZ58=;
 b=kJhb7EmshUsHJ4ekdnS80v/cxY2mnQleEh8Yhpn+FgYUom4mYmTffgyTDIv+TAEO03
 7UFUVcDS0A4iEbWpC5+JHCH8wk6+ggfhBOPsMok0Njq+KROAV7L5/abUDqA7yRpY/GOz
 VgRHuyzF6oAyI43IYOZ27YMqULn/q2RtCgFLd4d3dJJCX32M0DSw2EG8+/jZRt+hoE4S
 rembuQsEQx1n6tlGcqqWe+1NsWBgmtLHfYXyfkqO5OwAnh6U4eOWSxBmdlxNo6UOI43I
 4ZfAs6ptR1gAa73TAxfGyZYW7RBfX9VdloJiZ51YUMnrcru4y0rCUrLTyJSCakVb9UaL
 OKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702076180; x=1702680980;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lb6bW5/0tabUFZtl8Q33e8tjxN2YuHNYvOt9IYVdZ58=;
 b=YfqySAkceBoTep/GMon985wzsmUkmOAZ7tKPPXGLz/Z/MGs/K5fkK0nBsNVEW8xHab
 /QmF3N1DX5aDPwO4X2dWQbKzGfP//SfsntOJiJ7wrgssgrKHcD/ipCjQqqKDBFK9TB3m
 J+j40Ms9jJgtzwRtcae8yiRM2M28lOHK68/9ZWVNb3teqM9kMxchcUBU+AWxS1MqNJ2O
 oWTr71XiUOiuteK+ogBBTu8f93KIGPzfNtwcpsuZv+fiuyaOIao0ZQ6bxb0m09sqBU46
 H2WhsPf5WzunrgYqjGwiVLblmQt2F9iVPDkIiE67mcBq8qfeCpDEV1yv/TZ5YnhGerlN
 HiDQ==
X-Gm-Message-State: AOJu0YweO53PNRaeWIyf1kOFTTGwQclDYvDJ57eXIKelKriPXGOiR2lN
 LJte2EI4m1zdkc4/x7IxNa5gWixCTkS23w==
X-Google-Smtp-Source: AGHT+IFAmrtgnNNek+1m8q51NDmIrFuDjToi+3B5bJWseuGhKrVhDjl0ENoSpKj3SUNwgp1Op3PP5Q==
X-Received: by 2002:a5d:5255:0:b0:333:2fd2:68bb with SMTP id
 k21-20020a5d5255000000b003332fd268bbmr490933wrc.78.1702076179579; 
 Fri, 08 Dec 2023 14:56:19 -0800 (PST)
Received: from [192.168.8.100] ([85.255.236.117])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a5d4c4b000000b0033326e90496sm2902430wrt.18.2023.12.08.14.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Dec 2023 14:56:19 -0800 (PST)
Message-ID: <b07a4eca-0c3d-4620-9f97-b1d2c76642c2@gmail.com>
Date: Fri, 8 Dec 2023 22:48:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v1 08/16] memory-provider: dmabuf devmem memory provider
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>,
 Shailend Chand <shailend@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-9-almasrymina@google.com>
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20231208005250.2910004-9-almasrymina@google.com>
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Yunsheng Lin <linyunsheng@huawei.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/8/23 00:52, Mina Almasry wrote:
> Implement a memory provider that allocates dmabuf devmem page_pool_iovs.
> 
> The provider receives a reference to the struct netdev_dmabuf_binding
> via the pool->mp_priv pointer. The driver needs to set this pointer for
> the provider in the page_pool_params.
> 
> The provider obtains a reference on the netdev_dmabuf_binding which
> guarantees the binding and the underlying mapping remains alive until
> the provider is destroyed.
> 
> Usage of PP_FLAG_DMA_MAP is required for this memory provide such that
> the page_pool can provide the driver with the dma-addrs of the devmem.
> 
> Support for PP_FLAG_DMA_SYNC_DEV is omitted for simplicity.
> 
> Signed-off-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> 
> ---
> 
> v1:
> - static_branch check in page_is_page_pool_iov() (Willem & Paolo).
> - PP_DEVMEM -> PP_IOV (David).
> - Require PP_FLAG_DMA_MAP (Jakub).
> 
> ---
>   include/net/page_pool/helpers.h | 47 +++++++++++++++++
>   include/net/page_pool/types.h   |  9 ++++
>   net/core/page_pool.c            | 89 ++++++++++++++++++++++++++++++++-
>   3 files changed, 144 insertions(+), 1 deletion(-)
> 
> diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
> index 8bfc2d43efd4..00197f14aa87 100644
> --- a/include/net/page_pool/helpers.h
> +++ b/include/net/page_pool/helpers.h
> @@ -53,6 +53,8 @@
>   #define _NET_PAGE_POOL_HELPERS_H
>   
>   #include <net/page_pool/types.h>
> +#include <net/net_debug.h>
> +#include <net/devmem.h>
>   
>   #ifdef CONFIG_PAGE_POOL_STATS
>   /* Deprecated driver-facing API, use netlink instead */
> @@ -92,6 +94,11 @@ static inline unsigned int page_pool_iov_idx(const struct page_pool_iov *ppiov)
>   	return ppiov - page_pool_iov_owner(ppiov)->ppiovs;
>   }
>   
> +static inline u32 page_pool_iov_binding_id(const struct page_pool_iov *ppiov)
> +{
> +	return page_pool_iov_owner(ppiov)->binding->id;
> +}
> +
>   static inline dma_addr_t
>   page_pool_iov_dma_addr(const struct page_pool_iov *ppiov)
>   {
> @@ -107,6 +114,46 @@ page_pool_iov_binding(const struct page_pool_iov *ppiov)
>   	return page_pool_iov_owner(ppiov)->binding;
>   }
>   
> +static inline int page_pool_iov_refcount(const struct page_pool_iov *ppiov)
> +{
> +	return refcount_read(&ppiov->refcount);
> +}
> +
> +static inline void page_pool_iov_get_many(struct page_pool_iov *ppiov,
> +					  unsigned int count)
> +{
> +	refcount_add(count, &ppiov->refcount);
> +}
> +
> +void __page_pool_iov_free(struct page_pool_iov *ppiov);
> +
> +static inline void page_pool_iov_put_many(struct page_pool_iov *ppiov,
> +					  unsigned int count)
> +{
> +	if (!refcount_sub_and_test(count, &ppiov->refcount))
> +		return;
> +
> +	__page_pool_iov_free(ppiov);
> +}
> +
> +/* page pool mm helpers */
> +
> +DECLARE_STATIC_KEY_FALSE(page_pool_mem_providers);
> +static inline bool page_is_page_pool_iov(const struct page *page)
> +{
> +	return static_branch_unlikely(&page_pool_mem_providers) &&
> +	       (unsigned long)page & PP_IOV;
> +}
> +
> +static inline struct page_pool_iov *page_to_page_pool_iov(struct page *page)
> +{
> +	if (page_is_page_pool_iov(page))
> +		return (struct page_pool_iov *)((unsigned long)page & ~PP_IOV);
> +
> +	DEBUG_NET_WARN_ON_ONCE(true);
> +	return NULL;
> +}
> +
>   /**
>    * page_pool_dev_alloc_pages() - allocate a page.
>    * @pool:	pool from which to allocate
> diff --git a/include/net/page_pool/types.h b/include/net/page_pool/types.h
> index 44faee7a7b02..136930a238de 100644
> --- a/include/net/page_pool/types.h
> +++ b/include/net/page_pool/types.h
> @@ -134,8 +134,15 @@ struct memory_provider_ops {
>   	bool (*release_page)(struct page_pool *pool, struct page *page);
>   };
>   
> +extern const struct memory_provider_ops dmabuf_devmem_ops;
> +
>   /* page_pool_iov support */
>   
> +/*  We overload the LSB of the struct page pointer to indicate whether it's
> + *  a page or page_pool_iov.
> + */
> +#define PP_IOV 0x01UL
> +
>   /* Owner of the dma-buf chunks inserted into the gen pool. Each scatterlist
>    * entry from the dmabuf is inserted into the genpool as a chunk, and needs
>    * this owner struct to keep track of some metadata necessary to create
> @@ -159,6 +166,8 @@ struct page_pool_iov {
>   	struct dmabuf_genpool_chunk_owner *owner;
>   
>   	refcount_t refcount;
> +
> +	struct page_pool *pp;
>   };
>   
>   struct page_pool {
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index f5c84d2a4510..423c88564a00 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -12,6 +12,7 @@
>   
>   #include <net/page_pool/helpers.h>
>   #include <net/xdp.h>
> +#include <net/netdev_rx_queue.h>
>   
>   #include <linux/dma-direction.h>
>   #include <linux/dma-mapping.h>
> @@ -20,12 +21,15 @@
>   #include <linux/poison.h>
>   #include <linux/ethtool.h>
>   #include <linux/netdevice.h>
> +#include <linux/genalloc.h>
> +#include <net/devmem.h>
>   
>   #include <trace/events/page_pool.h>
>   
>   #include "page_pool_priv.h"
>   
> -static DEFINE_STATIC_KEY_FALSE(page_pool_mem_providers);
> +DEFINE_STATIC_KEY_FALSE(page_pool_mem_providers);
> +EXPORT_SYMBOL(page_pool_mem_providers);
>   
>   #define DEFER_TIME (msecs_to_jiffies(1000))
>   #define DEFER_WARN_INTERVAL (60 * HZ)
> @@ -175,6 +179,7 @@ static void page_pool_producer_unlock(struct page_pool *pool,
>   static int page_pool_init(struct page_pool *pool,
>   			  const struct page_pool_params *params)
>   {
> +	struct netdev_dmabuf_binding *binding = NULL;
>   	unsigned int ring_qsize = 1024; /* Default */
>   	int err;
>   
> @@ -237,6 +242,14 @@ static int page_pool_init(struct page_pool *pool,
>   	/* Driver calling page_pool_create() also call page_pool_destroy() */
>   	refcount_set(&pool->user_cnt, 1);
>   
> +	if (pool->p.queue)
> +		binding = READ_ONCE(pool->p.queue->binding);
> +
> +	if (binding) {
> +		pool->mp_ops = &dmabuf_devmem_ops;
> +		pool->mp_priv = binding;
> +	}

Hmm, I don't understand why would we replace a nice transparent
api with page pool relying on a queue having devmem specific
pointer? It seemed more flexible and cleaner in the last RFC.

> +
>   	if (pool->mp_ops) {
>   		err = pool->mp_ops->init(pool);
>   		if (err) {
> @@ -1020,3 +1033,77 @@ void page_pool_update_nid(struct page_pool *pool, int new_nid)
>   	}
>   }
>   EXPORT_SYMBOL(page_pool_update_nid);
> +
> +void __page_pool_iov_free(struct page_pool_iov *ppiov)
> +{
> +	if (WARN_ON(ppiov->pp->mp_ops != &dmabuf_devmem_ops))
> +		return;
> +
> +	netdev_free_dmabuf(ppiov);
> +}
> +EXPORT_SYMBOL_GPL(__page_pool_iov_free);

I didn't look too deep but I don't think I immediately follow
the pp refcounting. It increments pages_state_hold_cnt on
allocation, but IIUC doesn't mark skbs for recycle? Then, they all
will be put down via page_pool_iov_put_many() bypassing
page_pool_return_page() and friends. That will call
netdev_free_dmabuf(), which doesn't bump pages_state_release_cnt.

At least I couldn't make it work with io_uring, and for my purposes,
I forced all puts to go through page_pool_return_page(), which calls
the ->release_page callback. The callback will put the reference and
ask its page pool to account release_cnt. It also gets rid of
__page_pool_iov_free(), as we'd need to add a hook there for
customization otherwise.

I didn't care about overhead because the hot path for me is getting
buffers from a ring, which is somewhat analogous to sock_devmem_dontneed(),
but done on pp allocations under napi, and it's done separately.

Completely untested with TCP devmem:

https://github.com/isilence/linux/commit/14bd56605183dc80b540999e8058c79ac92ae2d8

> +
> +/*** "Dmabuf devmem memory provider" ***/
> +
> +static int mp_dmabuf_devmem_init(struct page_pool *pool)
> +{
> +	struct netdev_dmabuf_binding *binding = pool->mp_priv;
> +
> +	if (!binding)
> +		return -EINVAL;
> +
> +	if (!(pool->p.flags & PP_FLAG_DMA_MAP))
> +		return -EOPNOTSUPP;
> +
> +	if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
> +		return -EOPNOTSUPP;
> +
> +	netdev_dmabuf_binding_get(binding);
> +	return 0;
> +}
> +
> +static struct page *mp_dmabuf_devmem_alloc_pages(struct page_pool *pool,
> +						 gfp_t gfp)
> +{
> +	struct netdev_dmabuf_binding *binding = pool->mp_priv;
> +	struct page_pool_iov *ppiov;
> +
> +	ppiov = netdev_alloc_dmabuf(binding);
> +	if (!ppiov)
> +		return NULL;
> +
> +	ppiov->pp = pool;
> +	pool->pages_state_hold_cnt++;
> +	trace_page_pool_state_hold(pool, (struct page *)ppiov,
> +				   pool->pages_state_hold_cnt);
> +	return (struct page *)((unsigned long)ppiov | PP_IOV);
> +}
> +
> +static void mp_dmabuf_devmem_destroy(struct page_pool *pool)
> +{
> +	struct netdev_dmabuf_binding *binding = pool->mp_priv;
> +
> +	netdev_dmabuf_binding_put(binding);
> +}
> +
> +static bool mp_dmabuf_devmem_release_page(struct page_pool *pool,
> +					  struct page *page)
> +{
> +	struct page_pool_iov *ppiov;
> +
> +	if (WARN_ON_ONCE(!page_is_page_pool_iov(page)))
> +		return false;
> +
> +	ppiov = page_to_page_pool_iov(page);
> +	page_pool_iov_put_many(ppiov, 1);
> +	/* We don't want the page pool put_page()ing our page_pool_iovs. */
> +	return false;
> +}
> +
> +const struct memory_provider_ops dmabuf_devmem_ops = {
> +	.init			= mp_dmabuf_devmem_init,
> +	.destroy		= mp_dmabuf_devmem_destroy,
> +	.alloc_pages		= mp_dmabuf_devmem_alloc_pages,
> +	.release_page		= mp_dmabuf_devmem_release_page,
> +};
> +EXPORT_SYMBOL(dmabuf_devmem_ops);

-- 
Pavel Begunkov
