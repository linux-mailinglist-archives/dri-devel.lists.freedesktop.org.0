Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5EE781AD6
	for <lists+dri-devel@lfdr.de>; Sat, 19 Aug 2023 22:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3B910E053;
	Sat, 19 Aug 2023 20:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28EF10E053
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 20:28:01 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-79a2216a22fso633258241.0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 13:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1692476881; x=1693081681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OSJsaan+4PUYwk3s9UX7Zy3OmCXirTn6OJVSqTCOJnQ=;
 b=hFtSKE817zksePbkGJ8NUKtoN3LNIi1mkhB3ue2cp90dox25oKKhzgR1kZxMKa4n6y
 ROauIIWdVeq++Tya5n7nNeADnzOQpac8qQhjNpLTHGBgSIkpLFxuCwrbZX+Di5OJtvyN
 UTfW3HO8X9WrmIlE1awGHkDiNC7LwMZFwBFeZhPwEy1OLMT9SbIqGXgRY73KcPIB6xpz
 6wqnlsm099aduaTSx1yQAfz/jjp0vCURVKLp6FEbaJ8qB2nKq0mItSjU3nDnU1Q64RHe
 fOUywpgHddF+9Av+b3pXUFZUbUluqjcK6P2ibqnJuerIOPgiXf37TVC04IpVUCJtp4Ub
 2X+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692476881; x=1693081681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OSJsaan+4PUYwk3s9UX7Zy3OmCXirTn6OJVSqTCOJnQ=;
 b=Aj6HKDI++5Ua8UHR8OmsQpXKsLcYM/OTIzFe0QTTJcFtqEYh93sTON2zP/g7gctFkx
 ZAgK1u7JHRZvY5H0kDvrwAdjGrQGBQ9pLIi3H34m+y1Se+ECNb3JWxlWLLnRFGkuC0gw
 Wpfx09+J5JYP8gM7kGbrzDlf0gB83hXB9kwbTwwIPlRKiCWyHDEu/PXadKdEHubWDLdC
 ySyrPf3B1xnL9pkMQWkEgy4d0HJjgIEFmWW7XqEbxeN/or9eHIsmqpMSCEP1to+wIBqX
 1D0pDp7JMZhNkQrGRWxwm/LA1zmswMWxlIt9VjMxMjM+SIrFid83qbVnmYxMbUfCCwo1
 ApCQ==
X-Gm-Message-State: AOJu0YypAWEznf/Em6r8KzClaKh+KNcnZZzMNPbFsSQ1scUEOXll//iP
 t2jBpmq+lxTt+XAMkpFNTai9AxrqacZ39dJS4hQ54g==
X-Google-Smtp-Source: AGHT+IGtmjx42JNpjKmpyq5r6JhOb3x6RM/CNXIT+xpG6J1eNMJhv/9uDyX8efRzB1fmLlwiCMwstfpHpNY8i9DuHTo=
X-Received: by 2002:a05:6102:3034:b0:44d:41bc:705f with SMTP id
 v20-20020a056102303400b0044d41bc705fmr392142vsa.16.1692476880556; Sat, 19 Aug
 2023 13:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
 <20230810015751.3297321-7-almasrymina@google.com>
 <6adafb5d-0bc5-cb9a-5232-6836ab7e77e6@redhat.com>
 <CAF=yD-L0ajGVrexnOVvvhC-A7vw6XP9tq5T3HCDTjQMS0mXdTQ@mail.gmail.com>
 <8f4d276e-470d-6ce8-85d5-a6c08fa22147@redhat.com>
 <CAHS8izMGY+_jBVmYzhYYZtyAf_Uy1GDX-U3zX=ea7f73ya4iQQ@mail.gmail.com>
In-Reply-To: <CAHS8izMGY+_jBVmYzhYYZtyAf_Uy1GDX-U3zX=ea7f73ya4iQQ@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Sat, 19 Aug 2023 13:27:49 -0700
Message-ID: <CAHS8izPdBQJCU_5jVFjMJX4J1jF5vjrL8t2srk+j4vr8Ni-JZw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 06/11] page-pool: add device memory support
To: Jesper Dangaard Brouer <jbrouer@redhat.com>
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 stephen@networkplumber.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Eric Dumazet <edumazet@google.com>, Hari Ramakrishnan <rharix@google.com>,
 sdf@google.com, Andy Lutomirski <luto@kernel.org>, brouer@redhat.com,
 Jakub Kicinski <kuba@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 19, 2023 at 1:24=E2=80=AFPM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> On Sat, Aug 19, 2023 at 8:22=E2=80=AFAM Jesper Dangaard Brouer
> <jbrouer@redhat.com> wrote:
> >
> >
> >
> > On 19/08/2023 16.08, Willem de Bruijn wrote:
> > > On Sat, Aug 19, 2023 at 5:51=E2=80=AFAM Jesper Dangaard Brouer
> > > <jbrouer@redhat.com> wrote:
> > >>
> > >>
> > >>
> > >> On 10/08/2023 03.57, Mina Almasry wrote:
> > >>> Overload the LSB of struct page* to indicate that it's a page_pool_=
iov.
> > >>>
> > >>> Refactor mm calls on struct page * into helpers, and add page_pool_=
iov
> > >>> handling on those helpers. Modify callers of these mm APIs with cal=
ls to
> > >>> these helpers instead.
> > >>>
> > >>
> > >> I don't like of this approach.
> > >> This is adding code to the PP (page_pool) fast-path in multiple plac=
es.
> > >>
> > >> I've not had time to run my usual benchmarks, which are here:
> > >>
> > >> https://github.com/netoptimizer/prototype-kernel/blob/master/kernel/=
lib/bench_page_pool_simple.c
> > >>
>
> Thank you for linking that, I'll try to run these against the next submis=
sion.
>
> > >> But I'm sure it will affect performance.
> > >>
> > >> Regardless of performance, this approach is using ptr-LSB-bits, to h=
ide
> > >> that page-pointer are not really struct-pages, feels like force feed=
ing
> > >> a solution just to use the page_pool APIs.
> > >>
> > >>
> > >>> In areas where struct page* is dereferenced, add a check for specia=
l
> > >>> handling of page_pool_iov.
> > >>>
> > >>> The memory providers producing page_pool_iov can set the LSB on the
> > >>> struct page* returned to the page pool.
> > >>>
> > >>> Note that instead of overloading the LSB of page pointers, we can
> > >>> instead define a new union between struct page & struct page_pool_i=
ov and
> > >>> compact it in a new type. However, we'd need to implement the code =
churn
> > >>> to modify the page_pool & drivers to use this new type. For this PO=
C
> > >>> that is not implemented (feedback welcome).
> > >>>
> > >>
> > >> I've said before, that I prefer multiplexing on page->pp_magic.
> > >> For your page_pool_iov the layout would have to match the offset of
> > >> pp_magic, to do this. (And if insisting on using PP infra the refcnt
> > >> would also need to align).
> > >
> > > Perhaps I misunderstand, but this suggests continuing to using
> > > struct page to demultiplex memory type?
> > >
> >
> > (Perhaps we are misunderstanding each-other and my use of the words
> > multiplexing and demultiplex are wrong, I'm sorry, as English isn't my
> > native language.)
> >
> > I do see the problem of depending on having a struct page, as the
> > page_pool_iov isn't related to struct page.  Having "page" in the name
> > of "page_pool_iov" is also confusing (hardest problem is CS is naming,
> > as we all know).
> >
> > To support more allocator types, perhaps skb->pp_recycle bit need to
> > grow another bit (and be renamed skb->recycle), so we can tell allocato=
r
> > types apart, those that are page based and those whom are not.
> >
> >
> > > I think the feedback has been strong to not multiplex yet another
> > > memory type into that struct, that is not a real page. Which is why
> > > we went into this direction. This latest series limits the impact lar=
gely
> > > to networking structures and code.
> > >
> >
> > Some what related what I'm objecting to: the "page_pool_iov" is not a
> > real page, but this getting recycled into something called "page_pool",
> > which funny enough deals with struct-pages internally and depend on the
> > struct-page-refcnt.
> >
> > Given the approach changed way from using struct page, then I also don'=
t
> > see the connection with the page_pool. Sorry.
> >
> > > One way or another, there will be a branch and multiplexing. Whether
> > > that is in struct page, the page pool or a new netdev mem type as you
> > > propose.
> > >
> >
> > I'm asking to have this branch/multiplexing done a the call sites.
> >
> > (IMHO not changing the drivers is a pipe-dream.)
> >
>
> I think I understand what Jesper is saying. I think Jesper wants the
> page_pool to remain unchanged, and another layer on top of it to do
> the multiplexing, i.e.:
>
> driver ---> new_layer (does multiplexing) ---> page_pool -------> mm laye=
r
>                                 \------------------------------>
> devmem_pool --> dma-buf layer
>

Gmail mangled this :/ Let me try again. This should read:

driver -> new_layer -> page_pool ------> mm layer
                      \--------->devmem_pool -> dma-buf

> But, I think, Jakub wants the page_pool to be the front end, and for
> the multiplexing to happen in the page pool (I think, Jakub did not
> write this in an email, but this is how I interpret his comments from
> [1], and his memory provider RFC). So I think Jakub wants:
>
> driver --> page_pool ---> memory_provider (does multiplexing) --->
> basic_provider -------> mm layer
>
> \----------------------------------------> devmem_provider --> dma-buf
> layer
>

This should read:
driver -> pp -> memory provider -> basic provider -> mm
                                   \--------------> devmem provider -> dma-=
buf

Sorry for the spam!

> That is the approach in this RFC.
>
> I think proper naming that makes sense can be figured out, and is not
> a huge issue. I think in both cases we can minimize the changes to the
> drivers, maybe. In the first approach the driver will need to use the
> APIs created by the new layer. In the second approach, the driver
> continues to use page_pool APIs.
>
> I think we need to converge on a path between the 2 approaches (or
> maybe 3rd approach to do). For me the pros/cons of each approach
> (please add):
>
> multiplexing in new_layer:
> - Pro: maybe better for performance? Not sure if static_branch can
> achieve the same perf. I can verify with Jesper's perf tests.
> - Pro: doesn't add complexity in the page_pool (but adds complexity in
> terms of adding new pools like devmem_pool)
> - Con: the devmem_pool & page_pool will end up being duplicated code,
> I suspect, because they largely do similar things (both need to
> recycle memory for example).
>
> multiplexing via memory_provider:
> - Pro: no code duplication.
> - Pro: less changes to the drivers, I think. The drivers can continue
> to use the page_pool API, no need to introduce calls to 'new_layer'.
> - Con: adds complexity to the page_pool (needs to handle devmem).
> - Con: probably careful handling via static_branch needs to be done to
> achieve performance.
>
> [1] https://lore.kernel.org/netdev/20230619110705.106ec599@kernel.org/
>
> > > Any regression in page pool can be avoided in the common case that
> > > does not use device mem by placing that behind a static_branch. Would
> > > that address your performance concerns?
> > >
> >
> > No. This will not help.
> >
> > The problem is that every where in the page_pool code it is getting
> > polluted with:
> >
> >    if (page_is_page_pool_iov(page))
> >      call-some-iov-func-instead()
> >
> > Like: the very central piece of getting the refcnt:
> >
> > +static inline int page_pool_page_ref_count(struct page *page)
> > +{
> > +       if (page_is_page_pool_iov(page))
> > +               return page_pool_iov_refcount(page_to_page_pool_iov(pag=
e));
> > +
> > +       return page_ref_count(page);
> > +}
> >
> >
> > The fast-path of the PP is used for XDP_DROP scenarios, and is currentl=
y
> > around 14 cycles (tsc). Thus, any extra code in this code patch will
> > change the fast-path.
> >
> >
> > >>
> > >> On the allocation side, all drivers already use a driver helper
> > >> page_pool_dev_alloc_pages() or we could add another (better named)
> > >> helper to multiplex between other types of allocators, e.g. a devmem
> > >> allocator.
> > >>
> > >> On free/return/recycle the functions napi_pp_put_page or skb_pp_recy=
cle
> > >> could multiplex on pp_magic and call another API.  The API could be =
an
> > >> extension to PP helpers, but it could also be a devmap allocator hel=
per.
> > >>
> > >> IMHO forcing/piggy-bagging everything into page_pool is not the righ=
t
> > >> solution.  I really think netstack need to support different allocat=
or
> > >> types.
> > >
> > > To me this is lifting page_pool into such a netstack alloctator pool.
> > >
> >
> > This is should be renamed as it is not longer dealing with pages.
> >
> > > Not sure adding another explicit layer of indirection would be cleane=
r
> > > or faster (potentially more indirect calls).
> > >
> >
> > It seems we are talking past each-other.  The layer of indirection I'm
> > talking about is likely a simple header file (e.g. named netmem.h) that
> > will get inline compiled so there is no overhead. It will be used by
> > driver, such that we can avoid touching driver again when introducing
> > new memory allocator types.
> >
> >
> > > As for the LSB trick: that avoided adding a lot of boilerplate churn
> > > with new type and helper functions.
> > >
> >
> > Says the lazy programmer :-P ... sorry could not resist ;-)
> >
> > >
> > >
> > >> The page pool have been leading the way, yes, but perhaps it is
> > >> time to add an API layer that e.g. could be named netmem, that gives=
 us
> > >> the multiplexing between allocators.  In that process some of page_p=
ool
> > >> APIs would be lifted out as common blocks and others remain.
> > >>
> > >> --Jesper
> > >>
> > >>> I have a sample implementation of adding a new page_pool_token type
> > >>> in the page_pool to give a general idea here:
> > >>> https://github.com/torvalds/linux/commit/3a7628700eb7fd02a117db0360=
03bca50779608d
> > >>>
> > >>> Full branch here:
> > >>> https://github.com/torvalds/linux/compare/master...mina:linux:tcpde=
vmem-pp-tokens
> > >>>
> > >>> (In the branches above, page_pool_iov is called devmem_slice).
> > >>>
> > >>> Could also add static_branch to speed up the checks in page_pool_io=
v
> > >>> memory providers are being used.
> > >>>
> > >>> Signed-off-by: Mina Almasry <almasrymina@google.com>
> > >>> ---
> > >>>    include/net/page_pool.h | 74 ++++++++++++++++++++++++++++++++++-
> > >>>    net/core/page_pool.c    | 85 ++++++++++++++++++++++++++++-------=
------
> > >>>    2 files changed, 131 insertions(+), 28 deletions(-)
> > >>>
> > >>> diff --git a/include/net/page_pool.h b/include/net/page_pool.h
> > >>> index 537eb36115ed..f08ca230d68e 100644
> > >>> --- a/include/net/page_pool.h
> > >>> +++ b/include/net/page_pool.h
> > >>> @@ -282,6 +282,64 @@ static inline struct page_pool_iov *page_to_pa=
ge_pool_iov(struct page *page)
> > >>>        return NULL;
> > >>>    }
> > >>>
> > >>> +static inline int page_pool_page_ref_count(struct page *page)
> > >>> +{
> > >>> +     if (page_is_page_pool_iov(page))
> > >>> +             return page_pool_iov_refcount(page_to_page_pool_iov(p=
age));
> > >>> +
> > >>> +     return page_ref_count(page);
> > >>> +}
> > >>> +
> > >>> +static inline void page_pool_page_get_many(struct page *page,
> > >>> +                                        unsigned int count)
> > >>> +{
> > >>> +     if (page_is_page_pool_iov(page))
> > >>> +             return page_pool_iov_get_many(page_to_page_pool_iov(p=
age),
> > >>> +                                           count);
> > >>> +
> > >>> +     return page_ref_add(page, count);
> > >>> +}
> > >>> +
> > >>> +static inline void page_pool_page_put_many(struct page *page,
> > >>> +                                        unsigned int count)
> > >>> +{
> > >>> +     if (page_is_page_pool_iov(page))
> > >>> +             return page_pool_iov_put_many(page_to_page_pool_iov(p=
age),
> > >>> +                                           count);
> > >>> +
> > >>> +     if (count > 1)
> > >>> +             page_ref_sub(page, count - 1);
> > >>> +
> > >>> +     put_page(page);
> > >>> +}
> > >>> +
> > >>> +static inline bool page_pool_page_is_pfmemalloc(struct page *page)
> > >>> +{
> > >>> +     if (page_is_page_pool_iov(page))
> > >>> +             return false;
> > >>> +
> > >>> +     return page_is_pfmemalloc(page);
> > >>> +}
> > >>> +
> > >>> +static inline bool page_pool_page_is_pref_nid(struct page *page, i=
nt pref_nid)
> > >>> +{
> > >>> +     /* Assume page_pool_iov are on the preferred node without act=
ually
> > >>> +      * checking...
> > >>> +      *
> > >>> +      * This check is only used to check for recycling memory in t=
he page
> > >>> +      * pool's fast paths. Currently the only implementation of pa=
ge_pool_iov
> > >>> +      * is dmabuf device memory. It's a deliberate decision by the=
 user to
> > >>> +      * bind a certain dmabuf to a certain netdev, and the netdev =
rx queue
> > >>> +      * would not be able to reallocate memory from another dmabuf=
 that
> > >>> +      * exists on the preferred node, so, this check doesn't make =
much sense
> > >>> +      * in this case. Assume all page_pool_iovs can be recycled fo=
r now.
> > >>> +      */
> > >>> +     if (page_is_page_pool_iov(page))
> > >>> +             return true;
> > >>> +
> > >>> +     return page_to_nid(page) =3D=3D pref_nid;
> > >>> +}
> > >>> +
> > >>>    struct page_pool {
> > >>>        struct page_pool_params p;
> > >>>
> > >>> @@ -434,6 +492,9 @@ static inline long page_pool_defrag_page(struct=
 page *page, long nr)
> > >>>    {
> > >>>        long ret;
> > >>>
> > >>> +     if (page_is_page_pool_iov(page))
> > >>> +             return -EINVAL;
> > >>> +
> > >>>        /* If nr =3D=3D pp_frag_count then we have cleared all remai=
ning
> > >>>         * references to the page. No need to actually overwrite it,=
 instead
> > >>>         * we can leave this to be overwritten by the calling functi=
on.
> > >>> @@ -494,7 +555,12 @@ static inline void page_pool_recycle_direct(st=
ruct page_pool *pool,
> > >>>
> > >>>    static inline dma_addr_t page_pool_get_dma_addr(struct page *pag=
e)
> > >>>    {
> > >>> -     dma_addr_t ret =3D page->dma_addr;
> > >>> +     dma_addr_t ret;
> > >>> +
> > >>> +     if (page_is_page_pool_iov(page))
> > >>> +             return page_pool_iov_dma_addr(page_to_page_pool_iov(p=
age));
> > >>> +
> > >>> +     ret =3D page->dma_addr;
> > >>>
> > >>>        if (PAGE_POOL_DMA_USE_PP_FRAG_COUNT)
> > >>>                ret |=3D (dma_addr_t)page->dma_addr_upper << 16 << 1=
6;
> > >>> @@ -504,6 +570,12 @@ static inline dma_addr_t page_pool_get_dma_add=
r(struct page *page)
> > >>>
> > >>>    static inline void page_pool_set_dma_addr(struct page *page, dma=
_addr_t addr)
> > >>>    {
> > >>> +     /* page_pool_iovs are mapped and their dma-addr can't be modi=
fied. */
> > >>> +     if (page_is_page_pool_iov(page)) {
> > >>> +             DEBUG_NET_WARN_ON_ONCE(true);
> > >>> +             return;
> > >>> +     }
> > >>> +
> > >>>        page->dma_addr =3D addr;
> > >>>        if (PAGE_POOL_DMA_USE_PP_FRAG_COUNT)
> > >>>                page->dma_addr_upper =3D upper_32_bits(addr);
> > >>> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> > >>> index 0a7c08d748b8..20c1f74fd844 100644
> > >>> --- a/net/core/page_pool.c
> > >>> +++ b/net/core/page_pool.c
> > >>> @@ -318,7 +318,7 @@ static struct page *page_pool_refill_alloc_cach=
e(struct page_pool *pool)
> > >>>                if (unlikely(!page))
> > >>>                        break;
> > >>>
> > >>> -             if (likely(page_to_nid(page) =3D=3D pref_nid)) {
> > >>> +             if (likely(page_pool_page_is_pref_nid(page, pref_nid)=
)) {
> > >>>                        pool->alloc.cache[pool->alloc.count++] =3D p=
age;
> > >>>                } else {
> > >>>                        /* NUMA mismatch;
> > >>> @@ -363,7 +363,15 @@ static void page_pool_dma_sync_for_device(stru=
ct page_pool *pool,
> > >>>                                          struct page *page,
> > >>>                                          unsigned int dma_sync_size=
)
> > >>>    {
> > >>> -     dma_addr_t dma_addr =3D page_pool_get_dma_addr(page);
> > >>> +     dma_addr_t dma_addr;
> > >>> +
> > >>> +     /* page_pool_iov memory provider do not support PP_FLAG_DMA_S=
YNC_DEV */
> > >>> +     if (page_is_page_pool_iov(page)) {
> > >>> +             DEBUG_NET_WARN_ON_ONCE(true);
> > >>> +             return;
> > >>> +     }
> > >>> +
> > >>> +     dma_addr =3D page_pool_get_dma_addr(page);
> > >>>
> > >>>        dma_sync_size =3D min(dma_sync_size, pool->p.max_len);
> > >>>        dma_sync_single_range_for_device(pool->p.dev, dma_addr,
> > >>> @@ -375,6 +383,12 @@ static bool page_pool_dma_map(struct page_pool=
 *pool, struct page *page)
> > >>>    {
> > >>>        dma_addr_t dma;
> > >>>
> > >>> +     if (page_is_page_pool_iov(page)) {
> > >>> +             /* page_pool_iovs are already mapped */
> > >>> +             DEBUG_NET_WARN_ON_ONCE(true);
> > >>> +             return true;
> > >>> +     }
> > >>> +
> > >>>        /* Setup DMA mapping: use 'struct page' area for storing DMA=
-addr
> > >>>         * since dma_addr_t can be either 32 or 64 bits and does not=
 always fit
> > >>>         * into page private data (i.e 32bit cpu with 64bit DMA caps=
)
> > >>> @@ -398,14 +412,24 @@ static bool page_pool_dma_map(struct page_poo=
l *pool, struct page *page)
> > >>>    static void page_pool_set_pp_info(struct page_pool *pool,
> > >>>                                  struct page *page)
> > >>>    {
> > >>> -     page->pp =3D pool;
> > >>> -     page->pp_magic |=3D PP_SIGNATURE;
> > >>> +     if (!page_is_page_pool_iov(page)) {
> > >>> +             page->pp =3D pool;
> > >>> +             page->pp_magic |=3D PP_SIGNATURE;
> > >>> +     } else {
> > >>> +             page_to_page_pool_iov(page)->pp =3D pool;
> > >>> +     }
> > >>> +
> > >>>        if (pool->p.init_callback)
> > >>>                pool->p.init_callback(page, pool->p.init_arg);
> > >>>    }
> > >>>
> > >>>    static void page_pool_clear_pp_info(struct page *page)
> > >>>    {
> > >>> +     if (page_is_page_pool_iov(page)) {
> > >>> +             page_to_page_pool_iov(page)->pp =3D NULL;
> > >>> +             return;
> > >>> +     }
> > >>> +
> > >>>        page->pp_magic =3D 0;
> > >>>        page->pp =3D NULL;
> > >>>    }
> > >>> @@ -615,7 +639,7 @@ static bool page_pool_recycle_in_cache(struct p=
age *page,
> > >>>                return false;
> > >>>        }
> > >>>
> > >>> -     /* Caller MUST have verified/know (page_ref_count(page) =3D=
=3D 1) */
> > >>> +     /* Caller MUST have verified/know (page_pool_page_ref_count(p=
age) =3D=3D 1) */
> > >>>        pool->alloc.cache[pool->alloc.count++] =3D page;
> > >>>        recycle_stat_inc(pool, cached);
> > >>>        return true;
> > >>> @@ -638,9 +662,10 @@ __page_pool_put_page(struct page_pool *pool, s=
truct page *page,
> > >>>         * refcnt =3D=3D 1 means page_pool owns page, and can recycl=
e it.
> > >>>         *
> > >>>         * page is NOT reusable when allocated when system is under
> > >>> -      * some pressure. (page_is_pfmemalloc)
> > >>> +      * some pressure. (page_pool_page_is_pfmemalloc)
> > >>>         */
> > >>> -     if (likely(page_ref_count(page) =3D=3D 1 && !page_is_pfmemall=
oc(page))) {
> > >>> +     if (likely(page_pool_page_ref_count(page) =3D=3D 1 &&
> > >>> +                !page_pool_page_is_pfmemalloc(page))) {
> > >>>                /* Read barrier done in page_ref_count / READ_ONCE *=
/
> > >>>
> > >>>                if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
> > >>> @@ -741,7 +766,8 @@ static struct page *page_pool_drain_frag(struct=
 page_pool *pool,
> > >>>        if (likely(page_pool_defrag_page(page, drain_count)))
> > >>>                return NULL;
> > >>>
> > >>> -     if (page_ref_count(page) =3D=3D 1 && !page_is_pfmemalloc(page=
)) {
> > >>> +     if (page_pool_page_ref_count(page) =3D=3D 1 &&
> > >>> +         !page_pool_page_is_pfmemalloc(page)) {
> > >>>                if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
> > >>>                        page_pool_dma_sync_for_device(pool, page, -1=
);
> > >>>
> > >>> @@ -818,9 +844,9 @@ static void page_pool_empty_ring(struct page_po=
ol *pool)
> > >>>        /* Empty recycle ring */
> > >>>        while ((page =3D ptr_ring_consume_bh(&pool->ring))) {
> > >>>                /* Verify the refcnt invariant of cached pages */
> > >>> -             if (!(page_ref_count(page) =3D=3D 1))
> > >>> +             if (!(page_pool_page_ref_count(page) =3D=3D 1))
> > >>>                        pr_crit("%s() page_pool refcnt %d violation\=
n",
> > >>> -                             __func__, page_ref_count(page));
> > >>> +                             __func__, page_pool_page_ref_count(pa=
ge));
> > >>>
> > >>>                page_pool_return_page(pool, page);
> > >>>        }
> > >>> @@ -977,19 +1003,24 @@ bool page_pool_return_skb_page(struct page *=
page, bool napi_safe)
> > >>>        struct page_pool *pp;
> > >>>        bool allow_direct;
> > >>>
> > >>> -     page =3D compound_head(page);
> > >>> +     if (!page_is_page_pool_iov(page)) {
> > >>> +             page =3D compound_head(page);
> > >>>
> > >>> -     /* page->pp_magic is OR'ed with PP_SIGNATURE after the alloca=
tion
> > >>> -      * in order to preserve any existing bits, such as bit 0 for =
the
> > >>> -      * head page of compound page and bit 1 for pfmemalloc page, =
so
> > >>> -      * mask those bits for freeing side when doing below checking=
,
> > >>> -      * and page_is_pfmemalloc() is checked in __page_pool_put_pag=
e()
> > >>> -      * to avoid recycling the pfmemalloc page.
> > >>> -      */
> > >>> -     if (unlikely((page->pp_magic & ~0x3UL) !=3D PP_SIGNATURE))
> > >>> -             return false;
> > >>> +             /* page->pp_magic is OR'ed with PP_SIGNATURE after th=
e
> > >>> +              * allocation in order to preserve any existing bits,=
 such as
> > >>> +              * bit 0 for the head page of compound page and bit 1=
 for
> > >>> +              * pfmemalloc page, so mask those bits for freeing si=
de when
> > >>> +              * doing below checking, and page_pool_page_is_pfmema=
lloc() is
> > >>> +              * checked in __page_pool_put_page() to avoid recycli=
ng the
> > >>> +              * pfmemalloc page.
> > >>> +              */
> > >>> +             if (unlikely((page->pp_magic & ~0x3UL) !=3D PP_SIGNAT=
URE))
> > >>> +                     return false;
> > >>>
> > >>> -     pp =3D page->pp;
> > >>> +             pp =3D page->pp;
> > >>> +     } else {
> > >>> +             pp =3D page_to_page_pool_iov(page)->pp;
> > >>> +     }
> > >>>
> > >>>        /* Allow direct recycle if we have reasons to believe that w=
e are
> > >>>         * in the same context as the consumer would run, so there's
> > >>> @@ -1273,9 +1304,9 @@ static bool mp_huge_busy(struct mp_huge *hu, =
unsigned int idx)
> > >>>
> > >>>        for (j =3D 0; j < (1 << MP_HUGE_ORDER); j++) {
> > >>>                page =3D hu->page[idx] + j;
> > >>> -             if (page_ref_count(page) !=3D 1) {
> > >>> +             if (page_pool_page_ref_count(page) !=3D 1) {
> > >>>                        pr_warn("Page with ref count %d at %u, %u. C=
an't safely destory, leaking memory!\n",
> > >>> -                             page_ref_count(page), idx, j);
> > >>> +                             page_pool_page_ref_count(page), idx, =
j);
> > >>>                        return true;
> > >>>                }
> > >>>        }
> > >>> @@ -1330,7 +1361,7 @@ static struct page *mp_huge_alloc_pages(struc=
t page_pool *pool, gfp_t gfp)
> > >>>                        continue;
> > >>>
> > >>>                if ((page->pp_magic & ~0x3UL) =3D=3D PP_SIGNATURE ||
> > >>> -                 page_ref_count(page) !=3D 1) {
> > >>> +                 page_pool_page_ref_count(page) !=3D 1) {
> > >>>                        atomic_inc(&mp_huge_ins_b);
> > >>>                        continue;
> > >>>                }
> > >>> @@ -1458,9 +1489,9 @@ static void mp_huge_1g_destroy(struct page_po=
ol *pool)
> > >>>        free =3D true;
> > >>>        for (i =3D 0; i < MP_HUGE_1G_CNT; i++) {
> > >>>                page =3D hu->page + i;
> > >>> -             if (page_ref_count(page) !=3D 1) {
> > >>> +             if (page_pool_page_ref_count(page) !=3D 1) {
> > >>>                        pr_warn("Page with ref count %d at %u. Can't=
 safely destory, leaking memory!\n",
> > >>> -                             page_ref_count(page), i);
> > >>> +                             page_pool_page_ref_count(page), i);
> > >>>                        free =3D false;
> > >>>                        break;
> > >>>                }
> > >>> @@ -1489,7 +1520,7 @@ static struct page *mp_huge_1g_alloc_pages(st=
ruct page_pool *pool, gfp_t gfp)
> > >>>                page =3D hu->page + page_i;
> > >>>
> > >>>                if ((page->pp_magic & ~0x3UL) =3D=3D PP_SIGNATURE ||
> > >>> -                 page_ref_count(page) !=3D 1) {
> > >>> +                 page_pool_page_ref_count(page) !=3D 1) {
> > >>>                        atomic_inc(&mp_huge_ins_b);
> > >>>                        continue;
> > >>>                }
> > >>> --
> > >>> 2.41.0.640.ga95def55d0-goog
> > >>>
> > >>
> > >
> >
>
>
> --
> Thanks,
> Mina



--=20
Thanks,
Mina
