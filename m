Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD2458CF14
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 22:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF5911A239;
	Mon,  8 Aug 2022 20:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A69011A1D1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 20:26:40 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-10ee900cce0so11804335fac.5
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 13:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ydvghZiU4oxizq6DGO7an5+XMEaqMDYW7v69Za3bS8M=;
 b=WPxFwHDq6OKqNjJ/pLTvrN7gfeIYfofnlL5MmuwcGAEvN9IiUKz/wxYVAFQb82wxy4
 NqvaWSlzl5KCWFA4wLLkNC68Syw5SQG+5BshNf5gPV8iCjnDdhFeKnxqs/iFiMLxHnTN
 UljhU7iAA+kAiVmQVrJdNiUPjF22Ysr8lu4VQFwbB5lOeBAcFLHTAWE0xcZLNGh6L9lY
 USVRyiY8IiiQeTSpCRGS6vQuursrPjiCRr4HfQ+ThPBdnydW3HIpc/FGUVg8ob71bsRK
 JUWJEnHSHFP2Rehpprx6Dw9SMG9zzHkf5hRZCVSMqd6j6yh9hU/2IE8x4YCtScMIOoj+
 9bTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ydvghZiU4oxizq6DGO7an5+XMEaqMDYW7v69Za3bS8M=;
 b=fIWZnXcjzKwVgiV/LmQvhzyHw2X+Q3MCTrbBjokaHQG4KDSt+TG5+NTRJuXwN+fdsO
 Q+/m+goD8GmoVKx4ImwedPBjJ/P2FnUjvj9szaPV2caGhiRYTnTlC7nmQN+heueHLqcS
 b2jiXhOfHJEN+oztdca9Jf3EbUXg7Yjph8UxigQ+OqJnHQggpFfCPiFAOqC0zgAnImNR
 t6UbBjS4zXDsFXMSX9GyWsXhh/aXEETSQYTbGed9l8D3O0Uqrei47yKzRbUnqhLSnHPl
 GnwoyBCxp04HtaHrZ3Q9ReE5KcUj245EGg/tbR/vPpG+dahQl3kNfIoSjyCU0VATkM5z
 /NfQ==
X-Gm-Message-State: ACgBeo2SioQLLsC1epIC37t6UNgjPT5SFiRJNXRaA/PACUu8Loc66cuS
 r5MwM7t0QKYvA5xfwKi2GpM9yPikYecxFviabS4=
X-Google-Smtp-Source: AA6agR5toBkK9fAlf2qqHwpgjh+sFnwMvnK0aR+b5C4VPdBgoM1i4KqMMlcuv75fpv1L35sdVCn/Y6qkHXlFERffWgI=
X-Received: by 2002:a05:6870:9193:b0:10d:130e:e57c with SMTP id
 b19-20020a056870919300b0010d130ee57cmr12442614oaf.286.1659990399160; Mon, 08
 Aug 2022 13:26:39 -0700 (PDT)
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
 <YvFL8/g+xbrhLzEr@nvidia.com>
In-Reply-To: <YvFL8/g+xbrhLzEr@nvidia.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Mon, 8 Aug 2022 23:26:11 +0300
Message-ID: <CAFCwf12MFVmBOEMw37Cdh4O3n13LosR4yDi007eH9BhF3kRC4w@mail.gmail.com>
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

On Mon, Aug 8, 2022 at 8:46 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Sun, Aug 07, 2022 at 09:43:40AM +0300, Oded Gabbay wrote:
>
> > 1. If there is a subsystem which is responsible for creating and
> > exposing the device character files, then there should be some code
> > that connects between each device driver to that subsystem.
> > i.e. There should be functions that each driver should call from its
> > probe and release callback functions.
> >
> > Those functions should take care of the following:
> > - Create metadata for the device, the device's minor(s) and the
> > driver's ioctls table and driver's callback for file operations (both
> > are common for all the driver's devices). Save all that metadata with
> > proper locking.
> > - Create the device char files themselves and supply file operations
> > that will be called per each open/close/mmap/etc.
> > - Keep track of all these objects' lifetime in regard to the device
> > driver's lifetime, with proper handling for release.
> > - Add common handling and entries of sysfs/debugfs for these devices
> > with the ability for each device driver to add their own unique
> > entries.
> >
> > 2. I think that you underestimate (due to your experience) the "using
> > it properly" part... It is not so easy to do this properly for
> > inexperienced kernel people. If we provide all the code I mentioned
> > above, the device driver writer doesn't need to be aware of all these
> > kernel APIs.
>
> This may be, but it still seems weird to me to justify a subsystem as
> "making existing APIs simpler so drivers don't mess them up". It
> suggests perhaps we need additional core API helpers?
>
I'm sorry, but my original argument was poorly phrased. I'll try to
phrase it better.

What I'm trying to say is that imo one of the end goals of doing a
common subsystem is to provide a common uAPI for all the drivers that
belong to that subsystem.
I wrote this argument in a previous email as a criteria whether a
driver should join a subsystem.

So if you want a common uAPI and a common userspace library to use it,
you need to expose the same device character files for every device,
regardless of the driver. e.g. you need all devices to be called
/dev/accelX and not /dev/habanaX or /dev/nvidiaX

This means that the whole device character creation/removal/open/close
is done in the common subsystem, not in each driver individually.
So even if it is a simple code as you said, it still must reside in
the subsystem common code.

Once you put that code there, you need to add meta-data as different
drivers attach to the subsystem and ask to create devices and minors
when their probe function is called. In addition, you need to remove
all this code from each individual driver.

That's what I mean by abstracting all this kernel API from the
drivers. Not because it is an API that is hard to use, but because the
drivers should *not* use it at all.

I think drm did that pretty well. Their code defines objects for
driver, device and minors, with resource manager that will take care
of releasing the objects automatically (it is based on devres.c).

> > > It would be nice to at least identify something that could obviously
> > > be common, like some kind of enumeration and metadata kind of stuff
> > > (think like ethtool, devlink, rdma tool, nvemctl etc)
> > Definitely. I think we can have at least one ioctl that will be common
> > to all drivers from the start.
>
> Generally you don't want that as an ioctl because you have to open the
> device to execute it, there may be permissions issues for instance -
> or if you have a single-open-at-a-time model like VFIO, then it
> doesn't work well together.
>
> Usually this would be sysfs or netlink.
So actually I do want an ioctl but as you said, not for the main
device char, but to an accompanied control device char.

In habana we define two device char per device. One is the compute
which behaves like VFIO, and one is a control device which has no
limitation on the number of applications that can access it. However,
an application only has access to the information ioctl through this
device char (so it can't submit anything, allocate memory, etc.) and
can only retrieve metrics which do not leak information about the
compute application.

The reason I want an ioctl is because it is much more flexible than
sysfs and allows writing proper software to monitor the device in the
data-center. At least, that's my experience from the deployment we had
so far.

>
> > > This makes sense to me, all accelerators need a way to set a memory
> > > map, but on the other hand we are doing some very nifty stuff in this
> > > area with iommufd and it might be very interesting to just have the
> > > accelerator driver link to that API instead of building yet another
> > > copy of pin_user_pages() code.. Especially with PASID likely becoming
> > > part of any accelerator toolkit.
> >
> > Here I disagree with you. First of all, there are many relatively
> > simple accelerators, especially in edge, where PASID is really not
> > relevant.
> > Second, even for the more sophisticated PCIe/CXL-based ones, PASID is
> > not mandatory and I suspect that it won't be in 100% of those devices.
> > But definitely that should be an alternative to the "classic" way of
> > handling dma'able memory (pin_user_pages()).
>
> My point was that iommufd can do the pinning for you and dump that
> result into a iommu based PASID, or it can do the pinning for you and
> allow the driver to translate it into its own page table format eg the
> ASID in the habana device.
>
> We don't need to have map/unmap APIs to manage address spaces in every
> subsystem.
I see, I will need to learn this more in-depth if/when it will become
relevant. But of course I agree that reusing existing code is much
better.

>
> > Maybe this is something that should be discussed in the kernel summit ?
>
> Maybe, I expect to be at LPC at least
Great!
Oded
>
> Jason
