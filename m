Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F597E4C6D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 00:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83BF10E17A;
	Tue,  7 Nov 2023 23:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49CD10E17A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 23:04:07 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-7b9cd171d0dso2564790241.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 15:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699398247; x=1700003047;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LwSWVxQJlefO2RXGLXTB5EQnzK3f7Ti0RFRCIocUVAs=;
 b=sT14XdOQ+9+wWcxmIzCNYRG9z+SEKGO9RMPkZYyc3BTxnBiuP9VWC9KBiRskqXSb5J
 j2PmJiY++Jh+5RcIrgeYqYjONFyvbaK20tR3TYStEnvMb+Tdj3plpx6YzOYlEVlkh/ww
 HeofcE1dCEWggDGozl6hqQFdi4Fc4tF4IWvYN+ZN967qPvGFmG6AbOPYkrEBT5lFkmps
 qO/tUMa4w4EoEML/MJz+IBiUyNLdtAUJ+c5h9gbmLOVo1e0ZEC8kf7guBFEGKPbPHozv
 +kxUkkolBHOHy0iNxLlVz4c7U10J9p00HaDEnArUp2sJeuNR9ERZhfOQTVqYNx3LWsE1
 /RIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699398247; x=1700003047;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LwSWVxQJlefO2RXGLXTB5EQnzK3f7Ti0RFRCIocUVAs=;
 b=nJ7Sw6AO25Yl2ELGSD/zCuG1WOoy1x6MA46dJi2aXOMeO/N8cR6Iknrgl9oZWLH1zO
 FO1FyVllW2UeOCHSOMofnTRaIVnT7y1CVYstzlGc2Tq9wRbRpIWCec2kZkmzcb5d9rMO
 8KcvJVPBbAEBS46i9VdPm4bO7y7M3XK7+t43POD5BRletkxJyqDMfr7RI0PrAuF2GyIK
 6wmiZaY7Qh6A3Wv+Wmhl1MgVLhgtldC4JDXKeUs0079RATVpGj0BJ8OZi3e3a/im+yHE
 jBpcQmn+teJuBY15HbWd0AMv2GQx6sx3wsEXOg6/afn2Zgokg8IDNZa7VCNKoIGRQ9vm
 hzaQ==
X-Gm-Message-State: AOJu0Yzao7WHW6YCwYgX3W4P57g04dEOXMJHCVCj2q5LW5lHzGY2ztKL
 33ZUnLDH4deU0lmdT354TCrQm84eHefbMSvSLrBl3A==
X-Google-Smtp-Source: AGHT+IGkIzXyZBaE32+WMwF+duu/QcIsXXrFXzLPRCigy40o3oogjiTft3g4ezREIoF7S18+m0g5FcLRymLotkSR3mA=
X-Received: by 2002:a67:e09b:0:b0:45f:8b65:28f0 with SMTP id
 f27-20020a67e09b000000b0045f8b6528f0mr105754vsl.12.1699398246594; Tue, 07 Nov
 2023 15:04:06 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-6-almasrymina@google.com>
 <3b0d612c-e33b-48aa-a861-fbb042572fc9@kernel.org>
 <CAHS8izOHYx+oYnzksUDrK1S0+6CdMJmirApntP5W862yFumezw@mail.gmail.com>
 <a5b95e6b-8716-4e2e-9183-959b754b5b5e@kernel.org>
In-Reply-To: <a5b95e6b-8716-4e2e-9183-959b754b5b5e@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 7 Nov 2023 15:03:53 -0800
Message-ID: <CAHS8izMKDOw5_y2MLRfuJHs=ai+sZ6GF7Rg1NuR_JqONg-5u5Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 05/12] netdev: netdevice devmem allocator
To: David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Shakeel Butt <shakeelb@google.com>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 7, 2023 at 2:55=E2=80=AFPM David Ahern <dsahern@kernel.org> wro=
te:
>
> On 11/7/23 3:10 PM, Mina Almasry wrote:
> > On Mon, Nov 6, 2023 at 3:44=E2=80=AFPM David Ahern <dsahern@kernel.org>=
 wrote:
> >>
> >> On 11/5/23 7:44 PM, Mina Almasry wrote:
> >>> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> >>> index eeeda849115c..1c351c138a5b 100644
> >>> --- a/include/linux/netdevice.h
> >>> +++ b/include/linux/netdevice.h
> >>> @@ -843,6 +843,9 @@ struct netdev_dmabuf_binding {
> >>>  };
> >>>
> >>>  #ifdef CONFIG_DMA_SHARED_BUFFER
> >>> +struct page_pool_iov *
> >>> +netdev_alloc_devmem(struct netdev_dmabuf_binding *binding);
> >>> +void netdev_free_devmem(struct page_pool_iov *ppiov);
> >>
> >> netdev_{alloc,free}_dmabuf?
> >>
> >
> > Can do.
> >
> >> I say that because a dmabuf can be host memory, at least I am not awar=
e
> >> of a restriction that a dmabuf is device memory.
> >>
> >
> > In my limited experience dma-buf is generally device memory, and
> > that's really its use case. CONFIG_UDMABUF is a driver that mocks
> > dma-buf with a memfd which I think is used for testing. But I can do
> > the rename, it's more clear anyway, I think.
>
> config UDMABUF
>         bool "userspace dmabuf misc driver"
>         default n
>         depends on DMA_SHARED_BUFFER
>         depends on MEMFD_CREATE || COMPILE_TEST
>         help
>           A driver to let userspace turn memfd regions into dma-bufs.
>           Qemu can use this to create host dmabufs for guest framebuffers=
.
>
>
> Qemu is just a userspace process; it is no way a special one.
>
> Treating host memory as a dmabuf should radically simplify the io_uring
> extension of this set.

I agree actually, and I was about to make that comment to David Wei's
series once I have the time.

David, your io_uring RX zerocopy proposal actually works with devmem
TCP, if you're inclined to do that instead, what you'd do roughly is
(I think):

- Allocate a memfd,
- Use CONFIG_UDMABUF to create a dma-buf out of that memfd.
- Bind the dma-buf to the NIC using the netlink API in this RFC.
- Your io_uring extensions and io_uring uapi should work as-is almost
on top of this series, I think.

If you do this the incoming packets should land into your memfd, which
may or may not work for you. In the future if you feel inclined to use
device memory, this approach that I'm describing here would be more
extensible to device memory, because you'd already be using dma-bufs
for your user memory; you'd just replace one kind of dma-buf (UDMABUF)
with another.

> That the io_uring set needs to dive into
> page_pools is just wrong - complicating the design and code and pushing
> io_uring into a realm it does not need to be involved in.
>
> Most (all?) of this patch set can work with any memory; only device
> memory is unreadable.
>
>


--=20
Thanks,
Mina
