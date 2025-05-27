Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054A8AC50B9
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 16:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A4D10E29B;
	Tue, 27 May 2025 14:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CJbGsMws";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC2310E29B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 14:21:39 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-3feaedb531dso560364b6e.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 07:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748355699; x=1748960499; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hwr1gpmj/Y5xrm528qSwLq/tkBaVoA9zaC9zXNPG4sg=;
 b=CJbGsMws8QYyj2OFARl8Krv3K7gOhrT+tJtJe1vSjM+FXxSPkgKIgD77VXna9uSopR
 IyFZ+fWs7spi8aL72VChop0OOENYWgbdbeZsCiznqTUpsF2XcxbjtAoozoAFcFCk92uA
 yt+OQh7GCEPI2QN4qK8n4mDvixMAX+Wg+QcUQyLPJyIgCfLdXI99RvDlkhES9vB8jChE
 DGVaa8khEt9aR+Nl+ehh9z+mwcg8jgFJa39bQhq/vpLeIAp2FGmW8DnjNuVREJ9P0i6i
 61nzY7UKIJD879C/kNwy+s1yfesXzhmjNRk2VzhtZCoCs+9uHn71+Wv74dkaTL2MMID9
 yghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748355699; x=1748960499;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hwr1gpmj/Y5xrm528qSwLq/tkBaVoA9zaC9zXNPG4sg=;
 b=ShE8KT3RFkRv6iFnRskVGgB5kxwxNe/CCwchLpflkhkzQrr5VRcpF+dj47yV+fW8ji
 IMJDx9fLCVySE///W+teogq+ljOpteUbRNweiSP/TITuAIFh0IRUsYSRjz+f2/695mED
 qGVKgtThK0u6bJ9Fjh4m15Sxu3DgumSfPjv/V3Q2E5WDP2umUM/QdSfJnJoGxkz1u1Vh
 biL0wmqvEBeN6ls5T48OS1wOjT+U3/8f9wzaJJKXxOkmDs+GhoQLrM7Sm3d/KElc8Nnk
 d1ZPaCUoLZ0GeGrF2xRPFY9Rmvq/XUT97IiyOkwcQFulDZVA6KwyD/Wp0ZN0ci/MFxff
 ceDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdlCTpXWiUFvnKcS5XaJkqtqIi0UtW5rswGMrNRGKERJOvJBJeW4ckuLCXvkx2yo8vIom9j3zIaq8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwT9A1k+QPsSbnCcAbogW7TepspbPYQH07MeAFU1SR/QGhivSmU
 WoIbjgVLldnxmPBkhxLqWiYDRJtzk9f4N+fX4zsNMCmHZM+F00GpdPIVIdCLOLMnlKd9qrkfndX
 h/Or6DEDqoufoTtM7mvx6AVYMKZS8/KYCwNJCSmnZLQ==
X-Gm-Gg: ASbGncvT4ts+O9YC5D9tUPWV3O3yzEjXfhWWpCL7cbPsw96RoH8ICzWjReRySbbT0M3
 RQqeXLu40YFpnCJu3vzWOeQKk9pcB68YRISvXuPxOW2lLAirdhAFvMBML6KMOPW9HD32ZsHvZhU
 lmT6QpJzjqKAkqPmRJ65HFmyg+xrC8Fp0I5A==
X-Google-Smtp-Source: AGHT+IHSldvXeMA/elq5GvdUeZXIE9U2qVSq25l+1UuvJ7nlZ4QemLu8hmu4wkxm84jlPfHrWshtHT5sVpyeKj3x5HU=
X-Received: by 2002:a05:6808:1b85:b0:402:ebf9:b770 with SMTP id
 5614622812f47-40646855c6dmr6484125b6e.28.1748355698671; Tue, 27 May 2025
 07:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-7-jens.wiklander@linaro.org>
 <aDQWt5Ck1Bo01Z_4@sumit-X1>
 <CAHUa44E4-z7-7DQjyGXYRiZDf6mRBKYZDuxWFGy+3JxtWO1ocg@mail.gmail.com>
 <aDQ1YR5jbcOFctty@sumit-X1>
In-Reply-To: <aDQ1YR5jbcOFctty@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 27 May 2025 16:21:27 +0200
X-Gm-Features: AX0GCFufndHj8dMt0PaaB1DfiHys-ZIzTuXpul-y9wKknnwSsO_zDsCVnQgE3aw
Message-ID: <CAHUa44HUzfWXEdLeAVimDM0DTFaTbCa4SSTcy8YPhDjWHR352Q@mail.gmail.com>
Subject: Re: [PATCH v9 6/9] tee: add tee_shm_alloc_dma_mem()
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
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

On Mon, May 26, 2025 at 11:33=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org>=
 wrote:
>
> On Mon, May 26, 2025 at 11:21:47AM +0200, Jens Wiklander wrote:
> > On Mon, May 26, 2025 at 9:22=E2=80=AFAM Sumit Garg <sumit.garg@kernel.o=
rg> wrote:
> > >
> > > On Tue, May 20, 2025 at 05:16:49PM +0200, Jens Wiklander wrote:
> > > > Add tee_shm_alloc_dma_mem() to allocate DMA memory. The memory is
> > > > represented by a tee_shm object using the new flag TEE_SHM_DMA_MEM =
to
> > > > identify it as DMA memory. The allocated memory will later be lent =
to
> > > > the TEE to be used as protected memory.
> > > >
> > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > ---
> > > >  drivers/tee/tee_shm.c    | 74 ++++++++++++++++++++++++++++++++++++=
++--
> > > >  include/linux/tee_core.h |  5 +++
> > > >  2 files changed, 77 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > > > index e1ed52ee0a16..92a6a35e1a1e 100644
> > > > --- a/drivers/tee/tee_shm.c
> > > > +++ b/drivers/tee/tee_shm.c
> > > > @@ -5,6 +5,8 @@
> > > >  #include <linux/anon_inodes.h>
> > > >  #include <linux/device.h>
> > > >  #include <linux/dma-buf.h>
> > > > +#include <linux/dma-mapping.h>
> > > > +#include <linux/highmem.h>
> > > >  #include <linux/idr.h>
> > > >  #include <linux/io.h>
> > > >  #include <linux/mm.h>
> > > > @@ -13,9 +15,14 @@
> > > >  #include <linux/tee_core.h>
> > > >  #include <linux/uaccess.h>
> > > >  #include <linux/uio.h>
> > > > -#include <linux/highmem.h>
> > > >  #include "tee_private.h"
> > > >
> > > > +struct tee_shm_dma_mem {
> > > > +     struct tee_shm shm;
> > > > +     dma_addr_t dma_addr;
> > > > +     struct page *page;
> > > > +};
> > > > +
> > > >  static void shm_put_kernel_pages(struct page **pages, size_t page_=
count)
> > > >  {
> > > >       size_t n;
> > > > @@ -49,7 +56,14 @@ static void tee_shm_release(struct tee_device *t=
eedev, struct tee_shm *shm)
> > > >       struct tee_shm *parent_shm =3D NULL;
> > > >       void *p =3D shm;
> > > >
> > > > -     if (shm->flags & TEE_SHM_DMA_BUF) {
> > > > +     if (shm->flags & TEE_SHM_DMA_MEM) {
> > > > +             struct tee_shm_dma_mem *dma_mem;
> > > > +
> > > > +             dma_mem =3D container_of(shm, struct tee_shm_dma_mem,=
 shm);
> > > > +             p =3D dma_mem;
> > > > +             dma_free_pages(&teedev->dev, shm->size, dma_mem->page=
,
> > > > +                            dma_mem->dma_addr, DMA_BIDIRECTIONAL);
> > >
> > > Although the kernel bot already found a randconfig issue, it looks li=
ke
> > > we need to add Kconfig dependencies like HAS_DMA, DMA_CMA etc.
> > >
> > > Also, I was thinking if we should rather add a new TEE subsystem
> > > specific Kconfig option like: TEE_DMABUF_HEAPS which can then be used=
 to
> > > select whatever dependency is needed as well as act as a gating Kconf=
ig
> > > for relevant features.
> >
> > You mean something like this?
> >
> > --- a/drivers/tee/Kconfig
> > +++ b/drivers/tee/Kconfig
> > @@ -13,6 +13,14 @@ menuconfig TEE
> >
> >  if TEE
> >
> > +config TEE_DMABUF_HEAPS
> > +       bool
> > +       depends on HAS_DMA && DMABUF_HEAPS
>
> Yeah this looks fine to me but needs to be tested if DMA_CMA is a
> dependency here too.

Why? It can work without CMA for small allocations.

>
> > +
> > +config TEE_STATIC_PROTMEM_POOL
> > +       bool
> > +       depends on HAS_IOMEM && TEE_DMABUF_HEAPS
>
> The static and dynamic protected memory pools should get auto enabled if
> TEE_DMABUF_HEAPS is enabled since they are pre-requisite to provide the
> protected heaps support. Something like:
>
> +config TEE_STATIC_PROTMEM_POOL
> +       bool
> +       default y if TEE_DMABUF_HEAPS
> +       depends on HAS_IOMEM

Right, I'll update as needed.

Cheers,
Jens
