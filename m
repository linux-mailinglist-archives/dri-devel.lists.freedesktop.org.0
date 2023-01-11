Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1C9666691
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 23:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBBD10E835;
	Wed, 11 Jan 2023 22:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0422610E835
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 22:56:58 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id s5so24512566edc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 14:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EUSQyK6K0tOvqG4dhGomrya+Yea5E157Mwr6jCOjayo=;
 b=e3jR1Yy25Y/O0PvXYCM5El6T1FEyRUtmy7htj9t65nQPcjyVGxV9ugMculUfryr2bw
 mmRsbjPf+YimyZwKyElEtPg+AzuMsiAEZ5eWz3SPSaPZCWcNCYtn61F5gsB30np7ZpQX
 3/CVCgc6SW2OScgAkGM4o7s4ZXI9CTn4uBDGASZUxtfvf6wpZNbhAQ/hTsAwQYZm6KmA
 Fhu0ZmzOBlcrMqUu8+yWHFaJdxp6XOxx4+aYvnM0liyQjZGebs3W79xJqpnLgzjUsgRp
 LU/Y/SkvPB67IeYr0nkutKxVfFCKnPmX5DEdyXsZ6anZ35uogm54FSPlcopARyGPmvHR
 wwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EUSQyK6K0tOvqG4dhGomrya+Yea5E157Mwr6jCOjayo=;
 b=0UOghlz5c/nFLLHbQ9Vc3FThti5efXWCZgkpWWyTbhfplKGeqjfATYoFxMuvo3WwGo
 kh66pTrVAwuBp3sXqqmXgaVD479FnYo56p+MUTfhcBouTtdXQrjrjDfFCbupIWLG1Joi
 PdeSt929ZkjPo1ZvSr159wgYZbgyNkHb7GHToZb1dtOT9LzhWJmWZ/MHrC1EaU1/Xzsy
 O90FkWahJmHL0c5dCh7DZGioJmAIvRCNqYmO0+Dm2VDrHTNsNwtI8AF6lFpgMqvTtf3l
 1JGRVa0wbTNS5xhEqmCVNOGSawh4nF23U2DSsPmJJ5+bfjOUw9yhCVvvR2S+SgOcP14t
 KtMw==
X-Gm-Message-State: AFqh2kpSrM3w7Joqef2FFyUzimuZP/cQqtrpnUk3CgJwheFeq45+brTN
 /r57LHCHu4OJyhPGp4zh7vJieb0YDD1tXvM1TW4TrTsWkL8ySA==
X-Google-Smtp-Source: AMrXdXtqg9ecX5uvNzrEgtZBAg1kgZJmHp+d4xKkkNjBSoySXzZNxGMQlahbUkob/7wQElGp6HhD4w4N0V0X6ka9dMM=
X-Received: by 2002:aa7:d8d6:0:b0:493:f6b5:36be with SMTP id
 k22-20020aa7d8d6000000b00493f6b536bemr2895155eds.382.1673477816968; Wed, 11
 Jan 2023 14:56:56 -0800 (PST)
MIME-Version: 1.0
References: <20230102083019.24b99647@collabora.com>
 <7d6df13c-6c2e-d713-edc8-128d6e19f187@linux.intel.com>
 <Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com>
 <Y7i0J3uQ+izOJcEb@DUT025-TGLU.fm.intel.com>
 <e8c301cb-c7d4-ed54-f3ab-61a5fcc7f940@linux.intel.com>
 <CAOFGe96yeF4SWxvHC5pxyggf=655q7+ZrFS+Zab42F-RE7UK1w@mail.gmail.com>
 <e6512993-5247-a577-abf4-97cdb21358a0@linux.intel.com>
 <CAOFGe957uYdTFccQp36QRJRDkWQZDCB0ztMNDH0=SSf-RTgzLw@mail.gmail.com>
 <705a0b3c-2fe5-0393-0fda-511f288007c7@linux.intel.com>
 <CAOFGe96KQUmy20_h3OmmXGVmuGkEm8iDhnLzgBjM5dnPApqYvQ@mail.gmail.com>
 <Y7841j8PZ1T9MPEl@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Y7841j8PZ1T9MPEl@DUT025-TGLU.fm.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 11 Jan 2023 16:56:44 -0600
Message-ID: <CAOFGe970mwYgt10RdGURiMYc1x+MFy-uYOBT++Mygz4tu1XN4A@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler to
 use a work queue rather than kthread
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: multipart/alternative; boundary="000000000000d2041405f204ea6e"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000d2041405f204ea6e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2023 at 4:32 PM Matthew Brost <matthew.brost@intel.com>
wrote:

> On Wed, Jan 11, 2023 at 04:18:01PM -0600, Jason Ekstrand wrote:
> > On Wed, Jan 11, 2023 at 2:50 AM Tvrtko Ursulin <
> > tvrtko.ursulin@linux.intel.com> wrote:
> >
> > >
> > > On 10/01/2023 14:08, Jason Ekstrand wrote:
> > > > On Tue, Jan 10, 2023 at 5:28 AM Tvrtko Ursulin
> > > > <tvrtko.ursulin@linux.intel.com <mailto:
> tvrtko.ursulin@linux.intel.com>>
> > >
> > > > wrote:
> > > >
> > > >
> > > >
> > > >     On 09/01/2023 17:27, Jason Ekstrand wrote:
> > > >
> > > >     [snip]
> > > >
> > > >      >      >>> AFAICT it proposes to have 1:1 between *userspace*
> > > created
> > > >      >     contexts (per
> > > >      >      >>> context _and_ engine) and drm_sched. I am not sure
> > > avoiding
> > > >      >     invasive changes
> > > >      >      >>> to the shared code is in the spirit of the overall
> idea
> > > >     and instead
> > > >      >      >>> opportunity should be used to look at way to
> > > >     refactor/improve
> > > >      >     drm_sched.
> > > >      >
> > > >      >
> > > >      > Maybe?  I'm not convinced that what Xe is doing is an abuse =
at
> > > >     all or
> > > >      > really needs to drive a re-factor.  (More on that later.)
> > > >     There's only
> > > >      > one real issue which is that it fires off potentially a lot =
of
> > > >     kthreads.
> > > >      > Even that's not that bad given that kthreads are pretty ligh=
t
> and
> > > >     you're
> > > >      > not likely to have more kthreads than userspace threads whic=
h
> are
> > > >     much
> > > >      > heavier.  Not ideal, but not the end of the world either.
> > > >     Definitely
> > > >      > something we can/should optimize but if we went through with
> Xe
> > > >     without
> > > >      > this patch, it would probably be mostly ok.
> > > >      >
> > > >      >      >> Yes, it is 1:1 *userspace* engines and drm_sched.
> > > >      >      >>
> > > >      >      >> I'm not really prepared to make large changes to DRM
> > > >     scheduler
> > > >      >     at the
> > > >      >      >> moment for Xe as they are not really required nor do=
es
> > > Boris
> > > >      >     seem they
> > > >      >      >> will be required for his work either. I am intereste=
d
> to
> > > see
> > > >      >     what Boris
> > > >      >      >> comes up with.
> > > >      >      >>
> > > >      >      >>> Even on the low level, the idea to replace drm_sche=
d
> > > threads
> > > >      >     with workers
> > > >      >      >>> has a few problems.
> > > >      >      >>>
> > > >      >      >>> To start with, the pattern of:
> > > >      >      >>>
> > > >      >      >>>    while (not_stopped) {
> > > >      >      >>>     keep picking jobs
> > > >      >      >>>    }
> > > >      >      >>>
> > > >      >      >>> Feels fundamentally in disagreement with workers
> (while
> > > >      >     obviously fits
> > > >      >      >>> perfectly with the current kthread design).
> > > >      >      >>
> > > >      >      >> The while loop breaks and worker exists if no jobs a=
re
> > > ready.
> > > >      >
> > > >      >
> > > >      > I'm not very familiar with workqueues. What are you saying
> would
> > > fit
> > > >      > better? One scheduling job per work item rather than one big
> work
> > > >     item
> > > >      > which handles all available jobs?
> > > >
> > > >     Yes and no, it indeed IMO does not fit to have a work item whic=
h
> is
> > > >     potentially unbound in runtime. But it is a bit moot conceptual
> > > >     mismatch
> > > >     because it is a worst case / theoretical, and I think due more
> > > >     fundamental concerns.
> > > >
> > > >     If we have to go back to the low level side of things, I've
> picked
> > > this
> > > >     random spot to consolidate what I have already mentioned and
> perhaps
> > > >     expand.
> > > >
> > > >     To start with, let me pull out some thoughts from workqueue.rst=
:
> > > >
> > > >     """
> > > >     Generally, work items are not expected to hog a CPU and consume
> many
> > > >     cycles. That means maintaining just enough concurrency to preve=
nt
> > > work
> > > >     processing from stalling should be optimal.
> > > >     """
> > > >
> > > >     For unbound queues:
> > > >     """
> > > >     The responsibility of regulating concurrency level is on the
> users.
> > > >     """
> > > >
> > > >     Given the unbound queues will be spawned on demand to service a=
ll
> > > >     queued
> > > >     work items (more interesting when mixing up with the
> > > >     system_unbound_wq),
> > > >     in the proposed design the number of instantiated worker thread=
s
> does
> > > >     not correspond to the number of user threads (as you have
> elsewhere
> > > >     stated), but pessimistically to the number of active user
> contexts.
> > > >
> > > >
> > > > Those are pretty much the same in practice.  Rather, user threads i=
s
> > > > typically an upper bound on the number of contexts.  Yes, a single
> user
> > > > thread could have a bunch of contexts but basically nothing does th=
at
> > > > except IGT.  In real-world usage, it's at most one context per user
> > > thread.
> > >
> > > Typically is the key here. But I am not sure it is good enough.
> Consider
> > > this example - Intel Flex 170:
> > >
> > >   * Delivers up to 36 streams 1080p60 transcode throughput per card.
> > >   * When scaled to 10 cards in a 4U server configuration, it can
> support
> > > up to 360 streams of HEVC/HEVC 1080p60 transcode throughput.
> > >
> >
> > I had a feeling it was going to be media.... =F0=9F=98=85
> >
>
> Yea wondering the media UMD can be rewritten to use less xe_engines, it
> is massive rewrite for VM bind + no implicit dependencies so let's just
> pile on some more work?
>

It could probably use fewer than it does today.  It currently creates and
throws away contexts like crazy, or did last I looked at it.  However, the
nature of media encode is that it often spreads across two or three
different types of engines.  There's not much you can do to change that.


> >
> > > One transcode stream from my experience typically is 3-4 GPU contexts
> > > (buffer travels from vcs -> rcs -> vcs, maybe vecs) used from a singl=
e
> > > CPU thread. 4 contexts * 36 streams =3D 144 active contexts. Multiply=
 by
> > > 60fps =3D 8640 jobs submitted and completed per second.
> > >
> > > 144 active contexts in the proposed scheme means possibly means 144
> > > kernel worker threads spawned (driven by 36 transcode CPU threads). (=
I
> > > don't think the pools would scale down given all are constantly pinge=
d
> > > at 60fps.)
> > >
> > > And then each of 144 threads goes to grab the single GuC CT mutex.
> First
> > > threads are being made schedulable, then put to sleep as mutex
> > > contention is hit, then woken again as mutexes are getting released,
> > > rinse, repeat.
> > >
> >
> > Why is every submission grabbing the GuC CT mutex?  I've not read the G=
uC
> > back-end yet but I was under the impression that most run_job() would b=
e
> > just shoving another packet into a ring buffer.  If we have to send the
> GuC
> > a message on the control ring every single time we submit a job, that's
> > pretty horrible.
> >
>
> Run job writes the ring buffer and moves the tail as the first step (no
> lock required). Next it needs to tell the GuC the xe_engine LRC tail has
> moved, this is done from a single Host to GuC channel which is circular
> buffer, the writing of the channel protected by the mutex. There are
> little more nuances too but in practice there is always space in the
> channel so the time mutex needs to held is really, really small
> (check cached credits, write 3 dwords in payload, write 1 dword to move
> tail). I also believe mutexes in Linux are hybrid where they spin for a
> little bit before sleeping and certainly if there is space in the
> channel we shouldn't sleep mutex contention.
>

Ok, that makes sense.  It's maybe a bit clunky and it'd be nice if we had
some way to batch things up a bit so we only have to poke the GuC channel
once for every batch of things rather than once per job.  That's maybe
something we can look into as a future improvement; not fundamental.

Generally, though, it sounds like contention could be a real problem if we
end up ping-ponging that lock between cores.  It's going to depend on how
much work it takes to get the next ready thing vs. the cost of that
atomic.  But, also, anything we do is going to potentially run into
contention problems.  *shrug*  If we were going to go for
one-per-HW-engine, we may as well go one-per-device and then we wouldn't
need the lock.  Off the top of my head, that doesn't sound great either but
IDK.


> As far as this being horrible, well didn't design the GuC and this how
> it is implemented for KMD based submission. We also have 256 doorbells
> so we wouldn't need a lock but I think are other issues with that design
> too which need to be worked out in the Xe2 / Xe3 timeframe.
>

Yeah, not blaming you.  Just surprised, that's all.  How does it work for
userspace submission?  What would it look like if the kernel emulated
userspace submission?  Is that even possible?

What are these doorbell things?  How do they play into it?


> Also if you see my follow up response Xe is ~33k execs per second with
> the current implementation on a 8 core (or maybe 8 thread) TGL which
> seems to fine to me.
>

33k exec/sec is about 500/frame which should be fine.  500 is a lot for a
single frame.  I typically tell game devs to shoot for dozens per frame.
The important thing is that it stays low even with hundreds of memory
objects bound.  (Xe should be just fine there.)

--Jason



> Matt
>
> > --Jason
> >
> >
> > (And yes this backend contention is there regardless of 1:1:1, it would
> > > require a different re-design to solve that. But it is just a questio=
n
> > > whether there are 144 contending threads, or just 6 with the thread p=
er
> > > engine class scheme.)
> > >
> > > Then multiply all by 10 for a 4U server use case and you get 1440
> worker
> > > kthreads, yes 10 more CT locks, but contending on how many CPU cores?
> > > Just so they can grab a timeslice and maybe content on a mutex as the
> > > next step.
> > >
> > > This example is where it would hurt on large systems. Imagine only an
> > > even wider media transcode card...
> > >
> > > Second example is only a single engine class used (3d desktop?) but
> with
> > > a bunch of not-runnable jobs queued and waiting on a fence to signal.
> > > Implicit or explicit dependencies doesn't matter. Then the fence
> signals
> > > and call backs run. N work items get scheduled, but they all submit t=
o
> > > the same HW engine. So we end up with:
> > >
> > >          /-- wi1 --\
> > >         / ..     .. \
> > >   cb --+---  wi.. ---+-- rq1 -- .. -- rqN
> > >         \ ..    ..  /
> > >          \-- wiN --/
> > >
> > >
> > > All that we have achieved is waking up N CPUs to contend on the same
> > > lock and effectively insert the job into the same single HW queue. I
> > > don't see any positives there.
> > >
> > > This example I think can particularly hurt small / low power devices
> > > because of needless waking up of many cores for no benefit. Granted, =
I
> > > don't have a good feel on how common this pattern is in practice.
> > >
> > > >
> > > >     That
> > > >     is the number which drives the maximum number of not-runnable
> jobs
> > > that
> > > >     can become runnable at once, and hence spawn that many work
> items,
> > > and
> > > >     in turn unbound worker threads.
> > > >
> > > >     Several problems there.
> > > >
> > > >     It is fundamentally pointless to have potentially that many mor=
e
> > > >     threads
> > > >     than the number of CPU cores - it simply creates a scheduling
> storm.
> > > >
> > > >     Unbound workers have no CPU / cache locality either and no
> connection
> > > >     with the CPU scheduler to optimize scheduling patterns. This ma=
y
> > > matter
> > > >     either on large systems or on small ones. Whereas the current
> design
> > > >     allows for scheduler to notice userspace CPU thread keeps wakin=
g
> up
> > > the
> > > >     same drm scheduler kernel thread, and so it can keep them on th=
e
> same
> > > >     CPU, the unbound workers lose that ability and so 2nd CPU might
> be
> > > >     getting woken up from low sleep for every submission.
> > > >
> > > >     Hence, apart from being a bit of a impedance mismatch, the
> proposal
> > > has
> > > >     the potential to change performance and power patterns and both
> large
> > > >     and small machines.
> > > >
> > > >
> > > > Ok, thanks for explaining the issue you're seeing in more detail.
> Yes,
> > > > deferred kwork does appear to mismatch somewhat with what the
> scheduler
> > > > needs or at least how it's worked in the past.  How much impact wil=
l
> > > > that mismatch have?  Unclear.
> > > >
> > > >      >      >>> Secondly, it probably demands separate workers (not
> > > >     optional),
> > > >      >     otherwise
> > > >      >      >>> behaviour of shared workqueues has either the
> potential
> > > to
> > > >      >     explode number
> > > >      >      >>> kernel threads anyway, or add latency.
> > > >      >      >>>
> > > >      >      >>
> > > >      >      >> Right now the system_unbound_wq is used which does
> have a
> > > >     limit
> > > >      >     on the
> > > >      >      >> number of threads, right? I do have a FIXME to allow=
 a
> > > >     worker to be
> > > >      >      >> passed in similar to TDR.
> > > >      >      >>
> > > >      >      >> WRT to latency, the 1:1 ratio could actually have
> lower
> > > >     latency
> > > >      >     as 2 GPU
> > > >      >      >> schedulers can be pushing jobs into the backend /
> > > cleaning up
> > > >      >     jobs in
> > > >      >      >> parallel.
> > > >      >      >>
> > > >      >      >
> > > >      >      > Thought of one more point here where why in Xe we
> > > >     absolutely want
> > > >      >     a 1 to
> > > >      >      > 1 ratio between entity and scheduler - the way we
> implement
> > > >      >     timeslicing
> > > >      >      > for preempt fences.
> > > >      >      >
> > > >      >      > Let me try to explain.
> > > >      >      >
> > > >      >      > Preempt fences are implemented via the generic
> messaging
> > > >      >     interface [1]
> > > >      >      > with suspend / resume messages. If a suspend messages
> is
> > > >     received to
> > > >      >      > soon after calling resume (this is per entity) we
> simply
> > > >     sleep in the
> > > >      >      > suspend call thus giving the entity a timeslice. This
> > > >     completely
> > > >      >     falls
> > > >      >      > apart with a many to 1 relationship as now a entity
> > > >     waiting for a
> > > >      >      > timeslice blocks the other entities. Could we work
> aroudn
> > > >     this,
> > > >      >     sure but
> > > >      >      > just another bunch of code we'd have to add in Xe.
> Being to
> > > >      >     freely sleep
> > > >      >      > in backend without affecting other entities is really=
,
> > > really
> > > >      >     nice IMO
> > > >      >      > and I bet Xe isn't the only driver that is going to
> feel
> > > >     this way.
> > > >      >      >
> > > >      >      > Last thing I'll say regardless of how anyone feels
> about
> > > >     Xe using
> > > >      >     a 1 to
> > > >      >      > 1 relationship this patch IMO makes sense as I hope w=
e
> can
> > > all
> > > >      >     agree a
> > > >      >      > workqueue scales better than kthreads.
> > > >      >
> > > >      >     I don't know for sure what will scale better and for wha=
t
> use
> > > >     case,
> > > >      >     combination of CPU cores vs number of GPU engines to kee=
p
> > > >     busy vs other
> > > >      >     system activity. But I wager someone is bound to ask for
> some
> > > >      >     numbers to
> > > >      >     make sure proposal is not negatively affecting any other
> > > drivers.
> > > >      >
> > > >      >
> > > >      > Then let them ask.  Waving your hands vaguely in the
> direction of
> > > >     the
> > > >      > rest of DRM and saying "Uh, someone (not me) might object" i=
s
> > > >     profoundly
> > > >      > unhelpful.  Sure, someone might.  That's why it's on
> dri-devel.
> > > >     If you
> > > >      > think there's someone in particular who might have a useful
> > > >     opinion on
> > > >      > this, throw them in the CC so they don't miss the e-mail
> thread.
> > > >      >
> > > >      > Or are you asking for numbers?  If so, what numbers are you
> > > >     asking for?
> > > >
> > > >     It was a heads up to the Xe team in case people weren't
> appreciating
> > > >     how
> > > >     the proposed change has the potential influence power and
> performance
> > > >     across the board. And nothing in the follow up discussion made =
me
> > > think
> > > >     it was considered so I don't think it was redundant to raise it=
.
> > > >
> > > >     In my experience it is typical that such core changes come with
> some
> > > >     numbers. Which is in case of drm scheduler is tricky and probab=
ly
> > > >     requires explicitly asking everyone to test (rather than count =
on
> > > >     "don't
> > > >     miss the email thread"). Real products can fail to ship due ten
> mW
> > > here
> > > >     or there. Like suddenly an extra core prevented from getting in=
to
> > > deep
> > > >     sleep.
> > > >
> > > >     If that was "profoundly unhelpful" so be it.
> > > >
> > > >
> > > > With your above explanation, it makes more sense what you're asking=
.
> > > > It's still not something Matt is likely to be able to provide on hi=
s
> > > > own.  We need to tag some other folks and ask them to test it out.
> We
> > > > could play around a bit with it on Xe but it's not exactly producti=
on
> > > > grade yet and is going to hit this differently from most.  Likely
> > > > candidates are probably AMD and Freedreno.
> > >
> > > Whoever is setup to check out power and performance would be good to
> > > give it a spin, yes.
> > >
> > > PS. I don't think I was asking Matt to test with other devices. To
> start
> > > with I think Xe is a team effort. I was asking for more background on
> > > the design decision since patch 4/20 does not say anything on that
> > > angle, nor later in the thread it was IMO sufficiently addressed.
> > >
> > > >      > Also, If we're talking about a design that might paint us
> into an
> > > >      > Intel-HW-specific hole, that would be one thing.  But we're
> not.
> > > >     We're
> > > >      > talking about switching which kernel threading/task mechanis=
m
> to
> > > >     use for
> > > >      > what's really a very generic problem.  The core Xe design
> works
> > > >     without
> > > >      > this patch (just with more kthreads).  If we land this patch
> or
> > > >      > something like it and get it wrong and it causes a performan=
ce
> > > >     problem
> > > >      > for someone down the line, we can revisit it.
> > > >
> > > >     For some definition of "it works" - I really wouldn't suggest
> > > >     shipping a
> > > >     kthread per user context at any point.
> > > >
> > > >
> > > > You have yet to elaborate on why. What resources is it consuming
> that's
> > > > going to be a problem? Are you anticipating CPU affinity problems? =
Or
> > > > does it just seem wasteful?
> > >
> > > Well I don't know, commit message says the approach does not scale. :=
)
> > >
> > > > I think I largely agree that it's probably unnecessary/wasteful but
> > > > reducing the number of kthreads seems like a tractable problem to
> solve
> > > > regardless of where we put the gpu_scheduler object.  Is this the
> right
> > > > solution?  Maybe not.  It was also proposed at one point that we
> could
> > > > split the scheduler into two pieces: A scheduler which owns the
> kthread,
> > > > and a back-end which targets some HW ring thing where you can have
> > > > multiple back-ends per scheduler.  That's certainly more invasive
> from a
> > > > DRM scheduler internal API PoV but would solve the kthread problem
> in a
> > > > way that's more similar to what we have now.
> > > >
> > > >      >     In any case that's a low level question caused by the hi=
gh
> > > >     level design
> > > >      >     decision. So I'd think first focus on the high level -
> which
> > > >     is the 1:1
> > > >      >     mapping of entity to scheduler instance proposal.
> > > >      >
> > > >      >     Fundamentally it will be up to the DRM maintainers and t=
he
> > > >     community to
> > > >      >     bless your approach. And it is important to stress 1:1 i=
s
> > > about
> > > >      >     userspace contexts, so I believe unlike any other curren=
t
> > > >     scheduler
> > > >      >     user. And also important to stress this effectively does
> not
> > > >     make Xe
> > > >      >     _really_ use the scheduler that much.
> > > >      >
> > > >      >
> > > >      > I don't think this makes Xe nearly as much of a one-off as y=
ou
> > > >     think it
> > > >      > does.  I've already told the Asahi team working on Apple M1/=
2
> > > >     hardware
> > > >      > to do it this way and it seems to be a pretty good mapping f=
or
> > > >     them. I
> > > >      > believe this is roughly the plan for nouveau as well.  It's
> not
> > > >     the way
> > > >      > it currently works for anyone because most other groups aren=
't
> > > >     doing FW
> > > >      > scheduling yet.  In the world of FW scheduling and hardware
> > > >     designed to
> > > >      > support userspace direct-to-FW submit, I think the design
> makes
> > > >     perfect
> > > >      > sense (see below) and I expect we'll see more drivers move i=
n
> this
> > > >      > direction as those drivers evolve.  (AMD is doing some
> customish
> > > >     thing
> > > >      > for how with gpu_scheduler on the front-end somehow. I've no=
t
> dug
> > > >     into
> > > >      > those details.)
> > > >      >
> > > >      >     I can only offer my opinion, which is that the two optio=
ns
> > > >     mentioned in
> > > >      >     this thread (either improve drm scheduler to cope with
> what is
> > > >      >     required,
> > > >      >     or split up the code so you can use just the parts of
> > > >     drm_sched which
> > > >      >     you want - which is frontend dependency tracking)
> shouldn't
> > > be so
> > > >      >     readily dismissed, given how I think the idea was for th=
e
> new
> > > >     driver to
> > > >      >     work less in a silo and more in the community (not do
> kludges
> > > to
> > > >      >     workaround stuff because it is thought to be too hard to
> > > >     improve common
> > > >      >     code), but fundamentally, "goto previous paragraph" for
> what
> > > I am
> > > >      >     concerned.
> > > >      >
> > > >      >
> > > >      > Meta comment:  It appears as if you're falling into the
> standard
> > > >     i915
> > > >      > team trap of having an internal discussion about what the
> > > community
> > > >      > discussion might look like instead of actually having the
> > > community
> > > >      > discussion.  If you are seriously concerned about interactio=
ns
> > > with
> > > >      > other drivers or whether or setting common direction, the
> right
> > > >     way to
> > > >      > do that is to break a patch or two out into a separate RFC
> series
> > > >     and
> > > >      > tag a handful of driver maintainers.  Trying to predict the
> > > >     questions
> > > >      > other people might ask is pointless. Cc them and asking for
> their
> > > >     input
> > > >      > instead.
> > > >
> > > >     I don't follow you here. It's not an internal discussion - I am
> > > raising
> > > >     my concerns on the design publicly. I am supposed to write a
> patch to
> > > >     show something, but am allowed to comment on a RFC series?
> > > >
> > > >
> > > > I may have misread your tone a bit.  It felt a bit like too many
> > > > discussions I've had in the past where people are trying to predict
> what
> > > > others will say instead of just asking them.  Reading it again, I w=
as
> > > > probably jumping to conclusions a bit.  Sorry about that.
> > >
> > > Okay no problem, thanks. In any case we don't have to keep discussing
> > > it, since I wrote one or two emails ago it is fundamentally on the
> > > maintainers and community to ack the approach. I only felt like RFC d=
id
> > > not explain the potential downsides sufficiently so I wanted to probe
> > > that area a bit.
> > >
> > > >     It is "drm/sched: Convert drm scheduler to use a work queue
> rather
> > > than
> > > >     kthread" which should have Cc-ed _everyone_ who use drm
> scheduler.
> > > >
> > > >
> > > > Yeah, it probably should have.  I think that's mostly what I've bee=
n
> > > > trying to say.
> > > >
> > > >      >
> > > >      >     Regards,
> > > >      >
> > > >      >     Tvrtko
> > > >      >
> > > >      >     P.S. And as a related side note, there are more areas
> where
> > > >     drm_sched
> > > >      >     could be improved, like for instance priority handling.
> > > >      >     Take a look at msm_submitqueue_create /
> > > >     msm_gpu_convert_priority /
> > > >      >     get_sched_entity to see how msm works around the drm_sch=
ed
> > > >     hardcoded
> > > >      >     limit of available priority levels, in order to avoid
> having
> > > >     to leave a
> > > >      >     hw capability unused. I suspect msm would be happier if
> they
> > > >     could have
> > > >      >     all priority levels equal in terms of whether they apply
> only
> > > >     at the
> > > >      >     frontend level or completely throughout the pipeline.
> > > >      >
> > > >      >      > [1]
> > > >      >
> > > >
> https://patchwork.freedesktop.org/patch/515857/?series=3D112189&rev=3D1
> > > >     <
> https://patchwork.freedesktop.org/patch/515857/?series=3D112189&rev=3D1
> > > >
> > > >      >
> > > >       <
> > > https://patchwork.freedesktop.org/patch/515857/?series=3D112189&rev=
=3D1 <
> > > https://patchwork.freedesktop.org/patch/515857/?series=3D112189&rev=
=3D1>>
> > > >      >      >
> > > >      >      >>> What would be interesting to learn is whether the
> option
> > > of
> > > >      >     refactoring
> > > >      >      >>> drm_sched to deal with out of order completion was
> > > >     considered
> > > >      >     and what were
> > > >      >      >>> the conclusions.
> > > >      >      >>>
> > > >      >      >>
> > > >      >      >> I coded this up a while back when trying to convert
> the
> > > >     i915 to
> > > >      >     the DRM
> > > >      >      >> scheduler it isn't all that hard either. The free fl=
ow
> > > >     control
> > > >      >     on the
> > > >      >      >> ring (e.g. set job limit =3D=3D SIZE OF RING / MAX J=
OB
> SIZE)
> > > is
> > > >      >     really what
> > > >      >      >> sold me on the this design.
> > > >      >
> > > >      >
> > > >      > You're not the only one to suggest supporting out-of-order
> > > >     completion.
> > > >      > However, it's tricky and breaks a lot of internal assumption=
s
> of
> > > the
> > > >      > scheduler. It also reduces functionality a bit because it ca=
n
> no
> > > >     longer
> > > >      > automatically rate-limit HW/FW queues which are often
> > > >     fixed-size.  (Ok,
> > > >      > yes, it probably could but it becomes a substantially harder
> > > >     problem.)
> > > >      >
> > > >      > It also seems like a worse mapping to me.  The goal here is =
to
> > > turn
> > > >      > submissions on a userspace-facing engine/queue into
> submissions
> > > >     to a FW
> > > >      > queue submissions, sorting out any dma_fence dependencies.
> Matt's
> > > >      > description of saying this is a 1:1 mapping between
> sched/entity
> > > >     doesn't
> > > >      > tell the whole story. It's a 1:1:1 mapping between xe_engine=
,
> > > >      > gpu_scheduler, and GuC FW engine.  Why make it a 1:something=
:1
> > > >     mapping?
> > > >      > Why is that better?
> > > >
> > > >     As I have stated before, what I think what would fit well for X=
e
> is
> > > one
> > > >     drm_scheduler per engine class. In specific terms on our curren=
t
> > > >     hardware, one drm scheduler instance for render, compute,
> blitter,
> > > >     video
> > > >     and video enhance. Userspace contexts remain scheduler entities=
.
> > > >
> > > >
> > > > And this is where we fairly strongly disagree.  More in a bit.
> > > >
> > > >     That way you avoid the whole kthread/kworker story and you have
> it
> > > >     actually use the entity picking code in the scheduler, which ma=
y
> be
> > > >     useful when the backend is congested.
> > > >
> > > >
> > > > What back-end congestion are you referring to here?  Running out of
> FW
> > > > queue IDs?  Something else?
> > >
> > > CT channel, number of context ids.
> > >
> > > >
> > > >     Yes you have to solve the out of order problem so in my mind
> that is
> > > >     something to discuss. What the problem actually is (just TDR?),
> how
> > > >     tricky and why etc.
> > > >
> > > >     And yes you lose the handy LRCA ring buffer size management so
> you'd
> > > >     have to make those entities not runnable in some other way.
> > > >
> > > >     Regarding the argument you raise below - would any of that make
> the
> > > >     frontend / backend separation worse and why? Do you think it is
> less
> > > >     natural? If neither is true then all remains is that it appears
> extra
> > > >     work to support out of order completion of entities has been
> > > discounted
> > > >     in favour of an easy but IMO inelegant option.
> > > >
> > > >
> > > > Broadly speaking, the kernel needs to stop thinking about GPU
> scheduling
> > > > in terms of scheduling jobs and start thinking in terms of scheduli=
ng
> > > > contexts/engines.  There is still some need for scheduling individu=
al
> > > > jobs but that is only for the purpose of delaying them as needed to
> > > > resolve dma_fence dependencies.  Once dependencies are resolved, th=
ey
> > > > get shoved onto the context/engine queue and from there the kernel
> only
> > > > really manages whole contexts/engines.  This is a major architectur=
al
> > > > shift, entirely different from the way i915 scheduling works.  It's
> also
> > > > different from the historical usage of DRM scheduler which I think =
is
> > > > why this all looks a bit funny.
> > > >
> > > > To justify this architectural shift, let's look at where we're
> headed.
> > > > In the glorious future...
> > > >
> > > >   1. Userspace submits directly to firmware queues.  The kernel has
> no
> > > > visibility whatsoever into individual jobs.  At most it can
> pause/resume
> > > > FW contexts as needed to handle eviction and memory management.
> > > >
> > > >   2. Because of 1, apart from handing out the FW queue IDs at the
> > > > beginning, the kernel can't really juggle them that much.  Dependin=
g
> on
> > > > FW design, it may be able to pause a client, give its IDs to anothe=
r,
> > > > and then resume it later when IDs free up.  What it's not doing is
> > > > juggling IDs on a job-by-job basis like i915 currently is.
> > > >
> > > >   3. Long-running compute jobs may not complete for days.  This mea=
ns
> > > > that memory management needs to happen in terms of pause/resume of
> > > > entire contexts/engines using the memory rather than based on waiti=
ng
> > > > for individual jobs to complete or pausing individual jobs until th=
e
> > > > memory is available.
> > > >
> > > >   4. Synchronization happens via userspace memory fences (UMF) and
> the
> > > > kernel is mostly unaware of most dependencies and when a
> context/engine
> > > > is or is not runnable.  Instead, it keeps as many of them minimally
> > > > active (memory is available, even if it's in system RAM) as possibl=
e
> and
> > > > lets the FW sort out dependencies.  (There may need to be some
> facility
> > > > for sleeping a context until a memory change similar to futex() or
> > > > poll() for userspace threads.  There are some details TBD.)
> > > >
> > > > Are there potential problems that will need to be solved here?
> Yes.  Is
> > > > it a good design?  Well, Microsoft has been living in this future f=
or
> > > > half a decade or better and it's working quite well for them.  It's
> also
> > > > the way all modern game consoles work.  It really is just Linux
> that's
> > > > stuck with the same old job model we've had since the monumental
> shift
> > > > to DRI2.
> > > >
> > > > To that end, one of the core goals of the Xe project was to make th=
e
> > > > driver internally behave as close to the above model as possible
> while
> > > > keeping the old-school job model as a very thin layer on top.  As t=
he
> > > > broader ecosystem problems (window-system support for UMF, for
> instance)
> > > > are solved, that layer can be peeled back.  The core driver will
> already
> > > > be ready for it.
> > > >
> > > > To that end, the point of the DRM scheduler in Xe isn't to schedule
> > > > jobs.  It's to resolve syncobj and dma-buf implicit sync dependenci=
es
> > > > and stuff jobs into their respective context/engine queue once
> they're
> > > > ready.  All the actual scheduling happens in firmware and any
> scheduling
> > > > the kernel does to deal with contention, oversubscriptions, too man=
y
> > > > contexts, etc. is between contexts/engines, not individual jobs.
> Sure,
> > > > the individual job visibility is nice, but if we design around it,
> we'll
> > > > never get to the glorious future.
> > > >
> > > > I really need to turn the above (with a bit more detail) into a blo=
g
> > > > post.... Maybe I'll do that this week.
> > > >
> > > > In any case, I hope that provides more insight into why Xe is
> designed
> > > > the way it is and why I'm pushing back so hard on trying to make it
> more
> > > > of a "classic" driver as far as scheduling is concerned.  Are there
> > > > potential problems here?  Yes, that's why Xe has been labeled a
> > > > prototype.  Are such radical changes necessary to get to said
> glorious
> > > > future?  Yes, I think they are.  Will it be worth it?  I believe so=
.
> > >
> > > Right, that's all solid I think. My takeaway is that frontend priorit=
y
> > > sorting and that stuff isn't needed and that is okay. And that there
> are
> > > multiple options to maybe improve drm scheduler, like the fore
> mentioned
> > > making it deal with out of order, or split into functional components=
,
> > > or split frontend/backend what you suggested. For most of them cost v=
s
> > > benefit is more or less not completely clear, neither how much effort
> > > was invested to look into them.
> > >
> > > One thing I missed from this explanation is how drm_scheduler per
> engine
> > > class interferes with the high level concepts. And I did not manage t=
o
> > > pick up on what exactly is the TDR problem in that case. Maybe the tw=
o
> > > are one and the same.
> > >
> > > Bottom line is I still have the concern that conversion to kworkers h=
as
> > > an opportunity to regress. Possibly more opportunity for some Xe use
> > > cases than to affect other vendors, since they would still be using p=
er
> > > physical engine / queue scheduler instances.
> > >
> > > And to put my money where my mouth is I will try to put testing Xe
> > > inside the full blown ChromeOS environment in my team plans. It would
> > > probably also be beneficial if Xe team could take a look at real worl=
d
> > > behaviour of the extreme transcode use cases too. If the stack is rea=
dy
> > > for that and all. It would be better to know earlier rather than late=
r
> > > if there is a fundamental issue.
> > >
> > > For the patch at hand, and the cover letter, it certainly feels it
> would
> > > benefit to record the past design discussion had with AMD folks, to
> > > explicitly copy other drivers, and to record the theoretical pros and
> > > cons of threads vs unbound workers as I have tried to highlight them.
> > >
> > > Regards,
> > >
> > > Tvrtko
> > >
>

--000000000000d2041405f204ea6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Jan 11, 2023 at 4:32 PM Matthew Brost &lt;<a href=3D"mailto:=
matthew.brost@intel.com">matthew.brost@intel.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Jan 11, 2023 at 04:=
18:01PM -0600, Jason Ekstrand wrote:<br>
&gt; On Wed, Jan 11, 2023 at 2:50 AM Tvrtko Ursulin &lt;<br>
&gt; <a href=3D"mailto:tvrtko.ursulin@linux.intel.com" target=3D"_blank">tv=
rtko.ursulin@linux.intel.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; On 10/01/2023 14:08, Jason Ekstrand wrote:<br>
&gt; &gt; &gt; On Tue, Jan 10, 2023 at 5:28 AM Tvrtko Ursulin<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:tvrtko.ursulin@linux.intel.com" target=
=3D"_blank">tvrtko.ursulin@linux.intel.com</a> &lt;mailto:<a href=3D"mailto=
:tvrtko.ursulin@linux.intel.com" target=3D"_blank">tvrtko.ursulin@linux.int=
el.com</a>&gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0On 09/01/2023 17:27, Jason Ekstrand wrote=
:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0[snip]<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; AF=
AICT it proposes to have 1:1 between *userspace*<br>
&gt; &gt; created<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0contexts (per<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; co=
ntext _and_ engine) and drm_sched. I am not sure<br>
&gt; &gt; avoiding<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0invasive changes=
<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; to=
 the shared code is in the spirit of the overall idea<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0and instead<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; op=
portunity should be used to look at way to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0refactor/improve<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0drm_sched.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Maybe?=C2=A0 I&#39;m not convinced =
that what Xe is doing is an abuse at<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0all or<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; really needs to drive a re-factor.=
=C2=A0 (More on that later.)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0There&#39;s only<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; one real issue which is that it fir=
es off potentially a lot of<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0kthreads.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Even that&#39;s not that bad given =
that kthreads are pretty light and<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0you&#39;re<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; not likely to have more kthreads th=
an userspace threads which are<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0much<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; heavier.=C2=A0 Not ideal, but not t=
he end of the world either.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Definitely<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; something we can/should optimize bu=
t if we went through with Xe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0without<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; this patch, it would probably be mo=
stly ok.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Yes, i=
t is 1:1 *userspace* engines and drm_sched.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; I&#39;=
m not really prepared to make large changes to DRM<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0scheduler<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0at the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; moment=
 for Xe as they are not really required nor does<br>
&gt; &gt; Boris<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0seem they<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; will b=
e required for his work either. I am interested to<br>
&gt; &gt; see<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0what Boris<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; comes =
up with.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Ev=
en on the low level, the idea to replace drm_sched<br>
&gt; &gt; threads<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0with workers<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; ha=
s a few problems.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; To=
 start with, the pattern of:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=
=A0 =C2=A0 while (not_stopped) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=
=A0 =C2=A0 =C2=A0keep picking jobs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=
=A0 =C2=A0 }<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Fe=
els fundamentally in disagreement with workers (while<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0obviously fits<b=
r>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; pe=
rfectly with the current kthread design).<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; The wh=
ile loop breaks and worker exists if no jobs are<br>
&gt; &gt; ready.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; I&#39;m not very familiar with work=
queues. What are you saying would<br>
&gt; &gt; fit<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; better? One scheduling job per work=
 item rather than one big work<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0item<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; which handles all available jobs?<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Yes and no, it indeed IMO does not fit to=
 have a work item which is<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0potentially unbound in runtime. But it is=
 a bit moot conceptual<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0mismatch<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0because it is a worst case / theoretical,=
 and I think due more<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fundamental concerns.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0If we have to go back to the low level si=
de of things, I&#39;ve picked<br>
&gt; &gt; this<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0random spot to consolidate what I have al=
ready mentioned and perhaps<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0expand.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0To start with, let me pull out some thoug=
hts from workqueue.rst:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Generally, work items are not expected to=
 hog a CPU and consume many<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cycles. That means maintaining just enoug=
h concurrency to prevent<br>
&gt; &gt; work<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0processing from stalling should be optima=
l.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0For unbound queues:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0The responsibility of regulating concurre=
ncy level is on the users.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Given the unbound queues will be spawned =
on demand to service all<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0queued<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0work items (more interesting when mixing =
up with the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0system_unbound_wq),<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0in the proposed design the number of inst=
antiated worker threads does<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0not correspond to the number of user thre=
ads (as you have elsewhere<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0stated), but pessimistically to the numbe=
r of active user contexts.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Those are pretty much the same in practice.=C2=A0 Rather, us=
er threads is<br>
&gt; &gt; &gt; typically an upper bound on the number of contexts.=C2=A0 Ye=
s, a single user<br>
&gt; &gt; &gt; thread could have a bunch of contexts but basically nothing =
does that<br>
&gt; &gt; &gt; except IGT.=C2=A0 In real-world usage, it&#39;s at most one =
context per user<br>
&gt; &gt; thread.<br>
&gt; &gt;<br>
&gt; &gt; Typically is the key here. But I am not sure it is good enough. C=
onsider<br>
&gt; &gt; this example - Intel Flex 170:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0* Delivers up to 36 streams 1080p60 transcode through=
put per card.<br>
&gt; &gt;=C2=A0 =C2=A0* When scaled to 10 cards in a 4U server configuratio=
n, it can support<br>
&gt; &gt; up to 360 streams of HEVC/HEVC 1080p60 transcode throughput.<br>
&gt; &gt;<br>
&gt; <br>
&gt; I had a feeling it was going to be media.... =F0=9F=98=85<br>
&gt; <br>
<br>
Yea wondering the media UMD can be rewritten to use less xe_engines, it<br>
is massive rewrite for VM bind + no implicit dependencies so let&#39;s just=
<br>
pile on some more work?<br></blockquote><div><br></div><div>It could probab=
ly use fewer than it does today.=C2=A0 It currently creates and throws away=
 contexts like crazy, or did last I looked at it.=C2=A0 However, the nature=
 of media encode is that it often spreads across two or three different typ=
es of engines.=C2=A0 There&#39;s not much you can do to change that.<br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; &gt; One transcode stream from my experience typically is 3-4 GPU cont=
exts<br>
&gt; &gt; (buffer travels from vcs -&gt; rcs -&gt; vcs, maybe vecs) used fr=
om a single<br>
&gt; &gt; CPU thread. 4 contexts * 36 streams =3D 144 active contexts. Mult=
iply by<br>
&gt; &gt; 60fps =3D 8640 jobs submitted and completed per second.<br>
&gt; &gt;<br>
&gt; &gt; 144 active contexts in the proposed scheme means possibly means 1=
44<br>
&gt; &gt; kernel worker threads spawned (driven by 36 transcode CPU threads=
). (I<br>
&gt; &gt; don&#39;t think the pools would scale down given all are constant=
ly pinged<br>
&gt; &gt; at 60fps.)<br>
&gt; &gt;<br>
&gt; &gt; And then each of 144 threads goes to grab the single GuC CT mutex=
. First<br>
&gt; &gt; threads are being made schedulable, then put to sleep as mutex<br=
>
&gt; &gt; contention is hit, then woken again as mutexes are getting releas=
ed,<br>
&gt; &gt; rinse, repeat.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Why is every submission grabbing the GuC CT mutex?=C2=A0 I&#39;ve not =
read the GuC<br>
&gt; back-end yet but I was under the impression that most run_job() would =
be<br>
&gt; just shoving another packet into a ring buffer.=C2=A0 If we have to se=
nd the GuC<br>
&gt; a message on the control ring every single time we submit a job, that&=
#39;s<br>
&gt; pretty horrible.<br>
&gt;<br>
<br>
Run job writes the ring buffer and moves the tail as the first step (no<br>
lock required). Next it needs to tell the GuC the xe_engine LRC tail has<br=
>
moved, this is done from a single Host to GuC channel which is circular<br>
buffer, the writing of the channel protected by the mutex. There are<br>
little more nuances too but in practice there is always space in the<br>
channel so the time mutex needs to held is really, really small<br>
(check cached credits, write 3 dwords in payload, write 1 dword to move<br>
tail). I also believe mutexes in Linux are hybrid where they spin for a<br>
little bit before sleeping and certainly if there is space in the<br>
channel we shouldn&#39;t sleep mutex contention.<br></blockquote><div><br><=
/div><div>Ok, that makes sense.=C2=A0 It&#39;s maybe a bit clunky and it&#3=
9;d be nice if we had some way to batch things up a bit so we only have to =
poke the GuC channel once for every batch of things rather than once per jo=
b.=C2=A0 That&#39;s maybe something we can look into as a future improvemen=
t; not fundamental.</div><div><br></div><div>Generally, though, it sounds l=
ike contention could be a real problem if we end up ping-ponging that lock =
between cores.=C2=A0 It&#39;s going to depend on how much work it takes to =
get the next ready thing vs. the cost of that atomic.=C2=A0 But, also, anyt=
hing we do is going to potentially run into contention problems.=C2=A0 *shr=
ug*=C2=A0 If we were going to go for one-per-HW-engine, we may as well go o=
ne-per-device and then we wouldn&#39;t need the lock.=C2=A0 Off the top of =
my head, that doesn&#39;t sound great either but IDK.<br></div><div>=C2=A0<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
As far as this being horrible, well didn&#39;t design the GuC and this how<=
br>
it is implemented for KMD based submission. We also have 256 doorbells<br>
so we wouldn&#39;t need a lock but I think are other issues with that desig=
n<br>
too which need to be worked out in the Xe2 / Xe3 timeframe.<br></blockquote=
><div><br></div><div>Yeah, not blaming you.=C2=A0 Just surprised, that&#39;=
s all.=C2=A0 How does it work for userspace submission?=C2=A0 What would it=
 look like if the kernel emulated userspace submission?=C2=A0 Is that even =
possible?</div><div><br></div><div>What are these doorbell things?=C2=A0 Ho=
w do they play into it?<br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
Also if you see my follow up response Xe is ~33k execs per second with<br>
the current implementation on a 8 core (or maybe 8 thread) TGL which<br>
seems to fine to me.<br></blockquote><div><br></div><div>33k exec/sec is ab=
out 500/frame which should be fine.=C2=A0 500 is a lot for a single frame.=
=C2=A0 I typically tell game devs to shoot for dozens per frame.=C2=A0 The =
important thing is that it stays low even with hundreds of memory objects b=
ound.=C2=A0 (Xe should be just fine there.)<br></div><div><br></div><div>--=
Jason</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
Matt<br>
<br>
&gt; --Jason<br>
&gt; <br>
&gt; <br>
&gt; (And yes this backend contention is there regardless of 1:1:1, it woul=
d<br>
&gt; &gt; require a different re-design to solve that. But it is just a que=
stion<br>
&gt; &gt; whether there are 144 contending threads, or just 6 with the thre=
ad per<br>
&gt; &gt; engine class scheme.)<br>
&gt; &gt;<br>
&gt; &gt; Then multiply all by 10 for a 4U server use case and you get 1440=
 worker<br>
&gt; &gt; kthreads, yes 10 more CT locks, but contending on how many CPU co=
res?<br>
&gt; &gt; Just so they can grab a timeslice and maybe content on a mutex as=
 the<br>
&gt; &gt; next step.<br>
&gt; &gt;<br>
&gt; &gt; This example is where it would hurt on large systems. Imagine onl=
y an<br>
&gt; &gt; even wider media transcode card...<br>
&gt; &gt;<br>
&gt; &gt; Second example is only a single engine class used (3d desktop?) b=
ut with<br>
&gt; &gt; a bunch of not-runnable jobs queued and waiting on a fence to sig=
nal.<br>
&gt; &gt; Implicit or explicit dependencies doesn&#39;t matter. Then the fe=
nce signals<br>
&gt; &gt; and call backs run. N work items get scheduled, but they all subm=
it to<br>
&gt; &gt; the same HW engine. So we end up with:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /-- wi1 --\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ ..=C2=A0 =C2=A0 =C2=A0.. \<br>
&gt; &gt;=C2=A0 =C2=A0cb --+---=C2=A0 wi.. ---+-- rq1 -- .. -- rqN<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\ ..=C2=A0 =C2=A0 ..=C2=A0 /<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \-- wiN --/<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; All that we have achieved is waking up N CPUs to contend on the s=
ame<br>
&gt; &gt; lock and effectively insert the job into the same single HW queue=
. I<br>
&gt; &gt; don&#39;t see any positives there.<br>
&gt; &gt;<br>
&gt; &gt; This example I think can particularly hurt small / low power devi=
ces<br>
&gt; &gt; because of needless waking up of many cores for no benefit. Grant=
ed, I<br>
&gt; &gt; don&#39;t have a good feel on how common this pattern is in pract=
ice.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0That<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0is the number which drives the maximum nu=
mber of not-runnable jobs<br>
&gt; &gt; that<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0can become runnable at once, and hence sp=
awn that many work items,<br>
&gt; &gt; and<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0in turn unbound worker threads.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Several problems there.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0It is fundamentally pointless to have pot=
entially that many more<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0threads<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0than the number of CPU cores - it simply =
creates a scheduling storm.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Unbound workers have no CPU / cache local=
ity either and no connection<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0with the CPU scheduler to optimize schedu=
ling patterns. This may<br>
&gt; &gt; matter<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0either on large systems or on small ones.=
 Whereas the current design<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0allows for scheduler to notice userspace =
CPU thread keeps waking up<br>
&gt; &gt; the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0same drm scheduler kernel thread, and so =
it can keep them on the same<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0CPU, the unbound workers lose that abilit=
y and so 2nd CPU might be<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0getting woken up from low sleep for every=
 submission.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Hence, apart from being a bit of a impeda=
nce mismatch, the proposal<br>
&gt; &gt; has<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0the potential to change performance and p=
ower patterns and both large<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0and small machines.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Ok, thanks for explaining the issue you&#39;re seeing in mor=
e detail.=C2=A0 Yes,<br>
&gt; &gt; &gt; deferred kwork does appear to mismatch somewhat with what th=
e scheduler<br>
&gt; &gt; &gt; needs or at least how it&#39;s worked in the past.=C2=A0 How=
 much impact will<br>
&gt; &gt; &gt; that mismatch have?=C2=A0 Unclear.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Se=
condly, it probably demands separate workers (not<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0optional),<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0otherwise<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; be=
haviour of shared workqueues has either the potential<br>
&gt; &gt; to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0explode number<b=
r>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; ke=
rnel threads anyway, or add latency.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Right =
now the system_unbound_wq is used which does have a<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0limit<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0on the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; number=
 of threads, right? I do have a FIXME to allow a<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0worker to be<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; passed=
 in similar to TDR.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; WRT to=
 latency, the 1:1 ratio could actually have lower<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0latency<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0as 2 GPU<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; schedu=
lers can be pushing jobs into the backend /<br>
&gt; &gt; cleaning up<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0jobs in<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; parall=
el.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Thought of=
 one more point here where why in Xe we<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0absolutely want<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0a 1 to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; 1 ratio be=
tween entity and scheduler - the way we implement<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0timeslicing<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; for preemp=
t fences.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Let me try=
 to explain.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Preempt fe=
nces are implemented via the generic messaging<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0interface [1]<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; with suspe=
nd / resume messages. If a suspend messages is<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0received to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; soon after=
 calling resume (this is per entity) we simply<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0sleep in the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; suspend ca=
ll thus giving the entity a timeslice. This<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0completely<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0falls<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; apart with=
 a many to 1 relationship as now a entity<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0waiting for a<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; timeslice =
blocks the other entities. Could we work aroudn<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0this,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0sure but<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; just anoth=
er bunch of code we&#39;d have to add in Xe. Being to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0freely sleep<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; in backend=
 without affecting other entities is really,<br>
&gt; &gt; really<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0nice IMO<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; and I bet =
Xe isn&#39;t the only driver that is going to feel<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0this way.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Last thing=
 I&#39;ll say regardless of how anyone feels about<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Xe using<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0a 1 to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; 1 relation=
ship this patch IMO makes sense as I hope we can<br>
&gt; &gt; all<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0agree a<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; workqueue =
scales better than kthreads.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0I don&#39;t know=
 for sure what will scale better and for what use<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0case,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0combination of C=
PU cores vs number of GPU engines to keep<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0busy vs other<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0system activity.=
 But I wager someone is bound to ask for some<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0numbers to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0make sure propos=
al is not negatively affecting any other<br>
&gt; &gt; drivers.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Then let them ask.=C2=A0 Waving you=
r hands vaguely in the direction of<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; rest of DRM and saying &quot;Uh, so=
meone (not me) might object&quot; is<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0profoundly<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; unhelpful.=C2=A0 Sure, someone migh=
t.=C2=A0 That&#39;s why it&#39;s on dri-devel.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0If you<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; think there&#39;s someone in partic=
ular who might have a useful<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0opinion on<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; this, throw them in the CC so they =
don&#39;t miss the e-mail thread.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Or are you asking for numbers?=C2=
=A0 If so, what numbers are you<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0asking for?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0It was a heads up to the Xe team in case =
people weren&#39;t appreciating<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0how<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0the proposed change has the potential inf=
luence power and performance<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0across the board. And nothing in the foll=
ow up discussion made me<br>
&gt; &gt; think<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0it was considered so I don&#39;t think it=
 was redundant to raise it.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0In my experience it is typical that such =
core changes come with some<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0numbers. Which is in case of drm schedule=
r is tricky and probably<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0requires explicitly asking everyone to te=
st (rather than count on<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;don&#39;t<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0miss the email thread&quot;). Real produc=
ts can fail to ship due ten mW<br>
&gt; &gt; here<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0or there. Like suddenly an extra core pre=
vented from getting into<br>
&gt; &gt; deep<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0sleep.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0If that was &quot;profoundly unhelpful&qu=
ot; so be it.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; With your above explanation, it makes more sense what you&#3=
9;re asking.<br>
&gt; &gt; &gt; It&#39;s still not something Matt is likely to be able to pr=
ovide on his<br>
&gt; &gt; &gt; own.=C2=A0 We need to tag some other folks and ask them to t=
est it out.=C2=A0 We<br>
&gt; &gt; &gt; could play around a bit with it on Xe but it&#39;s not exact=
ly production<br>
&gt; &gt; &gt; grade yet and is going to hit this differently from most.=C2=
=A0 Likely<br>
&gt; &gt; &gt; candidates are probably AMD and Freedreno.<br>
&gt; &gt;<br>
&gt; &gt; Whoever is setup to check out power and performance would be good=
 to<br>
&gt; &gt; give it a spin, yes.<br>
&gt; &gt;<br>
&gt; &gt; PS. I don&#39;t think I was asking Matt to test with other device=
s. To start<br>
&gt; &gt; with I think Xe is a team effort. I was asking for more backgroun=
d on<br>
&gt; &gt; the design decision since patch 4/20 does not say anything on tha=
t<br>
&gt; &gt; angle, nor later in the thread it was IMO sufficiently addressed.=
<br>
&gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Also, If we&#39;re talking about a =
design that might paint us into an<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Intel-HW-specific hole, that would =
be one thing.=C2=A0 But we&#39;re not.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0We&#39;re<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; talking about switching which kerne=
l threading/task mechanism to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0use for<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; what&#39;s really a very generic pr=
oblem.=C2=A0 The core Xe design works<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0without<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; this patch (just with more kthreads=
).=C2=A0 If we land this patch or<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; something like it and get it wrong =
and it causes a performance<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0problem<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; for someone down the line, we can r=
evisit it.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0For some definition of &quot;it works&quo=
t; - I really wouldn&#39;t suggest<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0shipping a<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0kthread per user context at any point.<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; You have yet to elaborate on why. What resources is it consu=
ming that&#39;s<br>
&gt; &gt; &gt; going to be a problem? Are you anticipating CPU affinity pro=
blems? Or<br>
&gt; &gt; &gt; does it just seem wasteful?<br>
&gt; &gt;<br>
&gt; &gt; Well I don&#39;t know, commit message says the approach does not =
scale. :)<br>
&gt; &gt;<br>
&gt; &gt; &gt; I think I largely agree that it&#39;s probably unnecessary/w=
asteful but<br>
&gt; &gt; &gt; reducing the number of kthreads seems like a tractable probl=
em to solve<br>
&gt; &gt; &gt; regardless of where we put the gpu_scheduler object.=C2=A0 I=
s this the right<br>
&gt; &gt; &gt; solution?=C2=A0 Maybe not.=C2=A0 It was also proposed at one=
 point that we could<br>
&gt; &gt; &gt; split the scheduler into two pieces: A scheduler which owns =
the kthread,<br>
&gt; &gt; &gt; and a back-end which targets some HW ring thing where you ca=
n have<br>
&gt; &gt; &gt; multiple back-ends per scheduler.=C2=A0 That&#39;s certainly=
 more invasive from a<br>
&gt; &gt; &gt; DRM scheduler internal API PoV but would solve the kthread p=
roblem in a<br>
&gt; &gt; &gt; way that&#39;s more similar to what we have now.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0In any case that=
&#39;s a low level question caused by the high<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0level design<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0decision. So I&#=
39;d think first focus on the high level - which<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0is the 1:1<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0mapping of entit=
y to scheduler instance proposal.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Fundamentally it=
 will be up to the DRM maintainers and the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0community to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0bless your appro=
ach. And it is important to stress 1:1 is<br>
&gt; &gt; about<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0userspace contex=
ts, so I believe unlike any other current<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0scheduler<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0user. And also i=
mportant to stress this effectively does not<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0make Xe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0_really_ use the=
 scheduler that much.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; I don&#39;t think this makes Xe nea=
rly as much of a one-off as you<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0think it<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; does.=C2=A0 I&#39;ve already told t=
he Asahi team working on Apple M1/2<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0hardware<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; to do it this way and it seems to b=
e a pretty good mapping for<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0them. I<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; believe this is roughly the plan fo=
r nouveau as well.=C2=A0 It&#39;s not<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0the way<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; it currently works for anyone becau=
se most other groups aren&#39;t<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0doing FW<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; scheduling yet.=C2=A0 In the world =
of FW scheduling and hardware<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0designed to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; support userspace direct-to-FW subm=
it, I think the design makes<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0perfect<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; sense (see below) and I expect we&#=
39;ll see more drivers move in this<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; direction as those drivers evolve.=
=C2=A0 (AMD is doing some customish<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0thing<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; for how with gpu_scheduler on the f=
ront-end somehow. I&#39;ve not dug<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0into<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; those details.)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0I can only offer=
 my opinion, which is that the two options<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0mentioned in<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0this thread (eit=
her improve drm scheduler to cope with what is<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0required,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0or split up the =
code so you can use just the parts of<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0drm_sched which<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0you want - which=
 is frontend dependency tracking) shouldn&#39;t<br>
&gt; &gt; be so<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0readily dismisse=
d, given how I think the idea was for the new<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0driver to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0work less in a s=
ilo and more in the community (not do kludges<br>
&gt; &gt; to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0workaround stuff=
 because it is thought to be too hard to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0improve common<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0code), but funda=
mentally, &quot;goto previous paragraph&quot; for what<br>
&gt; &gt; I am<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0concerned.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Meta comment:=C2=A0 It appears as i=
f you&#39;re falling into the standard<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0i915<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; team trap of having an internal dis=
cussion about what the<br>
&gt; &gt; community<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; discussion might look like instead =
of actually having the<br>
&gt; &gt; community<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; discussion.=C2=A0 If you are seriou=
sly concerned about interactions<br>
&gt; &gt; with<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; other drivers or whether or setting=
 common direction, the right<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0way to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; do that is to break a patch or two =
out into a separate RFC series<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0and<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; tag a handful of driver maintainers=
.=C2=A0 Trying to predict the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0questions<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; other people might ask is pointless=
. Cc them and asking for their<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0input<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; instead.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0I don&#39;t follow you here. It&#39;s not=
 an internal discussion - I am<br>
&gt; &gt; raising<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0my concerns on the design publicly. I am =
supposed to write a patch to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0show something, but am allowed to comment=
 on a RFC series?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I may have misread your tone a bit.=C2=A0 It felt a bit like=
 too many<br>
&gt; &gt; &gt; discussions I&#39;ve had in the past where people are trying=
 to predict what<br>
&gt; &gt; &gt; others will say instead of just asking them.=C2=A0 Reading i=
t again, I was<br>
&gt; &gt; &gt; probably jumping to conclusions a bit.=C2=A0 Sorry about tha=
t.<br>
&gt; &gt;<br>
&gt; &gt; Okay no problem, thanks. In any case we don&#39;t have to keep di=
scussing<br>
&gt; &gt; it, since I wrote one or two emails ago it is fundamentally on th=
e<br>
&gt; &gt; maintainers and community to ack the approach. I only felt like R=
FC did<br>
&gt; &gt; not explain the potential downsides sufficiently so I wanted to p=
robe<br>
&gt; &gt; that area a bit.<br>
&gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0It is &quot;drm/sched: Convert drm schedu=
ler to use a work queue rather<br>
&gt; &gt; than<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0kthread&quot; which should have Cc-ed _ev=
eryone_ who use drm scheduler.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Yeah, it probably should have.=C2=A0 I think that&#39;s most=
ly what I&#39;ve been<br>
&gt; &gt; &gt; trying to say.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Tvrtko<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0P.S. And as a re=
lated side note, there are more areas where<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0drm_sched<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0could be improve=
d, like for instance priority handling.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Take a look at m=
sm_submitqueue_create /<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0msm_gpu_convert_priority /<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0get_sched_entity=
 to see how msm works around the drm_sched<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0hardcoded<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0limit of availab=
le priority levels, in order to avoid having<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0to leave a<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0hw capability un=
used. I suspect msm would be happier if they<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0could have<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0all priority lev=
els equal in terms of whether they apply only<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0at the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0frontend level o=
r completely throughout the pipeline.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; [1]<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://patchwork.freedesktop.=
org/patch/515857/?series=3D112189&amp;rev=3D1" rel=3D"noreferrer" target=3D=
"_blank">https://patchwork.freedesktop.org/patch/515857/?series=3D112189&am=
p;rev=3D1</a><br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://patchwork.freedesk=
top.org/patch/515857/?series=3D112189&amp;rev=3D1" rel=3D"noreferrer" targe=
t=3D"_blank">https://patchwork.freedesktop.org/patch/515857/?series=3D11218=
9&amp;rev=3D1</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<br>
&gt; &gt; <a href=3D"https://patchwork.freedesktop.org/patch/515857/?series=
=3D112189&amp;rev=3D1" rel=3D"noreferrer" target=3D"_blank">https://patchwo=
rk.freedesktop.org/patch/515857/?series=3D112189&amp;rev=3D1</a> &lt;<br>
&gt; &gt; <a href=3D"https://patchwork.freedesktop.org/patch/515857/?series=
=3D112189&amp;rev=3D1" rel=3D"noreferrer" target=3D"_blank">https://patchwo=
rk.freedesktop.org/patch/515857/?series=3D112189&amp;rev=3D1</a>&gt;&gt;<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Wh=
at would be interesting to learn is whether the option<br>
&gt; &gt; of<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0refactoring<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; dr=
m_sched to deal with out of order completion was<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0considered<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0and what were<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; th=
e conclusions.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; I code=
d this up a while back when trying to convert the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0i915 to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0the DRM<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; schedu=
ler it isn&#39;t all that hard either. The free flow<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0control<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0on the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; ring (=
e.g. set job limit =3D=3D SIZE OF RING / MAX JOB SIZE)<br>
&gt; &gt; is<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0really what<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; sold m=
e on the this design.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; You&#39;re not the only one to sugg=
est supporting out-of-order<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0completion.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; However, it&#39;s tricky and breaks=
 a lot of internal assumptions of<br>
&gt; &gt; the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; scheduler. It also reduces function=
ality a bit because it can no<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0longer<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; automatically rate-limit HW/FW queu=
es which are often<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fixed-size.=C2=A0 (Ok,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; yes, it probably could but it becom=
es a substantially harder<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0problem.)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; It also seems like a worse mapping =
to me.=C2=A0 The goal here is to<br>
&gt; &gt; turn<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; submissions on a userspace-facing e=
ngine/queue into submissions<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0to a FW<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; queue submissions, sorting out any =
dma_fence dependencies.=C2=A0 Matt&#39;s<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; description of saying this is a 1:1=
 mapping between sched/entity<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0doesn&#39;t<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; tell the whole story. It&#39;s a 1:=
1:1 mapping between xe_engine,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; gpu_scheduler, and GuC FW engine.=
=C2=A0 Why make it a 1:something:1<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0mapping?<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Why is that better?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0As I have stated before, what I think wha=
t would fit well for Xe is<br>
&gt; &gt; one<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0drm_scheduler per engine class. In specif=
ic terms on our current<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0hardware, one drm scheduler instance for =
render, compute, blitter,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0video<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0and video enhance. Userspace contexts rem=
ain scheduler entities.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; And this is where we fairly strongly disagree.=C2=A0 More in=
 a bit.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0That way you avoid the whole kthread/kwor=
ker story and you have it<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0actually use the entity picking code in t=
he scheduler, which may be<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0useful when the backend is congested.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; What back-end congestion are you referring to here?=C2=A0 Ru=
nning out of FW<br>
&gt; &gt; &gt; queue IDs?=C2=A0 Something else?<br>
&gt; &gt;<br>
&gt; &gt; CT channel, number of context ids.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Yes you have to solve the out of order pr=
oblem so in my mind that is<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0something to discuss. What the problem ac=
tually is (just TDR?), how<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0tricky and why etc.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0And yes you lose the handy LRCA ring buff=
er size management so you&#39;d<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0have to make those entities not runnable =
in some other way.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Regarding the argument you raise below - =
would any of that make the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0frontend / backend separation worse and w=
hy? Do you think it is less<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0natural? If neither is true then all rema=
ins is that it appears extra<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0work to support out of order completion o=
f entities has been<br>
&gt; &gt; discounted<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0in favour of an easy but IMO inelegant op=
tion.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Broadly speaking, the kernel needs to stop thinking about GP=
U scheduling<br>
&gt; &gt; &gt; in terms of scheduling jobs and start thinking in terms of s=
cheduling<br>
&gt; &gt; &gt; contexts/engines.=C2=A0 There is still some need for schedul=
ing individual<br>
&gt; &gt; &gt; jobs but that is only for the purpose of delaying them as ne=
eded to<br>
&gt; &gt; &gt; resolve dma_fence dependencies.=C2=A0 Once dependencies are =
resolved, they<br>
&gt; &gt; &gt; get shoved onto the context/engine queue and from there the =
kernel only<br>
&gt; &gt; &gt; really manages whole contexts/engines.=C2=A0 This is a major=
 architectural<br>
&gt; &gt; &gt; shift, entirely different from the way i915 scheduling works=
.=C2=A0 It&#39;s also<br>
&gt; &gt; &gt; different from the historical usage of DRM scheduler which I=
 think is<br>
&gt; &gt; &gt; why this all looks a bit funny.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; To justify this architectural shift, let&#39;s look at where=
 we&#39;re headed.<br>
&gt; &gt; &gt; In the glorious future...<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A01. Userspace submits directly to firmware queues=
.=C2=A0 The kernel has no<br>
&gt; &gt; &gt; visibility whatsoever into individual jobs.=C2=A0 At most it=
 can pause/resume<br>
&gt; &gt; &gt; FW contexts as needed to handle eviction and memory manageme=
nt.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A02. Because of 1, apart from handing out the FW q=
ueue IDs at the<br>
&gt; &gt; &gt; beginning, the kernel can&#39;t really juggle them that much=
.=C2=A0 Depending on<br>
&gt; &gt; &gt; FW design, it may be able to pause a client, give its IDs to=
 another,<br>
&gt; &gt; &gt; and then resume it later when IDs free up.=C2=A0 What it&#39=
;s not doing is<br>
&gt; &gt; &gt; juggling IDs on a job-by-job basis like i915 currently is.<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A03. Long-running compute jobs may not complete fo=
r days.=C2=A0 This means<br>
&gt; &gt; &gt; that memory management needs to happen in terms of pause/res=
ume of<br>
&gt; &gt; &gt; entire contexts/engines using the memory rather than based o=
n waiting<br>
&gt; &gt; &gt; for individual jobs to complete or pausing individual jobs u=
ntil the<br>
&gt; &gt; &gt; memory is available.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A04. Synchronization happens via userspace memory =
fences (UMF) and the<br>
&gt; &gt; &gt; kernel is mostly unaware of most dependencies and when a con=
text/engine<br>
&gt; &gt; &gt; is or is not runnable.=C2=A0 Instead, it keeps as many of th=
em minimally<br>
&gt; &gt; &gt; active (memory is available, even if it&#39;s in system RAM)=
 as possible and<br>
&gt; &gt; &gt; lets the FW sort out dependencies.=C2=A0 (There may need to =
be some facility<br>
&gt; &gt; &gt; for sleeping a context until a memory change similar to fute=
x() or<br>
&gt; &gt; &gt; poll() for userspace threads.=C2=A0 There are some details T=
BD.)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Are there potential problems that will need to be solved her=
e?=C2=A0 Yes.=C2=A0 Is<br>
&gt; &gt; &gt; it a good design?=C2=A0 Well, Microsoft has been living in t=
his future for<br>
&gt; &gt; &gt; half a decade or better and it&#39;s working quite well for =
them.=C2=A0 It&#39;s also<br>
&gt; &gt; &gt; the way all modern game consoles work.=C2=A0 It really is ju=
st Linux that&#39;s<br>
&gt; &gt; &gt; stuck with the same old job model we&#39;ve had since the mo=
numental shift<br>
&gt; &gt; &gt; to DRI2.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; To that end, one of the core goals of the Xe project was to =
make the<br>
&gt; &gt; &gt; driver internally behave as close to the above model as poss=
ible while<br>
&gt; &gt; &gt; keeping the old-school job model as a very thin layer on top=
.=C2=A0 As the<br>
&gt; &gt; &gt; broader ecosystem problems (window-system support for UMF, f=
or instance)<br>
&gt; &gt; &gt; are solved, that layer can be peeled back.=C2=A0 The core dr=
iver will already<br>
&gt; &gt; &gt; be ready for it.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; To that end, the point of the DRM scheduler in Xe isn&#39;t =
to schedule<br>
&gt; &gt; &gt; jobs.=C2=A0 It&#39;s to resolve syncobj and dma-buf implicit=
 sync dependencies<br>
&gt; &gt; &gt; and stuff jobs into their respective context/engine queue on=
ce they&#39;re<br>
&gt; &gt; &gt; ready.=C2=A0 All the actual scheduling happens in firmware a=
nd any scheduling<br>
&gt; &gt; &gt; the kernel does to deal with contention, oversubscriptions, =
too many<br>
&gt; &gt; &gt; contexts, etc. is between contexts/engines, not individual j=
obs.=C2=A0 Sure,<br>
&gt; &gt; &gt; the individual job visibility is nice, but if we design arou=
nd it, we&#39;ll<br>
&gt; &gt; &gt; never get to the glorious future.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I really need to turn the above (with a bit more detail) int=
o a blog<br>
&gt; &gt; &gt; post.... Maybe I&#39;ll do that this week.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; In any case, I hope that provides more insight into why Xe i=
s designed<br>
&gt; &gt; &gt; the way it is and why I&#39;m pushing back so hard on trying=
 to make it more<br>
&gt; &gt; &gt; of a &quot;classic&quot; driver as far as scheduling is conc=
erned.=C2=A0 Are there<br>
&gt; &gt; &gt; potential problems here?=C2=A0 Yes, that&#39;s why Xe has be=
en labeled a<br>
&gt; &gt; &gt; prototype.=C2=A0 Are such radical changes necessary to get t=
o said glorious<br>
&gt; &gt; &gt; future?=C2=A0 Yes, I think they are.=C2=A0 Will it be worth =
it?=C2=A0 I believe so.<br>
&gt; &gt;<br>
&gt; &gt; Right, that&#39;s all solid I think. My takeaway is that frontend=
 priority<br>
&gt; &gt; sorting and that stuff isn&#39;t needed and that is okay. And tha=
t there are<br>
&gt; &gt; multiple options to maybe improve drm scheduler, like the fore me=
ntioned<br>
&gt; &gt; making it deal with out of order, or split into functional compon=
ents,<br>
&gt; &gt; or split frontend/backend what you suggested. For most of them co=
st vs<br>
&gt; &gt; benefit is more or less not completely clear, neither how much ef=
fort<br>
&gt; &gt; was invested to look into them.<br>
&gt; &gt;<br>
&gt; &gt; One thing I missed from this explanation is how drm_scheduler per=
 engine<br>
&gt; &gt; class interferes with the high level concepts. And I did not mana=
ge to<br>
&gt; &gt; pick up on what exactly is the TDR problem in that case. Maybe th=
e two<br>
&gt; &gt; are one and the same.<br>
&gt; &gt;<br>
&gt; &gt; Bottom line is I still have the concern that conversion to kworke=
rs has<br>
&gt; &gt; an opportunity to regress. Possibly more opportunity for some Xe =
use<br>
&gt; &gt; cases than to affect other vendors, since they would still be usi=
ng per<br>
&gt; &gt; physical engine / queue scheduler instances.<br>
&gt; &gt;<br>
&gt; &gt; And to put my money where my mouth is I will try to put testing X=
e<br>
&gt; &gt; inside the full blown ChromeOS environment in my team plans. It w=
ould<br>
&gt; &gt; probably also be beneficial if Xe team could take a look at real =
world<br>
&gt; &gt; behaviour of the extreme transcode use cases too. If the stack is=
 ready<br>
&gt; &gt; for that and all. It would be better to know earlier rather than =
later<br>
&gt; &gt; if there is a fundamental issue.<br>
&gt; &gt;<br>
&gt; &gt; For the patch at hand, and the cover letter, it certainly feels i=
t would<br>
&gt; &gt; benefit to record the past design discussion had with AMD folks, =
to<br>
&gt; &gt; explicitly copy other drivers, and to record the theoretical pros=
 and<br>
&gt; &gt; cons of threads vs unbound workers as I have tried to highlight t=
hem.<br>
&gt; &gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt;<br>
&gt; &gt; Tvrtko<br>
&gt; &gt;<br>
</blockquote></div></div>

--000000000000d2041405f204ea6e--
