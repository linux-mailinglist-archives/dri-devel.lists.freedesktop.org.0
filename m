Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E2080B87A
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 04:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2833110E127;
	Sun, 10 Dec 2023 03:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD5A10E127
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Dec 2023 03:05:02 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40c1e3ea2f2so36402855e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Dec 2023 19:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702177500; x=1702782300; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wxl9nnVIfiBOr8Rw+j4D/uD/Nj3r0oHUhj6QGiUGdeU=;
 b=mOohBVN0Blw7mM6gE/HT3zsANn3fgndKo2DdMFCFnVf5Jqdsh707h1eDisMWE6xViA
 8TW681PZEMKcxYQS06Lxvq0zj5gAOlDxelLNIxIDoaGGel2Y6CRD2F2W1QehueBMkzVM
 J7hf9cADAVGnK5eIbP0IPgI59e5yw73g7RQa+rO3VaT+SmP4dORDUR0Crgm+NbDFB6pq
 DtkmfYB1AQgkXS+kuKHnen2ZXqmKburPmU/oxfwWicKMb4V1HFwuom6uvTP9WFS/FTJq
 p6i72eUANsvAkRAppB9OZRN3h6/Tb52zvKLsy7ebPLK20iVcVH0hRg/3dUylgyeAyIJN
 nr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702177500; x=1702782300;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wxl9nnVIfiBOr8Rw+j4D/uD/Nj3r0oHUhj6QGiUGdeU=;
 b=D9Sj7WhCJS7xjPkL+kGioIscLkkC96CYy9Sl8qgmunfJnbn3DFmKlp3kq86mzPe9XE
 ENwE00Nw/I7x+Vk917AWWn8dS3mXW9m27qdXRJjAFa/aPXIFoQSr4fXeWQtSRjc7tK4O
 BHIV9vTjZ81sx5+dTDpGw9A7zns4caiGeI27JGLDIhg2pboJst/aM/ZT2znJB08lihd2
 6kG4oPA41AmPAfzvJ3UIEV7JH6RNIRU4HujyMZ7m8z5sR7IddjpOMYGlZLbsw6hmDlyV
 9viQuGqciMOJP/ScbULy6WQ7Xd4Y0h+e1/LdJfKzZAzO0j5chcqEhkdXA9ibazCqY6Ov
 ZOog==
X-Gm-Message-State: AOJu0YxhyS4CcEmokUwGEKufHkfepxtptg+fhOoA84V68WzlrOfSgNEx
 AU5RVSv+5zDSaH84OIURouA=
X-Google-Smtp-Source: AGHT+IHJipyQW4yFkljRQowJvIeShM9YAuwDKB6t4bKW0HKwLGG9Hrotr1J6QPfjejCHHrlkaexSCA==
X-Received: by 2002:adf:e282:0:b0:332:ef1e:bb88 with SMTP id
 v2-20020adfe282000000b00332ef1ebb88mr1266810wri.33.1702177500084; 
 Sat, 09 Dec 2023 19:05:00 -0800 (PST)
Received: from [192.168.8.100] ([85.255.236.102])
 by smtp.gmail.com with ESMTPSA id
 fm21-20020a05600c0c1500b0040c03c3289bsm8341129wmb.37.2023.12.09.19.04.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Dec 2023 19:04:59 -0800 (PST)
Message-ID: <b1aea7bc-9627-499a-9bee-d2cc07856978@gmail.com>
Date: Sun, 10 Dec 2023 03:03:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v1 08/16] memory-provider: dmabuf devmem memory provider
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-9-almasrymina@google.com>
 <b07a4eca-0c3d-4620-9f97-b1d2c76642c2@gmail.com>
 <CAHS8izNVFx6oHoo7y86P8Di9VCVe8A_n_9UZFkg5Wnt=A=YcNQ@mail.gmail.com>
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izNVFx6oHoo7y86P8Di9VCVe8A_n_9UZFkg5Wnt=A=YcNQ@mail.gmail.com>
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

On 12/8/23 23:25, Mina Almasry wrote:
> On Fri, Dec 8, 2023 at 2:56 PM Pavel Begunkov <asml.silence@gmail.com> wrote:
>>
>> On 12/8/23 00:52, Mina Almasry wrote:
> ...
>>> +     if (pool->p.queue)
>>> +             binding = READ_ONCE(pool->p.queue->binding);
>>> +
>>> +     if (binding) {
>>> +             pool->mp_ops = &dmabuf_devmem_ops;
>>> +             pool->mp_priv = binding;
>>> +     }
>>
>> Hmm, I don't understand why would we replace a nice transparent
>> api with page pool relying on a queue having devmem specific
>> pointer? It seemed more flexible and cleaner in the last RFC.
>>
> 
> Jakub requested this change and may chime in, but I suspect it's to
> further abstract the devmem changes from driver. In this iteration,
> the driver grabs the netdev_rx_queue and passes it to the page_pool,
> and any future configurations between the net stack and page_pool can
> be passed this way with the driver unbothered.

Ok, that makes sense, but even if passed via an rx queue I'd
at least hope it keeping abstract provider parameters, e.g.
ops, but not hard coded with devmem specific code.

It might even be better done with a helper like
create_page_pool_from_queue(), unless there is some deeper
interaction b/w pp and rx queues is predicted.

>>> +
>>>        if (pool->mp_ops) {
>>>                err = pool->mp_ops->init(pool);
>>>                if (err) {
>>> @@ -1020,3 +1033,77 @@ void page_pool_update_nid(struct page_pool *pool, int new_nid)
>>>        }
>>>    }
>>>    EXPORT_SYMBOL(page_pool_update_nid);
>>> +
>>> +void __page_pool_iov_free(struct page_pool_iov *ppiov)
>>> +{
>>> +     if (WARN_ON(ppiov->pp->mp_ops != &dmabuf_devmem_ops))
>>> +             return;
>>> +
>>> +     netdev_free_dmabuf(ppiov);
>>> +}
>>> +EXPORT_SYMBOL_GPL(__page_pool_iov_free);
>>
>> I didn't look too deep but I don't think I immediately follow
>> the pp refcounting. It increments pages_state_hold_cnt on
>> allocation, but IIUC doesn't mark skbs for recycle? Then, they all
>> will be put down via page_pool_iov_put_many() bypassing
>> page_pool_return_page() and friends. That will call
>> netdev_free_dmabuf(), which doesn't bump pages_state_release_cnt.
>>
>> At least I couldn't make it work with io_uring, and for my purposes,
>> I forced all puts to go through page_pool_return_page(), which calls
>> the ->release_page callback. The callback will put the reference and
>> ask its page pool to account release_cnt. It also gets rid of
>> __page_pool_iov_free(), as we'd need to add a hook there for
>> customization otherwise.
>>
>> I didn't care about overhead because the hot path for me is getting
>> buffers from a ring, which is somewhat analogous to sock_devmem_dontneed(),
>> but done on pp allocations under napi, and it's done separately.
>>
>> Completely untested with TCP devmem:
>>
>> https://github.com/isilence/linux/commit/14bd56605183dc80b540999e8058c79ac92ae2d8
>>
> 
> This was a mistake in the last RFC, which should be fixed in v1. In
> the RFC I was not marking the skbs as skb_mark_for_recycle(), so the
> unreffing path wasn't as expected.
> 
> In this iteration, that should be completely fixed. I suspect since I
> just posted this you're actually referring to the issue tested on the
> last RFC? Correct me if wrong.

Right, it was with RFCv3

> In this iteration, the reffing story:
> 
> - memory provider allocs ppiov and returns it to the page pool with
> ppiov->refcount == 1.
> - The page_pool gives the page to the driver. The driver may
> obtain/release references with page_pool_page_[get|put]_many(), but
> the driver is likely not doing that unless it's doing its own page
> recycling.
> - The net stack obtains references via skb_frag_ref() ->
> page_pool_page_get_many()
> - The net stack drops references via skb_frag_unref() ->
> napi_pp_put_page() -> page_pool_return_page() and friends.
> 
> Thus, the issue where the unref path was skipping
> page_pool_return_page() and friends should be resolved in this
> iteration, let me know if you think otherwise, but I think this was an
> issue limited to the last RFC.

Then page_pool_iov_put_many() should and supposedly would never be
called by non devmap code because all puts must circle back into
->release_page. Why adding it to into page_pool_page_put_many()?

@@ -731,6 +731,29 @@ __page_pool_put_page(struct page_pool *pool, struct page *page,
+	if (page_is_page_pool_iov(page)) {
...
+		page_pool_page_put_many(page, 1);
+		return NULL;
+	}

Well, I'm looking at this new branch from Patch 10, it can put
the buffer, but what if we race at it's actually the final put?
Looks like nobody is going to to bump up pages_state_release_cnt

If you remove the branch, let it fall into ->release and rely
on refcounting there, then the callback could also fix up
release_cnt or ask pp to do it, like in the patch I linked above

-- 
Pavel Begunkov
