Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC68873CE0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 18:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F1010EB8A;
	Wed,  6 Mar 2024 17:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="GRWIfzfK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E5F10EB8A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 17:05:09 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a452877ddcaso3470366b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 09:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709744707; x=1710349507;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A1xSBjsofT/9pZS7Yx9G3XGpR9XoFLam+fQU7TnybVs=;
 b=GRWIfzfKAxWYWHSB4bv6h/XQDwQCYNTQRUdlwsa0J5gbFc+NWzaBL7AnXQ2WduuB0E
 ihmgNs9K7WMo9rxPOZur2LOJKH8M2thbRx7SAMOBBAM3J4CJvfOWoLAh6VqsLCDji753
 yQiCKu1Lb1xsHhJoW5/XevhO7MnEMnveP+voeTWcgH7wfBZrsYYWC4tCQ+IyQNC+CB2Q
 csbyZxd51W4JUwyZTyV4OJHRlAnb7BwhuZB3SDtl8URtq9Y4bSzO4yHls4VkYgLdrgE/
 6LGhtiN/kH/KZ3oonPnEiPhgzp7GTz25qPjiV2h5apQcM/LbRGNJPcqJO5p97edmmYOl
 F8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709744707; x=1710349507;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A1xSBjsofT/9pZS7Yx9G3XGpR9XoFLam+fQU7TnybVs=;
 b=i+IlXQPJaCdWAGLEkX7y5dq+vNYS0V0SqaeyXREW7YSvYwlbPaYP9O6ovSTp5rHw/P
 F/ZHzEugCI4OMx/hhRu2RM1PFsUlw6UZfhfMIwzXPY3Kllh6s6MVDA6Mr5gpiJM8CrMQ
 xdQy6rjHy9VRTECOKQQcoqgzR04aVwTiNIfa8JUkIDTvICPmXJyiDSj+Zz2ENN81IGsU
 t/GwVp7EJca+6qtQ9uuOgedPRt8rUCByL8eUYVEpLeCEAKLEqIbExI42qHhoGV2B9ewQ
 VrToffJhWMCYJRnxh1kEl7vTudbC4Zc5DVgefU+78BttUvFMExkQ43Z5iYakVNAbSXMT
 jPPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBXbYyEcmXJCKUJEEzlOy7DzKcdIWTLfcZsljTBcl4tb6apu3vdKjwXduyilDHcxvet4HxAMCZH+bMbADAmBsFHfw3d3Mhobaf/M4u9v+g
X-Gm-Message-State: AOJu0Yyv8FrK/Fm9dppY5e1XuUNfHAqfCBbp56JXyKNqKmpR67sWw3hT
 4iEGNPl8hWur+OE3q7IzrSyc6q2atLrJQfI1EZhxFWksnM3JCtavhJCXi+bXDJHqhcovf5g5+Vd
 y5S+AUVAd9Epw9mU5B9F6Aohl1oIuwBitYVH9
X-Google-Smtp-Source: AGHT+IEFAot1sqpMocgXEq0iHPu0SbjnF94L+Z+kSlPfTE1HrQ8kPH2Z8oVY6d8041os4lHMCzDMgHeBjBfnC6a+Now=
X-Received: by 2002:a17:906:b00b:b0:a44:c583:dfc8 with SMTP id
 v11-20020a170906b00b00b00a44c583dfc8mr9370474ejy.48.1709744706904; Wed, 06
 Mar 2024 09:05:06 -0800 (PST)
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-3-almasrymina@google.com>
 <1b57dac2-4b04-4bec-b2d7-d0edb4fcabbc@davidwei.uk>
 <CAHS8izM5O39mnTQ8mhcQE75amDT4G-3vcgozzjcYsAdd_-he1g@mail.gmail.com>
 <417f293a-848e-4eb2-b690-c8696079b452@gmail.com>
In-Reply-To: <417f293a-848e-4eb2-b690-c8696079b452@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 6 Mar 2024 09:04:54 -0800
Message-ID: <CAHS8izNPtHb2GnEMviiJTFT_dPxsxgYsNw5V9s-gSC2YnJRPRg@mail.gmail.com>
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

On Wed, Mar 6, 2024 at 6:30=E2=80=AFAM Pavel Begunkov <asml.silence@gmail.c=
om> wrote:
>
> On 3/5/24 22:36, Mina Almasry wrote:
> > On Tue, Mar 5, 2024 at 1:55=E2=80=AFPM David Wei <dw@davidwei.uk> wrote=
:
> >>
> >> On 2024-03-04 18:01, Mina Almasry wrote:
> >>> +struct memory_provider_ops {
> >>> +     int (*init)(struct page_pool *pool);
> >>> +     void (*destroy)(struct page_pool *pool);
> >>> +     struct page *(*alloc_pages)(struct page_pool *pool, gfp_t gfp);
> >>> +     bool (*release_page)(struct page_pool *pool, struct page *page)=
;
> >>
> >> For ZC Rx we added a scrub() function to memory_provider_ops that is
> >> called from page_pool_scrub(). Does TCP devmem not custom behaviour
> >> waiting for all netmem_refs to return before destroying the page pool?
> >> What happens if e.g. application crashes?
> >
> > (sorry for the long reply, but he refcounting is pretty complicated to
> > explain and I feel like we need to agree on how things currently work)
> >
> > Yeah, the addition of the page_pool_scrub() function is a bit of a
> > head scratcher for me. Here is how the (complicated) refcounting works
> > for devmem TCP (assuming the driver is not doing its own recycling
> > logic which complicates things further):
> >
> > 1. When a netmem_ref is allocated by the page_pool (from dmabuf or
> > page), the netmem_get_pp_ref_count_ref()=3D=3D1 and belongs to the page
> > pool as long as the netmem is waiting in the pool for driver
> > allocation.
> >
> > 2. When a netmem is allocated by the driver, no refcounting is
> > changed, but the ownership of the netmem_get_pp_ref_count_ref() is
> > implicitly transferred from the page pool to the driver. i.e. the ref
> > now belongs to the driver until an skb is formed.
> >
> > 3. When the driver forms an skb using skb_rx_add_frag_netmem(), no
> > refcounting is changed, but the ownership of the
> > netmem_get_pp_ref_count_ref() is transferred from the driver to the
> > TCP stack.
> >
> > 4. When the TCP stack hands the skb to the application, the TCP stack
> > obtains an additional refcount, so netmem_get_pp_ref_count_ref()=3D=3D2=
,
> > and frees the skb using skb_frag_unref(), which drops the
> > netmem_get_pp_ref_count_ref()=3D=3D1.
> >
> > 5. When the user is done with the skb, the user calls the
> > DEVMEM_DONTNEED setsockopt which calls napi_pp_put_netmem() which
> > recycles the netmem back to the page pool. This doesn't modify any
> > refcounting, but the refcount ownership transfers from the userspace
> > back to the page pool, and we're back at step 1.
> >
> > So all in all netmem can belong either to (a) the page pool, or (b)
> > the driver, or (c) the TCP stack, or (d) the application depending on
> > where exactly it is in the RX path.
> >
> > When an application running devmem TCP crashes, the netmem that belong
> > to the page pool or driver are not touched, because the page pool is
> > not tied to the application in our case really. However, the TCP stack
> > notices the devmem socket of the application close, and when it does,
> > the TCP stack will:
> >
> > 1. Free all the skbs in the sockets receive queue. This is not custom
> > behavior for devmem TCP, it's just standard for TCP to free all skbs
> > waiting to be received by the application.
> > 2. The TCP stack will free references that belong to the application.
> > Since the application crashed, it will not call the DEVMEM_DONTNEED
> > setsockopt, so we need to free those on behalf of the application.
> > This is done in this diff:
> >
> > @@ -2498,6 +2498,15 @@ static void tcp_md5sig_info_free_rcu(struct
> > rcu_head *head)
> >   void tcp_v4_destroy_sock(struct sock *sk)
> >   {
> >    struct tcp_sock *tp =3D tcp_sk(sk);
> > + __maybe_unused unsigned long index;
> > + __maybe_unused void *netmem;
> > +
> > +#ifdef CONFIG_PAGE_POOL
> > + xa_for_each(&sk->sk_user_frags, index, netmem)
> > + WARN_ON_ONCE(!napi_pp_put_page((__force netmem_ref)netmem, false));
> > +#endif
> > +
> > + xa_destroy(&sk->sk_user_frags);
> >
> >    trace_tcp_destroy_sock(sk);
> >
> > To be honest, I think it makes sense for the TCP stack to be
> > responsible for putting the references that belong to it and the
> > application. To me, it does not make much sense for the page pool to
> > be responsible for putting the reference that belongs to the TCP stack
> > or driver via a page_pool_scrub() function, as those references do not
> > belong to the page pool really. I'm not sure why there is a diff
> > between our use cases here because I'm not an io_uring expert. Why do
> > you need to scrub all the references on page pool destruction? Don't
> > these belong to non-page pool components like io_uring stack or TCP
> > stack ol otherwise?
>
> That one is about cleaning buffers that are in b/w 4 and 5, i.e.
> owned by the user, which devmem does at sock destruction. io_uring
> could get by without scrub, dropping user refs while unregistering
> ifq, but then it'd need to wait for all requests to finish so there
> is no step 4 in the meantime. Might change, can be useful, but it
> was much easier to hook into the pp release loop.
>
> Another concern is who and when can reset ifq / kill pp outside
> of io_uring/devmem. I assume it can happen on a whim, which is
> hard to handle gracefully.
>

If this is about dropping application refs in step 4 & step 5, then
from devmem TCP perspective it must be done on socket close & skb
freeing AFAIU, and not delayed until page_pool destruction. Think
about a stupid or malicious user that does something like:

1. Set up dmabuf binding using netlink api.
2. While (100000):
3.   create devmem TCP socket.
4.   receive some devmem data on TCP socket.
5.   close TCP socket without calling DEVMEM_DONTNEED.
6. clean up dmabuf binding using netlink api.

In this case, we need to drop the references in step 5 when the socket
is destroyed, so the memory is freed to the page pool and available
for the next socket in step 3. We cannot delay the freeing until step
6 when the rx queue is recreated and the page pool is destroyed,
otherwise the net_iovs would leak in the loop and eventually the NIC
would fail to find available memory. The same bug would be
reproducible with io_uring unless you're creating a new page pool for
each new io_uring socket equivalent.

But even outside of this, I think it's a bit semantically off to ask
the page_pool to drop references that belong to the application IMO,
because those references are not the page_pool's.

> --
> Pavel Begunkov

--=20
Thanks,
Mina
