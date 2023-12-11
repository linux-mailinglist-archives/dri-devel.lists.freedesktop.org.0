Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DECD480BF12
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 03:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6607110E077;
	Mon, 11 Dec 2023 02:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A859610E06F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 02:26:42 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-4649e4e6fbfso781797137.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Dec 2023 18:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702261601; x=1702866401;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Tcz5MXT3RaIMrhOVMWBMt5zqWEtLULnUCyi7Vfs29I=;
 b=k4fUCoCZDwbdiKTZNSvytpnGNeHO6E6GeX7gw3lsO8rFAVtQ/oRW6jw56zvED3Me/T
 gBOvBIOodmDJNjiAsgrfI58QudVgErBHpzhZmWvnZkxkM2+OYFJtHM0+/aBsQzqXSWn/
 mA2Oo/T1qQ2FN8RFTXIBJqjQBXsRehgA88VcyzbXA7vnGXpfiZpZyckn85kAzaWIMrBJ
 ib8Kk4vWbOzwcFAe7W+2pJRgnfRLiQTgyicYtGZgZYoXuub1Uj+8/Vpqy6A5F5OvXZMB
 5lcEwiXJ1izCB0M+/uNkPobrWjP1/KX0Er7/N3kDvnQibiEWwZuV+amTYMn/AfKbttNY
 ZQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702261601; x=1702866401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Tcz5MXT3RaIMrhOVMWBMt5zqWEtLULnUCyi7Vfs29I=;
 b=wM13AuHfNpBhwmO76irb9SfEZ2nJeCjaGG0jyNzSHCq17vF6UulzUIwEfhDS7uW/mn
 997Q6Aqp714WAK+/WFmMVYu37e74QbWLuBYjPdsN8SwVEMcQvPY+nuCbzwYT7xw42rsQ
 QuUwKzD+JQwe24YX6vtqXrTNmHFyLRdrHWXEMx8Qq8+UyJue6h7E+MNU/BdHrvWxeoOS
 ZwmOGyD/309xD0oJ6RIQZ9dXsdmOByL/QQULosGyKwTsd2CoauYKhpOy1wB/mbKY7Vtg
 KchY2+1lVK71Q1/ng4C3jYdG7hVJhgiMttVachjGW1RW5UIPhSm80YNB1OOuPw3alJ3E
 0krw==
X-Gm-Message-State: AOJu0YzUjRJSZkcDX6GicVdHmmTpUwM/kruXS+PO1lxoapbHJxA2NZDX
 wKAchc5LZGL1sSQH7Ib7xsvJAgrsmsLwRE9ENTmVKg==
X-Google-Smtp-Source: AGHT+IGnrr9t6+NGhIIi9S1/72Jel2CtjV+XUhQz+4hhYbzgspOPRBlJJQgX/XwiMt+LGK0mGwNI6RyoqYpB1OqRiRo=
X-Received: by 2002:a67:c11a:0:b0:462:797b:2b62 with SMTP id
 d26-20020a67c11a000000b00462797b2b62mr2228307vsj.32.1702261601420; Sun, 10
 Dec 2023 18:26:41 -0800 (PST)
MIME-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-10-almasrymina@google.com>
 <32211cbf-3a4e-8a86-6214-4304ddb18a98@huawei.com>
 <CAHS8izOQcuLPwvDff96fuNB7r6EU9OWt3ShueQp=u7wat3L5LA@mail.gmail.com>
 <92e30bd9-6df4-b72f-7bcd-f4fe5670eba2@huawei.com>
In-Reply-To: <92e30bd9-6df4-b72f-7bcd-f4fe5670eba2@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 10 Dec 2023 18:26:29 -0800
Message-ID: <CAHS8izPEFsqw50qgM+sPot6XVvOExpd+DrwrmPSR3zsWGLysRw@mail.gmail.com>
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

On Sun, Dec 10, 2023 at 6:04=E2=80=AFPM Yunsheng Lin <linyunsheng@huawei.co=
m> wrote:
>
> On 2023/12/9 0:05, Mina Almasry wrote:
> > On Fri, Dec 8, 2023 at 1:30=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei=
.com> wrote:
> >>
> >>
> >> As mentioned before, it seems we need to have the above checking every
> >> time we need to do some per-page handling in page_pool core, is there
> >> a plan in your mind how to remove those kind of checking in the future=
?
> >>
> >
> > I see 2 ways to remove the checking, both infeasible:
> >
> > 1. Allocate a wrapper struct that pulls out all the fields the page poo=
l needs:
> >
> > struct netmem {
> >         /* common fields */
> >         refcount_t refcount;
> >         bool is_pfmemalloc;
> >         int nid;
> >         ...
> >         union {
> >                 struct dmabuf_genpool_chunk_owner *owner;
> >                 struct page * page;
> >         };
> > };
> >
> > The page pool can then not care if the underlying memory is iov or
> > page. However this introduces significant memory bloat as this struct
> > needs to be allocated for each page or ppiov, which I imagine is not
> > acceptable for the upside of removing a few static_branch'd if
> > statements with no performance cost.
> >
> > 2. Create a unified struct for page and dmabuf memory, which the mm
> > folks have repeatedly nacked, and I imagine will repeatedly nack in
> > the future.
> >
> > So I imagine the special handling of ppiov in some form is critical
> > and the checking may not be removable.
>
> If the above is true, perhaps devmem is not really supposed to be interga=
ted
> into page_pool.
>
> Adding a checking for every per-page handling in page_pool core is just t=
oo
> hacky to be really considerred a longterm solution.
>

The only other option is to implement another page_pool for ppiov and
have the driver create page_pool or ppiov_pool depending on the state
of the netdev_rx_queue (or some helper in the net stack to do that for
the driver). This introduces some code duplication. The ppiov_pool &
page_pool would look similar in implementation.

But this was all discussed in detail in RFC v2 and the last response I
heard from Jesper was in favor if this approach, if I understand
correctly:

https://lore.kernel.org/netdev/7aedc5d5-0daf-63be-21bc-3b724cc1cab9@redhat.=
com/

Would love to have the maintainer weigh in here.

> It is somewhat ironical that devmem is using static_branch to alliviate t=
he
> performance impact for normal memory at the possible cost of performance
> degradation for devmem, does it not defeat some purpose of intergating de=
vmem
> to page_pool?
>

I don't see the issue. The static branch sets the non-ppiov path as
default if no memory providers are in use, and flips it when they are,
making the default branch prediction ideal in both cases.

> >
> >> Even though a static_branch check is added in page_is_page_pool_iov(),=
 it
> >> does not make much sense that a core has tow different 'struct' for it=
s
> >> most basic data.
> >>
> >> IMHO, the ppiov for dmabuf is forced fitting into page_pool without mu=
ch
> >> design consideration at this point.
> >>
> > ...
> >>
> >> For now, the above may work for the the rx part as it seems that you a=
re
> >> only enabling rx for dmabuf for now.
> >>
> >> What is the plan to enable tx for dmabuf? If it is also intergrated in=
to
> >> page_pool? There was a attempt to enable page_pool for tx, Eric seemed=
 to
> >> have some comment about this:
> >> https://lkml.kernel.org/netdev/2cf4b672-d7dc-db3d-ce90-15b4e91c4005@hu=
awei.com/T/#mb6ab62dc22f38ec621d516259c56dd66353e24a2
> >>
> >> If tx is not intergrated into page_pool, do we need to create a new la=
yer for
> >> the tx dmabuf?
> >>
> >
> > I imagine the TX path will reuse page_pool_iov, page_pool_iov_*()
> > helpers, and page_pool_page_*() helpers, but will not need any core
> > page_pool changes. This is because the TX path will have to piggyback
>
> We may need another bit/flags checking to demux between page_pool owned
> devmem and non-page_pool owned devmem.
>

The way I'm imagining the support, I don't see the need for such
flags. We'd be re-using generic helpers like
page_pool_iov_get_dma_address() and what not that don't need that
checking.

> Also calling page_pool_*() on non-page_pool owned devmem is confusing
> enough that we may need a thin layer handling non-page_pool owned devmem
> in the end.
>

The page_pool_page* & page_pool_iov* functions can be renamed if
confusing. I would think that's no issue (note that the page_pool_*
functions need not be called for TX path).

> > on MSG_ZEROCOPY (devmem is not copyable), so no memory allocation from
> > the page_pool (or otherwise) is needed or possible. RFCv1 had a TX
> > implementation based on dmabuf pages without page_pool involvement, I
> > imagine I'll do something similar.
> It would be good to have a tx implementation for the next version, so
> that we can have a whole picture of devmem.
>
> >



--=20
Thanks,
Mina
