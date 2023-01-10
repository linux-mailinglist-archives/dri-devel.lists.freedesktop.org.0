Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1C76642DA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 15:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BD210E5CD;
	Tue, 10 Jan 2023 14:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4994710E5CD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 14:09:05 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id fc4so28862492ejc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 06:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gJ7V59a9PzhWhpwJMZ4GXP7hLI146XlxuP/v1zTeO+U=;
 b=ZGL//dmfTQ1a6G/pr+TVJ8DkjTHPTTVg318+PzTWs59lB/gLMhb7Fqk7wWEYHUqXGp
 dlO79DqxcfOljYv7eaaQ3i4AouxfDK20HOFBhaClu3O99weIQuuJF98nX9vFvBbpoEfx
 LaAghhjH+hb0iKjgTKymvahXKofshIhjyvgdQBbAlyd4GPYJPqScJ+tupX6bz1nW5AJ9
 3+iKMd6aJYEfDv9hL8U12BIJu3XZKzwy0tukSMKWFq/iHSirKzsLGo/nSx/3NhnBICap
 OJXz0vX6nj6Wff8Tg71FM/t92nOOqFELVMLy3+XFN2fUbyY8E6Zb+lVc/lZDV0jjZdcu
 pMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gJ7V59a9PzhWhpwJMZ4GXP7hLI146XlxuP/v1zTeO+U=;
 b=reZckwjKIGssJAWV/Tn72g9mvUVmdh2yLdpn6B1KQGxIoO2gc/5bzycgv3ZaZFcoB0
 Phjr4eMDzxAE7FLOGWXN+3AUZ0WjM2UFsNP1uRc6wctzPGExQXT4Ze09wm8fRSW6v5rx
 d5oNnBlD9b84LOiC8cD7hAGZQiyGSXatInsWyBcOr8iPDx/9CRm8VpgFSAmxNqk84Ggc
 cLCHG3LA+4mIQqz/p4vJtYzk6IsXk+lTYghZXIxSJxzYT0y753jKxlazd4tqaRlSagQ0
 4ebe/k/YDjeuTlpIOUoYOrpMLY7cN3dX6oIVyKt6w9WhBiDK9zuuAg+F4iSRyLbec8qK
 buWw==
X-Gm-Message-State: AFqh2kqrrGkZSP2g7GFQcuPIyKUjTuDZdfsiHWkpf4c7QtK7cSJ0AktC
 OIVHBE8SP8qb/jmfDkmGpLYd6bk/+aFZjSwpzDRHBw==
X-Google-Smtp-Source: AMrXdXsaWYj9vRhO7f3rXsV0LVIyh0MHyNNbB54IDpi4O9HKq2/5kaqpfKUAlQA1sYLqoP/vdKL+ULDNy18LC1N5cuY=
X-Received: by 2002:a17:907:c498:b0:84d:34fa:f1a6 with SMTP id
 tp24-20020a170907c49800b0084d34faf1a6mr677164ejc.638.1673359743469; Tue, 10
 Jan 2023 06:09:03 -0800 (PST)
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
In-Reply-To: <e6512993-5247-a577-abf4-97cdb21358a0@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 10 Jan 2023 08:08:51 -0600
Message-ID: <CAOFGe957uYdTFccQp36QRJRDkWQZDCB0ztMNDH0=SSf-RTgzLw@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler to
 use a work queue rather than kthread
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000175e3b05f1e96dc8"
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

--000000000000175e3b05f1e96dc8
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 10, 2023 at 5:28 AM Tvrtko Ursulin <
tvrtko.ursulin@linux.intel.com> wrote:

>
>
> On 09/01/2023 17:27, Jason Ekstrand wrote:
>
> [snip]
>
> >      >>> AFAICT it proposes to have 1:1 between *userspace* created
> >     contexts (per
> >      >>> context _and_ engine) and drm_sched. I am not sure avoiding
> >     invasive changes
> >      >>> to the shared code is in the spirit of the overall idea and
> instead
> >      >>> opportunity should be used to look at way to refactor/improve
> >     drm_sched.
> >
> >
> > Maybe?  I'm not convinced that what Xe is doing is an abuse at all or
> > really needs to drive a re-factor.  (More on that later.)  There's only
> > one real issue which is that it fires off potentially a lot of kthreads.
> > Even that's not that bad given that kthreads are pretty light and you're
> > not likely to have more kthreads than userspace threads which are much
> > heavier.  Not ideal, but not the end of the world either.  Definitely
> > something we can/should optimize but if we went through with Xe without
> > this patch, it would probably be mostly ok.
> >
> >      >> Yes, it is 1:1 *userspace* engines and drm_sched.
> >      >>
> >      >> I'm not really prepared to make large changes to DRM scheduler
> >     at the
> >      >> moment for Xe as they are not really required nor does Boris
> >     seem they
> >      >> will be required for his work either. I am interested to see
> >     what Boris
> >      >> comes up with.
> >      >>
> >      >>> Even on the low level, the idea to replace drm_sched threads
> >     with workers
> >      >>> has a few problems.
> >      >>>
> >      >>> To start with, the pattern of:
> >      >>>
> >      >>>    while (not_stopped) {
> >      >>>     keep picking jobs
> >      >>>    }
> >      >>>
> >      >>> Feels fundamentally in disagreement with workers (while
> >     obviously fits
> >      >>> perfectly with the current kthread design).
> >      >>
> >      >> The while loop breaks and worker exists if no jobs are ready.
> >
> >
> > I'm not very familiar with workqueues. What are you saying would fit
> > better? One scheduling job per work item rather than one big work item
> > which handles all available jobs?
>
> Yes and no, it indeed IMO does not fit to have a work item which is
> potentially unbound in runtime. But it is a bit moot conceptual mismatch
> because it is a worst case / theoretical, and I think due more
> fundamental concerns.
>
> If we have to go back to the low level side of things, I've picked this
> random spot to consolidate what I have already mentioned and perhaps
> expand.
>
> To start with, let me pull out some thoughts from workqueue.rst:
>
> """
> Generally, work items are not expected to hog a CPU and consume many
> cycles. That means maintaining just enough concurrency to prevent work
> processing from stalling should be optimal.
> """
>
> For unbound queues:
> """
> The responsibility of regulating concurrency level is on the users.
> """
>
> Given the unbound queues will be spawned on demand to service all queued
> work items (more interesting when mixing up with the system_unbound_wq),
> in the proposed design the number of instantiated worker threads does
> not correspond to the number of user threads (as you have elsewhere
> stated), but pessimistically to the number of active user contexts.


Those are pretty much the same in practice.  Rather, user threads is
typically an upper bound on the number of contexts.  Yes, a single user
thread could have a bunch of contexts but basically nothing does that
except IGT.  In real-world usage, it's at most one context per user thread.


> That
> is the number which drives the maximum number of not-runnable jobs that
> can become runnable at once, and hence spawn that many work items, and
> in turn unbound worker threads.
>
> Several problems there.
>
> It is fundamentally pointless to have potentially that many more threads
> than the number of CPU cores - it simply creates a scheduling storm.
>
> Unbound workers have no CPU / cache locality either and no connection
> with the CPU scheduler to optimize scheduling patterns. This may matter
> either on large systems or on small ones. Whereas the current design
> allows for scheduler to notice userspace CPU thread keeps waking up the
> same drm scheduler kernel thread, and so it can keep them on the same
> CPU, the unbound workers lose that ability and so 2nd CPU might be
> getting woken up from low sleep for every submission.
>
> Hence, apart from being a bit of a impedance mismatch, the proposal has
> the potential to change performance and power patterns and both large
> and small machines.
>

Ok, thanks for explaining the issue you're seeing in more detail.  Yes,
deferred kwork does appear to mismatch somewhat with what the scheduler
needs or at least how it's worked in the past.  How much impact will that
mismatch have?  Unclear.


> >      >>> Secondly, it probably demands separate workers (not optional),
> >     otherwise
> >      >>> behaviour of shared workqueues has either the potential to
> >     explode number
> >      >>> kernel threads anyway, or add latency.
> >      >>>
> >      >>
> >      >> Right now the system_unbound_wq is used which does have a limit
> >     on the
> >      >> number of threads, right? I do have a FIXME to allow a worker to
> be
> >      >> passed in similar to TDR.
> >      >>
> >      >> WRT to latency, the 1:1 ratio could actually have lower latency
> >     as 2 GPU
> >      >> schedulers can be pushing jobs into the backend / cleaning up
> >     jobs in
> >      >> parallel.
> >      >>
> >      >
> >      > Thought of one more point here where why in Xe we absolutely want
> >     a 1 to
> >      > 1 ratio between entity and scheduler - the way we implement
> >     timeslicing
> >      > for preempt fences.
> >      >
> >      > Let me try to explain.
> >      >
> >      > Preempt fences are implemented via the generic messaging
> >     interface [1]
> >      > with suspend / resume messages. If a suspend messages is received
> to
> >      > soon after calling resume (this is per entity) we simply sleep in
> the
> >      > suspend call thus giving the entity a timeslice. This completely
> >     falls
> >      > apart with a many to 1 relationship as now a entity waiting for a
> >      > timeslice blocks the other entities. Could we work aroudn this,
> >     sure but
> >      > just another bunch of code we'd have to add in Xe. Being to
> >     freely sleep
> >      > in backend without affecting other entities is really, really
> >     nice IMO
> >      > and I bet Xe isn't the only driver that is going to feel this way.
> >      >
> >      > Last thing I'll say regardless of how anyone feels about Xe using
> >     a 1 to
> >      > 1 relationship this patch IMO makes sense as I hope we can all
> >     agree a
> >      > workqueue scales better than kthreads.
> >
> >     I don't know for sure what will scale better and for what use case,
> >     combination of CPU cores vs number of GPU engines to keep busy vs
> other
> >     system activity. But I wager someone is bound to ask for some
> >     numbers to
> >     make sure proposal is not negatively affecting any other drivers.
> >
> >
> > Then let them ask.  Waving your hands vaguely in the direction of the
> > rest of DRM and saying "Uh, someone (not me) might object" is profoundly
> > unhelpful.  Sure, someone might.  That's why it's on dri-devel.  If you
> > think there's someone in particular who might have a useful opinion on
> > this, throw them in the CC so they don't miss the e-mail thread.
> >
> > Or are you asking for numbers?  If so, what numbers are you asking for?
>
> It was a heads up to the Xe team in case people weren't appreciating how
> the proposed change has the potential influence power and performance
> across the board. And nothing in the follow up discussion made me think
> it was considered so I don't think it was redundant to raise it.
>
> In my experience it is typical that such core changes come with some
> numbers. Which is in case of drm scheduler is tricky and probably
> requires explicitly asking everyone to test (rather than count on "don't
> miss the email thread"). Real products can fail to ship due ten mW here
> or there. Like suddenly an extra core prevented from getting into deep
> sleep.
>
> If that was "profoundly unhelpful" so be it.
>

With your above explanation, it makes more sense what you're asking.  It's
still not something Matt is likely to be able to provide on his own.  We
need to tag some other folks and ask them to test it out.  We could play
around a bit with it on Xe but it's not exactly production grade yet and is
going to hit this differently from most.  Likely candidates are probably
AMD and Freedreno.


> > Also, If we're talking about a design that might paint us into an
> > Intel-HW-specific hole, that would be one thing.  But we're not.  We're
> > talking about switching which kernel threading/task mechanism to use for
> > what's really a very generic problem.  The core Xe design works without
> > this patch (just with more kthreads).  If we land this patch or
> > something like it and get it wrong and it causes a performance problem
> > for someone down the line, we can revisit it.
>
> For some definition of "it works" - I really wouldn't suggest shipping a
> kthread per user context at any point.
>

You have yet to elaborate on why. What resources is it consuming that's
going to be a problem? Are you anticipating CPU affinity problems? Or does
it just seem wasteful?

I think I largely agree that it's probably unnecessary/wasteful but
reducing the number of kthreads seems like a tractable problem to solve
regardless of where we put the gpu_scheduler object.  Is this the right
solution?  Maybe not.  It was also proposed at one point that we could
split the scheduler into two pieces: A scheduler which owns the kthread,
and a back-end which targets some HW ring thing where you can have multiple
back-ends per scheduler.  That's certainly more invasive from a DRM
scheduler internal API PoV but would solve the kthread problem in a way
that's more similar to what we have now.


> >     In any case that's a low level question caused by the high level
> design
> >     decision. So I'd think first focus on the high level - which is the
> 1:1
> >     mapping of entity to scheduler instance proposal.
> >
> >     Fundamentally it will be up to the DRM maintainers and the community
> to
> >     bless your approach. And it is important to stress 1:1 is about
> >     userspace contexts, so I believe unlike any other current scheduler
> >     user. And also important to stress this effectively does not make Xe
> >     _really_ use the scheduler that much.
> >
> >
> > I don't think this makes Xe nearly as much of a one-off as you think it
> > does.  I've already told the Asahi team working on Apple M1/2 hardware
> > to do it this way and it seems to be a pretty good mapping for them. I
> > believe this is roughly the plan for nouveau as well.  It's not the way
> > it currently works for anyone because most other groups aren't doing FW
> > scheduling yet.  In the world of FW scheduling and hardware designed to
> > support userspace direct-to-FW submit, I think the design makes perfect
> > sense (see below) and I expect we'll see more drivers move in this
> > direction as those drivers evolve.  (AMD is doing some customish thing
> > for how with gpu_scheduler on the front-end somehow. I've not dug into
> > those details.)
> >
> >     I can only offer my opinion, which is that the two options mentioned
> in
> >     this thread (either improve drm scheduler to cope with what is
> >     required,
> >     or split up the code so you can use just the parts of drm_sched which
> >     you want - which is frontend dependency tracking) shouldn't be so
> >     readily dismissed, given how I think the idea was for the new driver
> to
> >     work less in a silo and more in the community (not do kludges to
> >     workaround stuff because it is thought to be too hard to improve
> common
> >     code), but fundamentally, "goto previous paragraph" for what I am
> >     concerned.
> >
> >
> > Meta comment:  It appears as if you're falling into the standard i915
> > team trap of having an internal discussion about what the community
> > discussion might look like instead of actually having the community
> > discussion.  If you are seriously concerned about interactions with
> > other drivers or whether or setting common direction, the right way to
> > do that is to break a patch or two out into a separate RFC series and
> > tag a handful of driver maintainers.  Trying to predict the questions
> > other people might ask is pointless. Cc them and asking for their input
> > instead.
>
> I don't follow you here. It's not an internal discussion - I am raising
> my concerns on the design publicly. I am supposed to write a patch to
> show something, but am allowed to comment on a RFC series?
>

I may have misread your tone a bit.  It felt a bit like too many
discussions I've had in the past where people are trying to predict what
others will say instead of just asking them.  Reading it again, I was
probably jumping to conclusions a bit.  Sorry about that.


> It is "drm/sched: Convert drm scheduler to use a work queue rather than
> kthread" which should have Cc-ed _everyone_ who use drm scheduler.
>

Yeah, it probably should have.  I think that's mostly what I've been trying
to say.


> >
> >     Regards,
> >
> >     Tvrtko
> >
> >     P.S. And as a related side note, there are more areas where drm_sched
> >     could be improved, like for instance priority handling.
> >     Take a look at msm_submitqueue_create / msm_gpu_convert_priority /
> >     get_sched_entity to see how msm works around the drm_sched hardcoded
> >     limit of available priority levels, in order to avoid having to
> leave a
> >     hw capability unused. I suspect msm would be happier if they could
> have
> >     all priority levels equal in terms of whether they apply only at the
> >     frontend level or completely throughout the pipeline.
> >
> >      > [1]
> >     https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1
> >     <https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1
> >
> >      >
> >      >>> What would be interesting to learn is whether the option of
> >     refactoring
> >      >>> drm_sched to deal with out of order completion was considered
> >     and what were
> >      >>> the conclusions.
> >      >>>
> >      >>
> >      >> I coded this up a while back when trying to convert the i915 to
> >     the DRM
> >      >> scheduler it isn't all that hard either. The free flow control
> >     on the
> >      >> ring (e.g. set job limit == SIZE OF RING / MAX JOB SIZE) is
> >     really what
> >      >> sold me on the this design.
> >
> >
> > You're not the only one to suggest supporting out-of-order completion.
> > However, it's tricky and breaks a lot of internal assumptions of the
> > scheduler. It also reduces functionality a bit because it can no longer
> > automatically rate-limit HW/FW queues which are often fixed-size.  (Ok,
> > yes, it probably could but it becomes a substantially harder problem.)
> >
> > It also seems like a worse mapping to me.  The goal here is to turn
> > submissions on a userspace-facing engine/queue into submissions to a FW
> > queue submissions, sorting out any dma_fence dependencies.  Matt's
> > description of saying this is a 1:1 mapping between sched/entity doesn't
> > tell the whole story. It's a 1:1:1 mapping between xe_engine,
> > gpu_scheduler, and GuC FW engine.  Why make it a 1:something:1 mapping?
> > Why is that better?
>
> As I have stated before, what I think what would fit well for Xe is one
> drm_scheduler per engine class. In specific terms on our current
> hardware, one drm scheduler instance for render, compute, blitter, video
> and video enhance. Userspace contexts remain scheduler entities.
>

And this is where we fairly strongly disagree.  More in a bit.


> That way you avoid the whole kthread/kworker story and you have it
> actually use the entity picking code in the scheduler, which may be
> useful when the backend is congested.
>

What back-end congestion are you referring to here?  Running out of FW
queue IDs?  Something else?


> Yes you have to solve the out of order problem so in my mind that is
> something to discuss. What the problem actually is (just TDR?), how
> tricky and why etc.
>
> And yes you lose the handy LRCA ring buffer size management so you'd
> have to make those entities not runnable in some other way.
>
> Regarding the argument you raise below - would any of that make the
> frontend / backend separation worse and why? Do you think it is less
> natural? If neither is true then all remains is that it appears extra
> work to support out of order completion of entities has been discounted
> in favour of an easy but IMO inelegant option.
>

Broadly speaking, the kernel needs to stop thinking about GPU scheduling in
terms of scheduling jobs and start thinking in terms of scheduling
contexts/engines.  There is still some need for scheduling individual jobs
but that is only for the purpose of delaying them as needed to resolve
dma_fence dependencies.  Once dependencies are resolved, they get shoved
onto the context/engine queue and from there the kernel only really manages
whole contexts/engines.  This is a major architectural shift, entirely
different from the way i915 scheduling works.  It's also different from the
historical usage of DRM scheduler which I think is why this all looks a bit
funny.

To justify this architectural shift, let's look at where we're headed.  In
the glorious future...

 1. Userspace submits directly to firmware queues.  The kernel has no
visibility whatsoever into individual jobs.  At most it can pause/resume FW
contexts as needed to handle eviction and memory management.

 2. Because of 1, apart from handing out the FW queue IDs at the beginning,
the kernel can't really juggle them that much.  Depending on FW design, it
may be able to pause a client, give its IDs to another, and then resume it
later when IDs free up.  What it's not doing is juggling IDs on a
job-by-job basis like i915 currently is.

 3. Long-running compute jobs may not complete for days.  This means that
memory management needs to happen in terms of pause/resume of entire
contexts/engines using the memory rather than based on waiting for
individual jobs to complete or pausing individual jobs until the memory is
available.

 4. Synchronization happens via userspace memory fences (UMF) and the
kernel is mostly unaware of most dependencies and when a context/engine is
or is not runnable.  Instead, it keeps as many of them minimally active
(memory is available, even if it's in system RAM) as possible and lets the
FW sort out dependencies.  (There may need to be some facility for sleeping
a context until a memory change similar to futex() or poll() for userspace
threads.  There are some details TBD.)

Are there potential problems that will need to be solved here?  Yes.  Is it
a good design?  Well, Microsoft has been living in this future for half a
decade or better and it's working quite well for them.  It's also the way
all modern game consoles work.  It really is just Linux that's stuck with
the same old job model we've had since the monumental shift to DRI2.

To that end, one of the core goals of the Xe project was to make the driver
internally behave as close to the above model as possible while keeping the
old-school job model as a very thin layer on top.  As the broader ecosystem
problems (window-system support for UMF, for instance) are solved, that
layer can be peeled back.  The core driver will already be ready for it.

To that end, the point of the DRM scheduler in Xe isn't to schedule jobs.
It's to resolve syncobj and dma-buf implicit sync dependencies and stuff
jobs into their respective context/engine queue once they're ready.  All
the actual scheduling happens in firmware and any scheduling the kernel
does to deal with contention, oversubscriptions, too many contexts, etc. is
between contexts/engines, not individual jobs.  Sure, the individual job
visibility is nice, but if we design around it, we'll never get to the
glorious future.

I really need to turn the above (with a bit more detail) into a blog
post.... Maybe I'll do that this week.

In any case, I hope that provides more insight into why Xe is designed the
way it is and why I'm pushing back so hard on trying to make it more of a
"classic" driver as far as scheduling is concerned.  Are there potential
problems here?  Yes, that's why Xe has been labeled a prototype.  Are such
radical changes necessary to get to said glorious future?  Yes, I think
they are.  Will it be worth it?  I believe so.

> There are two places where this 1:1:1 mapping is causing problems:
> >
> >   1. It creates lots of kthreads. This is what this patch is trying to
> > solve. IDK if it's solving it the best way but that's the goal.
> >
> >   2. There are a far more limited number of communication queues between
> > the kernel and GuC for more meta things like pausing and resuming
> > queues, getting events back from GuC, etc. Unless we're in a weird
> > pressure scenario, the amount of traffic on this queue should be low so
> > we can probably just have one per physical device.  The vast majority of
> > kernel -> GuC communication should be on the individual FW queue rings
> > and maybe smashing in-memory doorbells.
>
> I don't follow your terminology here. I suppose you are talking about
> global GuC CT and context ringbuffers. If so then isn't "far more
> limited" actually one?
>

I thought there could be more than one but I think in practice it's just
the one.

--Jason



> Regards,
>
> Tvrtko
>
> > Doing out-of-order completion sort-of solves the 1 but does nothing for
> > 2 and actually makes managing FW queues harder because we no longer have
> > built-in rate limiting.  Seems like a net loss to me.
> >
> >      >>> Second option perhaps to split out the drm_sched code into
> >     parts which would
> >      >>> lend themselves more to "pick and choose" of its
> functionalities.
> >      >>> Specifically, Xe wants frontend dependency tracking, but not
> >     any scheduling
> >      >>> really (neither least busy drm_sched, neither FIFO/RQ entity
> >     picking), so
> >      >>> even having all these data structures in memory is a waste.
> >      >>>
> >      >>
> >      >> I don't think that we are wasting memory is a very good argument
> for
> >      >> making intrusive changes to the DRM scheduler.
> >
> >
> > Worse than that, I think the "we could split it up" kind-of misses the
> > point of the way Xe is using drm/scheduler.  It's not just about
> > re-using a tiny bit of dependency tracking code.  Using the scheduler in
> > this way provides a clean separation between front-end and back-end.
> > The job of the userspace-facing ioctl code is to shove things on the
> > scheduler.  The job of the run_job callback is to encode the job into
> > the FW queue format, stick it in the FW queue ring, and maybe smash a
> > doorbell.  Everything else happens in terms of managing those queues
> > side-band.  The gpu_scheduler code manages the front-end queues and Xe
> > manages the FW queues via the Kernel <-> GuC communication rings.  From
> > a high level, this is a really clean design.  There are potentially some
> > sticky bits around the dual-use of dma_fence for scheduling and memory
> > management but none of those are solved by breaking the DRM scheduler
> > into chunks or getting rid of the 1:1:1 mapping.
> >
> > If we split it out, we're basically asking the driver to implement a
> > bunch of kthread or workqueue stuff, all the ring rate-limiting, etc.
> > It may not be all that much code but also, why?  To save a few bytes of
> > memory per engine?  Each engine already has 32K(ish) worth of context
> > state and a similar size ring to communicate with the FW.  No one is
> > going to notice an extra CPU data structure.
> >
> > I'm not seeing a solid argument against the 1:1:1 design here other than
> > that it doesn't seem like the way DRM scheduler was intended to be
> > used.  I won't argue that.  It's not.  But it is a fairly natural way to
> > take advantage of the benefits the DRM scheduler does provide while also
> > mapping it to hardware that was designed for userspace direct-to-FW
> submit.
> >
> > --Jason
> >
> >      >>> With the first option then the end result could be drm_sched
> >     per engine
> >      >>> class (hardware view), which I think fits with the GuC model.
> >     Give all
> >      >>> schedulable contexts (entities) to the GuC and then mostly
> >     forget about
> >      >>> them. Timeslicing and re-ordering and all happens transparently
> >     to the
> >      >>> kernel from that point until completion.
> >      >>>
> >      >>
> >      >> Out-of-order problem still exists here.
> >      >>
> >      >>> Or with the second option you would build on some smaller
> >     refactored
> >      >>> sub-components of drm_sched, by maybe splitting the dependency
> >     tracking from
> >      >>> scheduling (RR/FIFO entity picking code).
> >      >>>
> >      >>> Second option is especially a bit vague and I haven't thought
> >     about the
> >      >>> required mechanics, but it just appeared too obvious the
> >     proposed design has
> >      >>> a bit too much impedance mismatch.
> >      >>>
> >      >>
> >      >> IMO ROI on this is low and again lets see what Boris comes up
> with.
> >      >>
> >      >> Matt
> >      >>
> >      >>> Oh and as a side note, when I went into the drm_sched code base
> >     to remind
> >      >>> myself how things worked, it is quite easy to find some FIXME
> >     comments which
> >      >>> suggest people working on it are unsure of locking desing there
> >     and such. So
> >      >>> perhaps that all needs cleanup too, I mean would benefit from
> >      >>> refactoring/improving work as brainstormed above anyway.
> >      >>>
> >      >>> Regards,
> >      >>>
> >      >>> Tvrtko
> >
>

--000000000000175e3b05f1e96dc8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Jan 10, 2023 at 5:28 AM Tvrtko Ursulin &lt;<a href=3D"mailto=
:tvrtko.ursulin@linux.intel.com">tvrtko.ursulin@linux.intel.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 09/01/2023 17:27, Jason Ekstrand wrote:<br>
<br>
[snip]<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; AFAICT it proposes to have 1:1 betwee=
n *userspace* created<br>
&gt;=C2=A0 =C2=A0 =C2=A0contexts (per<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; context _and_ engine) and drm_sched. =
I am not sure avoiding<br>
&gt;=C2=A0 =C2=A0 =C2=A0invasive changes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; to the shared code is in the spirit o=
f the overall idea and instead<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; opportunity should be used to look at=
 way to refactor/improve<br>
&gt;=C2=A0 =C2=A0 =C2=A0drm_sched.<br>
&gt; <br>
&gt; <br>
&gt; Maybe?=C2=A0 I&#39;m not convinced that what Xe is doing is an abuse a=
t all or <br>
&gt; really needs to drive a re-factor.=C2=A0 (More on that later.)=C2=A0 T=
here&#39;s only <br>
&gt; one real issue which is that it fires off potentially a lot of kthread=
s. <br>
&gt; Even that&#39;s not that bad given that kthreads are pretty light and =
you&#39;re <br>
&gt; not likely to have more kthreads than userspace threads which are much=
 <br>
&gt; heavier.=C2=A0 Not ideal, but not the end of the world either.=C2=A0 D=
efinitely <br>
&gt; something we can/should optimize but if we went through with Xe withou=
t <br>
&gt; this patch, it would probably be mostly ok.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Yes, it is 1:1 *userspace* engines and dr=
m_sched.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; I&#39;m not really prepared to make large=
 changes to DRM scheduler<br>
&gt;=C2=A0 =C2=A0 =C2=A0at the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; moment for Xe as they are not really requ=
ired nor does Boris<br>
&gt;=C2=A0 =C2=A0 =C2=A0seem they<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; will be required for his work either. I a=
m interested to see<br>
&gt;=C2=A0 =C2=A0 =C2=A0what Boris<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; comes up with.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Even on the low level, the idea to re=
place drm_sched threads<br>
&gt;=C2=A0 =C2=A0 =C2=A0with workers<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; has a few problems.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; To start with, the pattern of:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0 while (not_stopped) {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0keep picking jobs<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Feels fundamentally in disagreement w=
ith workers (while<br>
&gt;=C2=A0 =C2=A0 =C2=A0obviously fits<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; perfectly with the current kthread de=
sign).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; The while loop breaks and worker exists i=
f no jobs are ready.<br>
&gt; <br>
&gt; <br>
&gt; I&#39;m not very familiar with workqueues. What are you saying would f=
it <br>
&gt; better? One scheduling job per work item rather than one big work item=
 <br>
&gt; which handles all available jobs?<br>
<br>
Yes and no, it indeed IMO does not fit to have a work item which is <br>
potentially unbound in runtime. But it is a bit moot conceptual mismatch <b=
r>
because it is a worst case / theoretical, and I think due more <br>
fundamental concerns.<br>
<br>
If we have to go back to the low level side of things, I&#39;ve picked this=
 <br>
random spot to consolidate what I have already mentioned and perhaps expand=
.<br>
<br>
To start with, let me pull out some thoughts from workqueue.rst:<br>
<br>
&quot;&quot;&quot;<br>
Generally, work items are not expected to hog a CPU and consume many <br>
cycles. That means maintaining just enough concurrency to prevent work <br>
processing from stalling should be optimal.<br>
&quot;&quot;&quot;<br>
<br>
For unbound queues:<br>
&quot;&quot;&quot;<br>
The responsibility of regulating concurrency level is on the users.<br>
&quot;&quot;&quot;<br>
<br>
Given the unbound queues will be spawned on demand to service all queued <b=
r>
work items (more interesting when mixing up with the system_unbound_wq), <b=
r>
in the proposed design the number of instantiated worker threads does <br>
not correspond to the number of user threads (as you have elsewhere <br>
stated), but pessimistically to the number of active user contexts.</blockq=
uote><div><br></div><div>Those are pretty much the same in practice.=C2=A0 =
Rather, user threads is typically an upper bound on the number of contexts.=
=C2=A0 Yes, a single user thread could have a bunch of contexts but basical=
ly nothing does that except IGT.=C2=A0 In real-world usage, it&#39;s at mos=
t one context per user thread.<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">That <br>
is the number which drives the maximum number of not-runnable jobs that <br=
>
can become runnable at once, and hence spawn that many work items, and <br>
in turn unbound worker threads.<br>
<br>
Several problems there.<br>
<br>
It is fundamentally pointless to have potentially that many more threads <b=
r>
than the number of CPU cores - it simply creates a scheduling storm.<br>
<br>
Unbound workers have no CPU / cache locality either and no connection <br>
with the CPU scheduler to optimize scheduling patterns. This may matter <br=
>
either on large systems or on small ones. Whereas the current design <br>
allows for scheduler to notice userspace CPU thread keeps waking up the <br=
>
same drm scheduler kernel thread, and so it can keep them on the same <br>
CPU, the unbound workers lose that ability and so 2nd CPU might be <br>
getting woken up from low sleep for every submission.<br>
<br>
Hence, apart from being a bit of a impedance mismatch, the proposal has <br=
>
the potential to change performance and power patterns and both large <br>
and small machines.<br></blockquote><div><br></div><div>Ok, thanks for expl=
aining the issue you&#39;re seeing in more detail.=C2=A0 Yes, deferred kwor=
k does appear to mismatch somewhat with what the scheduler needs or at leas=
t how it&#39;s worked in the past.=C2=A0 How much impact will that mismatch=
 have?=C2=A0 Unclear.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Secondly, it probably demands separat=
e workers (not optional),<br>
&gt;=C2=A0 =C2=A0 =C2=A0otherwise<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; behaviour of shared workqueues has ei=
ther the potential to<br>
&gt;=C2=A0 =C2=A0 =C2=A0explode number<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; kernel threads anyway, or add latency=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Right now the system_unbound_wq is used w=
hich does have a limit<br>
&gt;=C2=A0 =C2=A0 =C2=A0on the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; number of threads, right? I do have a FIX=
ME to allow a worker to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; passed in similar to TDR.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; WRT to latency, the 1:1 ratio could actua=
lly have lower latency<br>
&gt;=C2=A0 =C2=A0 =C2=A0as 2 GPU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; schedulers can be pushing jobs into the b=
ackend / cleaning up<br>
&gt;=C2=A0 =C2=A0 =C2=A0jobs in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; parallel.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Thought of one more point here where why in X=
e we absolutely want<br>
&gt;=C2=A0 =C2=A0 =C2=A0a 1 to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; 1 ratio between entity and scheduler - the wa=
y we implement<br>
&gt;=C2=A0 =C2=A0 =C2=A0timeslicing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; for preempt fences.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Let me try to explain.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Preempt fences are implemented via the generi=
c messaging<br>
&gt;=C2=A0 =C2=A0 =C2=A0interface [1]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; with suspend / resume messages. If a suspend =
messages is received to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; soon after calling resume (this is per entity=
) we simply sleep in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; suspend call thus giving the entity a timesli=
ce. This completely<br>
&gt;=C2=A0 =C2=A0 =C2=A0falls<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; apart with a many to 1 relationship as now a =
entity waiting for a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; timeslice blocks the other entities. Could we=
 work aroudn this,<br>
&gt;=C2=A0 =C2=A0 =C2=A0sure but<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; just another bunch of code we&#39;d have to a=
dd in Xe. Being to<br>
&gt;=C2=A0 =C2=A0 =C2=A0freely sleep<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; in backend without affecting other entities i=
s really, really<br>
&gt;=C2=A0 =C2=A0 =C2=A0nice IMO<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; and I bet Xe isn&#39;t the only driver that i=
s going to feel this way.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Last thing I&#39;ll say regardless of how any=
one feels about Xe using<br>
&gt;=C2=A0 =C2=A0 =C2=A0a 1 to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; 1 relationship this patch IMO makes sense as =
I hope we can all<br>
&gt;=C2=A0 =C2=A0 =C2=A0agree a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; workqueue scales better than kthreads.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I don&#39;t know for sure what will scale better an=
d for what use case,<br>
&gt;=C2=A0 =C2=A0 =C2=A0combination of CPU cores vs number of GPU engines t=
o keep busy vs other<br>
&gt;=C2=A0 =C2=A0 =C2=A0system activity. But I wager someone is bound to as=
k for some<br>
&gt;=C2=A0 =C2=A0 =C2=A0numbers to<br>
&gt;=C2=A0 =C2=A0 =C2=A0make sure proposal is not negatively affecting any =
other drivers.<br>
&gt; <br>
&gt; <br>
&gt; Then let them ask.=C2=A0 Waving your hands vaguely in the direction of=
 the <br>
&gt; rest of DRM and saying &quot;Uh, someone (not me) might object&quot; i=
s profoundly <br>
&gt; unhelpful.=C2=A0 Sure, someone might.=C2=A0 That&#39;s why it&#39;s on=
 dri-devel.=C2=A0 If you <br>
&gt; think there&#39;s someone in particular who might have a useful opinio=
n on <br>
&gt; this, throw them in the CC so they don&#39;t miss the e-mail thread.<b=
r>
&gt; <br>
&gt; Or are you asking for numbers?=C2=A0 If so, what numbers are you askin=
g for?<br>
<br>
It was a heads up to the Xe team in case people weren&#39;t appreciating ho=
w <br>
the proposed change has the potential influence power and performance <br>
across the board. And nothing in the follow up discussion made me think <br=
>
it was considered so I don&#39;t think it was redundant to raise it.<br>
<br>
In my experience it is typical that such core changes come with some <br>
numbers. Which is in case of drm scheduler is tricky and probably <br>
requires explicitly asking everyone to test (rather than count on &quot;don=
&#39;t <br>
miss the email thread&quot;). Real products can fail to ship due ten mW her=
e <br>
or there. Like suddenly an extra core prevented from getting into deep <br>
sleep.<br>
<br>
If that was &quot;profoundly unhelpful&quot; so be it.<br></blockquote><div=
><br></div><div>With your above explanation, it makes more sense what you&#=
39;re asking.=C2=A0 It&#39;s still not something Matt is likely to be able =
to provide on his own.=C2=A0 We need to tag some other folks and ask them t=
o test it out.=C2=A0 We could play around a bit with it on Xe but it&#39;s =
not exactly production grade yet and is going to hit this differently from =
most.=C2=A0 Likely candidates are probably AMD and Freedreno.<br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Also, If we&#39;re talking about a design that might paint us into an =
<br>
&gt; Intel-HW-specific hole, that would be one thing.=C2=A0 But we&#39;re n=
ot.=C2=A0 We&#39;re <br>
&gt; talking about switching which kernel threading/task mechanism to use f=
or <br>
&gt; what&#39;s really a very generic problem.=C2=A0 The core Xe design wor=
ks without <br>
&gt; this patch (just with more kthreads).=C2=A0 If we land this patch or <=
br>
&gt; something like it and get it wrong and it causes a performance problem=
 <br>
&gt; for someone down the line, we can revisit it.<br>
<br>
For some definition of &quot;it works&quot; - I really wouldn&#39;t suggest=
 shipping a <br>
kthread per user context at any point.<br></blockquote><div><br></div><div>=
You have yet to elaborate on why. What resources is it consuming that&#39;s=
 going to be a problem? Are you anticipating CPU affinity problems? Or does=
 it just seem wasteful?</div><div><br></div><div>I think I largely agree th=
at it&#39;s probably unnecessary/wasteful but reducing the number of kthrea=
ds seems like a tractable problem to solve regardless of where we put the g=
pu_scheduler object.=C2=A0 Is this the right solution?=C2=A0 Maybe not.=C2=
=A0 It was also proposed at one point that we could split the scheduler int=
o two pieces: A scheduler which owns the kthread, and a back-end which targ=
ets some HW ring thing where you can have multiple back-ends per scheduler.=
=C2=A0 That&#39;s certainly more invasive from a DRM scheduler internal API=
 PoV but would solve the kthread problem in a way that&#39;s more similar t=
o what we have now.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0In any case that&#39;s a low level question caused =
by the high level design<br>
&gt;=C2=A0 =C2=A0 =C2=A0decision. So I&#39;d think first focus on the high =
level - which is the 1:1<br>
&gt;=C2=A0 =C2=A0 =C2=A0mapping of entity to scheduler instance proposal.<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Fundamentally it will be up to the DRM maintainers =
and the community to<br>
&gt;=C2=A0 =C2=A0 =C2=A0bless your approach. And it is important to stress =
1:1 is about<br>
&gt;=C2=A0 =C2=A0 =C2=A0userspace contexts, so I believe unlike any other c=
urrent scheduler<br>
&gt;=C2=A0 =C2=A0 =C2=A0user. And also important to stress this effectively=
 does not make Xe<br>
&gt;=C2=A0 =C2=A0 =C2=A0_really_ use the scheduler that much.<br>
&gt; <br>
&gt; <br>
&gt; I don&#39;t think this makes Xe nearly as much of a one-off as you thi=
nk it <br>
&gt; does.=C2=A0 I&#39;ve already told the Asahi team working on Apple M1/2=
 hardware <br>
&gt; to do it this way and it seems to be a pretty good mapping for them. I=
 <br>
&gt; believe this is roughly the plan for nouveau as well.=C2=A0 It&#39;s n=
ot the way <br>
&gt; it currently works for anyone because most other groups aren&#39;t doi=
ng FW <br>
&gt; scheduling yet.=C2=A0 In the world of FW scheduling and hardware desig=
ned to <br>
&gt; support userspace direct-to-FW submit, I think the design makes perfec=
t <br>
&gt; sense (see below) and I expect we&#39;ll see more drivers move in this=
 <br>
&gt; direction as those drivers evolve.=C2=A0 (AMD is doing some customish =
thing <br>
&gt; for how with gpu_scheduler on the front-end somehow. I&#39;ve not dug =
into <br>
&gt; those details.)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I can only offer my opinion, which is that the two =
options mentioned in<br>
&gt;=C2=A0 =C2=A0 =C2=A0this thread (either improve drm scheduler to cope w=
ith what is<br>
&gt;=C2=A0 =C2=A0 =C2=A0required,<br>
&gt;=C2=A0 =C2=A0 =C2=A0or split up the code so you can use just the parts =
of drm_sched which<br>
&gt;=C2=A0 =C2=A0 =C2=A0you want - which is frontend dependency tracking) s=
houldn&#39;t be so<br>
&gt;=C2=A0 =C2=A0 =C2=A0readily dismissed, given how I think the idea was f=
or the new driver to<br>
&gt;=C2=A0 =C2=A0 =C2=A0work less in a silo and more in the community (not =
do kludges to<br>
&gt;=C2=A0 =C2=A0 =C2=A0workaround stuff because it is thought to be too ha=
rd to improve common<br>
&gt;=C2=A0 =C2=A0 =C2=A0code), but fundamentally, &quot;goto previous parag=
raph&quot; for what I am<br>
&gt;=C2=A0 =C2=A0 =C2=A0concerned.<br>
&gt; <br>
&gt; <br>
&gt; Meta comment:=C2=A0 It appears as if you&#39;re falling into the stand=
ard i915 <br>
&gt; team trap of having an internal discussion about what the community <b=
r>
&gt; discussion might look like instead of actually having the community <b=
r>
&gt; discussion.=C2=A0 If you are seriously concerned about interactions wi=
th <br>
&gt; other drivers or whether or setting common direction, the right way to=
 <br>
&gt; do that is to break a patch or two out into a separate RFC series and =
<br>
&gt; tag a handful of driver maintainers.=C2=A0 Trying to predict the quest=
ions <br>
&gt; other people might ask is pointless. Cc them and asking for their inpu=
t <br>
&gt; instead.<br>
<br>
I don&#39;t follow you here. It&#39;s not an internal discussion - I am rai=
sing <br>
my concerns on the design publicly. I am supposed to write a patch to <br>
show something, but am allowed to comment on a RFC series?<br></blockquote>=
<div><br></div><div>I may have misread your tone a bit.=C2=A0 It felt a bit=
 like too many discussions I&#39;ve had in the past where people are trying=
 to predict what others will say instead of just asking them.=C2=A0 Reading=
 it again, I was probably jumping to conclusions a bit.=C2=A0 Sorry about t=
hat.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
It is &quot;drm/sched: Convert drm scheduler to use a work queue rather tha=
n <br>
kthread&quot; which should have Cc-ed _everyone_ who use drm scheduler.<br>=
</blockquote><div><br></div><div>Yeah, it probably should have.=C2=A0 I thi=
nk that&#39;s mostly what I&#39;ve been trying to say.<br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Tvrtko<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0P.S. And as a related side note, there are more are=
as where drm_sched<br>
&gt;=C2=A0 =C2=A0 =C2=A0could be improved, like for instance priority handl=
ing.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Take a look at msm_submitqueue_create / msm_gpu_con=
vert_priority /<br>
&gt;=C2=A0 =C2=A0 =C2=A0get_sched_entity to see how msm works around the dr=
m_sched hardcoded<br>
&gt;=C2=A0 =C2=A0 =C2=A0limit of available priority levels, in order to avo=
id having to leave a<br>
&gt;=C2=A0 =C2=A0 =C2=A0hw capability unused. I suspect msm would be happie=
r if they could have<br>
&gt;=C2=A0 =C2=A0 =C2=A0all priority levels equal in terms of whether they =
apply only at the<br>
&gt;=C2=A0 =C2=A0 =C2=A0frontend level or completely throughout the pipelin=
e.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; [1]<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://patchwork.freedesktop.org/patch/=
515857/?series=3D112189&amp;rev=3D1" rel=3D"noreferrer" target=3D"_blank">h=
ttps://patchwork.freedesktop.org/patch/515857/?series=3D112189&amp;rev=3D1<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://patchwork.freedesktop.org/pa=
tch/515857/?series=3D112189&amp;rev=3D1" rel=3D"noreferrer" target=3D"_blan=
k">https://patchwork.freedesktop.org/patch/515857/?series=3D112189&amp;rev=
=3D1</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; What would be interesting to learn is=
 whether the option of<br>
&gt;=C2=A0 =C2=A0 =C2=A0refactoring<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; drm_sched to deal with out of order c=
ompletion was considered<br>
&gt;=C2=A0 =C2=A0 =C2=A0and what were<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; the conclusions.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; I coded this up a while back when trying =
to convert the i915 to<br>
&gt;=C2=A0 =C2=A0 =C2=A0the DRM<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; scheduler it isn&#39;t all that hard eith=
er. The free flow control<br>
&gt;=C2=A0 =C2=A0 =C2=A0on the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; ring (e.g. set job limit =3D=3D SIZE OF R=
ING / MAX JOB SIZE) is<br>
&gt;=C2=A0 =C2=A0 =C2=A0really what<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; sold me on the this design.<br>
&gt; <br>
&gt; <br>
&gt; You&#39;re not the only one to suggest supporting out-of-order complet=
ion. <br>
&gt; However, it&#39;s tricky and breaks a lot of internal assumptions of t=
he <br>
&gt; scheduler. It also reduces functionality a bit because it can no longe=
r <br>
&gt; automatically rate-limit HW/FW queues which are often fixed-size.=C2=
=A0 (Ok, <br>
&gt; yes, it probably could but it becomes a substantially harder problem.)=
<br>
&gt; <br>
&gt; It also seems like a worse mapping to me.=C2=A0 The goal here is to tu=
rn <br>
&gt; submissions on a userspace-facing engine/queue into submissions to a F=
W <br>
&gt; queue submissions, sorting out any dma_fence dependencies.=C2=A0 Matt&=
#39;s <br>
&gt; description of saying this is a 1:1 mapping between sched/entity doesn=
&#39;t <br>
&gt; tell the whole story. It&#39;s a 1:1:1 mapping between xe_engine, <br>
&gt; gpu_scheduler, and GuC FW engine.=C2=A0 Why make it a 1:something:1 ma=
pping?=C2=A0 <br>
&gt; Why is that better?<br>
<br>
As I have stated before, what I think what would fit well for Xe is one <br=
>
drm_scheduler per engine class. In specific terms on our current <br>
hardware, one drm scheduler instance for render, compute, blitter, video <b=
r>
and video enhance. Userspace contexts remain scheduler entities.<br></block=
quote><div><br></div><div>And this is where we fairly strongly disagree.=C2=
=A0 More in a bit.<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
That way you avoid the whole kthread/kworker story and you have it <br>
actually use the entity picking code in the scheduler, which may be <br>
useful when the backend is congested.<br></blockquote><div><br></div><div>W=
hat back-end congestion are you referring to here?=C2=A0 Running out of FW =
queue IDs?=C2=A0 Something else?<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
Yes you have to solve the out of order problem so in my mind that is <br>
something to discuss. What the problem actually is (just TDR?), how <br>
tricky and why etc.<br>
<br>
And yes you lose the handy LRCA ring buffer size management so you&#39;d <b=
r>
have to make those entities not runnable in some other way.<br>
<br>
Regarding the argument you raise below - would any of that make the <br>
frontend / backend separation worse and why? Do you think it is less <br>
natural? If neither is true then all remains is that it appears extra <br>
work to support out of order completion of entities has been discounted <br=
>
in favour of an easy but IMO inelegant option.<br></blockquote><div><br></d=
iv><div>Broadly speaking, the kernel needs to stop thinking about GPU sched=
uling in terms of scheduling jobs and start thinking in terms of scheduling=
 contexts/engines.=C2=A0 There is still some need for scheduling individual=
 jobs but that is only for the purpose of delaying them as needed to resolv=
e dma_fence dependencies.=C2=A0 Once dependencies are resolved, they get sh=
oved onto the context/engine queue and from there the kernel only really ma=
nages whole contexts/engines.=C2=A0 This is a major architectural shift, en=
tirely different from the way i915 scheduling works.=C2=A0 It&#39;s also di=
fferent from the historical usage of DRM scheduler which I think is why thi=
s all looks a bit funny.</div><div><br></div><div>To justify this architect=
ural shift, let&#39;s look at where we&#39;re headed.=C2=A0 In the glorious=
 future...</div><div><br></div><div>=C2=A01. Userspace submits directly to =
firmware queues.=C2=A0 The kernel has no visibility whatsoever into individ=
ual jobs.=C2=A0 At most it can pause/resume FW contexts as needed to handle=
 eviction and memory management.</div><div><br></div><div>=C2=A02. Because =
of 1, apart from handing out the FW queue IDs at the beginning, the kernel =
can&#39;t really juggle them that much.=C2=A0 Depending on FW design, it ma=
y be able to pause a client, give its IDs to another, and then resume it la=
ter when IDs free up.=C2=A0 What it&#39;s not doing is juggling IDs on a jo=
b-by-job basis like i915 currently is.</div><div><br></div><div>=C2=A03. Lo=
ng-running compute jobs may not complete for days.=C2=A0 This means that me=
mory management needs to happen in terms of pause/resume of entire contexts=
/engines using the memory rather than based on waiting for individual jobs =
to complete or pausing individual jobs until the memory is available.<br></=
div><div><br></div><div>=C2=A04. Synchronization happens via userspace memo=
ry fences (UMF) and the kernel is mostly unaware of most dependencies and w=
hen a context/engine is or is not runnable.=C2=A0 Instead, it keeps as many=
 of them minimally active (memory is available, even if it&#39;s in system =
RAM) as possible and lets the FW sort out dependencies.=C2=A0 (There may ne=
ed to be some facility for sleeping a context until a=20
memory change similar to futex() or poll() for userspace threads.=C2=A0 The=
re
 are some details TBD.)<br></div><div><br></div><div>Are there potential pr=
oblems that will need to be solved here?=C2=A0 Yes.=C2=A0 Is it a good desi=
gn?=C2=A0 Well, Microsoft has been living in this future for half a decade =
or better and it&#39;s working quite well for them.=C2=A0 It&#39;s also the=
 way all modern game consoles work.=C2=A0 It really is just Linux that&#39;=
s stuck with the same old job model we&#39;ve had since the monumental shif=
t to DRI2.</div><div><br></div><div>To that end, one of the core goals of t=
he Xe project was to make the driver internally behave as close to the abov=
e model as possible while keeping the old-school job model as a very thin l=
ayer on top.=C2=A0 As the broader ecosystem problems (window-system support=
 for UMF, for instance) are solved, that layer can be peeled back.=C2=A0 Th=
e core driver will already be ready for it.</div><div><br></div><div>To tha=
t end, the point of the DRM scheduler in Xe isn&#39;t to schedule jobs.=C2=
=A0 It&#39;s to resolve syncobj and dma-buf implicit sync dependencies and =
stuff jobs into their respective context/engine queue once they&#39;re read=
y.=C2=A0 All the actual scheduling happens in firmware and any scheduling t=
he kernel does to deal with contention, oversubscriptions, too many context=
s, etc. is between contexts/engines, not individual jobs.=C2=A0 Sure, the i=
ndividual job visibility is nice, but if we design around it, we&#39;ll nev=
er get to the glorious future.</div><div><br></div><div>I really need to tu=
rn the above (with a bit more detail) into a blog post.... Maybe I&#39;ll d=
o that this week.</div><div><br></div><div>In any case, I hope that provide=
s more insight into why Xe is designed the way it is and why I&#39;m pushin=
g back so hard on trying to make it more of a &quot;classic&quot; driver as=
 far as scheduling is concerned.=C2=A0 Are there potential problems here?=
=C2=A0 Yes, that&#39;s why Xe has been labeled a prototype.=C2=A0 Are such =
radical changes necessary to get to said glorious future?=C2=A0 Yes, I thin=
k they are.=C2=A0 Will it be worth it?=C2=A0 I believe so.<br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; There are two places where this 1:1:1 mapping is causing problems:<br>
&gt; <br>
&gt;=C2=A0 =C2=A01. It creates lots of kthreads. This is what this patch is=
 trying to <br>
&gt; solve. IDK if it&#39;s solving it the best way but that&#39;s the goal=
.<br>
&gt; <br>
&gt;=C2=A0 =C2=A02. There are a far more limited number of communication qu=
eues between <br>
&gt; the kernel and GuC for more meta things like pausing and resuming <br>
&gt; queues, getting events back from GuC, etc. Unless we&#39;re in a weird=
 <br>
&gt; pressure scenario, the amount of traffic on this queue should be low s=
o <br>
&gt; we can probably just have one per physical device.=C2=A0 The vast majo=
rity of <br>
&gt; kernel -&gt; GuC communication should be on the individual FW queue ri=
ngs <br>
&gt; and maybe smashing in-memory doorbells.<br>
<br>
I don&#39;t follow your terminology here. I suppose you are talking about <=
br>
global GuC CT and context ringbuffers. If so then isn&#39;t &quot;far more =
<br>
limited&quot; actually one?<br></blockquote><div><br></div><div>I thought t=
here could be more than one but I think in practice it&#39;s just the one.<=
/div><div><br></div><div>--Jason<br></div><div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
Regards,<br>
<br>
Tvrtko<br>
<br>
&gt; Doing out-of-order completion sort-of solves the 1 but does nothing fo=
r <br>
&gt; 2 and actually makes managing FW queues harder because we no longer ha=
ve <br>
&gt; built-in rate limiting.=C2=A0 Seems like a net loss to me.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Second option perhaps to split out th=
e drm_sched code into<br>
&gt;=C2=A0 =C2=A0 =C2=A0parts which would<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; lend themselves more to &quot;pick an=
d choose&quot; of its functionalities.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Specifically, Xe wants frontend depen=
dency tracking, but not<br>
&gt;=C2=A0 =C2=A0 =C2=A0any scheduling<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; really (neither least busy drm_sched,=
 neither FIFO/RQ entity<br>
&gt;=C2=A0 =C2=A0 =C2=A0picking), so<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; even having all these data structures=
 in memory is a waste.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; I don&#39;t think that we are wasting mem=
ory is a very good argument for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; making intrusive changes to the DRM sched=
uler.<br>
&gt; <br>
&gt; <br>
&gt; Worse than that, I think the &quot;we could split it up&quot; kind-of =
misses the <br>
&gt; point of the way Xe is using drm/scheduler.=C2=A0 It&#39;s not just ab=
out <br>
&gt; re-using a tiny bit of dependency tracking code.=C2=A0 Using the sched=
uler in <br>
&gt; this way provides a clean separation between front-end and back-end.=
=C2=A0 <br>
&gt; The job of the userspace-facing ioctl code is to shove things on the <=
br>
&gt; scheduler.=C2=A0 The job of the run_job callback is to encode the job =
into <br>
&gt; the FW queue format, stick it in the FW queue ring, and maybe smash a =
<br>
&gt; doorbell.=C2=A0 Everything else happens in terms of managing those que=
ues <br>
&gt; side-band.=C2=A0 The gpu_scheduler code manages the front-end queues a=
nd Xe <br>
&gt; manages the FW queues via the Kernel &lt;-&gt; GuC communication rings=
.=C2=A0 From <br>
&gt; a high level, this is a really clean design.=C2=A0 There are potential=
ly some <br>
&gt; sticky bits around the dual-use of dma_fence for scheduling and memory=
 <br>
&gt; management but none of those are solved by breaking the DRM scheduler =
<br>
&gt; into chunks or getting rid of the 1:1:1 mapping.<br>
&gt; <br>
&gt; If we split it out, we&#39;re basically asking the driver to implement=
 a <br>
&gt; bunch of kthread or workqueue stuff, all the ring rate-limiting, etc.=
=C2=A0 <br>
&gt; It may not be all that much code but also, why?=C2=A0 To save a few by=
tes of <br>
&gt; memory per engine?=C2=A0 Each engine already has 32K(ish) worth of con=
text <br>
&gt; state and a similar size ring to communicate with the FW.=C2=A0 No one=
 is <br>
&gt; going to notice an extra CPU data structure.<br>
&gt; <br>
&gt; I&#39;m not seeing a solid argument against the 1:1:1 design here othe=
r than <br>
&gt; that it doesn&#39;t seem like the way DRM scheduler was intended to be=
 <br>
&gt; used.=C2=A0 I won&#39;t argue that.=C2=A0 It&#39;s not.=C2=A0 But it i=
s a fairly natural way to <br>
&gt; take advantage of the benefits the DRM scheduler does provide while al=
so <br>
&gt; mapping it to hardware that was designed for userspace direct-to-FW su=
bmit.<br>
&gt; <br>
&gt; --Jason<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; With the first option then the end re=
sult could be drm_sched<br>
&gt;=C2=A0 =C2=A0 =C2=A0per engine<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; class (hardware view), which I think =
fits with the GuC model.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Give all<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; schedulable contexts (entities) to th=
e GuC and then mostly<br>
&gt;=C2=A0 =C2=A0 =C2=A0forget about<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; them. Timeslicing and re-ordering and=
 all happens transparently<br>
&gt;=C2=A0 =C2=A0 =C2=A0to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; kernel from that point until completi=
on.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Out-of-order problem still exists here.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Or with the second option you would b=
uild on some smaller<br>
&gt;=C2=A0 =C2=A0 =C2=A0refactored<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; sub-components of drm_sched, by maybe=
 splitting the dependency<br>
&gt;=C2=A0 =C2=A0 =C2=A0tracking from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; scheduling (RR/FIFO entity picking co=
de).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Second option is especially a bit vag=
ue and I haven&#39;t thought<br>
&gt;=C2=A0 =C2=A0 =C2=A0about the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; required mechanics, but it just appea=
red too obvious the<br>
&gt;=C2=A0 =C2=A0 =C2=A0proposed design has<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; a bit too much impedance mismatch.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; IMO ROI on this is low and again lets see=
 what Boris comes up with.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Matt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Oh and as a side note, when I went in=
to the drm_sched code base<br>
&gt;=C2=A0 =C2=A0 =C2=A0to remind<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; myself how things worked, it is quite=
 easy to find some FIXME<br>
&gt;=C2=A0 =C2=A0 =C2=A0comments which<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; suggest people working on it are unsu=
re of locking desing there<br>
&gt;=C2=A0 =C2=A0 =C2=A0and such. So<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; perhaps that all needs cleanup too, I=
 mean would benefit from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; refactoring/improving work as brainst=
ormed above anyway.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Tvrtko<br>
&gt; <br>
</blockquote></div></div>

--000000000000175e3b05f1e96dc8--
