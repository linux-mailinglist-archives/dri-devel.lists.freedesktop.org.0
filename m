Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C28692014C0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 18:20:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B376E2BD;
	Fri, 19 Jun 2020 16:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B035A6E323
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 16:19:55 +0000 (UTC)
Received: by mail-oo1-xc42.google.com with SMTP id v1so2007477ooh.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 09:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wj1FO43iGyk7PYrrEEhEjkp2h2XH2iryroz21N45gqk=;
 b=KTV4omVyKlC8idt6WMrK4rC6pvlVu4xrql1JVUD6KZBV7gKdYxJqpq4ZpeJGmx7n73
 SSvhTZIxARGe61f5ZXZTmUvAdjCzvsY39rR/ObaJechM5w4wxPVEwfsRpKxgNAiucgSa
 n+dE3o8mBQzdJSPyc96774z0RS4si3IIY3MGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wj1FO43iGyk7PYrrEEhEjkp2h2XH2iryroz21N45gqk=;
 b=oSLxoaPryYzR+Iw6A2SIv7nkaB7Ds/CM1elGRhrMqsvzQ4J2L65JldUCml5pM9zZqx
 MGRSMTrZoUlWO4WNFqnAlXOcXY/5f0AGOnu7lq67yIFbyHFYHRCUxbyH+TSM5RekCJn1
 OmSzXvtY5fqF9sF9WU14xXlj5vpD3tVCF0OmwACnAdJkmezI+17Bk+tXZegDfW1BK+wZ
 62jvfqaT2hNs1OYR9Xdc+pRMSrLlyGsnUOvRnVQn9b6oHw1QnShXy+4BD/DfbCEya+sa
 4GyyUUdXN5snR+bg6pQciLR+F1rRssA2BejnFVbxQU9vxnFhmwQc43lcq3M/Th3llCon
 8ojA==
X-Gm-Message-State: AOAM531a6bu0SkQ2f6b7DrAQnADP0yB+6tBBXSQresv/wLrEDPKVCidw
 Bs29dYNnc27xSTXnQif25TjAk8pJcv5Tm1TtXhroZg==
X-Google-Smtp-Source: ABdhPJyoy6aHWkVkbh8xMF9/TzGOKKb8kpLI0Idlia3eF0cObcMto8g+bs85raCaxdKtZhy5XKzmlJ6GtvyqnZQdJOE=
X-Received: by 2002:a4a:9528:: with SMTP id m37mr3925602ooi.85.1592583593309; 
 Fri, 19 Jun 2020 09:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200611083430.GD20149@phenom.ffwll.local>
 <20200611141515.GW6578@ziepe.ca>
 <20200616120719.GL20149@phenom.ffwll.local>
 <CAKMK7uE7DKUo9Z+yCpY+mW5gmKet8ugbF3yZNyHGqsJ=e-g_hA@mail.gmail.com>
 <20200617152835.GF6578@ziepe.ca> <20200618150051.GS20149@phenom.ffwll.local>
 <20200618172338.GM6578@ziepe.ca>
 <CAKMK7uEbqTu4q-amkLXyd1i8KNtLaoO2ZFoGqYiG6D0m0FKpOg@mail.gmail.com>
 <20200619113934.GN6578@ziepe.ca>
 <CAKMK7uE-kWA==Cko5uenMrcnopEjq42HxoDTDywzBAbHqsN13g@mail.gmail.com>
 <20200619151551.GP6578@ziepe.ca>
In-Reply-To: <20200619151551.GP6578@ziepe.ca>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 19 Jun 2020 18:19:41 +0200
Message-ID: <CAKMK7uEvkshAM6KUYZu8_OCpF4+1Y_SM7cQ9nJWpagfke8s8LA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= <thomas_os@shipmail.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 19, 2020 at 5:15 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Fri, Jun 19, 2020 at 05:06:04PM +0200, Daniel Vetter wrote:
> > On Fri, Jun 19, 2020 at 1:39 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Fri, Jun 19, 2020 at 09:22:09AM +0200, Daniel Vetter wrote:
> > > > > As I've understood GPU that means you need to show that the commands
> > > > > associated with the buffer have completed. This is all local stuff
> > > > > within the driver, right? Why use fence (other than it already exists)
> > > >
> > > > Because that's the end-of-dma thing. And it's cross-driver for the
> > > > above reasons, e.g.
> > > > - device A renders some stuff. Userspace gets dma_fence A out of that
> > > > (well sync_file or one of the other uapi interfaces, but you get the
> > > > idea)
> > > > - userspace (across process or just different driver) issues more
> > > > rendering for device B, which depends upon the rendering done on
> > > > device A. So dma_fence A is an dependency and will block this dma
> > > > operation. Userspace (and the kernel) gets dma_fence B out of this
> > > > - because unfortunate reasons, the same rendering on device B also
> > > > needs a userptr buffer, which means that dma_fence B is also the one
> > > > that the mmu_range_notifier needs to wait on before it can tell core
> > > > mm that it can go ahead and release those pages
> > >
> > > I was afraid you'd say this - this is complete madness for other DMA
> > > devices to borrow the notifier hook of the first device!
> >
> > The first device might not even have a notifier. This is the 2nd
> > device, waiting on a dma_fence of its own, but which happens to be
> > queued up as a dma operation behind something else.
> >
> > > What if the first device is a page faulting device and doesn't call
> > > dma_fence??
> >
> > Not sure what you mean with this ... even if it does page-faulting for
> > some other reasons, it'll emit a dma_fence which the 2nd device can
> > consume as a dependency.
>
> At some point the pages under the buffer have to be either pinned
> or protected by mmu notifier. So each and every single device doing
> DMA to these pages must either pin, or use mmu notifier.
>
> Driver A should never 'borrow' a notifier from B

It doesn't. I guess this would be great topic for lpc with a seriously
big white-board, but I guess we don't have that this year again, so
let me try again. Simplified example ofc, but should be the gist.

Ingredients:
Device A and Device B
A dma-buf, shared between device A and device B, let's call that shared_buf
A userptr buffer, which userspace created on device B to hopefully
somewhat track a virtual memory range, let's call that userptr_buf.
A pile of other buffers, but we pretend they don't exist (because they
kinda don't matter.

Sequence of events as userspace issues them to the kernel.
1. dma operation on device A, which fills some interesting stuff into
shared_buf. Userspace gets back a handle to dma_fence fence_A. No mmu
notifier anywhere to be seen in the driver for device A.

2. userspace passes fence_A around to some other place

3. other places takes the handle for shared_buf and fence_A and
userptr_buf and starts a dma operation on device B. It's one dma
operation, maybe device B is taking the data from shared_buf and
compresses it into userptr_buf, so that userspace can then send it
over the network or to disk or whatever. device B has a mmu_notifier.
Userspace gets back fence_B, which represents this dma operation. The
kernel also stuffs this fence_B into the mmu_range_notifier for
userptr_buf.

-> at this point device A might still be crunching the numbers

4. device A is finally done doing whatever it was supposed to do, and
fence_A completes

5. device B wakes up (this might or might not involve the kernel,
usually it does) since fence_A has completed, and now starts doing its
own crunching.

6. once device B is also done, it signals fence_B

In all this device A has never borrowed the mmu notifier or even
accessd the memory in userptr_buf or had access to that buffer handle.

The madness is only that device B's mmu notifier might need to wait
for fence_B so that the dma operation finishes. Which in turn has to
wait for device A to finish first.

> If each driver controls its own lifetime of the buffers, why can't the
> driver locally wait for its device to finish?
>
> Can't the GPUs cancel work that is waiting on a DMA fence? Ie if
> Driver A detects that work completed and wants to trigger a DMA fence,
> but it now knows the buffer is invalidated, can't it tell driver B to
> give up?

We can (usually, the shitty hw where we can't has generally
disappeared) with gpu reset. Users make really sad faces when that
happens though, and generally they're only ok with that if it's indeed
a nasty gpu program that resulted in the crash (there's some webgl
shaders that run too long for quick&easy testing of how good the gpu
reset is, don't do that if you care about the data in your desktop
session ...).

The trouble is that userspace assembles the work that's queued up on
the gpu. After submission everyone has forgotten enough that just
canceling stuff and re-issuing everything isn't on the table.

Some hw is better, with real hw page faults and stuff, but those also
don't need dma_fence to track their memory. But generally just not
possible.

> > The problem is that there's piles of other dependencies for a dma job.
> > GPU doesn't just consume a single buffer each time, it consumes entire
> > lists of buffers and mixes them all up in funny ways. Some of these
> > buffers are userptr, entirely local to the device. Other buffers are
> > just normal device driver allocations (and managed with some shrinker
> > to keep them in check). And then there's the actually shared dma-buf
> > with other devices. The trouble is that they're all bundled up
> > together.
>
> But why does this matter? Does the GPU itself consume some work and
> then stall internally waiting for an external DMA fence?

Yup, see above, that's what's going on. Userspace queues up
distributed work across engines & drivers, and then just waits for the
entire thing to cascade and finish.

> Otherwise I would expect this dependency chain should be breakable by
> aborting work waiting on fences upon invalidation (without stalling)

Yup, it would. Now on some hw you have a gpu work scheduler that sits
in some kthread, and you could probably unschedule the work if there's
some external dependency and you get an mmu notifier callback. Then
put it on some queue, re-acquire the user pages and then reschedule
it.

It's still as horrible, since you still have the wait for the
completion in there, the only benefit is that other device drivers
without userptr support don't have to live with that specific
constraint. dma_fence rules are still very strict and easy to
deadlock, so we'd still want some lockdep checks, but now you'd have
to somehow annotate whether you're a driver with userptr or a driver
without userptr and make sure everyone gets it right.

Also a scheduler which can unschedule and reschedule is mighty more
complex than one which cannot, plus it needs to do that from mmu
notifier callback (not the nicest calling context we have in the
kernel by far). And if you have a single driver which doesn't
unschedule, you're still screwed from an overall subsystem pov.

So lots of code, lots of work, and not that much motivation to roll it
out consistently across the board since there's no incremental payoff.
Plus the thing is, the drivers without userptr are generally the
really simple ones. Much easier to just fix those than to change the
big complex render beasts which want userptr :-)

E.g. the atomic modeset framework we've rolled out in the past few
years and that almost all display drivers now use pulls any (sleeping)
locks and memory allocations out of the critical async work section by
design. Some drivers still managed to butcher it (the annotations
caught some locking bugs already, not just memory allocations in the
wrong spot), but generally easy to fix those.

> > > Do not need to wait on dma_fence in notifiers.
> >
> > Maybe :-) The goal of this series is more to document current rules
> > and make them more consistent. Fixing them if we don't like them might
> > be a follow-up task, but that would likely be a pile more work. First
> > we need to know what the exact shape of the problem even is.
>
> Fair enough

Full disclosure: We are aware that we've designed ourselves into an
impressive corner here, and there's lots of talks going on about
untangling the dma synchronization from the memory management
completely. But

- that needs minimally reliable preempt support for gpu work, and hw
engineers seem to have a hard time with that (or just don't want to do
it). hw page faults would be even better, and even more wishlist than
reality if you expect it to work everywhere.

- it'd be a complete break of the established userspace abi, including
all the cross driver stuff. Which means it's not just some in-kernel
refactoring, we need to rev the entire ecosystem. And that takes a
very long time, and needs serious pressure to get people moving.

E.g. the atomic modeset rework is still not yet rolled out to major
linux desktop environments, and it's over 5 years old, and it's
starting to seriously hurt because lots of performance features
require atomic modeset in userspace to be able to use them. I think
rev'ing the entire memory management support will take as long. Plus I
don't think we can ditch the old ways - even if all the hw currently
using this would be dead (and we can delete the drivers) there's still
the much smaller gpus in SoC that also need to go through the entire
evolution.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
