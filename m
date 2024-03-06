Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAB487423B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 22:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD691123B0;
	Wed,  6 Mar 2024 21:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="VUy+RA4/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E931123B0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 21:59:28 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a3fb8b0b7acso30835466b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 13:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709762366; x=1710367166;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hlmBc/819XFvfwA5z2rBHWYGDJvaictacNYlJnPI4Mk=;
 b=VUy+RA4/V5qe83Io2DyWmPrbqR6K/qYjo5pMpx6fqWiHf0jxxN6T74uHDy9AW7f5XE
 AHFM7N3/LaPLpZLqOqGkeahSvj4LzE6lhRcqTkjMipq+mSV2FUljkI3fPedH2XeypOWx
 Z7ORlxEIV9Y67k3IeLgWm/BLKZzd8nJDvsnVz0tgH+0UU/KQcNxjW6zT9kvzALv0KgmY
 8Vjdw4g8b5LnMmZCTvxjTTKagtf4SCDZJm5TUSrlVzI88ZOpsJYv05MX/tcYHJomFuNy
 P1+omFOvX38Ci6Fn+IRHyPhVxeEoY11Gxycqlt0jYTBGjkzrYnn6YuazkMia016clDDk
 KAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709762366; x=1710367166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hlmBc/819XFvfwA5z2rBHWYGDJvaictacNYlJnPI4Mk=;
 b=KwtGba0hFMZ0UrUDbHYjVFB5Exfg2BA2jH98Q7iXVMfUo42auRufOcQ5hSAHEmSv3t
 6BxXwTBS+DXRCAOOMjISnW7pjjy6f8YgWuByABOsvT+E4aZyWmD4uThGiuDuI+BTxtGx
 YUBJGU4J7EM5vDMqlwZ+L2zqAWADIK0a5LBEZGycMf8Er41I67qQ3ef66PWqwHfXbkGW
 RaAZcsPO8SSjLkVfvSHQzyUdTtGirkDCXlILj+kJCD3TvOJKXuAyj7kKwyTD1cr2P+Xl
 N4cULMJO7imml4O40Js4eAsMjQ8TQEL3Mym71l+gAEh6eR3b3i+SvUd3G0uXS8SJu1ha
 P77g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+mTGdUZS4hq5/vzgAYG4v/mpyRWqmQuOlVn1WK4d/PMqF37smKrmbn91sXTfOZsdEKqelPbYopIZ8wotH1stq7EMFCDY/o7pgoGGZuLQs
X-Gm-Message-State: AOJu0Yzmhs7dFJJ175dddFBthKGkodqZNF89/IosItLbn14KrSwrsIIx
 uFVYXujdRbtO0wnO0U4g6adzPAz4RGjgGNZRW8qa9xcAUCBJsh1LMKSjwXlU1whRbgXw4NZP3gM
 DGwADvFkrP7BBuLOkkKBc2AloE4ihf60G70/y
X-Google-Smtp-Source: AGHT+IE6m7qPLUP8r6sXf6aZtd3JIe4+T0XFk3y1+GyBwIcJu6x9zI1qVavUs/CKT4NIFWWIF5O7XuTNz5CKNmZCGMw=
X-Received: by 2002:a17:906:180a:b0:a44:d746:b1b5 with SMTP id
 v10-20020a170906180a00b00a44d746b1b5mr8351124eje.30.1709762366112; Wed, 06
 Mar 2024 13:59:26 -0800 (PST)
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-3-almasrymina@google.com>
 <1b57dac2-4b04-4bec-b2d7-d0edb4fcabbc@davidwei.uk>
 <CAHS8izM5O39mnTQ8mhcQE75amDT4G-3vcgozzjcYsAdd_-he1g@mail.gmail.com>
 <417f293a-848e-4eb2-b690-c8696079b452@gmail.com>
 <CAHS8izNPtHb2GnEMviiJTFT_dPxsxgYsNw5V9s-gSC2YnJRPRg@mail.gmail.com>
 <772b9ab0-c6d7-4b13-8e05-44dd312b9879@gmail.com>
In-Reply-To: <772b9ab0-c6d7-4b13-8e05-44dd312b9879@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 6 Mar 2024 13:59:11 -0800
Message-ID: <CAHS8izPzBqz4CzL7Axpfy7uXFDN1F5afyCfEeYnysH5KCjEgcQ@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 02/15] net: page_pool: create hooks for
 custom page providers
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: David Wei <dw@davidwei.uk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, shakeel.butt@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Mar 6, 2024 at 11:14=E2=80=AFAM Pavel Begunkov <asml.silence@gmail.=
com> wrote:
>
> On 3/6/24 17:04, Mina Almasry wrote:
> > On Wed, Mar 6, 2024 at 6:30=E2=80=AFAM Pavel Begunkov <asml.silence@gma=
il.com> wrote:
> >>
> >> On 3/5/24 22:36, Mina Almasry wrote:
> >>> On Tue, Mar 5, 2024 at 1:55=E2=80=AFPM David Wei <dw@davidwei.uk> wro=
te:
> >>>>
> >>>> On 2024-03-04 18:01, Mina Almasry wrote:
> >>>>> +struct memory_provider_ops {
> >>>>> +     int (*init)(struct page_pool *pool);
> >>>>> +     void (*destroy)(struct page_pool *pool);
> >>>>> +     struct page *(*alloc_pages)(struct page_pool *pool, gfp_t gfp=
);
> >>>>> +     bool (*release_page)(struct page_pool *pool, struct page *pag=
e);
> >>>>
> >>>> For ZC Rx we added a scrub() function to memory_provider_ops that is
> >>>> called from page_pool_scrub(). Does TCP devmem not custom behaviour
> >>>> waiting for all netmem_refs to return before destroying the page poo=
l?
> >>>> What happens if e.g. application crashes?
> >>>
> >>> (sorry for the long reply, but he refcounting is pretty complicated t=
o
> >>> explain and I feel like we need to agree on how things currently work=
)
> >>>
> >>> Yeah, the addition of the page_pool_scrub() function is a bit of a
> >>> head scratcher for me. Here is how the (complicated) refcounting work=
s
> >>> for devmem TCP (assuming the driver is not doing its own recycling
> >>> logic which complicates things further):
> >>>
> >>> 1. When a netmem_ref is allocated by the page_pool (from dmabuf or
> >>> page), the netmem_get_pp_ref_count_ref()=3D=3D1 and belongs to the pa=
ge
> >>> pool as long as the netmem is waiting in the pool for driver
> >>> allocation.
> >>>
> >>> 2. When a netmem is allocated by the driver, no refcounting is
> >>> changed, but the ownership of the netmem_get_pp_ref_count_ref() is
> >>> implicitly transferred from the page pool to the driver. i.e. the ref
> >>> now belongs to the driver until an skb is formed.
> >>>
> >>> 3. When the driver forms an skb using skb_rx_add_frag_netmem(), no
> >>> refcounting is changed, but the ownership of the
> >>> netmem_get_pp_ref_count_ref() is transferred from the driver to the
> >>> TCP stack.
> >>>
> >>> 4. When the TCP stack hands the skb to the application, the TCP stack
> >>> obtains an additional refcount, so netmem_get_pp_ref_count_ref()=3D=
=3D2,
> >>> and frees the skb using skb_frag_unref(), which drops the
> >>> netmem_get_pp_ref_count_ref()=3D=3D1.
> >>>
> >>> 5. When the user is done with the skb, the user calls the
> >>> DEVMEM_DONTNEED setsockopt which calls napi_pp_put_netmem() which
> >>> recycles the netmem back to the page pool. This doesn't modify any
> >>> refcounting, but the refcount ownership transfers from the userspace
> >>> back to the page pool, and we're back at step 1.
> >>>
> >>> So all in all netmem can belong either to (a) the page pool, or (b)
> >>> the driver, or (c) the TCP stack, or (d) the application depending on
> >>> where exactly it is in the RX path.
> >>>
> >>> When an application running devmem TCP crashes, the netmem that belon=
g
> >>> to the page pool or driver are not touched, because the page pool is
> >>> not tied to the application in our case really. However, the TCP stac=
k
> >>> notices the devmem socket of the application close, and when it does,
> >>> the TCP stack will:
> >>>
> >>> 1. Free all the skbs in the sockets receive queue. This is not custom
> >>> behavior for devmem TCP, it's just standard for TCP to free all skbs
> >>> waiting to be received by the application.
> >>> 2. The TCP stack will free references that belong to the application.
> >>> Since the application crashed, it will not call the DEVMEM_DONTNEED
> >>> setsockopt, so we need to free those on behalf of the application.
> >>> This is done in this diff:
> >>>
> >>> @@ -2498,6 +2498,15 @@ static void tcp_md5sig_info_free_rcu(struct
> >>> rcu_head *head)
> >>>    void tcp_v4_destroy_sock(struct sock *sk)
> >>>    {
> >>>     struct tcp_sock *tp =3D tcp_sk(sk);
> >>> + __maybe_unused unsigned long index;
> >>> + __maybe_unused void *netmem;
> >>> +
> >>> +#ifdef CONFIG_PAGE_POOL
> >>> + xa_for_each(&sk->sk_user_frags, index, netmem)
> >>> + WARN_ON_ONCE(!napi_pp_put_page((__force netmem_ref)netmem, false));
> >>> +#endif
> >>> +
> >>> + xa_destroy(&sk->sk_user_frags);
> >>>
> >>>     trace_tcp_destroy_sock(sk);
> >>>
> >>> To be honest, I think it makes sense for the TCP stack to be
> >>> responsible for putting the references that belong to it and the
> >>> application. To me, it does not make much sense for the page pool to
> >>> be responsible for putting the reference that belongs to the TCP stac=
k
> >>> or driver via a page_pool_scrub() function, as those references do no=
t
> >>> belong to the page pool really. I'm not sure why there is a diff
> >>> between our use cases here because I'm not an io_uring expert. Why do
> >>> you need to scrub all the references on page pool destruction? Don't
> >>> these belong to non-page pool components like io_uring stack or TCP
> >>> stack ol otherwise?
> >>
> >> That one is about cleaning buffers that are in b/w 4 and 5, i.e.
> >> owned by the user, which devmem does at sock destruction. io_uring
> >> could get by without scrub, dropping user refs while unregistering
> >> ifq, but then it'd need to wait for all requests to finish so there
> >> is no step 4 in the meantime. Might change, can be useful, but it
> >> was much easier to hook into the pp release loop.
> >>
> >> Another concern is who and when can reset ifq / kill pp outside
> >> of io_uring/devmem. I assume it can happen on a whim, which is
> >> hard to handle gracefully.
> >>
> >
> > If this is about dropping application refs in step 4 & step 5, then
> > from devmem TCP perspective it must be done on socket close & skb
> > freeing AFAIU, and not delayed until page_pool destruction.
>
> Right, something in the kernel should take care of it. You temporarily
> attach it to the socket, which is fine. And you could've also stored
> it in the netlink socket or some other object. In case of zcrx io_uring
> impl, it's bound to io_uring, io_uring is responsible for cleaning them
> up. And we do it before __page_pool_destroy, otherwise there would be
> a ref dependency.
>

AFAIU today the page_pool_release() waits until there are no more
pages in flight before calling __page_pool_destroy(), and in existing
use cases it's common for the page_pool to stay alive after
page_pool_destroy() is called until all the skbs waiting in the
receive queue to be recvmsg()'d are received and the page_pool is
freed. I just didn't modify that behavior.

> A side note, attaching to netlink or some other global object sounds
> conceptually better, as once you return a buffer to the user, the
> socket should not have any further business with the buffer. FWIW,
> that better resembles io_uring approach. For example allows to:
>
> recv(sock);
> close(sock);
> process_rx_buffers();
>
> or to return (i.e. DEVMEM_DONTNEED) buffers from different sockets
> in one call. However, I don't think it's important for devmem and
> perhaps more implementation dictated.
>

Hmm I think this may be a sockets vs io_uring difference? For sockets
there is no way to recvmsg() new buffers after the sock close and
there is no way to release buffers to the kernel via the setsockopt()
after the sock close.

But I don't think we need to align on everything here, right? If
page_pool_scrub makes more sense in your use case because the lifetime
of the io_uring buffers is different I don't see any issue with you
extending the ops with page_pool_scrub(), and not define it for the
dmabuf_devmem provider which doesn't need a scrub, right?

> > Think
> > about a stupid or malicious user that does something like:
> >
> > 1. Set up dmabuf binding using netlink api.
> > 2. While (100000):
> > 3.   create devmem TCP socket.
> > 4.   receive some devmem data on TCP socket.
> > 5.   close TCP socket without calling DEVMEM_DONTNEED.
> > 6. clean up dmabuf binding using netlink api.
> >
> > In this case, we need to drop the references in step 5 when the socket
> > is destroyed, so the memory is freed to the page pool and available
> > for the next socket in step 3. We cannot delay the freeing until step
> > 6 when the rx queue is recreated and the page pool is destroyed,
> > otherwise the net_iovs would leak in the loop and eventually the NIC
> > would fail to find available memory. The same bug would be
>
> By "would leak" you probably mean until step 6, right? There are

Yes, sorry I wasn't clear!

> always many ways to shoot yourself in the leg. Even if you clean
> up in 5, the user can just leak the socket and get the same result
> with pp starvation. I see it not as a requirement but rather a
> uapi choice, that's assuming netlink would be cleaned as a normal
> socket when the task exits.
>

Yes, thanks for pointing out. The above was a pathological example
meant to describe the point, but I think this generates a realistic
edge case I may run into production. I don't know if you care about
the specifics, but FWIW we split our userspace into an orchestrator
that allocates dma-bufs and binds them via netlink and the ML
application that creates tcp connections. We do this because then the
orchestrator needs CAP_NET_ADMIN for netlink but the ML applications
do not. If we delay dropping references until page_pool_destroy then
we delay dropping references until the orchestrator exists, i.e. we
risk one ML application crashing, leaving references unfreed, and the
next application (that reuses the buffers) seeing a smaller address
space because the previous application did not get to release them
before crash and so on.

Now of course it's possible to work around this by making sure we
don't reuse bound buffers (when they should be reusable for the same
user), but in general I think in the socket use case it's a bit
unnatural IMO for one socket to leave state behind like this and this
would be a subtlety that the userspace needs to take care of, but like
you said, maybe a uapi or buffer lifetime choice.

> > reproducible with io_uring unless you're creating a new page pool for
> > each new io_uring socket equivalent.
>
> Surely we don't, but it's still the user's responsibility to
> return buffers back. And in case of io_uring buffers returned
> to the user are not attached to a socket, so even the
> scope / lifetime is a bit different.
>

Yes, sorry, without understanding the specifics it seems your lifetime
management is different. IMO it's not an issue if we diverge in this
aspect.

> > But even outside of this, I think it's a bit semantically off to ask
> > the page_pool to drop references that belong to the application IMO,
> > because those references are not the page_pool's.
>
> Completely agree with you, which is why it was in a callback,
> totally controlled by io_uring.
>
> --
> Pavel Begunkov



--=20
Thanks,
Mina
