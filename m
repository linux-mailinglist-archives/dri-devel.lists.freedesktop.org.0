Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C468FB906
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 18:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D817C10E557;
	Tue,  4 Jun 2024 16:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Cu53B6Jx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2077110E557
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 16:32:03 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-794ac6b5409so410648585a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 09:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1717518723; x=1718123523; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EYr0Y7RICrMaykessJ15jPU9wen2fALKwAvygZWhRiU=;
 b=Cu53B6JxrbeOgsrHkW/yU87RhNAG2+U+mGB7b9RlsME3KOf3gkNmgywLFcw1loSDeF
 yUm3osDKYn+R7Aiv8zlybIp0Ser4PscDS4Rw99ccVLG9fjmIhKfqkRWzhI/xHU4BwclS
 bYb9Cht4GwBC0Jnfq517p9SQ++cNlHQs+VGH7i12BghCx+OjZs6Z6yglgFlJP75LyQ2A
 1s32rcWirsrTVXiO4xtpX8u6UF3M5ucRU6aKEzMIqrH69EjkDYYh/pNQGpvcGH+kDEor
 0GDDYNpSiDwQz5tRPqAh+Pl8DtwYLSS5h18hBhLFZWlElUIu/nol17rdUL47y6FuuXfe
 0zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717518723; x=1718123523;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EYr0Y7RICrMaykessJ15jPU9wen2fALKwAvygZWhRiU=;
 b=X5k0Qz3BIr723LSexEJzLlSMXuIUMb1bDxwOIGm8UzIVhoZqZnQ3KRJSkMzWDIgdVZ
 h54PW9sbQj+Xp2tc6cca+8UwDfsa5My5dIynQPqOKwPsn5UzbFXZCK9OqHkhLiZs8Xfe
 0yILWN/v1d4SmOQN/8Bvw6SJHOGbUBfIKaRQtVQf3hmpMyp+1v6yRvWr6CDKujTrjplB
 +tCLifzCcdGcAR9YIL1K+iFOlg3rRULtoNlHemREkRPcYu5UShwUoM5FkUnMhAwqldcR
 /k87LkAEs8P+f2YXrPEXTN4E4v7kgLYHfv4MmJ9g7c2GfQlDLpjdPvjcTAZ9DfQw60rf
 QQFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQhVMZVXJKXsDim5kMIW4dacriASSDP5vzJkefkMwMOQDzW5omHc7hiEA4hoHuspmUL0otbhDgz0OnCZbrgnbgfxNuSCoxI1SVKRAt8O9R
X-Gm-Message-State: AOJu0YxUwxQWv1UvmJEBzlsIaGfOlzLK1aMsuQtkwyeSEzPdGU9S5AvC
 5Cx+3CAn49UeKcRWVBJ5aUCg506jG8CZ40VUEZRZWZLP5af2cO+9bRe2oGGDDaI=
X-Google-Smtp-Source: AGHT+IHcNJm5ltpG2mf7+3csAwiL5eKctuS7MAmZ+C2lRHB7rHiUktaBSt3TzVqwSkXLa2Nb4dRvUA==
X-Received: by 2002:a05:620a:271a:b0:792:c5c7:e90d with SMTP id
 af79cd13be357-794f5cc687emr1510000185a.49.1717518722779; 
 Tue, 04 Jun 2024 09:32:02 -0700 (PDT)
Received: from ziepe.ca ([128.77.69.89]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7951a7b3314sm48813285a.40.2024.06.04.09.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 09:32:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sEX4o-002rQm-Kw;
 Tue, 04 Jun 2024 13:31:58 -0300
Date: Tue, 4 Jun 2024 13:31:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Mina Almasry <almasrymina@google.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
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
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Subject: Re: [PATCH net-next v10 05/14] netdev: netdevice devmem allocator
Message-ID: <20240604163158.GB21513@ziepe.ca>
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-6-almasrymina@google.com>
 <bea8b8bf1630309bb004f614e4a3c7f684a6acb6.camel@redhat.com>
 <20240604121551.07192993@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604121551.07192993@gandalf.local.home>
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

On Tue, Jun 04, 2024 at 12:15:51PM -0400, Steven Rostedt wrote:
> On Tue, 04 Jun 2024 12:13:15 +0200
> Paolo Abeni <pabeni@redhat.com> wrote:
> 
> > On Thu, 2024-05-30 at 20:16 +0000, Mina Almasry wrote:
> > > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > > index d82f92d7cf9ce..d5fac8edf621d 100644
> > > --- a/net/core/devmem.c
> > > +++ b/net/core/devmem.c
> > > @@ -32,6 +32,14 @@ static void net_devmem_dmabuf_free_chunk_owner(struct gen_pool *genpool,
> > >  	kfree(owner);
> > >  }
> > >  
> > > +static inline dma_addr_t net_devmem_get_dma_addr(const struct net_iov *niov)  
> > 
> > Minor nit: please no 'inline' keyword in c files.
> 
> I'm curious. Is this a networking rule? I use 'inline' in my C code all the
> time.

It mostly comes from Documentation/process/coding-style.rst:

15) The inline disease
----------------------

There appears to be a common misperception that gcc has a magic "make me
faster" speedup option called ``inline``. While the use of inlines can be
appropriate (for example as a means of replacing macros, see Chapter 12), it
very often is not. Abundant use of the inline keyword leads to a much bigger
kernel, which in turn slows the system as a whole down, due to a bigger
icache footprint for the CPU and simply because there is less memory
available for the pagecache. Just think about it; a pagecache miss causes a
disk seek, which easily takes 5 milliseconds. There are a LOT of cpu cycles
that can go into these 5 milliseconds.

A reasonable rule of thumb is to not put inline at functions that have more
than 3 lines of code in them. An exception to this rule are the cases where
a parameter is known to be a compiletime constant, and as a result of this
constantness you *know* the compiler will be able to optimize most of your
function away at compile time. For a good example of this later case, see
the kmalloc() inline function.

Often people argue that adding inline to functions that are static and used
only once is always a win since there is no space tradeoff. While this is
technically correct, gcc is capable of inlining these automatically without
help, and the maintenance issue of removing the inline when a second user
appears outweighs the potential value of the hint that tells gcc to do
something it would have done anyway.

Jason
