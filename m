Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A16D872D08
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 03:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA5110E98F;
	Wed,  6 Mar 2024 02:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4sN3X91M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3A510E98C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 02:54:42 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so195771766b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 18:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709693681; x=1710298481;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eS/C6JRe/LZxR5BB0/jvRViDTj3F8vBSe/WWRgNeFIA=;
 b=4sN3X91MuONnWFP9nv+KYjMQTZxrbnRz/FPBNLMzlggmFfYLstqG/n891z/88mpgQc
 1fbKxXfj4L8VCQ6vnyuQbz7DHFb7UNQqtGW5a49KkcwfW5odS6KYjcTKMMoNUoYL59i9
 cxXNGYq+9xrQ0SBgi2z92RnlJulWTje8zNZdMx12zGTgIW4VYtSVjxrJdSNaBWic0H45
 HJDARl01icNM1vj2E6M+C3YRSHutyx634VE/SsDFsd+Px8oFdNTp/jNVtSBBGnDAAbOx
 YKnxqJP0p8K8yQ5nTyhw5Rlj+1DPoa63iziRGsjiJK26UgilMlGzPeScnUbqtpVxdXEC
 +Ecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709693681; x=1710298481;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eS/C6JRe/LZxR5BB0/jvRViDTj3F8vBSe/WWRgNeFIA=;
 b=myw4fe2Ok19/SnZThMi+azS/94g8EMqukUQ+bgsta2n1gRN2DtAUZPWZUJF0u9TPXr
 SJUxBUHnlL5u4UZQr9sYtA9Tz+lye2Dv60AvFAXVsDIcf/oYUwk12bmMH/FgkJ3moPbv
 HONxeXWEDh0UyAmBPf3+yqSL5G9Z+kIiixpLp7Q8YBqhm/DQtYT8QWd9MIRx937UZQIh
 0y0ruUJM0vrOTYpvMoZcPOWF8PlsXQgI26EKqjPP0P0R4L4K/700AjjKGI8EKKuHbGIb
 AaIYz52tZt0lfWJXntAB9BoG2bzKe8GXp9PSjQqb/9x4kHHfxRUUnuBpU4LLB1rp9Sc/
 yYjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO2u+IdahQQL6r1hjRcAElepHV8eucinTetIFi38YCuPumy3Wtii9vEcCIjktzYN26rDqddbhh4KEBUxvO6XitLz6bSppF5Qyh8uiSDRZs
X-Gm-Message-State: AOJu0YysfjBSemtfgr12rql69K7VTaMhhOhymG158cOS6DwBYV5JJiIV
 xNV3Yl3dzW7+DFKT56FRVp7v2ult72pbueRT3ZSJL82W01GLZAtdzpoYtQc+tEhW/hsYI7iWNu+
 HlJNwOo1lCfnYuBhss0Feg0DsTFutB1maFOc6
X-Google-Smtp-Source: AGHT+IEBCHh5at8F+COR4cGDllSpD2J7JpR+ODcNFG7XI5qKLEW8CmG66IZiYQuqBlnDkixdz9i/+yCx3p+Y4GqdUM0=
X-Received: by 2002:a17:906:4551:b0:a45:270e:3617 with SMTP id
 s17-20020a170906455100b00a45270e3617mr5771839ejq.27.1709693680497; Tue, 05
 Mar 2024 18:54:40 -0800 (PST)
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-10-almasrymina@google.com>
 <383c4870-167f-4123-bbf3-928db1463e01@davidwei.uk>
 <CAHS8izP_PzDJVxycwZe_d_x10-SX4=Q-CWpKTjoOQ5dc2NSn3w@mail.gmail.com>
 <6562b8b0-6cc0-4652-b746-75549801c002@davidwei.uk>
In-Reply-To: <6562b8b0-6cc0-4652-b746-75549801c002@davidwei.uk>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 5 Mar 2024 18:54:28 -0800
Message-ID: <CAHS8izOExbcxNSW8b5UUO=Y2se8ypZfaoyoviQvqR-WVZ=7s-g@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 09/15] memory-provider: dmabuf devmem
 memory provider
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
 Praveen Kaligineedi <pkaligineedi@google.com>,
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

On Tue, Mar 5, 2024 at 6:47=E2=80=AFPM David Wei <dw@davidwei.uk> wrote:
>
> On 2024-03-05 18:42, Mina Almasry wrote:
> > On Tue, Mar 5, 2024 at 6:28=E2=80=AFPM David Wei <dw@davidwei.uk> wrote=
:
> >>
> >> On 2024-03-04 18:01, Mina Almasry wrote:
> >>> +     if (pool->p.queue)
> >>> +             binding =3D READ_ONCE(pool->p.queue->binding);
> >>> +
> >>> +     if (binding) {
> >>> +             pool->mp_ops =3D &dmabuf_devmem_ops;
> >>> +             pool->mp_priv =3D binding;
> >>> +     }
> >>
> >> This is specific to TCP devmem. For ZC Rx we will need something more
> >> generic to let us pass our own memory provider backend down to the pag=
e
> >> pool.
> >>
> >> What about storing ops and priv void ptr in struct netdev_rx_queue
> >> instead? Then we can both use it.
> >
> > Yes, this is dmabuf specific, I was thinking you'd define your own
> > member of netdev_rx_queue, and then add something like this to
> > page_pool_init:
> >
> > +       if (pool->p.queue)
> > +               io_uring_metadata =3D READ_ONCE(pool->p.queue->io_uring=
_metadata);
> > +
> > +       /* We don't support rx-queues that are configured for both
> > io_uring & dmabuf binding */
> > +       BUG_ON(io_uring_metadata && binding);
> > +
> > +       if (io_uring_metadata) {
> > +               pool->mp_ops =3D &io_uring_ops;
> > +               pool->mp_priv =3D io_uring_metadata;
> > +       }
> >
> > I.e., we share the pool->mp_ops and the pool->mp_priv but we don't
> > really need to share the same netdev_rx_queue member. For me it's a
> > dma-buf specific data structure (netdev_dmabuf_binding) and for you
> > it's something else.
>
> This adds size to struct netdev_rx_queue and requires checks on whether
> both are set. There can be thousands of these structs at any one time so
> if we don't need to add size unnecessarily then that would be best.
>
> We can disambiguate by comparing &mp_ops and then cast the void ptr to
> our impl specific objects.
>
> What do you not like about this approach?
>

I was thinking it leaks page_pool specifics into a generic struct
unrelated to the page pool like netdev_rx_queue. My mental model is
that the rx-queue just says that it's bound to a dma-buf/io_uring
unaware of page_pool internals, and the page pool internals figure out
what to do from there.

Currently netdev_rx_queue.h doesn't include net/page_pool/types.h for
example because there is no dependency between netdev_rx_queue &
page_pool, I think this change would add a dependency.

But I concede it does not matter much AFAICT, I can certainly change
the netdev_rx_queue to hold the mp_priv & mp_ops directly and include
net/page_pool/types.h if you prefer that. I'll look into applying this
change in the next iteration if there are no objections.

> >
> > page_pool_init() probably needs to validate that the queue is
> > configured for dma-buf or io_uring but not both. If it's configured
> > for both then the user is doing something funky we shouldn't support.
> >
> > Perhaps I can make the intention clearer by renaming 'binding' to
> > something more specific to dma-buf like queue->dmabuf_binding, to make
> > it clear that this is the dma-buf binding and not some other binding
> > like io_uring?
> >



--=20
Thanks,
Mina
