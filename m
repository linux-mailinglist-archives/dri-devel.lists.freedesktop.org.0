Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E370C344BF8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 17:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFDB89FBC;
	Mon, 22 Mar 2021 16:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D69689FBC
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 16:43:35 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so16597812otn.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 09:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ePWy0VI2H4PLLEZ4Yu2t5YK/bLUQ3M13LiJKdfqvNIc=;
 b=II+wanzqgBsWYiVYH4/vtJx0yLXft2Ms6JQQnBZZUK/VjShkpdNQFOJrwWgTkrLKC4
 OuLusT+UDeFFuyynboHzEtP3lqg9L3vmnMq9S5VDc8GL34DCN0jHNEd4A6EK2uFdWycR
 HCben+VXxU1T9cdbcQ3tt0jf3lQqzgAAHxXlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ePWy0VI2H4PLLEZ4Yu2t5YK/bLUQ3M13LiJKdfqvNIc=;
 b=lsKbTQC5tf6OfWE/L9K4HgUSv1yy6yNeZ+3Zfl15Cj7PcAeM/4Uuwulrm3M9Ccal5+
 krl4tfdZoLXn0bqUSXf6vIhNp5PiqXaF+EU6BR7MQTDj8MFVUk3WNKiELxsAK/xRvYeh
 geixbvskPpwTSI/VUvTGRL6VLT2njxGRWXaCzQbbYbByJW+HN5z3Q0X5CMQwrjOm1ZN9
 a8tJsn21dSOaZjOy3YJpVpCMJZOa8ZEzUpRvCIyfFWsvrZ67SClLo2lKjV9Pbfe1hM2N
 TGWL7StVGe6ARTtb6yPeACXV8DQjjrlKvV+XXUc70mE0J8vUnWQTQjuB0rUzGsPR+lJk
 8COw==
X-Gm-Message-State: AOAM533ch2hn6DOEa5f4xEwgL5UJpqNc06QUplec5WwYFHMr2bKZi03/
 gha3DaSti1ackJKQ/fGFK1WQrkQk70nLHURBINwNh+UfbCbAmg==
X-Google-Smtp-Source: ABdhPJy2oJ5BwuOD6FGP5CZlcvw0CvCHmvR+Hh+ITcj4j1Fcn1qVbsb5hlRl0/rTJOy1z6fQNSmGaR13/AhpLVaInv0=
X-Received: by 2002:a9d:6481:: with SMTP id g1mr610554otl.303.1616431414329;
 Mon, 22 Mar 2021 09:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210319223856.2983244-1-jason@jlekstrand.net>
 <20210319223856.2983244-4-jason@jlekstrand.net>
 <7918db68-835c-b416-6187-1e62892ce5ed@linux.intel.com>
 <YFilKSbKYd+0HbCn@phenom.ffwll.local>
 <d83162e2-4b9e-c7e9-5324-6612bb9561d6@linux.intel.com>
 <CAKMK7uG0GLPu+auqDgMgD7ugvWo3E7W7DL6eALKxmp6hk-aZiA@mail.gmail.com>
 <fb406aca-1211-e1e5-b6a0-830c26d327ae@linux.intel.com>
In-Reply-To: <fb406aca-1211-e1e5-b6a0-830c26d327ae@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 22 Mar 2021 17:43:23 +0100
Message-ID: <CAKMK7uEf5p+UJNtr0sBRRjegn=88Pr=BCYhGpTy_J1hpRspk7Q@mail.gmail.com>
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

On Mon, Mar 22, 2021 at 4:31 PM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 22/03/2021 14:57, Daniel Vetter wrote:
> > On Mon, Mar 22, 2021 at 3:33 PM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> On 22/03/2021 14:09, Daniel Vetter wrote:
> >>> On Mon, Mar 22, 2021 at 11:22:01AM +0000, Tvrtko Ursulin wrote:
> >>>>
> >>>> On 19/03/2021 22:38, Jason Ekstrand wrote:
> >>>>> This API allows one context to grab bits out of another context upon
> >>>>> creation.  It can be used as a short-cut for setparam(getparam()) for
> >>>>> things like I915_CONTEXT_PARAM_VM.  However, it's never been used by any
> >>>>> real userspace.  It's used by a few IGT tests and that's it.  Since it
> >>>>> doesn't add any real value (most of the stuff you can CLONE you can copy
> >>>>> in other ways), drop it.
> >>>>
> >>>> No complaints to remove if it ended up unused outside IGT. Latter is a _big_
> >>>> problem though, since it is much more that a few IGT tests. So I really
> >>>> think there really needs to be an evaluation and a plan for that (we don't
> >>>> want to lose 50% of the coverage over night).
> >>>>
> >>>>> There is one thing that this API allows you to clone which you cannot
> >>>>> clone via getparam/setparam: timelines.  However, timelines are an
> >>>>> implementation detail of i915 and not really something that needs to be
> >>>>
> >>>> Not really true timelines are i915 implementation detail. They are in fact a
> >>>> dma-fence context:seqno concept, nothing more that than. I think you are
> >>>> probably confusing struct intel_timeline with the timeline wording in the
> >>>> uapi. Former is i915 implementation detail, but context:seqno are truly
> >>>> userspace timelines.
> >>>
> >>> I think you're both saying the same thing and talking a bit past each
> >>> another.
> >>>
> >>> Yes the timeline is just a string of dma_fence, that's correct. Now
> >>> usually if you submit batches with execbuf, we have 3 ways to synchronize
> >>> concurrent submission: implicit sync, sync_file and drm_syncob. They all
> >>> map to different needs in different protocols/render apis.
> >>>
> >>> Now in one additional case the kernel makes sure that batchbuffers are
> >>> ordered, and that's when you submit them to the same hw ctx. Because
> >>> there's only 1 hw context and you really can't have batchbuffers run on
> >>> that single hw context out of order. That's what the timeline object we
> >>> talk about here is. But that largely is an internal implementation detail,
> >>> which happens to also use most/all the same infrastructure as the
> >>> dma_fence uapi pieces above.
> >>>
> >>> Now the internal implementation detail leaking here is that we exposed
> >>> this to userspace, without there being any need for this. What Jason
> >>> implements with syncobj in the next patch is essentially what userspace
> >>> should have been using for cross-engine sync. media userspace doesn't care
> >>> about interop with winsys/client apis, so they equally could have used
> >>> implicit sync or sync_file here (which I think is the solution now for the
> >>> new uapi prepped internally), since they all are about equally powerful
> >>> for stringing batchbuffers together.
> >>
> >> Are you saying we exposed a single timeline of execution per hw context
> >> via the single timeline flag?!
> >
> > Nope.
> >
> >> Timelines of execution were always exposed. Any "engine" (ring
> >> previously) in I915_EXEC_RING_MASK was a single timeline of execution.
> >> It is completely the same with engine map engines, which are also
> >> different indices into I915_EXEC_RING_MASK space.
> >>
> >> Userspace was aware of these timelines forever as well. Media was
> >> creating multiple contexts to have multiple timelines (so parallelism).
> >> Everyone knew that engine-hopping submissions needs to be either
> >> implicitly or explicitly synchronised, etc.
> >
> > Yup, I think we're saying the same thing here.
> >
> >> So I really don't see that we have leaked timelines as a concept *now*.
> >> What the patch has exposed to userspace is a new way to sync between
> >> timelines and nothing more.
> >
> > We've leaked it as something you can now share across hw context.
>
> Okay so we agree on most things but apparently have different
> definitions of what it means to leak internal implementation details.
>
> While at the same time proof that we haven't leaked the internal
> implementation details is that Jason was able to implement the single
> timeline flag with a drm syncobj at the execbuf top level. (Well mostly,
> ignoring the probably inconsequential difference of one vs multiple
> fence contexts.)

It's not a matching implementation. It's only good enough for what
media needs, and essentially what media should have done to begin
with.

There's substantially different behaviour between SINGLE_TIMELINE and
what Jason has done here when you race concurrent execbuf calls:
Former guarantees total ordering, the latter doesn't even try. They
are not the same thing, but luckily userspace doesn't care about that
difference.

Aside, just to make sure this wont get lost: I do agree that we should
only allow this up to maybe ADL, and reject it on anything new (maybe
including dg1 while we're at it, since the pci ids for that aren't
even close to upstream yet).
-Daniel

> > Which is possible because of how it's internally implemented (I think
> > load balancer relies on that), but not really a synchronization
>
> Virtual engine is a single timeline by definition and it is still that
> regardless of the implementation details (execlists or GuC, in both
> cases it is a single hardware context and a single timeline).
>
> > primitive we want to export as such to userspace. We have other
> > interfaces and concepts for that.
>
> Yes, that is the only point to argue IMO. We can say it wasn't needed
> and should have been avoided, but I still maintain we can't really say
> we leaked anything backend specific to userspace via it.
>
> Regards,
>
> Tvrtko



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
