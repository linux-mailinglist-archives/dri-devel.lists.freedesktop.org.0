Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E87337A30
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 17:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E316E509;
	Thu, 11 Mar 2021 16:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102B96E509
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 16:58:59 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id bx7so3839747edb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 08:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+8xJl+dsqoRA6vG1llwuVakhnEqLGgofzofdB6LTADk=;
 b=K8EhuiNKs0I/rDaY871IcOnNvpwZ2QGzFtBCYSDs8eKVDK/P6YVvqLSWlzeJAAa4/n
 JW/lJNR9o1pvkqYbN21RP23b7u9yxs9JgZg+Zu39Et3OcZmTDOgKJci4TPvQ0YH+olNO
 OytN3HPBWR3a+RwYXdsodQSY2toSbApiISqT7s0VkvAs7j1JCc0n9M+DALvy7GVVZf8F
 OChhutG2901z/rD5slSC+Fr3T885TCUYzVY3z7nK+JVnqHCo7Gy1x9ZxOvBcQSnRUPZh
 yygdkTHfhj54S1G6Wt9fxUYQhOyT+aF6RMTsaaTzdi15AItwcJjHFZl3otmMlxY/xV/l
 dgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+8xJl+dsqoRA6vG1llwuVakhnEqLGgofzofdB6LTADk=;
 b=ZSe19BbZvVXe7+MRoeqQSp/2KvddYAtIybFcMoVDIHf5JIPA1GaCD2nWd+N30fjQZa
 +1ClEi1qOPZtqJR+qG/fFMYCjjb0hqnHRwx6uJoKYsNl4e1NjuNuTJG98oEMifSzKqnY
 DTA51RLOj9S6rOA0cd0Oi/TF9FfZ2fXBxjbCq+Qey5JQU1XmPGKCBkOM62E5ESwhYy0N
 9v8bdYEJ/tzGRrTjZvNPcrRzkrIDW5AUIu8bbRCbz4+pYDECwLAXF5ZiJ1b1kU3nTPBH
 1vvkg7kRhuBND29zrVlcIJvPDjP0Ktarft1IEAl92f3U0uhtavkh/wWGX9SVspA5efSO
 m02Q==
X-Gm-Message-State: AOAM5310wP1dPgE0tYEybbFXVQnnROleFi9JmaJHWAxHZCNxV/a7mx+/
 cIbI0SxRu8V+v2RyYnu+0rYvz7YGjYxN1HEFTk2grg==
X-Google-Smtp-Source: ABdhPJwKgwc5BtjI8h0IGLgdv0cNXz48Ax2ko9MtTu+JkACqk8Do2kl8H37N2OzWArTXKcdLYGH5e/YCGR7S+SvxcZk=
X-Received: by 2002:a05:6402:181a:: with SMTP id
 g26mr9444841edy.225.1615481937576; 
 Thu, 11 Mar 2021 08:58:57 -0800 (PST)
MIME-Version: 1.0
References: <20210311092539.2405596-1-boris.brezillon@collabora.com>
 <86062831-6608-9ae7-c513-e74d3a9c2e33@arm.com>
 <20210311140023.2735aaa5@collabora.com>
In-Reply-To: <20210311140023.2735aaa5@collabora.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 11 Mar 2021 10:58:46 -0600
Message-ID: <CAOFGe94rnS+5FeJ1A8bLxgVDZB4_0Wp2Nx25iCCYGJ=j3KpOCA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] drm/panfrost: Add a new submit ioctl
To: Boris Brezillon <boris.brezillon@collabora.com>
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
Cc: Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Dropping in where I may or may not be wanted to feel free to ignore. : -)

On Thu, Mar 11, 2021 at 7:00 AM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Hi Steven,
>
> On Thu, 11 Mar 2021 12:16:33 +0000
> Steven Price <steven.price@arm.com> wrote:
>
> > On 11/03/2021 09:25, Boris Brezillon wrote:
> > > Hello,
> > >
> > > I've been playing with Vulkan lately and struggled quite a bit to
> > > implement VkQueueSubmit with the submit ioctl we have. There are
> > > several limiting factors that can be worked around if we really have to,
> > > but I think it'd be much easier and future-proof if we introduce a new
> > > ioctl that addresses the current limitations:
> >
> > Hi Boris,
> >
> > I think what you've proposed is quite reasonable, some detailed comments
> > to your points below.
> >
> > >
> > > 1/ There can only be one out_sync, but Vulkan might ask us to signal
> > >     several VkSemaphores and possibly one VkFence too, both of those
> > >     being based on sync objects in my PoC. Making out_sync an array of
> > >     syncobjs to attach the render_done fence to would make that possible.
> > >     The other option would be to collect syncobj updates in userspace
> > >     in a separate thread and propagate those updates to all
> > >     semaphores+fences waiting on those events (I think the v3dv driver
> > >     does something like that, but I didn't spend enough time studying
> > >     the code to be sure, so I might be wrong).
> >
> > You should be able to avoid the separate thread to propagate by having a
> > proxy object in user space that maps between the one outsync of the job
> > and the possibly many Vulkan objects. But I've had this argument before
> > with the DDK... and the upshot of it was that he Vulkan API is
> > unnecessarily complex here and makes this really hard to do in practise.
> > So I agree adding this capability to the kernel is likely the best approach.

This is pretty easy to do from userspace.  Just take the out sync_file
and stuff it into each of the syncobjs using
DRM_IOCTL_SYNCOBJ_FD_TO_HANDLE.  That's all the kernel would be doing
under the hood anyway.  Having it built into your submit ioctl does
have the advantage of fewer round-trips to kernel space, though.

> > > 2/ Queued jobs might be executed out-of-order (unless they have
> > >     explicit/implicit deps between them), and Vulkan asks that the out
> > >     fence be signaled when all jobs are done. Timeline syncobjs are a
> > >     good match for that use case. All we need to do is pass the same
> > >     fence syncobj to all jobs being attached to a single QueueSubmit
> > >     request, but a different point on the timeline. The syncobj
> > >     timeline wait does the rest and guarantees that we've reached a
> > >     given timeline point (IOW, all jobs before that point are done)
> > >     before declaring the fence as signaled.
> > >     One alternative would be to have dummy 'synchronization' jobs that
> > >     don't actually execute anything on the GPU but declare a dependency
> > >     on all other jobs that are part of the QueueSubmit request, and
> > >     signal the out fence (the scheduler would do most of the work for
> > >     us, all we have to do is support NULL job heads and signal the
> > >     fence directly when that happens instead of queueing the job).
> >
> > I have to admit to being rather hazy on the details of timeline
> > syncobjs, but I thought there was a requirement that the timeline moves
> > monotonically. I.e. if you have multiple jobs signalling the same
> > syncobj just with different points, then AFAIU the API requires that the
> > points are triggered in order.
>
> I only started looking at the SYNCOBJ_TIMELINE API a few days ago, so I
> might be wrong, but my understanding is that queuing fences (addition
> of new points in the timeline) should happen in order, but signaling
> can happen in any order. When checking for a signaled fence the
> fence-chain logic starts from the last point (or from an explicit point
> if you use the timeline wait flavor) and goes backward, stopping at the
> first un-signaled node. If I'm correct, that means that fences that
> are part of a chain can be signaled in any order.

You don't even need a timeline for this.  Just have a single syncobj
per-queue and make each submit wait on it and then signal it.
Alternatively, you can just always hang on to the out-fence from the
previous submit and make the next one wait on that.  Timelines are
overkill here, IMO.

> Note that I also considered using a sync file, which has the ability to
> merge fences, but that required 3 extra ioctls for each syncobj to merge
> (for the export/merge/import round trip), and AFAICT, fences stay around
> until the sync file is destroyed, which forces some garbage collection
> if we want to keep the number of active fences low. One nice thing
> about the fence-chain/syncobj-timeline logic is that signaled fences
> are collected automatically when walking the chain.

Yeah, that's the pain when working with sync files.  This is one of
the reasons why our driver takes an arbitrary number of in/out
syncobjs.

> > So I'm not sure that you've actually fixed this point - you either need
> > to force an order (in which case the last job can signal the Vulkan
> > fence)
>
> That options requires adding deps that do not really exist on the last
> jobs, so I'm not sure I like it.
>
> > or you still need a dummy job to do the many-to-one dependency.
>
> Yeah, that's what I've considered doing before realizing timelined
> syncojbs could solve this problem (assuming I got it right :-/).
>
> >
> > Or I may have completely misunderstood timeline syncobjs - definitely a
> > possibility :)
>
> I wouldn't pretend I got it right either :-).
>
> >
> > > 3/ The current implementation lacks information about BO access,
> > >     so we serialize all jobs accessing the same set of BOs, even
> > >     if those jobs might just be reading from them (which can
> > >     happen concurrently). Other drivers pass an access type to the
> > >     list of referenced BOs to address that. Another option would be
> > >     to disable implicit deps (deps based on BOs) and force the driver
> > >     to pass all deps explicitly (interestingly, some drivers have
> > >     both the no-implicit-dep and r/w flags, probably to support
> > >     sub-resource access, so we might want to add that one too).
> > >     I don't see any userspace workaround to that problem, so that one
> > >     alone would justify extending the existing ioctl or adding a new
> > >     one.
> >
> > Yeah - I think we need this. My only comment is that I think the
> > read/write terminology may come back to bite. Better to use 'shared' and
> > 'exclusive' - which better matches the dma_resv_xxx APIs anyway.
> >
> > Also the current code completely ignores PANFROST_BO_REF_READ. So either
> > that should be defined as 0, or even better we support 3 modes:
> >
> >   * Exclusive ('write' access)
> >   * Shared ('read' access)
> >   * No fence - ensures the BO is mapped, but doesn't add any implicit
> > fences.
> >
> > The last may make sense when doing explicit fences and e.g. doing
> > front-buffer rendering with a display driver which does implicit fencing.

This one's really annoying.  TBH, we've still not gotten it right on
Intel, AFAICT.  That is roughly the set of modes you need but you'll
have to watch out for window-system buffers.  RADV and ANV take
slightly different approaches here and they each have their own
problems.  On the balance, I'd look at what RADV is doing rather than
ANV because ANV's results in some over-synchronization every time you
vkWaitForFences on the WSI fence.  I've got a patch floating round
somewhere that adds some new kernel API to make that case a bit better
but it's a snarly mess.  Sorry for being cryptic but it's a 5-page
e-mail if I type out all the annoying details. (-:

--Jason

> Sounds good to me.
>
> >
> > > 4/ There's also the fact that submitting one job at a time adds an
> > >     overhead when QueueSubmit is being passed more than one
> > >     CommandBuffer. That one is less problematic, but if we're adding
> > >     a new ioctl we'd better design it to limit the userspace -> kernel
> > >     transition overhead.
> >
> > I've no objection - but I doubt the performance effect is significant. I
> > was pleased to see the handling of stride which makes the interface
> > extendable. In particular I suspect at some point we're going to want a
> > priority field in some form.
> >
> > > Right now I'm just trying to collect feedback. I don't intend to get
> > > those patches merged until we have a userspace user, but I thought
> > > starting the discussion early would be a good thing.
> > >
> > > Feel free to suggest other approaches.
> >
> > Other than the above I didn't see any obvious issues, and I know the
> > Vulkan API is problematic in terms of synchronisation primitives - so if
> > this makes it easier to implement then it seems like a good idea to me.
>
> Thanks a lot for you review.
>
> Regards,
>
> Boris
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
