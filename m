Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D3B3BC8F9
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 12:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF18894EB;
	Tue,  6 Jul 2021 10:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B282D894EB;
 Tue,  6 Jul 2021 10:03:48 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id r29so7532973oiw.13;
 Tue, 06 Jul 2021 03:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2N5mg5wsB0KABxRgrRrxbIQeCbB+YJIprU67LIbfneo=;
 b=dfFi3wnvc63SAvvRhbgEI87/6ooxwCvTJW1r7lIZKJNTzXyNVMWX7dQB++bkmTQwV2
 H/IlTU1s/3+HM6Aoy3Y0X81/XCAVqe0b0Vg58mJp0ZILm4Z2CJ+puNb5ncxYzu/7LPp2
 +8ke/ohSu7L+COLs3LR/JDOtcj6VgXyeBomPY+1P0mlUzoSLbhI1VXzqQe9K+c/sa9p/
 Scpl+KbJ+/IfH4hBWnZqod7utqmP/Hq8XnsPIQ9kHmU2GSgiXRlFRRM7iDMdGgaAIDZ9
 5GlUdEk9SEx4KsNZBhTmTYw6w8tHMS+/q4lIRlmCnZQB0O4UFWd2qMS3+p6dFf07h2e8
 ERsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2N5mg5wsB0KABxRgrRrxbIQeCbB+YJIprU67LIbfneo=;
 b=bChFMMbJv6RDNLfTEe87FX2FFi1+9tbIO1kX9NJ/bj7r5hS0dP922Km2Vwpb16CVS1
 sflVC8OxPtr9wBeRUD5AqttElCvKz9re9ofxxAJSt0EJQGIpO7IqJ0/4RAqjFTEz0P9d
 KaE0zmAv/5+D4P6+WSPp8YfMUB6tEuESo75sUs5a0x/noSawW2Cb/5FOlBUzUmtw74/P
 6RX5kwAdazMbLII5+gDzsLDiQMiusqjzaZ0TsF0i/Op5NcFUpIgbKkqyUt1rxQeuqiFH
 6UiRbPLIEFCGv4196D9swp4Tevv5woLzIf50ruW5JJKOjAN5152NQ/1NKsM6/Bj88cnv
 rvvQ==
X-Gm-Message-State: AOAM530AioZoC73yRvJD8mx/mj3uU8x+JnToLC+grneGrK2hYs7Dcvr1
 +S+XQLk+IGUXh7zhplhYhy8rEBZakG+nyFWjvmo=
X-Google-Smtp-Source: ABdhPJxXg9vfgqi5VnITV/trPjGjJznTbHk8XvIhqVWfNLh12IDiUiljcMyFHQl4PX1KtOaIuT9dhledABPG7RICBhw=
X-Received: by 2002:aca:3bc3:: with SMTP id i186mr2805715oia.102.1625565827920; 
 Tue, 06 Jul 2021 03:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210705130314.11519-1-ogabbay@kernel.org>
 <YOQXBWpo3whVjOyh@phenom.ffwll.local>
In-Reply-To: <YOQXBWpo3whVjOyh@phenom.ffwll.local>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Tue, 6 Jul 2021 13:03:20 +0300
Message-ID: <CAFCwf10_rTYL2Fy6tCRVAUCf4-6_TtcWCv5gEEkGnQ0KxqMUBg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add p2p via dmabuf to habanalabs
To: Oded Gabbay <ogabbay@kernel.org>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Gal Pressman <galpress@amazon.com>, sleybo@amazon.com, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma <linux-rdma@vger.kernel.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>, 
 Dave Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 6, 2021 at 11:40 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Jul 05, 2021 at 04:03:12PM +0300, Oded Gabbay wrote:
> > Hi,
> > I'm sending v4 of this patch-set following the long email thread.
> > I want to thank Jason for reviewing v3 and pointing out the errors, saving
> > us time later to debug it :)
> >
> > I consulted with Christian on how to fix patch 2 (the implementation) and
> > at the end of the day I shamelessly copied the relevant content from
> > amdgpu_vram_mgr_alloc_sgt() and amdgpu_dma_buf_attach(), regarding the
> > usage of dma_map_resource() and pci_p2pdma_distance_many(), respectively.
> >
> > I also made a few improvements after looking at the relevant code in amdgpu.
> > The details are in the changelog of patch 2.
> >
> > I took the time to write an import code into the driver, allowing me to
> > check real P2P with two Gaudi devices, one as exporter and the other as
> > importer. I'm not going to include the import code in the product, it was
> > just for testing purposes (although I can share it if anyone wants).
> >
> > I run it on a bare-metal environment with IOMMU enabled, on a sky-lake CPU
> > with a white-listed PCIe bridge (to make the pci_p2pdma_distance_many happy).
> >
> > Greg, I hope this will be good enough for you to merge this code.
>
> So we're officially going to use dri-devel for technical details review
> and then Greg for merging so we don't have to deal with other merge
> criteria dri-devel folks have?
I'm glad to receive any help or review, regardless of the subsystem
the person giving that help belongs to.

>
> I don't expect anything less by now, but it does make the original claim
> that drivers/misc will not step all over accelerators folks a complete
> farce under the totally-not-a-gpu banner.
>
> This essentially means that for any other accelerator stack that doesn't
> fit the dri-devel merge criteria, even if it's acting like a gpu and uses
> other gpu driver stuff, you can just send it to Greg and it's good to go.

What's wrong with Greg ??? ;)

On a more serious note, yes, I do think the dri-devel merge criteria
is very extreme, and effectively drives-out many AI accelerator
companies that want to contribute to the kernel but can't/won't open
their software IP and patents.

I think the expectation from AI startups (who are 90% of the deep
learning field) to cooperate outside of company boundaries is not
realistic, especially on the user-side, where the real IP of the
company resides.

Personally I don't think there is a real justification for that at
this point of time, but if it will make you (and other people here)
happy I really don't mind creating a non-gpu accelerator subsystem
that will contain all the totally-not-a-gpu accelerators, and will
have a more relaxed criteria for upstreaming. Something along an
"rdma-core" style library looks like the correct amount of user-level
open source that should be enough.

The question is, what will happen later ? Will it be sufficient to
"allow" us to use dmabuf and maybe other gpu stuff in the future (e.g.
hmm) ?

If the community and dri-devel maintainers (and you among them) will
assure me it is good enough, then I'll happily contribute my work and
personal time to organize this effort and implement it.

Thanks,
oded

>
> There's quite a lot of these floating around actually (and many do have
> semi-open runtimes, like habanalabs have now too, just not open enough to
> be actually useful). It's going to be absolutely lovely having to explain
> to these companies in background chats why habanalabs gets away with their
> stack and they don't.
>
> Or maybe we should just merge them all and give up on the idea of having
> open cross-vendor driver stacks for these accelerators.
>
> Thanks, Daniel
>
> >
> > Thanks,
> > Oded
> >
> > Oded Gabbay (1):
> >   habanalabs: define uAPI to export FD for DMA-BUF
> >
> > Tomer Tayar (1):
> >   habanalabs: add support for dma-buf exporter
> >
> >  drivers/misc/habanalabs/Kconfig             |   1 +
> >  drivers/misc/habanalabs/common/habanalabs.h |  26 ++
> >  drivers/misc/habanalabs/common/memory.c     | 480 +++++++++++++++++++-
> >  drivers/misc/habanalabs/gaudi/gaudi.c       |   1 +
> >  drivers/misc/habanalabs/goya/goya.c         |   1 +
> >  include/uapi/misc/habanalabs.h              |  28 +-
> >  6 files changed, 532 insertions(+), 5 deletions(-)
> >
> > --
> > 2.25.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
