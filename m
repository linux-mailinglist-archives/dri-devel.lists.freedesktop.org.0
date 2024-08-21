Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B1A95A7C9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 00:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC9988EF0;
	Wed, 21 Aug 2024 22:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qVNyim/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54BE88EF0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 22:30:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9D040CE0B7B;
 Wed, 21 Aug 2024 22:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ACDBC32781;
 Wed, 21 Aug 2024 22:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724279452;
 bh=9hM1UR02IR6WK1n9AY+5U6wjkUWO6iL3GULiEkR+LAE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qVNyim/9QotcRj/a4kStDywZY9GIvJPHopig9Y4+y0+EqoIREhXFJXkCl6PnoGAB2
 I/iHlnLZbSl4TYG7HZjEbkGFei+lDhbO/1zgOhMbkXqmQFlVw0lxeAFBtN2KMWogPT
 1S8H9QZ7mCm6sDyYEqHyB1lX2iKxQEe6kkkay/feGO/6jYfxqI9fyFvOGFB6PPf8kS
 LvW1Ua/y5yso7XpM6mcbvSnBkZEMZkr7ONtjBPiGZ5Nvjtvaey01yyHTlEcdsm65b7
 QjnHkd+v6GmK5reTeStHnmg0Uoxag9k0jAqCAx7K5I0FrhauLhjY+G6wM6lsk+vY0I
 8QGRc1kVegb7g==
Date: Wed, 21 Aug 2024 15:30:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: Taehee Yoo <ap420073@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Richard Henderson
 <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>,
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Arnd Bergmann
 <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert
 Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, Willem
 de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Christoph
 Hellwig <hch@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>,
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason
 Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, Shailend
 Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH net-next v19 03/13] netdev: support binding dma-buf to
 netdevice
Message-ID: <20240821153049.7dc983db@kernel.org>
In-Reply-To: <CAHS8izPZ9Jiu9Gj+Kk3cQ_+t22M4n4-mbPLhx+fti_HiWzL57Q@mail.gmail.com>
References: <20240813211317.3381180-4-almasrymina@google.com>
 <CAMArcTWWxjsg_zwS6waWkLpyHhwdXDm_NJeVGm_dr+eT5QDZiA@mail.gmail.com>
 <20240819155257.1148e869@kernel.org>
 <CAHS8izPL4YdqFjkTpYavdxQn816=kkUv0xravQJF4Uno7Bn3ZQ@mail.gmail.com>
 <CAMArcTXvccYBPZTEuW-z=uTK7W67utd9-xjPzfxEOvUWhPS7bg@mail.gmail.com>
 <CAHS8izPZ9Jiu9Gj+Kk3cQ_+t22M4n4-mbPLhx+fti_HiWzL57Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 21 Aug 2024 11:36:31 -0400 Mina Almasry wrote:
> Additionally I'm wondering if we should disable adding mp-bound
> devices as slaves completely, regardless of xdp. My concern is that if
> the lower device is using unreadable memory, then the upper device may
> see unreadable memory in its code paths, and will not be expecting
> that, so it may break.

I could be wrong, but my knee jerk reaction is that from datapath
perspective upper devices are just like any other part of the stack.
They should handle (read: not crash with) unreadable frags. The frags
can be injected in many ways, we can't depend on "lower doesn't do MP"
to catch all the bugs.

XDP is isolated, we can prevent unreadable packets from entering XDP
*completely*. We cannot prevent packets from entering the skb paths.
No?
