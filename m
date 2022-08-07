Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB87E58B9E7
	for <lists+dri-devel@lfdr.de>; Sun,  7 Aug 2022 08:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B1692E4C;
	Sun,  7 Aug 2022 06:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5F394276
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Aug 2022 06:51:03 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-10cf9f5b500so7368441fac.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Aug 2022 23:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=EiRzVeypDLqjukzgf6iPX2b/MdoDSPrXUwydmAaPBNI=;
 b=ED7K+KhvdVGJGvdJ09bzRo9yLCld9L+T4nMDpRcNd7ScBb58Y9UoYatqTwKvNQ2btA
 PaLYb8pzG+mwHK9942wS3iISv1F82RL65+F+T33tSTqGy8lVx17AhR5sEIh2zk5Q7Wp+
 ox1SAA52oF5D/XUUndg+boIZBYv7SS/eerpEFzkHqKwP6WA4FkxlTWqIqnbd1s/u59YB
 Uz5B0/36kmYvehCzL+zmBHAlx7IB6xVXlhypqlG5u5zx/7Hcj0XezL+Aa2xxzTt+ZU7K
 pCS2cXNvSAk3/c+iNpb4HbvyKNbGnUGHBrxNorfo1wxSzEDQ8zahq9LMlUNu58Cl6yfJ
 dvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=EiRzVeypDLqjukzgf6iPX2b/MdoDSPrXUwydmAaPBNI=;
 b=4AiA0ZkWonwRguWQBdLjLUw1iuSUtiv8m9CSiDhNcAnzF7Nt/QgJDJsy/DzwjnxUvy
 ayBBoWR2knPrOlKOXWG6fHo38DWtV1Bs14F4LR75r7M4AZBZogxZZsayG2X9fS3+vIjV
 ASVPJChadKct9VB4XCcZfaCPBMV2XAXeprwMLwcoDd5wombkzYf4NVt8b9qZO/qwiKQK
 Auyfa4v7qe4NTDZbV8NDSg0vS6MD22X+uj5s5ognpdVadH1ikVY8166KGhyZdu+/u5Il
 63UbrSYPoGMnxe4rVZXE+ziZdwEsY4HN7yp1lWoCmNaPhzsOjzYut110uBpaGfoooiOB
 ah4g==
X-Gm-Message-State: ACgBeo2TeXEs2orxflvcFUo0MtTsVjHKvMLfzQ9thKXf3sAAjXygvPuj
 PROOHdinTnNgLAxf/oTp81EYxD4Q3zFNAJ9wbDENG24yGNc=
X-Google-Smtp-Source: AA6agR6sbWFxXP5h8M895+SO9oU2pluE0JjudvrRoYSSVANsB5kRCEcLzhZ4eUnbD+Y+/Zk73NOWiJCk0fRx4wpUHf8=
X-Received: by 2002:a05:6870:961d:b0:10d:7606:b212 with SMTP id
 d29-20020a056870961d00b0010d7606b212mr5973437oaq.166.1659855062791; Sat, 06
 Aug 2022 23:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCwf11=9qpNAepL7NL+YAV_QO=Wv6pnWPhKHKAepK3fNn+2Dg@mail.gmail.com>
 <CAPM=9tzWuoWAOjHJdJYVDRjoRq-4wpg2KGiCHjLLd+OfWEh5AQ@mail.gmail.com>
 <CAFCwf12N6DeJAQVjY7PFG50q2m405e=XCCFvHBn1RG65BGbT8w@mail.gmail.com>
 <CAPM=9txSKv_xwZJ6SndtqsdQm6aK1KJVF91dB5Odhc_Xv6Qdrw@mail.gmail.com>
 <CAFCwf10CsLgt+_qT7dT=8DVXsL0a=w=uXN6HC=CpP5EfitvLfQ@mail.gmail.com>
 <CAPM=9txme2dQD9kyM6gnYyXL34hYP8wcGMbduOUcFsKe+4zTcQ@mail.gmail.com>
In-Reply-To: <CAPM=9txme2dQD9kyM6gnYyXL34hYP8wcGMbduOUcFsKe+4zTcQ@mail.gmail.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Sun, 7 Aug 2022 09:50:35 +0300
Message-ID: <CAFCwf11TPKTF_Ndi60FneWp5g3SoawJvfJoKVWJ-QjxjpawMmg@mail.gmail.com>
Subject: Re: New subsystem for acceleration devices
To: Dave Airlie <airlied@gmail.com>
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

On Fri, Aug 5, 2022 at 6:03 AM Dave Airlie <airlied@gmail.com> wrote:
>
> On Thu, 4 Aug 2022 at 17:44, Oded Gabbay <oded.gabbay@gmail.com> wrote:
> >
> > On Thu, Aug 4, 2022 at 2:54 AM Dave Airlie <airlied@gmail.com> wrote:
> > >
> > > On Thu, 4 Aug 2022 at 06:21, Oded Gabbay <oded.gabbay@gmail.com> wrote:
> > > >
> > > > On Wed, Aug 3, 2022 at 10:04 PM Dave Airlie <airlied@gmail.com> wrote:
> > > > >
> > > > > On Sun, 31 Jul 2022 at 22:04, Oded Gabbay <oded.gabbay@gmail.com> wrote:
> > > > > >
> > > > > > Hi,
> > > > > > Greg and I talked a couple of months ago about preparing a new accel
> > > > > > subsystem for compute/acceleration devices that are not GPUs and I
> > > > > > think your drivers that you are now trying to upstream fit it as well.
> > > > >
> > > > > We've had some submissions for not-GPUs to the drm subsystem recently.
> > > > >
> > > > > Intel GNA, Intel VPU, NVDLA, rpmsg AI processor unit.
> > > > >
> > > > > why is creating a new subsystem at this time necessary?
> > > > >
> > > > > Are we just creating a subsystem to avoid the open source userspace
> > > > > consumer rules? Or do we have some concrete reasoning behind it?
> > > > >
> > > > > Dave.
> > > >
> > > > Hi Dave.
> > > > The reason it happened now is because I saw two drivers, which are
> > > > doing h/w acceleration for AI, trying to be accepted to the misc
> > > > subsystem.
> > > > Add to that the fact I talked with Greg a couple of months ago about
> > > > doing a subsystem for any compute accelerators, which he was positive
> > > > about, I thought it is a good opportunity to finally do it.
> > > >
> > > > I also honestly think that I can contribute much to these drivers from
> > > > my experience with the habana driver (which is now deployed in mass at
> > > > AWS) and contribute code from the habana driver to a common framework
> > > > for AI drivers.
> > >
> > > Why not port the habana driver to drm now instead? I don't get why it
> > > wouldn't make sense?
> >
> > imho, no, I don't see the upside. This is not a trivial change, and
> > will require a large effort. What will it give me that I need and I
> > don't have now ?
>
> The opportunity for review, code sharing, experience of locking
> hierarchy, mm integration?
>
> IMHO The biggest thing that drm has is the community of people who
> understand accelerators, memory management, userspace command
> submissions, fencing, dma-buf etc.
>
> It's hard to have input to those discussions from the outside, and
> they are always ongoing.
>
> I think one of the Intel teams reported dropping a lot of code on
> their drm port due to stuff already being there, I'd expect the same
> for you.
>
> The opposite question is also valid, what does moving to a new
> subsystem help you or others, when there is one with all the
> infrastructure and more importantly reviewers.
>
> I'd be happy to have accelerator submaintainers, I'd be happy to even
> create an ACCELERATOR property for non-gpu drivers, so they can opt
> out of some of the GPUier stuff, like multiple device node users etc,
> or even create a new class of device nodes under /dev/dri.
>
I'm taking all what you wrote seriously, these are all good points.
As I wrote to Jason, I don't want to jump the gun here. I think we
should discuss this and explore the possibilities that you suggested
because I would like to reach consensus if possible.
Maybe this is something we can discuss in LPC or in the kernel summit ?

Oded

>
> > I totally agree. We need to set some rules and make sure everyone in
> > the kernel community is familiar with them, because now you get
> > different answers based on who you consult with.
> >
> > My rules of thumb that I thought of was that if you don't have any
> > display (you don't need to support X/wayland) and you don't need to
> > support opengl/vulkan/opencl/directx or any other gpu-related software
> > stack, then you don't have to go through drm.
> > In other words, if you don't have gpu-specific h/w and/or you don't
> > need gpu uAPI, you don't belong in drm.
>
> What happens when NVIDIA submit a driver for just compute or intel?
> for what is actually a GPU?
> This has been suggested as workaround for our userspace rules a few times.
>
> If my GPU can do compute tasks, do I have to add an accelerator
> subsystem driver alongside my GPU one?
>
> > After all, memory management services, or common device chars handling
> > I can get from other subsystems (e.g. rdma) as well. I'm sure I could
> > model my uAPI to be rdma uAPI compliant (I can define proprietary uAPI
> > there as well), but this doesn't mean I belong there, right ?
>
> Good point, but I think accelerators do mostly belong in drm or media,
> because there is enough framework around them to allow them to work,
> without reinventing everything.
>
> > >
> > > I think the one area I can see a divide where a new subsystem is for
> > > accelerators that are single-user, one shot type things like media
> > > drivers (though maybe they could be just media drivers).
> > >
> > > I think anything that does command offloading to firmware or queues
> > > belongs in drm, because that is pretty much what the framework does. I
> > I think this is a very broad statement which doesn't reflect reality
> > in the kernel.
>
> I think the habanalabs driver is one of the only ones that is outside
> this really, and in major use. There might be one or two other minor
> drivers with no real users.
>
> Dave.
