Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB611C797D
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 20:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DF86E055;
	Wed,  6 May 2020 18:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C8C6E055
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 18:34:52 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id 19so2654448oiy.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 11:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T1fc7Ga+GKDig3f8S+JUzkFdaI2xEUQOvINcVIib0WA=;
 b=Xsq7IVsHnRlZrfWWy9YjWJRmlDAazorYIfWBQeQDUMSxW5vmFtwGFsV44smBKus9S4
 xbYb62OcYapfL60xYO5QNjuV7zQBNx+e/tV+pvO4dZwTIon8yeDJ8xvqs1eOZckYIIKM
 82sX3oNTaX2advnyIBOMLv5HZQwhuSAkK2ZFe7Q/X64IL6ZIN9XRQRBqWTE5SA/uZPAj
 ELXe+npy39Qlv9pHNXkb5zHm0rb2uVmNhJTlouQfErdSoLq0rwNof8DnAsXMJWI9N2Nf
 OXHBdxWoyxJLy2aAbBdGsphGcMpsZr+dbkNSA3gr/VhuogEZPlKXM0owJuNA/9cHcuzb
 EJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T1fc7Ga+GKDig3f8S+JUzkFdaI2xEUQOvINcVIib0WA=;
 b=DV9cpBwxEkXgd73Wygsnqj+yHKBIssNSHqwIib+d8dPEIYs5jDjkM5Ci8lTIm5CecB
 HThTonKktOQc5rhGPVsZO7cKaRkAhQm7v/KLZ5o5rXJshv3k2N7nbe/Nuvv7akixTUu3
 ssoWihzI3kJtPOjZrwXGGFF0To0Re+0cMKxhv02WiXn+AVbV9UIy3QTXxCfUPrmImvaH
 sAf1h/R2qFOsPOIdCDptGros2WTalcW/pLHJIB6vuDiEhKeGBVZ44lUmb621G+rM60iY
 g1eySd0scq7kA/qqbIzKCUVfklZrsDUAoi3fJwACd6TXQlc0EMGCkcKgoVsm+uNuUwye
 uhkA==
X-Gm-Message-State: AGi0PubsovviK03EnLBf11gYlVxatqOmv5txv+8z6zbQm2IJXprQTjtR
 oDyA7QityY9oJ1271wxGQbWB4en07mYuIvP0o/uxIg==
X-Google-Smtp-Source: APiQypJTlIVoV8gTdf/74eWQM4wtQW6JZTe94+ZDgV2T6N38Yf+mk/uD1Cjkm8pYAzrFmRs1xr5PeuuC9TMxezxvdSY=
X-Received: by 2002:aca:cf83:: with SMTP id f125mr3751724oig.97.1588790092197; 
 Wed, 06 May 2020 11:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200501073949.120396-1-john.stultz@linaro.org>
 <20200501073949.120396-2-john.stultz@linaro.org>
 <20200501104216.4f226c2a7bzval5o@DESKTOP-E1NTVVP.localdomain>
 <CALAqxLVScV1j-zxw=cwpE0+eDoaubchXx6SJgu=1Zvh8HnE-Tg@mail.gmail.com>
 <20200504085007.5yrjhknkg6ugbqwk@DESKTOP-E1NTVVP.localdomain>
 <1bddb721-d4d9-f113-bacc-0a0ca2d57753@ti.com>
 <CALAqxLWnEj-c3CYGC6p23cwMqce-MV6pJOzGbp+ptWFB0NQoog@mail.gmail.com>
 <1b82e66e-01b9-5c4d-9777-1aa34bf1b07e@ti.com>
In-Reply-To: <1b82e66e-01b9-5c4d-9777-1aa34bf1b07e@ti.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 6 May 2020 11:34:40 -0700
Message-ID: <CALAqxLVD=18djAumbP6+ML-Fc32OJbcaWGkdJ8egHsKHhvhHqg@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/4] devicetree: bindings: Add linux, cma-heap tag for
 reserved memory
To: "Andrew F. Davis" <afd@ti.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, nd <nd@arm.com>,
 Alistair Strachan <astrachan@google.com>, Sandeep Patil <sspatil@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 linux-mm <linux-mm@kvack.org>, Rob Herring <robh+dt@kernel.org>,
 Christoph Hellwig <hch@lst.de>, dri-devel <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>,
 Pratik Patel <pratikp@codeaurora.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 6, 2020 at 10:35 AM Andrew F. Davis <afd@ti.com> wrote:
> On 5/6/20 12:30 PM, John Stultz wrote:
> > On Wed, May 6, 2020 at 9:04 AM Andrew F. Davis <afd@ti.com> wrote:
> >> On 5/4/20 4:50 AM, Brian Starkey wrote:
> >>> On Fri, May 01, 2020 at 11:40:16AM -0700, John Stultz wrote:
> >>>> So the name we expose is the CMA name itself. So with dt it will be
> >>>> the name of the reserved memory node that the flag property is added
> >>>> to.
> >>>>
> >>>
> >>> Yeah I'm just wondering if that's "stable" so we can say "the heap
> >>> will use the node name", or if saying that would cause us a headache
> >>> in the future.
> >>
> >>
> >> The issue is going to be this causes the node name in DT to become a
> >> kind of ABI. Right now until we have some userspace lib that enumerates
> >> the heaps in a stable way programs will hard-code the full heap name,
> >> which right now would look like:
> >>
> >> char *heap = "/dev/dma_heap/dma_heap_mem@89000000";
> >>
> >
> > If that's what the device chose to export.
> >
>
>
> Well no "device" exported it, we did mostly automatically using only DT

Sorry. By "device" I meant the board/phone/system.

> information. When making a DT I don't want to be thinking about how
> names will break userspace, for instance if node naming guidance is
> updated do apps suddenly stop working? That worries me a bit.

So when folks change an existing board/system's DT, that can cause
userland breakage.  Be it firmware paths, or when folks moved things
under an soc{ } node.  But at the same time, just like each system has
a different partition layout, each system may have different heaps,
and its up to a system level config in userland to provide the policy
of what is used where.

> > Eh. I don't see this as such an issue. On different systems we have
> > different device nodes. Some boards have more or fewer NICs, or
> > various partitions, etc. There has to be some device specific userland
> > config that determines which partitions are mounted where (this is my
> > "gralloc is fstab" thesis :)
> >
>
> Oh I agree here, net interface names and /dev/<hd> names have a history
> of changing, but those did both break a lot of apps. It could be argued
> they were abusing the API by making assumptions about the names, but we
> still have old scripts floating assuming "eth0" is going to just work..
>
> So the sooner we get this fstab scheme in place and in practice, the
> fewer apps in the wild will hard-code names.

Gralloc already exists on Android devices, you ask to allocate for a
use case, and it picks the heap. It could be *much* simpler (rather
than per-device implementations, I'm hoping to get to a single
implementation with a fstab like config file), but it's already widely
used.


> > I think with the heaps, qualities other than name are going to be
> > poorly specified or unenumerable, so any generic query interface is
> > going to fall down there (and be awful to use).
>
> Sure, so this "fstab" style config will have to be a mapping of names
> (which we will have to make static per heap in kernel) to properties

I'm not sure I'm following this static per-heap requirement bit . Can
you clarify?

> that interest the current users of a system. For now I can only think of
> cached/uncached, contiguous/sg, and secure/mappable. Then maybe a list
> of devices that can consume buffers of that variety, should allow for
> simple constraint matching. I'll need to think on this a bit more as the
> use-cases show up..

There's a lot of other cases that are common on Android. One CMA heap
might be sized and reserved for camera usage, so it doesn't have to
compete with other CMA users to quickly get a bunch of frames.  Where
as another CMA heap might be specified for a HWFB if that has to be
contiguous.  Again, it's less about the specific attributes
(contiguous/secure/etc - though those are important considerations
when creating the mapping for it to work properly), and more of a
higher level "for this use case or this pipeline, we use this heap"
mapping.

Just like an application might store data to /home/ which maps to to a
specific partition configured on a specific system, instead of
looking for things like "what partition has the most space".

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
