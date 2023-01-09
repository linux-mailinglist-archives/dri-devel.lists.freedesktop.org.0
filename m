Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9322662CA0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 18:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E218D10E03F;
	Mon,  9 Jan 2023 17:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C382110E141
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 17:27:32 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id ss4so14671050ejb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 09:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rZyaYgoHgGccK1H0TJAjycCD/EDyyCOhbq+Pj41kzK8=;
 b=zddmZ3AZkr7NJKkAFM2qxY7JkrHnssuXmCZ8WCBhahk5aYS7X/wE1klJaUc43zeZGi
 dFBWLzvLWuspuUNPgzdvabMfjQR3XRiFm6J30GI5BMYJpG1ADBgN8BvNyNXEr988W/rF
 7FeDocpQwJZq3Qs2OtMSE/NFtNRl2L0k5Q2NRafjKjPbvkjVzpy45cWcAJ6F9+kT/WnA
 z3HrVCXnLQU4eug9Eionf9hUR0Cdkz4k4ksAdDW6XEUZztwZkEVEfx9m60MuGVO3FOwg
 R9vLEgKiHsrObUyzUuOuybdunqhoh0Knmt5xr89Z/DdYswJJ/GPYRRgZz3Kq8LqdED/H
 TT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rZyaYgoHgGccK1H0TJAjycCD/EDyyCOhbq+Pj41kzK8=;
 b=eS53piOr+FrYgELk+3jhflHLsAp97UgyGgfyb2iVzz5dwCNYqzjIqyw/gw25xok89D
 KJ/QveM+VesngdJIvdnXlt6KISWT8JwdMSapcx99ndk69d+I/IvHODzl+gpJdyvoRkA9
 +pP0CSC80K8IBem5L91qpIAG5UIgl+8FfJa05XIm6hkS/VMOQS5EqbZLBpiPQt6STTmP
 EVcDl2BsS9PsY6fxemOQo+xFdpCXma2U55afmFrtY3eEVGTPrFaYmkkWgnt69+4TNGZY
 hD0PR0I0yqBxowrAfEm+zDTPBgsgE5CBOPXVHs80QO4+o092am6kyT6pOcuHoHyQnME+
 9vOg==
X-Gm-Message-State: AFqh2koipIGlE5q65G75fB6ogPFu8/VbIHBcoTE8JRfIvhm5vjzBnNrP
 W+Iu5cFFcOAgk6OwCbsEmVbLm5HeDxdThzcl3oqugg==
X-Google-Smtp-Source: AMrXdXubWhRstSK8QWB3iN9iyQoVvL8jBMpw+X45tX9GwL4EnetMOg2e45MO4+fDJpilh0YSIHOp/raoKD8ykPMfudQ=
X-Received: by 2002:a17:906:7749:b0:836:9d62:dd86 with SMTP id
 o9-20020a170906774900b008369d62dd86mr4086285ejn.34.1673285251113; Mon, 09 Jan
 2023 09:27:31 -0800 (PST)
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
In-Reply-To: <e8c301cb-c7d4-ed54-f3ab-61a5fcc7f940@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 9 Jan 2023 11:27:19 -0600
Message-ID: <CAOFGe96yeF4SWxvHC5pxyggf=655q7+ZrFS+Zab42F-RE7UK1w@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler to
 use a work queue rather than kthread
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000000343805f1d81560"
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

--00000000000000343805f1d81560
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 9, 2023 at 7:46 AM Tvrtko Ursulin <
tvrtko.ursulin@linux.intel.com> wrote:

>
> On 06/01/2023 23:52, Matthew Brost wrote:
> > On Thu, Jan 05, 2023 at 09:43:41PM +0000, Matthew Brost wrote:
> >> On Tue, Jan 03, 2023 at 01:02:15PM +0000, Tvrtko Ursulin wrote:
> >>>
> >>> On 02/01/2023 07:30, Boris Brezillon wrote:
> >>>> On Fri, 30 Dec 2022 12:55:08 +0100
> >>>> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >>>>
> >>>>> On Fri, 30 Dec 2022 11:20:42 +0100
> >>>>> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >>>>>
> >>>>>> Hello Matthew,
> >>>>>>
> >>>>>> On Thu, 22 Dec 2022 14:21:11 -0800
> >>>>>> Matthew Brost <matthew.brost@intel.com> wrote:
> >>>>>>> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
> >>>>>>> mapping between a drm_gpu_scheduler and drm_sched_entity. At first
> this
> >>>>>>> seems a bit odd but let us explain the reasoning below.
> >>>>>>>
> >>>>>>> 1. In XE the submission order from multiple drm_sched_entity is not
> >>>>>>> guaranteed to be the same completion even if targeting the same
> hardware
> >>>>>>> engine. This is because in XE we have a firmware scheduler, the
> GuC,
> >>>>>>> which allowed to reorder, timeslice, and preempt submissions. If a
> using
> >>>>>>> shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR
> falls
> >>>>>>> apart as the TDR expects submission order == completion order.
> Using a
> >>>>>>> dedicated drm_gpu_scheduler per drm_sched_entity solve this
> problem.
> >>>>>>
> >>>>>> Oh, that's interesting. I've been trying to solve the same sort of
> >>>>>> issues to support Arm's new Mali GPU which is relying on a
> FW-assisted
> >>>>>> scheduling scheme (you give the FW N streams to execute, and it does
> >>>>>> the scheduling between those N command streams, the kernel driver
> >>>>>> does timeslice scheduling to update the command streams passed to
> the
> >>>>>> FW). I must admit I gave up on using drm_sched at some point, mostly
> >>>>>> because the integration with drm_sched was painful, but also
> because I
> >>>>>> felt trying to bend drm_sched to make it interact with a
> >>>>>> timeslice-oriented scheduling model wasn't really future proof.
> Giving
> >>>>>> drm_sched_entity exlusive access to a drm_gpu_scheduler probably
> might
> >>>>>> help for a few things (didn't think it through yet), but I feel it's
> >>>>>> coming short on other aspects we have to deal with on Arm GPUs.
> >>>>>
> >>>>> Ok, so I just had a quick look at the Xe driver and how it
> >>>>> instantiates the drm_sched_entity and drm_gpu_scheduler, and I think
> I
> >>>>> have a better understanding of how you get away with using drm_sched
> >>>>> while still controlling how scheduling is really done. Here
> >>>>> drm_gpu_scheduler is just a dummy abstract that let's you use the
> >>>>> drm_sched job queuing/dep/tracking mechanism. The whole run-queue
> >>>>> selection is dumb because there's only one entity ever bound to the
> >>>>> scheduler (the one that's part of the xe_guc_engine object which also
> >>>>> contains the drm_gpu_scheduler instance). I guess the main issue we'd
> >>>>> have on Arm is the fact that the stream doesn't necessarily get
> >>>>> scheduled when ->run_job() is called, it can be placed in the
> runnable
> >>>>> queue and be picked later by the kernel-side scheduler when a FW slot
> >>>>> gets released. That can probably be sorted out by manually disabling
> the
> >>>>> job timer and re-enabling it when the stream gets picked by the
> >>>>> scheduler. But my main concern remains, we're basically abusing
> >>>>> drm_sched here.
> >>>>>
> >>>>> For the Arm driver, that means turning the following sequence
> >>>>>
> >>>>> 1. wait for job deps
> >>>>> 2. queue job to ringbuf and push the stream to the runnable
> >>>>>      queue (if it wasn't queued already). Wakeup the timeslice
> scheduler
> >>>>>      to re-evaluate (if the stream is not on a FW slot already)
> >>>>> 3. stream gets picked by the timeslice scheduler and sent to the FW
> for
> >>>>>      execution
> >>>>>
> >>>>> into
> >>>>>
> >>>>> 1. queue job to entity which takes care of waiting for job deps for
> >>>>>      us
> >>>>> 2. schedule a drm_sched_main iteration
> >>>>> 3. the only available entity is picked, and the first job from this
> >>>>>      entity is dequeued. ->run_job() is called: the job is queued to
> the
> >>>>>      ringbuf and the stream is pushed to the runnable queue (if it
> wasn't
> >>>>>      queued already). Wakeup the timeslice scheduler to re-evaluate
> (if
> >>>>>      the stream is not on a FW slot already)
> >>>>> 4. stream gets picked by the timeslice scheduler and sent to the FW
> for
> >>>>>      execution
> >>>>>
> >>>>> That's one extra step we don't really need. To sum-up, yes, all the
> >>>>> job/entity tracking might be interesting to share/re-use, but I
> wonder
> >>>>> if we couldn't have that without pulling out the scheduling part of
> >>>>> drm_sched, or maybe I'm missing something, and there's something in
> >>>>> drm_gpu_scheduler you really need.
> >>>>
> >>>> On second thought, that's probably an acceptable overhead (not even
> >>>> sure the extra step I was mentioning exists in practice, because dep
> >>>> fence signaled state is checked as part of the drm_sched_main
> >>>> iteration, so that's basically replacing the worker I schedule to
> >>>> check job deps), and I like the idea of being able to re-use drm_sched
> >>>> dep-tracking without resorting to invasive changes to the existing
> >>>> logic, so I'll probably give it a try.
> >>>
> >>> I agree with the concerns and think that how Xe proposes to integrate
> with
> >>> drm_sched is a problem, or at least significantly inelegant.
> >>>
> >>
> >> Inelegant is a matter of opinion, I actually rather like this solution.
> >>
> >> BTW this isn't my design rather this was Jason's idea.
>

Sure, throw me under the bus, why don't you? :-P  Nah, it's all fine.  It's
my design and I'm happy to defend it or be blamed for it in the history
books as the case may be.


> >>> AFAICT it proposes to have 1:1 between *userspace* created contexts
> (per
> >>> context _and_ engine) and drm_sched. I am not sure avoiding invasive
> changes
> >>> to the shared code is in the spirit of the overall idea and instead
> >>> opportunity should be used to look at way to refactor/improve
> drm_sched.
>

Maybe?  I'm not convinced that what Xe is doing is an abuse at all or
really needs to drive a re-factor.  (More on that later.)  There's only one
real issue which is that it fires off potentially a lot of kthreads. Even
that's not that bad given that kthreads are pretty light and you're not
likely to have more kthreads than userspace threads which are much
heavier.  Not ideal, but not the end of the world either.  Definitely
something we can/should optimize but if we went through with Xe without
this patch, it would probably be mostly ok.


> >> Yes, it is 1:1 *userspace* engines and drm_sched.
> >>
> >> I'm not really prepared to make large changes to DRM scheduler at the
> >> moment for Xe as they are not really required nor does Boris seem they
> >> will be required for his work either. I am interested to see what Boris
> >> comes up with.
> >>
> >>> Even on the low level, the idea to replace drm_sched threads with
> workers
> >>> has a few problems.
> >>>
> >>> To start with, the pattern of:
> >>>
> >>>    while (not_stopped) {
> >>>     keep picking jobs
> >>>    }
> >>>
> >>> Feels fundamentally in disagreement with workers (while obviously fits
> >>> perfectly with the current kthread design).
> >>
> >> The while loop breaks and worker exists if no jobs are ready.
>

I'm not very familiar with workqueues. What are you saying would fit
better? One scheduling job per work item rather than one big work item
which handles all available jobs?


> >>> Secondly, it probably demands separate workers (not optional),
> otherwise
> >>> behaviour of shared workqueues has either the potential to explode
> number
> >>> kernel threads anyway, or add latency.
> >>>
> >>
> >> Right now the system_unbound_wq is used which does have a limit on the
> >> number of threads, right? I do have a FIXME to allow a worker to be
> >> passed in similar to TDR.
> >>
> >> WRT to latency, the 1:1 ratio could actually have lower latency as 2 GPU
> >> schedulers can be pushing jobs into the backend / cleaning up jobs in
> >> parallel.
> >>
> >
> > Thought of one more point here where why in Xe we absolutely want a 1 to
> > 1 ratio between entity and scheduler - the way we implement timeslicing
> > for preempt fences.
> >
> > Let me try to explain.
> >
> > Preempt fences are implemented via the generic messaging interface [1]
> > with suspend / resume messages. If a suspend messages is received to
> > soon after calling resume (this is per entity) we simply sleep in the
> > suspend call thus giving the entity a timeslice. This completely falls
> > apart with a many to 1 relationship as now a entity waiting for a
> > timeslice blocks the other entities. Could we work aroudn this, sure but
> > just another bunch of code we'd have to add in Xe. Being to freely sleep
> > in backend without affecting other entities is really, really nice IMO
> > and I bet Xe isn't the only driver that is going to feel this way.
> >
> > Last thing I'll say regardless of how anyone feels about Xe using a 1 to
> > 1 relationship this patch IMO makes sense as I hope we can all agree a
> > workqueue scales better than kthreads.
>
> I don't know for sure what will scale better and for what use case,
> combination of CPU cores vs number of GPU engines to keep busy vs other
> system activity. But I wager someone is bound to ask for some numbers to
> make sure proposal is not negatively affecting any other drivers.
>

Then let them ask.  Waving your hands vaguely in the direction of the rest
of DRM and saying "Uh, someone (not me) might object" is profoundly
unhelpful.  Sure, someone might.  That's why it's on dri-devel.  If you
think there's someone in particular who might have a useful opinion on
this, throw them in the CC so they don't miss the e-mail thread.

Or are you asking for numbers?  If so, what numbers are you asking for?

Also, If we're talking about a design that might paint us into an
Intel-HW-specific hole, that would be one thing.  But we're not.  We're
talking about switching which kernel threading/task mechanism to use for
what's really a very generic problem.  The core Xe design works without
this patch (just with more kthreads).  If we land this patch or something
like it and get it wrong and it causes a performance problem for someone
down the line, we can revisit it.


> In any case that's a low level question caused by the high level design
> decision. So I'd think first focus on the high level - which is the 1:1
> mapping of entity to scheduler instance proposal.
>
> Fundamentally it will be up to the DRM maintainers and the community to
> bless your approach. And it is important to stress 1:1 is about
> userspace contexts, so I believe unlike any other current scheduler
> user. And also important to stress this effectively does not make Xe
> _really_ use the scheduler that much.
>

I don't think this makes Xe nearly as much of a one-off as you think it
does.  I've already told the Asahi team working on Apple M1/2 hardware to
do it this way and it seems to be a pretty good mapping for them.  I
believe this is roughly the plan for nouveau as well.  It's not the way it
currently works for anyone because most other groups aren't doing FW
scheduling yet.  In the world of FW scheduling and hardware designed to
support userspace direct-to-FW submit, I think the design makes perfect
sense (see below) and I expect we'll see more drivers move in this
direction as those drivers evolve.  (AMD is doing some customish thing for
how with gpu_scheduler on the front-end somehow.  I've not dug into those
details.)


> I can only offer my opinion, which is that the two options mentioned in
> this thread (either improve drm scheduler to cope with what is required,
> or split up the code so you can use just the parts of drm_sched which
> you want - which is frontend dependency tracking) shouldn't be so
> readily dismissed, given how I think the idea was for the new driver to
> work less in a silo and more in the community (not do kludges to
> workaround stuff because it is thought to be too hard to improve common
> code), but fundamentally, "goto previous paragraph" for what I am
> concerned.
>

Meta comment:  It appears as if you're falling into the standard i915 team
trap of having an internal discussion about what the community discussion
might look like instead of actually having the community discussion.  If
you are seriously concerned about interactions with other drivers or
whether or setting common direction, the right way to do that is to break a
patch or two out into a separate RFC series and tag a handful of driver
maintainers.  Trying to predict the questions other people might ask is
pointless. Cc them and asking for their input instead.


> Regards,
>
> Tvrtko
>
> P.S. And as a related side note, there are more areas where drm_sched
> could be improved, like for instance priority handling.
> Take a look at msm_submitqueue_create / msm_gpu_convert_priority /
> get_sched_entity to see how msm works around the drm_sched hardcoded
> limit of available priority levels, in order to avoid having to leave a
> hw capability unused. I suspect msm would be happier if they could have
> all priority levels equal in terms of whether they apply only at the
> frontend level or completely throughout the pipeline.
>
> > [1] https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1
> >
> >>> What would be interesting to learn is whether the option of refactoring
> >>> drm_sched to deal with out of order completion was considered and what
> were
> >>> the conclusions.
> >>>
> >>
> >> I coded this up a while back when trying to convert the i915 to the DRM
> >> scheduler it isn't all that hard either. The free flow control on the
> >> ring (e.g. set job limit == SIZE OF RING / MAX JOB SIZE) is really what
> >> sold me on the this design.
>

You're not the only one to suggest supporting out-of-order completion.
However, it's tricky and breaks a lot of internal assumptions of the
scheduler. It also reduces functionality a bit because it can no longer
automatically rate-limit HW/FW queues which are often fixed-size.  (Ok,
yes, it probably could but it becomes a substantially harder problem.)

It also seems like a worse mapping to me.  The goal here is to turn
submissions on a userspace-facing engine/queue into submissions to a FW
queue submissions, sorting out any dma_fence dependencies.  Matt's
description of saying this is a 1:1 mapping between sched/entity doesn't
tell the whole story. It's a 1:1:1 mapping between xe_engine,
gpu_scheduler, and GuC FW engine.  Why make it a 1:something:1 mapping?
Why is that better?

There are two places where this 1:1:1 mapping is causing problems:

 1. It creates lots of kthreads. This is what this patch is trying to
solve. IDK if it's solving it the best way but that's the goal.

 2. There are a far more limited number of communication queues between the
kernel and GuC for more meta things like pausing and resuming queues,
getting events back from GuC, etc. Unless we're in a weird pressure
scenario, the amount of traffic on this queue should be low so we can
probably just have one per physical device.  The vast majority of kernel ->
GuC communication should be on the individual FW queue rings and maybe
smashing in-memory doorbells.

Doing out-of-order completion sort-of solves the 1 but does nothing for 2
and actually makes managing FW queues harder because we no longer have
built-in rate limiting.  Seems like a net loss to me.

>>> Second option perhaps to split out the drm_sched code into parts which
> would
> >>> lend themselves more to "pick and choose" of its functionalities.
> >>> Specifically, Xe wants frontend dependency tracking, but not any
> scheduling
> >>> really (neither least busy drm_sched, neither FIFO/RQ entity picking),
> so
> >>> even having all these data structures in memory is a waste.
> >>>
> >>
> >> I don't think that we are wasting memory is a very good argument for
> >> making intrusive changes to the DRM scheduler.
>

Worse than that, I think the "we could split it up" kind-of misses the
point of the way Xe is using drm/scheduler.  It's not just about re-using a
tiny bit of dependency tracking code.  Using the scheduler in this way
provides a clean separation between front-end and back-end.  The job of the
userspace-facing ioctl code is to shove things on the scheduler.  The job
of the run_job callback is to encode the job into the FW queue format,
stick it in the FW queue ring, and maybe smash a doorbell.  Everything else
happens in terms of managing those queues side-band.  The gpu_scheduler
code manages the front-end queues and Xe manages the FW queues via the
Kernel <-> GuC communication rings.  From a high level, this is a really
clean design.  There are potentially some sticky bits around the dual-use
of dma_fence for scheduling and memory management but none of those are
solved by breaking the DRM scheduler into chunks or getting rid of the
1:1:1 mapping.

If we split it out, we're basically asking the driver to implement a bunch
of kthread or workqueue stuff, all the ring rate-limiting, etc.  It may not
be all that much code but also, why?  To save a few bytes of memory per
engine?  Each engine already has 32K(ish) worth of context state and a
similar size ring to communicate with the FW.  No one is going to notice an
extra CPU data structure.

I'm not seeing a solid argument against the 1:1:1 design here other than
that it doesn't seem like the way DRM scheduler was intended to be used.  I
won't argue that.  It's not.  But it is a fairly natural way to take
advantage of the benefits the DRM scheduler does provide while also mapping
it to hardware that was designed for userspace direct-to-FW submit.

--Jason



> >>> With the first option then the end result could be drm_sched per engine
> >>> class (hardware view), which I think fits with the GuC model. Give all
> >>> schedulable contexts (entities) to the GuC and then mostly forget about
> >>> them. Timeslicing and re-ordering and all happens transparently to the
> >>> kernel from that point until completion.
> >>>
> >>
> >> Out-of-order problem still exists here.
> >>
> >>> Or with the second option you would build on some smaller refactored
> >>> sub-components of drm_sched, by maybe splitting the dependency
> tracking from
> >>> scheduling (RR/FIFO entity picking code).
> >>>
> >>> Second option is especially a bit vague and I haven't thought about the
> >>> required mechanics, but it just appeared too obvious the proposed
> design has
> >>> a bit too much impedance mismatch.
> >>>
> >>
> >> IMO ROI on this is low and again lets see what Boris comes up with.
> >>
> >> Matt
> >>
> >>> Oh and as a side note, when I went into the drm_sched code base to
> remind
> >>> myself how things worked, it is quite easy to find some FIXME comments
> which
> >>> suggest people working on it are unsure of locking desing there and
> such. So
> >>> perhaps that all needs cleanup too, I mean would benefit from
> >>> refactoring/improving work as brainstormed above anyway.
> >>>
> >>> Regards,
> >>>
> >>> Tvrtko
>

--00000000000000343805f1d81560
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Jan 9, 2023 at 7:46 AM Tvrtko Ursulin &lt;<a href=3D"mailto:=
tvrtko.ursulin@linux.intel.com">tvrtko.ursulin@linux.intel.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 06/01/2023 23:52, Matthew Brost wrote:<br>
&gt; On Thu, Jan 05, 2023 at 09:43:41PM +0000, Matthew Brost wrote:<br>
&gt;&gt; On Tue, Jan 03, 2023 at 01:02:15PM +0000, Tvrtko Ursulin wrote:<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 02/01/2023 07:30, Boris Brezillon wrote:<br>
&gt;&gt;&gt;&gt; On Fri, 30 Dec 2022 12:55:08 +0100<br>
&gt;&gt;&gt;&gt; Boris Brezillon &lt;<a href=3D"mailto:boris.brezillon@coll=
abora.com" target=3D"_blank">boris.brezillon@collabora.com</a>&gt; wrote:<b=
r>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On Fri, 30 Dec 2022 11:20:42 +0100<br>
&gt;&gt;&gt;&gt;&gt; Boris Brezillon &lt;<a href=3D"mailto:boris.brezillon@=
collabora.com" target=3D"_blank">boris.brezillon@collabora.com</a>&gt; wrot=
e:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Hello Matthew,<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; On Thu, 22 Dec 2022 14:21:11 -0800<br>
&gt;&gt;&gt;&gt;&gt;&gt; Matthew Brost &lt;<a href=3D"mailto:matthew.brost@=
intel.com" target=3D"_blank">matthew.brost@intel.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; In XE, the new Intel GPU driver, a choice has =
made to have a 1 to 1<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; mapping between a drm_gpu_scheduler and drm_sc=
hed_entity. At first this<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; seems a bit odd but let us explain the reasoni=
ng below.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; 1. In XE the submission order from multiple dr=
m_sched_entity is not<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; guaranteed to be the same completion even if t=
argeting the same hardware<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; engine. This is because in XE we have a firmwa=
re scheduler, the GuC,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; which allowed to reorder, timeslice, and preem=
pt submissions. If a using<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; shared drm_gpu_scheduler across multiple drm_s=
ched_entity, the TDR falls<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; apart as the TDR expects submission order =3D=
=3D completion order. Using a<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; dedicated drm_gpu_scheduler per drm_sched_enti=
ty solve this problem.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Oh, that&#39;s interesting. I&#39;ve been trying t=
o solve the same sort of<br>
&gt;&gt;&gt;&gt;&gt;&gt; issues to support Arm&#39;s new Mali GPU which is =
relying on a FW-assisted<br>
&gt;&gt;&gt;&gt;&gt;&gt; scheduling scheme (you give the FW N streams to ex=
ecute, and it does<br>
&gt;&gt;&gt;&gt;&gt;&gt; the scheduling between those N command streams, th=
e kernel driver<br>
&gt;&gt;&gt;&gt;&gt;&gt; does timeslice scheduling to update the command st=
reams passed to the<br>
&gt;&gt;&gt;&gt;&gt;&gt; FW). I must admit I gave up on using drm_sched at =
some point, mostly<br>
&gt;&gt;&gt;&gt;&gt;&gt; because the integration with drm_sched was painful=
, but also because I<br>
&gt;&gt;&gt;&gt;&gt;&gt; felt trying to bend drm_sched to make it interact =
with a<br>
&gt;&gt;&gt;&gt;&gt;&gt; timeslice-oriented scheduling model wasn&#39;t rea=
lly future proof. Giving<br>
&gt;&gt;&gt;&gt;&gt;&gt; drm_sched_entity exlusive access to a drm_gpu_sche=
duler probably might<br>
&gt;&gt;&gt;&gt;&gt;&gt; help for a few things (didn&#39;t think it through=
 yet), but I feel it&#39;s<br>
&gt;&gt;&gt;&gt;&gt;&gt; coming short on other aspects we have to deal with=
 on Arm GPUs.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Ok, so I just had a quick look at the Xe driver and ho=
w it<br>
&gt;&gt;&gt;&gt;&gt; instantiates the drm_sched_entity and drm_gpu_schedule=
r, and I think I<br>
&gt;&gt;&gt;&gt;&gt; have a better understanding of how you get away with u=
sing drm_sched<br>
&gt;&gt;&gt;&gt;&gt; while still controlling how scheduling is really done.=
 Here<br>
&gt;&gt;&gt;&gt;&gt; drm_gpu_scheduler is just a dummy abstract that let&#3=
9;s you use the<br>
&gt;&gt;&gt;&gt;&gt; drm_sched job queuing/dep/tracking mechanism. The whol=
e run-queue<br>
&gt;&gt;&gt;&gt;&gt; selection is dumb because there&#39;s only one entity =
ever bound to the<br>
&gt;&gt;&gt;&gt;&gt; scheduler (the one that&#39;s part of the xe_guc_engin=
e object which also<br>
&gt;&gt;&gt;&gt;&gt; contains the drm_gpu_scheduler instance). I guess the =
main issue we&#39;d<br>
&gt;&gt;&gt;&gt;&gt; have on Arm is the fact that the stream doesn&#39;t ne=
cessarily get<br>
&gt;&gt;&gt;&gt;&gt; scheduled when -&gt;run_job() is called, it can be pla=
ced in the runnable<br>
&gt;&gt;&gt;&gt;&gt; queue and be picked later by the kernel-side scheduler=
 when a FW slot<br>
&gt;&gt;&gt;&gt;&gt; gets released. That can probably be sorted out by manu=
ally disabling the<br>
&gt;&gt;&gt;&gt;&gt; job timer and re-enabling it when the stream gets pick=
ed by the<br>
&gt;&gt;&gt;&gt;&gt; scheduler. But my main concern remains, we&#39;re basi=
cally abusing<br>
&gt;&gt;&gt;&gt;&gt; drm_sched here.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; For the Arm driver, that means turning the following s=
equence<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; 1. wait for job deps<br>
&gt;&gt;&gt;&gt;&gt; 2. queue job to ringbuf and push the stream to the run=
nable<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 queue (if it wasn&#39;t queued alr=
eady). Wakeup the timeslice scheduler<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 to re-evaluate (if the stream is n=
ot on a FW slot already)<br>
&gt;&gt;&gt;&gt;&gt; 3. stream gets picked by the timeslice scheduler and s=
ent to the FW for<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 execution<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; into<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; 1. queue job to entity which takes care of waiting for=
 job deps for<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 us<br>
&gt;&gt;&gt;&gt;&gt; 2. schedule a drm_sched_main iteration<br>
&gt;&gt;&gt;&gt;&gt; 3. the only available entity is picked, and the first =
job from this<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 entity is dequeued. -&gt;run_job()=
 is called: the job is queued to the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ringbuf and the stream is pushed t=
o the runnable queue (if it wasn&#39;t<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 queued already). Wakeup the timesl=
ice scheduler to re-evaluate (if<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 the stream is not on a FW slot alr=
eady)<br>
&gt;&gt;&gt;&gt;&gt; 4. stream gets picked by the timeslice scheduler and s=
ent to the FW for<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 execution<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; That&#39;s one extra step we don&#39;t really need. To=
 sum-up, yes, all the<br>
&gt;&gt;&gt;&gt;&gt; job/entity tracking might be interesting to share/re-u=
se, but I wonder<br>
&gt;&gt;&gt;&gt;&gt; if we couldn&#39;t have that without pulling out the s=
cheduling part of<br>
&gt;&gt;&gt;&gt;&gt; drm_sched, or maybe I&#39;m missing something, and the=
re&#39;s something in<br>
&gt;&gt;&gt;&gt;&gt; drm_gpu_scheduler you really need.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On second thought, that&#39;s probably an acceptable overh=
ead (not even<br>
&gt;&gt;&gt;&gt; sure the extra step I was mentioning exists in practice, b=
ecause dep<br>
&gt;&gt;&gt;&gt; fence signaled state is checked as part of the drm_sched_m=
ain<br>
&gt;&gt;&gt;&gt; iteration, so that&#39;s basically replacing the worker I =
schedule to<br>
&gt;&gt;&gt;&gt; check job deps), and I like the idea of being able to re-u=
se drm_sched<br>
&gt;&gt;&gt;&gt; dep-tracking without resorting to invasive changes to the =
existing<br>
&gt;&gt;&gt;&gt; logic, so I&#39;ll probably give it a try.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I agree with the concerns and think that how Xe proposes to in=
tegrate with<br>
&gt;&gt;&gt; drm_sched is a problem, or at least significantly inelegant.<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Inelegant is a matter of opinion, I actually rather like this solu=
tion.<br>
&gt;&gt;<br>
&gt;&gt; BTW this isn&#39;t my design rather this was Jason&#39;s idea.<br>=
</blockquote><div><br></div><div>Sure, throw me under the bus, why don&#39;=
t you? :-P=C2=A0 Nah, it&#39;s all fine.=C2=A0 It&#39;s my design and I&#39=
;m happy to defend it or be blamed for it in the history books as the case =
may be.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt;&gt;&gt; AFAICT it proposes to have 1:1 between *userspace* created con=
texts (per<br>
&gt;&gt;&gt; context _and_ engine) and drm_sched. I am not sure avoiding in=
vasive changes<br>
&gt;&gt;&gt; to the shared code is in the spirit of the overall idea and in=
stead<br>
&gt;&gt;&gt; opportunity should be used to look at way to refactor/improve =
drm_sched.<br></blockquote><div><br></div><div>Maybe?=C2=A0 I&#39;m not con=
vinced that what Xe is doing is an abuse at all or really needs to drive a =
re-factor.=C2=A0 (More on that later.)=C2=A0 There&#39;s only one real issu=
e which is that it fires off potentially a lot of kthreads. Even that&#39;s=
 not that bad given that kthreads are pretty light and you&#39;re not likel=
y to have more kthreads than userspace threads which are much heavier.=C2=
=A0 Not ideal, but not the end of the world either.=C2=A0 Definitely someth=
ing we can/should optimize but if we went through with Xe without this patc=
h, it would probably be mostly ok.<br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
&gt;&gt; Yes, it is 1:1 *userspace* engines and drm_sched.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m not really prepared to make large changes to DRM scheduler=
 at the<br>
&gt;&gt; moment for Xe as they are not really required nor does Boris seem =
they<br>
&gt;&gt; will be required for his work either. I am interested to see what =
Boris<br>
&gt;&gt; comes up with.<br>
&gt;&gt;<br>
&gt;&gt;&gt; Even on the low level, the idea to replace drm_sched threads w=
ith workers<br>
&gt;&gt;&gt; has a few problems.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; To start with, the pattern of:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 while (not_stopped) {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0keep picking jobs<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Feels fundamentally in disagreement with workers (while obviou=
sly fits<br>
&gt;&gt;&gt; perfectly with the current kthread design).<br>
&gt;&gt;<br>
&gt;&gt; The while loop breaks and worker exists if no jobs are ready.<br><=
/blockquote><div><br></div><div>I&#39;m not very familiar with workqueues. =
What are you saying would fit better? One scheduling job per work item rath=
er than one big work item which handles all available jobs?</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt;&gt; Secondly, it probably demands separate workers (not optional),=
 otherwise<br>
&gt;&gt;&gt; behaviour of shared workqueues has either the potential to exp=
lode number<br>
&gt;&gt;&gt; kernel threads anyway, or add latency.<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Right now the system_unbound_wq is used which does have a limit on=
 the<br>
&gt;&gt; number of threads, right? I do have a FIXME to allow a worker to b=
e<br>
&gt;&gt; passed in similar to TDR.<br>
&gt;&gt;<br>
&gt;&gt; WRT to latency, the 1:1 ratio could actually have lower latency as=
 2 GPU<br>
&gt;&gt; schedulers can be pushing jobs into the backend / cleaning up jobs=
 in<br>
&gt;&gt; parallel.<br>
&gt;&gt;<br>
&gt; <br>
&gt; Thought of one more point here where why in Xe we absolutely want a 1 =
to<br>
&gt; 1 ratio between entity and scheduler - the way we implement timeslicin=
g<br>
&gt; for preempt fences.<br>
&gt; <br>
&gt; Let me try to explain.<br>
&gt; <br>
&gt; Preempt fences are implemented via the generic messaging interface [1]=
<br>
&gt; with suspend / resume messages. If a suspend messages is received to<b=
r>
&gt; soon after calling resume (this is per entity) we simply sleep in the<=
br>
&gt; suspend call thus giving the entity a timeslice. This completely falls=
<br>
&gt; apart with a many to 1 relationship as now a entity waiting for a<br>
&gt; timeslice blocks the other entities. Could we work aroudn this, sure b=
ut<br>
&gt; just another bunch of code we&#39;d have to add in Xe. Being to freely=
 sleep<br>
&gt; in backend without affecting other entities is really, really nice IMO=
<br>
&gt; and I bet Xe isn&#39;t the only driver that is going to feel this way.=
<br>
&gt; <br>
&gt; Last thing I&#39;ll say regardless of how anyone feels about Xe using =
a 1 to<br>
&gt; 1 relationship this patch IMO makes sense as I hope we can all agree a=
<br>
&gt; workqueue scales better than kthreads.<br>
<br>
I don&#39;t know for sure what will scale better and for what use case, <br=
>
combination of CPU cores vs number of GPU engines to keep busy vs other <br=
>
system activity. But I wager someone is bound to ask for some numbers to <b=
r>
make sure proposal is not negatively affecting any other drivers.<br></bloc=
kquote><div><br></div><div>Then let them ask.=C2=A0 Waving your hands vague=
ly in the direction of the rest of DRM and saying
 &quot;Uh, someone (not me) might object&quot; is profoundly unhelpful.=C2=
=A0 Sure, someone might.=C2=A0 That&#39;s why it&#39;s on dri-devel.=C2=A0 =
If you think there&#39;s someone in particular who might have a useful opin=
ion on this, throw them in the CC so they don&#39;t miss the e-mail thread.=
<br></div><div><br></div><div>Or are you asking for numbers?=C2=A0 If so, w=
hat numbers are you asking for?<br></div><div><br></div><div>Also, If we&#3=
9;re talking about a design that might paint us into an Intel-HW-specific h=
ole, that would be one thing.=C2=A0 But we&#39;re not.=C2=A0 We&#39;re talk=
ing about switching which kernel threading/task mechanism to use for what&#=
39;s really a very generic problem.=C2=A0 The core Xe design works without =
this patch (just with more kthreads).=C2=A0 If we land this patch or someth=
ing like it and get it wrong and it causes a performance problem for someon=
e down the line, we can revisit it.<br></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
In any case that&#39;s a low level question caused by the high level design=
 <br>
decision. So I&#39;d think first focus on the high level - which is the 1:1=
 <br>
mapping of entity to scheduler instance proposal.<br>
<br>
Fundamentally it will be up to the DRM maintainers and the community to <br=
>
bless your approach. And it is important to stress 1:1 is about <br>
userspace contexts, so I believe unlike any other current scheduler <br>
user. And also important to stress this effectively does not make Xe <br>
_really_ use the scheduler that much.<br></blockquote><div><br></div><div>I=
 don&#39;t think this makes Xe nearly as much of a one-off as you think it=
=20
does.=C2=A0 I&#39;ve already told the Asahi team working on Apple M1/2 hard=
ware=20
to do it this way and it seems to be a pretty good mapping for them.=C2=A0=
=20
I believe this is roughly the plan for nouveau as well.=C2=A0 It&#39;s not=
=20
the way it currently works for anyone because most other groups aren&#39;t=
=20
doing FW scheduling yet.=C2=A0 In the world of FW scheduling and hardware d=
esigned to support userspace direct-to-FW submit, I think the design makes =
perfect sense (see below) and I expect we&#39;ll see more drivers move in t=
his direction as those drivers evolve.=C2=A0 (AMD is doing some customish t=
hing for how with gpu_scheduler on the front-end somehow.=C2=A0=20
I&#39;ve not dug into those details.)</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
I can only offer my opinion, which is that the two options mentioned in <br=
>
this thread (either improve drm scheduler to cope with what is required, <b=
r>
or split up the code so you can use just the parts of drm_sched which <br>
you want - which is frontend dependency tracking) shouldn&#39;t be so <br>
readily dismissed, given how I think the idea was for the new driver to <br=
>
work less in a silo and more in the community (not do kludges to <br>
workaround stuff because it is thought to be too hard to improve common <br=
>
code), but fundamentally, &quot;goto previous paragraph&quot; for what I am=
 concerned.<br></blockquote><div><br></div><div>Meta comment:=C2=A0 It appe=
ars as if you&#39;re falling into the standard i915 team trap of having an =
internal discussion about what the community discussion might look like ins=
tead of actually having the community discussion.=C2=A0 If you are seriousl=
y concerned about interactions with other drivers or whether or setting com=
mon direction, the right way to do that is to break a patch or two out into=
 a separate RFC series and tag a handful of driver maintainers.=C2=A0 Tryin=
g to predict the questions other people might ask is pointless. Cc them and=
 asking for their input instead.<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
Regards,<br>
<br>
Tvrtko<br>
<br>
P.S. And as a related side note, there are more areas where drm_sched <br>
could be improved, like for instance priority handling.<br>
Take a look at msm_submitqueue_create / msm_gpu_convert_priority / <br>
get_sched_entity to see how msm works around the drm_sched hardcoded <br>
limit of available priority levels, in order to avoid having to leave a <br=
>
hw capability unused. I suspect msm would be happier if they could have <br=
>
all priority levels equal in terms of whether they apply only at the <br>
frontend level or completely throughout the pipeline.<br>
<br>
&gt; [1] <a href=3D"https://patchwork.freedesktop.org/patch/515857/?series=
=3D112189&amp;rev=3D1" rel=3D"noreferrer" target=3D"_blank">https://patchwo=
rk.freedesktop.org/patch/515857/?series=3D112189&amp;rev=3D1</a><br>
&gt; <br>
&gt;&gt;&gt; What would be interesting to learn is whether the option of re=
factoring<br>
&gt;&gt;&gt; drm_sched to deal with out of order completion was considered =
and what were<br>
&gt;&gt;&gt; the conclusions.<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I coded this up a while back when trying to convert the i915 to th=
e DRM<br>
&gt;&gt; scheduler it isn&#39;t all that hard either. The free flow control=
 on the<br>
&gt;&gt; ring (e.g. set job limit =3D=3D SIZE OF RING / MAX JOB SIZE) is re=
ally what<br>
&gt;&gt; sold me on the this design.<br></blockquote><div><br></div><div>Yo=
u&#39;re not the only one to suggest supporting out-of-order completion. Ho=
wever, it&#39;s tricky and breaks a lot of internal assumptions of the sche=
duler. It also reduces functionality a bit because it can no longer automat=
ically rate-limit HW/FW queues which are often fixed-size.=C2=A0 (Ok, yes, =
it probably could but it becomes a substantially harder problem.)</div><div=
><br></div><div>It also seems like a worse mapping to me.=C2=A0 The goal he=
re is to turn submissions on a userspace-facing engine/queue into submissio=
ns to a FW queue submissions, sorting out any dma_fence dependencies.=C2=A0=
 Matt&#39;s description of saying this is a 1:1 mapping between sched/entit=
y doesn&#39;t tell the whole story. It&#39;s a 1:1:1 mapping between xe_eng=
ine, gpu_scheduler, and GuC FW engine.=C2=A0 Why make it a 1:something:1 ma=
pping?=C2=A0 Why is that better?</div><div><br></div><div>There are two pla=
ces where this 1:1:1 mapping is causing problems:</div><div><br></div><div>=
=C2=A01. It creates lots of kthreads. This is what this patch is trying to =
solve. IDK if it&#39;s solving it the best way but that&#39;s the goal.</di=
v><div><br></div><div>=C2=A02. There are a far more limited number of commu=
nication queues between the kernel and GuC for more meta things like pausin=
g and resuming queues, getting events back from GuC, etc. Unless we&#39;re =
in a weird pressure scenario, the amount of traffic on this queue should be=
 low so we can probably just have one per physical device.=C2=A0 The vast m=
ajority of kernel -&gt; GuC communication should be on the individual FW qu=
eue rings and maybe smashing in-memory doorbells.</div><div><br></div><div>=
Doing out-of-order completion sort-of solves the 1 but does nothing for 2 a=
nd actually makes managing FW queues harder because we no longer have built=
-in rate limiting.=C2=A0 Seems like a net loss to me.<br></div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt;&gt; Second option perhaps to split out the drm_sched code into par=
ts which would<br>
&gt;&gt;&gt; lend themselves more to &quot;pick and choose&quot; of its fun=
ctionalities.<br>
&gt;&gt;&gt; Specifically, Xe wants frontend dependency tracking, but not a=
ny scheduling<br>
&gt;&gt;&gt; really (neither least busy drm_sched, neither FIFO/RQ entity p=
icking), so<br>
&gt;&gt;&gt; even having all these data structures in memory is a waste.<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t think that we are wasting memory is a very good argume=
nt for<br>
&gt;&gt; making intrusive changes to the DRM scheduler.<br></blockquote><di=
v><br></div><div>Worse than that, I think the &quot;we could split it up&qu=
ot; kind-of misses the point of the way Xe is using drm/scheduler.=C2=A0 It=
&#39;s not just about re-using a tiny bit of dependency tracking code.=C2=
=A0 Using the scheduler in this way provides a clean separation between fro=
nt-end and back-end.=C2=A0 The job of the userspace-facing ioctl code is to=
 shove things on the scheduler.=C2=A0 The job of the run_job callback is to=
 encode the job into the FW queue format, stick it in the FW queue ring, an=
d maybe smash a doorbell.=C2=A0 Everything else happens in terms of managin=
g those queues side-band.=C2=A0 The gpu_scheduler code manages the front-en=
d queues and Xe manages the FW queues via the Kernel &lt;-&gt; GuC communic=
ation rings.=C2=A0 From a high level, this is a really clean design.=C2=A0 =
There are potentially some sticky bits around the dual-use of dma_fence for=
 scheduling and memory management but none of those are solved by breaking =
the DRM scheduler into chunks or getting rid of the 1:1:1 mapping.<br></div=
><div><br></div><div>If we split it out, we&#39;re basically asking the dri=
ver to implement a bunch of kthread or workqueue stuff, all the ring rate-l=
imiting, etc.=C2=A0 It may not be all that much code but also, why?=C2=A0 T=
o save a few bytes of memory per engine?=C2=A0 Each engine already has 32K(=
ish) worth of context state and a similar size ring to communicate with the=
 FW.=C2=A0 No one is going to notice an extra CPU data structure.</div><div=
><br></div><div>I&#39;m not seeing a solid argument against the 1:1:1 desig=
n here other than that it doesn&#39;t seem like the way DRM scheduler was i=
ntended to be used.=C2=A0 I won&#39;t argue that.=C2=A0 It&#39;s not.=C2=A0=
 But it is a fairly natural way to take advantage of the benefits the DRM s=
cheduler does provide while also mapping it to hardware that was designed f=
or userspace direct-to-FW submit.</div><div><br></div><div>--Jason</div><di=
v><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
&gt;&gt;&gt; With the first option then the end result could be drm_sched p=
er engine<br>
&gt;&gt;&gt; class (hardware view), which I think fits with the GuC model. =
Give all<br>
&gt;&gt;&gt; schedulable contexts (entities) to the GuC and then mostly for=
get about<br>
&gt;&gt;&gt; them. Timeslicing and re-ordering and all happens transparentl=
y to the<br>
&gt;&gt;&gt; kernel from that point until completion.<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Out-of-order problem still exists here.<br>
&gt;&gt;<br>
&gt;&gt;&gt; Or with the second option you would build on some smaller refa=
ctored<br>
&gt;&gt;&gt; sub-components of drm_sched, by maybe splitting the dependency=
 tracking from<br>
&gt;&gt;&gt; scheduling (RR/FIFO entity picking code).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Second option is especially a bit vague and I haven&#39;t thou=
ght about the<br>
&gt;&gt;&gt; required mechanics, but it just appeared too obvious the propo=
sed design has<br>
&gt;&gt;&gt; a bit too much impedance mismatch.<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; IMO ROI on this is low and again lets see what Boris comes up with=
.<br>
&gt;&gt;<br>
&gt;&gt; Matt<br>
&gt;&gt;<br>
&gt;&gt;&gt; Oh and as a side note, when I went into the drm_sched code bas=
e to remind<br>
&gt;&gt;&gt; myself how things worked, it is quite easy to find some FIXME =
comments which<br>
&gt;&gt;&gt; suggest people working on it are unsure of locking desing ther=
e and such. So<br>
&gt;&gt;&gt; perhaps that all needs cleanup too, I mean would benefit from<=
br>
&gt;&gt;&gt; refactoring/improving work as brainstormed above anyway.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Tvrtko<br>
</blockquote></div></div>

--00000000000000343805f1d81560--
