Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6348BEAE9
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 19:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EB310F6F8;
	Tue,  7 May 2024 17:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="ZnzumRTT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D63112571
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 17:56:47 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7928c351c6cso291914985a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 10:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1715104606; x=1715709406; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Wu9WbbBrtYOSeavstfMRlNJlMm/0/4MuzUdv+q+e+RU=;
 b=ZnzumRTTDErxwOIhVTLW5AxsonpO0lcS7i6s3mPlxYbOtynMcgDv1+oDz/Ocjw10v7
 Igxv1n47bfI2oxkFTHbuGeObIqu456hyY7X0oBSxiPbJj68+YTa/8TBIuOtlKN0EEjde
 PV0Xeun+zsjgP4o4XvwPF0MHS/ke3Ns2Fsrg4+pHYVKWUGGduVNOQs4zq92xUFokr2P2
 fYbTTXKAkmQVzJhdcLFysjtWQatIX1dOp8kwT6N4OpVcW/9XYk8h8oMLzp5nVa3ZEotK
 5vqzHpJ0LL3jdY6rOImaEvJB6fyyL+0PJxtnb9KjpKOFENZvaDw80aHVQLJXVSdBZO0c
 8MaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715104606; x=1715709406;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wu9WbbBrtYOSeavstfMRlNJlMm/0/4MuzUdv+q+e+RU=;
 b=BuufsGQR0l+d/dhC/Qza9tpHTIjJw8CpWDS3JkRVaN4DEEBEwSSr3FhL0al3VHjoKW
 q5JPjdrOIojNRyaKpgmpd/9XOqP5+yXNQR1nJOUu1HtXTZxrMn4kf0wG/PvcmLDv++pX
 BdFBYvY4kObNXpwDrC6YLzpr3nIPRI/4IBI3uAz3CNOR9UQJc6kNdJ+My43HAnlNeeMM
 hbUwz7lHdR5wxecSKx6Yewz/L10oxXVfdazW1fovYro/kjT6PMDy9dXb/7Fzat1Muq+3
 GuzMUNhyADWBUlkCxEcHRpmyLvh3hSTaBVROVceIG2ZeI0yAuhJsCPaQwrguHtz2JDCT
 U68w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZsUK3aVYG3474rT7XN8J5VhvjzqGDFiZkrsSPuDVnfc4VgHRG/qWgqh+/8BCYSwUwmryjAWOYhQlhKGLlEsq/s1nqb/4q6exTr3fo+MZg
X-Gm-Message-State: AOJu0YwBRhrlOqWQhqli7S9il4Lx4EVX0p4mUjj7qALbgo0Gu+dCGPsM
 +v69QuBPjOL9fIQ6iebGH07DXZ7Ksdb2OZDSCZwLf2lGjlLyCjCs59FnhOI6+NE=
X-Google-Smtp-Source: AGHT+IGCzj6XuEJPrKRVtB6HNDvjYgTlCCuf3Mc1RlNFJ90uDv9nZUQTLULizJXrrgrWoRFfeuAAuA==
X-Received: by 2002:a05:620a:5a4b:b0:790:7345:2791 with SMTP id
 af79cd13be357-792b274eabbmr46464985a.56.1715104606118; 
 Tue, 07 May 2024 10:56:46 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 bm34-20020a05620a19a200b0078ec3aa9cc7sm5127446qkb.25.2024.05.07.10.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 10:56:45 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1s4P3U-00022m-Vn;
 Tue, 07 May 2024 14:56:44 -0300
Date: Tue, 7 May 2024 14:56:44 -0300
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
Message-ID: <20240507175644.GJ4718@ziepe.ca>
References: <20240403002053.2376017-3-almasrymina@google.com>
 <ZjH1QaSSQ98mw158@infradead.org>
 <CAHS8izM0=xc2UhUxhnF_BixuFs5VaDV9W1jbso1K+Rg=35NzeA@mail.gmail.com>
 <ZjjHUh1eINPg1wkn@infradead.org>
 <20b1c2d9-0b37-414c-b348-89684c0c0998@gmail.com>
 <20240507161857.GA4718@ziepe.ca> <ZjpVfPqGNfE5N4bl@infradead.org>
 <CAHS8izPH+sRLSiZ7vbrNtRdHrFEf8XQ61XAyHuxRSL9Jjy8YbQ@mail.gmail.com>
 <20240507164838.GG4718@ziepe.ca>
 <0d5da361-cc7b-46e9-a635-9a7a4c208444@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d5da361-cc7b-46e9-a635-9a7a4c208444@gmail.com>
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

On Tue, May 07, 2024 at 06:25:52PM +0100, Pavel Begunkov wrote:
> On 5/7/24 17:48, Jason Gunthorpe wrote:
> > On Tue, May 07, 2024 at 09:42:05AM -0700, Mina Almasry wrote:
> > 
> > > 1. Align with devmem TCP to use udmabuf for your io_uring memory. I
> > > think in the past you said it's a uapi you don't link but in the face
> > > of this pushback you may want to reconsider.
> > 
> > dmabuf does not force a uapi, you can acquire your pages however you
> > want and wrap them up in a dmabuf. No uapi at all.
> > 
> > The point is that dmabuf already provides ops that do basically what
> > is needed here. We don't need ops calling ops just because dmabuf's
> > ops are not understsood or not perfect. Fixup dmabuf.
> 
> Those ops, for example, are used to efficiently return used buffers
> back to the kernel, which is uapi, I don't see how dmabuf can be
> fixed up to cover it.

Sure, but that doesn't mean you can't use dma buf for the other parts
of the flow. The per-page lifetime is a different topic than the
refcounting and access of the entire bulk of memory.

Jason
