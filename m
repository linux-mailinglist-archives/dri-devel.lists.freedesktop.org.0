Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1834696DE4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 20:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04CC10E286;
	Tue, 14 Feb 2023 19:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E84D10E027;
 Tue, 14 Feb 2023 19:26:36 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id s17so13828112ois.10;
 Tue, 14 Feb 2023 11:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DOHlFuem73ciaIwSnUHUZP0pNyp5JDxBsO1yyIqmds0=;
 b=nviAN9DCWJHrwGzXXt5x+94cXQWv96vKDLRaGlKy8HcTKasRgZ7fQw6kK7Z2oKzaxS
 HwlLr6AhBn608fETY2rbf25AEB9EdQqrh6tep49Usz609xK+nVWFJifUq9DOVbZNrQIl
 EyY1RjNlcikAyCK27VTktXOeMQeaI2mpudCMn6wA6+ilSZD2dxVXB9mU9JId74+SxxwL
 Ifi3KDTzlTl8P9I5JURqrBEDBny3vQkyeg+qYglsC1PJT8tz4jIrOBdCYUjJBTI+8ps+
 aZsycPXQyE74zt67N9QSTuihLe06vwDMt6l4OqAoPGYXGDAGogWw4ywrMmdI22YPpLWX
 C2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DOHlFuem73ciaIwSnUHUZP0pNyp5JDxBsO1yyIqmds0=;
 b=wXEsvGVDGUgKTgEN+HUJRTnZkod3hNtvA8PUUq+sBy1ubYHathfRKLDvsaLz4LSea8
 Zy+dzQlRfRWn++8nSpDxSjxxplF/UPkrlHUZzuV0hj8iBUuCGcrm9KUio0pdkANHdhO4
 Vmgc55SKNrTCvMjwQ/eHyXIm4ULYQjNc6SzpNh66cX8gfdZTkAJRtRQuQXu3ta2WZotD
 NWY8IN9Xip8eGG/vJ8wm1HVJuCzOll6E0sQzyGpzI/iKFeG3IeiL2F9UEuF1Ym6pEO+S
 doDp3N69KwuiwCaL49brssIxC2x90OQj0FyZFIV9oHAh3LREqoThHqD5rB9wB4LWHc7e
 U0gg==
X-Gm-Message-State: AO0yUKXFeuZL+JqAC5/0cIXjqC1y9bpeLfCVODLM+MHWG32saIl8hWYT
 KzCL6NVmYEqFxBpuUDGff82D0PEtCy74P/3yluY=
X-Google-Smtp-Source: AK7set/dCeGQgyBnqywM+73EJQl1zKvSdChYsWHWqCGv6Ff0PEyXna4pMfIBDidVEpGzJXQTp03VfYhYPKHRhWY7lrM=
X-Received: by 2002:aca:d743:0:b0:37d:81a9:5103 with SMTP id
 o64-20020acad743000000b0037d81a95103mr1943oig.38.1676402795361; Tue, 14 Feb
 2023 11:26:35 -0800 (PST)
MIME-Version: 1.0
References: <20230210130647.580135-1-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGto9VMNLJnAs+n5H6MNoVASNasYEu3WhYYkhn5sERg4Fw@mail.gmail.com>
In-Reply-To: <CAF6AEGto9VMNLJnAs+n5H6MNoVASNasYEu3WhYYkhn5sERg4Fw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 14 Feb 2023 11:26:50 -0800
Message-ID: <CAF6AEGuq10rz36cGBG6EO008iPpnBrw51Jq_AM4Ejs=+Bi30LA@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 14, 2023 at 11:14 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Feb 10, 2023 at 5:07 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
> >
> > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >
> > In i915 we have this concept of "wait boosting" where we give a priority boost
> > for instance to fences which are actively waited upon from userspace. This has
> > it's pros and cons and can certainly be discussed at lenght. However fact is
> > some workloads really like it.
> >
> > Problem is that with the arrival of drm syncobj and a new userspace waiting
> > entry point it added, the waitboost mechanism was bypassed. Hence I cooked up
> > this mini series really (really) quickly to see if some discussion can be had.
> >
> > It adds a concept of "wait count" to dma fence, which is incremented for every
> > explicit dma_fence_enable_sw_signaling and dma_fence_add_wait_callback (like
> > dma_fence_add_callback but from explicit/userspace wait paths).
>
> I was thinking about a similar thing, but in the context of dma_fence
> (or rather sync_file) fd poll()ing.  How does the kernel differentiate
> between "housekeeping" poll()ers that don't want to trigger boost but
> simply know when to do cleanup, and waiters who are waiting with some
> urgency.  I think we could use EPOLLPRI for this purpose.
>
> Not sure how that translates to waits via the syncobj.  But I think we
> want to let userspace give some hint about urgent vs housekeeping
> waits.

So probably the syncobj equiv of this would be to add something along
the lines of DRM_SYNCOBJ_WAIT_FLAGS_WAIT_PRI

BR,
-R

> Also, on a related topic: https://lwn.net/Articles/868468/
>
> BR,
> -R
>
> > Individual drivers can then inspect this via dma_fence_wait_count() and decide
> > to wait boost the waits on such fences.
> >
> > Again, quickly put together and smoke tested only - no guarantees whatsoever and
> > I will rely on interested parties to test and report if it even works or how
> > well.
> >
> > v2:
> >  * Small fixups based on CI feedback:
> >     * Handle decrement correctly for already signalled case while adding callback.
> >     * Remove i915 assert which was making sure struct i915_request does not grow.
> >  * Split out the i915 patch into three separate functional changes.
> >
> > Tvrtko Ursulin (5):
> >   dma-fence: Track explicit waiters
> >   drm/syncobj: Mark syncobj waits as external waiters
> >   drm/i915: Waitboost external waits
> >   drm/i915: Mark waits as explicit
> >   drm/i915: Wait boost requests waited upon by others
> >
> >  drivers/dma-buf/dma-fence.c               | 102 ++++++++++++++++------
> >  drivers/gpu/drm/drm_syncobj.c             |   6 +-
> >  drivers/gpu/drm/i915/gt/intel_engine_pm.c |   1 -
> >  drivers/gpu/drm/i915/i915_request.c       |  13 ++-
> >  include/linux/dma-fence.h                 |  14 +++
> >  5 files changed, 101 insertions(+), 35 deletions(-)
> >
> > --
> > 2.34.1
> >
