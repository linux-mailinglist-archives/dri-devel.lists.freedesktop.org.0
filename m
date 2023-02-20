Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D81A69D0D6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 16:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2CEA10E6B1;
	Mon, 20 Feb 2023 15:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE3A10E6AD;
 Mon, 20 Feb 2023 15:45:32 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-172129e9cf1so1328231fac.8; 
 Mon, 20 Feb 2023 07:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GDeq8+3pi7zSRUzBPnFsH8rY6ubyIE3E17O6ljSvyeU=;
 b=cuyau3DdJDuIX2Rh9eDfHmP1mU1uHUJSB9af/V2w3mHQpBd/PcjN9Lpg3sbdWbAPan
 gJHeoJZTj037WkG0xRURygB/HmBy8fnX4Nu5iDYzLhKt/3/nh45NrG8/e/mm2VxyqTVY
 XK/whpLmccPUWcfPdawMMLEE3oumqsT3lkAZe5R5zOBiAXlArbpsHxUAkMPezhWqRD/D
 TQ+mIhklPhEQKA2luQz99wPThf2+ZxxvSpY8La8C8yes5URok/SZXeAZ+YmbQzOYkma+
 D8UQ5nslhTkoMjMsmhO0eh9vbJcqeJLm0R4AtuYnR7LGZUj26+KHg1MIxrbYO6vbjlEN
 dWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GDeq8+3pi7zSRUzBPnFsH8rY6ubyIE3E17O6ljSvyeU=;
 b=MXWE/80/Y3/0lU2zOYrMHFGpqvE122vYB8EsXx10nJnVXEb6uIyU0UP9gnE18GFBTB
 rM/Kn8lxgEavZvc7zyojStr3O9KUW4HZAzmoreAfkDYikmYHzRdRFj/5cdEHLigfyZ4t
 gDpF6mMDm8G9stzUjBGjLeximcp/yTEHE0DNhfGMYE/nM+BeCy9NCGifEkfodheCUH+i
 sajtFuSuD2xfNnmGimSYom5M0qvppf2nuApzbHoADdKJ9hwhRR5R0+FznpfhvFIHbOMT
 uqlq9oJGuH8GYEzwLJOW4TQ2+aFiTROpCz0bOnrERGC2AgB91EkpFJ3Z3gwFT7pqLQd6
 7pIw==
X-Gm-Message-State: AO0yUKWF0DHAokiYBWfr8gPjN03uqXa8JRr1uea/bar2VYercc6oTdiN
 BHsj+++Zp+OqSaAxHZPZGA/VMpwFiU4U0ZNH62CMNT4h
X-Google-Smtp-Source: AK7set8RZp2CTa9P1jHfSmuYyNEIiuwWnxwoyuPiZQkjJDZ9j3/oQSb8qeEf5mbIpjARFHklLd0HElanMALNCbFsdeQ=
X-Received: by 2002:a05:6870:32d4:b0:16e:5e5a:49da with SMTP id
 r20-20020a05687032d400b0016e5e5a49damr1178453oac.58.1676907931266; Mon, 20
 Feb 2023 07:45:31 -0800 (PST)
MIME-Version: 1.0
References: <20230210130647.580135-1-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGto9VMNLJnAs+n5H6MNoVASNasYEu3WhYYkhn5sERg4Fw@mail.gmail.com>
 <Y+5zyeSncSbsXHWG@intel.com>
 <7e059e8c-41c3-b56c-26c8-c0e2230616b1@linux.intel.com>
 <CAF6AEGuN2dv+Lsk3R43oPRA9c8ZoMjzCCKR+L41wNT8Sc3TgsQ@mail.gmail.com>
 <c0663648-5567-2d7a-43b1-dfa043109051@linux.intel.com>
 <CAF6AEGsGqjbL_tA8x_xwygBccKMP2DTbSy-B5_dEakpQVep8vg@mail.gmail.com>
 <9fa6b49f-376b-f9e2-bce7-e58b04628822@linux.intel.com>
In-Reply-To: <9fa6b49f-376b-f9e2-bce7-e58b04628822@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 20 Feb 2023 07:45:21 -0800
Message-ID: <CAF6AEGvudvuQE1Uze8od-Wmgz+i02=EVEbeaa-9Muc1bXp+duw@mail.gmail.com>
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

On Mon, Feb 20, 2023 at 4:22 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 17/02/2023 17:00, Rob Clark wrote:
> > On Fri, Feb 17, 2023 at 8:03 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
>
> [snip]
>
> >>> adapted from your patches..  I think the basic idea of deadlines
> >>> (which includes "I want it NOW" ;-)) isn't controversial, but the
> >>> original idea got caught up in some bikeshed (what about compositors
> >>> that wait on fences in userspace to decide which surfaces to update in
> >>> the next frame), plus me getting busy and generally not having a good
> >>> plan for how to leverage this from VM guests (which is becoming
> >>> increasingly important for CrOS).  I think I can build on some ongoing
> >>> virtgpu fencing improvement work to solve the latter.  But now that we
> >>> have a 2nd use-case for this, it makes sense to respin.
> >>
> >> Sure, I was looking at the old version already. It is interesting. But
> >> also IMO needs quite a bit more work to approach achieving what is
> >> implied from the name of the feature. It would need proper deadline
> >> based sched job picking, and even then drm sched is mostly just a
> >> frontend. So once past runnable status and jobs handed over to backend,
> >> without further driver work it probably wouldn't be very effective past
> >> very lightly loaded systems.
> >
> > Yes, but all of that is not part of dma_fence ;-)
>
> :) Okay.
>
> Having said that, do we need a step back to think about whether adding
> deadline to dma-fences is not making them something too much different
> to what they were? Going from purely synchronisation primitive more
> towards scheduling paradigms. Just to brainstorm if there will not be
> any unintended consequences. I should mention this in your RFC thread
> actually.

Perhaps "deadline" isn't quite the right name, but I haven't thought
of anything better.  It is really a hint to the fence signaller about
how soon it is interested in a result so the driver can factor that
into freq scaling decisions.  Maybe "goal" or some other term would be
better?

I guess that can factor into scheduling decisions as well.. but we
already have priority for that.  My main interest is freq mgmt.

(Thankfully we don't have performance and efficiency cores to worry
about, like CPUs ;-))

> > A pretty common challenging usecase is still the single fullscreen
> > game, where scheduling isn't the problem, but landing at an
> > appropriate GPU freq absolutely is.  (UI workloads are perhaps more
> > interesting from a scheduler standpoint, but they generally aren't
> > challenging from a load/freq standpoint.)
>
> Challenging as in picking the right operating point? Might be latency
> impacted (and so user perceived UI smoothness) due missing waitboost for
> anything syncobj related. I don't know if anything to measure that
> exists currently though. Assuming it is measurable then the question
> would be is it perceivable.
> > Fwiw, the original motivation of the series was to implement something
> > akin to i915 pageflip boosting without having to abandon the atomic
> > helpers.  (And, I guess it would also let i915 preserve that feature
> > if it switched to atomic helpers.. I'm unsure if there are still other
> > things blocking i915's migration.)
>
> Question for display folks I guess.
>
> >> Then if we fast forward to a world where schedulers perhaps become fully
> >> deadline aware (we even had this for i915 few years back) then the
> >> question will be does equating waits with immediate deadlines still
> >> works. Maybe not too well because we wouldn't have the ability to
> >> distinguish between the "someone is waiting" signal from the otherwise
> >> propagated deadlines.
> >
> > Is there any other way to handle a wait boost than expressing it as an
> > ASAP deadline?
>
> A leading question or just a question? Nothing springs to my mind at the
> moment.

Just a question.  The immediate deadline is the only thing that makes
sense to me, but that could be because I'm looking at it from the
perspective of also trying to handle the case where missing vblank
reduces utilization and provides the wrong signal to gpufreq.. i915
already has a way to handle this internally, but it involves bypassing
the atomic helpers, which isn't a thing I want to encourage other
drivers to do.  And completely doesn't work for situations where the
gpu and display are separate devices.

BR,
-R

> Regards,
>
> Tvrtko
