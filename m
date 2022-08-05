Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6540B58A4E2
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 05:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61301AE5EA;
	Fri,  5 Aug 2022 03:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DAAAE661
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 03:03:09 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id gk3so2664286ejb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 20:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=NDZ1lu3viM2SwqOHDYJb/tKatraI7ROG+LscheDgb9c=;
 b=M7zLWHjLCMcwm799MpVBMLQqKeyui+ER66VmPGglXm4YaJp/R9nAqykmDkO97izFEy
 4ZWrSrVydWvoEURPgvEh+G3NjdvdxObD4E8+toKQAoAmYBRBokxDhjjzZURmL8ezZgzC
 RiurgDK2gpOEuz771cohb82+etBQxfRjd/GN7V4Fn6nSQPawScYiD+U5e5v435AB+Ych
 WBmVZW+9qyWWg2PFKpDWjjz+hmmA+I/Hm6TxUszgmnrdwruuTI82SWL8aTacTO86y4dO
 nL0tjNMXMH/VoeP8N+h7bIcP3FjvavIFYMk981y3bVXQAVJ5nRp8Fg1f3MfN6dpvVaJw
 2z0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=NDZ1lu3viM2SwqOHDYJb/tKatraI7ROG+LscheDgb9c=;
 b=CLbKjlXDo6mMWX/nGmkhFCTXRZV5UNoQh0HXiReMWLqmA8eDLUD2QLyjQqi7Krm8VL
 pGpOg2GLCEcvR7jKQ6aUTdBSRwD4AXVJ1uTsBcxud8FCghwKy8m+l+8xD9qiz+iEpQYg
 662k3FsC2qIb3LgUH7qlukJ4YhXo652/kSMdkRoyrAGB/TbBmubM+pfun6ZedGBQMOB3
 4aL1I/qxut/RPuP9oVlCEhFi9RhqFyUO0nV1AIdXswiD+PPni8UAbpKPxQcvLcGmiF5w
 iyXZClkDgmR0wpnNXOWf5pCG1Evz8HBaU7pd4Bri/i1/5oA4eUy/DLq+M0I/oHLM8WvQ
 k3PQ==
X-Gm-Message-State: ACgBeo00n2ZzpzWGDv5jMuYdnAyPGvbM3vJq1zqVmvlBSn/lgRFZsdFe
 c1n+MXJNZPKYutykLdkx7fGNmRKs5oRaTGjk6D4=
X-Google-Smtp-Source: AA6agR4WrNRtdDRR+v9NP4l2UPvPhzGFe8eJ/aGESOVyqRRJwROIcCnOw6JQIdwxKN0PJOrWLgcYhU96SF5aT+pJ83o=
X-Received: by 2002:a17:907:6eac:b0:730:a07f:38bb with SMTP id
 sh44-20020a1709076eac00b00730a07f38bbmr3870114ejc.750.1659668587947; Thu, 04
 Aug 2022 20:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCwf11=9qpNAepL7NL+YAV_QO=Wv6pnWPhKHKAepK3fNn+2Dg@mail.gmail.com>
 <CAPM=9tzWuoWAOjHJdJYVDRjoRq-4wpg2KGiCHjLLd+OfWEh5AQ@mail.gmail.com>
 <CAFCwf12N6DeJAQVjY7PFG50q2m405e=XCCFvHBn1RG65BGbT8w@mail.gmail.com>
 <CAPM=9txSKv_xwZJ6SndtqsdQm6aK1KJVF91dB5Odhc_Xv6Qdrw@mail.gmail.com>
 <CAFCwf10CsLgt+_qT7dT=8DVXsL0a=w=uXN6HC=CpP5EfitvLfQ@mail.gmail.com>
In-Reply-To: <CAFCwf10CsLgt+_qT7dT=8DVXsL0a=w=uXN6HC=CpP5EfitvLfQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 5 Aug 2022 13:02:56 +1000
Message-ID: <CAPM=9txme2dQD9kyM6gnYyXL34hYP8wcGMbduOUcFsKe+4zTcQ@mail.gmail.com>
Subject: Re: New subsystem for acceleration devices
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jiho Chu <jiho.chu@samsung.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 Aug 2022 at 17:44, Oded Gabbay <oded.gabbay@gmail.com> wrote:
>
> On Thu, Aug 4, 2022 at 2:54 AM Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Thu, 4 Aug 2022 at 06:21, Oded Gabbay <oded.gabbay@gmail.com> wrote:
> > >
> > > On Wed, Aug 3, 2022 at 10:04 PM Dave Airlie <airlied@gmail.com> wrote:
> > > >
> > > > On Sun, 31 Jul 2022 at 22:04, Oded Gabbay <oded.gabbay@gmail.com> wrote:
> > > > >
> > > > > Hi,
> > > > > Greg and I talked a couple of months ago about preparing a new accel
> > > > > subsystem for compute/acceleration devices that are not GPUs and I
> > > > > think your drivers that you are now trying to upstream fit it as well.
> > > >
> > > > We've had some submissions for not-GPUs to the drm subsystem recently.
> > > >
> > > > Intel GNA, Intel VPU, NVDLA, rpmsg AI processor unit.
> > > >
> > > > why is creating a new subsystem at this time necessary?
> > > >
> > > > Are we just creating a subsystem to avoid the open source userspace
> > > > consumer rules? Or do we have some concrete reasoning behind it?
> > > >
> > > > Dave.
> > >
> > > Hi Dave.
> > > The reason it happened now is because I saw two drivers, which are
> > > doing h/w acceleration for AI, trying to be accepted to the misc
> > > subsystem.
> > > Add to that the fact I talked with Greg a couple of months ago about
> > > doing a subsystem for any compute accelerators, which he was positive
> > > about, I thought it is a good opportunity to finally do it.
> > >
> > > I also honestly think that I can contribute much to these drivers from
> > > my experience with the habana driver (which is now deployed in mass at
> > > AWS) and contribute code from the habana driver to a common framework
> > > for AI drivers.
> >
> > Why not port the habana driver to drm now instead? I don't get why it
> > wouldn't make sense?
>
> imho, no, I don't see the upside. This is not a trivial change, and
> will require a large effort. What will it give me that I need and I
> don't have now ?

The opportunity for review, code sharing, experience of locking
hierarchy, mm integration?

IMHO The biggest thing that drm has is the community of people who
understand accelerators, memory management, userspace command
submissions, fencing, dma-buf etc.

It's hard to have input to those discussions from the outside, and
they are always ongoing.

I think one of the Intel teams reported dropping a lot of code on
their drm port due to stuff already being there, I'd expect the same
for you.

The opposite question is also valid, what does moving to a new
subsystem help you or others, when there is one with all the
infrastructure and more importantly reviewers.

I'd be happy to have accelerator submaintainers, I'd be happy to even
create an ACCELERATOR property for non-gpu drivers, so they can opt
out of some of the GPUier stuff, like multiple device node users etc,
or even create a new class of device nodes under /dev/dri.


> I totally agree. We need to set some rules and make sure everyone in
> the kernel community is familiar with them, because now you get
> different answers based on who you consult with.
>
> My rules of thumb that I thought of was that if you don't have any
> display (you don't need to support X/wayland) and you don't need to
> support opengl/vulkan/opencl/directx or any other gpu-related software
> stack, then you don't have to go through drm.
> In other words, if you don't have gpu-specific h/w and/or you don't
> need gpu uAPI, you don't belong in drm.

What happens when NVIDIA submit a driver for just compute or intel?
for what is actually a GPU?
This has been suggested as workaround for our userspace rules a few times.

If my GPU can do compute tasks, do I have to add an accelerator
subsystem driver alongside my GPU one?

> After all, memory management services, or common device chars handling
> I can get from other subsystems (e.g. rdma) as well. I'm sure I could
> model my uAPI to be rdma uAPI compliant (I can define proprietary uAPI
> there as well), but this doesn't mean I belong there, right ?

Good point, but I think accelerators do mostly belong in drm or media,
because there is enough framework around them to allow them to work,
without reinventing everything.

> >
> > I think the one area I can see a divide where a new subsystem is for
> > accelerators that are single-user, one shot type things like media
> > drivers (though maybe they could be just media drivers).
> >
> > I think anything that does command offloading to firmware or queues
> > belongs in drm, because that is pretty much what the framework does. I
> I think this is a very broad statement which doesn't reflect reality
> in the kernel.

I think the habanalabs driver is one of the only ones that is outside
this really, and in major use. There might be one or two other minor
drivers with no real users.

Dave.
