Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4F3389232
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 17:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A144E6EDF0;
	Wed, 19 May 2021 15:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6846EE08
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 15:06:54 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id r11so15716853edt.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 08:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J+AedYZJkbOKp6nFVAINBDzhfLoYklzsCTYadR3CbeM=;
 b=XnS5rx4QBHPJDHwJ/Si0eoQ9CBnlABWDS5R9+V8lTwjGVdtC1QGIJfx9lv0pecF2Xn
 0xKNXN+fgyfMWKuZEHVOUL8bxNEDQp75l3b8BgkJmi0l6qThP3FGkLxa+INDxWYdbx5+
 q9OzZPxgTo+MtkPfb8vCDqIqO4Jme8wEinXsi0XU2niaH64AEpv2cF5ZGkKwEx0RqSIE
 cevBNa41Vq91ERoZ/JNKVWTvidl1JVKpacUx/i5XQ0PMQTl/r4MRPo9RRLbTUG5+QCJQ
 b76anT1CEaLasN1bd9/YD/3TOizAmBb0kzkVXb6ULfP9JEmLzn/qjWzPZO6X9qkuWx2z
 +3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J+AedYZJkbOKp6nFVAINBDzhfLoYklzsCTYadR3CbeM=;
 b=MsdPURMd9UbC1M59HEFH/CuO5Exk2iXv/l8coDI2aqeoIclR/eehniw/PgyxF3GW8C
 qtGNGVRykJEfLqsutVjQdbWH0//N0VcCt3ic69BQXxotAJr8fqnmg1i3GEwZxuc6GNW0
 YB1S8tyHj3EYYUMlDLLMCjLO3JG9vXyUj2vAkkr7QQTBZhkPNUtIes82DCoTKn23WJdO
 FQ2nk8or2ikp+SP0tdl9Bjhs1bC6vs42Xj2mxNtKo/nRWrZ7KeIhcmoc2ehln06W7ubB
 utimZyA6MhbHt8XZmirgbxfNAhD1r1elqhfZLi/CgWSEEBQfcigmJChYwQNMHzQ0mH36
 95vA==
X-Gm-Message-State: AOAM532mjHONJLaFc5XdXtXl4mWHF3iWPSxvOWxGiQ6R54caFTjgRsl0
 Tl+mZs+nC9mTlihi3wNwFHnqy9RI/vz/hfJUfWM9Vg==
X-Google-Smtp-Source: ABdhPJwhcCJKrgx1tq8XuO4wAj5TbZemTD4aL5TN5XgYn5xGeAi+RERByHHVmUMQrVfrZ9dl/lFplEoqHoDwK9Unt9Q=
X-Received: by 2002:aa7:cc19:: with SMTP id q25mr14840930edt.56.1621436812652; 
 Wed, 19 May 2021 08:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210519074323.665872-2-daniel.vetter@ffwll.ch>
 <20210519101523.688398-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210519101523.688398-1-daniel.vetter@ffwll.ch>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 19 May 2021 10:06:40 -0500
Message-ID: <CAOFGe968OKdHu9BL0hU6KWM3J5Fc6popg4GJ5kEDd-3bf4HjJw@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/i915: Propagate errors on awaiting already
 signaled fences"
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
 stable@vger.kernel.org, Jason Ekstrand <jason.ekstrand@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Marcin Slusarz <marcin.slusarz@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Once we no longer rely on error propagation, I think there's a lot we
can rip out.

--Jason

On Wed, May 19, 2021 at 5:15 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> From: Jason Ekstrand <jason@jlekstrand.net>
>
> This reverts commit 9e31c1fe45d555a948ff66f1f0e3fe1f83ca63f7.  Ever
> since that commit, we've been having issues where a hang in one client
> can propagate to another.  In particular, a hang in an app can propagate
> to the X server which causes the whole desktop to lock up.
>
> Error propagation along fences sound like a good idea, but as your bug
> shows, surprising consequences, since propagating errors across security
> boundaries is not a good thing.
>
> What we do have is track the hangs on the ctx, and report information to
> userspace using RESET_STATS. That's how arb_robustness works. Also, if my
> understanding is still correct, the EIO from execbuf is when your context
> is banned (because not recoverable or too many hangs). And in all these
> cases it's up to userspace to figure out what is all impacted and should
> be reported to the application, that's not on the kernel to guess and
> automatically propagate.
>
> What's more, we're also building more features on top of ctx error
> reporting with RESET_STATS ioctl: Encrypted buffers use the same, and the
> userspace fence wait also relies on that mechanism. So it is the path
> going forward for reporting gpu hangs and resets to userspace.
>
> So all together that's why I think we should just bury this idea again as
> not quite the direction we want to go to, hence why I think the revert is
> the right option here.Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com>
>
> v2: Augment commit message. Also restore Jason's sob that I
> accidentally lost.
>
> Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com> (v1)
> Reported-by: Marcin Slusarz <marcin.slusarz@intel.com>
> Cc: <stable@vger.kernel.org> # v5.6+
> Cc: Jason Ekstrand <jason.ekstrand@intel.com>
> Cc: Marcin Slusarz <marcin.slusarz@intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3080
> Fixes: 9e31c1fe45d5 ("drm/i915: Propagate errors on awaiting already signaled fences")
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/i915/i915_request.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 970d8f4986bb..b796197c0772 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -1426,10 +1426,8 @@ i915_request_await_execution(struct i915_request *rq,
>
>         do {
>                 fence = *child++;
> -               if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> -                       i915_sw_fence_set_error_once(&rq->submit, fence->error);
> +               if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>                         continue;
> -               }
>
>                 if (fence->context == rq->fence.context)
>                         continue;
> @@ -1527,10 +1525,8 @@ i915_request_await_dma_fence(struct i915_request *rq, struct dma_fence *fence)
>
>         do {
>                 fence = *child++;
> -               if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> -                       i915_sw_fence_set_error_once(&rq->submit, fence->error);
> +               if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>                         continue;
> -               }
>
>                 /*
>                  * Requests on the same timeline are explicitly ordered, along
> --
> 2.31.0
>
