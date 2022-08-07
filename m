Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD40F58BAA8
	for <lists+dri-devel@lfdr.de>; Sun,  7 Aug 2022 13:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E96D9291D;
	Sun,  7 Aug 2022 11:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CCFA3FC0
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Aug 2022 11:26:01 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-10ea30a098bso7651345fac.8
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Aug 2022 04:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=NklgaVD/JirOYzcQ7dn+KLLpgqBlqBMUxzkjreU6H5k=;
 b=UxYGCm5oJdhgjmJ66RMS5phlQQcjc5W1hXheDuhQUWMPovajhDuDjgDJBO9RbK1J63
 4iupZf6/0gGcG5aaHf7440SDf7+nc9DHnuxgMgTPR6dZDwgMeEyDcJVxWvrq68xK2+fm
 2kUQdsVggqW9y0yitsH4OiB9p1F32qfa6OKgoBcW4aK7qRZnbh4uUG4+vP+Lz+AD1x4z
 TfIigJfzOz6qdCM2/WUdDG/EFebhu3eZsZje6iL3fgOTRn6Q+O8bIEyaJ1LxiKkcWSWU
 uAjeqDEkbe11iPT5OGLstxNR1zvhzDF+QxrmUNGsbE0po3G63Po+LXYlIi6tKMhFcVYO
 TXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=NklgaVD/JirOYzcQ7dn+KLLpgqBlqBMUxzkjreU6H5k=;
 b=m+aJXOp6Wo5RFzRIfEaD4Bqsdz086pE4Yerx7AdKySZqmpKVk7yt9fagQ8ZYoVGRgq
 GPzPEXuhHC8ofBoIJbPq24UHv1BXGNoabc4+PuUBdeCzpcijmNNO/V5pVzRqq1p8NS3Y
 LR1x/Hv77r6R8nT7A2IaUcWUXq5rv/o0HLTLxJKnZA0LqWEKa1fVvcS9EGv4LhDKL+nM
 Ed34uWQ9b69zZWIaRV/UgWXu1DfZsvByB31TKHmTIjeJDUdZNPEUxx1Lxxzi6R9hP3BQ
 fO/5ACjm282Vebnz74ELID1js8Ifl7+YQUEvSAgZNs6zA7ulBnP2CscftoAlrtFQ/aPs
 KxxQ==
X-Gm-Message-State: ACgBeo0wTVfNks0B7CWA4Z8LT0T+uwEk3g6bKcie2Mhi6hkZcqBaD1uf
 Oa9ppz9HbzLClAYlocOiMwFJIRX0CUmtZi2cxKc=
X-Google-Smtp-Source: AA6agR4MHpE2nKZq3Tyr8CXocv1IV6OJHhsOalnlygC+TOspXizARVPJUuOxWDHo1NUpxmFK1I33vPkSNJk9N1YjqCg=
X-Received: by 2002:a05:6870:9193:b0:10d:130e:e57c with SMTP id
 b19-20020a056870919300b0010d130ee57cmr9781618oaf.286.1659871560243; Sun, 07
 Aug 2022 04:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCwf11=9qpNAepL7NL+YAV_QO=Wv6pnWPhKHKAepK3fNn+2Dg@mail.gmail.com>
 <CAPM=9tzWuoWAOjHJdJYVDRjoRq-4wpg2KGiCHjLLd+OfWEh5AQ@mail.gmail.com>
 <CAFCwf12N6DeJAQVjY7PFG50q2m405e=XCCFvHBn1RG65BGbT8w@mail.gmail.com>
 <CAPM=9txSKv_xwZJ6SndtqsdQm6aK1KJVF91dB5Odhc_Xv6Qdrw@mail.gmail.com>
 <CAFCwf10CsLgt+_qT7dT=8DVXsL0a=w=uXN6HC=CpP5EfitvLfQ@mail.gmail.com>
 <YuvctaLwRi+z0Gw4@nvidia.com>
 <CAFCwf12wD3uEhr+kxwN9ROXApHzGh_n1je5susZV5NgGR9fCcQ@mail.gmail.com>
 <Yuxi1eRHPN36Or+1@nvidia.com>
 <CAFCwf13QF_JdzNcpw==zzBoEQUYChMXfechotH31qmAfYZUGmg@mail.gmail.com>
In-Reply-To: <CAFCwf13QF_JdzNcpw==zzBoEQUYChMXfechotH31qmAfYZUGmg@mail.gmail.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Sun, 7 Aug 2022 14:25:33 +0300
Message-ID: <CAFCwf107tLxHKxkPqSRsOHVVp5s2tDEFOOy2oDZUz_KGmv-rDg@mail.gmail.com>
Subject: Re: New subsystem for acceleration devices
To: Jason Gunthorpe <jgg@nvidia.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jiho Chu <jiho.chu@samsung.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 7, 2022 at 9:43 AM Oded Gabbay <oded.gabbay@gmail.com> wrote:
>
> On Fri, Aug 5, 2022 at 3:22 AM Jason Gunthorpe <jgg@nvidia.com> wrote:
> >
> > On Thu, Aug 04, 2022 at 08:48:28PM +0300, Oded Gabbay wrote:
> >
> > > > The flip is true of DRM - DRM is pretty general. I bet I could
> > > > implement an RDMA device under DRM - but that doesn't mean it should
> > > > be done.
> > > >
> > > > My biggest concern is that this subsystem not turn into a back door
> > > > for a bunch of abuse of kernel APIs going forward. Though things
> > > > are
> > >
> > > How do you suggest to make sure it won't happen ?
> >
> > Well, if you launch the subsystem then it is your job to make sure it
> > doesn't happen - or endure the complaints :)
> Understood, I'll make sure there is no room for complaints.
> >
> > Accelerators have this nasty tendancy to become co-designed with their
> > SOCs in nasty intricate ways and then there is a desire to punch
> > through all the inconvenient layers to make it go faster.
> >
> > > > better now, we still see this in DRM where expediency or performance
> > > > justifies hacky shortcuts instead of good in-kernel architecture. At
> > > > least DRM has reliable and experienced review these days.
> > > Definitely. DRM has some parts that are really well written. For
> > > example, the whole char device handling with sysfs/debugfs and managed
> > > resources code.
> >
> > Arguably this should all be common code in the driver core/etc - what
> > value is a subsystem adding beyond that besides using it properly?
>
> I mainly see two things here:
>
> 1. If there is a subsystem which is responsible for creating and
> exposing the device character files, then there should be some code
> that connects between each device driver to that subsystem.
> i.e. There should be functions that each driver should call from its
> probe and release callback functions.
>
> Those functions should take care of the following:
> - Create metadata for the device, the device's minor(s) and the
> driver's ioctls table and driver's callback for file operations (both
> are common for all the driver's devices). Save all that metadata with
> proper locking.
> - Create the device char files themselves and supply file operations
> that will be called per each open/close/mmap/etc.
> - Keep track of all these objects' lifetime in regard to the device
> driver's lifetime, with proper handling for release.
> - Add common handling and entries of sysfs/debugfs for these devices
> with the ability for each device driver to add their own unique
> entries.
>
> 2. I think that you underestimate (due to your experience) the "using
> it properly" part... It is not so easy to do this properly for
> inexperienced kernel people. If we provide all the code I mentioned
> above, the device driver writer doesn't need to be aware of all these
> kernel APIs.
>
Two more points I thought of as examples for added value to be done in
common code:
1. Common code for handling dma-buf. Very similar to what was added a
year ago to rdma. This can be accompanied by a common ioctl to export
and import a dma-buf.
2. Common code to handle drivers that want to allow a single user at a
time to run open the device char file.

Oded


> >
> > It would be nice to at least identify something that could obviously
> > be common, like some kind of enumeration and metadata kind of stuff
> > (think like ethtool, devlink, rdma tool, nvemctl etc)
> Definitely. I think we can have at least one ioctl that will be common
> to all drivers from the start.
> A kind of information retrieval ioctl. There are many information
> points that I'm sure are common to most accelerators. We have an
> extensive information ioctl in the habanalabs driver and most of the
> information there is not habana specific imo.
> >
> > > I think that it is clear from my previous email what I intended to
> > > provide. A clean, simple framework for devices to register with, get
> > > services for the most basic stuff such as device char handling,
> > > sysfs/debugfs.
> >
> > This should all be trivially done by any driver using the core codes,
> > if you see gaps I'd ask why not improve the core code?
> >
> > > Later on, add more simple stuff such as memory manager
> > > and uapi for memory handling. I guess someone can say all that exists
> > > in drm, but like I said it exists in other subsystems as well.
> >
> > This makes sense to me, all accelerators need a way to set a memory
> > map, but on the other hand we are doing some very nifty stuff in this
> > area with iommufd and it might be very interesting to just have the
> > accelerator driver link to that API instead of building yet another
> > copy of pin_user_pages() code.. Especially with PASID likely becoming
> > part of any accelerator toolkit.
> Here I disagree with you. First of all, there are many relatively
> simple accelerators, especially in edge, where PASID is really not
> relevant.
> Second, even for the more sophisticated PCIe/CXL-based ones, PASID is
> not mandatory and I suspect that it won't be in 100% of those devices.
> But definitely that should be an alternative to the "classic" way of
> handling dma'able memory (pin_user_pages()).
> >
> > > I want to be perfectly honest and say there is nothing special here
> > > for AI. It's actually the opposite, it is a generic framework for
> > > compute only. Think of it as an easier path to upstream if you just
> > > want to do compute acceleration. Maybe in the future it will be more,
> > > but I can't predict the future.
> >
> > I can't either, and to be clear I'm only questioning the merit of a
> > "subsystem" eg with a struct class, rigerous uAPI, etc.
> >
> > The idea that these kinds of accel drivers deserve specialized review
> > makes sense to me, even if they remain as unorganized char
> > devices. Just understand that is what you are signing up for :)
> I understand. That's why I'm taking all your points very seriously.
> This is not a decision that should be taken lightly and I want to be
> sure most agree this is the correct way forward.
> My next step is to talk to Dave about it in-depth. In his other email
> he wrote some interesting ideas which I want to discuss with him.
>
> Maybe this is something that should be discussed in the kernel summit ?
>
> >
> > Jason
