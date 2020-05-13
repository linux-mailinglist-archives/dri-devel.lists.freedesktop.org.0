Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 589191D09CA
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 09:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA0E6E1D3;
	Wed, 13 May 2020 07:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5E189FFD
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 07:19:55 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id o7so20616664oif.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 00:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ea3lp7y4GVFDsQIDLhjxLCkYMhe9Lb+H3bAbV4Y8GW8=;
 b=XSmucmSGJnDRdx/x+K6aSi1Oc55VcHMg/vLg78wMCF+L5SkFzogOQztQKNVZuJC7q9
 DLujZAmFvQp3ZBYh3kBA59fKIHc0cRKTrw5J1XSuDnasVzN7jj151XHQVDDuTvuFDDfz
 qxvrq+06kndGs3EGXkTHjKz84v2RFkfwdQovI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ea3lp7y4GVFDsQIDLhjxLCkYMhe9Lb+H3bAbV4Y8GW8=;
 b=qSxNzT+6n9bFr4zv5UN9lHG+mb5ZA0Wu0DyXEbOmlH/Mo+b0rCG+8twpF74QYd6whd
 KaP3wbxluX5yudQdiA88xjASJmY/cYE2od/Pqb4hORyRxzHKQKzzyD9khkpPGJgarrBa
 LXD2/dszJCNU0tPi81+TCo5hWw7w+DH1qUdPf5ha5n+OVMpFpk85R2anjIuF+CZWOECh
 rv5PIQiy61OPEKDJnjFLKNReM+kMYJW0pa0PJwR/+UBYFpySJzmrl3HzWbJqaRIazbOL
 2rOwZnFm6Hm3jv67T29VnjWqBsmqyJPK/MeSfifa4kRWdiQw9H7TkjklRAI8z1VLAuGI
 FJkw==
X-Gm-Message-State: AGi0PuaXiLmw4EOI60okkSa1kjbdkllAGMEEMrhV6SqhC2B4OV2VP6WF
 twhQjY7eoWw2qZUk3Lr/CejsvY5s0pxISPD8b5nKVA==
X-Google-Smtp-Source: APiQypIfy8w9XiiOcexc6NsTyULN6llzBX6lqZfdcGa/QYOZJnL3HboIgkbrgzSeeJ47gLIjK4otlpnOnQpQs4VtO3A=
X-Received: by 2002:aca:2113:: with SMTP id 19mr17621649oiz.128.1589354394494; 
 Wed, 13 May 2020 00:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
 <CADnq5_NkD4+AMbNJceOJVSeBbJNQ3KDJq-kb7aHyF2jW8Y6dOA@mail.gmail.com>
 <CALjTZvZcg60rgDux7+Kh3zaMBkd-OiqoJ7GyYrLxfvnwgc4Xng@mail.gmail.com>
 <CADnq5_M61r7CMtfMBx6Cf_N9SnJJn0PouiMjVg8wytEMF1YZfw@mail.gmail.com>
 <c5d29422-21bd-b786-c822-5643730ab8a6@daenzer.net>
 <CALjTZvZOHyEFVv-2RV94dFKDFQY4zxYEHt5uQ+1B48Npo4AwRw@mail.gmail.com>
 <alpine.DEB.2.02.2005121124110.28199@scenergy.dfmk.hu>
 <CADnq5_PwY5czTPepDwzc5qoMJ3cKc4Mui=uN=k1EOtmOD42Log@mail.gmail.com>
 <CAKMK7uG3R4uve41MkkcFSiDJ+p=MwW81gcFW7NFENjKbdDUZ+g@mail.gmail.com>
 <CADnq5_NFDjOzgnjHOHEcjacd2dX1kA1QEzHp8=NweZg_b-82-A@mail.gmail.com>
In-Reply-To: <CADnq5_NFDjOzgnjHOHEcjacd2dX1kA1QEzHp8=NweZg_b-82-A@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 13 May 2020 09:19:43 +0200
Message-ID: <CAKMK7uHv_Hj8BB8t_i=EXx1C4WXw1PnmxuTyNfrA=b5eQMaSLg@mail.gmail.com>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Rui Salvaterra <rsalvaterra@gmail.com>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "Karoly Balogh \(Charlie/SGR\)" <charlie@scenergy.dfmk.hu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 12, 2020 at 8:22 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Tue, May 12, 2020 at 12:38 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, May 12, 2020 at 3:22 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > On Tue, May 12, 2020 at 5:40 AM Karoly Balogh (Charlie/SGR)
> > > <charlie@scenergy.dfmk.hu> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Tue, 12 May 2020, Rui Salvaterra wrote:
> > > >
> > > > > > FWIW, on my last-generation PowerBook with RV350 (IIRC), there was a
> > > > > > big performance difference between AGP and PCI GART. The latter was
> > > > > > sort of usable for normal desktop operation, but not so much for
> > > > > > OpenGL apps (which were usable with AGP).
> > > > >
> > > > > I never really understood what were the issues with AGP on PowerPC
> > > > > (well, Apple, the only ones I've tested) machines. I mean, did OS X also
> > > > > disable AGP entirely, or did it have workarounds somewhere else on the
> > > > > stack nobody was able to figure out?
> > > >
> > > > I don't know about OS X, but I doubt there is a major/blocker hardware
> > > > issue, at least not one which affects every AGP machine.
> > > >
> > > > MorphOS' own Radeon driver uses the AGP facilities to some degree on all
> > > > AGP PowerPC Macs supported by that OS, which is from PMac AGP Graphics
> > > > (3,1) all the way up to the AGP G5 (7,3), including the various portables
> > > > and the Mac mini G4. For example it can utilize it to stream video data
> > > > directly from mainboard RAM, so you don't have to copy it with the CPU,
> > > > allowing reasonably good 720p h264 video playback on most systems above
> > > > the 1Ghz mark with the native MPlayer port. I'm sure the 3D part of the
> > > > driver also use it to some degree, given the performance improvement we
> > > > experienced when the AGP support was enabled (initially the system was
> > > > running without it), but to which extent I can't say.
> > >
> > > The problem is AGP doesn't support CPU cache snooping.  Technically
> > > PCI must support coherent device access to system memory.  Unsnooped
> > > access is an optional feature and some platforms may not support it at
> > > all.  Unfortunately, AGP required unsnooped access.  x8t generally
> > > provides a way to do this, but other platforms, not so much.  I don't
> > > recall to what extent PowerPC supported this.  The Linux DMA API
> > > doesn't really have a way to get uncached memory for DMA so there is
> > > that too.  Windows and Mac may provide a way to do this depending on
> > > the platforms.  What probably should have been done on AGP boards was
> > > to use both the AGP GART and the device GART.  The former for uncached
> > > memory (if the platform supported it) and the latter for cached
> > > memory.  That never happened.
> >
> > Slight correction on the dma-api side of things: The dma-api very much
> > can give you uncached memory, but only on some platforms, and the
> > dma-api is very opinionated about which those are. And it refuses to
> > tell you whether your memory ends up being uncached or cached. That's
> > all done in the name of platform portability, which is good for most
> > drivers, but just too much pain for gpu drivers.
>
> Out of curiosity how do you do that without manually messing around
> with PAT or MTRRs?

i915 is even worse, we manually mess around with clflush. In
userspace. So really there's 2 axis for dma memory: coherent vs.
non-coherent (which is something the dma-api somewhat exposed), i.e.
do you need to clflush or not, and cached vs uncached, i.e. are the
PAT entries wc or wb.

But yeah if you dont have PAT real uncached isn't possible, can't frob
MTTR for individual pages. That also, to my understanding, why the dma
api doesn't want to expose this to driver, but abstract it all away:
On many tiny soc platforms all you have for uncached is an mttr (well
the equivalent on that platform), so you anything you get from
dma_alloc_coherent needs to come from there.

But then no one is ever going to plug in a big gpu into such a system
and expect anything to work, so we really need an abstraction that
works on a bit more than just x86 (so we don't dig around in platform
stuff like updating PAT or issusing clflush anymore), but doesn't try
to work everywhere linux runs, just on the few platforms people expect
big gpus to work on. For all the kms-only drivers we have the dma api
seems actually perfectly fine (essentially the cma helpes we have
should be called dma helpers, since that's what they're using
underneath for all buffer management).

Cheers, Daniel

>
> Alex
>
> >
> > Otherwise all agree, agp is a mighty mess and essentially just
> > crapshot outside of x86. It kinda worked for the much more static
> > allocations for dri1, but with in-kernel memory managers all the cache
> > flushing issues showed up big time and it all fell to pieces. Plus a
> > lot of these host chipset back then where designed for the rather
> > static windows gpu managers, so even on x86 the coherency issues for
> > agp mode when used together with ttm or something else really dynamic
> > is pretty bad because the hw just doesn't really cope and has all
> > kinds of flushing troubles and races. I think the later agp chipsets
> > were better.
> > -Daniel
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > +41 (0) 79 365 57 48 - http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
