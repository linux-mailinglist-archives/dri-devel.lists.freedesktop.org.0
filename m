Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AFB69B187
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 18:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C5010E2DC;
	Fri, 17 Feb 2023 17:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7D310F07D;
 Fri, 17 Feb 2023 17:01:01 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1718822c152so1688650fac.7; 
 Fri, 17 Feb 2023 09:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uKf/r3GFYO0qWsU39d08kJy1yJ/sKjl4njXzgzKRDso=;
 b=cmkmgKdec3SXHVBP9/S7hFVVFKNiuSiyTRSq/6ShS8tNU8Qa/x1ELlgFKIADcnw90y
 cTZ4xO4xHv5VuSYDfIS/LsEjy9L7YuCI1cOtIK30XzXBQ68JH7cMLWr7ZNds+iVNrDCg
 GdallX1zWn7hIxl7lb2/G8LdWvXgrcDdmTsNcFq+VPjyvKq7HYH9kmbXIoDReEKGmv68
 Qc7Q76LbwiwjJb7LQ2sqPvV6+eWvTmjHulW/JodhIAjGT7HfJGq2Lt31sR5M7swnKfDx
 vtMT4j167P4E5diDQyKF+/giM1CO04NKT/BcPDv2OlxSt+W20unTxOWZDTxKHZhyeHn7
 1jyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uKf/r3GFYO0qWsU39d08kJy1yJ/sKjl4njXzgzKRDso=;
 b=z9Lj2F9FGmHlL65QMDcVLkWZWiXd4hQzMR68UQk2WJDESfeBHAsMI7fiieIyXXdE+9
 QZJTduItfFmg/W/q2Kqb8eQHpyP+V+hVQzsVS5HLdRh7XqfQ8p9PBFGBHnbqb4mXpZ2S
 G8med/B0YVtmzTyo4Mp0DT9sSomm2mlxN9ucAeaghwmHg3CCCl7W4Xu/Ao8lqj3JE7+s
 2LMiGIoVlTnExW2FSyx+BfvxKF5UH4kArrZOK/p8KVMlABwF8IYaiOdEKe2jWpRNy+NH
 k51te+GIvcaFePjxIRmtjo12E4wzT1Jzysf6JyUH9t6O+jogv7Mwlfxy9RZ95IKRjRPa
 79Xg==
X-Gm-Message-State: AO0yUKXKYJAde4dK2Df5tiBzNLNzrEP3BmOBYd+S1x0WO3SmOyKuvcHW
 RqG/i4XBDhl6pbL8HvdlCkKSggv0iMz6zvbZOxFGezZ6
X-Google-Smtp-Source: AK7set84X748ar4OGN8+a3m/7yvfLgE6+ZltqJl4Ku+JlitmRxGwnevdsh33ZeThQXjU1Y+4BF1eQpjxe+/aCiHtWts=
X-Received: by 2002:a05:6870:32d4:b0:16e:5e5a:49da with SMTP id
 r20-20020a05687032d400b0016e5e5a49damr532856oac.58.1676653260181; Fri, 17 Feb
 2023 09:01:00 -0800 (PST)
MIME-Version: 1.0
References: <20230210130647.580135-1-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGto9VMNLJnAs+n5H6MNoVASNasYEu3WhYYkhn5sERg4Fw@mail.gmail.com>
 <Y+5zyeSncSbsXHWG@intel.com>
 <7e059e8c-41c3-b56c-26c8-c0e2230616b1@linux.intel.com>
 <CAF6AEGuN2dv+Lsk3R43oPRA9c8ZoMjzCCKR+L41wNT8Sc3TgsQ@mail.gmail.com>
 <c0663648-5567-2d7a-43b1-dfa043109051@linux.intel.com>
In-Reply-To: <c0663648-5567-2d7a-43b1-dfa043109051@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 17 Feb 2023 09:00:49 -0800
Message-ID: <CAF6AEGsGqjbL_tA8x_xwygBccKMP2DTbSy-B5_dEakpQVep8vg@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC v2 0/5] Waitboost drm syncobj waits
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Rob Clark <robdclark@chromium.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 8:03 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 17/02/2023 14:55, Rob Clark wrote:
> > On Fri, Feb 17, 2023 at 4:56 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> On 16/02/2023 18:19, Rodrigo Vivi wrote:
> >>> On Tue, Feb 14, 2023 at 11:14:00AM -0800, Rob Clark wrote:
> >>>> On Fri, Feb 10, 2023 at 5:07 AM Tvrtko Ursulin
> >>>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>>
> >>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>>>>
> >>>>> In i915 we have this concept of "wait boosting" where we give a priority boost
> >>>>> for instance to fences which are actively waited upon from userspace. This has
> >>>>> it's pros and cons and can certainly be discussed at lenght. However fact is
> >>>>> some workloads really like it.
> >>>>>
> >>>>> Problem is that with the arrival of drm syncobj and a new userspace waiting
> >>>>> entry point it added, the waitboost mechanism was bypassed. Hence I cooked up
> >>>>> this mini series really (really) quickly to see if some discussion can be had.
> >>>>>
> >>>>> It adds a concept of "wait count" to dma fence, which is incremented for every
> >>>>> explicit dma_fence_enable_sw_signaling and dma_fence_add_wait_callback (like
> >>>>> dma_fence_add_callback but from explicit/userspace wait paths).
> >>>>
> >>>> I was thinking about a similar thing, but in the context of dma_fence
> >>>> (or rather sync_file) fd poll()ing.  How does the kernel differentiate
> >>>> between "housekeeping" poll()ers that don't want to trigger boost but
> >>>> simply know when to do cleanup, and waiters who are waiting with some
> >>>> urgency.  I think we could use EPOLLPRI for this purpose.
> >>>>
> >>>> Not sure how that translates to waits via the syncobj.  But I think we
> >>>> want to let userspace give some hint about urgent vs housekeeping
> >>>> waits.
> >>>
> >>> Should the hint be on the waits, or should the hints be on the executed
> >>> context?
> >>>
> >>> In the end we need some way to quickly ramp-up the frequency to avoid
> >>> the execution bubbles.
> >>>
> >>> waitboost is trying to guess that, but in some cases it guess wrong
> >>> and waste power.
> >>
> >> Do we have a list of workloads which shows who benefits and who loses
> >> from the current implementation of waitboost?
> >>> btw, this is something that other drivers might need:
> >>>
> >>> https://gitlab.freedesktop.org/drm/amd/-/issues/1500#note_825883
> >>> Cc: Alex Deucher <alexander.deucher@amd.com>
> >>
> >> I have several issues with the context hint if it would directly
> >> influence frequency selection in the "more power" direction.
> >>
> >> First of all, assume a context hint would replace the waitboost. Which
> >> applications would need to set it to restore the lost performance and
> >> how would they set it?
> >>
> >> Then I don't even think userspace necessarily knows. Think of a layer
> >> like OpenCL. It doesn't really know in advance the profile of
> >> submissions vs waits. It depends on the CPU vs GPU speed, so hardware
> >> generation, and the actual size of the workload which can be influenced
> >> by the application (or user) and not the library.
> >>
> >> The approach also lends itself well for the "arms race" where every
> >> application can say "Me me me, I am the most important workload there is!".
> >
> > since there is discussion happening in two places:
> >
> > https://gitlab.freedesktop.org/drm/intel/-/issues/8014#note_1777433
> >
> > What I think you might want is a ctx boost_mask which lets an app or
> > driver disable certain boost signals/classes.  Where fence waits is
> > one class of boost, but hypothetical other signals like touchscreen
> > (or other) input events could be another class of boost.  A compute
> > workload might be interested in fence wait boosts but could care less
> > about input events.
>
> I think it can only be apps which could have any chance knowing whether
> their use of a library is latency sensitive or not. Which means new
> library extensions and their adoption. So I have some strong reservation
> that route is feasible.
>
> Or we tie with priority which many drivers do. Normal and above gets the
> boosting and what lowered itself does not (aka SCHED_IDLE/SCHED_BATCH).

yeah, that sounds reasonable.

> Related note is that we lack any external control of our scheduling
> decisions so we really do suck compared to other scheduling domains like
> CPU and IO etc.
>
> >> The last concern is for me shared with the proposal to expose deadlines
> >> or high priority waits as explicit uapi knobs. Both come under the "what
> >> application told us it will do" category vs what it actually does. So I
> >> think it is slightly weaker than basing decisions of waits.
> >>
> >> The current waitboost is a bit detached from that problem because when
> >> we waitboost for flips we _know_ it is an actual framebuffer in the flip
> >> chain. When we waitboost for waits we also know someone is waiting. We
> >> are not trusting userspace telling us this will be a buffer in the flip
> >> chain or that this is a context which will have a certain duty-cycle.
> >>
> >> But yes, even if the input is truthful, latter is still only a
> >> heuristics because nothing says all waits are important. AFAIU it just
> >> happened to work well in the past.
> >>
> >> I do understand I am effectively arguing for more heuristics, which may
> >> sound a bit against the common wisdom. This is because in general I
> >> think the logic to do the right thing, be it in the driver or in the
> >> firmware, can work best if it has a holistic view. Simply put it needs
> >> to have more inputs to the decisions it is making.
> >>
> >> That is what my series is proposing - adding a common signal of "someone
> >> in userspace is waiting". What happens with that signal needs not be
> >> defined (promised) in the uapi contract.
> >>
> >> Say you route it to SLPC logic. It doesn't need to do with it what
> >> legacy i915 is doing today. It just needs to do something which works
> >> best for majority of workloads. It can even ignore it if that works for it.
> >>
> >> Finally, back to the immediate problem is when people replace the OpenCL
> >> NEO driver with clvk that performance tanks. Because former does waits
> >> using i915 specific ioctls and so triggers waitboost, latter waits on
> >> syncobj so no waitboost and performance is bad. What short term solution
> >> can we come up with? Or we say to not use clvk? I also wonder if other
> >> Vulkan based stuff is perhaps missing those easy performance gains..
> >>
> >> Perhaps strictly speaking Rob's and mine proposal are not mutually
> >> exclusive. Yes I could piggy back on his with an "immediate deadline for
> >> waits" idea, but they could also be separate concepts if we concluded
> >> "someone is waiting" signal is useful to have. Or it takes to long to
> >> upstream the full deadline idea.
> >
> > Let me re-spin my series and add the syncobj wait flag and i915 bits
>
> I think wait flag is questionable unless it is inverted to imply waits
> which can be de-prioritized (again same parallel with SCHED_IDLE/BATCH).
> Having a flag which "makes things faster" IMO should require elevated
> privilege (to avoid the "arms race") at which point I fear it quickly
> becomes uninteresting.

I guess you could make the argument in either direction.  Making the
default behavior ramp up clocks could be a power regression.

I also think the "arms race" scenario isn't really as much of a
problem as you think.  There aren't _that_ many things using the GPU
at the same time (compared to # of things using CPU).   And a lot of
mobile games throttle framerate to avoid draining your battery too
quickly (after all, if your battery is dead you can't keep buying loot
boxes or whatever).

> > adapted from your patches..  I think the basic idea of deadlines
> > (which includes "I want it NOW" ;-)) isn't controversial, but the
> > original idea got caught up in some bikeshed (what about compositors
> > that wait on fences in userspace to decide which surfaces to update in
> > the next frame), plus me getting busy and generally not having a good
> > plan for how to leverage this from VM guests (which is becoming
> > increasingly important for CrOS).  I think I can build on some ongoing
> > virtgpu fencing improvement work to solve the latter.  But now that we
> > have a 2nd use-case for this, it makes sense to respin.
>
> Sure, I was looking at the old version already. It is interesting. But
> also IMO needs quite a bit more work to approach achieving what is
> implied from the name of the feature. It would need proper deadline
> based sched job picking, and even then drm sched is mostly just a
> frontend. So once past runnable status and jobs handed over to backend,
> without further driver work it probably wouldn't be very effective past
> very lightly loaded systems.

Yes, but all of that is not part of dma_fence ;-)

A pretty common challenging usecase is still the single fullscreen
game, where scheduling isn't the problem, but landing at an
appropriate GPU freq absolutely is.  (UI workloads are perhaps more
interesting from a scheduler standpoint, but they generally aren't
challenging from a load/freq standpoint.)

Fwiw, the original motivation of the series was to implement something
akin to i915 pageflip boosting without having to abandon the atomic
helpers.  (And, I guess it would also let i915 preserve that feature
if it switched to atomic helpers.. I'm unsure if there are still other
things blocking i915's migration.)

> Then if we fast forward to a world where schedulers perhaps become fully
> deadline aware (we even had this for i915 few years back) then the
> question will be does equating waits with immediate deadlines still
> works. Maybe not too well because we wouldn't have the ability to
> distinguish between the "someone is waiting" signal from the otherwise
> propagated deadlines.

Is there any other way to handle a wait boost than expressing it as an
ASAP deadline?

BR,
-R

>
> Regards,
>
> Tvrtko
