Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8E98BF1B6
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 01:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BB810EC74;
	Tue,  7 May 2024 23:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="VmpEpwhh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF43C10EC74
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 23:32:49 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-43ad4097aefso11677611cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 16:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1715124768; x=1715729568; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cP7hm5cgGIFObZwmlEXmT4H6ZLJ5hLejs2qh73QUpsY=;
 b=VmpEpwhhUlayDW31pkX+CMqk/KRqlNjvHkEileLorz06OLjfgp3hviq5xbqyM2+ewD
 xFwQCZcDyoH5aXCjdrWH4fQFjHmYZakLn2/RcjtJEuER79P+a3p0oeBtTgv+ts/PkIsm
 /n3ZK5kBRb3HwDwCIViBHrex4usOzzTlfMsjQDyUS+dD0DhT3ZqqrENY+bmGQaCjP/M8
 vKiu+RipGjzBnlEmTVUy4UV+fu/q8qwyiN7wwz5wsu889xBXq+Cvgh8GPhu2tSNQfCAa
 npTYD7fu0y8zFD0zZhAUmoHg2FY0QDnBdLDFSBeoHkCiiK+U4Lg6OeRfay1JMOzLcIgR
 TO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715124768; x=1715729568;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cP7hm5cgGIFObZwmlEXmT4H6ZLJ5hLejs2qh73QUpsY=;
 b=bSjKMj0I1jOn6FKv8wFCVux+6KjVejv+cDEF/HCsOn8s/rZ60sTGt6VVEHncLTKjX5
 qSft/9k3hE/GmHh+j8lpWfLwfWcz8fuiDq3vtH8gdVYIdJfsbFHtRWH9RzTW6Ym1fAnv
 FIHEeS/QxSnUJQwMK+ZZA5MVXTIG/uDrLsXxnNSjbBtR9bQoRsVybFRiw510YxogF7bw
 eAknKaUlWmdN1R14z8Cqpcap2+Cjv0FKfOGHL1IxZjFXenx5WkZCRTR4GQaqCD3iBhHJ
 caWNNL1YBcNCCq7TXA5aiAzBQIbEXfsH6UUIyUUscG3jaMS3coMoMfiFUh8x63z+wMzb
 OZVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn+AJuPbF6+Ur7YR/rdFrvXHy0xxaoJUcFjb4JnMJ9WaZR7OLpy4XH57b38vcB+2kUQai9Z7jv6SSe8LUZ3e6ozxaQn3A5/ZVSd0q72ZhD
X-Gm-Message-State: AOJu0Ywfx36K0gMqI+xj1/3PFfmqq/dKgBDQSNw5uLXG2yEAWdy7+UwQ
 SqBD9s9NR5L5MD9daBPqC7D/VOZQc8zO3RrUZJ7lS9cLgZXyNCSiXPDUm5ngReg=
X-Google-Smtp-Source: AGHT+IHk+yKjIhj9AR797n1JaOj9Z/2rWjQRz+xGELrz6+y3H07eSktk/E/cHfzwS8PtlVFgYI8C4w==
X-Received: by 2002:a05:622a:60c:b0:434:b593:2d25 with SMTP id
 d75a77b69052e-43dbf0b35e3mr10728951cf.66.1715124768502; 
 Tue, 07 May 2024 16:32:48 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 fb20-20020a05622a481400b00434efa0feaasm6953842qtb.1.2024.05.07.16.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 16:32:48 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1s4UIh-0003NT-Cq;
 Tue, 07 May 2024 20:32:47 -0300
Date: Tue, 7 May 2024 20:32:47 -0300
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
Message-ID: <20240507233247.GK4718@ziepe.ca>
References: <CAHS8izM0=xc2UhUxhnF_BixuFs5VaDV9W1jbso1K+Rg=35NzeA@mail.gmail.com>
 <ZjjHUh1eINPg1wkn@infradead.org>
 <20b1c2d9-0b37-414c-b348-89684c0c0998@gmail.com>
 <20240507161857.GA4718@ziepe.ca> <ZjpVfPqGNfE5N4bl@infradead.org>
 <CAHS8izPH+sRLSiZ7vbrNtRdHrFEf8XQ61XAyHuxRSL9Jjy8YbQ@mail.gmail.com>
 <20240507164838.GG4718@ziepe.ca>
 <0d5da361-cc7b-46e9-a635-9a7a4c208444@gmail.com>
 <20240507175644.GJ4718@ziepe.ca>
 <6a50d01a-b5b9-4699-9d58-94e5f8f81c13@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a50d01a-b5b9-4699-9d58-94e5f8f81c13@gmail.com>
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

On Tue, May 07, 2024 at 08:35:37PM +0100, Pavel Begunkov wrote:
> On 5/7/24 18:56, Jason Gunthorpe wrote:
> > On Tue, May 07, 2024 at 06:25:52PM +0100, Pavel Begunkov wrote:
> > > On 5/7/24 17:48, Jason Gunthorpe wrote:
> > > > On Tue, May 07, 2024 at 09:42:05AM -0700, Mina Almasry wrote:
> > > > 
> > > > > 1. Align with devmem TCP to use udmabuf for your io_uring memory. I
> > > > > think in the past you said it's a uapi you don't link but in the face
> > > > > of this pushback you may want to reconsider.
> > > > 
> > > > dmabuf does not force a uapi, you can acquire your pages however you
> > > > want and wrap them up in a dmabuf. No uapi at all.
> > > > 
> > > > The point is that dmabuf already provides ops that do basically what
> > > > is needed here. We don't need ops calling ops just because dmabuf's
> > > > ops are not understsood or not perfect. Fixup dmabuf.
> > > 
> > > Those ops, for example, are used to efficiently return used buffers
> > > back to the kernel, which is uapi, I don't see how dmabuf can be
> > > fixed up to cover it.
> > 
> > Sure, but that doesn't mean you can't use dma buf for the other parts
> > of the flow. The per-page lifetime is a different topic than the
> > refcounting and access of the entire bulk of memory.
> 
> Ok, so if we're leaving uapi (and ops) and keep per page/sub-buffer as
> is, the rest is resolving uptr -> pages, and passing it to page pool in
> a convenient to page pool format (net_iov).

I'm not going to pretend to know about page pool details, but dmabuf
is the way to get the bulk of pages into a pool within the net stack's
allocator and keep that bulk properly refcounted while.

An object like dmabuf is needed for the general case because there are
not going to be per-page references or otherwise available.

What you seem to want is to alter how the actual allocation flow works
from that bulk of memory and delay the free. It seems like a different
topic to me, and honestly hacking into the allocator free function
seems a bit weird..

Jason
