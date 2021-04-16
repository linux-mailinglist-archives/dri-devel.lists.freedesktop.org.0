Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0DF361BAE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 10:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE08D6EB31;
	Fri, 16 Apr 2021 08:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6178A6EB35
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 08:46:28 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id n127so2078779wmb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 01:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TZtKMouvD7mFwYN9TYZuNLUJKhqbGaRCUZItn8qHxLk=;
 b=M38iO8DJmtwqFszUdgrqd4CVuJs6KUiD3O5IQN5fPdPOd5x1RWZm9naXypLexd+Wn4
 UM1mdhkmep0vtyGUJ3D/mhf/LdjPnpkLr2pkWfzXK4/ZbKwvDRo7dkJEuRNxptTxuvXm
 AKMOdUU7Y4Vj0R8Gt2Hcov+HouII3jhmJDVU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TZtKMouvD7mFwYN9TYZuNLUJKhqbGaRCUZItn8qHxLk=;
 b=XeKzfFPR43KFWg2Y+XTe6Dqf3czYqEgsg3WpaZNxS/gra3vNSPjOcvm8V545yAxfmC
 OB47Cinhvy0P8grqTBrTZfj1A4Mgo2C/QAuz/zTOY1b8umqeTrLSmkUr/e8ncTXC94GA
 BSK7zGXDYr6eNkatN6VdCsnm7dhn/7ufFo5JOztyuTEryERABBE1A3AoVmNzpuib8Oq2
 56MALKrd8fWO8OB1d8y2izj2Ztmk2WDqF/XnBqvLYRFgS3Nx5bnOojQ6m5ddy4uXdGWE
 r1aFOUumQPQ+EGN/NOGtWUWzEGigYQAKQ/iKG3JlPUlFMRgEDbSH+7AZZyGSuTj/Xljr
 /pyA==
X-Gm-Message-State: AOAM532WN5Lc8NLoogfvfyFiiarRo01skjorwy0GP06bzwmnDDdwWYys
 0jc3MXStTffOj4XifDCqG9SP/Q==
X-Google-Smtp-Source: ABdhPJzT6fhRawb3DhELP9SUPrdxCoBF7dEvU820P11lZ1ziwKaaOMcZ6jjuwEg27lXaU1zz5/ngnA==
X-Received: by 2002:a05:600c:1405:: with SMTP id
 g5mr7165252wmi.186.1618562786973; 
 Fri, 16 Apr 2021 01:46:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q14sm6745605wrx.40.2021.04.16.01.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 01:46:26 -0700 (PDT)
Date: Fri, 16 Apr 2021 10:46:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v3 2/4] drm/i915/uapi: convert i915_user_extension to
 kernel doc
Message-ID: <YHlO4CK8NjVtbSuS@phenom.ffwll.local>
References: <20210415155958.391624-1-matthew.auld@intel.com>
 <20210415155958.391624-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210415155958.391624-2-matthew.auld@intel.com>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Jordan Justen <jordan.l.justen@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Kenneth Graunke <kenneth@whitecape.org>,
 mesa-dev@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 15, 2021 at 04:59:56PM +0100, Matthew Auld wrote:
> Add some example usage for the extension chaining also, which is quite
> nifty.
> 
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: mesa-dev@lists.freedesktop.org
> ---
>  include/uapi/drm/i915_drm.h | 46 +++++++++++++++++++++++++++++++++----
>  1 file changed, 42 insertions(+), 4 deletions(-)
> 
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index a50257cde9ff..d9c954a5a456 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -62,8 +62,8 @@ extern "C" {
>  #define I915_ERROR_UEVENT		"ERROR"
>  #define I915_RESET_UEVENT		"RESET"
>  
> -/*
> - * i915_user_extension: Base class for defining a chain of extensions
> +/**
> + * struct i915_user_extension - Base class for defining a chain of extensions
>   *
>   * Many interfaces need to grow over time. In most cases we can simply
>   * extend the struct and have userspace pass in more data. Another option,
> @@ -76,12 +76,50 @@ extern "C" {
>   * increasing complexity, and for large parts of that interface to be
>   * entirely optional. The downside is more pointer chasing; chasing across
>   * the __user boundary with pointers encapsulated inside u64.
> + *
> + * Example chaining:
> + *
> + * .. code-block:: C
> + *
> + *	struct i915_user_extension ext3 {
> + *		.next_extension = 0, // end
> + *		.name = ...,
> + *	};
> + *	struct i915_user_extension ext2 {
> + *		.next_extension = (uintptr_t)&ext3,
> + *		.name = ...,
> + *	};
> + *	struct i915_user_extension ext1 {
> + *		.next_extension = (uintptr_t)&ext2,
> + *		.name = ...,
> + *	};
> + *
> + * Typically the i915_user_extension would be embedded in some uAPI struct, and
> + * in this case we would feed it the head of the chain(i.e ext1), which would
> + * then apply all of the above extensions.
> + *
>   */
>  struct i915_user_extension {
> +	/**
> +	 * @next_extension:
> +	 *
> +	 * Pointer to the next i915_user_extension, or zero if the end.
> +	 */
>  	__u64 next_extension;
> +	/** @name: Name of the extension */

Maybe clarify that the namespace here is per ioctl, not global. And maybe
also that the name is just an integer #define or something like that.

Either this is solid documentation, either way:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  	__u32 name;
> -	__u32 flags; /* All undefined bits must be zero. */
> -	__u32 rsvd[4]; /* Reserved for future use; must be zero. */
> +	/**
> +	 * @flags: MBZ
> +	 *
> +	 * All undefined bits must be zero.
> +	 */
> +	__u32 flags;
> +	/**
> +	 * @rsvd: MBZ
> +	 *
> +	 * Reserved for future use; must be zero.
> +	 */
> +	__u32 rsvd[4];
>  };
>  
>  /*
> -- 
> 2.26.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
