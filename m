Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE5537A9EE
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 16:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0345F6EA63;
	Tue, 11 May 2021 14:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486AF6EA5F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 14:53:38 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id u21so30141529ejo.13
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 07:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LhVK+bnj04xYFvnqTOEUW7faHSNI0VKlzkbYMyncPII=;
 b=IzlVYRIYH7gAru/gboHgS3sWsK4FQwVQOLSEhGVSDexRUACz0WaOuz1YQCUxluSgkz
 ypRD97YLv83rv3j8JsR6MUELXTM4+A9kxgOrUz08WJg2dtTDyrnbK8cFgmv8/pfIV9+M
 r66M4d6LePdX6wC5PgVIcgTZzfbfJrKujyDs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LhVK+bnj04xYFvnqTOEUW7faHSNI0VKlzkbYMyncPII=;
 b=tbButMdv9gf5+jlCLq0/h2DXW2xLaUwCNKOIMUAFURWZp5n4+PGw4uVIsqmRQaMpf/
 Nw7Idc2gcxK8e25Zs7GNQjirpQyiGL4rX4EgQ1sBKl/a15B7YQ+PIzgoHrtqLN+ciRsY
 Se9rgUxD2FLtYmtt4ZrcV2UYwSlUhWa20XHMRNYV6257fhOScdPIAMpxt6ouOyGY3irj
 dIUru5OZOtg7Sssq5vMKEU/TKNEr50cIJL6roug9P6q67eHJuMgYwC9ZIyYVkLOm55XX
 jbP7zBfGI1nUSohm0kqMLCCeM2xHM6fV2gPNQoro2g/GTeNi5GKTTEPH743ulqTICAaZ
 lHNA==
X-Gm-Message-State: AOAM530SAETbqFrKzJn0EGJktm+XBhc3r+Jzh8yP9z8nJ93+KFpGmSmt
 9TzSHZQL/7kCoeR5xy4SpZHNug==
X-Google-Smtp-Source: ABdhPJw/jbsGbMLnyKkU8KorQFUB8dw0NpCDYgRnc8X8zdpqu+gxeLC73fhSOossZ7d4tWl28Qvm9w==
X-Received: by 2002:a17:906:ae8f:: with SMTP id
 md15mr32463857ejb.244.1620744817032; 
 Tue, 11 May 2021 07:53:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w2sm12990145edl.53.2021.05.11.07.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 07:53:36 -0700 (PDT)
Date: Tue, 11 May 2021 16:53:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [RFC PATCH 3/5] drm/i915: Expose logical engine instance to user
Message-ID: <YJqabmnUEjwi8iAJ@phenom.ffwll.local>
References: <20210506173049.72503-1-matthew.brost@intel.com>
 <20210506173049.72503-4-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506173049.72503-4-matthew.brost@intel.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: tony.ye@intel.com, tvrtko.ursulin@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 carl.zhang@intel.com, jason.ekstrand@intel.com,
 daniele.ceraolospurio@intel.com, jon.bloomfield@intel.com,
 daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 06, 2021 at 10:30:47AM -0700, Matthew Brost wrote:
> Expose logical engine instance to user via query engine info IOCTL. This
> is required for split-frame workloads as these need to be placed on
> engines in a logically contiguous order. The logical mapping can change
> based on fusing. Rather than having user have knowledge of the fusing we
> simply just expose the logical mapping with the existing query engine
> info IOCTL.
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Tony Ye <tony.ye@intel.com>
> CC: Carl Zhang <carl.zhang@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  include/uapi/drm/i915_drm.h | 7 ++++++-

Two things on all these 3 patches:

- Until we've merged the uapi it shouldn't show up in uapi headers. See
  what Matt A. has done with a fake local header in Documentation/gpu/rfc
  which you can pull in.

- Since this one is tiny I think just the text in the rfc is good enough,
  I'd drop this.

- Squash the others in with the parallel submit rfc patch so that the
  structs and long-form text are all in one patch please, makes reviewing
  the overall thing a bit simpler. Rule is to have a complete change per
  patch, and then not split things further.

>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 9f331ad629f5..26d2e135aa31 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -2396,14 +2396,19 @@ struct drm_i915_engine_info {
>  
>  	/** @flags: Engine flags. */
>  	__u64 flags;
> +#define I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE		(1 << 0)
>  
>  	/** @capabilities: Capabilities of this engine. */
>  	__u64 capabilities;
>  #define I915_VIDEO_CLASS_CAPABILITY_HEVC		(1 << 0)
>  #define I915_VIDEO_AND_ENHANCE_CLASS_CAPABILITY_SFC	(1 << 1)
>  
> +	/** Logical engine instance */

I think in the final version that we merge with the uapi this should:
- explain why we need this
- link to relevant other uapi like the paralle submit extension

Cheers, Daniel

> +	__u16 logical_instance;
> +
>  	/** @rsvd1: Reserved fields. */
> -	__u64 rsvd1[4];
> +	__u16 rsvd1[3];
> +	__u64 rsvd2[3];
>  };
>  
>  /**
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
