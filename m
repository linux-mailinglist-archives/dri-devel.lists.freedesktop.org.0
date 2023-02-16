Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C33699D41
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 20:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1AE10E369;
	Thu, 16 Feb 2023 19:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F49310E365;
 Thu, 16 Feb 2023 19:58:48 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-15ff0a1f735so3891058fac.5; 
 Thu, 16 Feb 2023 11:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+wLIvE6xm4u8oTRQH7O+F8I+EpLaV56nlo87TiXnIqw=;
 b=Md6+X8rFjnPd28cBlnklBwLD9NeO40zA/zrhv2IAXBP6ALdRifEV0A0Dh5I4NQ97GY
 3q3DafPEngiUcuSezZpag3rFUo36iDdQaPUWvTB0B+vOSWltZczqoy0s2vTxNIgAHsa5
 Y8hCZmDX6h7K/IcGaMLcsYqTMEURlT1G75SwGqtRy/ZIVGDWo4pjFYIdKWC7Z70qk3kb
 TzCcUjFxjxLQOPvMZmH7b7GWgUCY5HOoI9fWTHJc7jprNw8pUgb8e9lm9tCXZUGoU9F1
 orY8J8w3zV1+jVS0RZEKMUGVomKwUg6wB+9+TMTOBfcOwIWGq0bXoh49RO8bN7xeM758
 B7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+wLIvE6xm4u8oTRQH7O+F8I+EpLaV56nlo87TiXnIqw=;
 b=lwkdbuoV8vX50R0gq1xEDOTWOmGvz3mlJ1H7bojp4FLzx0CORgNr01JeD+YU19AOwd
 oFy9QRPqNgVGfOhcKb+8tdFKfNWaLld8hmyhPDrJaDOj/LQheyHEAz0DrZq+gaC3Efqi
 fmThIR4ih982wRq56j5wFR0y3LDz9zgZq8QnMXwjQnl++ZdJAfTuTfzwtbJXi+ljw77G
 zlzHL+SZcBPI6btcWMTrSAY2Bb0a5bwW0rBWSy+1AoRkEdXtBUJeD7OaNPzxfCV5kOJz
 0oXOhbgcDABwMyOSp5LfoVdGQBjra5UUBdYKNPFZFQg6AUSJ5zMUvdvcIXfgC6vpOw1b
 t3ig==
X-Gm-Message-State: AO0yUKXJgqMdqECe+fH6dHtROQ7vAbIeXp1+M8tkiY/eIgafBVXQYusM
 SqFgxuISrwZJQm8KRv5+UPSCsIhTgyoUVhKpHsH9EfCr
X-Google-Smtp-Source: AK7set/qywOXHswoWWwrW4GqMhZ4fpoEok9oOw3WUrSIP3iqyykSTe7qb7pFhC2pZy4/WppongpQ7Yik0f9KSNm11Gs=
X-Received: by 2002:a05:6870:808d:b0:16e:8a56:d0d2 with SMTP id
 q13-20020a056870808d00b0016e8a56d0d2mr88302oab.38.1676577527683; Thu, 16 Feb
 2023 11:58:47 -0800 (PST)
MIME-Version: 1.0
References: <20230210130647.580135-1-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGto9VMNLJnAs+n5H6MNoVASNasYEu3WhYYkhn5sERg4Fw@mail.gmail.com>
 <Y+5zyeSncSbsXHWG@intel.com>
In-Reply-To: <Y+5zyeSncSbsXHWG@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 16 Feb 2023 11:59:07 -0800
Message-ID: <CAF6AEGs5s2NFoLFJVpsrcGLZUuZxX=H4FAeCzKFzOSdzWzDkAQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC v2 0/5] Waitboost drm syncobj waits
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 10:20 AM Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> On Tue, Feb 14, 2023 at 11:14:00AM -0800, Rob Clark wrote:
> > On Fri, Feb 10, 2023 at 5:07 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> > >
> > > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > >
> > > In i915 we have this concept of "wait boosting" where we give a priority boost
> > > for instance to fences which are actively waited upon from userspace. This has
> > > it's pros and cons and can certainly be discussed at lenght. However fact is
> > > some workloads really like it.
> > >
> > > Problem is that with the arrival of drm syncobj and a new userspace waiting
> > > entry point it added, the waitboost mechanism was bypassed. Hence I cooked up
> > > this mini series really (really) quickly to see if some discussion can be had.
> > >
> > > It adds a concept of "wait count" to dma fence, which is incremented for every
> > > explicit dma_fence_enable_sw_signaling and dma_fence_add_wait_callback (like
> > > dma_fence_add_callback but from explicit/userspace wait paths).
> >
> > I was thinking about a similar thing, but in the context of dma_fence
> > (or rather sync_file) fd poll()ing.  How does the kernel differentiate
> > between "housekeeping" poll()ers that don't want to trigger boost but
> > simply know when to do cleanup, and waiters who are waiting with some
> > urgency.  I think we could use EPOLLPRI for this purpose.
> >
> > Not sure how that translates to waits via the syncobj.  But I think we
> > want to let userspace give some hint about urgent vs housekeeping
> > waits.
>
> Should the hint be on the waits, or should the hints be on the executed
> context?

I think it should be on the wait, because different waits may be for
different purposes.  Ideally this could be exposed at the app API
level, but I guess first step is to expose it to userspace.

BR,
-R

> In the end we need some way to quickly ramp-up the frequency to avoid
> the execution bubbles.
>
> waitboost is trying to guess that, but in some cases it guess wrong
> and waste power.
>
> btw, this is something that other drivers might need:
>
> https://gitlab.freedesktop.org/drm/amd/-/issues/1500#note_825883
> Cc: Alex Deucher <alexander.deucher@amd.com>
>
> >
> > Also, on a related topic: https://lwn.net/Articles/868468/
> >
> > BR,
> > -R
> >
> > > Individual drivers can then inspect this via dma_fence_wait_count() and decide
> > > to wait boost the waits on such fences.
> > >
> > > Again, quickly put together and smoke tested only - no guarantees whatsoever and
> > > I will rely on interested parties to test and report if it even works or how
> > > well.
> > >
> > > v2:
> > >  * Small fixups based on CI feedback:
> > >     * Handle decrement correctly for already signalled case while adding callback.
> > >     * Remove i915 assert which was making sure struct i915_request does not grow.
> > >  * Split out the i915 patch into three separate functional changes.
> > >
> > > Tvrtko Ursulin (5):
> > >   dma-fence: Track explicit waiters
> > >   drm/syncobj: Mark syncobj waits as external waiters
> > >   drm/i915: Waitboost external waits
> > >   drm/i915: Mark waits as explicit
> > >   drm/i915: Wait boost requests waited upon by others
> > >
> > >  drivers/dma-buf/dma-fence.c               | 102 ++++++++++++++++------
> > >  drivers/gpu/drm/drm_syncobj.c             |   6 +-
> > >  drivers/gpu/drm/i915/gt/intel_engine_pm.c |   1 -
> > >  drivers/gpu/drm/i915/i915_request.c       |  13 ++-
> > >  include/linux/dma-fence.h                 |  14 +++
> > >  5 files changed, 101 insertions(+), 35 deletions(-)
> > >
> > > --
> > > 2.34.1
> > >
