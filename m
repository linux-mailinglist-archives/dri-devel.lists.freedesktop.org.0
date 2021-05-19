Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E5B389485
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 19:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999C96EE44;
	Wed, 19 May 2021 17:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5006EE45
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 17:16:15 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id y76so4505804oia.6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 10:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XHK8qMEJKNTFYFzFd6RoA4EfyentocUkphGdZ4KCkHI=;
 b=MJp/pwAnVlgikEUJ8nPxwtmlZ8BiEmXiZO1xdZXQgrkgszKd9K17mYPqfj2EnOvf0/
 S4CJYQATsu9qgI7PwtF3TRQ4glyF3fiPVqPxAMa2EgtfTnqGW9rplUgJb9XZ/cxfo8FE
 OU5oawKFOqEnMt6ddv3ETTtpw4L8IOwUWjpFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XHK8qMEJKNTFYFzFd6RoA4EfyentocUkphGdZ4KCkHI=;
 b=EoYZzSr2mz4t8RtkEQwNrfvD+5XfHKwuKZcNifhHn3Q/POcdTR1PXMgAyMBqxpZKVR
 z46vJoHwRWJNt0AYLOExtU1NI2fPFLgIR5UyEcvObp9LMirN+eJhW8LO5CiuemMjXxlZ
 blAaW91802ohsjNuqcuON3D8g2IAEUJ107Jwj04F6qfv7HNfYuEHPEY+4M9ENa7Tyvql
 RdLBsCF69MWIqNRUvsOSO62TgJaELbl1apppqykQwCrypk+Pmq5Q8gY3faIoabckJlDx
 XPOu9spwwShX+zHqSj8uRv086Hc8D7h0yAFnAgWXXw3/RdEA0hQ1854oFomJ96gYbe3L
 Wqqw==
X-Gm-Message-State: AOAM532brusiqBSPnSO13DrCmP8KrIey9YMjmuZXcVpi8PvAL2pgVKXe
 JbMijd24sqhtaBPR9tgiyGaxLhI1CGDQxRhBlIPr2Q==
X-Google-Smtp-Source: ABdhPJx1kbYG9t+VNEzF7OjTU7L/jyg2twCz2tzq/cYvpMh5TuX4pHgKVzGR5dUELETsXL/O9x9SiDB1hn5KvBjSDtc=
X-Received: by 2002:a05:6808:1142:: with SMTP id
 u2mr249040oiu.101.1621444574682; 
 Wed, 19 May 2021 10:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210519074323.665872-2-daniel.vetter@ffwll.ch>
 <20210519101523.688398-1-daniel.vetter@ffwll.ch>
 <CAOFGe968OKdHu9BL0hU6KWM3J5Fc6popg4GJ5kEDd-3bf4HjJw@mail.gmail.com>
In-Reply-To: <CAOFGe968OKdHu9BL0hU6KWM3J5Fc6popg4GJ5kEDd-3bf4HjJw@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 19 May 2021 19:16:03 +0200
Message-ID: <CAKMK7uFAXBU6Ot8xJkrXBVppnWi058pEyMjNOAChtepgcCKsrw@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/i915: Propagate errors on awaiting already
 signaled fences"
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable <stable@vger.kernel.org>, Jason Ekstrand <jason.ekstrand@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Marcin Slusarz <marcin.slusarz@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 5:06 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> Once we no longer rely on error propagation, I think there's a lot we
> can rip out.

I honestly did not find that much ... what did you uncover?
-Daniel

>
> --Jason
>
> On Wed, May 19, 2021 at 5:15 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > From: Jason Ekstrand <jason@jlekstrand.net>
> >
> > This reverts commit 9e31c1fe45d555a948ff66f1f0e3fe1f83ca63f7.  Ever
> > since that commit, we've been having issues where a hang in one client
> > can propagate to another.  In particular, a hang in an app can propagate
> > to the X server which causes the whole desktop to lock up.
> >
> > Error propagation along fences sound like a good idea, but as your bug
> > shows, surprising consequences, since propagating errors across security
> > boundaries is not a good thing.
> >
> > What we do have is track the hangs on the ctx, and report information to
> > userspace using RESET_STATS. That's how arb_robustness works. Also, if my
> > understanding is still correct, the EIO from execbuf is when your context
> > is banned (because not recoverable or too many hangs). And in all these
> > cases it's up to userspace to figure out what is all impacted and should
> > be reported to the application, that's not on the kernel to guess and
> > automatically propagate.
> >
> > What's more, we're also building more features on top of ctx error
> > reporting with RESET_STATS ioctl: Encrypted buffers use the same, and the
> > userspace fence wait also relies on that mechanism. So it is the path
> > going forward for reporting gpu hangs and resets to userspace.
> >
> > So all together that's why I think we should just bury this idea again as
> > not quite the direction we want to go to, hence why I think the revert is
> > the right option here.Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com>
> >
> > v2: Augment commit message. Also restore Jason's sob that I
> > accidentally lost.
> >
> > Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com> (v1)
> > Reported-by: Marcin Slusarz <marcin.slusarz@intel.com>
> > Cc: <stable@vger.kernel.org> # v5.6+
> > Cc: Jason Ekstrand <jason.ekstrand@intel.com>
> > Cc: Marcin Slusarz <marcin.slusarz@intel.com>
> > Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3080
> > Fixes: 9e31c1fe45d5 ("drm/i915: Propagate errors on awaiting already signaled fences")
> > Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> >  drivers/gpu/drm/i915/i915_request.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> > index 970d8f4986bb..b796197c0772 100644
> > --- a/drivers/gpu/drm/i915/i915_request.c
> > +++ b/drivers/gpu/drm/i915/i915_request.c
> > @@ -1426,10 +1426,8 @@ i915_request_await_execution(struct i915_request *rq,
> >
> >         do {
> >                 fence = *child++;
> > -               if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> > -                       i915_sw_fence_set_error_once(&rq->submit, fence->error);
> > +               if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> >                         continue;
> > -               }
> >
> >                 if (fence->context == rq->fence.context)
> >                         continue;
> > @@ -1527,10 +1525,8 @@ i915_request_await_dma_fence(struct i915_request *rq, struct dma_fence *fence)
> >
> >         do {
> >                 fence = *child++;
> > -               if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> > -                       i915_sw_fence_set_error_once(&rq->submit, fence->error);
> > +               if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> >                         continue;
> > -               }
> >
> >                 /*
> >                  * Requests on the same timeline are explicitly ordered, along
> > --
> > 2.31.0
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
