Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A00797FD9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 02:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B7210E0E0;
	Fri,  8 Sep 2023 00:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD6210E0E0
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 00:48:02 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1c35ee3b0d2so11750295ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Sep 2023 17:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1694134082; x=1694738882;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8CN2bMdaZb0aAVGEP2PYIwhTV4otwHmZXTPwLRyPKws=;
 b=g2O6Z1LSKcVDF2S8ZhZT2qllwXTi1Rrb2KjEtij/pJSNF8T9qjbzK3eKAWlq283zxa
 pN3/3NqhsEFfIEcd/SzDnWbYS4vcxf5fRowsJ+iudO55E4pY1dAT6RQ7+qsKVCHIQoaw
 fr6THp2WcLeVKNOHRBp/z7L3uIdFWlDHTsL9MMIP0Iaf+fenspJq2MoPDJir7UalKiLJ
 ZMc6oY6c7HRQyMyyOTMeSVnX20Gq2JX66mKRbhzq6ZxlbopApa+gZG3ehdNyXvbzhpE+
 cMs/jigdnSQ0qoictPDJ20pNsQOZ0DY3Bc/3ZGk73tnoxN53XFBwEL5fWn8kicCHaIsq
 tF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694134082; x=1694738882;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8CN2bMdaZb0aAVGEP2PYIwhTV4otwHmZXTPwLRyPKws=;
 b=A/1PNon2Wxr03NIgq76hoMe0W++m+V10fADEzscuSj/ks6FS9BEeYA3NfQ/w5jxQ9a
 JBUOPbol5aKIEvwHl2dpdN8GmPziQ5U7T9I3+IoYUmQKMMiXL11/1V77ZzEJsdJHaMVa
 PGahGVQIXl7nITYXDXQMNkjBM2GxAIg+O+J3aGlZQhU3XHwGTmshry0tVmpVxt99fCui
 rq5ua4QL6Pvgydf4daLoOs+wdAyS91c6Ru4dODdbWIen3ZkXI9TKOGVVJDsFJFbGze8k
 CHMVZwLRO9Fwzo3sGMh0DFNlX3rPxkzBs4ENd5HYL8pLOVKH4Pq5yL2j+zzflTjr74jI
 SHRw==
X-Gm-Message-State: AOJu0YwsQqm2I5oSvrDReg0Gw+pJaljfEu31ejYpDQdGC0uAoKOgjRr1
 RxsfvBd+dwL9qyAGr7IRhvYf3A==
X-Google-Smtp-Source: AGHT+IErqQyiwInovuOn6RCz96wVwGbsIlZN3/D5WbgzgOmws9AnPjo58ycdKgMhTT50+7Vo98ByGw==
X-Received: by 2002:a17:903:18a:b0:1bf:728:7458 with SMTP id
 z10-20020a170903018a00b001bf07287458mr1464259plg.58.1694134082012; 
 Thu, 07 Sep 2023 17:48:02 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1151:15:40a:5eb5:8916:33a4?
 ([2620:10d:c090:500::7:4620]) by smtp.gmail.com with ESMTPSA id
 ix13-20020a170902f80d00b001b5247cac3dsm335876plb.110.2023.09.07.17.48.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 17:48:01 -0700 (PDT)
Message-ID: <3413efe8-159b-1ee9-5cff-d3c8df0b4c8e@davidwei.uk>
Date: Thu, 7 Sep 2023 17:47:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [RFC PATCH v2 02/11] netdev: implement netlink api to bind
 dma-buf to netdevice
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230810015751.3297321-1-almasrymina@google.com>
 <20230810015751.3297321-3-almasrymina@google.com>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20230810015751.3297321-3-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
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
 Kaiyuan Zhang <kaiyuanz@google.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Willem de Bruijn <willemb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 stephen@networkplumber.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Eric Dumazet <edumazet@google.com>, sdf@google.com,
 Andy Lutomirski <luto@kernel.org>, Hari Ramakrishnan <rharix@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/08/2023 18:57, Mina Almasry wrote:
> Add a netdev_dmabuf_binding struct which represents the
> dma-buf-to-netdevice binding. The netlink API will bind the dma-buf to
> an rx queue on the netdevice. On the binding, the dma_buf_attach
> & dma_buf_map_attachment will occur. The entries in the sg_table from
> mapping will be inserted into a genpool to make it ready
> for allocation.
> 
> The chunks in the genpool are owned by a dmabuf_chunk_owner struct which
> holds the dma-buf offset of the base of the chunk and the dma_addr of
> the chunk. Both are needed to use allocations that come from this chunk.
> 
> We create a new type that represents an allocation from the genpool:
> page_pool_iov. We setup the page_pool_iov allocation size in the
> genpool to PAGE_SIZE for simplicity: to match the PAGE_SIZE normally
> allocated by the page pool and given to the drivers.
> 
> The user can unbind the dmabuf from the netdevice by closing the netlink
> socket that established the binding. We do this so that the binding is
> automatically unbound even if the userspace process crashes.
> 
> The binding and unbinding leaves an indicator in struct netdev_rx_queue
> that the given queue is bound, but the binding doesn't take effect until
> the driver actually reconfigures its queues, and re-initializes its page
> pool. This issue/weirdness is highlighted in the memory provider
> proposal[1], and I'm hoping that some generic solution for all
> memory providers will be discussed; this patch doesn't address that
> weirdness again.
> 
> The netdev_dmabuf_binding struct is refcounted, and releases its
> resources only when all the refs are released.
> 
> [1] https://lore.kernel.org/netdev/20230707183935.997267-1-kuba@kernel.org/
> 
> Signed-off-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> 
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> ---
>  include/linux/netdevice.h |  57 ++++++++++++
>  include/net/page_pool.h   |  27 ++++++
>  net/core/dev.c            | 178 ++++++++++++++++++++++++++++++++++++++
>  net/core/netdev-genl.c    | 101 ++++++++++++++++++++-
>  4 files changed, 361 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> index 3800d0479698..1b7c5966d2ca 100644
> --- a/include/linux/netdevice.h
> +++ b/include/linux/netdevice.h
> @@ -53,6 +53,8 @@
>  #include <net/net_trackers.h>
>  #include <net/net_debug.h>
>  #include <net/dropreason-core.h>
> +#include <linux/xarray.h>
> +#include <linux/refcount.h>
> 
>  struct netpoll_info;
>  struct device;
> @@ -782,6 +784,55 @@ bool rps_may_expire_flow(struct net_device *dev, u16 rxq_index, u32 flow_id,
>  #endif
>  #endif /* CONFIG_RPS */
> 
> +struct netdev_dmabuf_binding {
> +	struct dma_buf *dmabuf;
> +	struct dma_buf_attachment *attachment;
> +	struct sg_table *sgt;
> +	struct net_device *dev;
> +	struct gen_pool *chunk_pool;
> +
> +	/* The user holds a ref (via the netlink API) for as long as they want
> +	 * the binding to remain alive. Each page pool using this binding holds
> +	 * a ref to keep the binding alive. Each allocated page_pool_iov holds a
> +	 * ref.
> +	 *
> +	 * The binding undos itself and unmaps the underlying dmabuf once all
> +	 * those refs are dropped and the binding is no longer desired or in
> +	 * use.
> +	 */
> +	refcount_t ref;
> +
> +	/* The portid of the user that owns this binding. Used for netlink to
> +	 * notify us of the user dropping the bind.
> +	 */
> +	u32 owner_nlportid;
> +
> +	/* The list of bindings currently active. Used for netlink to notify us
> +	 * of the user dropping the bind.
> +	 */
> +	struct list_head list;
> +
> +	/* rxq's this binding is active on. */
> +	struct xarray bound_rxq_list;
> +};
> +
> +void __netdev_devmem_binding_free(struct netdev_dmabuf_binding *binding);
> +
> +static inline void
> +netdev_devmem_binding_get(struct netdev_dmabuf_binding *binding)
> +{
> +	refcount_inc(&binding->ref);
> +}
> +
> +static inline void
> +netdev_devmem_binding_put(struct netdev_dmabuf_binding *binding)
> +{
> +	if (!refcount_dec_and_test(&binding->ref))
> +		return;
> +
> +	__netdev_devmem_binding_free(binding);
> +}
> +
>  /* This structure contains an instance of an RX queue. */
>  struct netdev_rx_queue {
>  	struct xdp_rxq_info		xdp_rxq;
> @@ -796,6 +847,7 @@ struct netdev_rx_queue {
>  #ifdef CONFIG_XDP_SOCKETS
>  	struct xsk_buff_pool            *pool;
>  #endif
> +	struct netdev_dmabuf_binding	*binding;
>  } ____cacheline_aligned_in_smp;
> 
>  /*
> @@ -5026,6 +5078,11 @@ void netif_set_tso_max_segs(struct net_device *dev, unsigned int segs);
>  void netif_inherit_tso_max(struct net_device *to,
>  			   const struct net_device *from);
> 
> +void netdev_unbind_dmabuf_to_queue(struct netdev_dmabuf_binding *binding);
> +int netdev_bind_dmabuf_to_queue(struct net_device *dev, unsigned int dmabuf_fd,
> +				u32 rxq_idx,
> +				struct netdev_dmabuf_binding **out);
> +
>  static inline bool netif_is_macsec(const struct net_device *dev)
>  {
>  	return dev->priv_flags & IFF_MACSEC;
> diff --git a/include/net/page_pool.h b/include/net/page_pool.h
> index 364fe6924258..61b2066d32b5 100644
> --- a/include/net/page_pool.h
> +++ b/include/net/page_pool.h
> @@ -170,6 +170,33 @@ extern const struct pp_memory_provider_ops hugesp_ops;
>  extern const struct pp_memory_provider_ops huge_ops;
>  extern const struct pp_memory_provider_ops huge_1g_ops;
> 
> +/* page_pool_iov support */
> +
> +/* Owner of the dma-buf chunks inserted into the gen pool. Each scatterlist
> + * entry from the dmabuf is inserted into the genpool as a chunk, and needs
> + * this owner struct to keep track of some metadata necessary to create
> + * allocations from this chunk.
> + */
> +struct dmabuf_genpool_chunk_owner {
> +	/* Offset into the dma-buf where this chunk starts.  */
> +	unsigned long base_virtual;
> +
> +	/* dma_addr of the start of the chunk.  */
> +	dma_addr_t base_dma_addr;
> +
> +	/* Array of page_pool_iovs for this chunk. */
> +	struct page_pool_iov *ppiovs;
> +	size_t num_ppiovs;
> +
> +	struct netdev_dmabuf_binding *binding;
> +};
> +
> +struct page_pool_iov {
> +	struct dmabuf_genpool_chunk_owner *owner;
> +
> +	refcount_t refcount;
> +};
> +

Hi Mina, we're working on ZC RX to host memory [1] and have a similar need for
a page pool memory provider (backed by userspace host memory instead of GPU
memory) that hands out generic page_pool_iov buffers. The current differences
are that we hold a page ptr and its dma_addr_t directly as we are backed by
real pages; we still need a refcount for lifetime management. See struct
io_zc_rx_buf in [2].

It would be great to align on page_pool_iov such that it will work for both of
us. Would a union work here?

[1] https://lore.kernel.org/io-uring/20230826011954.1801099-1-dw@davidwei.uk/
[2] https://lore.kernel.org/io-uring/20230826011954.1801099-6-dw@davidwei.uk/

>  struct page_pool {
>  	struct page_pool_params p;
> 
> diff --git a/net/core/dev.c b/net/core/dev.c
> index 8e7d0cb540cd..02a25ccf771a 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -151,6 +151,8 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/prandom.h>
>  #include <linux/once_lite.h>
> +#include <linux/genalloc.h>
> +#include <linux/dma-buf.h>
> 
>  #include "dev.h"
>  #include "net-sysfs.h"
> @@ -2037,6 +2039,182 @@ static int call_netdevice_notifiers_mtu(unsigned long val,
>  	return call_netdevice_notifiers_info(val, &info.info);
>  }
> 
> +/* Device memory support */
> +
> +static void netdev_devmem_free_chunk_owner(struct gen_pool *genpool,
> +					   struct gen_pool_chunk *chunk,
> +					   void *not_used)
> +{
> +	struct dmabuf_genpool_chunk_owner *owner = chunk->owner;
> +
> +	kvfree(owner->ppiovs);
> +	kfree(owner);
> +}
> +
> +void __netdev_devmem_binding_free(struct netdev_dmabuf_binding *binding)
> +{
> +	size_t size, avail;
> +
> +	gen_pool_for_each_chunk(binding->chunk_pool,
> +				netdev_devmem_free_chunk_owner, NULL);
> +
> +	size = gen_pool_size(binding->chunk_pool);
> +	avail = gen_pool_avail(binding->chunk_pool);
> +
> +	if (!WARN(size != avail, "can't destroy genpool. size=%lu, avail=%lu",
> +		  size, avail))
> +		gen_pool_destroy(binding->chunk_pool);
> +
> +	dma_buf_unmap_attachment(binding->attachment, binding->sgt,
> +				 DMA_BIDIRECTIONAL);
> +	dma_buf_detach(binding->dmabuf, binding->attachment);
> +	dma_buf_put(binding->dmabuf);
> +	kfree(binding);
> +}
> +
> +void netdev_unbind_dmabuf_to_queue(struct netdev_dmabuf_binding *binding)
> +{
> +	struct netdev_rx_queue *rxq;
> +	unsigned long xa_idx;
> +
> +	list_del_rcu(&binding->list);
> +
> +	xa_for_each(&binding->bound_rxq_list, xa_idx, rxq)
> +		if (rxq->binding == binding)
> +			rxq->binding = NULL;
> +
> +	netdev_devmem_binding_put(binding);
> +}
> +
> +int netdev_bind_dmabuf_to_queue(struct net_device *dev, unsigned int dmabuf_fd,
> +				u32 rxq_idx, struct netdev_dmabuf_binding **out)
> +{
> +	struct netdev_dmabuf_binding *binding;
> +	struct netdev_rx_queue *rxq;
> +	struct scatterlist *sg;
> +	struct dma_buf *dmabuf;
> +	unsigned int sg_idx, i;
> +	unsigned long virtual;
> +	u32 xa_idx;
> +	int err;
> +
> +	rxq = __netif_get_rx_queue(dev, rxq_idx);
> +
> +	if (rxq->binding)
> +		return -EEXIST;
> +
> +	dmabuf = dma_buf_get(dmabuf_fd);
> +	if (IS_ERR_OR_NULL(dmabuf))
> +		return -EBADFD;
> +
> +	binding = kzalloc_node(sizeof(*binding), GFP_KERNEL,
> +			       dev_to_node(&dev->dev));
> +	if (!binding) {
> +		err = -ENOMEM;
> +		goto err_put_dmabuf;
> +	}
> +
> +	xa_init_flags(&binding->bound_rxq_list, XA_FLAGS_ALLOC);
> +
> +	refcount_set(&binding->ref, 1);
> +
> +	binding->dmabuf = dmabuf;
> +
> +	binding->attachment = dma_buf_attach(binding->dmabuf, dev->dev.parent);
> +	if (IS_ERR(binding->attachment)) {
> +		err = PTR_ERR(binding->attachment);
> +		goto err_free_binding;
> +	}
> +
> +	binding->sgt = dma_buf_map_attachment(binding->attachment,
> +					      DMA_BIDIRECTIONAL);
> +	if (IS_ERR(binding->sgt)) {
> +		err = PTR_ERR(binding->sgt);
> +		goto err_detach;
> +	}
> +
> +	/* For simplicity we expect to make PAGE_SIZE allocations, but the
> +	 * binding can be much more flexible than that. We may be able to
> +	 * allocate MTU sized chunks here. Leave that for future work...
> +	 */
> +	binding->chunk_pool = gen_pool_create(PAGE_SHIFT,
> +					      dev_to_node(&dev->dev));
> +	if (!binding->chunk_pool) {
> +		err = -ENOMEM;
> +		goto err_unmap;
> +	}
> +
> +	virtual = 0;
> +	for_each_sgtable_dma_sg(binding->sgt, sg, sg_idx) {
> +		dma_addr_t dma_addr = sg_dma_address(sg);
> +		struct dmabuf_genpool_chunk_owner *owner;
> +		size_t len = sg_dma_len(sg);
> +		struct page_pool_iov *ppiov;
> +
> +		owner = kzalloc_node(sizeof(*owner), GFP_KERNEL,
> +				     dev_to_node(&dev->dev));
> +		owner->base_virtual = virtual;
> +		owner->base_dma_addr = dma_addr;
> +		owner->num_ppiovs = len / PAGE_SIZE;
> +		owner->binding = binding;
> +
> +		err = gen_pool_add_owner(binding->chunk_pool, dma_addr,
> +					 dma_addr, len, dev_to_node(&dev->dev),
> +					 owner);
> +		if (err) {
> +			err = -EINVAL;
> +			goto err_free_chunks;
> +		}
> +
> +		owner->ppiovs = kvmalloc_array(owner->num_ppiovs,
> +					       sizeof(*owner->ppiovs),
> +					       GFP_KERNEL);
> +		if (!owner->ppiovs) {
> +			err = -ENOMEM;
> +			goto err_free_chunks;
> +		}
> +
> +		for (i = 0; i < owner->num_ppiovs; i++) {
> +			ppiov = &owner->ppiovs[i];
> +			ppiov->owner = owner;
> +			refcount_set(&ppiov->refcount, 1);
> +		}
> +
> +		dma_addr += len;
> +		virtual += len;
> +	}
> +
> +	/* TODO: need to be able to bind to multiple rx queues on the same
> +	 * netdevice. The code should already be able to handle that with
> +	 * minimal changes, but the netlink API currently allows for 1 rx
> +	 * queue.
> +	 */
> +	err = xa_alloc(&binding->bound_rxq_list, &xa_idx, rxq, xa_limit_32b,
> +		       GFP_KERNEL);
> +	if (err)
> +		goto err_free_chunks;
> +
> +	rxq->binding = binding;
> +	*out = binding;
> +
> +	return 0;
> +
> +err_free_chunks:
> +	gen_pool_for_each_chunk(binding->chunk_pool,
> +				netdev_devmem_free_chunk_owner, NULL);
> +	gen_pool_destroy(binding->chunk_pool);
> +err_unmap:
> +	dma_buf_unmap_attachment(binding->attachment, binding->sgt,
> +				 DMA_BIDIRECTIONAL);
> +err_detach:
> +	dma_buf_detach(dmabuf, binding->attachment);
> +err_free_binding:
> +	kfree(binding);
> +err_put_dmabuf:
> +	dma_buf_put(dmabuf);
> +	return err;
> +}
> +
>  #ifdef CONFIG_NET_INGRESS
>  static DEFINE_STATIC_KEY_FALSE(ingress_needed_key);
> 
> diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
> index bf7324dd6c36..288ed0112995 100644
> --- a/net/core/netdev-genl.c
> +++ b/net/core/netdev-genl.c
> @@ -141,10 +141,74 @@ int netdev_nl_dev_get_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
>  	return skb->len;
>  }
> 
> -/* Stub */
> +static LIST_HEAD(netdev_rbinding_list);
> +
>  int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
>  {
> -	return 0;
> +	struct netdev_dmabuf_binding *out_binding;
> +	u32 ifindex, dmabuf_fd, rxq_idx;
> +	struct net_device *netdev;
> +	struct sk_buff *rsp;
> +	int err = 0;
> +	void *hdr;
> +
> +	if (GENL_REQ_ATTR_CHECK(info, NETDEV_A_DEV_IFINDEX) ||
> +	    GENL_REQ_ATTR_CHECK(info, NETDEV_A_BIND_DMABUF_DMABUF_FD) ||
> +	    GENL_REQ_ATTR_CHECK(info, NETDEV_A_BIND_DMABUF_QUEUE_IDX))
> +		return -EINVAL;
> +
> +	ifindex = nla_get_u32(info->attrs[NETDEV_A_DEV_IFINDEX]);
> +	dmabuf_fd = nla_get_u32(info->attrs[NETDEV_A_BIND_DMABUF_DMABUF_FD]);
> +	rxq_idx = nla_get_u32(info->attrs[NETDEV_A_BIND_DMABUF_QUEUE_IDX]);
> +
> +	rtnl_lock();
> +
> +	netdev = __dev_get_by_index(genl_info_net(info), ifindex);
> +	if (!netdev) {
> +		err = -ENODEV;
> +		goto err_unlock;
> +	}
> +
> +	if (rxq_idx >= netdev->num_rx_queues) {
> +		err = -ERANGE;
> +		goto err_unlock;
> +	}
> +
> +	if (netdev_bind_dmabuf_to_queue(netdev, dmabuf_fd, rxq_idx,
> +					&out_binding)) {
> +		err = -EINVAL;
> +		goto err_unlock;
> +	}
> +
> +	out_binding->owner_nlportid = info->snd_portid;
> +	list_add_rcu(&out_binding->list, &netdev_rbinding_list);
> +
> +	rsp = genlmsg_new(GENLMSG_DEFAULT_SIZE, GFP_KERNEL);
> +	if (!rsp) {
> +		err = -ENOMEM;
> +		goto err_unbind;
> +	}
> +
> +	hdr = genlmsg_put(rsp, info->snd_portid, info->snd_seq,
> +			  &netdev_nl_family, 0, info->genlhdr->cmd);
> +	if (!hdr) {
> +		err = -EMSGSIZE;
> +		goto err_genlmsg_free;
> +	}
> +
> +	genlmsg_end(rsp, hdr);
> +
> +	rtnl_unlock();
> +
> +	return genlmsg_reply(rsp, info);
> +
> +err_genlmsg_free:
> +	nlmsg_free(rsp);
> +err_unbind:
> +	netdev_unbind_dmabuf_to_queue(out_binding);
> +err_unlock:
> +	rtnl_unlock();
> +	return err;
>  }
> 
>  static int netdev_genl_netdevice_event(struct notifier_block *nb,
> @@ -167,10 +231,37 @@ static int netdev_genl_netdevice_event(struct notifier_block *nb,
>  	return NOTIFY_OK;
>  }
> 
> +static int netdev_netlink_notify(struct notifier_block *nb, unsigned long state,
> +				 void *_notify)
> +{
> +	struct netlink_notify *notify = _notify;
> +	struct netdev_dmabuf_binding *rbinding;
> +
> +	if (state != NETLINK_URELEASE || notify->protocol != NETLINK_GENERIC)
> +		return NOTIFY_DONE;
> +
> +	rcu_read_lock();
> +
> +	list_for_each_entry_rcu(rbinding, &netdev_rbinding_list, list) {
> +		if (rbinding->owner_nlportid == notify->portid) {
> +			netdev_unbind_dmabuf_to_queue(rbinding);
> +			break;
> +		}
> +	}
> +
> +	rcu_read_unlock();
> +
> +	return NOTIFY_OK;
> +}
> +
>  static struct notifier_block netdev_genl_nb = {
>  	.notifier_call	= netdev_genl_netdevice_event,
>  };
> 
> +static struct notifier_block netdev_netlink_notifier = {
> +	.notifier_call = netdev_netlink_notify,
> +};
> +
>  static int __init netdev_genl_init(void)
>  {
>  	int err;
> @@ -183,8 +274,14 @@ static int __init netdev_genl_init(void)
>  	if (err)
>  		goto err_unreg_ntf;
> 
> +	err = netlink_register_notifier(&netdev_netlink_notifier);
> +	if (err)
> +		goto err_unreg_family;
> +
>  	return 0;
> 
> +err_unreg_family:
> +	genl_unregister_family(&netdev_nl_family);
>  err_unreg_ntf:
>  	unregister_netdevice_notifier(&netdev_genl_nb);
>  	return err;
> --
> 2.41.0.640.ga95def55d0-goog

