Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9F03A9C07
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 15:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3116E067;
	Wed, 16 Jun 2021 13:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB08D6E17B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 13:32:04 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id w21so2729825edv.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 06:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wTmtrnI3k4uYF89YD7WUUrmu4MvsePXnAgoudc9SbXQ=;
 b=Xi4rzEdOJBgyFPirSFq6/5kvrYXOZFbZlEeAAU4me/zagJeVF1tMQAilASP84COx4y
 xiAvCz78+CStoeL8UEeGK9Qoben+JbtnkCRh2Q/1IFd7FFy7jq7CVAnNobMB5cHSXu5W
 tC1ADafWSOXqFM8Uw9U/AY+Va8HOHrTpAvOhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wTmtrnI3k4uYF89YD7WUUrmu4MvsePXnAgoudc9SbXQ=;
 b=B4kNsr9ihYfo5TpgmLlxNB0aluGsPdJqQYFdrf7ufn9ceDWDkP6m3YLbRLmnX9g5gL
 LbuufhHaa825We7LrcgiJKUAwwXwE5wUp73pUSAB5ylumDQ1P8im6NlHPD1Qd9ubPCfI
 iAnpw/+fT9zFmxZCxCdlQlyih1ia84K+e9ZI9haekTWm5nasGL2i8J3sFjwl77p280BR
 CsatHtA6CCtnVn9QaTy5QIna7NTn/WoREv3oUczxMliHnHefHEiOEa4ELyTMX7aPGk9y
 hDkKzuTMdbeKVa/OqgU6OfHZCk8b75Z0meEH6hDbmkncaFO6BPES0vcHz6fay/yDj89M
 t7VA==
X-Gm-Message-State: AOAM530oX5df8MKLSNU1Mjqb0jIo0H/wzdXrCW8Qu+AMUEndIgHE19Fc
 K3wlOR57r/VIpt26EFgDxne4+g==
X-Google-Smtp-Source: ABdhPJyNVEwNo2lqioumMOxXwhivCzOm9kScllxAEwq3Pv+NpVKtyobMpUFKP8xAoYdf9jWEZ7UqZQ==
X-Received: by 2002:a05:6402:845:: with SMTP id
 b5mr4211768edz.266.1623850322754; 
 Wed, 16 Jun 2021 06:32:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n23sm1861579edr.87.2021.06.16.06.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 06:32:02 -0700 (PDT)
Date: Wed, 16 Jun 2021 15:32:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/i915: return DRIVER_NAME for the fence driver name
Message-ID: <YMn9UDHpMA6MKiSL@phenom.ffwll.local>
References: <20210616122833.332954-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616122833.332954-1-matthew.auld@intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: intel-gfx@lists.freedesktop.org, Michael Mason <michael.w.mason@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 16, 2021 at 01:28:33PM +0100, Matthew Auld wrote:
> The first tracepoint for a request is trace_dma_fence_init which is
> called in the ctor before we have properly setup the request->engine. So
> if it's a non-recycled request the rq->engine might be NULL, or some
> garbage value, which leads to a crash.

I'd hammer it more in here that we cannot move the dma_fence_init out of
the slab constructor (aka ctor), because that breaks the magic request
recycling through SLAB_TYPESAFE_BY_RCU. You do explain it all, but in a
rather dense fashion. More verbosity here would be good.

> Since we are not permitted to use kmem_cache_zalloc() here with

This part I'm not really clear on ... what would zalloc break? Ideally
references to the commits/bugs/functions in the code that would blow up
would be good here.

> SLAB_TYPESAFE_BY_RCU, one approach is simply to return DRIVER_NAME. We
> can then revisit this later if we decide to get rid of
> SLAB_TYPESAFE_BY_RCU.
> 
> Fixes: 855e39e65cfc ("drm/i915: Initialise basic fence before acquiring seqno")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Michael Mason <michael.w.mason@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>

As a stop-gab the code change looks reasonable, but I think the commit
message needs work and much more of the history/background we're hitting
here.

Thanks, Daniel

> ---
>  drivers/gpu/drm/i915/i915_request.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 1014c71cf7f5..55fa94bde22e 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -61,7 +61,7 @@ static struct i915_global_request {
>  
>  static const char *i915_fence_get_driver_name(struct dma_fence *fence)
>  {
> -	return dev_name(to_request(fence)->engine->i915->drm.dev);
> +	return DRIVER_NAME;
>  }
>  
>  static const char *i915_fence_get_timeline_name(struct dma_fence *fence)
> -- 
> 2.26.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
