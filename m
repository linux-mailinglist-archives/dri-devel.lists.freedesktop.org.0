Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 870468C0139
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 17:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D640112F9C;
	Wed,  8 May 2024 15:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aPtHw4rY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF245112FC5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 15:44:27 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-572c65cea55so1711383a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 08:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715183066; x=1715787866; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qQJE9gf7KB48yGwLoojwH5ddpfi3k3r9Ytiu480CbPs=;
 b=aPtHw4rYnJKRM9UFR4dg5+W3tRArXZAVjRLUpc670l9k/mO5YASDrOT6pEX6Q/xvCb
 ETCUCY69+fEDGDfagkiE28cEKH0aRwRF5Uo+F8GdEvhuvb+5u1xaNjy5Q6EKSqpXlZrw
 5VeuoTvwpoBrGzM48VFAOeCaQldHyA/VvIg1TWgs6oY7gi6fCQ+0YmfpCLiSzWF2cdm3
 sXkDbh3+eVsuqb/Cn2ItGGpPZ1yKR0cD5JOoxOtUsdWPpMs962zWyUPpUwXHOsMZPr30
 lf+VHS7aP7r7uzvewUlsdKO5MevCsXwcLJfcd3il4b92rt44qUo8bcZBhLzc6lcMw0cz
 zoaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715183066; x=1715787866;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qQJE9gf7KB48yGwLoojwH5ddpfi3k3r9Ytiu480CbPs=;
 b=l3gvLElCDY9bVmH0UC2geqF2N+5HfGos8t7oPNx90dMZi/CyJVK4IM3hEsoCHrfl36
 QXLq114v3i/kAL/Gd1Nl+FVFLoC7PIK1dxYe1453OZY3fbnSpwH9MhKpPD5qEgxXEfqo
 LJgj6PistpleqJJn3VJzqwSB8TqAWCz0Mi5WINVgXURLVoVGbhbQmdocOo3Xzor/XZ/s
 kUDTXtmjoTF8SZNH2uX16dR+qsKq+sAeiOOO9sbZUfLN10yKly3MT+1DfeWJXqVDgwT2
 i3qUEhelCtP3OJbWmM9woQMKGh7Go3Z4JoAxG7vuZRGwnZBSxbYm2fAE5qmFEA1e0Tou
 I0UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0iVfIYXG38nx1UFwFj02bvob6X7PwV162qwpjSbP/fiBGACo9Xd4lBM17bhTVG5ae/KLnMOA9ADxLewVjsTqXyprHUQorm6/PTqgg9+N5
X-Gm-Message-State: AOJu0YwrrlGtbYRjs/KUXZgtoM2kZZPbF6+dQ5AIuLMQz4M/yFEoGcZ4
 UxlLLNdcXeS9bkTr+f8X/FDdDe0FiumRTK7bW5mvXowQnHQ5Qzqd
X-Google-Smtp-Source: AGHT+IE5Nm674D55fDuDNAiohan1HsOJY3ZoiOdnVUCBNyXk04j1w8UnHxZIePZoq8yZeGceb/9ETQ==
X-Received: by 2002:a05:6402:1bc6:b0:572:e81d:6e70 with SMTP id
 4fb4d7f45d1cf-573328e4e6dmr20330a12.15.1715183065606; 
 Wed, 08 May 2024 08:44:25 -0700 (PDT)
Received: from [192.168.42.40] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 er21-20020a056402449500b005726e5e8765sm7691323edb.3.2024.05.08.08.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 08:44:25 -0700 (PDT)
Message-ID: <6f69694b-4281-45a6-92aa-d9d72b918df2@gmail.com>
Date: Wed, 8 May 2024 16:44:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v8 02/14] net: page_pool: create hooks for
 custom page providers
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Mina Almasry <almasrymina@google.com>,
 Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
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
 Amritha Nambiar <amritha.nambiar@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, Christian Brauner <brauner@kernel.org>,
 Simon Horman <horms@kernel.org>, David Howells <dhowells@redhat.com>,
 Florian Westphal <fw@strlen.de>, Yunsheng Lin <linyunsheng@huawei.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jens Axboe <axboe@kernel.dk>,
 Arseniy Krasnov <avkrasnov@salutedevices.com>,
 Aleksander Lobakin <aleksander.lobakin@intel.com>,
 Michael Lass <bevan@bi-co.net>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Richard Gobert <richardbgobert@gmail.com>,
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Johannes Berg <johannes.berg@intel.com>, Abel Wu <wuyun.abel@bytedance.com>,
 Breno Leitao <leitao@debian.org>, David Wei <dw@davidwei.uk>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
References: <20b1c2d9-0b37-414c-b348-89684c0c0998@gmail.com>
 <20240507161857.GA4718@ziepe.ca> <ZjpVfPqGNfE5N4bl@infradead.org>
 <CAHS8izPH+sRLSiZ7vbrNtRdHrFEf8XQ61XAyHuxRSL9Jjy8YbQ@mail.gmail.com>
 <20240507164838.GG4718@ziepe.ca>
 <0d5da361-cc7b-46e9-a635-9a7a4c208444@gmail.com>
 <20240507175644.GJ4718@ziepe.ca>
 <6a50d01a-b5b9-4699-9d58-94e5f8f81c13@gmail.com>
 <20240507233247.GK4718@ziepe.ca>
 <54830914-1ec9-4312-96ad-423ac0aeb233@gmail.com>
 <20240508142530.GR4718@ziepe.ca>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20240508142530.GR4718@ziepe.ca>
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

On 5/8/24 15:25, Jason Gunthorpe wrote:
> On Wed, May 08, 2024 at 12:30:07PM +0100, Pavel Begunkov wrote:
> 
>>> I'm not going to pretend to know about page pool details, but dmabuf
>>> is the way to get the bulk of pages into a pool within the net stack's
>>> allocator and keep that bulk properly refcounted while.> An object like
>>> dmabuf is needed for the general case because there are
>>> not going to be per-page references or otherwise available.
>>
>> They are already pinned, memory is owned by the provider, io_uring
>> in this case, and it should not be freed circumventing io_uring,
>> and at this stage calling release_pages() is not such a hassle,
>> especially comparing to introducing an additional object.
> 
> Something needs to co-ordinate when the net stack's allocator is done
> with the bulk of pages and when io_uring and do the final
> put_user_page() to free it. DMABUF is not an unreasonable choice for
> this.

When a page pool dies notifies io_uring via the ->destroy callback.
Vise versa, when io_uring wants to terminate zerocopy, it releases
the interface queue, which kills the page pool, ending in
->destroy again.
  
>>> topic to me, and honestly hacking into the allocator free function
>>> seems a bit weird..
>>
>> Do you also think that DMA_BUF_IOCTL_SYNC is a weird hack, because
>> it "delays free" by pinning the dmabuf object and letting the user
>> read memory instead of copying it? I can find many examples
> 
> It seems to me the flow you want is for the driver to allocate a page,
> put it on a rx ring, process it through the netstack, and deliver it
> to io_uring. io_uring would then sit on the allocation until userspace
> it done and return it back to the netstack allocator.

That's right, with a note that "driver allocating a page" is
not a alloc_page() but grabbing a user page/frag  the user
registered beforehand.

> Hooking the free of the netstack allocator and then defering it seems

FWIW, it's not about page pool's ->release_page, it's a slow
path and in an ideal world wouldn't be called outside of tear
down.

> like a weird and indirect way to get there. Why can't io_uring just be
> the entity that does the final free and not mess with the logic
> allocator?

Then the user has to do a syscall (e.g. via io_uring) to return pages,
and there we'd need to care how to put the pages efficiently, i.e.
hitting the page pool's fast path, e.g. by hoping napi is scheduled and
scheduled for the CPU we're running on, or maybe transferring the pages
to the right CPU first.

Compare it with userspace putting pages into a ring, and the allocator
taking from there when needed without any extra synchronisation and
hassle just because it's a sole consumer.

-- 
Pavel Begunkov
