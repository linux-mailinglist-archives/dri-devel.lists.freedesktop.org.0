Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A304F3C7B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 18:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93FB10EA6E;
	Tue,  5 Apr 2022 16:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2DD10EA6F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 16:05:25 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w4so19996547wrg.12
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 09:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sMvoJW3qjiJxlpY+ypfpBvsVYO4URLi2WzYghZ2lEr0=;
 b=Ku7EyOXTZ3NMJibIqRt9wWFNFNnlcbUEF3gULlfsLWRY32pUSWuCe4BbhaQPyJdWz+
 1rOAK4EiBZ4NZ6cLC6DcveDiTfQcQxKJIA7EsmrtOTlfxLjGjGEkI3NFf6xKkyT0t0Kw
 KC+M1uD+pGoFPaBhI3K7rvVenp+gJyssznV64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sMvoJW3qjiJxlpY+ypfpBvsVYO4URLi2WzYghZ2lEr0=;
 b=X6WHBFBiDlFuZRo3rwCEV1sJ033UtUNe/ApClXJk4+i0QcIJmiafszt/QI20H2sTcZ
 LcEWhywktFbNf7C7VnP61BKi+bbVe90DfIBobZtKVsLod3orvxGqQx6jYHiZFCAYkiSy
 RvwGqo+z602uG2mAkI9T+OCig0Cn4FyR3hDsxUICRkRPnflJpal6bUR28McYXqfYk4ap
 nuX1+MiGqVSO91bOovAnpQb3LknuWdts3XptV12qKyVLhOnADA2C6MY3/bkxP7y3gYe4
 sNOXaaBYXHqhFGOHS0vOydoubL2aVuIGseMMkPfr7NdeqNuCfnbZPndh/+47L5D9ujSb
 oMbQ==
X-Gm-Message-State: AOAM533MhqFBQHcFHkOVc1jv+EOTsMzI01G0gW6wltql2K9iig1BPDAU
 iuL6XQfBMmnr75NE1XTZrEgvoQ==
X-Google-Smtp-Source: ABdhPJwM1/FE1hlfH/uq9QTXY/3xJdPu3UOg4N+hKWJypfeLUFWKBwG2R0ZNSh+gXFoFIOvxlWKVUg==
X-Received: by 2002:a05:6000:1d93:b0:205:e0af:e079 with SMTP id
 bk19-20020a0560001d9300b00205e0afe079mr3155662wrb.525.1649174723838; 
 Tue, 05 Apr 2022 09:05:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0038ca3500494sm3963493wmq.27.2022.04.05.09.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 09:05:23 -0700 (PDT)
Date: Tue, 5 Apr 2022 18:05:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fixup kerneldoc in struct
 i915_gem_context
Message-ID: <YkxowQIS5SZer86X@phenom.ffwll.local>
References: <20220405155345.3292769-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405155345.3292769-1-tvrtko.ursulin@linux.intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 05, 2022 at 04:53:45PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Mixup in rebasing and patchwork re-runs made me push the wrong version of
> the patch. Or I even forgot to send out the fixed version. Fix it up.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: 748716041dfa ("drm/i915: Track all user contexts per client")
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

You picked the wrong sha1. Sure you're on the right tree? :-)

Fixes: 49bd54b390c2 ("drm/i915: Track all user contexts per client")
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>



> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context_types.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> index 5946dcb11cf5..cb78214a7dcd 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> @@ -296,7 +296,7 @@ struct i915_gem_context {
>  	/** @client: struct i915_drm_client */
>  	struct i915_drm_client *client;
>  
> -	/** link: &drm_client.context_list */
> +	/** @client_link: for linking onto &i915_drm_client.ctx_list */
>  	struct list_head client_link;
>  
>  	/**
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
