Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D04E778097
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 20:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8373010E5DC;
	Thu, 10 Aug 2023 18:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0F810E5DC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 18:45:06 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-78caeb69125so422930241.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 11:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691693105; x=1692297905;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pJOLYvirEbTcTz/cZZPdQ88ne7irvm58XPg3wuYDHTQ=;
 b=4OMf+RbXMCV3q8WS2zgzJDNbRBusKRgpLfBwP7Qi0BEdMoDYjima6tACk4tSCXLbZE
 15YGb8uC9JeCafmRLfdQP/iZi7BPTgdVQV3A7LdqXmq/11WNfQ5MKlpanT/30tYVjaYI
 ii23sbNM3TO3ZHjt4s/cqQP2X3OtYS2VsyPQb9bpsULNK6Q3mgYanHhcajokKrKh8oyR
 1QRjWSr0zuYhAv08g9FjehcM9PlNaZ91lqRtWxZCb23LhPNRZt8rGNVF7t58DiS9Rb/u
 L+A0kpld6LXn838LuVRRICT+b0Ej4BezwwhHBJI58aUnosXUTePjo4bb/TNqX48fCYHJ
 WOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691693105; x=1692297905;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pJOLYvirEbTcTz/cZZPdQ88ne7irvm58XPg3wuYDHTQ=;
 b=dc7b4n8i3sZV19YhM7VfRr6xcn2Lg6iQZ6GcrUoOJKLc5/of9RStJfJAa8/yir39Te
 Iy409E3Ho+UpOD6p8YS6mWv3o08F+zvkv1c+nw/8VX5Akw0ndZ6vUrF5s0ZtSs320uBU
 RsqKho0US1qS/dz1GGk/ssmxWxvmo4iav2Hljqz7r3mVlfshAX16LRB+KiOyKOBS2CUT
 8jA8CYxOEc8cJjFQGginEEQuyTRTCAS176xeFLoTGL0F1D4WunmjYRPSlz2dEs3qMakR
 bnJO45GvugGP+Sh6zjDfxgFEZnbZStXTelTUHCIdoRJYvaO3sePqLWFYfXPb9X3PcBnY
 wwzw==
X-Gm-Message-State: AOJu0Yy2Pz0VmYUS85PEopFneorJUL0C5lQasHt09t+VRjLBi0fLEwDM
 euqV41vR6N0WzXBMWJPXAVBMGj7ij6qMfMP1pK2Xxw==
X-Google-Smtp-Source: AGHT+IHM1oSo6XktKuBAApMaC3KhaIyouHeqMPfG6PRlybeYMUqn0OBzfdXtowimtp+kduJsa0ZltscvUoI0CXPMu9I=
X-Received: by 2002:a05:6102:3c3:b0:445:5005:d7ab with SMTP id
 n3-20020a05610203c300b004455005d7abmr2533271vsq.18.1691693105227; Thu, 10 Aug
 2023 11:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
 <1009bd5b-d577-ca7b-8eff-192ee89ad67d@amd.com>
In-Reply-To: <1009bd5b-d577-ca7b-8eff-192ee89ad67d@amd.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 10 Aug 2023 11:44:53 -0700
Message-ID: <CAHS8izPrOcrJpE1ysCM7rwHhBMPvj0vQwzfOyVqdxsVux8oMww@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] Device Memory TCP
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 stephen@networkplumber.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Eric Dumazet <edumazet@google.com>, sdf@google.com,
 Andy Lutomirski <luto@kernel.org>, Hari Ramakrishnan <rharix@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 3:29=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 10.08.23 um 03:57 schrieb Mina Almasry:
> > Changes in RFC v2:
> > ------------------
> >
> > The sticking point in RFC v1[1] was the dma-buf pages approach we used =
to
> > deliver the device memory to the TCP stack. RFC v2 is a proof-of-concep=
t
> > that attempts to resolve this by implementing scatterlist support in th=
e
> > networking stack, such that we can import the dma-buf scatterlist
> > directly.
>
> Impressive work, I didn't thought that this would be possible that "easil=
y".
>
> Please note that we have considered replacing scatterlists with simple
> arrays of DMA-addresses in the DMA-buf framework to avoid people trying
> to access the struct page inside the scatterlist.
>

FWIW, I'm not doing anything with the struct pages inside the
scatterlist. All I need from the scatterlist are the
sg_dma_address(sg) and the sg_dma_len(sg), and I'm guessing the array
you're describing will provide exactly those, but let me know if I
misunderstood.

> It might be a good idea to push for that first before this here is
> finally implemented.
>
> GPU drivers already convert the scatterlist used to arrays of
> DMA-addresses as soon as they get them. This leaves RDMA and V4L as the
> other two main users which would need to be converted.
>
> >   This is the approach proposed at a high level here[2].
> >
> > Detailed changes:
> > 1. Replaced dma-buf pages approach with importing scatterlist into the
> >     page pool.
> > 2. Replace the dma-buf pages centric API with a netlink API.
> > 3. Removed the TX path implementation - there is no issue with
> >     implementing the TX path with scatterlist approach, but leaving
> >     out the TX path makes it easier to review.
> > 4. Functionality is tested with this proposal, but I have not conducted
> >     perf testing yet. I'm not sure there are regressions, but I removed
> >     perf claims from the cover letter until they can be re-confirmed.
> > 5. Added Signed-off-by: contributors to the implementation.
> > 6. Fixed some bugs with the RX path since RFC v1.
> >
> > Any feedback welcome, but specifically the biggest pending questions
> > needing feedback IMO are:
> >
> > 1. Feedback on the scatterlist-based approach in general.
>
> As far as I can see this sounds like the right thing to do in general.
>
> Question is rather if we should stick with scatterlist, use array of
> DMA-addresses or maybe even come up with a completely new structure.
>

As far as I can tell, it should be trivial to switch this device
memory TCP implementation to anything that provides:

1. DMA-addresses (sg_dma_address() equivalent)
2. lengths (sg_dma_len() equivalent)

if you go that route. Specifically, I think it will be pretty much a
localized change to netdev_bind_dmabuf_to_queue() implemented in this
patch:
https://lore.kernel.org/netdev/ZNULIDzuVVyfyMq2@ziepe.ca/T/#m2d344b08f54562=
cc9155c3f5b018cbfaed96036f

> > 2. Netlink API (Patch 1 & 2).
>
> How does netlink manage the lifetime of objects?
>

Netlink itself doesn't handle the lifetime of the binding. However,
the API I implemented unbinds the dma-buf when the netlink socket is
destroyed. I do this so that even if the user process crashes or
forgets to unbind, the dma-buf will still be unbound once the netlink
socket is closed on the process exit. Details in this patch:
https://lore.kernel.org/netdev/ZNULIDzuVVyfyMq2@ziepe.ca/T/#m2d344b08f54562=
cc9155c3f5b018cbfaed96036f

On Thu, Aug 10, 2023 at 9:07=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Thu, Aug 10, 2023 at 12:29:08PM +0200, Christian K=C3=B6nig wrote:
> > Am 10.08.23 um 03:57 schrieb Mina Almasry:
> > > Changes in RFC v2:
> > > ------------------
> > >
> > > The sticking point in RFC v1[1] was the dma-buf pages approach we use=
d to
> > > deliver the device memory to the TCP stack. RFC v2 is a proof-of-conc=
ept
> > > that attempts to resolve this by implementing scatterlist support in =
the
> > > networking stack, such that we can import the dma-buf scatterlist
> > > directly.
> >
> > Impressive work, I didn't thought that this would be possible that "eas=
ily".
> >
> > Please note that we have considered replacing scatterlists with simple
> > arrays of DMA-addresses in the DMA-buf framework to avoid people trying=
 to
> > access the struct page inside the scatterlist.
> >
> > It might be a good idea to push for that first before this here is fina=
lly
> > implemented.
> >
> > GPU drivers already convert the scatterlist used to arrays of DMA-addre=
sses
> > as soon as they get them. This leaves RDMA and V4L as the other two mai=
n
> > users which would need to be converted.
>
> Oh that would be a nightmare for RDMA.
>
> We need a standard based way to have scalable lists of DMA addresses :(
>
> > > 2. Netlink API (Patch 1 & 2).
> >
> > How does netlink manage the lifetime of objects?
>
> And access control..
>

Someone will correct me if I'm wrong but I'm not sure netlink itself
will do (sufficient) access control. However I meant for the netlink
API to bind dma-bufs to be a CAP_NET_ADMIN API, and I forgot to add
this check in this proof-of-concept, sorry. I'll add a CAP_NET_ADMIN
check in netdev_bind_dmabuf_to_queue() in the next iteration.
