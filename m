Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC64344853
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 15:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F3F89A9B;
	Mon, 22 Mar 2021 14:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF38A89ABA
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 14:57:38 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id k25so13305826oic.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 07:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uc9jOiPjsv2+bqSBL/UB3Xjl7J144/LUH8xpcAEOibs=;
 b=heBUEZfZZoOyR8MmdjLoK2JXO5B8gUdUnRo9DFCHvQaG0yeJrvNT7gmzeWxebdrhX6
 /oNr1+Lh2To4dm5rEdbLYFaGTzTyXxJFjL4eOZ05qMJkg773Uhhq+PbOVAqwwMyGuBNs
 tp88AtEUqDJzgRQ6DqRTCuI9lizs3rfru43v8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uc9jOiPjsv2+bqSBL/UB3Xjl7J144/LUH8xpcAEOibs=;
 b=dK1ATBO2M9ADdLJh3eM2fJQeGuT6yFS6jy2IGRNUiMYs5njABF3LGSbAN4GQrCXBD3
 DE5fAEv47NErDMeaUQWHSDdJ2XI5XfaJB5VLnZtrvdAKbTa1oGPdSDlpe6r2F7G6M5LL
 OX+yiHv3W2YozZMxyotvX2GahqgLnWarYKcgMbPN7vIpITisp/HqYdz9yJK/IboZj5UJ
 hllHTmXfR7cZi7Dj58RmJdnwFbIYJExrRK3d8JKt1wMQ7oBooad3o7vFz/oSo++66WF/
 mRsKkS+fdTE7pXIExcWbTohHcBIDyWvPtYkVtIDa+Gws1r+p6Zmxem+GdTTVJERxg4+s
 M2Tw==
X-Gm-Message-State: AOAM531Zqfk+ZbAwUX/nz9RuLLFuevTeyQVlSj+LDCz5nxiyth9gPrZX
 FmGIKfN1O9kyfVlL9bjARUUXkbMRjrr71+vOn2p5OhcNapnqDA==
X-Google-Smtp-Source: ABdhPJyjDGAwVZ/0yIPR+9WUk5MNvew5cQ3cyVvemLg/Ph4RrJziV/YSRltWbRbxxhRMcdpLbJFkFncHdIE4zeDnA1M=
X-Received: by 2002:aca:b646:: with SMTP id g67mr103771oif.14.1616425057978;
 Mon, 22 Mar 2021 07:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210319223856.2983244-1-jason@jlekstrand.net>
 <20210319223856.2983244-4-jason@jlekstrand.net>
 <7918db68-835c-b416-6187-1e62892ce5ed@linux.intel.com>
 <YFilKSbKYd+0HbCn@phenom.ffwll.local>
 <d83162e2-4b9e-c7e9-5324-6612bb9561d6@linux.intel.com>
In-Reply-To: <d83162e2-4b9e-c7e9-5324-6612bb9561d6@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 22 Mar 2021 15:57:27 +0100
Message-ID: <CAKMK7uG0GLPu+auqDgMgD7ugvWo3E7W7DL6eALKxmp6hk-aZiA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915: Drop the CONTEXT_CLONE API
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 3:33 PM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 22/03/2021 14:09, Daniel Vetter wrote:
> > On Mon, Mar 22, 2021 at 11:22:01AM +0000, Tvrtko Ursulin wrote:
> >>
> >> On 19/03/2021 22:38, Jason Ekstrand wrote:
> >>> This API allows one context to grab bits out of another context upon
> >>> creation.  It can be used as a short-cut for setparam(getparam()) for
> >>> things like I915_CONTEXT_PARAM_VM.  However, it's never been used by any
> >>> real userspace.  It's used by a few IGT tests and that's it.  Since it
> >>> doesn't add any real value (most of the stuff you can CLONE you can copy
> >>> in other ways), drop it.
> >>
> >> No complaints to remove if it ended up unused outside IGT. Latter is a _big_
> >> problem though, since it is much more that a few IGT tests. So I really
> >> think there really needs to be an evaluation and a plan for that (we don't
> >> want to lose 50% of the coverage over night).
> >>
> >>> There is one thing that this API allows you to clone which you cannot
> >>> clone via getparam/setparam: timelines.  However, timelines are an
> >>> implementation detail of i915 and not really something that needs to be
> >>
> >> Not really true timelines are i915 implementation detail. They are in fact a
> >> dma-fence context:seqno concept, nothing more that than. I think you are
> >> probably confusing struct intel_timeline with the timeline wording in the
> >> uapi. Former is i915 implementation detail, but context:seqno are truly
> >> userspace timelines.
> >
> > I think you're both saying the same thing and talking a bit past each
> > another.
> >
> > Yes the timeline is just a string of dma_fence, that's correct. Now
> > usually if you submit batches with execbuf, we have 3 ways to synchronize
> > concurrent submission: implicit sync, sync_file and drm_syncob. They all
> > map to different needs in different protocols/render apis.
> >
> > Now in one additional case the kernel makes sure that batchbuffers are
> > ordered, and that's when you submit them to the same hw ctx. Because
> > there's only 1 hw context and you really can't have batchbuffers run on
> > that single hw context out of order. That's what the timeline object we
> > talk about here is. But that largely is an internal implementation detail,
> > which happens to also use most/all the same infrastructure as the
> > dma_fence uapi pieces above.
> >
> > Now the internal implementation detail leaking here is that we exposed
> > this to userspace, without there being any need for this. What Jason
> > implements with syncobj in the next patch is essentially what userspace
> > should have been using for cross-engine sync. media userspace doesn't care
> > about interop with winsys/client apis, so they equally could have used
> > implicit sync or sync_file here (which I think is the solution now for the
> > new uapi prepped internally), since they all are about equally powerful
> > for stringing batchbuffers together.
>
> Are you saying we exposed a single timeline of execution per hw context
> via the single timeline flag?!

Nope.

> Timelines of execution were always exposed. Any "engine" (ring
> previously) in I915_EXEC_RING_MASK was a single timeline of execution.
> It is completely the same with engine map engines, which are also
> different indices into I915_EXEC_RING_MASK space.
>
> Userspace was aware of these timelines forever as well. Media was
> creating multiple contexts to have multiple timelines (so parallelism).
> Everyone knew that engine-hopping submissions needs to be either
> implicitly or explicitly synchronised, etc.

Yup, I think we're saying the same thing here.

> So I really don't see that we have leaked timelines as a concept *now*.
> What the patch has exposed to userspace is a new way to sync between
> timelines and nothing more.

We've leaked it as something you can now share across hw context.
Which is possible because of how it's internally implemented (I think
load balancer relies on that), but not really a synchronization
primitive we want to export as such to userspace. We have other
interfaces and concepts for that.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
