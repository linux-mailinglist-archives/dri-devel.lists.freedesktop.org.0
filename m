Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 198E380DBB4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 21:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14EC10E4E7;
	Mon, 11 Dec 2023 20:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F5710E500
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 20:37:18 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3332efd75c9so4491129f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 12:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702327037; x=1702931837; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5mREG4zmhlrjDE364pycILMuHT3yybZyzypq/2nes4o=;
 b=ZXAe/zPsDMlFKR9564tq0WqqgZ70bN/X5Y7HB0jd1+caEu4j/8LOlQx6mOENWcUxvZ
 AEUoHSWIsyjlSrUyIQfPz/o2ucCwjEwGDo1nX7POJuuQaEudDnsoNfAV9a8+z5Zl80L5
 ffQ0nWkMqEjVMa7o7Un3K8jQ+qlkqp4zLeV0xu/QfLCZW80zsDJ2dVlgJqe+ui5IY+A7
 rHSZ73WQPApmTb/pD3+EAqXVwphpQiYVW62P8VlR9Z8RE2y+RxeRpuezBIBZzih28L44
 qfj9mJnQ2PA+MXMyQl2jHkv1zpyaRdTb3yfPbFfmJ0R9dET05VyCKPjF76IM0uqyarzQ
 RC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702327037; x=1702931837;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5mREG4zmhlrjDE364pycILMuHT3yybZyzypq/2nes4o=;
 b=dnx9BzL3YAXuwmZn5u/stwa6L7F/vOjg1l7006MP0KeRR8VbLcMoaw5SPxWRp7+Fp+
 YtJ6zNoEqUK+YP8XSCj9Ire9pLA65mFI8WrAgf4/XlWtVZ08qweZ62y6AX5LDtYU+oub
 D+VffJzAvLBm7E5ZCmP+JmXcZrS20EsDz2efWoFsJtQ2OOpf4PeaPDYlOQlamZVzi1aZ
 XVfF522J7bUo+i1QVF/PplCdu3vq8mUL4e0f3MJIvpy6+3AFmRz6CBL95TmdLlRKlM6A
 LngQhHSvMt4shRG/HsJ8dzahL94oNF9kgw16fazQBZ0JIL+OWPBwnov10EAsilOfdAaV
 tPsw==
X-Gm-Message-State: AOJu0Yzx43ToMKY++yHWIUTPs59ke7b/1msew3iZ8Gjl+fz6/TWoVBL6
 rdP9PNRV4SMncLFzGIE2vic=
X-Google-Smtp-Source: AGHT+IEzTCISh0ruDu6vYmjO9E9rylweqKZzQOVwuAulm2hyYEqdn+X3sTHJGxJeaYXMVcOHEARlYA==
X-Received: by 2002:adf:a198:0:b0:333:38eb:8947 with SMTP id
 u24-20020adfa198000000b0033338eb8947mr1043696wru.275.1702327036762; 
 Mon, 11 Dec 2023 12:37:16 -0800 (PST)
Received: from [192.168.8.100] ([85.255.234.108])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a5d58c4000000b0033333bee379sm9328312wrf.107.2023.12.11.12.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 12:37:16 -0800 (PST)
Message-ID: <661c1bae-d7d3-457e-b545-5f67b9ef4197@gmail.com>
Date: Mon, 11 Dec 2023 20:35:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v1 08/16] memory-provider: dmabuf devmem memory provider
To: Mina Almasry <almasrymina@google.com>
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-9-almasrymina@google.com>
 <b07a4eca-0c3d-4620-9f97-b1d2c76642c2@gmail.com>
 <CAHS8izNVFx6oHoo7y86P8Di9VCVe8A_n_9UZFkg5Wnt=A=YcNQ@mail.gmail.com>
 <b1aea7bc-9627-499a-9bee-d2cc07856978@gmail.com>
 <CAHS8izPry13h49v+PqrmWSREZKZjYpPesxUTyPQy7AGyFwzo4g@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izPry13h49v+PqrmWSREZKZjYpPesxUTyPQy7AGyFwzo4g@mail.gmail.com>
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
Cc: linux-doc@vger.kernel.org, Kaiyuan Zhang <kaiyuanz@google.com>,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Shailend Chand <shailend@google.com>,
 Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/11/23 02:30, Mina Almasry wrote:
> On Sat, Dec 9, 2023 at 7:05 PM Pavel Begunkov <asml.silence@gmail.com> wrote:
>>
>> On 12/8/23 23:25, Mina Almasry wrote:
>>> On Fri, Dec 8, 2023 at 2:56 PM Pavel Begunkov <asml.silence@gmail.com> wrote:
>>>>
>>>> On 12/8/23 00:52, Mina Almasry wrote:
>>> ...
>>>>> +     if (pool->p.queue)
>>>>> +             binding = READ_ONCE(pool->p.queue->binding);
>>>>> +
>>>>> +     if (binding) {
>>>>> +             pool->mp_ops = &dmabuf_devmem_ops;
>>>>> +             pool->mp_priv = binding;
>>>>> +     }
>>>>
>>>> Hmm, I don't understand why would we replace a nice transparent
>>>> api with page pool relying on a queue having devmem specific
>>>> pointer? It seemed more flexible and cleaner in the last RFC.
>>>>
>>>
>>> Jakub requested this change and may chime in, but I suspect it's to
>>> further abstract the devmem changes from driver. In this iteration,
>>> the driver grabs the netdev_rx_queue and passes it to the page_pool,
>>> and any future configurations between the net stack and page_pool can
>>> be passed this way with the driver unbothered.
>>
>> Ok, that makes sense, but even if passed via an rx queue I'd
>> at least hope it keeping abstract provider parameters, e.g.
>> ops, but not hard coded with devmem specific code.
>>
>> It might even be better done with a helper like
>> create_page_pool_from_queue(), unless there is some deeper
>> interaction b/w pp and rx queues is predicted.
>>
> 
> Off hand I don't see the need for a new create_page_pool_from_queue().
> page_pool_create() already takes in a param arg that lets us pass in
> the queue as well as any other params.
> 
>>>>> +
>>>>>         if (pool->mp_ops) {
>>>>>                 err = pool->mp_ops->init(pool);
>>>>>                 if (err) {
>>>>> @@ -1020,3 +1033,77 @@ void page_pool_update_nid(struct page_pool *pool, int new_nid)
>>>>>         }
>>>>>     }
>>>>>     EXPORT_SYMBOL(page_pool_update_nid);
>>>>> +
>>>>> +void __page_pool_iov_free(struct page_pool_iov *ppiov)
>>>>> +{
>>>>> +     if (WARN_ON(ppiov->pp->mp_ops != &dmabuf_devmem_ops))
>>>>> +             return;
>>>>> +
>>>>> +     netdev_free_dmabuf(ppiov);
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(__page_pool_iov_free);
>>>>
>>>> I didn't look too deep but I don't think I immediately follow
>>>> the pp refcounting. It increments pages_state_hold_cnt on
>>>> allocation, but IIUC doesn't mark skbs for recycle? Then, they all
>>>> will be put down via page_pool_iov_put_many() bypassing
>>>> page_pool_return_page() and friends. That will call
>>>> netdev_free_dmabuf(), which doesn't bump pages_state_release_cnt.
>>>>
>>>> At least I couldn't make it work with io_uring, and for my purposes,
>>>> I forced all puts to go through page_pool_return_page(), which calls
>>>> the ->release_page callback. The callback will put the reference and
>>>> ask its page pool to account release_cnt. It also gets rid of
>>>> __page_pool_iov_free(), as we'd need to add a hook there for
>>>> customization otherwise.
>>>>
>>>> I didn't care about overhead because the hot path for me is getting
>>>> buffers from a ring, which is somewhat analogous to sock_devmem_dontneed(),
>>>> but done on pp allocations under napi, and it's done separately.
>>>>
>>>> Completely untested with TCP devmem:
>>>>
>>>> https://github.com/isilence/linux/commit/14bd56605183dc80b540999e8058c79ac92ae2d8
>>>>
>>>
>>> This was a mistake in the last RFC, which should be fixed in v1. In
>>> the RFC I was not marking the skbs as skb_mark_for_recycle(), so the
>>> unreffing path wasn't as expected.
>>>
>>> In this iteration, that should be completely fixed. I suspect since I
>>> just posted this you're actually referring to the issue tested on the
>>> last RFC? Correct me if wrong.
>>
>> Right, it was with RFCv3
>>
>>> In this iteration, the reffing story:
>>>
>>> - memory provider allocs ppiov and returns it to the page pool with
>>> ppiov->refcount == 1.
>>> - The page_pool gives the page to the driver. The driver may
>>> obtain/release references with page_pool_page_[get|put]_many(), but
>>> the driver is likely not doing that unless it's doing its own page
>>> recycling.
>>> - The net stack obtains references via skb_frag_ref() ->
>>> page_pool_page_get_many()
>>> - The net stack drops references via skb_frag_unref() ->
>>> napi_pp_put_page() -> page_pool_return_page() and friends.
>>>
>>> Thus, the issue where the unref path was skipping
>>> page_pool_return_page() and friends should be resolved in this
>>> iteration, let me know if you think otherwise, but I think this was an
>>> issue limited to the last RFC.
>>
>> Then page_pool_iov_put_many() should and supposedly would never be
>> called by non devmap code because all puts must circle back into
>> ->release_page. Why adding it to into page_pool_page_put_many()?
>>
>> @@ -731,6 +731,29 @@ __page_pool_put_page(struct page_pool *pool, struct page *page,
>> +       if (page_is_page_pool_iov(page)) {
>> ...
>> +               page_pool_page_put_many(page, 1);
>> +               return NULL;
>> +       }
>>
>> Well, I'm looking at this new branch from Patch 10, it can put
>> the buffer, but what if we race at it's actually the final put?
>> Looks like nobody is going to to bump up pages_state_release_cnt
>>
> 
> Good catch, I think indeed the release_cnt would be incorrect in this
> case. I think the race is benign in the sense that the ppiov will be
> freed correctly and available for allocation when the page_pool next
> needs it; the issue is with the stats AFAICT.

hold_cnt + release_cnt serves is used for refcounting. In this case
it'll leak the pool when you try to destroy it.


>> If you remove the branch, let it fall into ->release and rely
>> on refcounting there, then the callback could also fix up
>> release_cnt or ask pp to do it, like in the patch I linked above
>>
> 
> Sadly I don't think this is possible due to the reasons I mention in
> the commit message of that patch. Prematurely releasing ppiov and not
> having them be candidates for recycling shows me a 4-5x degradation in
> performance.

I don't think I follow. The concept is to only recycle a buffer (i.e.
make it available for allocation) when its refs drop to zero, which is
IMHO the only way it can work, and IIUC what this patchset is doing.

That's also I suggest to do, but through a slightly different path.
Let's say at some moment there are 2 refs (e.g. 1 for an skb and
1 for userspace/xarray).

Say it first puts the skb:

napi_pp_put_page()
   -> page_pool_return_page()
     -> mp_ops->release_page()
        -> need_to_free = put_buf()
           // not last ref, need_to_free==false,
           // don't recycle, don't increase release_cnt

Then you put the last ref:

page_pool_iov_put_many()
   -> page_pool_return_page()
     -> mp_ops->release_page()
        -> need_to_free = put_buf()
           // last ref, need_to_free==true,
           // recycle and release_cnt++

And that last put can even be recycled right into the
pp / ptr_ring, in which case it doesn't need to touch
release_cnt. Does it make sense? I don't see where
4-5x degradation would come from


> What I could do here is detect that the refcount was dropped to 0 and
> fix up the stats in that case.

-- 
Pavel Begunkov
