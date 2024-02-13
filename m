Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B73D853CBF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 22:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3098010E4C1;
	Tue, 13 Feb 2024 21:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mRgnV+mg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AAF10E4C1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 21:11:42 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a3d01a9a9a2so122887766b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 13:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1707858701; x=1708463501;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zsOIUemMTVXHoEVROLysOcQX18quXE3mcOSmusaiTVU=;
 b=mRgnV+mgLTRi3GRsNQ8aC7G0bgai/18vKFA3TFDK+rGn+u4KJYslgk064rea7tNqHS
 0J+YKCqECPgDlfL+s0tJNrM7FKvZTIqfNzeMjTLvU3L26AK1wzxrlMhCWiqhw4UgJGc1
 sPXt/nBfxQkskSWFZLzwSOvFQAsZXm2MaiA5sPAChTg5/A7q9gn9BRQGR15bQF8r08HS
 V6zbyglvHGmwdTIXPM9CUw1BKC0U3LxYSFDh3oxiwPN3mxfMYrKicNF0yZfBbkAQQuJn
 Smd6u6GpCqxn9lWQZ1n3lSDFjaD1yIspo/DZwG5c1akG2UJhn0bWyNQP01hi3QPld12x
 sf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858701; x=1708463501;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zsOIUemMTVXHoEVROLysOcQX18quXE3mcOSmusaiTVU=;
 b=Yk0dUzRc1kqEFogV8+YcooGLUOnWgk/6Rfanf8FT4dReuRyui9O0lT/pJfx87mirJ5
 keCNCsZ5/pwWHsdHEZM49hM8g/PPHlXOTdXxlfPl+XpUyUv7EXiGyO+hnOEZrSiizLBL
 v8JrUxZTyXQ6675Qn3U/GPQFpVW1rCvZs7iarKGWtZw71iT3Qa7uqpIfnEtr0NUP3P79
 lJ4SxBqrKi6s6V4HZaXZfLv/5Fr36JYBpfsKQE4wTDEiFQKe7xHqu6vqt6rNJReAkAhb
 w//jMHos9dydsITcdXhIA58mv0d/Y6T+2AD+RwfFnhFFov574yZqCDITy3gZ2Ew/lQDO
 sIWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhQsLZs5n7PpGIWl+HLvQuqqfmEkbjAM2IcAhHzlmFu1NoN7QfQdN7EtkyjjBkk7GPIFNkRORVHJ04N+s/kCXETwybNPKgSdeH5kavvvq+
X-Gm-Message-State: AOJu0YxL7pr4SvOf6DvPO51GUMEftljAEUXRhAwHMmVBEswroslKTWpP
 +ljBl+GkfxaSBmqPzgTpNTZ1e4CbLIW/Y43TTyy+Wn2wPXMIjWqdhAoUgAqLn24/vsg8t1tPAsI
 HyQER6t4n1QUx6QGlmN1gp9C2dDcv/kjroCzg
X-Google-Smtp-Source: AGHT+IExITBQize1fGZuvy7b+0mnYFOUMkpqQ+6ifMmjq7oa8jqrG3qPbdpWEJmCURVq8IK8JranwyOGOl5XdgYpzX0=
X-Received: by 2002:a17:906:8410:b0:a3c:eb18:8a4d with SMTP id
 n16-20020a170906841000b00a3ceb188a4dmr349416ejx.62.1707858700745; Tue, 13 Feb
 2024 13:11:40 -0800 (PST)
MIME-Version: 1.0
References: <20231218024024.3516870-1-almasrymina@google.com>
 <20231218024024.3516870-8-almasrymina@google.com>
 <3374356e-5f4b-4a6f-bb19-8cb7c56103bc@gmail.com>
In-Reply-To: <3374356e-5f4b-4a6f-bb19-8cb7c56103bc@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 13 Feb 2024 13:11:28 -0800
Message-ID: <CAHS8izO2zARuMovrYU3kdwSXsQAM6+SajQjDT3ckSvVOfHwaCQ@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v5 07/14] page_pool: devmem support
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
 Helge Deller <deller@gmx.de>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, 
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>, 
 Praveen Kaligineedi <pkaligineedi@google.com>
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

On Tue, Feb 13, 2024 at 5:28=E2=80=AFAM Pavel Begunkov <asml.silence@gmail.=
com> wrote:
>
> On 12/18/23 02:40, Mina Almasry wrote:
> > Convert netmem to be a union of struct page and struct netmem. Overload
> > the LSB of struct netmem* to indicate that it's a net_iov, otherwise
> > it's a page.
> >
> > Currently these entries in struct page are rented by the page_pool and
> > used exclusively by the net stack:
> >
> > struct {
> >       unsigned long pp_magic;
> >       struct page_pool *pp;
> >       unsigned long _pp_mapping_pad;
> >       unsigned long dma_addr;
> >       atomic_long_t pp_ref_count;
> > };
> >
> > Mirror these (and only these) entries into struct net_iov and implement
> > netmem helpers that can access these common fields regardless of
> > whether the underlying type is page or net_iov.
> > Implement checks for net_iov in netmem helpers which delegate to mm
> > APIs, to ensure net_iov are never passed to the mm stack.
> >
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> >
> > ---
> >
> > RFCv5:
> > - Use netmem instead of page* with LSB set.
> > - Use pp_ref_count for refcounting net_iov.
> > - Removed many of the custom checks for netmem.
> >
> > v1:
> > - Disable fragmentation support for iov properly.
> > - fix napi_pp_put_page() path (Yunsheng).
> > - Use pp_frag_count for devmem refcounting.
> >
> > ---
> >   include/net/netmem.h            | 145 ++++++++++++++++++++++++++++++-=
-
> >   include/net/page_pool/helpers.h |  25 +++---
> >   net/core/page_pool.c            |  26 +++---
> >   net/core/skbuff.c               |   9 +-
> >   4 files changed, 164 insertions(+), 41 deletions(-)
> >
> > diff --git a/include/net/netmem.h b/include/net/netmem.h
> > index 31f338f19da0..7557aecc0f78 100644
> > --- a/include/net/netmem.h
> > +++ b/include/net/netmem.h
> > @@ -12,11 +12,47 @@
> >
> >   /* net_iov */
> >
> > +DECLARE_STATIC_KEY_FALSE(page_pool_mem_providers);
> > +
> > +/*  We overload the LSB of the struct page pointer to indicate whether=
 it's
> > + *  a page or net_iov.
> > + */
> > +#define NET_IOV 0x01UL
> > +
> >   struct net_iov {
> > +     unsigned long __unused_padding;
> > +     unsigned long pp_magic;
> > +     struct page_pool *pp;
> >       struct dmabuf_genpool_chunk_owner *owner;
> >       unsigned long dma_addr;
> > +     atomic_long_t pp_ref_count;
> >   };
>
> I wonder if it would be better to extract a common sub-struct
> used in struct page, struct_group_tagged can help to avoid
> touching old code:
>
> struct page {
>         unsigned long flags;
>         union {
>                 ...
>                 struct_group_tagged(<struct_name>, ...,
>                         /**
>                          * @pp_magic: magic value to avoid recycling non
>                          * page_pool allocated pages.
>                          */
>                         unsigned long pp_magic;
>                         struct page_pool *pp;
>                         unsigned long _pp_mapping_pad;
>                         unsigned long dma_addr;
>                         atomic_long_t pp_ref_count;
>                 );
>         };
> }
>
> struct net_iov {
>         unsigned long pad;
>         struct <struct_name> p;
> };
>
>
> A bit of a churn with the padding and nesting net_iov but looks
> sturdier. No duplication, and you can just check positions of the
> structure instead of per-field NET_IOV_ASSERT_OFFSET, which you
> have to not forget to update e.g. when adding a new field. Also,

Yes, this is nicer. If possible I'll punt it to a minor cleanup as a
follow up change. Logistically I think if this series need-not touch
code outside of net/, that's better.

> with the change __netmem_clear_lsb can return a pointer to that
> structure, casting struct net_iov when it's a page is a bit iffy.
>
> And the next question would be whether it'd be a good idea to encode
> iov vs page not by setting a bit but via one of the fields in the
> structure, maybe pp_magic.
>

I will push back against this, for 2 reasons:

1. I think pp_magic's first 2 bits (and maybe more) are used by mm
code and thus I think extending usage of pp_magic in this series is a
bit iffy and I would like to avoid it. I just don't want to touch the
semantics of struct page if I don't have to.
2. I think this will be a measurable perf regression. Currently we can
tell if a pointer is a page or net_iov without dereferencing the
pointer and dirtying the cache-line. This will cause us to possibly
dereference the pointer in areas where we don't need to. I think I had
an earlier version of this code that required a dereference to tell if
a page was devmem and Eric pointed to me it was a perf regression.

I also don't see any upside of using pp_magic, other than making the
code slightly more readable, maybe.

> With that said I'm a bit concerned about the net_iov size. If each
> represents 4096 bytes and you're registering 10MB, then you need
> 30 pages worth of memory just for the iov array. Makes kvmalloc
> a must even for relatively small sizes.
>

This I think is an age-old challenge with pages. 1.6% of the machine's
memory is 'wasted' on every machine because a struct page needs to be
allocated for each PAGE_SIZE region. We're running into the same issue
here where if we want to refer to PAGE_SIZE regions of memory we need
to allocate some reference to it. Note that net_iov can be relatively
easily extended to support N order pages. Also note that in the devmem
TCP use case it's not really an issue; the minor increase in mem
utilization is more than offset by the saving in memory bw as compared
to using host memory as a bounce buffer. All in all I vote this is
something that can be tuned or improved in the future if someone finds
the extra memory usage a hurdle to using devmem TCP or this net_iov
infra.

> And the final bit, I don't believe the overlay is necessary in
> this series. Optimisations are great, but this one is a bit more on
> the controversial side. Unless I missed something and it does make
> things easier, it might make sense to do it separately later.
>

I completely agree, the overlay is not necessary. I implemented the
overlay in response to Yunsheng's  strong requests for more 'unified'
processing between page and devmem. This is the most unification I can
do IMO without violating the requirements from Jason. I'm prepared to
remove the overlay if it turns out controversial, but so far I haven't
seen any complaints. Jason, please do take a look if you have not
already.

>
> > +/* These fields in struct page are used by the page_pool and net stack=
:
> > + *
> > + *   struct {
> > + *           unsigned long pp_magic;
> > + *           struct page_pool *pp;
> > + *           unsigned long _pp_mapping_pad;
> > + *           unsigned long dma_addr;
> > + *           atomic_long_t pp_ref_count;
> > + *   };
> > + *
> > + * We mirror the page_pool fields here so the page_pool can access the=
se fields
> > + * without worrying whether the underlying fields belong to a page or =
net_iov.
> > + *
> > + * The non-net stack fields of struct page are private to the mm stack=
 and must
> > + * never be mirrored to net_iov.
> > + */
> > +#define NET_IOV_ASSERT_OFFSET(pg, iov)             \
> > +     static_assert(offsetof(struct page, pg) =3D=3D \
> > +                   offsetof(struct net_iov, iov))
> > +NET_IOV_ASSERT_OFFSET(pp_magic, pp_magic);
> > +NET_IOV_ASSERT_OFFSET(pp, pp);
> > +NET_IOV_ASSERT_OFFSET(dma_addr, dma_addr);
> > +NET_IOV_ASSERT_OFFSET(pp_ref_count, pp_ref_count);
> > +#undef NET_IOV_ASSERT_OFFSET
> > +
> >   static inline struct dmabuf_genpool_chunk_owner *
> >   net_iov_owner(const struct net_iov *niov)
> >   {
> > @@ -47,19 +83,25 @@ net_iov_binding(const struct net_iov *niov)
> >   struct netmem {
> >       union {
> >               struct page page;
> > -
> > -             /* Stub to prevent compiler implicitly converting from pa=
ge*
> > -              * to netmem_t* and vice versa.
> > -              *
> > -              * Other memory type(s) net stack would like to support
> > -              * can be added to this union.
> > -              */
> > -             void *addr;
> > +             struct net_iov niov;
> >       };
> >   };
> >
> ...
>
> --
> Pavel Begunkov



--
Thanks,
Mina
