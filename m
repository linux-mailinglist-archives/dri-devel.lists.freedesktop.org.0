Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC6B3BCA33
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 12:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CCE89E65;
	Tue,  6 Jul 2021 10:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBA389E65
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 10:37:03 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id r29so7616305oiw.13
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 03:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SAa3xS01Ip/WPvwntU0vFLMJjul0CGOxjhmVkJHt/rw=;
 b=RO7iacH4Ti46dB63sJGmihRm41QJsDCce6RQmPELZZwX88PmkhaUm6ORroBBGsrxJ5
 JliO2V4qJ84GuHOn5P2qmo+8BgOvGkLh6zShltaLsTIGyv2AR8Qo4CA+azevq8heOmF0
 5nQVM1kQfFFf11BNsFyJVSgOMslhlh08ECCKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SAa3xS01Ip/WPvwntU0vFLMJjul0CGOxjhmVkJHt/rw=;
 b=Cn857GyO+Kv3rPwFGzGgLK2hzQ5whTV4Cc4OEPG2DOBeWUMgcnsV7LJE7je9hz4Mja
 9NU/LKtKxMWKlXK3hATjaOTEU6dPvmNX0HhalPSbCKZLfGq2/mo62KWcDoJ6wrIDppEI
 U4BtR6Y5mWYYAH2QF9BJl6TpK29QdLGH2BV60dvJ4mRHgshaJFjHw3SH1oWqcw+Te654
 MPqPHz7r6eP/rrsZsq24ND9NsypbX6A335xVGsBabzUIIP2xQ6R709DFluK8SKswUMZG
 VInKtxYdP8q9ArXzwjrtah9bNHm2DC3kX280905qSfddm2PUamusTv8XwfWTRZYn2qVi
 OIUQ==
X-Gm-Message-State: AOAM532tHpdfb2+qfwvjCS5pvfRt2RH5yMA8f6S2OKi9B7Tq5Y95o4J5
 UzKT2tR+SuHPiIgkNuHKdptgjOxR7WX3Fv2jw4JAVA==
X-Google-Smtp-Source: ABdhPJzFP5Rey6uDVNPkHZ8O/ksj87/Qzd55Tc8MLA8caEMjMvhc6V5amUJSzYIDylLYeLLouoJKTxv8ApB6Qo5anjA=
X-Received: by 2002:aca:f491:: with SMTP id s139mr7925290oih.128.1625567822322; 
 Tue, 06 Jul 2021 03:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210705130314.11519-1-ogabbay@kernel.org>
 <YOQXBWpo3whVjOyh@phenom.ffwll.local>
 <CAFCwf10_rTYL2Fy6tCRVAUCf4-6_TtcWCv5gEEkGnQ0KxqMUBg@mail.gmail.com>
In-Reply-To: <CAFCwf10_rTYL2Fy6tCRVAUCf4-6_TtcWCv5gEEkGnQ0KxqMUBg@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 6 Jul 2021 12:36:51 +0200
Message-ID: <CAKMK7uEAJZUHNLreBB839BZOfnTGNU4rCx-0k55+67Nbxtdx3A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add p2p via dmabuf to habanalabs
To: Oded Gabbay <oded.gabbay@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: sleybo@amazon.com, linux-rdma <linux-rdma@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Gal Pressman <galpress@amazon.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Christoph Hellwig <hch@lst.de>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 6, 2021 at 12:03 PM Oded Gabbay <oded.gabbay@gmail.com> wrote:
>
> On Tue, Jul 6, 2021 at 11:40 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Jul 05, 2021 at 04:03:12PM +0300, Oded Gabbay wrote:
> > > Hi,
> > > I'm sending v4 of this patch-set following the long email thread.
> > > I want to thank Jason for reviewing v3 and pointing out the errors, saving
> > > us time later to debug it :)
> > >
> > > I consulted with Christian on how to fix patch 2 (the implementation) and
> > > at the end of the day I shamelessly copied the relevant content from
> > > amdgpu_vram_mgr_alloc_sgt() and amdgpu_dma_buf_attach(), regarding the
> > > usage of dma_map_resource() and pci_p2pdma_distance_many(), respectively.
> > >
> > > I also made a few improvements after looking at the relevant code in amdgpu.
> > > The details are in the changelog of patch 2.
> > >
> > > I took the time to write an import code into the driver, allowing me to
> > > check real P2P with two Gaudi devices, one as exporter and the other as
> > > importer. I'm not going to include the import code in the product, it was
> > > just for testing purposes (although I can share it if anyone wants).
> > >
> > > I run it on a bare-metal environment with IOMMU enabled, on a sky-lake CPU
> > > with a white-listed PCIe bridge (to make the pci_p2pdma_distance_many happy).
> > >
> > > Greg, I hope this will be good enough for you to merge this code.
> >
> > So we're officially going to use dri-devel for technical details review
> > and then Greg for merging so we don't have to deal with other merge
> > criteria dri-devel folks have?
> I'm glad to receive any help or review, regardless of the subsystem
> the person giving that help belongs to.
>
> >
> > I don't expect anything less by now, but it does make the original claim
> > that drivers/misc will not step all over accelerators folks a complete
> > farce under the totally-not-a-gpu banner.
> >
> > This essentially means that for any other accelerator stack that doesn't
> > fit the dri-devel merge criteria, even if it's acting like a gpu and uses
> > other gpu driver stuff, you can just send it to Greg and it's good to go.
>
> What's wrong with Greg ??? ;)
>
> On a more serious note, yes, I do think the dri-devel merge criteria
> is very extreme, and effectively drives-out many AI accelerator
> companies that want to contribute to the kernel but can't/won't open
> their software IP and patents.
>
> I think the expectation from AI startups (who are 90% of the deep
> learning field) to cooperate outside of company boundaries is not
> realistic, especially on the user-side, where the real IP of the
> company resides.
>
> Personally I don't think there is a real justification for that at
> this point of time, but if it will make you (and other people here)
> happy I really don't mind creating a non-gpu accelerator subsystem
> that will contain all the totally-not-a-gpu accelerators, and will
> have a more relaxed criteria for upstreaming. Something along an
> "rdma-core" style library looks like the correct amount of user-level
> open source that should be enough.
>
> The question is, what will happen later ? Will it be sufficient to
> "allow" us to use dmabuf and maybe other gpu stuff in the future (e.g.
> hmm) ?
>
> If the community and dri-devel maintainers (and you among them) will
> assure me it is good enough, then I'll happily contribute my work and
> personal time to organize this effort and implement it.

I think dri-devel stance is pretty clear and well known: We want the
userspace to be open, because that's where most of the driver stack
is. Without an open driver stack there's no way to ever have anything
cross-vendor.

And that includes the compiler and anything else you need to drive the hardware.

Afaik linux cpu arch ports are also not accepted if there's no open
gcc or llvm port around, because without that the overall stack just
becomes useless.

If that means AI companies don't want to open our their hw specs
enough to allow that, so be it - all you get in that case is
offloading the kernel side  of the stack for convenience, with zero
long term prospects to ever make this into a cross vendor subsystem
stack that does something useful. If the business case says you can't
open up your hw enough for that, I really don't see the point in
merging such a driver, it'll be an unmaintainable stack by anyone else
who's not having access to those NDA covered specs and patents and
everything.

If the stack is actually cross vendor to begin with that's just bonus,
but generally that doesn't happen voluntarily and needs a few years to
decades to get there. So that's not really something we require.

tldr; just a runtime isn't enough for dri-devel.

Now Greg seems to be happy to merge kernel drivers that aren't useful
with the open bits provided, so *shrug*.

Cheers, Daniel

PS: If requiring an actually useful open driver stack is somehow
*extreme* I have no idea why we even bother with merging device
drivers to upstream. Just make a stable driver api and done, vendors
can then do whatever they feel like and protect their "valuable IP and
patents" or whatever it is.

> Thanks,
> oded
>
> >
> > There's quite a lot of these floating around actually (and many do have
> > semi-open runtimes, like habanalabs have now too, just not open enough to
> > be actually useful). It's going to be absolutely lovely having to explain
> > to these companies in background chats why habanalabs gets away with their
> > stack and they don't.
> >
> > Or maybe we should just merge them all and give up on the idea of having
> > open cross-vendor driver stacks for these accelerators.
> >
> > Thanks, Daniel
> >
> > >
> > > Thanks,
> > > Oded
> > >
> > > Oded Gabbay (1):
> > >   habanalabs: define uAPI to export FD for DMA-BUF
> > >
> > > Tomer Tayar (1):
> > >   habanalabs: add support for dma-buf exporter
> > >
> > >  drivers/misc/habanalabs/Kconfig             |   1 +
> > >  drivers/misc/habanalabs/common/habanalabs.h |  26 ++
> > >  drivers/misc/habanalabs/common/memory.c     | 480 +++++++++++++++++++-
> > >  drivers/misc/habanalabs/gaudi/gaudi.c       |   1 +
> > >  drivers/misc/habanalabs/goya/goya.c         |   1 +
> > >  include/uapi/misc/habanalabs.h              |  28 +-
> > >  6 files changed, 532 insertions(+), 5 deletions(-)
> > >
> > > --
> > > 2.25.1
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
