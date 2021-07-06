Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6AE3BDA92
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 17:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B5C6E50E;
	Tue,  6 Jul 2021 15:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E076E512
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 15:53:01 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id 10so10308223oiq.9
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 08:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XWcbFbfZlrlLCI/ycorf+8mN/ARHdyCO3tRbWLAh3y4=;
 b=btW4iaoBA6H16g/oM/vv8wk2tqtkbRuVH7mGj2o+MbQM8BPIaU4hAnrGsLSqNyzHQw
 Xq2O8dxuedqFF1OlFjHtwDmzMOk8jtJXy9/FcwH6bADMxafS3ucOYBnryWdpf6eKiACK
 PqyFOw4DBfJAFrezaW0uTHh6SMhuzrdtU4nzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XWcbFbfZlrlLCI/ycorf+8mN/ARHdyCO3tRbWLAh3y4=;
 b=Oih3u/YnrIHkUhbWKpdWvxTxaE/XcS4zg6uXs+pQgLphvEx1u7Lo8KQnW7KfWisbyu
 2TYP2NuuVy9nzqjb0TF5FfUWIQog1oBceTLqRxHhe4yoSNavMhA6JXLD5kdKd/PmrGrB
 +I+V9bHwhYvO9284db2lcKZWuAFfb0k4AEgu7/JCsZqR0LmFX0jLh9q6oovyueEhx9c2
 IFDb1njQBCOvDXnoFcKQGoDl2u3O7I5EuaHmwyltrnEs2E5zswE+l63enEOdnaiOs/yb
 zNm3BHdgMAWbPtKYAzIUaVFGejhN8eXdGRUk35Rb8OR4eZa7VWpYgI3lpbrkBCensX5X
 Yg4Q==
X-Gm-Message-State: AOAM530V9OpkD6y7yau8lXNNYhImPKHpY+n679kpJjh140Kehz/69qcZ
 ti1R8coakoy4kJ9ewVksEGjPjgVNnnv1kq/BuaIlDg==
X-Google-Smtp-Source: ABdhPJyMlusETpcXtsnqCiAk+OopudLRY4A9CkBdCgD60xRQZGC4LmqWGj4zTblayJ8/FWZnB2m0tkh2JLhKv7RvdNE=
X-Received: by 2002:aca:5793:: with SMTP id l141mr953303oib.14.1625586780449; 
 Tue, 06 Jul 2021 08:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210705130314.11519-1-ogabbay@kernel.org>
 <YOQXBWpo3whVjOyh@phenom.ffwll.local>
 <CAFCwf10_rTYL2Fy6tCRVAUCf4-6_TtcWCv5gEEkGnQ0KxqMUBg@mail.gmail.com>
 <CAKMK7uEAJZUHNLreBB839BZOfnTGNU4rCx-0k55+67Nbxtdx3A@mail.gmail.com>
 <CAKMK7uHpKFVm55O_NB=WYCsv0iUt92ZUn6eCzifH=unbhe3J8g@mail.gmail.com>
 <CAKMK7uFGr=ugyKj0H3ctbh28Jnr25vAgXPBaDBMmfErCxYVo3w@mail.gmail.com>
 <20210706134430.GL4604@ziepe.ca>
 <CAKMK7uFEZjp2_WBhtkVxSNQ-1WcBSr3NDotY0fjz0iLRw8Barw@mail.gmail.com>
 <20210706145617.GO4604@ziepe.ca>
In-Reply-To: <20210706145617.GO4604@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 6 Jul 2021 17:52:49 +0200
Message-ID: <CAKMK7uETz8dqCyfVHa=Af4nNizrwZNaLLPVE0bW35=50o2nT1Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add p2p via dmabuf to habanalabs
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Christoph Hellwig <hch@lst.de>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 6, 2021 at 4:56 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Tue, Jul 06, 2021 at 04:09:25PM +0200, Daniel Vetter wrote:
> > Anyway, for anything that works like a gpu accelerator, like 3d accel,
> > or parallel compute accel (aka gpgpu) or spatial compute accel (aka
> > NN/AI) or maybe even fpga accel most of the magic to use the hardware
> > is in this backend compiler, which translates from an IR into whatever
> > your accelerator consumes. That's the part we really care about for
> > modern accelerators because without that defacto the hardware is
> > useless. Generally these chips have full-blown, if special purpose
> > ISA, with register files, spilling, branches, loops and other control
> > flow (sometimes only execution masks on simpler hw).
>
> I don't know if I see it so clearly as you do - at the end of the day
> the user keys in the program in some proprietary (or open!) language
> and and wack of propritary magic transforms it to "make it work".
>
> There are many barriers that prevent someone without the secret
> knowledge from duplicating the end result of a working program. An
> accelerator ISA is certainly one example, but I wouldn't overly focus
> on it as the only blocker.

Well we don't, we do just ask for the full driver stack to make the hw
work. It's just that in the past most vendors choose to leave out the
compiler/ISA from their open stack/specs. Well except nvidia, which
still chooses to leave out everything aside from some very, very
minimal thing around documenting display functionality.

> Like you said below the NVIDIA GPU ISA seems known but the HW is still
> not really useful for other reasons.
>
> Habana seems to have gone the other way, the HW is fully useful but we
> don't have the ISA transformation and other details.

You can actually use nvidia gpus, they're fully functional.

If you install the blobby stack. Which is exactly the same thing as
with habanalabs, plus/minus a few things at the fringes.

In the end it's about drawing the line somewhere, so maybe we should
merge the nvidia glue code that makes their blobby stack work better
with upstream? There's quite a few pieces there, e.g. their display
driver is by design a userspace driver, whereas with kernel
modesetting it needs to be in the kernel to expose the common kms
ioctl interfaces, so they've built up a glue layer to forward
everything to userspace and back. On windows it works because there
kernel code can have growing stacks and fun stuff like that, at least
that's my understanding. Not really an option to just run the code in
linux.

I'm pretty sure nvidia would appreciate that, and maybe every once in
a while they open up a header for a generation or two of products like
they've done in the past.

> Both cases seem to have ended up with something useless, and I have a
> hard time saying nouveau has more right to be in the kernel tree than
> Habana does.
>
> > > Honestly, I think GPU is approaching this backwards. Wayland should
> > > have been designed to prevent proprietary userspace stacks.
> >
> > That's not possible without some serious cans of worms though. Wayland
> > is a protocol, and you can't forbid people from implementing it.
> > Otherwise all the compatible open implementations of closed protocols
> > wouldn't be possible either.
>
> Well, in many ways so is Linux, but nobody would seriously
> re-implement Linux just to produce a driver.

Well in the gpu space for 2+ decades nvidia has been setting the
standard, and the open stack has been trying to catch up by
reimplementing the entire thing. It took a fair while.

> > So I'm not clear what you're suggesting here we should do different.
>
> Not enabling proprietary stacks as above would be a good start.

I'm still not sure what exactly you mean here. Like on the 3d side
there's opengl and vulkan, and nvidia just has an entirely different
implementation of that compared to any of the open drivers. That is a
bit less code than linux, but it's not small, and reimplementing over
decades is pretty much what happened. And if it's not allowed we'd
actually not have an open 3d gpu stack at all, because only very
recently did we get an agreement around the tracemark/licensing issues
of that stuff with Khronos. Recently compared to the history of opengl
at least.

So I'm still not clear what exactly it is you're suggesting we should
do? Not implement the industry standards for 3d (and accept we stay
irrelevant forever)? Reject nvidia blobs harder than we do already?
Distros will continue to ship an auto-installer for that stack, at
least some, so we're pretty much maxed out already. Like in what way
do you think the upstream stack does enable the proprietary nvidia
stack? Should we permanently ban any contributions from anyone with an
@nvidia.com address, even if it helps the open stack improve?

Like I'm not seeing something concrete that could be done, which would
actually prevent nvidia from having their completely independent
stack, with exact same functionality and not a line of code shared.
Which is were we are right now. The only thing where we could be more
strict is to reject any contributions from them at all, just because
we don't like them. That seems a bit too extreme
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
