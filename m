Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5D0781A55
	for <lists+dri-devel@lfdr.de>; Sat, 19 Aug 2023 17:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E82210E092;
	Sat, 19 Aug 2023 15:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808DF10E025
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 15:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692458533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=keVE+I2nkLA3CHwfsEGvNpgHqt6DHU7oi1oUqkE8NeY=;
 b=e5GWlDnEfPil4cBDCsUC1TLZjd2Mts+DUwmizRSauRsW8/061SWit2MMKcYW8WF2BSMzZk
 5w7+LzWA5xGuBu1Uh1OTHv7fXLFe7rL0E9H3AvyO44GsDKRXrajr6RIm3SxFhe05YQK6WE
 WNJ7PAIPh5O1sCC7Q8CE2DObowQbQYM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-Pbh7mz9HM3enY1au-5Hn5g-1; Sat, 19 Aug 2023 11:22:11 -0400
X-MC-Unique: Pbh7mz9HM3enY1au-5Hn5g-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-99bcf56a2e9so113368266b.2
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 08:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692458530; x=1693063330;
 h=content-transfer-encoding:in-reply-to:references:to
 :content-language:subject:cc:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=keVE+I2nkLA3CHwfsEGvNpgHqt6DHU7oi1oUqkE8NeY=;
 b=eSHZR40NjasXXTpMqs1KMz0CocGBFwflJk9jbOHhEjOThZs2abeu9Qe7Rar76ZPUYe
 wxjc8b2g+C7MWKNjNXPC7NEAzPFbAe948jv2Q25A8KJ0iO7mQL6dhRHckjAtvD5eHFbT
 ALtcHgVER6yzkeOX9S4mxrcPAi4NEdPdkWbIk1LRfJm/838JABeLjzPgw/iGAd2WRikk
 Sgi+hLBACg0GbcEIIFaPmIFsMDIDG7ehCYhfYZxlXEyiFpLiJC2RDk7gOZp+hY2kHdYF
 Cw/tuRA9CaKCw+ho/9gkGDPKcNdHG4/iG3qEteEiHnxUATqVGTvz/5/ehEWhAq+JlH+O
 H/pw==
X-Gm-Message-State: AOJu0YxBoEgGM+ps6MY9sRfXmjuPSzhDVHKqqKqxNmHy5e2CoEnIKTBP
 WOQEeonYQJxhFmcPtnS/lDqS1iMlrUA465oEno2COVNC7ynD45Z1jQ2hs/M68fek9H0zl8d0ws8
 SwMZg2cl1Fz6O1Ja/4VnZQGduPF8k
X-Received: by 2002:a17:906:9c9:b0:993:fba5:cdf1 with SMTP id
 r9-20020a17090609c900b00993fba5cdf1mr1761442eje.22.1692458530186; 
 Sat, 19 Aug 2023 08:22:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN1ueK9wrNYAZjQ0ZC00yCwY/1GC2RR4vP4AyY3ACPioClkjx++nybqqJOBtS4YNcqXuoxrg==
X-Received: by 2002:a17:906:9c9:b0:993:fba5:cdf1 with SMTP id
 r9-20020a17090609c900b00993fba5cdf1mr1761415eje.22.1692458529792; 
 Sat, 19 Aug 2023 08:22:09 -0700 (PDT)
Received: from [192.168.42.222] (194-45-78-10.static.kviknet.net.
 [194.45.78.10]) by smtp.gmail.com with ESMTPSA id
 b16-20020a170906151000b0099df2ddfc37sm2856060ejd.165.2023.08.19.08.22.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Aug 2023 08:22:08 -0700 (PDT)
From: Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <8f4d276e-470d-6ce8-85d5-a6c08fa22147@redhat.com>
Date: Sat, 19 Aug 2023 17:22:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v2 06/11] page-pool: add device memory support
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jesper Dangaard Brouer <jbrouer@redhat.com>
References: <20230810015751.3297321-1-almasrymina@google.com>
 <20230810015751.3297321-7-almasrymina@google.com>
 <6adafb5d-0bc5-cb9a-5232-6836ab7e77e6@redhat.com>
 <CAF=yD-L0ajGVrexnOVvvhC-A7vw6XP9tq5T3HCDTjQMS0mXdTQ@mail.gmail.com>
In-Reply-To: <CAF=yD-L0ajGVrexnOVvvhC-A7vw6XP9tq5T3HCDTjQMS0mXdTQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Mina Almasry <almasrymina@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 stephen@networkplumber.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Eric Dumazet <edumazet@google.com>, Hari Ramakrishnan <rharix@google.com>,
 sdf@google.com, Andy Lutomirski <luto@kernel.org>, brouer@redhat.com,
 Jakub Kicinski <kuba@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/08/2023 16.08, Willem de Bruijn wrote:
> On Sat, Aug 19, 2023 at 5:51 AM Jesper Dangaard Brouer
> <jbrouer@redhat.com> wrote:
>>
>>
>>
>> On 10/08/2023 03.57, Mina Almasry wrote:
>>> Overload the LSB of struct page* to indicate that it's a page_pool_iov.
>>>
>>> Refactor mm calls on struct page * into helpers, and add page_pool_iov
>>> handling on those helpers. Modify callers of these mm APIs with calls to
>>> these helpers instead.
>>>
>>
>> I don't like of this approach.
>> This is adding code to the PP (page_pool) fast-path in multiple places.
>>
>> I've not had time to run my usual benchmarks, which are here:
>>
>> https://github.com/netoptimizer/prototype-kernel/blob/master/kernel/lib/bench_page_pool_simple.c
>>
>> But I'm sure it will affect performance.
>>
>> Regardless of performance, this approach is using ptr-LSB-bits, to hide
>> that page-pointer are not really struct-pages, feels like force feeding
>> a solution just to use the page_pool APIs.
>>
>>
>>> In areas where struct page* is dereferenced, add a check for special
>>> handling of page_pool_iov.
>>>
>>> The memory providers producing page_pool_iov can set the LSB on the
>>> struct page* returned to the page pool.
>>>
>>> Note that instead of overloading the LSB of page pointers, we can
>>> instead define a new union between struct page & struct page_pool_iov and
>>> compact it in a new type. However, we'd need to implement the code churn
>>> to modify the page_pool & drivers to use this new type. For this POC
>>> that is not implemented (feedback welcome).
>>>
>>
>> I've said before, that I prefer multiplexing on page->pp_magic.
>> For your page_pool_iov the layout would have to match the offset of
>> pp_magic, to do this. (And if insisting on using PP infra the refcnt
>> would also need to align).
> 
> Perhaps I misunderstand, but this suggests continuing to using
> struct page to demultiplex memory type?
> 

(Perhaps we are misunderstanding each-other and my use of the words 
multiplexing and demultiplex are wrong, I'm sorry, as English isn't my 
native language.)

I do see the problem of depending on having a struct page, as the 
page_pool_iov isn't related to struct page.  Having "page" in the name 
of "page_pool_iov" is also confusing (hardest problem is CS is naming, 
as we all know).

To support more allocator types, perhaps skb->pp_recycle bit need to 
grow another bit (and be renamed skb->recycle), so we can tell allocator 
types apart, those that are page based and those whom are not.


> I think the feedback has been strong to not multiplex yet another
> memory type into that struct, that is not a real page. Which is why
> we went into this direction. This latest series limits the impact largely
> to networking structures and code.
> 

Some what related what I'm objecting to: the "page_pool_iov" is not a 
real page, but this getting recycled into something called "page_pool", 
which funny enough deals with struct-pages internally and depend on the 
struct-page-refcnt.

Given the approach changed way from using struct page, then I also don't 
see the connection with the page_pool. Sorry.

> One way or another, there will be a branch and multiplexing. Whether
> that is in struct page, the page pool or a new netdev mem type as you
> propose.
> 

I'm asking to have this branch/multiplexing done a the call sites.

(IMHO not changing the drivers is a pipe-dream.)

> Any regression in page pool can be avoided in the common case that
> does not use device mem by placing that behind a static_branch. Would
> that address your performance concerns?
> 

No. This will not help.

The problem is that every where in the page_pool code it is getting 
polluted with:

   if (page_is_page_pool_iov(page))
     call-some-iov-func-instead()

Like: the very central piece of getting the refcnt:

+static inline int page_pool_page_ref_count(struct page *page)
+{
+	if (page_is_page_pool_iov(page))
+		return page_pool_iov_refcount(page_to_page_pool_iov(page));
+
+	return page_ref_count(page);
+}


The fast-path of the PP is used for XDP_DROP scenarios, and is currently 
around 14 cycles (tsc). Thus, any extra code in this code patch will 
change the fast-path.


>>
>> On the allocation side, all drivers already use a driver helper
>> page_pool_dev_alloc_pages() or we could add another (better named)
>> helper to multiplex between other types of allocators, e.g. a devmem
>> allocator.
>>
>> On free/return/recycle the functions napi_pp_put_page or skb_pp_recycle
>> could multiplex on pp_magic and call another API.  The API could be an
>> extension to PP helpers, but it could also be a devmap allocator helper.
>>
>> IMHO forcing/piggy-bagging everything into page_pool is not the right
>> solution.  I really think netstack need to support different allocator
>> types.
> 
> To me this is lifting page_pool into such a netstack alloctator pool.
> 

This is should be renamed as it is not longer dealing with pages.

> Not sure adding another explicit layer of indirection would be cleaner
> or faster (potentially more indirect calls).
> 

It seems we are talking past each-other.  The layer of indirection I'm 
talking about is likely a simple header file (e.g. named netmem.h) that 
will get inline compiled so there is no overhead. It will be used by 
driver, such that we can avoid touching driver again when introducing 
new memory allocator types.


> As for the LSB trick: that avoided adding a lot of boilerplate churn
> with new type and helper functions.
> 

Says the lazy programmer :-P ... sorry could not resist ;-)

> 
> 
>> The page pool have been leading the way, yes, but perhaps it is
>> time to add an API layer that e.g. could be named netmem, that gives us
>> the multiplexing between allocators.  In that process some of page_pool
>> APIs would be lifted out as common blocks and others remain.
>>
>> --Jesper
>>
>>> I have a sample implementation of adding a new page_pool_token type
>>> in the page_pool to give a general idea here:
>>> https://github.com/torvalds/linux/commit/3a7628700eb7fd02a117db036003bca50779608d
>>>
>>> Full branch here:
>>> https://github.com/torvalds/linux/compare/master...mina:linux:tcpdevmem-pp-tokens
>>>
>>> (In the branches above, page_pool_iov is called devmem_slice).
>>>
>>> Could also add static_branch to speed up the checks in page_pool_iov
>>> memory providers are being used.
>>>
>>> Signed-off-by: Mina Almasry <almasrymina@google.com>
>>> ---
>>>    include/net/page_pool.h | 74 ++++++++++++++++++++++++++++++++++-
>>>    net/core/page_pool.c    | 85 ++++++++++++++++++++++++++++-------------
>>>    2 files changed, 131 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/include/net/page_pool.h b/include/net/page_pool.h
>>> index 537eb36115ed..f08ca230d68e 100644
>>> --- a/include/net/page_pool.h
>>> +++ b/include/net/page_pool.h
>>> @@ -282,6 +282,64 @@ static inline struct page_pool_iov *page_to_page_pool_iov(struct page *page)
>>>        return NULL;
>>>    }
>>>
>>> +static inline int page_pool_page_ref_count(struct page *page)
>>> +{
>>> +     if (page_is_page_pool_iov(page))
>>> +             return page_pool_iov_refcount(page_to_page_pool_iov(page));
>>> +
>>> +     return page_ref_count(page);
>>> +}
>>> +
>>> +static inline void page_pool_page_get_many(struct page *page,
>>> +                                        unsigned int count)
>>> +{
>>> +     if (page_is_page_pool_iov(page))
>>> +             return page_pool_iov_get_many(page_to_page_pool_iov(page),
>>> +                                           count);
>>> +
>>> +     return page_ref_add(page, count);
>>> +}
>>> +
>>> +static inline void page_pool_page_put_many(struct page *page,
>>> +                                        unsigned int count)
>>> +{
>>> +     if (page_is_page_pool_iov(page))
>>> +             return page_pool_iov_put_many(page_to_page_pool_iov(page),
>>> +                                           count);
>>> +
>>> +     if (count > 1)
>>> +             page_ref_sub(page, count - 1);
>>> +
>>> +     put_page(page);
>>> +}
>>> +
>>> +static inline bool page_pool_page_is_pfmemalloc(struct page *page)
>>> +{
>>> +     if (page_is_page_pool_iov(page))
>>> +             return false;
>>> +
>>> +     return page_is_pfmemalloc(page);
>>> +}
>>> +
>>> +static inline bool page_pool_page_is_pref_nid(struct page *page, int pref_nid)
>>> +{
>>> +     /* Assume page_pool_iov are on the preferred node without actually
>>> +      * checking...
>>> +      *
>>> +      * This check is only used to check for recycling memory in the page
>>> +      * pool's fast paths. Currently the only implementation of page_pool_iov
>>> +      * is dmabuf device memory. It's a deliberate decision by the user to
>>> +      * bind a certain dmabuf to a certain netdev, and the netdev rx queue
>>> +      * would not be able to reallocate memory from another dmabuf that
>>> +      * exists on the preferred node, so, this check doesn't make much sense
>>> +      * in this case. Assume all page_pool_iovs can be recycled for now.
>>> +      */
>>> +     if (page_is_page_pool_iov(page))
>>> +             return true;
>>> +
>>> +     return page_to_nid(page) == pref_nid;
>>> +}
>>> +
>>>    struct page_pool {
>>>        struct page_pool_params p;
>>>
>>> @@ -434,6 +492,9 @@ static inline long page_pool_defrag_page(struct page *page, long nr)
>>>    {
>>>        long ret;
>>>
>>> +     if (page_is_page_pool_iov(page))
>>> +             return -EINVAL;
>>> +
>>>        /* If nr == pp_frag_count then we have cleared all remaining
>>>         * references to the page. No need to actually overwrite it, instead
>>>         * we can leave this to be overwritten by the calling function.
>>> @@ -494,7 +555,12 @@ static inline void page_pool_recycle_direct(struct page_pool *pool,
>>>
>>>    static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
>>>    {
>>> -     dma_addr_t ret = page->dma_addr;
>>> +     dma_addr_t ret;
>>> +
>>> +     if (page_is_page_pool_iov(page))
>>> +             return page_pool_iov_dma_addr(page_to_page_pool_iov(page));
>>> +
>>> +     ret = page->dma_addr;
>>>
>>>        if (PAGE_POOL_DMA_USE_PP_FRAG_COUNT)
>>>                ret |= (dma_addr_t)page->dma_addr_upper << 16 << 16;
>>> @@ -504,6 +570,12 @@ static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
>>>
>>>    static inline void page_pool_set_dma_addr(struct page *page, dma_addr_t addr)
>>>    {
>>> +     /* page_pool_iovs are mapped and their dma-addr can't be modified. */
>>> +     if (page_is_page_pool_iov(page)) {
>>> +             DEBUG_NET_WARN_ON_ONCE(true);
>>> +             return;
>>> +     }
>>> +
>>>        page->dma_addr = addr;
>>>        if (PAGE_POOL_DMA_USE_PP_FRAG_COUNT)
>>>                page->dma_addr_upper = upper_32_bits(addr);
>>> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
>>> index 0a7c08d748b8..20c1f74fd844 100644
>>> --- a/net/core/page_pool.c
>>> +++ b/net/core/page_pool.c
>>> @@ -318,7 +318,7 @@ static struct page *page_pool_refill_alloc_cache(struct page_pool *pool)
>>>                if (unlikely(!page))
>>>                        break;
>>>
>>> -             if (likely(page_to_nid(page) == pref_nid)) {
>>> +             if (likely(page_pool_page_is_pref_nid(page, pref_nid))) {
>>>                        pool->alloc.cache[pool->alloc.count++] = page;
>>>                } else {
>>>                        /* NUMA mismatch;
>>> @@ -363,7 +363,15 @@ static void page_pool_dma_sync_for_device(struct page_pool *pool,
>>>                                          struct page *page,
>>>                                          unsigned int dma_sync_size)
>>>    {
>>> -     dma_addr_t dma_addr = page_pool_get_dma_addr(page);
>>> +     dma_addr_t dma_addr;
>>> +
>>> +     /* page_pool_iov memory provider do not support PP_FLAG_DMA_SYNC_DEV */
>>> +     if (page_is_page_pool_iov(page)) {
>>> +             DEBUG_NET_WARN_ON_ONCE(true);
>>> +             return;
>>> +     }
>>> +
>>> +     dma_addr = page_pool_get_dma_addr(page);
>>>
>>>        dma_sync_size = min(dma_sync_size, pool->p.max_len);
>>>        dma_sync_single_range_for_device(pool->p.dev, dma_addr,
>>> @@ -375,6 +383,12 @@ static bool page_pool_dma_map(struct page_pool *pool, struct page *page)
>>>    {
>>>        dma_addr_t dma;
>>>
>>> +     if (page_is_page_pool_iov(page)) {
>>> +             /* page_pool_iovs are already mapped */
>>> +             DEBUG_NET_WARN_ON_ONCE(true);
>>> +             return true;
>>> +     }
>>> +
>>>        /* Setup DMA mapping: use 'struct page' area for storing DMA-addr
>>>         * since dma_addr_t can be either 32 or 64 bits and does not always fit
>>>         * into page private data (i.e 32bit cpu with 64bit DMA caps)
>>> @@ -398,14 +412,24 @@ static bool page_pool_dma_map(struct page_pool *pool, struct page *page)
>>>    static void page_pool_set_pp_info(struct page_pool *pool,
>>>                                  struct page *page)
>>>    {
>>> -     page->pp = pool;
>>> -     page->pp_magic |= PP_SIGNATURE;
>>> +     if (!page_is_page_pool_iov(page)) {
>>> +             page->pp = pool;
>>> +             page->pp_magic |= PP_SIGNATURE;
>>> +     } else {
>>> +             page_to_page_pool_iov(page)->pp = pool;
>>> +     }
>>> +
>>>        if (pool->p.init_callback)
>>>                pool->p.init_callback(page, pool->p.init_arg);
>>>    }
>>>
>>>    static void page_pool_clear_pp_info(struct page *page)
>>>    {
>>> +     if (page_is_page_pool_iov(page)) {
>>> +             page_to_page_pool_iov(page)->pp = NULL;
>>> +             return;
>>> +     }
>>> +
>>>        page->pp_magic = 0;
>>>        page->pp = NULL;
>>>    }
>>> @@ -615,7 +639,7 @@ static bool page_pool_recycle_in_cache(struct page *page,
>>>                return false;
>>>        }
>>>
>>> -     /* Caller MUST have verified/know (page_ref_count(page) == 1) */
>>> +     /* Caller MUST have verified/know (page_pool_page_ref_count(page) == 1) */
>>>        pool->alloc.cache[pool->alloc.count++] = page;
>>>        recycle_stat_inc(pool, cached);
>>>        return true;
>>> @@ -638,9 +662,10 @@ __page_pool_put_page(struct page_pool *pool, struct page *page,
>>>         * refcnt == 1 means page_pool owns page, and can recycle it.
>>>         *
>>>         * page is NOT reusable when allocated when system is under
>>> -      * some pressure. (page_is_pfmemalloc)
>>> +      * some pressure. (page_pool_page_is_pfmemalloc)
>>>         */
>>> -     if (likely(page_ref_count(page) == 1 && !page_is_pfmemalloc(page))) {
>>> +     if (likely(page_pool_page_ref_count(page) == 1 &&
>>> +                !page_pool_page_is_pfmemalloc(page))) {
>>>                /* Read barrier done in page_ref_count / READ_ONCE */
>>>
>>>                if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
>>> @@ -741,7 +766,8 @@ static struct page *page_pool_drain_frag(struct page_pool *pool,
>>>        if (likely(page_pool_defrag_page(page, drain_count)))
>>>                return NULL;
>>>
>>> -     if (page_ref_count(page) == 1 && !page_is_pfmemalloc(page)) {
>>> +     if (page_pool_page_ref_count(page) == 1 &&
>>> +         !page_pool_page_is_pfmemalloc(page)) {
>>>                if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
>>>                        page_pool_dma_sync_for_device(pool, page, -1);
>>>
>>> @@ -818,9 +844,9 @@ static void page_pool_empty_ring(struct page_pool *pool)
>>>        /* Empty recycle ring */
>>>        while ((page = ptr_ring_consume_bh(&pool->ring))) {
>>>                /* Verify the refcnt invariant of cached pages */
>>> -             if (!(page_ref_count(page) == 1))
>>> +             if (!(page_pool_page_ref_count(page) == 1))
>>>                        pr_crit("%s() page_pool refcnt %d violation\n",
>>> -                             __func__, page_ref_count(page));
>>> +                             __func__, page_pool_page_ref_count(page));
>>>
>>>                page_pool_return_page(pool, page);
>>>        }
>>> @@ -977,19 +1003,24 @@ bool page_pool_return_skb_page(struct page *page, bool napi_safe)
>>>        struct page_pool *pp;
>>>        bool allow_direct;
>>>
>>> -     page = compound_head(page);
>>> +     if (!page_is_page_pool_iov(page)) {
>>> +             page = compound_head(page);
>>>
>>> -     /* page->pp_magic is OR'ed with PP_SIGNATURE after the allocation
>>> -      * in order to preserve any existing bits, such as bit 0 for the
>>> -      * head page of compound page and bit 1 for pfmemalloc page, so
>>> -      * mask those bits for freeing side when doing below checking,
>>> -      * and page_is_pfmemalloc() is checked in __page_pool_put_page()
>>> -      * to avoid recycling the pfmemalloc page.
>>> -      */
>>> -     if (unlikely((page->pp_magic & ~0x3UL) != PP_SIGNATURE))
>>> -             return false;
>>> +             /* page->pp_magic is OR'ed with PP_SIGNATURE after the
>>> +              * allocation in order to preserve any existing bits, such as
>>> +              * bit 0 for the head page of compound page and bit 1 for
>>> +              * pfmemalloc page, so mask those bits for freeing side when
>>> +              * doing below checking, and page_pool_page_is_pfmemalloc() is
>>> +              * checked in __page_pool_put_page() to avoid recycling the
>>> +              * pfmemalloc page.
>>> +              */
>>> +             if (unlikely((page->pp_magic & ~0x3UL) != PP_SIGNATURE))
>>> +                     return false;
>>>
>>> -     pp = page->pp;
>>> +             pp = page->pp;
>>> +     } else {
>>> +             pp = page_to_page_pool_iov(page)->pp;
>>> +     }
>>>
>>>        /* Allow direct recycle if we have reasons to believe that we are
>>>         * in the same context as the consumer would run, so there's
>>> @@ -1273,9 +1304,9 @@ static bool mp_huge_busy(struct mp_huge *hu, unsigned int idx)
>>>
>>>        for (j = 0; j < (1 << MP_HUGE_ORDER); j++) {
>>>                page = hu->page[idx] + j;
>>> -             if (page_ref_count(page) != 1) {
>>> +             if (page_pool_page_ref_count(page) != 1) {
>>>                        pr_warn("Page with ref count %d at %u, %u. Can't safely destory, leaking memory!\n",
>>> -                             page_ref_count(page), idx, j);
>>> +                             page_pool_page_ref_count(page), idx, j);
>>>                        return true;
>>>                }
>>>        }
>>> @@ -1330,7 +1361,7 @@ static struct page *mp_huge_alloc_pages(struct page_pool *pool, gfp_t gfp)
>>>                        continue;
>>>
>>>                if ((page->pp_magic & ~0x3UL) == PP_SIGNATURE ||
>>> -                 page_ref_count(page) != 1) {
>>> +                 page_pool_page_ref_count(page) != 1) {
>>>                        atomic_inc(&mp_huge_ins_b);
>>>                        continue;
>>>                }
>>> @@ -1458,9 +1489,9 @@ static void mp_huge_1g_destroy(struct page_pool *pool)
>>>        free = true;
>>>        for (i = 0; i < MP_HUGE_1G_CNT; i++) {
>>>                page = hu->page + i;
>>> -             if (page_ref_count(page) != 1) {
>>> +             if (page_pool_page_ref_count(page) != 1) {
>>>                        pr_warn("Page with ref count %d at %u. Can't safely destory, leaking memory!\n",
>>> -                             page_ref_count(page), i);
>>> +                             page_pool_page_ref_count(page), i);
>>>                        free = false;
>>>                        break;
>>>                }
>>> @@ -1489,7 +1520,7 @@ static struct page *mp_huge_1g_alloc_pages(struct page_pool *pool, gfp_t gfp)
>>>                page = hu->page + page_i;
>>>
>>>                if ((page->pp_magic & ~0x3UL) == PP_SIGNATURE ||
>>> -                 page_ref_count(page) != 1) {
>>> +                 page_pool_page_ref_count(page) != 1) {
>>>                        atomic_inc(&mp_huge_ins_b);
>>>                        continue;
>>>                }
>>> --
>>> 2.41.0.640.ga95def55d0-goog
>>>
>>
> 

