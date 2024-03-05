Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E92B872A43
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 23:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B50410FAAD;
	Tue,  5 Mar 2024 22:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="GmfQt49V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E4410FAAD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 22:37:15 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-56759dc7ea6so3584108a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 14:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709678234; x=1710283034;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kopREHbBAUxVzUnXNQm6/nygDAEnIt8EnnHpLnLXzJA=;
 b=GmfQt49VCxOGB/P8bgwUU5pWpnyTEVKwGgTwrWTJjfRmI3WQO5ZkhVv/ElQcwIRANk
 KGPMeX16mjD1jkBa23UFMQLtGbwJ7Ed6baLm0qAZZJwkINf2SI/+WH5davHBsHfzhc0g
 Spy31mg7Tg5H5vb9mEmPgVVtc75x6lH8FPSJys/m7Ix9zW/vYHEENELrSrLVf4NbH9jE
 frvQKw+lSeHur1fnzCRLfWn97PiBfQa6tTRaJyu3vE3YDkCmUUXIdsbkCEAkw0/d0MRa
 Lfr3Pypwl0pj6l/OuFOFpGBubKi0R36ylrs6dGPyXqtoyo1fu1xsZOguVd4SBagBjofJ
 dwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709678234; x=1710283034;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kopREHbBAUxVzUnXNQm6/nygDAEnIt8EnnHpLnLXzJA=;
 b=QZ+tm+9EMmXRIh9QqvQdTiAdOOZgdRCMFvBaxN11/i1JJ84Up7hRmYjXAxlBrDz3lE
 9PzJ4nXLVDvSJC45g7jvFHrfsaskqZ6B+UMj5LDjA3TVr9tJQ06QGumnl/U2XXY3aXE8
 TSyyY/qBvD5XIvSkJQJ7kuQx6CcdqvAlxmPlZfWmm5CUa2av2HtEr7xXqrJXoLR/TAWh
 F5Pi3a/ayJkMHO87bhGkNzrib9rI4JGqNXllpadH1LAinPMg4aaUt3z4vx7PqwGdYmgh
 3IQTo/8/mefQHdi/qxleuLF6BCTJiafz50TJFBJVcZST9QZ7SwZGx3skfmYb3zHasmVl
 SyCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbMIiaeeDvhUZM4aIzJ7wVK/EdrHmoUAcZhEww1aFBjUez5l+EUZDQbCxTvMwSgvNbDCcTmeJILxo3JLDNy80U2aaxOlH48DJV43y6f5a/
X-Gm-Message-State: AOJu0Ywx8vzca49WStR67vfMy7rhpfdKlCL+PpElQCdynezmyvOWv0qZ
 NrFl3v0/kTBxo43clR8ID4NFqc0krxEYYpcq7e4ganTInqFqJZUNiyxefqrn/2V/sRCeQgWKcuS
 MyfxXG39k8/8IG+Pm2VMkGjF8TEFV+058WcvZ
X-Google-Smtp-Source: AGHT+IGTQdxh2CmAxYK7k5VXoEK42Hgk/ratOcoNOmaK6LyLSJdLrHbaSwb0N2rAMctN/RrhHCuSioRcZyfCDLP2rf8=
X-Received: by 2002:a17:906:ad8d:b0:a44:a5a:30c5 with SMTP id
 la13-20020a170906ad8d00b00a440a5a30c5mr9648703ejb.41.1709678233378; Tue, 05
 Mar 2024 14:37:13 -0800 (PST)
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-3-almasrymina@google.com>
 <1b57dac2-4b04-4bec-b2d7-d0edb4fcabbc@davidwei.uk>
In-Reply-To: <1b57dac2-4b04-4bec-b2d7-d0edb4fcabbc@davidwei.uk>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 5 Mar 2024 14:36:59 -0800
Message-ID: <CAHS8izM5O39mnTQ8mhcQE75amDT4G-3vcgozzjcYsAdd_-he1g@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 02/15] net: page_pool: create hooks for
 custom page providers
To: David Wei <dw@davidwei.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
 Pavel Begunkov <asml.silence@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
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

On Tue, Mar 5, 2024 at 1:55=E2=80=AFPM David Wei <dw@davidwei.uk> wrote:
>
> On 2024-03-04 18:01, Mina Almasry wrote:
> > +struct memory_provider_ops {
> > +     int (*init)(struct page_pool *pool);
> > +     void (*destroy)(struct page_pool *pool);
> > +     struct page *(*alloc_pages)(struct page_pool *pool, gfp_t gfp);
> > +     bool (*release_page)(struct page_pool *pool, struct page *page);
>
> For ZC Rx we added a scrub() function to memory_provider_ops that is
> called from page_pool_scrub(). Does TCP devmem not custom behaviour
> waiting for all netmem_refs to return before destroying the page pool?
> What happens if e.g. application crashes?

(sorry for the long reply, but he refcounting is pretty complicated to
explain and I feel like we need to agree on how things currently work)

Yeah, the addition of the page_pool_scrub() function is a bit of a
head scratcher for me. Here is how the (complicated) refcounting works
for devmem TCP (assuming the driver is not doing its own recycling
logic which complicates things further):

1. When a netmem_ref is allocated by the page_pool (from dmabuf or
page), the netmem_get_pp_ref_count_ref()=3D=3D1 and belongs to the page
pool as long as the netmem is waiting in the pool for driver
allocation.

2. When a netmem is allocated by the driver, no refcounting is
changed, but the ownership of the netmem_get_pp_ref_count_ref() is
implicitly transferred from the page pool to the driver. i.e. the ref
now belongs to the driver until an skb is formed.

3. When the driver forms an skb using skb_rx_add_frag_netmem(), no
refcounting is changed, but the ownership of the
netmem_get_pp_ref_count_ref() is transferred from the driver to the
TCP stack.

4. When the TCP stack hands the skb to the application, the TCP stack
obtains an additional refcount, so netmem_get_pp_ref_count_ref()=3D=3D2,
and frees the skb using skb_frag_unref(), which drops the
netmem_get_pp_ref_count_ref()=3D=3D1.

5. When the user is done with the skb, the user calls the
DEVMEM_DONTNEED setsockopt which calls napi_pp_put_netmem() which
recycles the netmem back to the page pool. This doesn't modify any
refcounting, but the refcount ownership transfers from the userspace
back to the page pool, and we're back at step 1.

So all in all netmem can belong either to (a) the page pool, or (b)
the driver, or (c) the TCP stack, or (d) the application depending on
where exactly it is in the RX path.

When an application running devmem TCP crashes, the netmem that belong
to the page pool or driver are not touched, because the page pool is
not tied to the application in our case really. However, the TCP stack
notices the devmem socket of the application close, and when it does,
the TCP stack will:

1. Free all the skbs in the sockets receive queue. This is not custom
behavior for devmem TCP, it's just standard for TCP to free all skbs
waiting to be received by the application.
2. The TCP stack will free references that belong to the application.
Since the application crashed, it will not call the DEVMEM_DONTNEED
setsockopt, so we need to free those on behalf of the application.
This is done in this diff:

@@ -2498,6 +2498,15 @@ static void tcp_md5sig_info_free_rcu(struct
rcu_head *head)
 void tcp_v4_destroy_sock(struct sock *sk)
 {
  struct tcp_sock *tp =3D tcp_sk(sk);
+ __maybe_unused unsigned long index;
+ __maybe_unused void *netmem;
+
+#ifdef CONFIG_PAGE_POOL
+ xa_for_each(&sk->sk_user_frags, index, netmem)
+ WARN_ON_ONCE(!napi_pp_put_page((__force netmem_ref)netmem, false));
+#endif
+
+ xa_destroy(&sk->sk_user_frags);

  trace_tcp_destroy_sock(sk);

To be honest, I think it makes sense for the TCP stack to be
responsible for putting the references that belong to it and the
application. To me, it does not make much sense for the page pool to
be responsible for putting the reference that belongs to the TCP stack
or driver via a page_pool_scrub() function, as those references do not
belong to the page pool really. I'm not sure why there is a diff
between our use cases here because I'm not an io_uring expert. Why do
you need to scrub all the references on page pool destruction? Don't
these belong to non-page pool components like io_uring stack or TCP
stack ol otherwise?

--=20
Thanks,
Mina
