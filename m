Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AFE40A984
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 10:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAB96E434;
	Tue, 14 Sep 2021 08:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2B96E434
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 08:43:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8550661107
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 08:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631609004;
 bh=HB3hrUj5mCAg3X5UrVES+EN8+YFeilz+iMN6jNEZCX8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=okgaiadsrUSP+B3Kwp0rX/PAdF9reT+p+1+yfprr+VsZuZjYNgjudtVPQwx0p29vU
 XqUQIjLNaYGyZVAoAahMHoGzK+BXrYQW4t4r5NtdciUekddNXwW0tlFRG42c6dIleD
 eJIeSuQhcsn6+8BI/oIHrpeOKpUavyDO2HTJBOXgOJsHp13GvPFGqCTOqUvyYQ5NHo
 B4g1V3D4UNb2wV7uhBodq7/4Np/ASVXZ/aNXuLtvjQSWQ/RDnqkvDaprIO4sfc+VwP
 +UIYSbnGvF3nNtpTrQSFJe4clMDmiCXo8Vhri+glcSsSU8AM1fn0OK6LPi0ZJUc1bj
 DIjtXVhb+xBow==
Received: by mail-ot1-f52.google.com with SMTP id
 c42-20020a05683034aa00b0051f4b99c40cso17379862otu.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 01:43:24 -0700 (PDT)
X-Gm-Message-State: AOAM533sFQNRKLhsBl2B1xQuak9HaQ474Povfed9Y/t2oPH9KZY62vWJ
 NjMPtp60cJGjg+VwoTieFYltSJV1/gdQRRE5pNY=
X-Google-Smtp-Source: ABdhPJyMTJGEGcAcU1U9As2Pt9nvzf/4cGBp5tq4X0dVX+xWChi2REPwA47QD0I2z9Ff90HxrfTO3YiZ+fOMscJhnNk=
X-Received: by 2002:a05:6830:12d7:: with SMTP id
 a23mr13552823otq.102.1631609003777; 
 Tue, 14 Sep 2021 01:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCwf119s7iXk+qpwoVPnRtOGcxeuZb3rnihf6NWWoVT-4ODHA@mail.gmail.com>
 <YTsQJ753sm701R/n@kroah.com>
 <CAKMK7uFLBmdHphtnEa1nyAGUHdcP1KgmaK+vtV_GOU6wZZAOxg@mail.gmail.com>
 <CAKMK7uFj-m4y+N-q8uoNasJuksgDj-oRK3K=SjoyKMQL=QCENw@mail.gmail.com>
 <YT4GxO7ab+s0nbze@kroah.com>
 <CAPM=9tx2xyFGHBAfMT_D88JDbCJ4V6Ni2tiYx0=VNj5SmtdJxA@mail.gmail.com>
In-Reply-To: <CAPM=9tx2xyFGHBAfMT_D88JDbCJ4V6Ni2tiYx0=VNj5SmtdJxA@mail.gmail.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Tue, 14 Sep 2021 11:42:57 +0300
X-Gmail-Original-Message-ID: <CAFCwf13gXEX6F=SLJv+d6BeOQ-4q7ozdD2NarOmgbaDx6tFcGg@mail.gmail.com>
Message-ID: <CAFCwf13gXEX6F=SLJv+d6BeOQ-4q7ozdD2NarOmgbaDx6tFcGg@mail.gmail.com>
Subject: Re: Accelerator drivers going forward (was Re: Habanalabs Open-Source
 TPC LLVM compiler and SynapseAI Core library)
To: Dave Airlie <airlied@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, mzuckerman@habana.ai,
 dsinger@habana.ai, 
 Linus Torvalds <torvalds@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 12, 2021 at 10:32 PM Dave Airlie <airlied@gmail.com> wrote:
>
> On Sun, 12 Sept 2021 at 23:55, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Sep 10, 2021 at 06:10:27PM +0200, Daniel Vetter wrote:
> > > Forgot to add dri-devel.
> > >
> > > On Fri, Sep 10, 2021 at 6:09 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > >
> > > > On Fri, Sep 10, 2021 at 9:58 AM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > > On Fri, Sep 10, 2021 at 10:26:56AM +0300, Oded Gabbay wrote:
> > > > > > Hi Greg,
> > > > > >
> > > > > > Following our conversations a couple of months ago, I'm happy to tell you that
> > > > > > Habanalabs has open-sourced its TPC (Tensor Processing Core) LLVM compiler,
> > > > > > which is a fork of the LLVM open-source project.
> > > > > >
> > > > > > The project can be found on Habanalabs GitHub website at:
> > > > > > https://github.com/HabanaAI/tpc_llvm
> > > > > >
> > > > > > There is a companion guide on how to write TPC kernels at:
> > > > > > https://docs.habana.ai/en/latest/TPC_User_Guide/TPC_User_Guide.html
> > > > >
> > > > > That's great news, thanks for pushing for this and releasing it all!
> > > >
> > > > Yeah this is neat.
> > > >
> > > > There's still the problem that we spent the past 2.5 years pissing off
> > > > a lot of people for an imo questionable political project, bypassing
> > > > all the technical review and expertise. Now that the political
> > > > nonsense is resolved I think we need to look at at least the technical
> > > > cleanup. The angered people are much harder to fix, so let's maybe
> > > > ignore that (or perhaps a ks topic, no idea, I'm honestly not super
> > > > motivated to rehash this entire story again). Here's what I think we
> > > > should do:
> > > >
> > > > - move drivers/misc/habanalabs under drivers/gpu/habanalabs and
> > > > review/discussions on dri-devel
> >
> > Wait, why move into gpu?  Are we going to do that for all hardware
> > accelerators that we currently have in the kernel tree?
> >
>
> We could just mv drivers/gpu drivers/accel if that helps your mental model here.
>
> > These things are not GPUs in the sense of them being "do some work and
> > write out to a screen", which is what I would associate with a GPU (G
> > does stand for "Graphical", right?)
>
> Neither are a lot of the gpu drivers, it's almost like we evolved the
> subsystem in 20 years,
> and the name got away from us.
>
> As an example:
> etnaviv, panfrost, lima and vgem drivers have no display interfaces at
> all. Nada, they do nothing except accelerate and use dma-buf to talk
> to other drivers.
>
>
> > Yes, GPUs can do things that some accelerators can do, but they can do
> > things that accelerators can not do, and the other way around as well.
> > I doubt you want all of the existing gpu drivers to be only treated as
> > an "accelerator driver" now, as where would the logic that has to happen
> > to get the bits out to a screen live?
>
> Don't care, totally doesn't matter if a driver is accelerator +
> display, you could write in-driver buses if you wanted to abstract
> this more, since internally most GPUs are just SoCs, the display and
> accelerator pieces talk to power management, irqs and dma-buf like
> functionality internally in the driver, the thing is for most GPUs
> there is a single PCI device to bind to, so historically nobody has
> seen the value in splitting them more or adding an in-driver bus for
> one set of devices.
>
> > And since we have a long history of accepting accelerator drivers (I see
> > some in our tree since 2018 at the least), and there is no common
> > userspace collation trying to make a common userspace api, why do they
> > have to live in the same place?  What makes them common except for the
> > fact that they use the kernel as a semi-dumb pipe to send work to and
> > from a different processor?
> >
> > Look at drivers/misc/cxl/ and drivers/misc/ocxl and drivers/misc/uacce/
> > and drivers/misc/sgi-gru and drivers/misc/bcm-vk/ even drivers/misc/mei/
> > as that is an off-load engine we talk to, right?
> >
> > What about the drivers/fpga/ api we have, it handles accelerators as
> > well.  I'm sure we have many other examples in the kernel tree as well,
> > I just did a quick look and found these.
> >
> > All the above accelerators do things in different ways because their
> > hardware is different, so they need different user/kernel apis, right?
> > How are we going to unify them?  Who is going to unify them?
> >
> > So drivers/accel/ perhaps?  I would be able to get rid of loads of
> > drivers/misc/ code that way :)
> >
> > Who is going to be the new maintainer of this subsystem?
>
> We already said if we could get agreement on having things follow the
> rules, then they can be merged under drm trees or we'd start a new
> accel tree.
>
> The problem is the free-for-all merge with no barriers approach that
> you and I believe Olof are campaigning for, doesn't seem to create
> communities, it may create consulting or training opportunities for
> the Linux Foundation, but thus far I don't see any communities.
>
> Graphics accelerator community exists because of and has itself
> refined the rules over time. I don't think our rules will necessarily
> work for other groups immediately but I think other groups need to
> construct acceptable merge criteria beyond the kernel, and kernel
> maintainers have to take more responsibility for saying no if they
> don't have time for community building.
>
>
> > So far they have all been going into drivers/misc/ because no one else
> > stepped up to do the review of them except me.  I would _LOVE_ the help
> > here as I end up reviewing a new one every kernel release at the least,
> > but companies do not seem to be willing to fund developers to be
> > maintainers these days :(
> >
> > And yes, I have been reviewing the fpga code as well, even though they
> > do have a good maintainer, as those patches flow through my tree due to
> > historical reasons.  I know the fpga developers would have loved some
> > help with review of those patches.
>
> Lack of reviewing isn't the problem here, lack of responsibility for
> creating a long term mess is. You are creating long term dumping
> grounds for badly thought out stuff. Saying people keeping adding more
> trash to my dump and it's overloading me is just the effect of having
> created the dump with no rules to follow in the first place.
>
> >
> > > > - review the dma-buf stuff on dri-devel and then land it through
> > > > standard flows, not the gregk-misc bypass
> >
> > Are dma-bufs somehow required to be reviewed on dri-devel?  As others
> > have asked in the past, they are already being used in other subsystems
> > (like IB) today, did those authors also get review there?
>
> Yes any use of dma-buf has to be cc'ed to dri-devel and linux-media
> per MAINTAINERS
>
Hi Dave/Daniel,
Now that we opened up the user-space compiler and provided a library
with which you can load compiled kernels and run them, I've re-sent
the two dma-buf patches to dri-devel and linux-media (and to specific
people) on Sunday evening.

Can you please help review them ? They already got reviewed by
Christian and Jason on previous iterations and I fixed them according
to their reviews so I believe they are fundamentally correct.

Thanks,
Oded


> >
> > If so, great, if not, that feels odd to me, as I am seeing lots of
> > out-of-tree drivers start to use these structures, which is why the api
> > was created (to stop the roll-your-own-implementations.)  Does dri-devel
> > want me to have those vendors cc: you all when those get submitted?
>
> Yes. MAINTAINERS has matching for this, are you not advising people to
> use the proper submission techniques and thus bypassing that file?
>
> The reason is dma-buf and later by extension dma-fence can create
> really bad problems for the kernel around memory management.
>
> https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html#indefinite-dma-fences
>
> When a driver is self contained and doesn't interact with other kernel
> drivers nobody really has to care. However once a driver starts
> interacting with other drivers in the kernel, a responsible maintainer
> has to check that these new drivers aren't going to crap all over the
> existing drivers and destabilise the kernel. Someone has to review the
> hardware design to see if page faulting works or if preemption works
> or a bunch of other gotchas. Someone has to review the userspace to
> make sure it isn't doing knowingly bad things or making assumptions
> based on the kernel driver doing bad things.
>
> The thing is we've had code merged into our in-tree i915 driver that
> broke a bunch of these assumptions, and have had to spend a year
> cleaning it out, now this happened post-merge and diligence had
> lessened, having the expertise to spot this in new dma-buf/fence users
> is why we insist on having access to way more than just the 1000 line
> kernel driver submission.
>
>
> > I will be glad to not accept any more, but as I say above, what are the
> > new requirements going to be so that those companies that do want to
> > submit their code know what to do?
>
> I'm proposing a patch for documentation that maintainers can sign up
> for (it's mentioned in the ksummit thread).
>
> > And what exactly are we using as a definition of an accelerator?  We
> > have networking cards that are "accelerators" as well as crypto
> > "accelerators" :)
> >
> > > > I expect we'll have a proper discussion what the stack should look
> > > > like with the next submission (from a different vendor maybe), that
> > > > ship kinda sailed with habanalabs.
> >
> > Who is going to define this stack?  As there is no industry standard,
> > why would we define this?
>
> Because someone has to help, saying yes isn't helping, it's enabling
> back behaviour. Parenting and maintaining both involve saying No for
> the future prosperity of the ecosystem.
>
> Dave.
