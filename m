Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE3194E373
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2024 23:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB9710E013;
	Sun, 11 Aug 2024 21:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l+/cCgLF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4020010E021
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2024 21:50:46 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4281ca54fd3so28252265e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2024 14:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723413044; x=1724017844; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zmy5SX4/jWP7boerv8nNkQKhYLkyFlWX6WV0T42uhIk=;
 b=l+/cCgLFXZxsbj5VXAupm7dcSoVhCo5s49Br+rClGoJTL9EaF9C4Y3c8pkVE9mjA6d
 uq9mt09gXbHES7fimOmSxrJxXecOJY4HQlWaJqcdCN4A0pau2UECAl3nrjA5puUFbFCn
 fhPy20CieMiyYK68np2wmYcCt2v6IHP+GAfxux8c6JlFrLo4FurwSZsedBxNzPAIn+Mg
 YYUPlWh5E6Z3dyqqdTk3t6wwpghs39I9M6DCGpCsjhGspDFuI4w3lN3ZXPx1/td+IBwi
 UVKT6Axw0dq/wUqa0/7OTGrvLsTiMrQhNtVXOVZfiMu7HGCeE1O+vooXLHMbjfCu/90Z
 Do9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723413044; x=1724017844;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zmy5SX4/jWP7boerv8nNkQKhYLkyFlWX6WV0T42uhIk=;
 b=Fj4ykoRFVwLDXf8HkZEmRYaIcQqLf7BCUZzT9qGfqroHUeSXlbwPKaZQYBAqg8JCeH
 dckb1Q7iqYaNzIF9kL7Wx7cikAZVrRK1r2kaZr3wOrNawzrLtULAzLoD7+ZEFWa3MkED
 /GHpYvHKeu6o8r0rFHkwXGIuHQ51MdrUCa3A/Tj+tolO/V5un4N2VWciOYqKB/KeCSKR
 F+e0QqoS3aGSPWRD+exKmBjusx4DrmFThdMySMU96vQZVXDgejeIuQxsaraxkA458SxW
 wJ/ZkrYi1E+SburN+C54lDs/yCwMFyXcw02IO1xvOFCjKtGEoIAAqpaMKe/TVNVbQdUu
 b18g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvOHFwOFTT/Dnh6/awu/aj+DEJs6Ma4/xh2DfQwvHf4x3a9+uMHxBMnblWyCm2R7a7+ukJJW7ejHY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/Iibg/6tT5HKzvPckf7afKxExnYU2j0fPJ4+rhHrfv3TjD4aG
 mLHEFCXKfETH8fBZhKO6wyr33s5lFNPGvkzKmIgOxH9IwLyRXKUk
X-Google-Smtp-Source: AGHT+IFfo5+dE1Jz9ZaN7Mp86F0AFdfQ3J5qxDNb9cWZpuIKnM/ndN7vtT5TpeLfisL5UKGERSXV1w==
X-Received: by 2002:a05:600c:4eca:b0:426:6773:17 with SMTP id
 5b1f17b1804b1-429c3a517e5mr43332115e9.30.1723413044174; 
 Sun, 11 Aug 2024 14:50:44 -0700 (PDT)
Received: from [192.168.42.175] ([85.255.232.227])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429c750ef58sm79243045e9.16.2024.08.11.14.50.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Aug 2024 14:50:43 -0700 (PDT)
Message-ID: <48f3a61f-9e04-4755-b50c-8fae6e6112eb@gmail.com>
Date: Sun, 11 Aug 2024 22:51:13 +0100
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
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izOXwZS-8sfvn3DuT1XWhjc--7-ZLjr8rMn1XHr5F+ckbA@mail.gmail.com>
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

On 8/11/24 03:21, Mina Almasry wrote:
> On Fri, Aug 9, 2024 at 11:52 PM Jakub Kicinski <kuba@kernel.org> wrote:
>>
>> On Fri, 9 Aug 2024 16:45:50 +0100 Pavel Begunkov wrote:
>>>> I think this is good, and it doesn't seem hacky to me, because we can
>>>> check the page_pools of the netdev while we hold rtnl, so we can be
>>>> sure nothing is messing with the pp configuration in the meantime.
>>>> Like you say below it does validate the driver rather than rely on the
>>>> driver saying it's doing the right thing. I'll look into putting this
>>>> in the next version.
>>>
>>> Why not have a flag set by the driver and advertising whether it
>>> supports providers or not, which should be checked for instance in
>>> netdev_rx_queue_restart()? If set, the driver should do the right
>>> thing. That's in addition to a new pp_params flag explicitly telling
>>> if pp should use providers. It's more explicit and feels a little
>>> less hacky.
>>
>> You mean like I suggested in the previous two emails? :)
>>
>> Given how easy the check is to implement, I think it's worth
>> adding as a sanity check. But the flag should be the main API,
>> if the sanity check starts to be annoying we'll ditch it.
> 
> I think we're talking about 2 slightly different flags, AFAIU.>
> Pavel and I are suggesting the driver reports "I support memory
> providers" directly to core (via the queue-api or what not), and we
> check that flag directly in netdev_rx_queue_restart(), and fail
> immediately if the support is not there.

I might've misread Jakub, but yes, I believe it's different. It'd
communicate about support for providers to upper layers, so we can
fail even before attempting to allocate a new queue and init a
page pool.

> Jakub is suggesting a page_pool_params flag which lets the driver
> report "I support memory providers". If the driver doesn't support it
> but core is trying to configure that, then the page_pool_create will
> fail, which will cause the queue API operation
> (ndo_queue_alloc_mem_alloc) to fail, which causes
> netdev_rx_queue_restart() to fail.

And I'm not against this way either if we explicitly get an error
back instead of trying to figure it out post-factum like by
checking the references and possibly reverting the allocation.
Maybe that's where I was confused, and that refcount thing was
suggested as a WARN_ONCE?

FWIW, I think it warrants two flags. The first saying that the
driver supports providers at all:

page_pool_init() {
	if (rxq->mp_params)
		if (!(flags & PP_PROVIDERS_SUPPORTED))
			goto fail;
}

And the second telling whether the driver wants to install
providers for this particular page pool, so if there is a
separate pool for headers we can set it with plain old kernel
pages.

payload_pool = page_pool_create(rqx, PP_PROVIDERS_SUPPORTED);
header_pool = page_pool_create(rqx, PP_PROVIDERS_SUPPORTED |
                                     PP_IGNORE_PROVIDERS);

(or invert the flag). That's assuming page_pool_params::queue is
a generic thing and we don't want to draw equivalence between
it and memory providers.

-- 
Pavel Begunkov
