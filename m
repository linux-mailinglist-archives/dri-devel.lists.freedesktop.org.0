Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FBB382777
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 10:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4226E8FF;
	Mon, 17 May 2021 08:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061016E8FD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 08:49:20 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 n32-20020a9d1ea30000b02902a53d6ad4bdso4932426otn.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 01:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EnT5zPP6tdK7KNtej1vtHjp/uSJMK556tLchSIAqikM=;
 b=Sq53JhE7KMBm0UPwLM+rHrr+JZARZREBqCPBEm8dSK6Ims+ND5f9GWoygNUQsu7fmO
 p0XFDXBZJvaWIqpQGDWJNgHg9b0xNc5ur0nSfcxMXBHoj1iMYR4k5wNMnroT3cl2P0w6
 3gMM3izZyREKSjIyLtfft5A5VPdMEivqOYX68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EnT5zPP6tdK7KNtej1vtHjp/uSJMK556tLchSIAqikM=;
 b=eou8WftEnK1mUdqRpVqh4yI/jZt8WGlTzbwvvmipDvKwgwQ0obvCCkyuofYIVYJaZA
 uLO1x4NT4YNvVCZik0y34iJNuzPx2c57lamFR6Tr3FFkMJSGjzuPcypvjEqwwxdgJLGX
 jC3AGUNch9GNdfldeTCjZhPhAFDFOQPzbqvcpYaNVR4yH56l1JKuK6RaLU3apCylnltY
 x2dVWV0G6smnQOPuLC8x/AN7ab6GA2GrtTYS9I99hnLMdOssA1tOlhACFCfG2GW/p+0a
 UKKSeIQR1GhfpKgbWdTOEgCqde8VvAawbml6lgrzkl7qHuImF6Gb/nwfO8GcPJy9wv7c
 GE1A==
X-Gm-Message-State: AOAM532sPWeo6vNi0X9IDh9Zwtu3x53K6259cPdfMd7cByKZ+CnEBA1s
 ks1VHeW6YinwAMJ8oVn+o30Pl9sYrF0+7QVBEtNfDg==
X-Google-Smtp-Source: ABdhPJxc9pYlbCYwIxhWot8DMVsHS/tn8pjsxaxDWm52qe4op+KGVrxVWtIyueOlpx2VvTelwYRceN40ohGZ3IzBopw=
X-Received: by 2002:a9d:4101:: with SMTP id o1mr12094671ote.281.1621241360211; 
 Mon, 17 May 2021 01:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
 <YJ42MEgwDZrAEQLl@kroah.com>
 <CAK8P3a0pcBHfrwu9fHHRWim5WgQuCqpROpMM83yCCpjjwu1FJQ@mail.gmail.com>
 <YKIeBdwFb9Ng275X@phenom.ffwll.local> <YKIigHrwqp8zd036@kroah.com>
In-Reply-To: <YKIigHrwqp8zd036@kroah.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 17 May 2021 10:49:09 +0200
Message-ID: <CAKMK7uEg2khb7wDzHTGEPwfbYe+T_5Av=_BTnt91CBW5U4yWvg@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 10:00 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, May 17, 2021 at 09:40:53AM +0200, Daniel Vetter wrote:
> > On Fri, May 14, 2021 at 11:00:38AM +0200, Arnd Bergmann wrote:
> > > On Fri, May 14, 2021 at 10:34 AM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > > On Thu, May 13, 2021 at 01:00:26PM +0200, Maciej Kwapulinski wrote:
> > > > > Dear kernel maintainers,
> > > > >
> > > > > This submission is a kernel driver to support Intel(R) Gaussian & Neural
> > > > > Accelerator (Intel(R) GNA). Intel(R) GNA is a PCI-based neural co-processor
> > > > > available on multiple Intel platforms. AI developers and users can offload
> > > > > continuous inference workloads to an Intel(R) GNA device in order to free
> > > > > processor resources and save power. Noise reduction and speech recognition
> > > > > are the examples of the workloads Intel(R) GNA deals with while its usage
> > > > > is not limited to the two.
> > > >
> > > > How does this compare with the "nnpi" driver being proposed here:
> > > >         https://lore.kernel.org/r/20210513085725.45528-1-guy.zadicario@intel.com
> > > >
> > > > Please work with those developers to share code and userspace api and
> > > > tools.  Having the community review two totally different apis and
> > > > drivers for the same type of functionality from the same company is
> > > > totally wasteful of our time and energy.
> > >
> > > Agreed, but I think we should go further than this and work towards a
> > > subsystem across companies for machine learning and neural networks
> > > accelerators for both inferencing and training.
> >
> > We have, it's called drivers/gpu. Feel free to rename to drivers/xpu or
> > think G as in General, not Graphisc.
> >
> > > We have support for Intel habanalabs hardware in drivers/misc, and there are
> > > countless hardware solutions out of tree that would hopefully go the same
> > > way with an upstream submission and open source user space, including
> > >
> > > - Intel/Mobileye EyeQ
> > > - Intel/Movidius Keembay
> > > - Nvidia NVDLA
> > > - Gyrfalcon Lightspeeur
> > > - Apple Neural Engine
> > > - Google TPU
> > > - Arm Ethos
> > >
> > > plus many more that are somewhat less likely to gain fully open source
> > > driver stacks.
> >
> > We also had this entire discussion 2 years ago with habanalabs. The
> > hang-up is that drivers/gpu folks require fully open source userspace,
> > including compiler and anything else you need to actually use the chip.
> > Greg doesn't, he's happy if all he has is the runtime library with some
> > tests.

I guess we're really going to beat this horse into pulp ... oh well.

> All you need is a library, what you write on top of that is always
> application-specific, so how can I ask for "more"?

This is like accepting a new cpu port, where all you require is that
the libc port is open source, but the cpu compiler is totally fine as
a blob (doable with llvm now being supported). It makes no sense at
all, at least to people who have worked with accelerators like this
before.

We are not requiring that applications are open. We're only requiring
that at least one of the compilers you need (no need to open the fully
optimized one with all the magic sauce) to create any kind of
applications is open, because without that you can't use the device,
you can't analyze the stack, and you have no idea at all about what
exactly it is you're merging. With these devices, the uapi visible in
include/uapi is the smallest part of the interface exposed to
userspace.

> > These two drivers here look a lot more like classic gpus than habanalabs
> > did, at least from a quick look they operate with explicit buffer
> > allocations/registration model. So even more reasons to just reuse all the
> > stuff we have already. But also I don't expect these drivers here to come
> > with open compilers, they never do, not initially at least before you
> > started talking with the vendor. Hence I expect there'll be more
> > drivers/totally-not-drm acceleration subsystem nonsense.
>
> As these are both from Intel, why aren't they using the same open
> compiler?  Why aren't they using the same userspace api as well?  What's
> preventing them from talking to each other about this and not forcing
> the community (i.e. outsiders) from being the one to force this to
> happen?

I'm unfortuantely not the CEO of this company. Also you're the one who
keeps accepting drivers that the accel folks (aka dri-devel community)
said shouldn't be merged, so my internal bargaining power is zero to
force something reaonable here. So please don't blame me for this
mess, this is yours entirely.

> > Anyway this horse has been throughroughly beaten to death and more, the
> > agreement is that accel drivers in drivers/misc must not use any gpu
> > stuff, so that drivers/gpu people dont end up in a prickly situation they
> > never signed up for. E.g. I removed some code sharing from habanalabs.
> > This means interop between gpu and nn/ai drivers will be no-go until this
> > is resolved, but *shrug*.
>
> I'm all for making this unified, but these are not really devices doing
> graphics so putting it all into DRM always feels wrong to me.  The fact
> that people abuse GPU devices for not graphic usages would indicate to
> me that that code should be moving _out_ of the drm subsystem :)

Like I said, if the 'g' really annoys you that much, feel free to send
in a patch to rename drivers/gpu to drivers/xpu.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
