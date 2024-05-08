Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C78798C018C
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 17:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC79A10FCA7;
	Wed,  8 May 2024 15:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="kyLcjzIq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12FF10FCA7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 15:58:17 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-69b50b8239fso8750096d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 08:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1715183896; x=1715788696; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fqoHV1aKLMbHVQjAORL2ZSoTVMVXNqsiEWwcIT2cGHs=;
 b=kyLcjzIqipDqd/1mKYUfG67majhO+nf16EnIL7ZOv+yE75JGSsy0/0sRC7qXqJy8sl
 ESwXmbViOhEYws4McunxLf4jUZJwz+mhsEF02i/NpXBT2ZHplntC/uAZ80ChYwCuqvIu
 Z0BmePiwaAmcp0EwIj4GJNUoSHy+itY6ZkRD6ThoNLAfCF3iihYUHMtI57R2LoUSCPQN
 2CNNwyVVzffgUcVInMzFLtPea0W6XpMHEwmHhHELRwfLtCMvEFTzNSaww4KgseoHdOPD
 hv6fP4nYjiqvmhGTy7hFF4o8uYaCMWGXqIefXruYhL1Nd5CeBD76GEDy7AyI65LXB+Nr
 vtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715183896; x=1715788696;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fqoHV1aKLMbHVQjAORL2ZSoTVMVXNqsiEWwcIT2cGHs=;
 b=nI8iqsojMj9W0sQnadn8dxDDd180GjAp1wNHv69NlF3gBS1oFPWggPyb5h1bTYXqsv
 3ywXNTgw/mkdZseaOXXZFCfSuNQINidNaVabZTTBmT96SffefZMNiNM/lMkTP9Hn2mzN
 hMB8/z1VyuXytvsSR01U0vrtSWvglEu2+RJ3KYQT8N7sSLUoWpslu9oNhO8pNq8Vv+0r
 IJZ/CsruU0C43+o/uePffnIc3XXE4NeadPJ+AFdJI4BOUmjWywEmR30xTcCwYFksyplN
 mqmJeTiTHgA4iWtrGHWJIt+PdrJQfdT8I4YGieMOc2dUtsMv9y4i+hku8MLSlvUzimm8
 hqpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1QpI1FYcS4F1MOZnwrHWP2fYNBG1gW5+xKkLK3JGoS7RFpd49380PE0Bfk06ipxMHzjU8I0SsggMEviCUaD1YgSBLDk0OTeNdegzPvN9A
X-Gm-Message-State: AOJu0Yy+jE7CB6RizZqcDLv/79eG5HgNmE9w1RDKjNYjYgomcwuVLDB1
 sEPqrr4x1VwD7lrkQtFyHVXopVhkQkoIUxIw6zqLXdcZKHd3vbDXH341kXLgWXg=
X-Google-Smtp-Source: AGHT+IHoJL5JboSaZtdo3JuvhTrGDECSyt70uMsqmpWZo0ihNDCQjPgANHuq7+Znj7wAL/DbLTGC4Q==
X-Received: by 2002:ad4:5f85:0:b0:6a0:a4db:b297 with SMTP id
 6a1803df08f44-6a15cc4e35amr1166676d6.23.1715183894191; 
 Wed, 08 May 2024 08:58:14 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 pm21-20020ad446d5000000b006a0d057073bsm5684884qvb.58.2024.05.08.08.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 08:58:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1s4jgL-001JCw-43;
 Wed, 08 May 2024 12:58:13 -0300
Date: Wed, 8 May 2024 12:58:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Mina Almasry <almasrymina@google.com>,
 Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Amritha Nambiar <amritha.nambiar@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>,
 Christian Brauner <brauner@kernel.org>, Simon Horman <horms@kernel.org>,
 David Howells <dhowells@redhat.com>, Florian Westphal <fw@strlen.de>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jens Axboe <axboe@kernel.dk>,
 Arseniy Krasnov <avkrasnov@salutedevices.com>,
 Aleksander Lobakin <aleksander.lobakin@intel.com>,
 Michael Lass <bevan@bi-co.net>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Richard Gobert <richardbgobert@gmail.com>,
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Johannes Berg <johannes.berg@intel.com>,
 Abel Wu <wuyun.abel@bytedance.com>,
 Breno Leitao <leitao@debian.org>, David Wei <dw@davidwei.uk>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>
Subject: Re: [RFC PATCH net-next v8 02/14] net: page_pool: create hooks for
 custom page providers
Message-ID: <20240508155813.GS4718@ziepe.ca>
References: <ZjpVfPqGNfE5N4bl@infradead.org>
 <CAHS8izPH+sRLSiZ7vbrNtRdHrFEf8XQ61XAyHuxRSL9Jjy8YbQ@mail.gmail.com>
 <20240507164838.GG4718@ziepe.ca>
 <0d5da361-cc7b-46e9-a635-9a7a4c208444@gmail.com>
 <20240507175644.GJ4718@ziepe.ca>
 <6a50d01a-b5b9-4699-9d58-94e5f8f81c13@gmail.com>
 <20240507233247.GK4718@ziepe.ca>
 <54830914-1ec9-4312-96ad-423ac0aeb233@gmail.com>
 <20240508142530.GR4718@ziepe.ca>
 <6f69694b-4281-45a6-92aa-d9d72b918df2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f69694b-4281-45a6-92aa-d9d72b918df2@gmail.com>
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

On Wed, May 08, 2024 at 04:44:32PM +0100, Pavel Begunkov wrote:

> > like a weird and indirect way to get there. Why can't io_uring just be
> > the entity that does the final free and not mess with the logic
> > allocator?
> 
> Then the user has to do a syscall (e.g. via io_uring) to return pages,
> and there we'd need to care how to put the pages efficiently, i.e.
> hitting the page pool's fast path, e.g. by hoping napi is scheduled and
> scheduled for the CPU we're running on, or maybe transferring the pages
> to the right CPU first.
> 
> Compare it with userspace putting pages into a ring, and the allocator
> taking from there when needed without any extra synchronisation and
> hassle just because it's a sole consumer.

Wow, that sounds a bit terrifying for security, but I guess I can see
your point.

You are replacing the whole allocator logic if you are effectively
putting the free list in userspace memory.

Jason
