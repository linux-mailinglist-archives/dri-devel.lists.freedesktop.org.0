Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0153378A7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 17:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A946EE34;
	Thu, 11 Mar 2021 16:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B06B6EE34
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 16:01:50 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id l12so2500724wry.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 08:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6PUsVpGph36284eeRK5/psG4ebBX4nn/izAO0rHcc4U=;
 b=hpPgHTWBaVyNOFFTSWYVZMjf19TcHlvdRyjSTRmh0MFiHhAGvJtB+ZoseD7Vfi3D2p
 oeA9vNGnyvVQJCbuxzp3WK0CgOFDuK76TWwKtFOKxD0paGbMlzh6XLhEj2aI7w7jMN1L
 gwzQ5NYhtr9ttUbUI3gRxnYFXMRfh/fXAvtMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6PUsVpGph36284eeRK5/psG4ebBX4nn/izAO0rHcc4U=;
 b=tdvJyOwp/xUgQYTGywGUdVosIlNCP3c4XhGSMTiujADKXwkcx1KhX9cygtAPTnrgqP
 mZ6xcSyLXKW4OlZd7KPakjQ5JtCddHZ9/CK7cDkam4ICdJyWBn8gMwJ/DO40C8185nni
 FFBLTqD6JLopZDzDTfVzsTah/hc+BAA7L8oJ1WS5S32ybTgZHuIY/NQi69Du9MT2hOkD
 5FjFcFDCySRlDww/Nyq6vhyUOXrywVssnpQQlREYPeLjrIFFRJ+Ou1FJzarOk3A9scN3
 UL9WohzrrV5jCiR+EnV4R14IVNxjFTr8986auKY2ovRaShJTEmaDUygH7caC7gM1Rznj
 Ppug==
X-Gm-Message-State: AOAM530TZqgH/KJ6tAJflDnlDXZvFNySHAw6fRWWuxdUVlMfacz8Xsu4
 tjzlx+jOBpLOOcxNjd9OhKvkTw==
X-Google-Smtp-Source: ABdhPJzhXdJi5PgNzvG48cxc6tOHXnRSOX3KF1zUl83bpJcKnXMggcaYT5VRZzd9/qfDlM+cAa2Wew==
X-Received: by 2002:adf:d0c9:: with SMTP id z9mr9775543wrh.396.1615478508855; 
 Thu, 11 Mar 2021 08:01:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l4sm4448134wrt.60.2021.03.11.08.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 08:01:48 -0800 (PST)
Date: Thu, 11 Mar 2021 17:01:46 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH] Revert "drm/i915: Propagate errors on
 awaiting already signaled fences"
Message-ID: <YEo+6uvS7d0hh6nz@phenom.ffwll.local>
References: <20210305170546.56472-1-jason.ekstrand@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210305170546.56472-1-jason.ekstrand@intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Jason Ekstrand <jason.ekstrand@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 05, 2021 at 11:05:46AM -0600, Jason Ekstrand wrote:
> This reverts commit 9e31c1fe45d555a948ff66f1f0e3fe1f83ca63f7.  Ever
> since that commit, we've been having issues where a hang in one client
> can propagate to another.  In particular, a hang in an app can propagate
> to the X server which causes the whole desktop to lock up.
> 
> Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com>
> Reported-by: Marcin Slusarz <marcin.slusarz@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3080
> Fixes: 9e31c1fe45d5 ("drm/i915: Propagate errors on awaiting already signaled fences")

Yeah I suggested to just go with the revert, so I guess on my to give you
the explainer to be added to the commit message.

Error propagation along fences sound like a good idea, but as your bug
shows, surprising consequences, since propagating errors across security
boundaries is not a good thing.

What we do have is track the hangs on the ctx, and report information to
userspace using RESET_STATS. That's how arb_robustness works. Also, if my
understanding is still correct, the EIO from execbuf is when your context
is banned (because not recoverable or too many hangs). And in all these
cases it's up to userspace to figure out what is all impacted and should
be reported to the application, that's not on the kernel to guess and
automatically propagate.

What's more, we're also building more features on top of ctx error
reporting with RESET_STATS ioctl: Encrypted buffers use the same, and the
userspace fence wait also relies on that mechanism. So it is the path
going forward for reporting gpu hangs and resets to userspace.

So all together that's why I think we should just bury this idea again as
not quite the direction we want to go to, hence why I think the revert is
the right option here.

Maybe quote the entire above thing in the commit message, if it makes some
sense?

Cheers, Daniel
> ---
>  drivers/gpu/drm/i915/i915_request.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index e7b4c4bc41a64..870d6083bb57e 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -1232,10 +1232,8 @@ i915_request_await_execution(struct i915_request *rq,
>  
>  	do {
>  		fence = *child++;
> -		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> -			i915_sw_fence_set_error_once(&rq->submit, fence->error);
> +		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>  			continue;
> -		}
>  
>  		if (fence->context == rq->fence.context)
>  			continue;
> @@ -1333,10 +1331,8 @@ i915_request_await_dma_fence(struct i915_request *rq, struct dma_fence *fence)
>  
>  	do {
>  		fence = *child++;
> -		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> -			i915_sw_fence_set_error_once(&rq->submit, fence->error);
> +		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>  			continue;
> -		}
>  
>  		/*
>  		 * Requests on the same timeline are explicitly ordered, along
> -- 
> 2.29.2
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
