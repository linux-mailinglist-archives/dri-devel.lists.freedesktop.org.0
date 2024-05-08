Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E438BFC29
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 13:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DA710FB43;
	Wed,  8 May 2024 11:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fWYGDrLD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5533110FB43
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 11:35:47 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a599af16934so1069928666b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 04:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715168145; x=1715772945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Vb7A8NDewpqVb/wyIJ0582aE2qv/3FWwkQEcmRDFW+Y=;
 b=fWYGDrLDrW9wGsYursJjpVE7QS4yJ5wRtgphRDBvVMh3+tRFvJxXQApPpmsEn+WKIh
 YoOqoRuPFokHpsgoYzZ3lcc7WPT1kO8bKpQT0ldqLYP2lRf+wFGazv8yI7NmKRdIxKUr
 vlHzp0Yi+lgDvNFWS64jN4PSDcmG2SB9qOGUF5RMHQXR5HqUHR+l6mR8dyydFaxSPrE9
 6ftLaUp+EbJVCtBkGMqk9yIoEVieeBnUJcSM2mSzNLpV+UHD9Abw2OsfuxV6RIX8X5BL
 1+PU192rKR6j0gBzzdY58vvYU8JQ7yzwm+9iCAuXU+Kd4ZJDbxzsiiumhzmtE6K1QuEL
 ak3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715168145; x=1715772945;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vb7A8NDewpqVb/wyIJ0582aE2qv/3FWwkQEcmRDFW+Y=;
 b=xJLHYzAE/qp4NY2ZIdNnExnjVjl0YEJ2CsLZTR4s0iWyWA/cIsI1j9DJRl6nCfpjaz
 hKpAP0cuovLw1tq35ZASA24Ug3RLqfjbKRBYwxrgZzGhA31xlkHRDsKcbt/S/R3L2ow5
 LG1+xr3/SPlpWCxcj7SBKnvKKPx5NIPvbxh23ZdFFJ8J/FsCyoov3g1UvWtnGQHlTSda
 O4DcyzVzyHrLs0ScdzR9R3Ak43zKEgumNUkizg3kMzF32O/JIlFftqGclm/poGzVprSa
 7F2Df8un32l8YwqBlj0sE32gas4N0+x1QBrrJzjE4v5sRS1rEeIgau0QrrzOBrWuwAR7
 8/fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVViclraICfekKZVig18Neo57UmAJfwXwMBRDNL4qBBmwK1CQ/nevcRCQZL6BYZJT3/u+NHBc+OImXN7JUg1naS67eM3DOzPJcbFsE8dSdg
X-Gm-Message-State: AOJu0Yy8vwHflXvU7isivAgqhpl/vNBM/7X7a0Drra5RmH9M9rjtOrGR
 LmqQsjATn4tlvoCdUAfOP+jpwdFHe2iYVU06ugZPKIsWFV7dpuh6
X-Google-Smtp-Source: AGHT+IFD1CFod5VQ+iswMgBuojxIC5HF11jrNe705xchAqUdklV+Hcoyl3d8HPrZmlieFNMEy7rhLQ==
X-Received: by 2002:a17:906:54c7:b0:a59:9edf:14b6 with SMTP id
 a640c23a62f3a-a59fb9699ccmr154863866b.45.1715168145194; 
 Wed, 08 May 2024 04:35:45 -0700 (PDT)
Received: from [192.168.42.217] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 p25-20020a170906141900b00a55a5384986sm7568868ejc.24.2024.05.08.04.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 04:35:44 -0700 (PDT)
Message-ID: <1e2823db-504b-4829-856f-3f45a45ccada@gmail.com>
Date: Wed, 8 May 2024 12:35:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v8 02/14] net: page_pool: create hooks for
 custom page providers
To: Jason Gunthorpe <jgg@ziepe.ca>, Mina Almasry <almasrymina@google.com>,
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
References: <ZjjHUh1eINPg1wkn@infradead.org>
 <20b1c2d9-0b37-414c-b348-89684c0c0998@gmail.com>
 <20240507161857.GA4718@ziepe.ca> <ZjpVfPqGNfE5N4bl@infradead.org>
 <CAHS8izPH+sRLSiZ7vbrNtRdHrFEf8XQ61XAyHuxRSL9Jjy8YbQ@mail.gmail.com>
 <20240507164838.GG4718@ziepe.ca>
 <0d5da361-cc7b-46e9-a635-9a7a4c208444@gmail.com>
 <20240507175644.GJ4718@ziepe.ca>
 <6a50d01a-b5b9-4699-9d58-94e5f8f81c13@gmail.com>
 <20240507233247.GK4718@ziepe.ca> <Zjsm3vO6rIY_sw5A@phenom.ffwll.local>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <Zjsm3vO6rIY_sw5A@phenom.ffwll.local>
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

On 5/8/24 08:16, Daniel Vetter wrote:
> On Tue, May 07, 2024 at 08:32:47PM -0300, Jason Gunthorpe wrote:
>> On Tue, May 07, 2024 at 08:35:37PM +0100, Pavel Begunkov wrote:
>>> On 5/7/24 18:56, Jason Gunthorpe wrote:
>>>> On Tue, May 07, 2024 at 06:25:52PM +0100, Pavel Begunkov wrote:
>>>>> On 5/7/24 17:48, Jason Gunthorpe wrote:
>>>>>> On Tue, May 07, 2024 at 09:42:05AM -0700, Mina Almasry wrote:
>>>>>>
>>>>>>> 1. Align with devmem TCP to use udmabuf for your io_uring memory. I
>>>>>>> think in the past you said it's a uapi you don't link but in the face
>>>>>>> of this pushback you may want to reconsider.
>>>>>>
>>>>>> dmabuf does not force a uapi, you can acquire your pages however you
>>>>>> want and wrap them up in a dmabuf. No uapi at all.
>>>>>>
>>>>>> The point is that dmabuf already provides ops that do basically what
>>>>>> is needed here. We don't need ops calling ops just because dmabuf's
>>>>>> ops are not understsood or not perfect. Fixup dmabuf.
>>>>>
>>>>> Those ops, for example, are used to efficiently return used buffers
>>>>> back to the kernel, which is uapi, I don't see how dmabuf can be
>>>>> fixed up to cover it.
>>>>
>>>> Sure, but that doesn't mean you can't use dma buf for the other parts
>>>> of the flow. The per-page lifetime is a different topic than the
>>>> refcounting and access of the entire bulk of memory.
>>>
>>> Ok, so if we're leaving uapi (and ops) and keep per page/sub-buffer as
>>> is, the rest is resolving uptr -> pages, and passing it to page pool in
>>> a convenient to page pool format (net_iov).
>>
>> I'm not going to pretend to know about page pool details, but dmabuf
>> is the way to get the bulk of pages into a pool within the net stack's
>> allocator and keep that bulk properly refcounted while.
>>
>> An object like dmabuf is needed for the general case because there are
>> not going to be per-page references or otherwise available.
>>
>> What you seem to want is to alter how the actual allocation flow works
>> from that bulk of memory and delay the free. It seems like a different
>> topic to me, and honestly hacking into the allocator free function
>> seems a bit weird..
> 
> Also I don't see how it's an argument against dma-buf as the interface for

It's not, neither I said it is, but it is an argument against removing
the network's page pool ops.

> all these, because e.g. ttm internally does have a page pool because
> depending upon allocator, that's indeed beneficial. Other drm drivers have
> more buffer-based concepts for opportunistically memory around, usually
> by marking buffers that are just kept as cache as purgeable (which is a
> concept that goes all the way to opengl/vulkan).

Because in this case it solves nothing and helps with nothing, quite
the opposite. Just as well we can ask why NVMe doesn't wrap user pages
into a dmabuf while doing IO.

> But these are all internals of the dma-buf exporter, the dma-buf api users
> don't ever need to care.
> -Sima

-- 
Pavel Begunkov
