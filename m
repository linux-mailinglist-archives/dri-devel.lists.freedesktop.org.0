Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6A43F34CA
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 21:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F316EB12;
	Fri, 20 Aug 2021 19:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CD86EB12
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 19:47:25 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id m193so20725275ybf.9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 12:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UPazTA8XfYDofR3TTbgJCmTrgHuhd4C1O3xYxHBaRgA=;
 b=sovvk+jZAwI03HPoKkw1IqgblckMcsumwaChDH6tokVz1UIRHfZYwuktnjWOGwZs0l
 BRoD6LlHv12QAfy5WGXJG+Q3HGSlCFyLDCw9UMzcgVl6kuk3GvCigvaf/Yb9bFg2rfDW
 nIyP097VMhSURmUSNDTs3eE1AF0SrmhM/+8QxpH8jO1pWMYpGqnTL2L4xb6n6wORtedc
 3v3x/u+AieeEBmmlwftMrnFGYtcjjxNqIS8OVKqdup7RObbhXx5PTkCSK9stzIegJBpx
 chEVB7O5+l7YlAyH53LzDTg0dkw/BhKlW7NO6R374F1dtkO6pCUqvDbKTDfKSDBjCodp
 mM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UPazTA8XfYDofR3TTbgJCmTrgHuhd4C1O3xYxHBaRgA=;
 b=E+Qitq+121s6GmScAc2a8NJE3wuGltmBJysZcl19dab+WNCofxUv5uqOSB55tcNNir
 3r1/ixh/6rUDOx+7ryBFzknubiw2h4AKW8S7DXyVYZc8shgleAzihuXUjvuXQ3qYzjed
 z7Oww6LeiNV/u43L/kBync1CzA3luq/HTXa1JBUzZFuteLv7fsD/IHLO9rGVP6OS/zT+
 lC9/tKaOrBEy07DbF5sucSeSYiKXqb7yMuTFh6OYZE9TlN7Q+fH5v01VwU+1bBoAShld
 SR3NlEBI+ey5C35PVBawXBhqptVw7je7/oz1++azERb2HKWQI6eoBoyRDdPZUF/k8/wl
 xYuQ==
X-Gm-Message-State: AOAM533sRJSaqklw1e86A5BFLOvCHE0fmnLTdh6AWIp/iIeR8UJZyyyK
 nflXBSNBaFe6gsM6qQl4afMrDsjA344J/aNfw6bWrg==
X-Google-Smtp-Source: ABdhPJz8efchEEtUD6Dnh303QK8PsVpJvln5XS5F8I1XZ8ZcJOuh55zPL5i3oVgC06kbp7IKIEmLQZYa5ZRPA/1qLxU=
X-Received: by 2002:a25:ef04:: with SMTP id g4mr25763462ybd.287.1629488844597; 
 Fri, 20 Aug 2021 12:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-8-matthew.brost@intel.com>
In-Reply-To: <20210819061639.21051-8-matthew.brost@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 20 Aug 2021 14:47:13 -0500
Message-ID: <CAOFGe97YVWwj8HrMXdJvv1rRZmss75W35pnAGXKwKQfLYHMCoQ@mail.gmail.com>
Subject: Re: [PATCH 07/27] Revert "drm/i915/gt: Propagate change in error
 status to children on unhold"
To: Matthew Brost <matthew.brost@intel.com>
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 19, 2021 at 1:22 AM Matthew Brost <matthew.brost@intel.com> wrote:
>
> Propagating errors to dependent fences is wrong, don't do it. A selftest
> in the following exposed the propagating of an error to a dependent
> fence after an engine reset.

I feel like we could still have a bit of a better message.  Maybe
something like this:

Propagating errors to dependent fences is broken and can lead to
errors from one client ending up in another.  In 3761baae908a (Revert
"drm/i915: Propagate errors on awaiting already signaled fences"), we
attempted to get rid of fence error propagation but missed the case
added in 8e9f84cf5cac ("drm/i915/gt: Propagate change in error status
to children on unhold").  Revert that one too.  This error was found
by an up-and-coming selftest which <salient information here>.

Otherwise, looks good to me.

--Jason

>
> This reverts commit 8e9f84cf5cac248a1c6a5daa4942879c8b765058.
>
> v2:
>  (Daniel Vetter)
>   - Use revert
>
> References: 3761baae908a (Revert "drm/i915: Propagate errors on awaiting already signaled fences")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index de5f9c86b9a4..cafb0608ffb4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -2140,10 +2140,6 @@ static void __execlists_unhold(struct i915_request *rq)
>                         if (p->flags & I915_DEPENDENCY_WEAK)
>                                 continue;
>
> -                       /* Propagate any change in error status */
> -                       if (rq->fence.error)
> -                               i915_request_set_error_once(w, rq->fence.error);
> -
>                         if (w->engine != rq->engine)
>                                 continue;
>
> --
> 2.32.0
>
