Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAC97E61D7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 02:42:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5004510E1A5;
	Thu,  9 Nov 2023 01:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C8110E1A5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 01:42:11 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-7ba7b361b22so127033241.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 17:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699494130; x=1700098930;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rtXvJMS7/3Fgi+LpB6nuDO1GbZPELeIfXynT/oP6gbw=;
 b=afQxO4BQMl390z8fWT2eQF6gTgaUnecznWHwRODL+rqakRf0MkzJ8sWJFfkSI4COUk
 sDt8Wndw/yJI5FaiUDSNZneQcVf6CBfwg67mJT1b8Zpa12mSZ/cd1k0YCbGPQTLYzeDL
 Ei/WtBUX8lwmlpTEQmqehn1KRyCtHrETUXrzow0nbbMbYjoOdq7jPvJELkK1hjeRLUlu
 ePErXzliLFQRUeBvCCq0srqAaex95bv7IOREzWfY/v/IqZvSynWljaMouimzHBsgtLKE
 QGO6NU2j7BPv/dbpYdR7mV64YMJl8gB+KXVjwVbrrH3PgaVB/TZKmgVN5vKZ28vOV1G7
 UOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699494130; x=1700098930;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rtXvJMS7/3Fgi+LpB6nuDO1GbZPELeIfXynT/oP6gbw=;
 b=EGrLBiJM31FE8xtGgRSeH1tqNXrRpSZ1gZZsfWhcF/SaY5hCDE4BAUi5ZPjlrrSyIG
 GvZcI8sZvXIeQiqe8G8UhRXSemMNanvdsPh30WmTXEqi+Z/VftwulC2xvdwMEU5uZZs+
 SPg6pY1waoF2y62/612fXnKSVg8RKIZAvcyX7rYK2yn7f1AfaXRJl1R+ZiRs1pMlpS8X
 MLJ9f7mvhuWV6lz37GdTUfdNVKNv3hDnJr4iPZnFgQ933uxG6vk3ePwX/ulHPidFX1kd
 74A7tSM4qctOhk08BAwFbY3LWEds3QJ06TxYP8ImaB1fOe/E1IsuywafB4iItNa8i9I0
 bHCQ==
X-Gm-Message-State: AOJu0YxUZOhYgjCOobVME1DManZc4st/oAbiaoTjcnU75HtJieCM8Du4
 jw/44evdXbeS6n2puaNMp4S8Aj4lgo+2HlSB5zq79Q==
X-Google-Smtp-Source: AGHT+IEgdcG0qqqXy9cIxFiAolh/hrZOW6JAOB3Io/o+JJsEAX7J8FeEEaKDW9kJyXKjNOuzCBypENaeQVzYpVq+vos=
X-Received: by 2002:a05:6102:2082:b0:45d:8660:b91 with SMTP id
 h2-20020a056102208200b0045d86600b91mr3660311vsr.9.1699494130078; Wed, 08 Nov
 2023 17:42:10 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-6-almasrymina@google.com>
 <3b0d612c-e33b-48aa-a861-fbb042572fc9@kernel.org>
 <CAHS8izOHYx+oYnzksUDrK1S0+6CdMJmirApntP5W862yFumezw@mail.gmail.com>
 <6c629d6d-6927-3857-edaa-1971a94b6e93@huawei.com>
In-Reply-To: <6c629d6d-6927-3857-edaa-1971a94b6e93@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 8 Nov 2023 17:41:56 -0800
Message-ID: <CAHS8izPgioCzFGadNFNFWr_tqi--YBF8qrNqi8ELgixA9ZX0rQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 05/12] netdev: netdevice devmem allocator
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > On Mon, Nov 6, 2023 at 11:45=E2=80=AFPM Yunsheng Lin <linyunsheng@huawe=
i.com> wrote:
> >>
> >> On 2023/11/6 10:44, Mina Almasry wrote:
> >>> +
> >>> +void netdev_free_devmem(struct page_pool_iov *ppiov)
> >>> +{
> >>> +     struct netdev_dmabuf_binding *binding =3D page_pool_iov_binding=
(ppiov);
> >>> +
> >>> +     refcount_set(&ppiov->refcount, 1);
> >>> +
> >>> +     if (gen_pool_has_addr(binding->chunk_pool,
> >>> +                           page_pool_iov_dma_addr(ppiov), PAGE_SIZE)=
)
> >>
> >> When gen_pool_has_addr() returns false, does it mean something has gon=
e
> >> really wrong here?
> >>
> >
> > Yes, good eye. gen_pool_has_addr() should never return false, but then
> > again, gen_pool_free()  BUG_ON()s if it doesn't find the address,
> > which is an extremely severe reaction to what can be a minor bug in
> > the accounting. I prefer to leak rather than crash the machine. It's a
> > bit of defensive programming that is normally frowned upon, but I feel
> > like in this case it's maybe warranted due to the very severe reaction
> > (BUG_ON).
>
> I would argue that why is the above defensive programming not done in the
> gen_pool core:)
>

I think gen_pool is not really not that new, and suggesting removing
the BUG_ONs must have been proposed before and rejected. I'll try to
do some research and maybe suggest downgrading the BUG_ON to WARN_ON,
but my guess is there is some reason the maintainer wants it to be a
BUG_ON.

On Wed, Nov 8, 2023 at 5:00=E2=80=AFPM David Wei <dw@davidwei.uk> wrote:
>
> On 2023-11-07 14:55, David Ahern wrote:
> > On 11/7/23 3:10 PM, Mina Almasry wrote:
> >> On Mon, Nov 6, 2023 at 3:44=E2=80=AFPM David Ahern <dsahern@kernel.org=
> wrote:
> >>>
> >>> On 11/5/23 7:44 PM, Mina Almasry wrote:
> >>>> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> >>>> index eeeda849115c..1c351c138a5b 100644
> >>>> --- a/include/linux/netdevice.h
> >>>> +++ b/include/linux/netdevice.h
> >>>> @@ -843,6 +843,9 @@ struct netdev_dmabuf_binding {
> >>>>  };
> >>>>
> >>>>  #ifdef CONFIG_DMA_SHARED_BUFFER
> >>>> +struct page_pool_iov *
> >>>> +netdev_alloc_devmem(struct netdev_dmabuf_binding *binding);
> >>>> +void netdev_free_devmem(struct page_pool_iov *ppiov);
> >>>
> >>> netdev_{alloc,free}_dmabuf?
> >>>
> >>
> >> Can do.
> >>
> >>> I say that because a dmabuf can be host memory, at least I am not awa=
re
> >>> of a restriction that a dmabuf is device memory.
> >>>
> >>
> >> In my limited experience dma-buf is generally device memory, and
> >> that's really its use case. CONFIG_UDMABUF is a driver that mocks
> >> dma-buf with a memfd which I think is used for testing. But I can do
> >> the rename, it's more clear anyway, I think.
> >
> > config UDMABUF
> >         bool "userspace dmabuf misc driver"
> >         default n
> >         depends on DMA_SHARED_BUFFER
> >         depends on MEMFD_CREATE || COMPILE_TEST
> >         help
> >           A driver to let userspace turn memfd regions into dma-bufs.
> >           Qemu can use this to create host dmabufs for guest framebuffe=
rs.
> >
> >
> > Qemu is just a userspace process; it is no way a special one.
> >
> > Treating host memory as a dmabuf should radically simplify the io_uring
> > extension of this set. That the io_uring set needs to dive into
> > page_pools is just wrong - complicating the design and code and pushing
> > io_uring into a realm it does not need to be involved in.
>
> I think our io_uring proposal will already be vastly simplified once we
> rebase onto Kuba's page pool memory provider API. Using udmabuf means
> depending on a driver designed for testing, vs io_uring's registered
> buffers API that's been tried and tested.
>

FWIW I also get an impression that udmabuf is mostly targeting
testing, but I'm not aware of any deficiency that makes it concretely
unsuitable for you. You be the judge.

The only quirk of udmabuf I'm aware of is that it seems to cap the max
dma-buf size to 16000 pages. Not sure if that's due to a genuine
technical limitation or just convenience.

> I don't have an intuitive understanding of the trade offs yet, and would
> need to try out udmabuf and compare vs say using our own page pool
> memory provider.
>


On Wed, Nov 8, 2023 at 5:15=E2=80=AFPM David Wei <dw@davidwei.uk> wrote:
> How would TCP devmem change if we no longer assume that dmabuf is device
> memory?

It wouldn't. The code already never assumes that dmabuf is device
memory. Any dma-buf should work, as far as I can tell. I'm also quite
confident udmabuf works, I use it for testing.

(Jason Gunthrope is much more of an expert and may chime in to say
'some dma-buf will not work'. My primitive understanding is that we're
using dma-bufs without any quirks and any dma-buf should work. I of
course haven't tested all dma-bufs :D)

> Pavel will know more on the perf side, but I wouldn't want to
> put any if/else on the hot path if we can avoid it. I could be wrong,
> but right now in my mind using different memory providers solves this
> neatly and the driver/networking stack doesn't need to care.
>
> Mina, I believe you said at NetDev conf that you already had an udmabuf
> implementation for testing. I would like to see this (you can send
> privately) to see how TCP devmem would handle both user memory and
> device memory.
>

There is nothing to send privately. The patch series you're looking at
supports udma-buf as-is, and the kselftest included with the series
demonstrates devmem TCP working with udmabuf.

The only thing missing from this series is the driver support. You can
see the GVE driver support for devmem TCP here:

https://github.com/torvalds/linux/compare/master...mina:linux:tcpdevmem-v3

You may need to implement devmem TCP for your driver before you can
reproduce udmabuf working for yourself, though.

--=20
Thanks,
Mina
