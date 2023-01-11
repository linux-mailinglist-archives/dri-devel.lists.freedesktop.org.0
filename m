Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDFE666615
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 23:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB0910E16B;
	Wed, 11 Jan 2023 22:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACD010E167
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 22:18:15 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id gh17so40479982ejb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 14:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HK7J9e92VT7ag85PKH0ZuRGBWlK3eBnT/xu1Fdm9NRU=;
 b=3sKxKsmbm1C3MsDmIoR+KgZrfo4AthWRbf2rzPm5dLqQ2vqiOlCwbcG+y1bOWHCIEe
 HhLvnMega0lOIjDyssGo3pD6A5gof3DognivUCHsbJ8vcTkzMJg/6fCNX4AHpP/5dJhA
 KtPcvhbeOe4nYGDeK/2rG7rSnTC9R2lPXum1D9tVgoQ+ER6IR6XMdPU99XBxOH11sx11
 LJZwQ1EwGnerXl4F419MXh3AfaU1Nmeqs8M6dwlxygNnz2zD5bAdaBh/Sf4QfnnoFVZV
 zZ1lJkfKInuVRodyBlhBzbXVkXLVjYzBs9UsJ1v+TauzOYqTlXDX/wuKKrn9iaSRh+rs
 vaOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HK7J9e92VT7ag85PKH0ZuRGBWlK3eBnT/xu1Fdm9NRU=;
 b=OHqhJwVxo310oPNe3pkJdAECkCEdKvXChLmq/jPecxFQ1zEtx2Nn1narOCf8I7GW/Y
 y8WH6grTeIb4CMoEx5fDH43GcMW0cAl32EJqT/k831dIQP8EZ7KBMf55JdD8eBQWBTE6
 /5g3HO4Bu1XyciasZht7c1oO/VpMHh9U+qScDE0T/vnwrQfShjJBMNr2kn7o3z9+Jfte
 77fSJF3CdQP5EFlCAuBENuEXIqyoCB2S+7YqVhLQFcJyRdb0iWrGmzzn9JV60zdJ4mHt
 cEhVWINVK8GwnQwvjEhZJkjlUy91jNZB+6jcQcHYhGsdycijU+L3R4+NovSjsX06FSNE
 ko+g==
X-Gm-Message-State: AFqh2kqJGqpf8QyUcJEwOV2M/yR3APwgGjJNGiEh0F1qUxg8Kwcjp+/D
 HQDuRcPfLYKJwDqm/88KJ/PbrVhBtbrHH19LXQx9Tg==
X-Google-Smtp-Source: AMrXdXsKZ/hQTkpXIF9cSNC2zBpLoxLJiy+0tT+yNn7/aMw3laZddElegSOj/8cwBEHJGT/qBY+m/aK3ggWUSYG4tgg=
X-Received: by 2002:a17:907:c498:b0:84d:34fa:f1a6 with SMTP id
 tp24-20020a170907c49800b0084d34faf1a6mr1054101ejc.638.1673475493770; Wed, 11
 Jan 2023 14:18:13 -0800 (PST)
MIME-Version: 1.0
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <20221222222127.34560-5-matthew.brost@intel.com>
 <20221230112042.2ddd1946@collabora.com>
 <20221230125508.57af8a14@collabora.com>
 <20230102083019.24b99647@collabora.com>
 <7d6df13c-6c2e-d713-edc8-128d6e19f187@linux.intel.com>
 <Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com>
 <Y7i0J3uQ+izOJcEb@DUT025-TGLU.fm.intel.com>
 <e8c301cb-c7d4-ed54-f3ab-61a5fcc7f940@linux.intel.com>
 <CAOFGe96yeF4SWxvHC5pxyggf=655q7+ZrFS+Zab42F-RE7UK1w@mail.gmail.com>
 <e6512993-5247-a577-abf4-97cdb21358a0@linux.intel.com>
 <CAOFGe957uYdTFccQp36QRJRDkWQZDCB0ztMNDH0=SSf-RTgzLw@mail.gmail.com>
 <705a0b3c-2fe5-0393-0fda-511f288007c7@linux.intel.com>
In-Reply-To: <705a0b3c-2fe5-0393-0fda-511f288007c7@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 11 Jan 2023 16:18:01 -0600
Message-ID: <CAOFGe96KQUmy20_h3OmmXGVmuGkEm8iDhnLzgBjM5dnPApqYvQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler to
 use a work queue rather than kthread
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000058d23005f204602f"
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000058d23005f204602f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2023 at 2:50 AM Tvrtko Ursulin <
tvrtko.ursulin@linux.intel.com> wrote:

>
> On 10/01/2023 14:08, Jason Ekstrand wrote:
> > On Tue, Jan 10, 2023 at 5:28 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com <mailto:tvrtko.ursulin@linux.intel.com>=
>
>
> > wrote:
> >
> >
> >
> >     On 09/01/2023 17:27, Jason Ekstrand wrote:
> >
> >     [snip]
> >
> >      >      >>> AFAICT it proposes to have 1:1 between *userspace*
> created
> >      >     contexts (per
> >      >      >>> context _and_ engine) and drm_sched. I am not sure
> avoiding
> >      >     invasive changes
> >      >      >>> to the shared code is in the spirit of the overall idea
> >     and instead
> >      >      >>> opportunity should be used to look at way to
> >     refactor/improve
> >      >     drm_sched.
> >      >
> >      >
> >      > Maybe?  I'm not convinced that what Xe is doing is an abuse at
> >     all or
> >      > really needs to drive a re-factor.  (More on that later.)
> >     There's only
> >      > one real issue which is that it fires off potentially a lot of
> >     kthreads.
> >      > Even that's not that bad given that kthreads are pretty light an=
d
> >     you're
> >      > not likely to have more kthreads than userspace threads which ar=
e
> >     much
> >      > heavier.  Not ideal, but not the end of the world either.
> >     Definitely
> >      > something we can/should optimize but if we went through with Xe
> >     without
> >      > this patch, it would probably be mostly ok.
> >      >
> >      >      >> Yes, it is 1:1 *userspace* engines and drm_sched.
> >      >      >>
> >      >      >> I'm not really prepared to make large changes to DRM
> >     scheduler
> >      >     at the
> >      >      >> moment for Xe as they are not really required nor does
> Boris
> >      >     seem they
> >      >      >> will be required for his work either. I am interested to
> see
> >      >     what Boris
> >      >      >> comes up with.
> >      >      >>
> >      >      >>> Even on the low level, the idea to replace drm_sched
> threads
> >      >     with workers
> >      >      >>> has a few problems.
> >      >      >>>
> >      >      >>> To start with, the pattern of:
> >      >      >>>
> >      >      >>>    while (not_stopped) {
> >      >      >>>     keep picking jobs
> >      >      >>>    }
> >      >      >>>
> >      >      >>> Feels fundamentally in disagreement with workers (while
> >      >     obviously fits
> >      >      >>> perfectly with the current kthread design).
> >      >      >>
> >      >      >> The while loop breaks and worker exists if no jobs are
> ready.
> >      >
> >      >
> >      > I'm not very familiar with workqueues. What are you saying would
> fit
> >      > better? One scheduling job per work item rather than one big wor=
k
> >     item
> >      > which handles all available jobs?
> >
> >     Yes and no, it indeed IMO does not fit to have a work item which is
> >     potentially unbound in runtime. But it is a bit moot conceptual
> >     mismatch
> >     because it is a worst case / theoretical, and I think due more
> >     fundamental concerns.
> >
> >     If we have to go back to the low level side of things, I've picked
> this
> >     random spot to consolidate what I have already mentioned and perhap=
s
> >     expand.
> >
> >     To start with, let me pull out some thoughts from workqueue.rst:
> >
> >     """
> >     Generally, work items are not expected to hog a CPU and consume man=
y
> >     cycles. That means maintaining just enough concurrency to prevent
> work
> >     processing from stalling should be optimal.
> >     """
> >
> >     For unbound queues:
> >     """
> >     The responsibility of regulating concurrency level is on the users.
> >     """
> >
> >     Given the unbound queues will be spawned on demand to service all
> >     queued
> >     work items (more interesting when mixing up with the
> >     system_unbound_wq),
> >     in the proposed design the number of instantiated worker threads do=
es
> >     not correspond to the number of user threads (as you have elsewhere
> >     stated), but pessimistically to the number of active user contexts.
> >
> >
> > Those are pretty much the same in practice.  Rather, user threads is
> > typically an upper bound on the number of contexts.  Yes, a single user
> > thread could have a bunch of contexts but basically nothing does that
> > except IGT.  In real-world usage, it's at most one context per user
> thread.
>
> Typically is the key here. But I am not sure it is good enough. Consider
> this example - Intel Flex 170:
>
>   * Delivers up to 36 streams 1080p60 transcode throughput per card.
>   * When scaled to 10 cards in a 4U server configuration, it can support
> up to 360 streams of HEVC/HEVC 1080p60 transcode throughput.
>

I had a feeling it was going to be media.... =F0=9F=98=85


> One transcode stream from my experience typically is 3-4 GPU contexts
> (buffer travels from vcs -> rcs -> vcs, maybe vecs) used from a single
> CPU thread. 4 contexts * 36 streams =3D 144 active contexts. Multiply by
> 60fps =3D 8640 jobs submitted and completed per second.
>
> 144 active contexts in the proposed scheme means possibly means 144
> kernel worker threads spawned (driven by 36 transcode CPU threads). (I
> don't think the pools would scale down given all are constantly pinged
> at 60fps.)
>
> And then each of 144 threads goes to grab the single GuC CT mutex. First
> threads are being made schedulable, then put to sleep as mutex
> contention is hit, then woken again as mutexes are getting released,
> rinse, repeat.
>

Why is every submission grabbing the GuC CT mutex?  I've not read the GuC
back-end yet but I was under the impression that most run_job() would be
just shoving another packet into a ring buffer.  If we have to send the GuC
a message on the control ring every single time we submit a job, that's
pretty horrible.

--Jason


(And yes this backend contention is there regardless of 1:1:1, it would
> require a different re-design to solve that. But it is just a question
> whether there are 144 contending threads, or just 6 with the thread per
> engine class scheme.)
>
> Then multiply all by 10 for a 4U server use case and you get 1440 worker
> kthreads, yes 10 more CT locks, but contending on how many CPU cores?
> Just so they can grab a timeslice and maybe content on a mutex as the
> next step.
>
> This example is where it would hurt on large systems. Imagine only an
> even wider media transcode card...
>
> Second example is only a single engine class used (3d desktop?) but with
> a bunch of not-runnable jobs queued and waiting on a fence to signal.
> Implicit or explicit dependencies doesn't matter. Then the fence signals
> and call backs run. N work items get scheduled, but they all submit to
> the same HW engine. So we end up with:
>
>          /-- wi1 --\
>         / ..     .. \
>   cb --+---  wi.. ---+-- rq1 -- .. -- rqN
>         \ ..    ..  /
>          \-- wiN --/
>
>
> All that we have achieved is waking up N CPUs to contend on the same
> lock and effectively insert the job into the same single HW queue. I
> don't see any positives there.
>
> This example I think can particularly hurt small / low power devices
> because of needless waking up of many cores for no benefit. Granted, I
> don't have a good feel on how common this pattern is in practice.
>
> >
> >     That
> >     is the number which drives the maximum number of not-runnable jobs
> that
> >     can become runnable at once, and hence spawn that many work items,
> and
> >     in turn unbound worker threads.
> >
> >     Several problems there.
> >
> >     It is fundamentally pointless to have potentially that many more
> >     threads
> >     than the number of CPU cores - it simply creates a scheduling storm=
.
> >
> >     Unbound workers have no CPU / cache locality either and no connecti=
on
> >     with the CPU scheduler to optimize scheduling patterns. This may
> matter
> >     either on large systems or on small ones. Whereas the current desig=
n
> >     allows for scheduler to notice userspace CPU thread keeps waking up
> the
> >     same drm scheduler kernel thread, and so it can keep them on the sa=
me
> >     CPU, the unbound workers lose that ability and so 2nd CPU might be
> >     getting woken up from low sleep for every submission.
> >
> >     Hence, apart from being a bit of a impedance mismatch, the proposal
> has
> >     the potential to change performance and power patterns and both lar=
ge
> >     and small machines.
> >
> >
> > Ok, thanks for explaining the issue you're seeing in more detail.  Yes,
> > deferred kwork does appear to mismatch somewhat with what the scheduler
> > needs or at least how it's worked in the past.  How much impact will
> > that mismatch have?  Unclear.
> >
> >      >      >>> Secondly, it probably demands separate workers (not
> >     optional),
> >      >     otherwise
> >      >      >>> behaviour of shared workqueues has either the potential
> to
> >      >     explode number
> >      >      >>> kernel threads anyway, or add latency.
> >      >      >>>
> >      >      >>
> >      >      >> Right now the system_unbound_wq is used which does have =
a
> >     limit
> >      >     on the
> >      >      >> number of threads, right? I do have a FIXME to allow a
> >     worker to be
> >      >      >> passed in similar to TDR.
> >      >      >>
> >      >      >> WRT to latency, the 1:1 ratio could actually have lower
> >     latency
> >      >     as 2 GPU
> >      >      >> schedulers can be pushing jobs into the backend /
> cleaning up
> >      >     jobs in
> >      >      >> parallel.
> >      >      >>
> >      >      >
> >      >      > Thought of one more point here where why in Xe we
> >     absolutely want
> >      >     a 1 to
> >      >      > 1 ratio between entity and scheduler - the way we impleme=
nt
> >      >     timeslicing
> >      >      > for preempt fences.
> >      >      >
> >      >      > Let me try to explain.
> >      >      >
> >      >      > Preempt fences are implemented via the generic messaging
> >      >     interface [1]
> >      >      > with suspend / resume messages. If a suspend messages is
> >     received to
> >      >      > soon after calling resume (this is per entity) we simply
> >     sleep in the
> >      >      > suspend call thus giving the entity a timeslice. This
> >     completely
> >      >     falls
> >      >      > apart with a many to 1 relationship as now a entity
> >     waiting for a
> >      >      > timeslice blocks the other entities. Could we work aroudn
> >     this,
> >      >     sure but
> >      >      > just another bunch of code we'd have to add in Xe. Being =
to
> >      >     freely sleep
> >      >      > in backend without affecting other entities is really,
> really
> >      >     nice IMO
> >      >      > and I bet Xe isn't the only driver that is going to feel
> >     this way.
> >      >      >
> >      >      > Last thing I'll say regardless of how anyone feels about
> >     Xe using
> >      >     a 1 to
> >      >      > 1 relationship this patch IMO makes sense as I hope we ca=
n
> all
> >      >     agree a
> >      >      > workqueue scales better than kthreads.
> >      >
> >      >     I don't know for sure what will scale better and for what us=
e
> >     case,
> >      >     combination of CPU cores vs number of GPU engines to keep
> >     busy vs other
> >      >     system activity. But I wager someone is bound to ask for som=
e
> >      >     numbers to
> >      >     make sure proposal is not negatively affecting any other
> drivers.
> >      >
> >      >
> >      > Then let them ask.  Waving your hands vaguely in the direction o=
f
> >     the
> >      > rest of DRM and saying "Uh, someone (not me) might object" is
> >     profoundly
> >      > unhelpful.  Sure, someone might.  That's why it's on dri-devel.
> >     If you
> >      > think there's someone in particular who might have a useful
> >     opinion on
> >      > this, throw them in the CC so they don't miss the e-mail thread.
> >      >
> >      > Or are you asking for numbers?  If so, what numbers are you
> >     asking for?
> >
> >     It was a heads up to the Xe team in case people weren't appreciatin=
g
> >     how
> >     the proposed change has the potential influence power and performan=
ce
> >     across the board. And nothing in the follow up discussion made me
> think
> >     it was considered so I don't think it was redundant to raise it.
> >
> >     In my experience it is typical that such core changes come with som=
e
> >     numbers. Which is in case of drm scheduler is tricky and probably
> >     requires explicitly asking everyone to test (rather than count on
> >     "don't
> >     miss the email thread"). Real products can fail to ship due ten mW
> here
> >     or there. Like suddenly an extra core prevented from getting into
> deep
> >     sleep.
> >
> >     If that was "profoundly unhelpful" so be it.
> >
> >
> > With your above explanation, it makes more sense what you're asking.
> > It's still not something Matt is likely to be able to provide on his
> > own.  We need to tag some other folks and ask them to test it out.  We
> > could play around a bit with it on Xe but it's not exactly production
> > grade yet and is going to hit this differently from most.  Likely
> > candidates are probably AMD and Freedreno.
>
> Whoever is setup to check out power and performance would be good to
> give it a spin, yes.
>
> PS. I don't think I was asking Matt to test with other devices. To start
> with I think Xe is a team effort. I was asking for more background on
> the design decision since patch 4/20 does not say anything on that
> angle, nor later in the thread it was IMO sufficiently addressed.
>
> >      > Also, If we're talking about a design that might paint us into a=
n
> >      > Intel-HW-specific hole, that would be one thing.  But we're not.
> >     We're
> >      > talking about switching which kernel threading/task mechanism to
> >     use for
> >      > what's really a very generic problem.  The core Xe design works
> >     without
> >      > this patch (just with more kthreads).  If we land this patch or
> >      > something like it and get it wrong and it causes a performance
> >     problem
> >      > for someone down the line, we can revisit it.
> >
> >     For some definition of "it works" - I really wouldn't suggest
> >     shipping a
> >     kthread per user context at any point.
> >
> >
> > You have yet to elaborate on why. What resources is it consuming that's
> > going to be a problem? Are you anticipating CPU affinity problems? Or
> > does it just seem wasteful?
>
> Well I don't know, commit message says the approach does not scale. :)
>
> > I think I largely agree that it's probably unnecessary/wasteful but
> > reducing the number of kthreads seems like a tractable problem to solve
> > regardless of where we put the gpu_scheduler object.  Is this the right
> > solution?  Maybe not.  It was also proposed at one point that we could
> > split the scheduler into two pieces: A scheduler which owns the kthread=
,
> > and a back-end which targets some HW ring thing where you can have
> > multiple back-ends per scheduler.  That's certainly more invasive from =
a
> > DRM scheduler internal API PoV but would solve the kthread problem in a
> > way that's more similar to what we have now.
> >
> >      >     In any case that's a low level question caused by the high
> >     level design
> >      >     decision. So I'd think first focus on the high level - which
> >     is the 1:1
> >      >     mapping of entity to scheduler instance proposal.
> >      >
> >      >     Fundamentally it will be up to the DRM maintainers and the
> >     community to
> >      >     bless your approach. And it is important to stress 1:1 is
> about
> >      >     userspace contexts, so I believe unlike any other current
> >     scheduler
> >      >     user. And also important to stress this effectively does not
> >     make Xe
> >      >     _really_ use the scheduler that much.
> >      >
> >      >
> >      > I don't think this makes Xe nearly as much of a one-off as you
> >     think it
> >      > does.  I've already told the Asahi team working on Apple M1/2
> >     hardware
> >      > to do it this way and it seems to be a pretty good mapping for
> >     them. I
> >      > believe this is roughly the plan for nouveau as well.  It's not
> >     the way
> >      > it currently works for anyone because most other groups aren't
> >     doing FW
> >      > scheduling yet.  In the world of FW scheduling and hardware
> >     designed to
> >      > support userspace direct-to-FW submit, I think the design makes
> >     perfect
> >      > sense (see below) and I expect we'll see more drivers move in th=
is
> >      > direction as those drivers evolve.  (AMD is doing some customish
> >     thing
> >      > for how with gpu_scheduler on the front-end somehow. I've not du=
g
> >     into
> >      > those details.)
> >      >
> >      >     I can only offer my opinion, which is that the two options
> >     mentioned in
> >      >     this thread (either improve drm scheduler to cope with what =
is
> >      >     required,
> >      >     or split up the code so you can use just the parts of
> >     drm_sched which
> >      >     you want - which is frontend dependency tracking) shouldn't
> be so
> >      >     readily dismissed, given how I think the idea was for the ne=
w
> >     driver to
> >      >     work less in a silo and more in the community (not do kludge=
s
> to
> >      >     workaround stuff because it is thought to be too hard to
> >     improve common
> >      >     code), but fundamentally, "goto previous paragraph" for what
> I am
> >      >     concerned.
> >      >
> >      >
> >      > Meta comment:  It appears as if you're falling into the standard
> >     i915
> >      > team trap of having an internal discussion about what the
> community
> >      > discussion might look like instead of actually having the
> community
> >      > discussion.  If you are seriously concerned about interactions
> with
> >      > other drivers or whether or setting common direction, the right
> >     way to
> >      > do that is to break a patch or two out into a separate RFC serie=
s
> >     and
> >      > tag a handful of driver maintainers.  Trying to predict the
> >     questions
> >      > other people might ask is pointless. Cc them and asking for thei=
r
> >     input
> >      > instead.
> >
> >     I don't follow you here. It's not an internal discussion - I am
> raising
> >     my concerns on the design publicly. I am supposed to write a patch =
to
> >     show something, but am allowed to comment on a RFC series?
> >
> >
> > I may have misread your tone a bit.  It felt a bit like too many
> > discussions I've had in the past where people are trying to predict wha=
t
> > others will say instead of just asking them.  Reading it again, I was
> > probably jumping to conclusions a bit.  Sorry about that.
>
> Okay no problem, thanks. In any case we don't have to keep discussing
> it, since I wrote one or two emails ago it is fundamentally on the
> maintainers and community to ack the approach. I only felt like RFC did
> not explain the potential downsides sufficiently so I wanted to probe
> that area a bit.
>
> >     It is "drm/sched: Convert drm scheduler to use a work queue rather
> than
> >     kthread" which should have Cc-ed _everyone_ who use drm scheduler.
> >
> >
> > Yeah, it probably should have.  I think that's mostly what I've been
> > trying to say.
> >
> >      >
> >      >     Regards,
> >      >
> >      >     Tvrtko
> >      >
> >      >     P.S. And as a related side note, there are more areas where
> >     drm_sched
> >      >     could be improved, like for instance priority handling.
> >      >     Take a look at msm_submitqueue_create /
> >     msm_gpu_convert_priority /
> >      >     get_sched_entity to see how msm works around the drm_sched
> >     hardcoded
> >      >     limit of available priority levels, in order to avoid having
> >     to leave a
> >      >     hw capability unused. I suspect msm would be happier if they
> >     could have
> >      >     all priority levels equal in terms of whether they apply onl=
y
> >     at the
> >      >     frontend level or completely throughout the pipeline.
> >      >
> >      >      > [1]
> >      >
> >     https://patchwork.freedesktop.org/patch/515857/?series=3D112189&rev=
=3D1
> >     <https://patchwork.freedesktop.org/patch/515857/?series=3D112189&re=
v=3D1
> >
> >      >
> >       <
> https://patchwork.freedesktop.org/patch/515857/?series=3D112189&rev=3D1 <
> https://patchwork.freedesktop.org/patch/515857/?series=3D112189&rev=3D1>>
> >      >      >
> >      >      >>> What would be interesting to learn is whether the optio=
n
> of
> >      >     refactoring
> >      >      >>> drm_sched to deal with out of order completion was
> >     considered
> >      >     and what were
> >      >      >>> the conclusions.
> >      >      >>>
> >      >      >>
> >      >      >> I coded this up a while back when trying to convert the
> >     i915 to
> >      >     the DRM
> >      >      >> scheduler it isn't all that hard either. The free flow
> >     control
> >      >     on the
> >      >      >> ring (e.g. set job limit =3D=3D SIZE OF RING / MAX JOB S=
IZE)
> is
> >      >     really what
> >      >      >> sold me on the this design.
> >      >
> >      >
> >      > You're not the only one to suggest supporting out-of-order
> >     completion.
> >      > However, it's tricky and breaks a lot of internal assumptions of
> the
> >      > scheduler. It also reduces functionality a bit because it can no
> >     longer
> >      > automatically rate-limit HW/FW queues which are often
> >     fixed-size.  (Ok,
> >      > yes, it probably could but it becomes a substantially harder
> >     problem.)
> >      >
> >      > It also seems like a worse mapping to me.  The goal here is to
> turn
> >      > submissions on a userspace-facing engine/queue into submissions
> >     to a FW
> >      > queue submissions, sorting out any dma_fence dependencies.  Matt=
's
> >      > description of saying this is a 1:1 mapping between sched/entity
> >     doesn't
> >      > tell the whole story. It's a 1:1:1 mapping between xe_engine,
> >      > gpu_scheduler, and GuC FW engine.  Why make it a 1:something:1
> >     mapping?
> >      > Why is that better?
> >
> >     As I have stated before, what I think what would fit well for Xe is
> one
> >     drm_scheduler per engine class. In specific terms on our current
> >     hardware, one drm scheduler instance for render, compute, blitter,
> >     video
> >     and video enhance. Userspace contexts remain scheduler entities.
> >
> >
> > And this is where we fairly strongly disagree.  More in a bit.
> >
> >     That way you avoid the whole kthread/kworker story and you have it
> >     actually use the entity picking code in the scheduler, which may be
> >     useful when the backend is congested.
> >
> >
> > What back-end congestion are you referring to here?  Running out of FW
> > queue IDs?  Something else?
>
> CT channel, number of context ids.
>
> >
> >     Yes you have to solve the out of order problem so in my mind that i=
s
> >     something to discuss. What the problem actually is (just TDR?), how
> >     tricky and why etc.
> >
> >     And yes you lose the handy LRCA ring buffer size management so you'=
d
> >     have to make those entities not runnable in some other way.
> >
> >     Regarding the argument you raise below - would any of that make the
> >     frontend / backend separation worse and why? Do you think it is les=
s
> >     natural? If neither is true then all remains is that it appears ext=
ra
> >     work to support out of order completion of entities has been
> discounted
> >     in favour of an easy but IMO inelegant option.
> >
> >
> > Broadly speaking, the kernel needs to stop thinking about GPU schedulin=
g
> > in terms of scheduling jobs and start thinking in terms of scheduling
> > contexts/engines.  There is still some need for scheduling individual
> > jobs but that is only for the purpose of delaying them as needed to
> > resolve dma_fence dependencies.  Once dependencies are resolved, they
> > get shoved onto the context/engine queue and from there the kernel only
> > really manages whole contexts/engines.  This is a major architectural
> > shift, entirely different from the way i915 scheduling works.  It's als=
o
> > different from the historical usage of DRM scheduler which I think is
> > why this all looks a bit funny.
> >
> > To justify this architectural shift, let's look at where we're headed.
> > In the glorious future...
> >
> >   1. Userspace submits directly to firmware queues.  The kernel has no
> > visibility whatsoever into individual jobs.  At most it can pause/resum=
e
> > FW contexts as needed to handle eviction and memory management.
> >
> >   2. Because of 1, apart from handing out the FW queue IDs at the
> > beginning, the kernel can't really juggle them that much.  Depending on
> > FW design, it may be able to pause a client, give its IDs to another,
> > and then resume it later when IDs free up.  What it's not doing is
> > juggling IDs on a job-by-job basis like i915 currently is.
> >
> >   3. Long-running compute jobs may not complete for days.  This means
> > that memory management needs to happen in terms of pause/resume of
> > entire contexts/engines using the memory rather than based on waiting
> > for individual jobs to complete or pausing individual jobs until the
> > memory is available.
> >
> >   4. Synchronization happens via userspace memory fences (UMF) and the
> > kernel is mostly unaware of most dependencies and when a context/engine
> > is or is not runnable.  Instead, it keeps as many of them minimally
> > active (memory is available, even if it's in system RAM) as possible an=
d
> > lets the FW sort out dependencies.  (There may need to be some facility
> > for sleeping a context until a memory change similar to futex() or
> > poll() for userspace threads.  There are some details TBD.)
> >
> > Are there potential problems that will need to be solved here?  Yes.  I=
s
> > it a good design?  Well, Microsoft has been living in this future for
> > half a decade or better and it's working quite well for them.  It's als=
o
> > the way all modern game consoles work.  It really is just Linux that's
> > stuck with the same old job model we've had since the monumental shift
> > to DRI2.
> >
> > To that end, one of the core goals of the Xe project was to make the
> > driver internally behave as close to the above model as possible while
> > keeping the old-school job model as a very thin layer on top.  As the
> > broader ecosystem problems (window-system support for UMF, for instance=
)
> > are solved, that layer can be peeled back.  The core driver will alread=
y
> > be ready for it.
> >
> > To that end, the point of the DRM scheduler in Xe isn't to schedule
> > jobs.  It's to resolve syncobj and dma-buf implicit sync dependencies
> > and stuff jobs into their respective context/engine queue once they're
> > ready.  All the actual scheduling happens in firmware and any schedulin=
g
> > the kernel does to deal with contention, oversubscriptions, too many
> > contexts, etc. is between contexts/engines, not individual jobs.  Sure,
> > the individual job visibility is nice, but if we design around it, we'l=
l
> > never get to the glorious future.
> >
> > I really need to turn the above (with a bit more detail) into a blog
> > post.... Maybe I'll do that this week.
> >
> > In any case, I hope that provides more insight into why Xe is designed
> > the way it is and why I'm pushing back so hard on trying to make it mor=
e
> > of a "classic" driver as far as scheduling is concerned.  Are there
> > potential problems here?  Yes, that's why Xe has been labeled a
> > prototype.  Are such radical changes necessary to get to said glorious
> > future?  Yes, I think they are.  Will it be worth it?  I believe so.
>
> Right, that's all solid I think. My takeaway is that frontend priority
> sorting and that stuff isn't needed and that is okay. And that there are
> multiple options to maybe improve drm scheduler, like the fore mentioned
> making it deal with out of order, or split into functional components,
> or split frontend/backend what you suggested. For most of them cost vs
> benefit is more or less not completely clear, neither how much effort
> was invested to look into them.
>
> One thing I missed from this explanation is how drm_scheduler per engine
> class interferes with the high level concepts. And I did not manage to
> pick up on what exactly is the TDR problem in that case. Maybe the two
> are one and the same.
>
> Bottom line is I still have the concern that conversion to kworkers has
> an opportunity to regress. Possibly more opportunity for some Xe use
> cases than to affect other vendors, since they would still be using per
> physical engine / queue scheduler instances.
>
> And to put my money where my mouth is I will try to put testing Xe
> inside the full blown ChromeOS environment in my team plans. It would
> probably also be beneficial if Xe team could take a look at real world
> behaviour of the extreme transcode use cases too. If the stack is ready
> for that and all. It would be better to know earlier rather than later
> if there is a fundamental issue.
>
> For the patch at hand, and the cover letter, it certainly feels it would
> benefit to record the past design discussion had with AMD folks, to
> explicitly copy other drivers, and to record the theoretical pros and
> cons of threads vs unbound workers as I have tried to highlight them.
>
> Regards,
>
> Tvrtko
>

--00000000000058d23005f204602f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Jan 11, 2023 at 2:50 AM Tvrtko Ursulin &lt;<a href=3D"mailto=
:tvrtko.ursulin@linux.intel.com">tvrtko.ursulin@linux.intel.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 10/01/2023 14:08, Jason Ekstrand wrote:<br>
&gt; On Tue, Jan 10, 2023 at 5:28 AM Tvrtko Ursulin <br>
&gt; &lt;<a href=3D"mailto:tvrtko.ursulin@linux.intel.com" target=3D"_blank=
">tvrtko.ursulin@linux.intel.com</a> &lt;mailto:<a href=3D"mailto:tvrtko.ur=
sulin@linux.intel.com" target=3D"_blank">tvrtko.ursulin@linux.intel.com</a>=
&gt;&gt; <br>
&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 09/01/2023 17:27, Jason Ekstrand wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0[snip]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; AFAICT it pr=
oposes to have 1:1 between *userspace* created<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0contexts (per<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; context _and=
_ engine) and drm_sched. I am not sure avoiding<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0invasive changes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; to the share=
d code is in the spirit of the overall idea<br>
&gt;=C2=A0 =C2=A0 =C2=A0and instead<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; opportunity =
should be used to look at way to<br>
&gt;=C2=A0 =C2=A0 =C2=A0refactor/improve<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0drm_sched.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Maybe?=C2=A0 I&#39;m not convinced that what =
Xe is doing is an abuse at<br>
&gt;=C2=A0 =C2=A0 =C2=A0all or<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; really needs to drive a re-factor.=C2=A0 (Mor=
e on that later.) <br>
&gt;=C2=A0 =C2=A0 =C2=A0There&#39;s only<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; one real issue which is that it fires off pot=
entially a lot of<br>
&gt;=C2=A0 =C2=A0 =C2=A0kthreads.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Even that&#39;s not that bad given that kthre=
ads are pretty light and<br>
&gt;=C2=A0 =C2=A0 =C2=A0you&#39;re<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; not likely to have more kthreads than userspa=
ce threads which are<br>
&gt;=C2=A0 =C2=A0 =C2=A0much<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; heavier.=C2=A0 Not ideal, but not the end of =
the world either. <br>
&gt;=C2=A0 =C2=A0 =C2=A0Definitely<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; something we can/should optimize but if we we=
nt through with Xe<br>
&gt;=C2=A0 =C2=A0 =C2=A0without<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; this patch, it would probably be mostly ok.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Yes, it is 1:1 *=
userspace* engines and drm_sched.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; I&#39;m not real=
ly prepared to make large changes to DRM<br>
&gt;=C2=A0 =C2=A0 =C2=A0scheduler<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0at the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; moment for Xe as=
 they are not really required nor does Boris<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0seem they<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; will be required=
 for his work either. I am interested to see<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0what Boris<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; comes up with.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Even on the =
low level, the idea to replace drm_sched threads<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0with workers<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; has a few pr=
oblems.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; To start wit=
h, the pattern of:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0=
 while (not_stopped) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0keep picking jobs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0=
 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Feels fundam=
entally in disagreement with workers (while<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0obviously fits<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; perfectly wi=
th the current kthread design).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; The while loop b=
reaks and worker exists if no jobs are ready.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I&#39;m not very familiar with workqueues. Wh=
at are you saying would fit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; better? One scheduling job per work item rath=
er than one big work<br>
&gt;=C2=A0 =C2=A0 =C2=A0item<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; which handles all available jobs?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Yes and no, it indeed IMO does not fit to have a wo=
rk item which is<br>
&gt;=C2=A0 =C2=A0 =C2=A0potentially unbound in runtime. But it is a bit moo=
t conceptual<br>
&gt;=C2=A0 =C2=A0 =C2=A0mismatch<br>
&gt;=C2=A0 =C2=A0 =C2=A0because it is a worst case / theoretical, and I thi=
nk due more<br>
&gt;=C2=A0 =C2=A0 =C2=A0fundamental concerns.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0If we have to go back to the low level side of thin=
gs, I&#39;ve picked this<br>
&gt;=C2=A0 =C2=A0 =C2=A0random spot to consolidate what I have already ment=
ioned and perhaps<br>
&gt;=C2=A0 =C2=A0 =C2=A0expand.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0To start with, let me pull out some thoughts from w=
orkqueue.rst:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Generally, work items are not expected to hog a CPU=
 and consume many<br>
&gt;=C2=A0 =C2=A0 =C2=A0cycles. That means maintaining just enough concurre=
ncy to prevent work<br>
&gt;=C2=A0 =C2=A0 =C2=A0processing from stalling should be optimal.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0For unbound queues:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0The responsibility of regulating concurrency level =
is on the users.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Given the unbound queues will be spawned on demand =
to service all<br>
&gt;=C2=A0 =C2=A0 =C2=A0queued<br>
&gt;=C2=A0 =C2=A0 =C2=A0work items (more interesting when mixing up with th=
e<br>
&gt;=C2=A0 =C2=A0 =C2=A0system_unbound_wq),<br>
&gt;=C2=A0 =C2=A0 =C2=A0in the proposed design the number of instantiated w=
orker threads does<br>
&gt;=C2=A0 =C2=A0 =C2=A0not correspond to the number of user threads (as yo=
u have elsewhere<br>
&gt;=C2=A0 =C2=A0 =C2=A0stated), but pessimistically to the number of activ=
e user contexts.<br>
&gt; <br>
&gt; <br>
&gt; Those are pretty much the same in practice.=C2=A0 Rather, user threads=
 is <br>
&gt; typically an upper bound on the number of contexts.=C2=A0 Yes, a singl=
e user <br>
&gt; thread could have a bunch of contexts but basically nothing does that =
<br>
&gt; except IGT.=C2=A0 In real-world usage, it&#39;s at most one context pe=
r user thread.<br>
<br>
Typically is the key here. But I am not sure it is good enough. Consider <b=
r>
this example - Intel Flex 170:<br>
<br>
=C2=A0 * Delivers up to 36 streams 1080p60 transcode throughput per card.<b=
r>
=C2=A0 * When scaled to 10 cards in a 4U server configuration, it can suppo=
rt <br>
up to 360 streams of HEVC/HEVC 1080p60 transcode throughput.<br></blockquot=
e><div><br></div><div>I had a feeling it was going to be media.... =F0=9F=
=98=85<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
One transcode stream from my experience typically is 3-4 GPU contexts <br>
(buffer travels from vcs -&gt; rcs -&gt; vcs, maybe vecs) used from a singl=
e <br>
CPU thread. 4 contexts * 36 streams =3D 144 active contexts. Multiply by <b=
r>
60fps =3D 8640 jobs submitted and completed per second.<br>
<br>
144 active contexts in the proposed scheme means possibly means 144 <br>
kernel worker threads spawned (driven by 36 transcode CPU threads). (I <br>
don&#39;t think the pools would scale down given all are constantly pinged =
<br>
at 60fps.)<br>
<br>
And then each of 144 threads goes to grab the single GuC CT mutex. First <b=
r>
threads are being made schedulable, then put to sleep as mutex <br>
contention is hit, then woken again as mutexes are getting released, <br>
rinse, repeat.<br></blockquote><div><br></div><div>Why is every submission =
grabbing the GuC CT mutex?=C2=A0 I&#39;ve not read the GuC back-end yet but=
 I was under the impression that most run_job() would be just shoving anoth=
er packet into a ring buffer.=C2=A0 If we have to send the GuC a message on=
 the control ring every single time we submit a job, that&#39;s pretty horr=
ible.</div><div><br></div><div>--Jason</div><div><br></div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
(And yes this backend contention is there regardless of 1:1:1, it would <br=
>
require a different re-design to solve that. But it is just a question <br>
whether there are 144 contending threads, or just 6 with the thread per <br=
>
engine class scheme.)<br>
<br>
Then multiply all by 10 for a 4U server use case and you get 1440 worker <b=
r>
kthreads, yes 10 more CT locks, but contending on how many CPU cores? <br>
Just so they can grab a timeslice and maybe content on a mutex as the <br>
next step.<br>
<br>
This example is where it would hurt on large systems. Imagine only an <br>
even wider media transcode card...<br>
<br>
Second example is only a single engine class used (3d desktop?) but with <b=
r>
a bunch of not-runnable jobs queued and waiting on a fence to signal. <br>
Implicit or explicit dependencies doesn&#39;t matter. Then the fence signal=
s <br>
and call backs run. N work items get scheduled, but they all submit to <br>
the same HW engine. So we end up with:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/-- wi1 --\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 / ..=C2=A0 =C2=A0 =C2=A0.. \<br>
=C2=A0 cb --+---=C2=A0 wi.. ---+-- rq1 -- .. -- rqN<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \ ..=C2=A0 =C2=A0 ..=C2=A0 /<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\-- wiN --/<br>
<br>
<br>
All that we have achieved is waking up N CPUs to contend on the same <br>
lock and effectively insert the job into the same single HW queue. I <br>
don&#39;t see any positives there.<br>
<br>
This example I think can particularly hurt small / low power devices <br>
because of needless waking up of many cores for no benefit. Granted, I <br>
don&#39;t have a good feel on how common this pattern is in practice.<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0That<br>
&gt;=C2=A0 =C2=A0 =C2=A0is the number which drives the maximum number of no=
t-runnable jobs that<br>
&gt;=C2=A0 =C2=A0 =C2=A0can become runnable at once, and hence spawn that m=
any work items, and<br>
&gt;=C2=A0 =C2=A0 =C2=A0in turn unbound worker threads.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Several problems there.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0It is fundamentally pointless to have potentially t=
hat many more<br>
&gt;=C2=A0 =C2=A0 =C2=A0threads<br>
&gt;=C2=A0 =C2=A0 =C2=A0than the number of CPU cores - it simply creates a =
scheduling storm.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Unbound workers have no CPU / cache locality either=
 and no connection<br>
&gt;=C2=A0 =C2=A0 =C2=A0with the CPU scheduler to optimize scheduling patte=
rns. This may matter<br>
&gt;=C2=A0 =C2=A0 =C2=A0either on large systems or on small ones. Whereas t=
he current design<br>
&gt;=C2=A0 =C2=A0 =C2=A0allows for scheduler to notice userspace CPU thread=
 keeps waking up the<br>
&gt;=C2=A0 =C2=A0 =C2=A0same drm scheduler kernel thread, and so it can kee=
p them on the same<br>
&gt;=C2=A0 =C2=A0 =C2=A0CPU, the unbound workers lose that ability and so 2=
nd CPU might be<br>
&gt;=C2=A0 =C2=A0 =C2=A0getting woken up from low sleep for every submissio=
n.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hence, apart from being a bit of a impedance mismat=
ch, the proposal has<br>
&gt;=C2=A0 =C2=A0 =C2=A0the potential to change performance and power patte=
rns and both large<br>
&gt;=C2=A0 =C2=A0 =C2=A0and small machines.<br>
&gt; <br>
&gt; <br>
&gt; Ok, thanks for explaining the issue you&#39;re seeing in more detail.=
=C2=A0 Yes, <br>
&gt; deferred kwork does appear to mismatch somewhat with what the schedule=
r <br>
&gt; needs or at least how it&#39;s worked in the past.=C2=A0 How much impa=
ct will <br>
&gt; that mismatch have?=C2=A0 Unclear.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Secondly, it=
 probably demands separate workers (not<br>
&gt;=C2=A0 =C2=A0 =C2=A0optional),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0otherwise<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; behaviour of=
 shared workqueues has either the potential to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0explode number<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; kernel threa=
ds anyway, or add latency.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Right now the sy=
stem_unbound_wq is used which does have a<br>
&gt;=C2=A0 =C2=A0 =C2=A0limit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0on the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; number of thread=
s, right? I do have a FIXME to allow a<br>
&gt;=C2=A0 =C2=A0 =C2=A0worker to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; passed in simila=
r to TDR.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; WRT to latency, =
the 1:1 ratio could actually have lower<br>
&gt;=C2=A0 =C2=A0 =C2=A0latency<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0as 2 GPU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; schedulers can b=
e pushing jobs into the backend / cleaning up<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0jobs in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; parallel.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Thought of one more =
point here where why in Xe we<br>
&gt;=C2=A0 =C2=A0 =C2=A0absolutely want<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0a 1 to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; 1 ratio between enti=
ty and scheduler - the way we implement<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0timeslicing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; for preempt fences.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Let me try to explai=
n.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Preempt fences are i=
mplemented via the generic messaging<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0interface [1]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; with suspend / resum=
e messages. If a suspend messages is<br>
&gt;=C2=A0 =C2=A0 =C2=A0received to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; soon after calling r=
esume (this is per entity) we simply<br>
&gt;=C2=A0 =C2=A0 =C2=A0sleep in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; suspend call thus gi=
ving the entity a timeslice. This<br>
&gt;=C2=A0 =C2=A0 =C2=A0completely<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0falls<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; apart with a many to=
 1 relationship as now a entity<br>
&gt;=C2=A0 =C2=A0 =C2=A0waiting for a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; timeslice blocks the=
 other entities. Could we work aroudn<br>
&gt;=C2=A0 =C2=A0 =C2=A0this,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0sure but<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; just another bunch o=
f code we&#39;d have to add in Xe. Being to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0freely sleep<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; in backend without a=
ffecting other entities is really, really<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0nice IMO<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; and I bet Xe isn&#39=
;t the only driver that is going to feel<br>
&gt;=C2=A0 =C2=A0 =C2=A0this way.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Last thing I&#39;ll =
say regardless of how anyone feels about<br>
&gt;=C2=A0 =C2=A0 =C2=A0Xe using<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0a 1 to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; 1 relationship this =
patch IMO makes sense as I hope we can all<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0agree a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; workqueue scales bet=
ter than kthreads.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0I don&#39;t know for sure =
what will scale better and for what use<br>
&gt;=C2=A0 =C2=A0 =C2=A0case,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0combination of CPU cores v=
s number of GPU engines to keep<br>
&gt;=C2=A0 =C2=A0 =C2=A0busy vs other<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0system activity. But I wag=
er someone is bound to ask for some<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0numbers to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0make sure proposal is not =
negatively affecting any other drivers.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Then let them ask.=C2=A0 Waving your hands va=
guely in the direction of<br>
&gt;=C2=A0 =C2=A0 =C2=A0the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; rest of DRM and saying &quot;Uh, someone (not=
 me) might object&quot; is<br>
&gt;=C2=A0 =C2=A0 =C2=A0profoundly<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; unhelpful.=C2=A0 Sure, someone might.=C2=A0 T=
hat&#39;s why it&#39;s on dri-devel. <br>
&gt;=C2=A0 =C2=A0 =C2=A0If you<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; think there&#39;s someone in particular who m=
ight have a useful<br>
&gt;=C2=A0 =C2=A0 =C2=A0opinion on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; this, throw them in the CC so they don&#39;t =
miss the e-mail thread.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Or are you asking for numbers?=C2=A0 If so, w=
hat numbers are you<br>
&gt;=C2=A0 =C2=A0 =C2=A0asking for?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0It was a heads up to the Xe team in case people wer=
en&#39;t appreciating<br>
&gt;=C2=A0 =C2=A0 =C2=A0how<br>
&gt;=C2=A0 =C2=A0 =C2=A0the proposed change has the potential influence pow=
er and performance<br>
&gt;=C2=A0 =C2=A0 =C2=A0across the board. And nothing in the follow up disc=
ussion made me think<br>
&gt;=C2=A0 =C2=A0 =C2=A0it was considered so I don&#39;t think it was redun=
dant to raise it.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0In my experience it is typical that such core chang=
es come with some<br>
&gt;=C2=A0 =C2=A0 =C2=A0numbers. Which is in case of drm scheduler is trick=
y and probably<br>
&gt;=C2=A0 =C2=A0 =C2=A0requires explicitly asking everyone to test (rather=
 than count on<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;don&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0miss the email thread&quot;). Real products can fai=
l to ship due ten mW here<br>
&gt;=C2=A0 =C2=A0 =C2=A0or there. Like suddenly an extra core prevented fro=
m getting into deep<br>
&gt;=C2=A0 =C2=A0 =C2=A0sleep.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0If that was &quot;profoundly unhelpful&quot; so be =
it.<br>
&gt; <br>
&gt; <br>
&gt; With your above explanation, it makes more sense what you&#39;re askin=
g.=C2=A0 <br>
&gt; It&#39;s still not something Matt is likely to be able to provide on h=
is <br>
&gt; own.=C2=A0 We need to tag some other folks and ask them to test it out=
.=C2=A0 We <br>
&gt; could play around a bit with it on Xe but it&#39;s not exactly product=
ion <br>
&gt; grade yet and is going to hit this differently from most.=C2=A0 Likely=
 <br>
&gt; candidates are probably AMD and Freedreno.<br>
<br>
Whoever is setup to check out power and performance would be good to <br>
give it a spin, yes.<br>
<br>
PS. I don&#39;t think I was asking Matt to test with other devices. To star=
t <br>
with I think Xe is a team effort. I was asking for more background on <br>
the design decision since patch 4/20 does not say anything on that <br>
angle, nor later in the thread it was IMO sufficiently addressed.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Also, If we&#39;re talking about a design tha=
t might paint us into an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Intel-HW-specific hole, that would be one thi=
ng.=C2=A0 But we&#39;re not. <br>
&gt;=C2=A0 =C2=A0 =C2=A0We&#39;re<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; talking about switching which kernel threadin=
g/task mechanism to<br>
&gt;=C2=A0 =C2=A0 =C2=A0use for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; what&#39;s really a very generic problem.=C2=
=A0 The core Xe design works<br>
&gt;=C2=A0 =C2=A0 =C2=A0without<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; this patch (just with more kthreads).=C2=A0 I=
f we land this patch or<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; something like it and get it wrong and it cau=
ses a performance<br>
&gt;=C2=A0 =C2=A0 =C2=A0problem<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; for someone down the line, we can revisit it.=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0For some definition of &quot;it works&quot; - I rea=
lly wouldn&#39;t suggest<br>
&gt;=C2=A0 =C2=A0 =C2=A0shipping a<br>
&gt;=C2=A0 =C2=A0 =C2=A0kthread per user context at any point.<br>
&gt; <br>
&gt; <br>
&gt; You have yet to elaborate on why. What resources is it consuming that&=
#39;s <br>
&gt; going to be a problem? Are you anticipating CPU affinity problems? Or =
<br>
&gt; does it just seem wasteful?<br>
<br>
Well I don&#39;t know, commit message says the approach does not scale. :)<=
br>
<br>
&gt; I think I largely agree that it&#39;s probably unnecessary/wasteful bu=
t <br>
&gt; reducing the number of kthreads seems like a tractable problem to solv=
e <br>
&gt; regardless of where we put the gpu_scheduler object.=C2=A0 Is this the=
 right <br>
&gt; solution?=C2=A0 Maybe not.=C2=A0 It was also proposed at one point tha=
t we could <br>
&gt; split the scheduler into two pieces: A scheduler which owns the kthrea=
d, <br>
&gt; and a back-end which targets some HW ring thing where you can have <br=
>
&gt; multiple back-ends per scheduler.=C2=A0 That&#39;s certainly more inva=
sive from a <br>
&gt; DRM scheduler internal API PoV but would solve the kthread problem in =
a <br>
&gt; way that&#39;s more similar to what we have now.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0In any case that&#39;s a l=
ow level question caused by the high<br>
&gt;=C2=A0 =C2=A0 =C2=A0level design<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0decision. So I&#39;d think=
 first focus on the high level - which<br>
&gt;=C2=A0 =C2=A0 =C2=A0is the 1:1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0mapping of entity to sched=
uler instance proposal.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Fundamentally it will be u=
p to the DRM maintainers and the<br>
&gt;=C2=A0 =C2=A0 =C2=A0community to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0bless your approach. And i=
t is important to stress 1:1 is about<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0userspace contexts, so I b=
elieve unlike any other current<br>
&gt;=C2=A0 =C2=A0 =C2=A0scheduler<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0user. And also important t=
o stress this effectively does not<br>
&gt;=C2=A0 =C2=A0 =C2=A0make Xe<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0_really_ use the scheduler=
 that much.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I don&#39;t think this makes Xe nearly as muc=
h of a one-off as you<br>
&gt;=C2=A0 =C2=A0 =C2=A0think it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; does.=C2=A0 I&#39;ve already told the Asahi t=
eam working on Apple M1/2<br>
&gt;=C2=A0 =C2=A0 =C2=A0hardware<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; to do it this way and it seems to be a pretty=
 good mapping for<br>
&gt;=C2=A0 =C2=A0 =C2=A0them. I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; believe this is roughly the plan for nouveau =
as well.=C2=A0 It&#39;s not<br>
&gt;=C2=A0 =C2=A0 =C2=A0the way<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; it currently works for anyone because most ot=
her groups aren&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0doing FW<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; scheduling yet.=C2=A0 In the world of FW sche=
duling and hardware<br>
&gt;=C2=A0 =C2=A0 =C2=A0designed to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; support userspace direct-to-FW submit, I thin=
k the design makes<br>
&gt;=C2=A0 =C2=A0 =C2=A0perfect<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; sense (see below) and I expect we&#39;ll see =
more drivers move in this<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; direction as those drivers evolve.=C2=A0 (AMD=
 is doing some customish<br>
&gt;=C2=A0 =C2=A0 =C2=A0thing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; for how with gpu_scheduler on the front-end s=
omehow. I&#39;ve not dug<br>
&gt;=C2=A0 =C2=A0 =C2=A0into<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; those details.)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0I can only offer my opinio=
n, which is that the two options<br>
&gt;=C2=A0 =C2=A0 =C2=A0mentioned in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0this thread (either improv=
e drm scheduler to cope with what is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0required,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0or split up the code so yo=
u can use just the parts of<br>
&gt;=C2=A0 =C2=A0 =C2=A0drm_sched which<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0you want - which is fronte=
nd dependency tracking) shouldn&#39;t be so<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0readily dismissed, given h=
ow I think the idea was for the new<br>
&gt;=C2=A0 =C2=A0 =C2=A0driver to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0work less in a silo and mo=
re in the community (not do kludges to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0workaround stuff because i=
t is thought to be too hard to<br>
&gt;=C2=A0 =C2=A0 =C2=A0improve common<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0code), but fundamentally, =
&quot;goto previous paragraph&quot; for what I am<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0concerned.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Meta comment:=C2=A0 It appears as if you&#39;=
re falling into the standard<br>
&gt;=C2=A0 =C2=A0 =C2=A0i915<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; team trap of having an internal discussion ab=
out what the community<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; discussion might look like instead of actuall=
y having the community<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; discussion.=C2=A0 If you are seriously concer=
ned about interactions with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; other drivers or whether or setting common di=
rection, the right<br>
&gt;=C2=A0 =C2=A0 =C2=A0way to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; do that is to break a patch or two out into a=
 separate RFC series<br>
&gt;=C2=A0 =C2=A0 =C2=A0and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; tag a handful of driver maintainers.=C2=A0 Tr=
ying to predict the<br>
&gt;=C2=A0 =C2=A0 =C2=A0questions<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; other people might ask is pointless. Cc them =
and asking for their<br>
&gt;=C2=A0 =C2=A0 =C2=A0input<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; instead.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I don&#39;t follow you here. It&#39;s not an intern=
al discussion - I am raising<br>
&gt;=C2=A0 =C2=A0 =C2=A0my concerns on the design publicly. I am supposed t=
o write a patch to<br>
&gt;=C2=A0 =C2=A0 =C2=A0show something, but am allowed to comment on a RFC =
series?<br>
&gt; <br>
&gt; <br>
&gt; I may have misread your tone a bit.=C2=A0 It felt a bit like too many =
<br>
&gt; discussions I&#39;ve had in the past where people are trying to predic=
t what <br>
&gt; others will say instead of just asking them.=C2=A0 Reading it again, I=
 was <br>
&gt; probably jumping to conclusions a bit.=C2=A0 Sorry about that.<br>
<br>
Okay no problem, thanks. In any case we don&#39;t have to keep discussing <=
br>
it, since I wrote one or two emails ago it is fundamentally on the <br>
maintainers and community to ack the approach. I only felt like RFC did <br=
>
not explain the potential downsides sufficiently so I wanted to probe <br>
that area a bit.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0It is &quot;drm/sched: Convert drm scheduler to use=
 a work queue rather than<br>
&gt;=C2=A0 =C2=A0 =C2=A0kthread&quot; which should have Cc-ed _everyone_ wh=
o use drm scheduler.<br>
&gt; <br>
&gt; <br>
&gt; Yeah, it probably should have.=C2=A0 I think that&#39;s mostly what I&=
#39;ve been <br>
&gt; trying to say.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Tvrtko<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0P.S. And as a related side=
 note, there are more areas where<br>
&gt;=C2=A0 =C2=A0 =C2=A0drm_sched<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0could be improved, like fo=
r instance priority handling.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Take a look at msm_submitq=
ueue_create /<br>
&gt;=C2=A0 =C2=A0 =C2=A0msm_gpu_convert_priority /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0get_sched_entity to see ho=
w msm works around the drm_sched<br>
&gt;=C2=A0 =C2=A0 =C2=A0hardcoded<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0limit of available priorit=
y levels, in order to avoid having<br>
&gt;=C2=A0 =C2=A0 =C2=A0to leave a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0hw capability unused. I su=
spect msm would be happier if they<br>
&gt;=C2=A0 =C2=A0 =C2=A0could have<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0all priority levels equal =
in terms of whether they apply only<br>
&gt;=C2=A0 =C2=A0 =C2=A0at the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0frontend level or complete=
ly throughout the pipeline.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; [1]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://patchwork.freedesktop.org/patch/=
515857/?series=3D112189&amp;rev=3D1" rel=3D"noreferrer" target=3D"_blank">h=
ttps://patchwork.freedesktop.org/patch/515857/?series=3D112189&amp;rev=3D1<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://patchwork.freedesktop.org/pa=
tch/515857/?series=3D112189&amp;rev=3D1" rel=3D"noreferrer" target=3D"_blan=
k">https://patchwork.freedesktop.org/patch/515857/?series=3D112189&amp;rev=
=3D1</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://patchwork.freedesktop=
.org/patch/515857/?series=3D112189&amp;rev=3D1" rel=3D"noreferrer" target=
=3D"_blank">https://patchwork.freedesktop.org/patch/515857/?series=3D112189=
&amp;rev=3D1</a> &lt;<a href=3D"https://patchwork.freedesktop.org/patch/515=
857/?series=3D112189&amp;rev=3D1" rel=3D"noreferrer" target=3D"_blank">http=
s://patchwork.freedesktop.org/patch/515857/?series=3D112189&amp;rev=3D1</a>=
&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; What would b=
e interesting to learn is whether the option of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0refactoring<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; drm_sched to=
 deal with out of order completion was<br>
&gt;=C2=A0 =C2=A0 =C2=A0considered<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0and what were<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; the conclusi=
ons.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; I coded this up =
a while back when trying to convert the<br>
&gt;=C2=A0 =C2=A0 =C2=A0i915 to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0the DRM<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; scheduler it isn=
&#39;t all that hard either. The free flow<br>
&gt;=C2=A0 =C2=A0 =C2=A0control<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0on the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; ring (e.g. set j=
ob limit =3D=3D SIZE OF RING / MAX JOB SIZE) is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0really what<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; sold me on the t=
his design.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; You&#39;re not the only one to suggest suppor=
ting out-of-order<br>
&gt;=C2=A0 =C2=A0 =C2=A0completion.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; However, it&#39;s tricky and breaks a lot of =
internal assumptions of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; scheduler. It also reduces functionality a bi=
t because it can no<br>
&gt;=C2=A0 =C2=A0 =C2=A0longer<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; automatically rate-limit HW/FW queues which a=
re often<br>
&gt;=C2=A0 =C2=A0 =C2=A0fixed-size.=C2=A0 (Ok,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; yes, it probably could but it becomes a subst=
antially harder<br>
&gt;=C2=A0 =C2=A0 =C2=A0problem.)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; It also seems like a worse mapping to me.=C2=
=A0 The goal here is to turn<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; submissions on a userspace-facing engine/queu=
e into submissions<br>
&gt;=C2=A0 =C2=A0 =C2=A0to a FW<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; queue submissions, sorting out any dma_fence =
dependencies.=C2=A0 Matt&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; description of saying this is a 1:1 mapping b=
etween sched/entity<br>
&gt;=C2=A0 =C2=A0 =C2=A0doesn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; tell the whole story. It&#39;s a 1:1:1 mappin=
g between xe_engine,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; gpu_scheduler, and GuC FW engine.=C2=A0 Why m=
ake it a 1:something:1<br>
&gt;=C2=A0 =C2=A0 =C2=A0mapping?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Why is that better?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0As I have stated before, what I think what would fi=
t well for Xe is one<br>
&gt;=C2=A0 =C2=A0 =C2=A0drm_scheduler per engine class. In specific terms o=
n our current<br>
&gt;=C2=A0 =C2=A0 =C2=A0hardware, one drm scheduler instance for render, co=
mpute, blitter,<br>
&gt;=C2=A0 =C2=A0 =C2=A0video<br>
&gt;=C2=A0 =C2=A0 =C2=A0and video enhance. Userspace contexts remain schedu=
ler entities.<br>
&gt; <br>
&gt; <br>
&gt; And this is where we fairly strongly disagree.=C2=A0 More in a bit.<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0That way you avoid the whole kthread/kworker story =
and you have it<br>
&gt;=C2=A0 =C2=A0 =C2=A0actually use the entity picking code in the schedul=
er, which may be<br>
&gt;=C2=A0 =C2=A0 =C2=A0useful when the backend is congested.<br>
&gt; <br>
&gt; <br>
&gt; What back-end congestion are you referring to here?=C2=A0 Running out =
of FW <br>
&gt; queue IDs?=C2=A0 Something else?<br>
<br>
CT channel, number of context ids.<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Yes you have to solve the out of order problem so i=
n my mind that is<br>
&gt;=C2=A0 =C2=A0 =C2=A0something to discuss. What the problem actually is =
(just TDR?), how<br>
&gt;=C2=A0 =C2=A0 =C2=A0tricky and why etc.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0And yes you lose the handy LRCA ring buffer size ma=
nagement so you&#39;d<br>
&gt;=C2=A0 =C2=A0 =C2=A0have to make those entities not runnable in some ot=
her way.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Regarding the argument you raise below - would any =
of that make the<br>
&gt;=C2=A0 =C2=A0 =C2=A0frontend / backend separation worse and why? Do you=
 think it is less<br>
&gt;=C2=A0 =C2=A0 =C2=A0natural? If neither is true then all remains is tha=
t it appears extra<br>
&gt;=C2=A0 =C2=A0 =C2=A0work to support out of order completion of entities=
 has been discounted<br>
&gt;=C2=A0 =C2=A0 =C2=A0in favour of an easy but IMO inelegant option.<br>
&gt; <br>
&gt; <br>
&gt; Broadly speaking, the kernel needs to stop thinking about GPU scheduli=
ng <br>
&gt; in terms of scheduling jobs and start thinking in terms of scheduling =
<br>
&gt; contexts/engines.=C2=A0 There is still some need for scheduling indivi=
dual <br>
&gt; jobs but that is only for the purpose of delaying them as needed to <b=
r>
&gt; resolve dma_fence dependencies.=C2=A0 Once dependencies are resolved, =
they <br>
&gt; get shoved onto the context/engine queue and from there the kernel onl=
y <br>
&gt; really manages whole contexts/engines.=C2=A0 This is a major architect=
ural <br>
&gt; shift, entirely different from the way i915 scheduling works.=C2=A0 It=
&#39;s also <br>
&gt; different from the historical usage of DRM scheduler which I think is =
<br>
&gt; why this all looks a bit funny.<br>
&gt; <br>
&gt; To justify this architectural shift, let&#39;s look at where we&#39;re=
 headed.=C2=A0 <br>
&gt; In the glorious future...<br>
&gt; <br>
&gt;=C2=A0 =C2=A01. Userspace submits directly to firmware queues.=C2=A0 Th=
e kernel has no <br>
&gt; visibility whatsoever into individual jobs.=C2=A0 At most it can pause=
/resume <br>
&gt; FW contexts as needed to handle eviction and memory management.<br>
&gt; <br>
&gt;=C2=A0 =C2=A02. Because of 1, apart from handing out the FW queue IDs a=
t the <br>
&gt; beginning, the kernel can&#39;t really juggle them that much.=C2=A0 De=
pending on <br>
&gt; FW design, it may be able to pause a client, give its IDs to another, =
<br>
&gt; and then resume it later when IDs free up.=C2=A0 What it&#39;s not doi=
ng is <br>
&gt; juggling IDs on a job-by-job basis like i915 currently is.<br>
&gt; <br>
&gt;=C2=A0 =C2=A03. Long-running compute jobs may not complete for days.=C2=
=A0 This means <br>
&gt; that memory management needs to happen in terms of pause/resume of <br=
>
&gt; entire contexts/engines using the memory rather than based on waiting =
<br>
&gt; for individual jobs to complete or pausing individual jobs until the <=
br>
&gt; memory is available.<br>
&gt; <br>
&gt;=C2=A0 =C2=A04. Synchronization happens via userspace memory fences (UM=
F) and the <br>
&gt; kernel is mostly unaware of most dependencies and when a context/engin=
e <br>
&gt; is or is not runnable.=C2=A0 Instead, it keeps as many of them minimal=
ly <br>
&gt; active (memory is available, even if it&#39;s in system RAM) as possib=
le and <br>
&gt; lets the FW sort out dependencies.=C2=A0 (There may need to be some fa=
cility <br>
&gt; for sleeping a context until a memory change similar to futex() or <br=
>
&gt; poll() for userspace threads.=C2=A0 There are some details TBD.)<br>
&gt; <br>
&gt; Are there potential problems that will need to be solved here?=C2=A0 Y=
es.=C2=A0 Is <br>
&gt; it a good design?=C2=A0 Well, Microsoft has been living in this future=
 for <br>
&gt; half a decade or better and it&#39;s working quite well for them.=C2=
=A0 It&#39;s also <br>
&gt; the way all modern game consoles work.=C2=A0 It really is just Linux t=
hat&#39;s <br>
&gt; stuck with the same old job model we&#39;ve had since the monumental s=
hift <br>
&gt; to DRI2.<br>
&gt; <br>
&gt; To that end, one of the core goals of the Xe project was to make the <=
br>
&gt; driver internally behave as close to the above model as possible while=
 <br>
&gt; keeping the old-school job model as a very thin layer on top.=C2=A0 As=
 the <br>
&gt; broader ecosystem problems (window-system support for UMF, for instanc=
e) <br>
&gt; are solved, that layer can be peeled back.=C2=A0 The core driver will =
already <br>
&gt; be ready for it.<br>
&gt; <br>
&gt; To that end, the point of the DRM scheduler in Xe isn&#39;t to schedul=
e <br>
&gt; jobs.=C2=A0 It&#39;s to resolve syncobj and dma-buf implicit sync depe=
ndencies <br>
&gt; and stuff jobs into their respective context/engine queue once they&#3=
9;re <br>
&gt; ready.=C2=A0 All the actual scheduling happens in firmware and any sch=
eduling <br>
&gt; the kernel does to deal with contention, oversubscriptions, too many <=
br>
&gt; contexts, etc. is between contexts/engines, not individual jobs.=C2=A0=
 Sure, <br>
&gt; the individual job visibility is nice, but if we design around it, we&=
#39;ll <br>
&gt; never get to the glorious future.<br>
&gt; <br>
&gt; I really need to turn the above (with a bit more detail) into a blog <=
br>
&gt; post.... Maybe I&#39;ll do that this week.<br>
&gt; <br>
&gt; In any case, I hope that provides more insight into why Xe is designed=
 <br>
&gt; the way it is and why I&#39;m pushing back so hard on trying to make i=
t more <br>
&gt; of a &quot;classic&quot; driver as far as scheduling is concerned.=C2=
=A0 Are there <br>
&gt; potential problems here?=C2=A0 Yes, that&#39;s why Xe has been labeled=
 a <br>
&gt; prototype.=C2=A0 Are such radical changes necessary to get to said glo=
rious <br>
&gt; future?=C2=A0 Yes, I think they are.=C2=A0 Will it be worth it?=C2=A0 =
I believe so.<br>
<br>
Right, that&#39;s all solid I think. My takeaway is that frontend priority =
<br>
sorting and that stuff isn&#39;t needed and that is okay. And that there ar=
e <br>
multiple options to maybe improve drm scheduler, like the fore mentioned <b=
r>
making it deal with out of order, or split into functional components, <br>
or split frontend/backend what you suggested. For most of them cost vs <br>
benefit is more or less not completely clear, neither how much effort <br>
was invested to look into them.<br>
<br>
One thing I missed from this explanation is how drm_scheduler per engine <b=
r>
class interferes with the high level concepts. And I did not manage to <br>
pick up on what exactly is the TDR problem in that case. Maybe the two <br>
are one and the same.<br>
<br>
Bottom line is I still have the concern that conversion to kworkers has <br=
>
an opportunity to regress. Possibly more opportunity for some Xe use <br>
cases than to affect other vendors, since they would still be using per <br=
>
physical engine / queue scheduler instances.<br>
<br>
And to put my money where my mouth is I will try to put testing Xe <br>
inside the full blown ChromeOS environment in my team plans. It would <br>
probably also be beneficial if Xe team could take a look at real world <br>
behaviour of the extreme transcode use cases too. If the stack is ready <br=
>
for that and all. It would be better to know earlier rather than later <br>
if there is a fundamental issue.<br>
<br>
For the patch at hand, and the cover letter, it certainly feels it would <b=
r>
benefit to record the past design discussion had with AMD folks, to <br>
explicitly copy other drivers, and to record the theoretical pros and <br>
cons of threads vs unbound workers as I have tried to highlight them.<br>
<br>
Regards,<br>
<br>
Tvrtko<br>
</blockquote></div></div>

--00000000000058d23005f204602f--
