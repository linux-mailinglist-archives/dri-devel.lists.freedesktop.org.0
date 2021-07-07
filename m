Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D663BE86B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 14:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD9D6E12E;
	Wed,  7 Jul 2021 12:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1076E12C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 12:54:46 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id l21so3242244oig.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jul 2021 05:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZwucK/hcyFDLDJ5ulbYeHz4jdgbFEMTjqApCtmNqV+E=;
 b=H6eMViN7cPvcwTKvKheJG9sJFRXo5t5JSta3Q1bmZUkcKlz8vytBXOCNkU/JqVul+d
 VWFc0jOPzvxDOs8qb/ame/veAS9kfUmpd5auGGz/pmDHZ8QpQHUzgiUxkOX4oM1JFoyd
 r7W1zE/iC95PtQdaLEgxF2Mm+Yb/KXz4c6Ing=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZwucK/hcyFDLDJ5ulbYeHz4jdgbFEMTjqApCtmNqV+E=;
 b=PjaQsucHk+KyOPdiF7wG8tMtjP+91jCpuJxUZqK7T6fbPWpWXxcqErVgNS8fdY6wRl
 cCrZQalsiyWZYLOb/QScwH54PEDscZdBz+aF3sdR+wABoCYMVGaYgn36Z9kG+B78o8Yk
 6YxUnoITZ6HiZUjnJTPk80Grl15lbx0TPqPXyEpWYqwgNVBfgzsP3n7VGVysOC2icZUX
 Ba43KKUP8homtYYPthk3/vh99N03kObfTlv8TXGiGWyZbhFnLVMgVYxGuLok41a8gL13
 UrU6yYtAKxVw5jC7U5lB0QGhhHIIHpRX20RoeakGLRSfXrREpxFMy7OhI9gMKytkYFfl
 3C3g==
X-Gm-Message-State: AOAM530f0Kx3tJuBgWPD2ajm9Q6pD4aaLmoiSOsTAGvKlO+yq2gv/BT4
 W2Z6tq8OLXWcBwZKno09vc48wx6ibkxGF55+a+Zl4A==
X-Google-Smtp-Source: ABdhPJygqGkF27WMKuRCc+HJjxSUE80qhZpY36/0xSlWlXRYoPY3q/cIXPhcyfDPJ3DAKsV7rDaa38qZXXQaPcpAD/Y=
X-Received: by 2002:aca:eb43:: with SMTP id j64mr4775645oih.101.1625662486066; 
 Wed, 07 Jul 2021 05:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210705130314.11519-1-ogabbay@kernel.org>
 <YOQXBWpo3whVjOyh@phenom.ffwll.local>
 <20210706122110.GA18273@lst.de> <YORLTmyoXDtoM9Ta@phenom.ffwll.local>
 <9af554b1-e4d8-4dd4-5a6a-830f3112941d@gmail.com>
In-Reply-To: <9af554b1-e4d8-4dd4-5a6a-830f3112941d@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 7 Jul 2021 14:54:34 +0200
Message-ID: <CAKMK7uG2LnceUqst7VeA7+zhyJJoY5FReuDPfJu67tuTv60WeQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v4 0/2] Add p2p via dmabuf to habanalabs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 linux-rdma <linux-rdma@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Christoph Hellwig <hch@lst.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 7, 2021 at 2:17 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
> Am 06.07.21 um 14:23 schrieb Daniel Vetter:
> > On Tue, Jul 06, 2021 at 02:21:10PM +0200, Christoph Hellwig wrote:
> >> On Tue, Jul 06, 2021 at 10:40:37AM +0200, Daniel Vetter wrote:
> >>>> Greg, I hope this will be good enough for you to merge this code.
> >>> So we're officially going to use dri-devel for technical details revi=
ew
> >>> and then Greg for merging so we don't have to deal with other merge
> >>> criteria dri-devel folks have?
> >>>
> >>> I don't expect anything less by now, but it does make the original cl=
aim
> >>> that drivers/misc will not step all over accelerators folks a complet=
e
> >>> farce under the totally-not-a-gpu banner.
> >>>
> >>> This essentially means that for any other accelerator stack that does=
n't
> >>> fit the dri-devel merge criteria, even if it's acting like a gpu and =
uses
> >>> other gpu driver stuff, you can just send it to Greg and it's good to=
 go.
> >>>
> >>> There's quite a lot of these floating around actually (and many do ha=
ve
> >>> semi-open runtimes, like habanalabs have now too, just not open enoug=
h to
> >>> be actually useful). It's going to be absolutely lovely having to exp=
lain
> >>> to these companies in background chats why habanalabs gets away with =
their
> >>> stack and they don't.
> >> FYI, I fully agree with Daniel here.  Habanlabs needs to open up their
> >> runtime if they want to push any additional feature in the kernel.
> >> The current situation is not sustainable.
> > Before anyone replies: The runtime is open, the compiler is still close=
d.
> > This has become the new default for accel driver submissions, I think
> > mostly because all the interesting bits for non-3d accelerators are in =
the
> > accel ISA, and no longer in the runtime. So vendors are fairly happy to
> > throw in the runtime as a freebie.
>
> Well a compiler and runtime makes things easier, but the real question
> is if they are really required for upstreaming a kernel driver?
>
> I mean what we need is to be able to exercise the functionality. So
> wouldn't (for example) an assembler be sufficient?

So no one has tried this yet, but I think an assembler, or maybe even
just the full PRM for the ISA is also good enough I think.

I guess in practice everyone just comes with the compiler for a few reasons=
:
- AMD and Intel are great and release full PRMs for the gpu, but
preparing those takes a lot of time. Often that's done as part of
bring up, to make sure everything is annotated properly, so that all
the necessary bits are included, but none of the future stuff, or
silicon bring-up pieces. So in reality you have the compiler before
you have the isa docs.

- reverse-engineered drivers also tend to have demo compilers before
anything like full ISA docs show up :-) But also the docs tooling they
have are great.

- then there's the case of developing a driver with NDA'd docs. Again
you'll have a compiler as the only real output, there's not going to
be any docs or anything like that.

> > It's still incomplete, and it's still useless if you want to actually h=
ack
> > on the driver stack.
>
> Yeah, when you want to hack on it in the sense of extending it then this
> requirement is certainly true.
>
> But as far as I can see userspace don't need to be extendable to justify
> a kernel driver. It just needs to have enough glue to thoughtfully
> exercise the relevant kernel interfaces.
>
> Applying that to GPUs I think what you need to be able to is to write
> shaders, but that doesn't need to be in a higher language requiring a
> compiler and runtime. Released opcodes and a low level assembler should
> be sufficient.

Yeah I think in theory ISA docs + assembler testcase or whatever is
perfectly fine. In reality anyone who cares enough to do this properly
gets to the demo quality compiler stage first, and so that's what we
take for merging a new stack.

I do disagree that we're only ever asking for this and not more, e.g.
if you come with a new 3d accelator and it's not coming with a
userspace driver as a mesa MR, you have to do some very serious
explaining about wtf you're doing - mesa3d won, pretty much across the
board, as a common project for both vulkan and opengl, and the
justifications for reinventing wheels better be really good here. Also
by the time you've written enough scaffolding to show it integrates in
non-stupid ways into mesa, you practically have a demo-quality driver
stack anyway.

Similar on the display side of things, over the past year consensus
for merge criteria have gone up quite a bit, e.g. there's a patch
floating around to make that clearer:

https://lore.kernel.org/dri-devel/20210706161244.1038592-1-maxime@cerno.tec=
h/

Of course this doesn't include anything grandfathered in (*cough*
amdvlk *cough*), and also outside of 3d there's clearly no
cross-vendor project that's established enough, media, compute, AI/NN
stuff is all very badly fragmented. That's maybe lamentable, but like
you said not really a reason to reject a kernel driver.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
