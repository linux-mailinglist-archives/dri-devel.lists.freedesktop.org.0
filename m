Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995569074FC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 16:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AE110EAA1;
	Thu, 13 Jun 2024 14:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="vKq2A2Dc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9113510EAA1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 14:18:39 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-57c714a1e24so1106697a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 07:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1718288318; x=1718893118;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2wBzmun2RrCaRgPyNcy89ODI4aX7kCqGzkCYxhF3xnY=;
 b=vKq2A2Dc4QWkdf7dF8/UlSiofImwVQbQGf2CcLyzG40My+hxTETdp8Gb60kKZ7Ku9F
 kbsWoUFOv2htkVLDCVEQxFKI+2Qm1q9bQPG5E2BsHDoORWnEl8RVlYn4ps8cix8zbshd
 AQk9s5jXGB2QmQXjhxxV8AJwE1UoB9D+QhpaWdANEKjNCAR5zhjzZz3j6dXmyL/utWDO
 JPHeVDK5moJ8kvKVzj8Ivggib89xIdXjlkrGTNaTcVt05t05cUgoS+WUIh468U+7p6aP
 czlF76flVi8wEsgOBJWHqLyYOq6obOI1agXLa4oKZ4vUBlrJQi0u11+YF/EnMTavbh8L
 ybOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718288318; x=1718893118;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2wBzmun2RrCaRgPyNcy89ODI4aX7kCqGzkCYxhF3xnY=;
 b=EMZYGgrrUpAcqhQ6ER5u7l4Q8YWlQiQeywkwlb5M9IxDl2+UmUVdXkE2CskDSyju/M
 3OoMXeSeAwqag1SvSK1eP4Ze5lQZAZuhO3Iw1ZKwShp/mtQ3rVUXHtZJvnOncoCeh3gL
 9S8o8K+HUo6fo9KLVAfTJW6wDYuG8kxg2PvEL7CqPPES1EnKdpjtJZfstrOxTTaVRiKa
 jRh6leULroFKdaVYUuTKUowG8YLFLpYZBZbrVcmYJHhQXdUw/5o2cNki0qZmDNovDlVI
 mpyhaYGd3xVrCafofZIcFyEEFoIKVISqbweXrGx51386iXbXKSk9tS31kY4z8WbYB++F
 6vng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIQU37zBcsYaspcPL5GIjagIVOk+UC3EdUL2Fn3TsccDkNBsoaa9OkPIjxggMQs+YZuJOE1FfzOLFq/afvBCal3X8ZhmBsKmOV+ExXIPcM
X-Gm-Message-State: AOJu0YzEhJhlgWeK3BtyB4b98NvMHdukEOfZm47vu4QWi4DQEMZ3Wpxh
 HvF2wWhVNkqAtm5pXqWaOCmfBLq1PJPTh9lRKAu+m7hAuF+tgUID8DCTyI+DsN5HOD2HKrexRDg
 RtP9X0xSLHT3vy+Yy/LBp3XDS9VIAoSC88RYa
X-Google-Smtp-Source: AGHT+IGGR91TbvvdCO5M/lcoYEexAy68BO6MkHDSEDuQZJK4BYVHQSKOXB6UDTw4lBZYreUPv3qYPyzkPkZtS6UL4po=
X-Received: by 2002:a17:907:94d1:b0:a6f:4bd5:16bb with SMTP id
 a640c23a62f3a-a6f4bd51782mr329005366b.56.1718288317233; Thu, 13 Jun 2024
 07:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240613013557.1169171-1-almasrymina@google.com>
 <20240613013557.1169171-6-almasrymina@google.com>
 <322e7317-61dc-4f1e-8706-7db6f5f7a030@bp.renesas.com>
In-Reply-To: <322e7317-61dc-4f1e-8706-7db6f5f7a030@bp.renesas.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 13 Jun 2024 07:18:23 -0700
Message-ID: <CAHS8izO6T-CSgdfGFw8nMu1EMLz7ZOa_t9v+YCO8jXEM_=iT7A@mail.gmail.com>
Subject: Re: [PATCH net-next v12 05/13] page_pool: convert to use netmem
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Andreas Larsson <andreas@gaisler.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
 Nikolay Aleksandrov <razor@blackwall.org>,
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
 Praveen Kaligineedi <pkaligineedi@google.com>, linux-mm@kvack.org, 
 Matthew Wilcox <willy@infradead.org>
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

On Thu, Jun 13, 2024 at 1:36=E2=80=AFAM Paul Barker
<paul.barker.ct@bp.renesas.com> wrote:
>
> On 13/06/2024 02:35, Mina Almasry wrote:
> > Abstrace the memory type from the page_pool so we can later add support
>
> s/Abstrace/Abstract/
>

Thanks, will do.

> > for new memory types. Convert the page_pool to use the new netmem type
> > abstraction, rather than use struct page directly.
> >
> > As of this patch the netmem type is a no-op abstraction: it's always a
> > struct page underneath. All the page pool internals are converted to
> > use struct netmem instead of struct page, and the page pool now exports
> > 2 APIs:
> >
> > 1. The existing struct page API.
> > 2. The new struct netmem API.
> >
> > Keeping the existing API is transitional; we do not want to refactor al=
l
> > the current drivers using the page pool at once.
> >
> > The netmem abstraction is currently a no-op. The page_pool uses
> > page_to_netmem() to convert allocated pages to netmem, and uses
> > netmem_to_page() to convert the netmem back to pages to pass to mm APIs=
,
> >
> > Follow up patches to this series add non-paged netmem support to the
> > page_pool. This change is factored out on its own to limit the code
> > churn to this 1 patch, for ease of code review.
> >
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> >
> > ---
> >
> > v12:
> > - Fix allmodconfig build error. Very recently renesas/ravb_main.c added
> >   a dependency on page_pool that I missed in my rebase. The dependency
> >   calls page_pool_alloc() directly as it wants to set a custom gfp_mask=
,
> >   which is unique as all other drivers call a wrapper to that function.
> >   Fix it by adding netmem_to_page() in the driver.> - Fix printing netm=
em trace printing (Pavel).
> >
> > v11:
> > - Fix typing to remove sparse warning. (Paolo/Steven)
> >
> > v9:
> > - Fix sparse error (Simon).
> >
> > v8:
> > - Fix napi_pp_put_page() taking netmem instead of page to fix
> >   patch-by-patch build error.
> > - Add net/netmem.h include in this patch to fix patch-by-patch build
> >   error.
> >
> > v6:
> >
> > - Rebased on top of the merged netmem_ref type.
> >
> > Cc: linux-mm@kvack.org
> > Cc: Matthew Wilcox <willy@infradead.org>
> >
> > ---
> >  drivers/net/ethernet/renesas/ravb_main.c |   5 +-
> >  include/linux/skbuff_ref.h               |   4 +-
> >  include/net/netmem.h                     |  15 ++
> >  include/net/page_pool/helpers.h          | 120 ++++++---
> >  include/net/page_pool/types.h            |  14 +-
> >  include/trace/events/page_pool.h         |  30 +--
> >  net/bpf/test_run.c                       |   5 +-
> >  net/core/page_pool.c                     | 304 ++++++++++++-----------
> >  net/core/skbuff.c                        |   8 +-
> >  9 files changed, 305 insertions(+), 200 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/eth=
ernet/renesas/ravb_main.c
> > index c1546b916e4ef..093236ebfeecb 100644
> > --- a/drivers/net/ethernet/renesas/ravb_main.c
> > +++ b/drivers/net/ethernet/renesas/ravb_main.c
> > @@ -303,8 +303,9 @@ ravb_alloc_rx_buffer(struct net_device *ndev, int q=
, u32 entry, gfp_t gfp_mask,
> >
> >       rx_buff =3D &priv->rx_buffers[q][entry];
> >       size =3D info->rx_buffer_size;
> > -     rx_buff->page =3D page_pool_alloc(priv->rx_pool[q], &rx_buff->off=
set,
> > -                                     &size, gfp_mask);
> > +     rx_buff->page =3D netmem_to_page(page_pool_alloc(priv->rx_pool[q]=
,
> > +                                                    &rx_buff->offset,
> > +                                                    &size, gfp_mask));
> >       if (unlikely(!rx_buff->page)) {
> >               /* We just set the data size to 0 for a failed mapping wh=
ich
> >                * should prevent DMA from happening...
>
> [snip]
>
> >
> > -static inline struct page *page_pool_alloc(struct page_pool *pool,
> > -                                        unsigned int *offset,
> > -                                        unsigned int *size, gfp_t gfp)
> > +static inline netmem_ref page_pool_alloc(struct page_pool *pool,
> > +                                      unsigned int *offset,
> > +                                      unsigned int *size, gfp_t gfp)
> >  {
> >       unsigned int max_size =3D PAGE_SIZE << pool->p.order;
> > -     struct page *page;
> > +     netmem_ref netmem;
> >
> >       if ((*size << 1) > max_size) {
> >               *size =3D max_size;
> >               *offset =3D 0;
> > -             return page_pool_alloc_pages(pool, gfp);
> > +             return page_pool_alloc_netmem(pool, gfp);
> >       }
> >
> > -     page =3D page_pool_alloc_frag(pool, offset, *size, gfp);
> > -     if (unlikely(!page))
> > -             return NULL;
> > +     netmem =3D page_pool_alloc_frag_netmem(pool, offset, *size, gfp);
> > +     if (unlikely(!netmem))
> > +             return 0;
> >
> >       /* There is very likely not enough space for another fragment, so=
 append
> >        * the remaining size to the current fragment to avoid truesize
> > @@ -140,7 +142,7 @@ static inline struct page *page_pool_alloc(struct p=
age_pool *pool,
> >               pool->frag_offset =3D max_size;
> >       }
> >
> > -     return page;
> > +     return netmem;
> >  }
> >
> >  /**
> > @@ -154,7 +156,7 @@ static inline struct page *page_pool_alloc(struct p=
age_pool *pool,
> >   * utilization and performance penalty.
> >   *
> >   * Return:
> > - * Return allocated page or page fragment, otherwise return NULL.
> > + * Return allocated page or page fragment, otherwise return 0.
> >   */
> >  static inline struct page *page_pool_dev_alloc(struct page_pool *pool,
> >                                              unsigned int *offset,
> > @@ -162,7 +164,7 @@ static inline struct page *page_pool_dev_alloc(stru=
ct page_pool *pool,
> >  {
> >       gfp_t gfp =3D (GFP_ATOMIC | __GFP_NOWARN);
> >
> > -     return page_pool_alloc(pool, offset, size, gfp);
> > +     return netmem_to_page(page_pool_alloc(pool, offset, size, gfp));
> >  }
>
> I find this API change confusing - why should page_pool_alloc() return a
> netmem_ref but page_pool_dev_alloc() return a struct page *?
>
> Is there any reason to change page_pool_alloc() anyway? It calls
> page_pool_alloc_pages() or page_pool_alloc_frag() as appropriate, both
> of which your patch already converts to wrappers around the appropriate
> _netmem() functions. In all instances where page_pool_alloc() is called
> in this patch, you wrap it with netmem_to_page() anyway, there are no
> calls to page_pool_alloc() added which actually want a netmem_ref.
>

The general gist is that the page_pool API is being converted to use
netmem_ref instead of page. The existing API, which uses struct page,
is kept around transitionally, but meant to be removed and everything
moved to netmem.

APIs that current drivers depend on, like page_pool_dev_alloc(), I've
kept as struct page and added netmem versions when needed. APIs that
had no external users, like page_pool_alloc(), I took the opportunity
to move them to netmem immediately. But you recently depended on that.

I thought page_pool_alloc() was an internal function to the page_pool
not meant to be called from drivers, but the documentation actually
mentions it. Seems like I need to keep it as page* function
transitionally as well. I'll look into making this change you
suggested, there is
no needed page_pool_alloc() caller at the moment.


--
Thanks,
Mina
