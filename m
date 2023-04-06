Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 068146D9E2E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 19:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999EF10EC62;
	Thu,  6 Apr 2023 17:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57BB10E346
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 17:09:33 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 v2-20020a4ac902000000b005419421eff5so197300ooq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 10:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680800973;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dOTuvvRX8E86S9xd1w4ZAwjv++Bqe0GGEdg021NRFTw=;
 b=SwK6YjS1Bj/QrEJ/BGvyGLN801+rmzRCF0lXfQ4qV72CkRXyZrBBOb2uO3Xcw3+D8i
 s9EhuJA57WN0WpUwvQ+qc/THHzObxMbmDIKNdM5okr8Sb6gvwNuoKkUuUEJb1zhRx2CH
 b0MJ6GO7wI8bjdFEHpWFQcAxuM5qveGQvRb/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680800973;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dOTuvvRX8E86S9xd1w4ZAwjv++Bqe0GGEdg021NRFTw=;
 b=6RFAPx/JoL/E5JvJGedu1fqvoqgo7dzo9YRG/2UfAxWbgJynIf3RylxAgQwdJofKaS
 TPfxUe7yxzkRFyxDWAWZKvdZNWBjG5vRPj1IRncbhv9LYZbpTJcwO8KsreuwWWJ6lckS
 jBrez0LW9iEMHMgr5830K35sMRNZQbszaNKe+XZMnYh0hx09Ei5urqcuqnS5QmEpwDPF
 10vahVvRYfxRms1avyypOqbwe6AfrlyR6524mP3r8hlRx20+5qM2y+EMI6beyHfeeOSi
 CvCNYRf4xV3l417OAzhuM+J+afa06NxuSkdll9AEIljOWnVoPh+qV4by+pDKElBGkzFJ
 fxHg==
X-Gm-Message-State: AAQBX9e38xKhle2FgDKXbdEmkxllVx2OY682UnmYzlf0YicNtoKwhT5f
 FU1YTEaX/FCMx0WTtELU1f0/HkVdJf+ydAl3jTWyrE127QdlMaqG
X-Google-Smtp-Source: AKy350ZhXCoYZVgqbR6QE5FlENiBS6socZruSbdRtD/Qsc1MrDLM9+06C6kAUTk3fY2Hr/WrudJkVQpuCwJAwCgpp0g=
X-Received: by 2002:a4a:c617:0:b0:53f:136a:13d0 with SMTP id
 l23-20020a4ac617000000b0053f136a13d0mr2685177ooq.0.1680800972670; Thu, 06 Apr
 2023 10:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
 <f7b3b70b-c798-b09e-210c-f84eaafd3251@linux.intel.com>
 <5b2e6a78-b743-028c-f54d-af38c130164a@amd.com>
 <16a3a3fd-47c7-d74d-4835-9438ef8d2635@shipmail.org>
 <ZCx0P7GwLh2yOVR4@DUT025-TGLU.fm.intel.com>
 <ZCx5wGTA3RCZGjA4@phenom.ffwll.local>
 <ZCx/C4cOwPcPQZ0R@DUT025-TGLU.fm.intel.com>
 <ZC1y9ON07yTYNTz6@phenom.ffwll.local>
 <ZC4LNOuOza9RX9TJ@DUT025-TGLU.fm.intel.com>
 <ZC5nm73p6SByTXDn@phenom.ffwll.local>
 <ZC76OWKHmjwfx7mo@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZC76OWKHmjwfx7mo@DUT025-TGLU.fm.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 6 Apr 2023 19:09:21 +0200
Message-ID: <CAKMK7uGAy7UrCa097trXbEwLR6bZ27DnnFX6Yo_2s40N4u848g@mail.gmail.com>
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: robdclark@chromium.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@linux.ie, lina@asahilina.net,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 boris.brezillon@collabora.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 6 Apr 2023 at 18:58, Matthew Brost <matthew.brost@intel.com> wrote:
>
> On Thu, Apr 06, 2023 at 08:32:59AM +0200, Daniel Vetter wrote:
> > On Wed, Apr 05, 2023 at 11:58:44PM +0000, Matthew Brost wrote:
> > > On Wed, Apr 05, 2023 at 03:09:08PM +0200, Daniel Vetter wrote:
> > > > On Tue, Apr 04, 2023 at 07:48:27PM +0000, Matthew Brost wrote:
> > > > > On Tue, Apr 04, 2023 at 09:25:52PM +0200, Daniel Vetter wrote:
> > > > > > On Tue, Apr 04, 2023 at 07:02:23PM +0000, Matthew Brost wrote:
> > > > > > > On Tue, Apr 04, 2023 at 08:14:01PM +0200, Thomas Hellstr=C3=
=B6m (Intel) wrote:
> > > > > > > >
> > > > > > > > On 4/4/23 15:10, Christian K=C3=B6nig wrote:
> > > > > > > > > Am 04.04.23 um 14:54 schrieb Thomas Hellstr=C3=B6m:
> > > > > > > > > > Hi, Christian,
> > > > > > > > > >
> > > > > > > > > > On 4/4/23 11:09, Christian K=C3=B6nig wrote:
> > > > > > > > > > > Am 04.04.23 um 02:22 schrieb Matthew Brost:
> > > > > > > > > > > > From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux=
.intel.com>
> > > > > > > > > > > >
> > > > > > > > > > > > For long-running workloads, drivers either need to =
open-code
> > > > > > > > > > > > completion
> > > > > > > > > > > > waits, invent their own synchronization primitives =
or internally use
> > > > > > > > > > > > dma-fences that do not obey the cross-driver dma-fe=
nce protocol, but
> > > > > > > > > > > > without any lockdep annotation all these approaches=
 are error prone.
> > > > > > > > > > > >
> > > > > > > > > > > > So since for example the drm scheduler uses dma-fen=
ces it is
> > > > > > > > > > > > desirable for
> > > > > > > > > > > > a driver to be able to use it for throttling and er=
ror
> > > > > > > > > > > > handling also with
> > > > > > > > > > > > internal dma-fences tha do not obey the cros-driver
> > > > > > > > > > > > dma-fence protocol.
> > > > > > > > > > > >
> > > > > > > > > > > > Introduce long-running completion fences in form of
> > > > > > > > > > > > dma-fences, and add
> > > > > > > > > > > > lockdep annotation for them. In particular:
> > > > > > > > > > > >
> > > > > > > > > > > > * Do not allow waiting under any memory management =
locks.
> > > > > > > > > > > > * Do not allow to attach them to a dma-resv object.
> > > > > > > > > > > > * Introduce a new interface for adding callbacks ma=
king the
> > > > > > > > > > > > helper adding
> > > > > > > > > > > >    a callback sign off on that it is aware that the=
 dma-fence may not
> > > > > > > > > > > >    complete anytime soon. Typically this will be th=
e
> > > > > > > > > > > > scheduler chaining
> > > > > > > > > > > >    a new long-running fence on another one.
> > > > > > > > > > >
> > > > > > > > > > > Well that's pretty much what I tried before:
> > > > > > > > > > > https://lwn.net/Articles/893704/
> > > > > > > > > > >
> > > > > > >
> > > > > > > I don't think this quite the same, this explictly enforces th=
at we don't
> > > > > > > break the dma-fence rules (in path of memory allocations, exp=
orted in
> > > > > > > any way), essentially this just SW sync point reusing dma-fen=
ce the
> > > > > > > infrastructure for signaling / callbacks. I believe your seri=
es tried to
> > > > > > > export these fences to user space (admittedly I haven't fully=
 read your
> > > > > > > series).
> > > > > > >
> > > > > > > In this use case we essentially just want to flow control the=
 ring via
> > > > > > > the dma-scheduler + maintain a list of pending jobs so the TD=
R can be
> > > > > > > used for cleanup if LR entity encounters an error. To me this=
 seems
> > > > > > > perfectly reasonable but I know dma-femce rules are akin to a=
 holy war.
> > > > > > >
> > > > > > > If we return NULL in run_job, now we have to be able to sink =
all jobs
> > > > > > > in the backend regardless on ring space, maintain a list of j=
obs pending
> > > > > > > for cleanup after errors, and write a different cleanup path =
as now the
> > > > > > > TDR doesn't work. Seems very, very silly to duplicate all of =
this code
> > > > > > > when the DRM scheduler provides all of this for us. Also if w=
e go this
> > > > > > > route, now all drivers are going to invent ways to handle LR =
jobs /w the
> > > > > > > DRM scheduler.
> > > > > > >
> > > > > > > This solution is pretty clear, mark the scheduler as LR, and =
don't
> > > > > > > export any fences from the scheduler. If you try to export th=
ese fences
> > > > > > > a blow up happens.
> > > > > >
> > > > > > The problem is if you mix things up. Like for resets you need a=
ll the
> > > > > > schedulers on an engine/set-of-engines to quiescent or things g=
et
> > > > > > potentially hilarious. If you now have a scheduler in forever l=
imbo, the
> > > > > > dma_fence guarantees are right out the window.
> > > > > >
> > > > >
> > > > > Right, a GT reset on Xe is:
> > > > >
> > > > > Stop all schedulers
> > > > > Do a reset
> > > > > Ban any schedulers which we think caused the GT reset
> > > > > Resubmit all schedulers which we think were good
> > > > > Restart all schedulers
> > > > >
> > > > > None of this flow depends on LR dma-fences, all of this uses the =
DRM
> > > > > sched infrastructure and work very well compared to the i915. Rew=
riting
> > > > > all this with a driver specific implementation is what we are try=
ing to
> > > > > avoid.
> > > > >
> > > > > Similarly if LR entity hangs on its own (not a GT reset, rather t=
he
> > > > > firmware does the reset for us) we use all the DRM scheduler
> > > > > infrastructure to handle this. Again this works rather well...
> > > >
> > > > Yeah this is why I don't think duplicating everything that long-run=
ning
> > > > jobs need makes any sense. iow I agree with you.
> > > >
> > >
> > > Glad we agree.
> > >
> > > > > > But the issue you're having is fairly specific if it's just abo=
ut
> > > > > > ringspace. I think the dumbest fix is to just block in submit i=
f you run
> > > > > > out of per-ctx ringspace, and call it a day. This notion that s=
omehow the
> > > > >
> > > > > How does that not break the dma-fence rules? A job can publish it=
s
> > > > > finished fence after ARM, if the finished fence fence waits on ri=
ng
> > > > > space that may not free up in a reasonable amount of time we now =
have
> > > > > broken the dma-dence rules. My understanding is any dma-fence mus=
t only
> > > > > on other dma-fence, Christian seems to agree and NAK'd just block=
ing if
> > > > > no space available [1]. IMO this series ensures we don't break dm=
a-fence
> > > > > rules by restricting how the finished fence can be used.
> > > >
> > > > Oh I meant in the submit ioctl, _before_ you even call
> > > > drm_sched_job_arm(). It's ok to block in there indefinitely.
> > > >
> > >
> > > Ok, but how do we determine if their is ring space, wait on xe_hw_fen=
ce
> > > which is a dma-fence. We just move a wait from the scheduler to the e=
xec
> > > IOCTL and I realy fail to see the point of that.
> >
> > Fill in anything you need into the ring at ioctl time, but don't update
> > the tail pointers? If there's no space, then EWOULDBLCK.
> >
>
> Ok, I can maybe buy this approach and this is fairly easy to do. I'm
> going to do this for LR jobs only though (non-LR job will still flow
> control on the ring via the scheduler + write ring in run_job). A bit of
> duplicate code but I can live with this.
>
> > > > > > kernel is supposed to provide a bottomless queue of anything us=
erspace
> > > > > > submits simply doesn't hold up in reality (as much as userspace=
 standards
> > > > > > committees would like it to), and as long as it doesn't have a =
real-world
> > > > > > perf impact it doesn't really matter why we end up blocking in =
the submit
> > > > > > ioctl. It might also be a simple memory allocation that hits a =
snag in
> > > > > > page reclaim.
> > > > > >
> > > > > > > > > > > And the reasons why it was rejected haven't changed.
> > > > > > > > > > >
> > > > > > > > > > > Regards,
> > > > > > > > > > > Christian.
> > > > > > > > > > >
> > > > > > > > > > Yes, TBH this was mostly to get discussion going how we=
'd best
> > > > > > > > > > tackle this problem while being able to reuse the sched=
uler for
> > > > > > > > > > long-running workloads.
> > > > > > > > > >
> > > > > > > > > > I couldn't see any clear decision on your series, thoug=
h, but one
> > > > > > > > > > main difference I see is that this is intended for driv=
er-internal
> > > > > > > > > > use only. (I'm counting using the drm_scheduler as a he=
lper for
> > > > > > > > > > driver-private use). This is by no means a way to try t=
ackle the
> > > > > > > > > > indefinite fence problem.
> > > > > > > > >
> > > > > > > > > Well this was just my latest try to tackle this, but esse=
ntially the
> > > > > > > > > problems are the same as with your approach: When we expr=
ess such
> > > > > > > > > operations as dma_fence there is always the change that w=
e leak that
> > > > > > > > > somewhere.
> > > > > > > > >
> > > > > > > > > My approach of adding a flag noting that this operation i=
s dangerous and
> > > > > > > > > can't be synced with something memory management depends =
on tried to
> > > > > > > > > contain this as much as possible, but Daniel still pretty=
 clearly
> > > > > > > > > rejected it (for good reasons I think).
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > We could ofc invent a completely different data-type th=
at abstracts
> > > > > > > > > > the synchronization the scheduler needs in the long-run=
ning case, or
> > > > > > > > > > each driver could hack something up, like sleeping in t=
he
> > > > > > > > > > prepare_job() or run_job() callback for throttling, but=
 those waits
> > > > > > > > > > should still be annotated in one way or annotated one w=
ay or another
> > > > > > > > > > (and probably in a similar way across drivers) to make =
sure we don't
> > > > > > > > > > do anything bad.
> > > > > > > > > >
> > > > > > > > > >  So any suggestions as to what would be the better solu=
tion here
> > > > > > > > > > would be appreciated.
> > > > > > > > >
> > > > > > > > > Mhm, do we really the the GPU scheduler for that?
> > > > > > > > >
> > > > > > >
> > > > > > > I think we need to solve this within the DRM scheduler one wa=
y or
> > > > > > > another.
> > > > > >
> > > > > > Yeah so if we conclude that the queue really must be bottomless=
 then I
> > > > > > agree drm-sched should help out sort out the mess. Because I'm =
guessing
> > > > > > that every driver will have this issue. But that's a big if.
> > > > > >
> > > > > > I guess if we teach the drm scheduler that some jobs are fairly=
 endless
> > > > > > then maybe it wouldn't be too far-fetched to also teach it to w=
ait for a
> > > > > > previous one to finish (but not with the dma_fence that preempt=
s, which we
> > > > > > put into the dma_resv for memory management, but some other str=
uct
> > > > > > completion). The scheduler already has a concept of not stuffin=
g too much
> > > > > > stuff into the same queue after all, so this should fit?
> > > > >
> > > > > See above, exact same situation as spinning on flow controling th=
e ring,
> > > > > this IMO absolutely breaks the dma-fence rules. IMO the correct s=
olution
> > > > > is to have a DRM that doesn't export dma-fences, this is exactly =
what
> > > > > this series does as if we try to, boom lockdep / warn on blow up.
> > > >
> > > > I dont think it's impossible to do this correctly, but definitely v=
ery,
> > > > very hard. Which is why neither Christian nor me like the idea :-)
> > > >
> > > > Essentially you'd have to make sure that any indefinite way will st=
ill
> > > > react to drm_sched_job, so that you're not holding up a gt reset or
> > > > anything like that, but only ever hold up forward progress for this
> > > > specific scheduler/drm_sched_entity. Which you can do as long (and =
again,
> > > > another hugely tricky detail) you still obey the preempt-ctx dma_fe=
nce and
> > > > manage to preempt the underlying long-running ctx even when the drm=
/sched
> > > > is stuck waiting for an indefinite fence (like waiting for ringspac=
e or
> > > > something like that).
> > > >
> > > > So I don't think it's impossible, but very far away from "a good id=
ea" :-)
> > > >
> > > > Hence to proposal to bail out of this entire mess by throwing EWOUL=
DBLCK
> > > > back to userspace directly from the ioctl function, where you still=
 can do
> > > > that without breaking any dma_fence rules. Or if it's not a case th=
at
> > > > matters in practice, simply block in the ioctl handler instead of
> > > > returning EWOULDBLCK.
> > >
> > > Returning EWOULDBLCK on a full ring is reasonsible I guess but again
> > > without returning a fence in run job the TDR can't be used for clean =
up
> > > on LR entities which will result in duplicate code open coded by each
> > > driver. Same goes for checking ring full in exec.
> > >
> > > How about this:
> > > - We mark xe_hw_fence as LR to ensure it can't be exported, return th=
is
> > >   in run_job which gives flow control on the ring + the handy TDR
> > >   functionality
> > > - When a scheduler is marked as LR, we do not generate finished fence=
s
> > >   for jobs
> > > - We heavily, heavily scrutinize any usage of the LR fence flag going
> > >   foward
> > > - We document all of this very loudly
> > >
> > > Is this reasonable?
> >
> > I'm not seeing why it's needed? If you're worried about TDR duplication
> > then I think we need something else. Because for long-running ctx we ne=
ver
> > have a timeout of the ctx itself (by definition). The only thing we tim=
e
> > out on is the preempt, so I guess what could be done:
> > - have the minimal scaffolding to support the preempt-ctx fence in
> >   drm_sched_entity
> > - when the preempt ctx fence enables signalling a) callback to the driv=
er
> >   to start the preempt (which should signal the fence) b) start a timer=
,
> >   which should catch if the preempt takes too long
>
> The GuC does this for us, no need.
>
> > - if the timeout first (importantly we only enable that when the
> >   preemption is trigger, not by default), kick of the normal drm/sched =
tdr
> >   flow. maybe needs some adjustements in case there's different handlin=
g
> >   needed for when a preemption times out compared to just a job timing =
out
> >
>
> The GuC imforms us this and yea we kick the TDR.

You might still need the kernel fallback when guc dies? But yeah not
sure how much similarity is then left with the end-of-batch timed-out.

> > I think this might make sense for sharing timeout handling needs for
> > long-running context. What you proposed I don't really follow why it
> > should exist, because that kind of timeout handling should not ever hap=
pen
> > for long-running jobs.
>
> We use just the TDR a as single cleanup point for all entities. In the
> case of a LR entity this occurs if the GuC issues a reset on the
> entity (liekly preempt timeout), the entity takes a non-recoverable page
> fail, or the entity to the root cause of a GT reset. The pending job
> list here is handy, that why I wanted to return xe_hw_fence in run_job
> to hold the job in the scheduler pending list. The doesn't TDR won't
> fire if the pending list is empty.
>
> Based on what you are saying my new proposal:
>
> 1. Write ring in exec for LR jobs, return -EWOULDBLCK if no space in
> ring
> 2. Return NULL in run_job (or alternatively a signaled fence)
> 3. Have specical cased cleanup flow for LR entites (not the TDR, rather
> likely a different worker we kick owned by the xe_engine).
> 4. Document this some that this how drivers are expected to do LR
> workloads plus DRM scheduler
>
> 1 & 3 are pretty clear duplicates of code but I can live with that if
> I can get Ack on the plan + move on. The coding will not be all that
> difficult either, I am just being difficult. In the is probably a 100ish
> lines of code.

For 1 I guess you could also write the ring stuff for end-of-batch
code from the ioctl (and then just block for the ring to advance
enough if needed). That is how we had i915-gem operate before
i915-scheduler happened.

For 3 I'm not sure there's really that much to share, the end-of-batch
and preempt-ctx dma_fence are just rather different. I'm not too clear
on why LR needs a special cleanup flow, isn't it roughly the same:
- stop drm/sched from pushing in new jobs
- preempt the ctx to kill it

With xe I don't think we ever want to let existing jobs complete,
neither for legacy nor for lr ctx.


> What do you think Daniel, seem like a reasonable plan?

Yeah my comments above are just minor side questions, I think this is
roughly what we want. Plus/minus polish details of how much code
sharing between legacy/lr ctx in xe and for lr with other drivers
makes sense or not. I think the in-fences handling (because that ties
into memory management when eviction and restoring a vm) is the big
part which ideally has as much shared as possible. Which I think this
achieves.
-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
