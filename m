Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F365A94CBBE
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 09:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B13C10E86A;
	Fri,  9 Aug 2024 07:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iWy7JWX6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCD510E86A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 07:56:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 45F2DCE16FE;
 Fri,  9 Aug 2024 07:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952AFC4AF0D;
 Fri,  9 Aug 2024 07:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723190187;
 bh=WciictBvnZZognJdSB//Vkpj36Vtrbm418N+k4gXKM8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iWy7JWX63DlQVy2d0mNGhQfP+E5wTH7yt+zLcJ0XE+/2H7ya+xPuYTTvng2lSdR0P
 fY3FcxC8uU8GMeAkyI60nvRDENoJPGv+KO8RJqpQagYElLNKgByK/OFTroSX355YCs
 LkPyVbDTwM5NLcPamf6V9UY8mS/5OHdlCJ1Bf0Wrzy8CzH4nnoBsnommLbSLYVYa0S
 vit/eTqSx1gLR+UhLsyyqz5moCQu5XrPJ2lKHYZlMNpbvAKOB2UKpjpb3hjS9c0GG8
 efszcgVI6ngSguWbXJ9ztgvoCk8mZPBFojeGqb+x30Hdvr6lK6GLQBG40LF/KOtnNT
 rWCJ8B29HDgmg==
Date: Fri, 9 Aug 2024 08:56:15 +0100
From: Simon Horman <horms@kernel.org>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>,
 Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kaiyuan Zhang <kaiyuanz@google.com>,
 Pavel Begunkov <asml.silence@gmail.com>,
 Willem de Bruijn <willemb@google.com>, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Andreas Larsson <andreas@gaisler.com>,
 Arnd Bergmann <arnd@arndb.de>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@infradead.org>, David Ahern <dsahern@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, David Wei <dw@davidwei.uk>,
 Donald Hunter <donald.hunter@gmail.com>,
 Eric Dumazet <edumazet@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Helge Deller <deller@gmx.de>, Herbert Xu <herbert@gondor.apana.org.au>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Jakub Kicinski <kuba@kernel.org>,
 "James E. J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Matt Turner <mattst88@gmail.com>,
 Nikolay Aleksandrov <razor@blackwall.org>, Paolo Abeni <pabeni@redhat.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Shailend Chand <shailend@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <shuah@kernel.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Taehee Yoo <ap420073@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yunsheng Lin <linyunsheng@huawei.com>
Subject: Re: [PATCH net-next v17 03/14] netdev: support binding dma-buf to
 netdevice
Message-ID: <20240809075615.GD3075665@kernel.org>
References: <20240730022623.98909-4-almasrymina@google.com>
 <5d3c74da-7d44-4b88-8961-60f21f84f0ac@web.de>
 <CAHS8izPxfCv1VMFBK1FahGTjVmUSSfrabgY5y6V+XtaszoHQ4w@mail.gmail.com>
 <9aad36fe-cd4c-4ce5-b4d8-6c8619d10c46@web.de>
 <66b2198686b91_3206cf29453@willemb.c.googlers.com.notmuch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66b2198686b91_3206cf29453@willemb.c.googlers.com.notmuch>
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

On Tue, Aug 06, 2024 at 08:39:34AM -0400, Willem de Bruijn wrote:
> Markus Elfring wrote:
> > >> …
> > >>> +++ b/include/net/devmem.h
> > >>> @@ -0,0 +1,115 @@
> > >> …
> > >>> +#ifndef _NET_DEVMEM_H
> > >>> +#define _NET_DEVMEM_H
> > >> …
> > >>
> > >> I suggest to omit leading underscores from such identifiers.
> > >> https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+or+define+a+reserved+identifier
> > >>
> > >
> > > I was gonna apply this change, but I ack'd existing files and I find
> > > that all of them include leading underscores, including some very
> > > recently added files like net/core/page_pool_priv.h.
> > >
> > > I would prefer to stick to existing conventions if that's OK, unless
> > > there is widespread agreement to the contrary.
> > 
> > Under which circumstances would you become interested to reduce development risks
> > also according to undefined behaviour?
> > https://wiki.sei.cmu.edu/confluence/display/c/CC.+Undefined+Behavior#CC.UndefinedBehavior-ub_106
> 
> This series is following established practice in kernel networking.
> 
> If that conflicts with a C standard, then perhaps that needs to be
> resolved project wide.
> 
> Forcing an individual feature to diverge just brings inconsistency.
> That said, this appears to be inconsistent already.
> 
> Main question is whether this is worth respinning a series already at
> v17 with no more fundamental feedback.

No, from my point of view, it is not.

This really is a trivial and somewhat subjective mater.
I don't think it should hold up a substantial piece of work.
