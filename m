Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 072F980C034
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 05:04:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180AC10E32D;
	Mon, 11 Dec 2023 04:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A68610E32D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 04:04:51 +0000 (UTC)
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-4b2ceee07e5so2307241e0c.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Dec 2023 20:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702267490; x=1702872290;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VRqbtjk8rq4zydD2Xsjk5a3+pHw9ItIcSF2MB1yehQo=;
 b=OhdPendrGKxFpm8dmlT01GDoF1MP8CjJYD5+H0ybZqyxqeN9v6lTIlBuIZkMIrwJRE
 W/prkmwEgO6cNfgKMNKJkQBjHJDBe/YDTnbWm8CyTDJ4w7LyP9RPuqcdl/Gwk1P72Kkj
 uXcbalam0ptKDk85yNLTSTLPv6po+ygdtkH00kqXu4RXplyxXCIfu9iqaKPTX+s2nj71
 YRyAxTPzW80PsE5kFTdjNpL5YUSOqsZtPAM314X6DWDwZatX7ErSDfVWI+b/UmcN49ZT
 IZn8UEG3HtkP2NF+JxvUVpU0S008EDmV/tAXHZgQVOtdLfHK7BjbHy+gF2PsXULUexRb
 JdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702267490; x=1702872290;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VRqbtjk8rq4zydD2Xsjk5a3+pHw9ItIcSF2MB1yehQo=;
 b=FLxPRvvC1ZYwIde+dRinfUpX8zY47b8GLV16pxxloSGoBEGFG6bJ/32A2eWrRfevoF
 ZwkuhGPUnx17m9Ca6vPLVNhQxaOEJr3V7qKLJ4C4qymncTf2j9ThM5kAGm5+I4S7+Rky
 MoXoIXkH8LNHTVS80GV9xBco6W3DMKq12OmSgARqX/48rBVaOp9RBJ5x5wOwZ6hhVw4Z
 aIlhYQnFbc2qV+WRHrUSh4ByCF73mnrKRe/cergLHMCuxfVMwX1SS+kjJ75lEJqGS1BJ
 nwRePE4BAtHAdcM4wyaWfEi3eGn/jZPcbNiDGdddShgy3WKJMzIcURyIKsScYaD8TIvb
 NQXQ==
X-Gm-Message-State: AOJu0YxM8V7SHaYkwbdM1GDRNEbxnXhXElQCjhodLs3RKBhre5aggsHd
 w47kbOPWC9+Mku97l0ZHPDBRx9IXr+TZEG7Eb1L1BQ==
X-Google-Smtp-Source: AGHT+IGAfd74P9yx0nc2KiABSnElGYTnepENJsYtWliZ+g0y9LWw0IHdbTNPBs473It21Lgw8vWq6UsEAVUukNqm/hI=
X-Received: by 2002:a05:6122:18aa:b0:496:80b6:2fd1 with SMTP id
 bi42-20020a05612218aa00b0049680b62fd1mr2519624vkb.5.1702267489809; Sun, 10
 Dec 2023 20:04:49 -0800 (PST)
MIME-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-10-almasrymina@google.com>
 <32211cbf-3a4e-8a86-6214-4304ddb18a98@huawei.com>
 <CAHS8izOQcuLPwvDff96fuNB7r6EU9OWt3ShueQp=u7wat3L5LA@mail.gmail.com>
 <92e30bd9-6df4-b72f-7bcd-f4fe5670eba2@huawei.com>
 <CAHS8izPEFsqw50qgM+sPot6XVvOExpd+DrwrmPSR3zsWGLysRw@mail.gmail.com>
In-Reply-To: <CAHS8izPEFsqw50qgM+sPot6XVvOExpd+DrwrmPSR3zsWGLysRw@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 10 Dec 2023 20:04:36 -0800
Message-ID: <CAHS8izN6Cbjy0FCYhJyNsP396XfgJ_nTFXWuHb5QWNct=PifAg@mail.gmail.com>
Subject: Re: [net-next v1 09/16] page_pool: device memory support
To: Yunsheng Lin <linyunsheng@huawei.com>
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Shailend Chand <shailend@google.com>,
 Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 10, 2023 at 6:26=E2=80=AFPM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> On Sun, Dec 10, 2023 at 6:04=E2=80=AFPM Yunsheng Lin <linyunsheng@huawei.=
com> wrote:
> >
> > On 2023/12/9 0:05, Mina Almasry wrote:
> > > On Fri, Dec 8, 2023 at 1:30=E2=80=AFAM Yunsheng Lin <linyunsheng@huaw=
ei.com> wrote:
> > >>
> > >>
> > >> As mentioned before, it seems we need to have the above checking eve=
ry
> > >> time we need to do some per-page handling in page_pool core, is ther=
e
> > >> a plan in your mind how to remove those kind of checking in the futu=
re?
> > >>
> > >
> > > I see 2 ways to remove the checking, both infeasible:
> > >
> > > 1. Allocate a wrapper struct that pulls out all the fields the page p=
ool needs:
> > >
> > > struct netmem {
> > >         /* common fields */
> > >         refcount_t refcount;
> > >         bool is_pfmemalloc;
> > >         int nid;
> > >         ...
> > >         union {
> > >                 struct dmabuf_genpool_chunk_owner *owner;
> > >                 struct page * page;
> > >         };
> > > };
> > >
> > > The page pool can then not care if the underlying memory is iov or
> > > page. However this introduces significant memory bloat as this struct
> > > needs to be allocated for each page or ppiov, which I imagine is not
> > > acceptable for the upside of removing a few static_branch'd if
> > > statements with no performance cost.
> > >
> > > 2. Create a unified struct for page and dmabuf memory, which the mm
> > > folks have repeatedly nacked, and I imagine will repeatedly nack in
> > > the future.
> > >
> > > So I imagine the special handling of ppiov in some form is critical
> > > and the checking may not be removable.
> >
> > If the above is true, perhaps devmem is not really supposed to be inter=
gated
> > into page_pool.
> >
> > Adding a checking for every per-page handling in page_pool core is just=
 too
> > hacky to be really considerred a longterm solution.
> >
>
> The only other option is to implement another page_pool for ppiov and
> have the driver create page_pool or ppiov_pool depending on the state
> of the netdev_rx_queue (or some helper in the net stack to do that for
> the driver). This introduces some code duplication. The ppiov_pool &
> page_pool would look similar in implementation.
>
> But this was all discussed in detail in RFC v2 and the last response I
> heard from Jesper was in favor if this approach, if I understand
> correctly:
>
> https://lore.kernel.org/netdev/7aedc5d5-0daf-63be-21bc-3b724cc1cab9@redha=
t.com/
>
> Would love to have the maintainer weigh in here.
>

I should note we may be able to remove some of the checking, but maybe not =
all.

- Checks that disable page fragging for ppiov can be removed once
ppiov has frag support (in this series or follow up).

- If we use page->pp_frag_count (or page->pp_ref_count) for
refcounting ppiov, we can remove the if checking in the refcounting.

- We may be able to store the dma_addr of the ppiov in page->dma_addr,
but I'm unsure if that actually works, because the dma_buf dmaddr is
dma_addr_t (u32 or u64), but page->dma_addr is unsigned long (4 bytes
I think). But if it works for pages I may be able to make it work for
ppiov as well.

- Checks that obtain the page->pp can work with ppiov if we align the
offset of page->pp and ppiov->pp.

- Checks around page->pp_magic can be removed if we also have offset
aligned ppiov->pp_magic.

Sadly I don't see us removing the checking for these other cases:

- page_is_pfmemalloc(): I'm not allowed to pass a non-struct page into
that helper.

- page_to_nid(): I'm not allowed to pass a non-struct page into that helper=
.

- page_pool_free_va(): ppiov have no va.

- page_pool_sync_for_dev/page_pool_dma_map: ppiov backed by dma-buf
fundamentally can't get mapped again.

Are the removal (or future removal) of these checks enough to resolve this?

> > It is somewhat ironical that devmem is using static_branch to alliviate=
 the
> > performance impact for normal memory at the possible cost of performanc=
e
> > degradation for devmem, does it not defeat some purpose of intergating =
devmem
> > to page_pool?
> >
>
> I don't see the issue. The static branch sets the non-ppiov path as
> default if no memory providers are in use, and flips it when they are,
> making the default branch prediction ideal in both cases.
>
> > >
> > >> Even though a static_branch check is added in page_is_page_pool_iov(=
), it
> > >> does not make much sense that a core has tow different 'struct' for =
its
> > >> most basic data.
> > >>
> > >> IMHO, the ppiov for dmabuf is forced fitting into page_pool without =
much
> > >> design consideration at this point.
> > >>
> > > ...
> > >>
> > >> For now, the above may work for the the rx part as it seems that you=
 are
> > >> only enabling rx for dmabuf for now.
> > >>
> > >> What is the plan to enable tx for dmabuf? If it is also intergrated =
into
> > >> page_pool? There was a attempt to enable page_pool for tx, Eric seem=
ed to
> > >> have some comment about this:
> > >> https://lkml.kernel.org/netdev/2cf4b672-d7dc-db3d-ce90-15b4e91c4005@=
huawei.com/T/#mb6ab62dc22f38ec621d516259c56dd66353e24a2
> > >>
> > >> If tx is not intergrated into page_pool, do we need to create a new =
layer for
> > >> the tx dmabuf?
> > >>
> > >
> > > I imagine the TX path will reuse page_pool_iov, page_pool_iov_*()
> > > helpers, and page_pool_page_*() helpers, but will not need any core
> > > page_pool changes. This is because the TX path will have to piggyback
> >
> > We may need another bit/flags checking to demux between page_pool owned
> > devmem and non-page_pool owned devmem.
> >
>
> The way I'm imagining the support, I don't see the need for such
> flags. We'd be re-using generic helpers like
> page_pool_iov_get_dma_address() and what not that don't need that
> checking.
>
> > Also calling page_pool_*() on non-page_pool owned devmem is confusing
> > enough that we may need a thin layer handling non-page_pool owned devme=
m
> > in the end.
> >
>
> The page_pool_page* & page_pool_iov* functions can be renamed if
> confusing. I would think that's no issue (note that the page_pool_*
> functions need not be called for TX path).
>
> > > on MSG_ZEROCOPY (devmem is not copyable), so no memory allocation fro=
m
> > > the page_pool (or otherwise) is needed or possible. RFCv1 had a TX
> > > implementation based on dmabuf pages without page_pool involvement, I
> > > imagine I'll do something similar.
> > It would be good to have a tx implementation for the next version, so
> > that we can have a whole picture of devmem.
> >
> > >
>
>
>
> --
> Thanks,
> Mina



--
Thanks,
Mina
