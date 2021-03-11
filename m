Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65CD337C2C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 19:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28EE6EAD2;
	Thu, 11 Mar 2021 18:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49E56EAD2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 18:12:00 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id dm8so4218566edb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 10:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=swRUQs1s9y996ApWe46D8m9REBGjx+yO1nN+G+2Ygqw=;
 b=mCgV03EPN15NYYDCQaSjyP759gF0o5euynwoa/QESWrswfUieOocHb32txgW2mOj0D
 tHfJ4Mr5u1GevbxdSuYVLW/DTLqe4ToKkf+NkUOS6JYf/Pr6FtB4IEe0XfXF6AQGu0zh
 7GYbbx+gLyh58mXE7fUgK0akDcp7ai9NcnqncLzqBCjEVPUUs76ZAiF9Duy/JosRLX5g
 8EcnMGrD1iMIaY3px2Z5t4exEl7X1aZqVjbtF1O6QIvl+TZxgPgmBDW8dVAVAeEm5Xt9
 XNFylfGwy74Ws5NS9BQwJe6ipqRcN4EmdeNzBIz9IH8Cac4xT+1Xn2HkD2MRvpkKeDuf
 MY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=swRUQs1s9y996ApWe46D8m9REBGjx+yO1nN+G+2Ygqw=;
 b=PBZ2M2bCNzkl7CSHaE9j8ONLbRH7HyiHuzqKfvu9mavjwn0DCRNHPDXRx53r9QAhRH
 WJY3QsjRaR89YecdcGFgoAFW7jULW+QmYerwrX6Vt4120WNZf3ol52OQk5GT9Szxvnui
 mTmzDvPsYWL0uyB/Mii47xMMw20eDyYEdP95wZAzH38l94C8vTh0xDiwrJm5JjcwpZX9
 8uywWLPMImxgQD9g/y6v6wswZLiRFpLFYdXprjLCLQoCuSUm50o2c+gQYtgGm45wWjwx
 xQMGPH+rPc4ojp13TImijYAff6FZ8E+nnCQdY0qWrwCIPPYhosjgy5X+wCm6HFdXN2hJ
 KjtQ==
X-Gm-Message-State: AOAM530YeL5fsFC8KmYFL4J5yMEuXcSgaI+LJ7F4sCOK0wXLgKoG0WJF
 x5m0esxnaZYtcbHc2Sh/AH745LZZrtWUHRxrw9KB5A==
X-Google-Smtp-Source: ABdhPJzdpKmnLI1QVAWnVw35xUp5eeDWJa+sAO5xTukOOOPaPe3d7lQW6qHUcpQqwURwI9cvpxg6A6qYBFac4wJgn/U=
X-Received: by 2002:a05:6402:c8:: with SMTP id i8mr3884957edu.57.1615486319279; 
 Thu, 11 Mar 2021 10:11:59 -0800 (PST)
MIME-Version: 1.0
References: <20210311092539.2405596-1-boris.brezillon@collabora.com>
 <86062831-6608-9ae7-c513-e74d3a9c2e33@arm.com>
 <20210311140023.2735aaa5@collabora.com>
 <CAOFGe94rnS+5FeJ1A8bLxgVDZB4_0Wp2Nx25iCCYGJ=j3KpOCA@mail.gmail.com>
 <20210311182458.0e0140a1@collabora.com>
In-Reply-To: <20210311182458.0e0140a1@collabora.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 11 Mar 2021 12:11:48 -0600
Message-ID: <CAOFGe95d-LQ_rNwncup-G5oj14uCnNrnHr=r1b5jLYnXfMSTiA@mail.gmail.com>
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

On Thu, Mar 11, 2021 at 11:25 AM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Hi Jason,
>
> On Thu, 11 Mar 2021 10:58:46 -0600
> Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> > Hi all,
> >
> > Dropping in where I may or may not be wanted to feel free to ignore. : -)
>
> I'm glad you decided to chime in. :-)
>
>
> > > > > 2/ Queued jobs might be executed out-of-order (unless they have
> > > > >     explicit/implicit deps between them), and Vulkan asks that the out
> > > > >     fence be signaled when all jobs are done. Timeline syncobjs are a
> > > > >     good match for that use case. All we need to do is pass the same
> > > > >     fence syncobj to all jobs being attached to a single QueueSubmit
> > > > >     request, but a different point on the timeline. The syncobj
> > > > >     timeline wait does the rest and guarantees that we've reached a
> > > > >     given timeline point (IOW, all jobs before that point are done)
> > > > >     before declaring the fence as signaled.
> > > > >     One alternative would be to have dummy 'synchronization' jobs that
> > > > >     don't actually execute anything on the GPU but declare a dependency
> > > > >     on all other jobs that are part of the QueueSubmit request, and
> > > > >     signal the out fence (the scheduler would do most of the work for
> > > > >     us, all we have to do is support NULL job heads and signal the
> > > > >     fence directly when that happens instead of queueing the job).
> > > >
> > > > I have to admit to being rather hazy on the details of timeline
> > > > syncobjs, but I thought there was a requirement that the timeline moves
> > > > monotonically. I.e. if you have multiple jobs signalling the same
> > > > syncobj just with different points, then AFAIU the API requires that the
> > > > points are triggered in order.
> > >
> > > I only started looking at the SYNCOBJ_TIMELINE API a few days ago, so I
> > > might be wrong, but my understanding is that queuing fences (addition
> > > of new points in the timeline) should happen in order, but signaling
> > > can happen in any order. When checking for a signaled fence the
> > > fence-chain logic starts from the last point (or from an explicit point
> > > if you use the timeline wait flavor) and goes backward, stopping at the
> > > first un-signaled node. If I'm correct, that means that fences that
> > > are part of a chain can be signaled in any order.
> >
> > You don't even need a timeline for this.  Just have a single syncobj
> > per-queue and make each submit wait on it and then signal it.
> > Alternatively, you can just always hang on to the out-fence from the
> > previous submit and make the next one wait on that.
>
> That's what I have right now, but it forces the serialization of all
> jobs that are pushed during a submit (and there can be more than one
> per command buffer on panfrost :-/). Maybe I'm wrong, but I thought it'd
> be better to not force this serialization if we can avoid it.

I'm not familiar with panfrost's needs and I don't work on a tiler and
I know there are different issues there.  But...

The Vulkan spec requires that everything that all the submits that
happen on a given vkQueue happen in-order.  Search the spec for
"Submission order" for more details.

So, generally speaking, there are some in-order requirements there.
Again, not having a lot of tiler experience, I'm not the one to weigh
in.

> > Timelines are overkill here, IMO.
>
> Mind developing why you think this is overkill? After looking at the
> kernel implementation I thought using timeline syncobjs would be
> pretty cheap compared to the other options I considered.

If you use a regular syncobj, every time you wait on it it inserts a
dependency between the current submit and the last thing to signal it
on the CPU timeline.  The internal dma_fences will hang around
as-needed to ensure those dependencies.  If you use a timeline, you
have to also track a uint64_t to reference the current time point.
This may work if you need to sync a bunch of in-flight stuff at one
go, that may work but if you're trying to serialize, it's just extra
tracking for no point.  Again, maybe there's something I'm missing and
you don't actually want to serialize.

--Jason


> >
> > > Note that I also considered using a sync file, which has the ability to
> > > merge fences, but that required 3 extra ioctls for each syncobj to merge
> > > (for the export/merge/import round trip), and AFAICT, fences stay around
> > > until the sync file is destroyed, which forces some garbage collection
> > > if we want to keep the number of active fences low. One nice thing
> > > about the fence-chain/syncobj-timeline logic is that signaled fences
> > > are collected automatically when walking the chain.
> >
> > Yeah, that's the pain when working with sync files.  This is one of
> > the reasons why our driver takes an arbitrary number of in/out
> > syncobjs.
> >
> > > > So I'm not sure that you've actually fixed this point - you either need
> > > > to force an order (in which case the last job can signal the Vulkan
> > > > fence)
> > >
> > > That options requires adding deps that do not really exist on the last
> > > jobs, so I'm not sure I like it.
> > >
> > > > or you still need a dummy job to do the many-to-one dependency.
> > >
> > > Yeah, that's what I've considered doing before realizing timelined
> > > syncojbs could solve this problem (assuming I got it right :-/).
> > >
> > > >
> > > > Or I may have completely misunderstood timeline syncobjs - definitely a
> > > > possibility :)
> > >
> > > I wouldn't pretend I got it right either :-).
> > >
> > > >
> > > > > 3/ The current implementation lacks information about BO access,
> > > > >     so we serialize all jobs accessing the same set of BOs, even
> > > > >     if those jobs might just be reading from them (which can
> > > > >     happen concurrently). Other drivers pass an access type to the
> > > > >     list of referenced BOs to address that. Another option would be
> > > > >     to disable implicit deps (deps based on BOs) and force the driver
> > > > >     to pass all deps explicitly (interestingly, some drivers have
> > > > >     both the no-implicit-dep and r/w flags, probably to support
> > > > >     sub-resource access, so we might want to add that one too).
> > > > >     I don't see any userspace workaround to that problem, so that one
> > > > >     alone would justify extending the existing ioctl or adding a new
> > > > >     one.
> > > >
> > > > Yeah - I think we need this. My only comment is that I think the
> > > > read/write terminology may come back to bite. Better to use 'shared' and
> > > > 'exclusive' - which better matches the dma_resv_xxx APIs anyway.
> > > >
> > > > Also the current code completely ignores PANFROST_BO_REF_READ. So either
> > > > that should be defined as 0, or even better we support 3 modes:
> > > >
> > > >   * Exclusive ('write' access)
> > > >   * Shared ('read' access)
> > > >   * No fence - ensures the BO is mapped, but doesn't add any implicit
> > > > fences.
> > > >
> > > > The last may make sense when doing explicit fences and e.g. doing
> > > > front-buffer rendering with a display driver which does implicit fencing.
> >
> > This one's really annoying.  TBH, we've still not gotten it right on
> > Intel, AFAICT.  That is roughly the set of modes you need but you'll
> > have to watch out for window-system buffers.  RADV and ANV take
> > slightly different approaches here and they each have their own
> > problems.  On the balance, I'd look at what RADV is doing rather than
> > ANV because ANV's results in some over-synchronization every time you
> > vkWaitForFences on the WSI fence.  I've got a patch floating round
> > somewhere that adds some new kernel API to make that case a bit better
> > but it's a snarly mess.  Sorry for being cryptic but it's a 5-page
> > e-mail if I type out all the annoying details. (-:
>
> Ok, I'll have a look at the RADV driver.
>
> Thanks for your feedback.
>
> Boris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
