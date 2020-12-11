Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961D52D7FDD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 21:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336786E9FE;
	Fri, 11 Dec 2020 20:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884246E9FE
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 20:21:56 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id x23so12361098lji.7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 12:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lMZxDCK3EHPV415eTfAWmt24gOYNu8m5s7i1OWUhO90=;
 b=zZbDT1KGkvTMeQKEnAfTOSZjzsYrkD4Tgz8brLNeq6Lh4awBtr+xmRlRiafzhVoJIR
 rqZvyx3xlXzyBSSyeI8F5oswzPW8NDb/y8mCdCiO+2PVQmZ1VYdPdg9ovC+UpKmBL3b2
 2APVlSMD+d0xwnH0u4wSXvQUH52WMhUtGXxFcyJ/ULZoBF0Bma5GMAbrADaEHVKdC+vs
 yuYscH4GMdsTvkz8FK+ogTr6Cvov9VDoJ8KnU6qqK+4jvwheJG61Rjb45YA5Kdeoq61A
 mE+xnJEqqQ/d1F9pCzWkPAJmQaI8EDY71YJp4QmUKzSAz+va4cy/SYHk1S1JqX08YyIZ
 lebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lMZxDCK3EHPV415eTfAWmt24gOYNu8m5s7i1OWUhO90=;
 b=R1rnn2bvhYHL2c8Xa0sIZtHLmoVrA3roxhFaAsxHEoJapdiVRv70A+keoowsRo7C2k
 IhPifR1TGwuG6HDLW7E+z7WqoTo7yzh2SRib12+tFO7TH2kkDDHuTRDGeGTForWnZnsJ
 JjzVLKDHXwe5szc5jxxTFqARmYXaHjxfQrvY0HXOgrjlJ4AWN6+S3tFbLsow1oLSEnUJ
 rCvnpZ42RHavx63JRN0FLmfoNLahrlRz4HdLgrxLp0UVu1X/IXbmJTUdMBQR/9FcU6Bt
 ILq4/UrDULgSZ9U6Y/IMdkO+0J69TCpTpWtqfEOw5pDSW+y7HXpMNVDP44b6RRVB0ih7
 iRHw==
X-Gm-Message-State: AOAM532FdYjhrUEMC7G8J5BaR/VLEZLI5jHtVza/Tc9UGqgCRZB90Wu1
 atM2sFoVGmoScW2O4dATNdXE9/M4C+jMHmndJF28hw==
X-Google-Smtp-Source: ABdhPJxICfsPv5gZgl9FHRPwfpWkwc/udxsFzWzWt2wOYhJdXcGUw9M3QJjshG3dpf6olNAdPGyY3xr3ppjhjL1s6XM=
X-Received: by 2002:a05:651c:286:: with SMTP id
 b6mr5684677ljo.232.1607718114626; 
 Fri, 11 Dec 2020 12:21:54 -0800 (PST)
MIME-Version: 1.0
References: <20201210044400.1080308-1-hridya@google.com>
 <b5adfe46-8615-5821-d092-2b93feed5b79@amd.com>
 <X9H0JREcdxDsMtLX@kroah.com> <20201210102727.GE401619@phenom.ffwll.local>
 <X9H+3AP1q39aMxeb@kroah.com>
 <CAKMK7uFD3fE01Li3JOpHpzP7313OT3xpcjBwzSVjrCGAmab2Zg@mail.gmail.com>
 <X9IPhEkcZO+Ut5RH@kroah.com>
 <CAKMK7uEM636NjEcxLfsKJa9H71i0mkQ3dsT3yWwHTcVFk4r+Sg@mail.gmail.com>
In-Reply-To: <CAKMK7uEM636NjEcxLfsKJa9H71i0mkQ3dsT3yWwHTcVFk4r+Sg@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 11 Dec 2020 12:21:43 -0800
Message-ID: <CALAqxLWr7NgVszBMxTV=_LXKC3a24YzwXKjSdXuLdP5xKGue1w@mail.gmail.com>
Subject: Re: [PATCH] dmabuf: Add the capability to expose DMA-BUF stats in
 sysfs
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Hridya Valsaraju <hridya@google.com>,
 Android Kernel Team <kernel-team@android.com>,
 Suren Baghdasaryan <surenb@google.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 5:10 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Dec 10, 2020 at 1:06 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Thu, Dec 10, 2020 at 12:26:01PM +0100, Daniel Vetter wrote:
> > > On Thu, Dec 10, 2020 at 11:55 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > On Thu, Dec 10, 2020 at 11:27:27AM +0100, Daniel Vetter wrote:
> > > > > This only shows shared memory, so it does smell a lot like $specific_issue
> > > > > and we're designing a narrow solution for that and then have to carry it
> > > > > forever.
> > > >
> > > > I think the "issue" is that this was a feature from ion that people
> > > > "missed" in the dmabuf move.  Taking away the ability to see what kind
> > > > of allocations were being made didn't make a lot of debugging tools
> > > > happy :(
> > >
> > > If this is just for dma-heaps then why don't we add the stuff back
> > > over there? It reinforces more that the android gpu stack and the
> > > non-android gpu stack on linux are fairly different in fundamental
> > > ways, but that's not really new.
> >
> > Back "over where"?
> >
> > dma-bufs are not only used for the graphics stack on android from what I
> > can tell, so this shouldn't be a gpu-specific issue.
>
> dma-buf heaps exist because android, mostly because google mandates
> it.

So, I don't think that's fair.

dma-buf heaps and ION before exist because it solves a problem they
have for allocating shared buffers for multiple complicated
multi-device pipelines where the various devices have constraints.
It's not strictly required[1], as your next point makes clear (along
with ChromeOS's Android not using it).

> There's not a whole lot (meaning zero) of actually open gpu stacks
> around that run on android and use dma-buf heaps like approved google
> systems, largely because the gralloc implementation in mesa just
> doesnt.

So yes, db845c currently uses the gbm_gralloc, which doesn't use
dmabuf heaps or ION.

That said, the resulting system still uses quite a number of dmabufs,
as Hridya's patch shows:
==> /sys/kernel/dmabuf/28435/exporter_name <==
drm
==> /sys/kernel/dmabuf/28435/dev_map_info <==
==> /sys/kernel/dmabuf/28435/size <==
16384
==> /sys/kernel/dmabuf/28161/exporter_name <==
drm
==> /sys/kernel/dmabuf/28161/dev_map_info <==
==> /sys/kernel/dmabuf/28161/size <==
524288
==> /sys/kernel/dmabuf/30924/exporter_name <==
drm
==> /sys/kernel/dmabuf/30924/dev_map_info <==
==> /sys/kernel/dmabuf/30924/size <==
8192
==> /sys/kernel/dmabuf/26880/exporter_name <==
drm
==> /sys/kernel/dmabuf/26880/dev_map_info <==
==> /sys/kernel/dmabuf/26880/size <==
262144
...

So even when devices are not using dma-buf heaps (which I get, you
have an axe to grind with :), having some way to collect useful stats
for dmabufs in use can be valuable.

(Also one might note, the db845c also doesn't have many constrained
devices, and we've not yet enabled hw codec support or camera
pipelines, so it avoids much of the complexity that ION/dma-buf heaps
was created to solve)

> So if android needs some quick debug output in sysfs, we can just add
> that in dma-buf heaps, for android only, problem solved. And much less
> annoying review to make sure it actually fits into the wider ecosystem
> because as-is (and I'm not seeing that chance anytime soon), dma-buf
> heaps is for android only. dma-buf at large isn't, so merging a debug
> output sysfs api that's just for android but misses a ton of the more
> generic features and semantics of dma-buf is not great.

The intent behind this patch is *not* to create more Android-specific
logic, but to provide useful information generically.  Indeed, Android
does use dmabufs heavily for passing buffers around, and your point
that not all systems handle graphics buffers that way is valid, and
it's important we don't bake any Android-isms into the interface. But
being able to collect data about the active dmabufs in a system is
useful, regardless of how regardless of how the dma-buf was allocated.

So I'd much rather see your feedback on how we expose other aspects of
dmabufs (dma_resv, exporter devices, attachment links) integrated,
rather then trying to ghettoize it as android-only and limit it to the
dmabuf heaps, where I don't think it makes as much sense to add.

thanks
-john

[1] Out of the box, the codec2 code added a few years back does
directly call to ION (and now dmabuf heaps) for system buffers, but it
can be configured differently as it's used in ChromeOS's Android too.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
