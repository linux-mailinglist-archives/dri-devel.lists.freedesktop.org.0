Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B87F1CFAF9
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 18:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BBD89D84;
	Tue, 12 May 2020 16:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4871789D84
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 16:38:08 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id m18so10977294otq.9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bcd8nHsJCbNbh6jnNFKcebFJW5u28QgzGsWwG3IlExk=;
 b=Fe9aRMjlVKIMXApWMeUNwOkkoB1hwpYrEw6VUAj4245ZZ4KKGPyCFg0iNcoiwSAlsD
 ambBvenA2oFOAaghXfqEfJ5XkydoC46mx5rChM1ZNEq4puBwVOb3rFPRqjBGXaJ804FM
 eOy910j9CjTo2AcpNR2Esx7y5KXfxQ/UQcI9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bcd8nHsJCbNbh6jnNFKcebFJW5u28QgzGsWwG3IlExk=;
 b=OTE+KV70TMiCdwh5r5kGcNVLhg1WUFt3et30ykB+Rwe/l0DvedlTv8CqGmhdp/q45V
 KxAQkYrwPpB0yU0F+yBwI3gFIngFWSHnujrdcWLIG8VCWHdyXdFGf/8nbcO+EM4pDUkl
 LzUX627+A3Hnx4asN5NEqa+c6eF5rCF/WasIa/zUMqSdswwtCr37d+W7r62IX8DUVZgW
 Qq/E9Qmiy1xmYTQGdvuvq2IxfGB0Lf9lTBJZkhPKn4v1xRUkIlpdbKii+9vDnfmswyAY
 QYTo9Zl5p/sZTtSOKpUzNqWkSmED6WmR6KokwTyGtlZZTABWoxw4IqwIbBx5lXE+aeCU
 Pwww==
X-Gm-Message-State: AGi0PuZDNK7KG3dIOqw5V3v9rVR/tSfVWmg5B8zCZV4wDyKNetaPag9f
 PTLo3qM1tn1yWKCWhHL1aQSKX6SlfuRgfnNjViAZpw==
X-Google-Smtp-Source: APiQypJAVmwBUz+bfFam2r9+X4jjQMxqu8+V3J4xk0zqVElQTk80lmS5KrHSGQW/N9AV4nEuIhuJY5L7hjWr67b8Ho0=
X-Received: by 2002:a05:6830:1d0:: with SMTP id
 r16mr16553898ota.303.1589301487456; 
 Tue, 12 May 2020 09:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
 <CADnq5_NkD4+AMbNJceOJVSeBbJNQ3KDJq-kb7aHyF2jW8Y6dOA@mail.gmail.com>
 <CALjTZvZcg60rgDux7+Kh3zaMBkd-OiqoJ7GyYrLxfvnwgc4Xng@mail.gmail.com>
 <CADnq5_M61r7CMtfMBx6Cf_N9SnJJn0PouiMjVg8wytEMF1YZfw@mail.gmail.com>
 <c5d29422-21bd-b786-c822-5643730ab8a6@daenzer.net>
 <CALjTZvZOHyEFVv-2RV94dFKDFQY4zxYEHt5uQ+1B48Npo4AwRw@mail.gmail.com>
 <alpine.DEB.2.02.2005121124110.28199@scenergy.dfmk.hu>
 <CADnq5_PwY5czTPepDwzc5qoMJ3cKc4Mui=uN=k1EOtmOD42Log@mail.gmail.com>
In-Reply-To: <CADnq5_PwY5czTPepDwzc5qoMJ3cKc4Mui=uN=k1EOtmOD42Log@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 12 May 2020 18:37:56 +0200
Message-ID: <CAKMK7uG3R4uve41MkkcFSiDJ+p=MwW81gcFW7NFENjKbdDUZ+g@mail.gmail.com>
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

On Tue, May 12, 2020 at 3:22 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Tue, May 12, 2020 at 5:40 AM Karoly Balogh (Charlie/SGR)
> <charlie@scenergy.dfmk.hu> wrote:
> >
> > Hi,
> >
> > On Tue, 12 May 2020, Rui Salvaterra wrote:
> >
> > > > FWIW, on my last-generation PowerBook with RV350 (IIRC), there was a
> > > > big performance difference between AGP and PCI GART. The latter was
> > > > sort of usable for normal desktop operation, but not so much for
> > > > OpenGL apps (which were usable with AGP).
> > >
> > > I never really understood what were the issues with AGP on PowerPC
> > > (well, Apple, the only ones I've tested) machines. I mean, did OS X also
> > > disable AGP entirely, or did it have workarounds somewhere else on the
> > > stack nobody was able to figure out?
> >
> > I don't know about OS X, but I doubt there is a major/blocker hardware
> > issue, at least not one which affects every AGP machine.
> >
> > MorphOS' own Radeon driver uses the AGP facilities to some degree on all
> > AGP PowerPC Macs supported by that OS, which is from PMac AGP Graphics
> > (3,1) all the way up to the AGP G5 (7,3), including the various portables
> > and the Mac mini G4. For example it can utilize it to stream video data
> > directly from mainboard RAM, so you don't have to copy it with the CPU,
> > allowing reasonably good 720p h264 video playback on most systems above
> > the 1Ghz mark with the native MPlayer port. I'm sure the 3D part of the
> > driver also use it to some degree, given the performance improvement we
> > experienced when the AGP support was enabled (initially the system was
> > running without it), but to which extent I can't say.
>
> The problem is AGP doesn't support CPU cache snooping.  Technically
> PCI must support coherent device access to system memory.  Unsnooped
> access is an optional feature and some platforms may not support it at
> all.  Unfortunately, AGP required unsnooped access.  x8t generally
> provides a way to do this, but other platforms, not so much.  I don't
> recall to what extent PowerPC supported this.  The Linux DMA API
> doesn't really have a way to get uncached memory for DMA so there is
> that too.  Windows and Mac may provide a way to do this depending on
> the platforms.  What probably should have been done on AGP boards was
> to use both the AGP GART and the device GART.  The former for uncached
> memory (if the platform supported it) and the latter for cached
> memory.  That never happened.

Slight correction on the dma-api side of things: The dma-api very much
can give you uncached memory, but only on some platforms, and the
dma-api is very opinionated about which those are. And it refuses to
tell you whether your memory ends up being uncached or cached. That's
all done in the name of platform portability, which is good for most
drivers, but just too much pain for gpu drivers.

Otherwise all agree, agp is a mighty mess and essentially just
crapshot outside of x86. It kinda worked for the much more static
allocations for dri1, but with in-kernel memory managers all the cache
flushing issues showed up big time and it all fell to pieces. Plus a
lot of these host chipset back then where designed for the rather
static windows gpu managers, so even on x86 the coherency issues for
agp mode when used together with ttm or something else really dynamic
is pretty bad because the hw just doesn't really cope and has all
kinds of flushing troubles and races. I think the later agp chipsets
were better.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
