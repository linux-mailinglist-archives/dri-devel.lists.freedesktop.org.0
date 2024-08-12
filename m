Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 036EA94F747
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 21:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7635D10E292;
	Mon, 12 Aug 2024 19:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C7vvMWWN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9252F10E292
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 19:10:13 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-428fb103724so32572595e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 12:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723489812; x=1724094612; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dw2qFXnXRgKJiSVvCjX/lPvUvUvkH+mP/XGO4aNCSas=;
 b=C7vvMWWNz+x3r4Z4JDsPRgk0IIBcZs0fHtENb7jHpTpRJ0F7ovFZLa725skeHQF2bA
 pQ8iA3aWvmdrx1V3Zfhu/fddj6RNo8rpGZ/oRPO2PWH5r596MmNC32uYf6Sr/CVceGNe
 fdIm+crKlV7VqOTS9aeA6sCSHTHtC5OA/UTzL5YeA0+FUz4expCs2UpGCAkZh1ba+zHE
 MSRT12IMLqy4zKGsOva5eCBnmk8grfqQ7A4WrxZFYsBW3x47cJptjuL6CkiDKXbGVKVm
 PE4bZC3cF9UoxlHyqoyxajLNUG14mqAB2lH49cs91/SZ6gQr9WyhgUzeM+mgpSYlC2XZ
 +FLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723489812; x=1724094612;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dw2qFXnXRgKJiSVvCjX/lPvUvUvkH+mP/XGO4aNCSas=;
 b=NPDrOR90lZoQlZ5qJeqiWm7AbAnVVnzUVmvosGcc8n15tDiesRmz4Cf0hywgG4giKM
 FgPurQZuV7iC/eARnHefF/wke793M6OeWeCVHPNTZ1WjRWNAqFcYx5w8SDtW1u4wnZdF
 xIiEI1WOdAVETAEA+fXAmS3fBSEDFb7jKiPxruyHnSaMAcHDs+m1kgGIWB2iolRouEuD
 Ohn5pjIh6pPMC7HB4IFk61GLriPQvAujPXeru6+D6wTmlyy22xe4b3zn7Dl+cMuj6S2v
 S63orsBCrUjuvWMDd8UkU0oDXQ7lDSltfoc0CC7aPbveWBT1CZ0c33zh3BoWcKNw7pkL
 M7iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLYLO1Cwg2DKJV8ZLLO5+qsw7BCW9rAvNUX5n6DMUh+zR3ykAn+ruL61dYo5RDnyj3plZ/hoRZQj3w/NMzmJQMHreGRTqdsweF3CWerIIP
X-Gm-Message-State: AOJu0YzO24K1UlS1/NaOsfdbnxxcKUaNY6/qm3x3fvPCBrQp55UH10xH
 +wcjuqg7svjs/61TDolh5PUlUvJ/7tYlx1XClh8ZSdBtoutLVVZc
X-Google-Smtp-Source: AGHT+IFzjCqkJqBJOzcSLxiCPvajj/cmbu2AiycUOene9nCPaGrQjb77+1u0EiBM4rzIMP14cbEZmw==
X-Received: by 2002:a05:6000:503:b0:366:ee84:6a77 with SMTP id
 ffacd0b85a97d-3716e3eae68mr409909f8f.3.1723489811616; 
 Mon, 12 Aug 2024 12:10:11 -0700 (PDT)
Received: from [192.168.42.116] ([85.255.232.227])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36e4c36ba5csm8302616f8f.2.2024.08.12.12.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 12:10:11 -0700 (PDT)
Message-ID: <a6747b29-ed79-49d4-9ffe-b62074db1e09@gmail.com>
Date: Mon, 12 Aug 2024 20:10:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v18 07/14] memory-provider: dmabuf devmem memory
 provider
To: Mina Almasry <almasrymina@google.com>, Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>,
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20240805212536.2172174-1-almasrymina@google.com>
 <20240805212536.2172174-8-almasrymina@google.com>
 <20240806135924.5bb65ec7@kernel.org>
 <CAHS8izOA80dxpB9rzOwv7Oe_1w4A7vo5S3c3=uCES8TSnjyzpg@mail.gmail.com>
 <20240808192410.37a49724@kernel.org>
 <CAHS8izMH4UhD+UDYqMjt9d=gu-wpGPQBLyewzVrCWRyoVtQcgA@mail.gmail.com>
 <fc6a8f0a-cdb4-4705-a08f-7033ef15213e@gmail.com>
 <20240809205236.77c959b0@kernel.org>
 <CAHS8izOXwZS-8sfvn3DuT1XWhjc--7-ZLjr8rMn1XHr5F+ckbA@mail.gmail.com>
 <48f3a61f-9e04-4755-b50c-8fae6e6112eb@gmail.com>
 <20240812105732.5d2845e4@kernel.org>
 <CAHS8izPb51gvEHGHeQwWTs4YmimLLamau1c4j=Z4KGM8ZJrx5g@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izPb51gvEHGHeQwWTs4YmimLLamau1c4j=Z4KGM8ZJrx5g@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/12/24 19:55, Mina Almasry wrote:
> On Mon, Aug 12, 2024 at 1:57 PM Jakub Kicinski <kuba@kernel.org> wrote:
>>
>> On Sun, 11 Aug 2024 22:51:13 +0100 Pavel Begunkov wrote:
>>>> I think we're talking about 2 slightly different flags, AFAIU.>
>>>> Pavel and I are suggesting the driver reports "I support memory
>>>> providers" directly to core (via the queue-api or what not), and we
>>>> check that flag directly in netdev_rx_queue_restart(), and fail
>>>> immediately if the support is not there.
>>>
>>> I might've misread Jakub, but yes, I believe it's different. It'd
>>> communicate about support for providers to upper layers, so we can
>>> fail even before attempting to allocate a new queue and init a
>>> page pool.
>>
>> Got it. Since allocating memory happens before stopping traffic
>> I think it's acceptable to stick to a single flag.
>>
>>>> Jakub is suggesting a page_pool_params flag which lets the driver
>>>> report "I support memory providers". If the driver doesn't support it
>>>> but core is trying to configure that, then the page_pool_create will
>>>> fail, which will cause the queue API operation
>>>> (ndo_queue_alloc_mem_alloc) to fail, which causes
>>>> netdev_rx_queue_restart() to fail.
>>>
>>> And I'm not against this way either if we explicitly get an error
>>> back instead of trying to figure it out post-factum like by
>>> checking the references and possibly reverting the allocation.
>>> Maybe that's where I was confused, and that refcount thing was
>>> suggested as a WARN_ONCE?
>>
>> Yup, the refcount (now: check of the page pool list) was meant
>> as a WARN_ONCE() to catch bad drivers.
>>
>>> FWIW, I think it warrants two flags. The first saying that the
>>> driver supports providers at all:
>>>
>>> page_pool_init() {
>>>        if (rxq->mp_params)
>>>                if (!(flags & PP_PROVIDERS_SUPPORTED))
>>>                        goto fail;
>>> }
>>>
>>> And the second telling whether the driver wants to install
>>> providers for this particular page pool, so if there is a
>>> separate pool for headers we can set it with plain old kernel
>>> pages.
>>
>> The implementation of the queue API should be resilient against
>> failures in alloc, and not being MP capable is just a form of
>> alloc failure. I don't see the upside of double-flag.
>>
>>> payload_pool = page_pool_create(rqx, PP_PROVIDERS_SUPPORTED);
>>> header_pool = page_pool_create(rqx, PP_PROVIDERS_SUPPORTED |
>>>                                       PP_IGNORE_PROVIDERS);
>>
>> Also don't see the upside of the explicit "non-capable" flag,
>> but I haven't thought of that. Is there any use?
>>
> 
> There are 2 things we're trying to accomplish:
> 
> 1. Drivers need to be able to say "I support unreadable netmem".
> Failure to report unreadable netmem support should cause the netlink
> API to fail when the user tries to bind dmabuf/io uring memory.
> 
> 2. Drivers need to be able to say "I want a header pool (with readable
> netmem)" or "I want a data pool (potentially with unreadable netmem)".
> 
> Pavel is suggesting implementing both of these in 2 different flags.
> 
> Jakub is suggesting implementing both with 1 flag which says "I can
> support unreadable netmem for this pool" , and guarding against #1
> with a refcount check to detect if a dmabuf pool should have been
> created but wasn't.

That would be iffy IIUC, but I think Jakub just explicitly said
that the refcount trick was just for debugging purposes and not
for gauging errors like "providers are not supported by the driver".

"Yup, the refcount (now: check of the page pool list) was meant
as a WARN_ONCE() to catch bad drivers."


> I prefer Jakub's suggestion, but beware that if we go with Jakub's
> suggestion, we can't WARN_ON when the core-net check fails, because
> it's not a kernel warning. All that's happening is that the user asked
> for dmabuf binding but the driver didn't ask for it (because likely it
> doesn't support it). That's not cause for a warning to be printed in
> the kernel. The netlink API should just fail and return -EOPNOTSUPP or
> something.
-- 
Pavel Begunkov
