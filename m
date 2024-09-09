Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32915970ABA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 02:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6711510E193;
	Mon,  9 Sep 2024 00:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ymhO0eRO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0ADF10E193
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 00:21:36 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4581cec6079so317061cf.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2024 17:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1725841296; x=1726446096;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+M1qVooEyNPT1gAAftfRiR4Q5Ah3XuHi08JSkLTfyCg=;
 b=ymhO0eROqIKEOCvnqXEgtmBZ5zaZeteartm/1n8RHCZnaf4FHZQrGIBd5YEFO36gyl
 zc2ZZuxQSercWeWJx78nNLH4i8almBWIxeVprxGgULCkB3pdeKhzaqeMX1JxxPxdvsj4
 l9vM2l2bBNeF+eT2sVcozIGSlHkL55SyueIdGxI5OXiSqRqVVDDvA4W3KPFZWtWVM0j2
 F3bz4OyRWK9oWjZlaPEqvz9K7TViX9LsgGsBUHxEOXOGsxFhDC2chQfIbKtsThb4Uuyo
 MBcK7DcwRgxjdlvYlXvELM2P2hjtn7JimxIdJVNYM5YhzH3MVurjDT6TUVlWDh+OxAVL
 hdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725841296; x=1726446096;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+M1qVooEyNPT1gAAftfRiR4Q5Ah3XuHi08JSkLTfyCg=;
 b=jAg+BGOXdfb+OcKWqUhgOgdba9JjDR20EMNW9u5+WvHVU+mW+RExE0jf43BdzFJmA3
 xMw2+dSrhq2xBpOlQqSeGHgBVRLP+XWn1qXUFA5yTY6qWe43ZzcfOE+RJsPHaYUpsU5h
 23Xee4Ps5k0Ch3A+TZBUNbCv90KAlJxNunsT2R92LVQEs9QCyRv3Af+UUVwXxHc/1O90
 L8x7d+x0YzmA4CsXHI5nsR0ZOc77DN7Dv7oJXHMwlJp0xp6fJnGXthvtfVuTVrUiiDT3
 fa8Dxcbz4l9SIA7eSHB9fILOLVHLTDI/wChcr4T+1PSA5AWlQSbGF/UEvyu/zUIASsdF
 1Unw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKQ7APl52lLNlL1qD6Uv3j0TTwveLDl86YToo9Y297ikvqjLjXZatI7Ah/MCJ5bq50kHmGV4gpUVU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmRgqJGoFsAXPCeHKkjS2K91iq9HLlcb+OD7cp26xLh4gX07R5
 V+XPQdvBgOLL1XcbYRBIPeoDOmtT+SWrAPJ1tk0JT+NBnp4tNR9dgxtpC9+iSdmnmC7qOLxRguf
 YvTxQ6fSC8hA2SBmx4yQ5navsodufYwwn3QfF
X-Google-Smtp-Source: AGHT+IHeebo47LrVuqQNlmWSroknDWyh0p2+ySnmSfFMd++vvWmH0RLig1T8xF/sYDtVArFYD/iKIyTthz+4Y2vdWxE=
X-Received: by 2002:ac8:5714:0:b0:456:796b:2fe5 with SMTP id
 d75a77b69052e-4582147fdcamr3000151cf.9.1725841295262; Sun, 08 Sep 2024
 17:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240831004313.3713467-1-almasrymina@google.com>
 <20240831004313.3713467-7-almasrymina@google.com>
 <20240903141948.269e22bb@kernel.org>
In-Reply-To: <20240903141948.269e22bb@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 8 Sep 2024 17:21:23 -0700
Message-ID: <CAHS8izN_6_0VUWJzyXZ60kDjvGpdJv1a=-6mGOURapHdfHbcMQ@mail.gmail.com>
Subject: Re: [PATCH net-next v24 06/13] memory-provider: dmabuf devmem memory
 provider
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
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

On Tue, Sep 3, 2024 at 2:19=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Sat, 31 Aug 2024 00:43:06 +0000 Mina Almasry wrote:
> > diff --git a/include/net/mp_dmabuf_devmem.h b/include/net/mp_dmabuf_dev=
mem.h
> > new file mode 100644
> > index 000000000000..6d1cf2a77f6b
> > --- /dev/null
> > +++ b/include/net/mp_dmabuf_devmem.h
>
> this header can live under net/core/ like netmem_priv.h right?
> devmem internals should be of no interest outside of core networking.
>

Yes, those can be moved under net/core trivially. done.

> In fact the same is true for include/net/devmem.h ?
>

This turned out to be possible, but with a minor moving around of some
helpers. Basically netmem.h included devmem.h to get access to some
devmem internals for some of the net_iov helpers specific to devmem.
Moving these helpers to devmem.h enabled me to keep
include/net/netmem.h but put devmem.h under net/core. Now netmem.h
doesn't need to include devmem.h. I think this is an improvement.

> > +static inline netmem_ref mp_dmabuf_devmem_alloc_netmems(struct page_po=
ol *pool,
> > +                                                     gfp_t gfp)
>
> Please break the lines after the return type if the line gets long:
>
> static inline netmem_ref
> mp_dmabuf_devmem_alloc_netmems(struct page_pool *pool, gfp_t gfp)
>
> Please fix where you can (at least where it cases going over 80 chars)
>

FWIW I use a formatting tool (clang-format) which seems to prefer
breaking in between the args, but I'll fix this manually and wherever
else I notice.

> >       struct_group_tagged(page_pool_params_slow, slow,
> >               struct net_device *netdev;
> > +             struct netdev_rx_queue *queue;
>
> Why set a pointer? It should work but drivers don't usually deal with
> netdev_rx_queue struct directly. struct xdp_rxq_info takes an integer
> queue id, and it serves a somewhat similar function.
>
> Keep in mind that there will be more drivers than core code, so
> convenience for them matters more.
>

Makes sense.

> > +bool mp_dmabuf_devmem_release_page(struct page_pool *pool, netmem_ref =
netmem)
> > +{
> > +     if (WARN_ON_ONCE(!netmem_is_net_iov(netmem)))
> > +             return false;
> > +
> > +     if (WARN_ON_ONCE(atomic_long_read(netmem_get_pp_ref_count_ref(net=
mem)) !=3D
> > +                  1))
>
> something needs factoring out here, to make this line shorter, please..
> either netmem -> net_iov conversion or at least reading of the ref
> count?
>

Ah, sorry I think you pointed this out earlier and I missed applying
it. Should be done in the next iteration.

--
Thanks,
Mina
