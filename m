Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAD32842A0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 00:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7591B6E185;
	Mon,  5 Oct 2020 22:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA89E6E185
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 22:43:42 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id l85so10477715oih.10
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 15:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N7Zi+bmxFeTPGGj1PxB9/MLlYHFoog+nnJcFYtwo0O8=;
 b=KVtqpLQoesSPzYMWv+7UD1tFkDy5yyjPi/++9DOuPkCf87SQu/2kTZ3idGVZKfPwCd
 pibU61WH7YP7EEL4itAZdaANj+S6XlMqVnXbtEak6sUMU90UHCO+zSFAMUExqUb1YOcT
 JXHEL9SJtjDQ6Ed3u1L2W1biaZ1QQkU7lcDcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N7Zi+bmxFeTPGGj1PxB9/MLlYHFoog+nnJcFYtwo0O8=;
 b=n9XtDAIFIm5thO84FXU7vBNcaakD7xLpWwzPnFS0z6IaCq8t6jiEgODoKc830FLPiT
 xuZAewVF2DTG7PyP0iB2/+XXNNCXZURMZ68gEroIlMVb05frp77ZsP/+MBHVs7TOFc1t
 vMicEz4xfI5qImpnYKQnyYUeistlt/tlyDpLXEjAGQ6sJEmJ8ST0yaiOYwA4T3iVK3CO
 Ync4eGNmOxD78j3tvsdxRnNVUWKb2sBvaHpwsvZJXRq88aLJSTiW3Y10U+G50raYQHTz
 1csVjm1rJjRplpKX1AXyuy1Ya0sicccPU3kcUsXm2EG3ExnQlfy6B3d3fNDKuby7883p
 8J2g==
X-Gm-Message-State: AOAM5303ZcVXzzqufjpJA91Dm06DtIbqdPuJ2ovh6T6VWhbzqmLYAMs9
 sLULEV12WTEUyjDwgB3VB7wjsT/ayLt4ZWX6au9BlQ==
X-Google-Smtp-Source: ABdhPJyfoPYCOpkuTCOIXoCW2mDiwodpJmuvAJrKdJ2P/BzfZGqk4dj/BBdhzJ7DBqSgjSfRXX8X8v1vcNJVJjv0Yog=
X-Received: by 2002:aca:52c4:: with SMTP id g187mr467717oib.101.1601937822236; 
 Mon, 05 Oct 2020 15:43:42 -0700 (PDT)
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
 <CAKMK7uH97Yb2JFviG_ynGC1hbQ69h9hcyFVFd2PFYHCDzfBN6g@mail.gmail.com>
In-Reply-To: <CAKMK7uH97Yb2JFviG_ynGC1hbQ69h9hcyFVFd2PFYHCDzfBN6g@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 6 Oct 2020 00:43:31 +0200
Message-ID: <CAKMK7uHRxK3yNrvX=+n-XpSv7PDCz8w+mwof3pkUUJq3TpmiuQ@mail.gmail.com>
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

On Mon, Oct 5, 2020 at 8:54 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Mon, Oct 5, 2020 at 8:37 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Mon, Oct 05, 2020 at 08:16:33PM +0200, Daniel Vetter wrote:
> >
> > > > kvm is some similar hack added for P2P DMA, see commit
> > > > add6a0cd1c5ba51b201e1361b05a5df817083618. It might be protected by notifiers..
> > >
> > > Yeah my thinking is that kvm (and I think also vfio, also seems to
> > > have mmu notifier nearby) are ok because of the mmu notiifer. Assuming
> > > that one works correctly.
> >
> > vfio doesn't have a notifier, Alex was looking to add a vfio private
> > scheme in the vma->private_data:
> >
> > https://lore.kernel.org/kvm/159017449210.18853.15037950701494323009.stgit@gimli.home/
> >
> > Guess it never happened.
>
> I was mislead by the mmu notifier in drivers/vfio/vfio.c. But looking
> closer, that's only used by some drivers, I guess to make sure their
> device pagetables are kept in sync with reality. And not to make sure
> the vfio pfn view is kept in sync with reality.
>
> This could get real nasty I think.
>
> > > > So, the answer really is that s390 and media need fixing, and this API
> > > > should go away (or become kvm specific)
> > >
> > > I'm still not clear how you want fo fix this, since your vma->dma_buf
> > > idea is kinda a decade long plan and so just not going to happen:
> >
> > Well, it doesn't mean we have to change every part of dma_buf to
> > participate in this. Just the bits media cares about. Or maybe it is
> > some higher level varient on top of dma_buf.
> >
> > Or don't use dma_buf for this, add a new object that just provides
> > refcounts and P2P DMA connection for IO pfn ranges..
>
> So good news is, I dug some layers deeper in v4l, and there's only 2
> users which do actually handle pfn and don't immediately convert to a
> pages array:
> - videbuf-dma-contig.c. Luckily videobuf 1 is deprecated since
> forever, so I think we might get away with either just breaking this,
> or at least tainting kernels and hiding it behind a nasty Kconfig.
> This only uses follow_pfn, which we need to keep anyway for vfio in
> the unsafe variant :-/
> - videbuf2-vmalloc.c Digging through history this was added to support
> import of v4l buffers from drivers that needed contig memory. And way
> back before CMA, that meant carveout memory not backed by struct page
> *. That should now all have struct pages and be managed by CMA (since
> videbuf2-dma-contig.c just uses dma_alloc_coherent underneath), so I
> think we can just switch to pin_user_pages(FOLL_LONGTERM here too).
>
> iow I think I can outright delete the frame vector stuff.

Ok this doesn't work, because dma_mmap always uses a remap_pfn_range,
which is a VM_IO | VM_PFNMAP vma and so even if it's cma backed and
not a carveout, we can't get the pages. Plus trying to move the cma
pages out of cma for FOLL_LONGTERM would be kinda bad when they've
been allocated as a contig block by dma_alloc_coherent :-)

So this idea of switching over to pup only is going to break zerocopy.
I guess I'll need something else for this then.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
