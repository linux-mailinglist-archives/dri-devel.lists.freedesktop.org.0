Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2147E283F0D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 20:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64600892B6;
	Mon,  5 Oct 2020 18:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EEE892B6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 18:54:27 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id f37so6131996otf.12
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 11:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=riuDo1IoXfibXlfR95ykbMPthEQRl10/UIOttc6DAlc=;
 b=OPEUVmyk+vRCYMZLowcoJCe66KrXHU7rFzOGuwvpAWzjQt85t26GeiBNJSVlLLjdvw
 IPvkPM1oH6EvZKjVxvy+zdz/tX3xjNAE+ZPS2bki4mizwYxgbHlbrh2rQasAL+fFyYAY
 b+JjR1NWVmVC0VwtGmMDFoA2fjzgOz0Zifv98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=riuDo1IoXfibXlfR95ykbMPthEQRl10/UIOttc6DAlc=;
 b=k6Fmdzd2EPMgCXbTc7MB22rMrsFlKjCWlDgtd1YEfh/2R8mQxwhFjs+ugHgFm8ahsR
 O/wmNjTVsgwAOwROOYS/KqsPESONvkx5pQwU7cT6pA8cNXlxyfpr9tSvesxtjji+W0qI
 6WbV+bEqzx/afKNehAn5YPbIqTFQbQn3XZt52+vfkLVqTFuxCXx5QdO1cxXWv93nE4Re
 uLLE/Tyk/CLHtKbI0bfbxJ9N2FNko2ueQETdqv+S51SeL7FHXuzqnwus0xajo2uKXLik
 ErHBYKKW3vz56VOp4HGOZ0Vs+Ftq7Ib0Xkusxm2fEq9PnAyeDxHscM2YUSWDnwlEgvfM
 gaNg==
X-Gm-Message-State: AOAM531bGETTskqrPxxdC9W4ij/oQ9R1Hu99Ws+xkpKg3WwhkZ5Vdky6
 i8TGpKD89L5SDSp2b4Am3ktZDVrMn8k4FwWmFbRYaQ==
X-Google-Smtp-Source: ABdhPJy2iw+CknXeuJOFUrqB9oxUe8+tYDJ+itV1cU93c0kTfuWKEYCQyo751DNTn5DqrD42UQCpOE2tQNA/FTrVskw=
X-Received: by 2002:a05:6830:1647:: with SMTP id
 h7mr493595otr.281.1601924066976; 
 Mon, 05 Oct 2020 11:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <20201004125059.GP9916@ziepe.ca>
 <CAKMK7uF0AfuYGsHzKXhF=k-mAW=Wx_APf9fY9M9ormnwypoxZA@mail.gmail.com>
 <20201005172854.GA5177@ziepe.ca>
 <CAKMK7uFzxWF7V=7vkeNC-8shsPZRgdz9fYTsn0ayENv2BpnFEg@mail.gmail.com>
 <20201005183704.GC5177@ziepe.ca>
In-Reply-To: <20201005183704.GC5177@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 5 Oct 2020 20:54:15 +0200
Message-ID: <CAKMK7uH97Yb2JFviG_ynGC1hbQ69h9hcyFVFd2PFYHCDzfBN6g@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Pawel Osciak <pawel@osciak.com>, John Hubbard <jhubbard@nvidia.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 5, 2020 at 8:37 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Mon, Oct 05, 2020 at 08:16:33PM +0200, Daniel Vetter wrote:
>
> > > kvm is some similar hack added for P2P DMA, see commit
> > > add6a0cd1c5ba51b201e1361b05a5df817083618. It might be protected by notifiers..
> >
> > Yeah my thinking is that kvm (and I think also vfio, also seems to
> > have mmu notifier nearby) are ok because of the mmu notiifer. Assuming
> > that one works correctly.
>
> vfio doesn't have a notifier, Alex was looking to add a vfio private
> scheme in the vma->private_data:
>
> https://lore.kernel.org/kvm/159017449210.18853.15037950701494323009.stgit@gimli.home/
>
> Guess it never happened.

I was mislead by the mmu notifier in drivers/vfio/vfio.c. But looking
closer, that's only used by some drivers, I guess to make sure their
device pagetables are kept in sync with reality. And not to make sure
the vfio pfn view is kept in sync with reality.

This could get real nasty I think.

> > > So, the answer really is that s390 and media need fixing, and this API
> > > should go away (or become kvm specific)
> >
> > I'm still not clear how you want fo fix this, since your vma->dma_buf
> > idea is kinda a decade long plan and so just not going to happen:
>
> Well, it doesn't mean we have to change every part of dma_buf to
> participate in this. Just the bits media cares about. Or maybe it is
> some higher level varient on top of dma_buf.
>
> Or don't use dma_buf for this, add a new object that just provides
> refcounts and P2P DMA connection for IO pfn ranges..

So good news is, I dug some layers deeper in v4l, and there's only 2
users which do actually handle pfn and don't immediately convert to a
pages array:
- videbuf-dma-contig.c. Luckily videobuf 1 is deprecated since
forever, so I think we might get away with either just breaking this,
or at least tainting kernels and hiding it behind a nasty Kconfig.
This only uses follow_pfn, which we need to keep anyway for vfio in
the unsafe variant :-/
- videbuf2-vmalloc.c Digging through history this was added to support
import of v4l buffers from drivers that needed contig memory. And way
back before CMA, that meant carveout memory not backed by struct page
*. That should now all have struct pages and be managed by CMA (since
videbuf2-dma-contig.c just uses dma_alloc_coherent underneath), so I
think we can just switch to pin_user_pages(FOLL_LONGTERM here too).

iow I think I can outright delete the frame vector stuff.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
