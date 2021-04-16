Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB759361BB6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 10:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FF06EB38;
	Fri, 16 Apr 2021 08:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4A46EB34
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 08:49:48 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id m9so13150144wrx.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 01:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uRoTxFF1OXVjG6/o0fiqDR8JlnjHW21SFX6N1jpeew0=;
 b=HB12Sn3GcS28ZdaK2je7hzLN6yuB26rPFK2GBWA+gp6xPXpvTh4miQAmQDXC77oQJi
 37bqEkVsYf8Lx3yHty83ut3Zkj8AWJSGkryeCo9XDt2okm5IJV4dMv1Qc1vHCkVxyrk5
 YQG878C3A4kfPRcwBAKX1z0uJpeKaB911u7PE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uRoTxFF1OXVjG6/o0fiqDR8JlnjHW21SFX6N1jpeew0=;
 b=dBrqH91XxsmmhzhoEMf2ScXL2K2endwO6xvkxRL3nvtenR+H4Okb+vnHf5qLf71pfE
 HOEzPItmsJWmhMOhTq9VQCDS+w2RSQ7fxjghRJPG/CU6p6xciNSGEP5R0J7RUK8C4t9D
 jO7PgIvPENRb3EDnIQYEAGRL3pBB5Jb2IGh47ZbTeR4YhgDHGMYilLGhC0EzHhykY0Y2
 iYATjZfcrU7c/8U93u4vXTqVAf4P/n43emkDwg2vrqcRWeNlSjWk5C9CxRyjJaS/zGhb
 OJYpoEKcFucH0tmT3EOa8QyZz/TKmnoPZSQO/+regsUHrHSyuaJRYqtRMchFYFJz7v2v
 FeTQ==
X-Gm-Message-State: AOAM532KHANCuiH+ZbGCQ7pcrUEaeKex3jd35vtj5rr5ZQPYlqPydhm7
 NMaeAWQ87jxEEMWRGKS2tufpdQ==
X-Google-Smtp-Source: ABdhPJwFbH3HsEBvSQl+03qrhVW7mwxuoTpi0+a+UEefTsyragQVuxZZRYgwHVERoYfHOzB+hHp1Mg==
X-Received: by 2002:a5d:4533:: with SMTP id j19mr8118133wra.111.1618562986888; 
 Fri, 16 Apr 2021 01:49:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b15sm2324810wmj.46.2021.04.16.01.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 01:49:46 -0700 (PDT)
Date: Fri, 16 Apr 2021 10:49:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v3 3/4] drm/i915/uapi: convert i915_query and friend to
 kernel doc
Message-ID: <YHlPqPi6Mhn6dDW7@phenom.ffwll.local>
References: <20210415155958.391624-1-matthew.auld@intel.com>
 <20210415155958.391624-3-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210415155958.391624-3-matthew.auld@intel.com>
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

On Thu, Apr 15, 2021 at 04:59:57PM +0100, Matthew Auld wrote:
> Add a note about the two-step process.
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
>  include/uapi/drm/i915_drm.h | 57 ++++++++++++++++++++++++++++++-------
>  1 file changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index d9c954a5a456..ef36f1a0adde 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -2210,14 +2210,23 @@ struct drm_i915_perf_oa_config {
>  	__u64 flex_regs_ptr;
>  };
>  
> +/**
> + * struct drm_i915_query_item - An individual query for the kernel to process.
> + *
> + * The behaviour is determined by the @query_id. Note that exactly what
> + * @data_ptr is also depends on the specific @query_id.
> + */
>  struct drm_i915_query_item {
> +	/** @query_id: The id for this query */
>  	__u64 query_id;
>  #define DRM_I915_QUERY_TOPOLOGY_INFO    1
>  #define DRM_I915_QUERY_ENGINE_INFO	2
>  #define DRM_I915_QUERY_PERF_CONFIG      3
>  /* Must be kept compact -- no holes and well documented */
>  
> -	/*
> +	/**
> +	 * @length:
> +	 *
>  	 * When set to zero by userspace, this is filled with the size of the
>  	 * data to be written at the data_ptr pointer. The kernel sets this
>  	 * value to a negative value to signal an error on a particular query
> @@ -2225,21 +2234,26 @@ struct drm_i915_query_item {
>  	 */
>  	__s32 length;
>  
> -	/*
> +	/**
> +	 * @flags:
> +	 *
>  	 * When query_id == DRM_I915_QUERY_TOPOLOGY_INFO, must be 0.
>  	 *
>  	 * When query_id == DRM_I915_QUERY_PERF_CONFIG, must be one of the
> -	 * following :
> -	 *         - DRM_I915_QUERY_PERF_CONFIG_LIST
> -	 *         - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
> -	 *         - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
> +	 * following:
> +	 *
> +	 *	- DRM_I915_QUERY_PERF_CONFIG_LIST
> +	 *      - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
> +	 *      - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
>  	 */
>  	__u32 flags;
>  #define DRM_I915_QUERY_PERF_CONFIG_LIST          1
>  #define DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID 2
>  #define DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_ID   3
>  
> -	/*
> +	/**
> +	 * @data_ptr:
> +	 *
>  	 * Data will be written at the location pointed by data_ptr when the
>  	 * value of length matches the length of the data to be written by the
>  	 * kernel.
> @@ -2247,16 +2261,37 @@ struct drm_i915_query_item {
>  	__u64 data_ptr;
>  };
>  
> +/**
> + * struct drm_i915_query - Supply an array of drm_i915_query_item for the kernel
> + * to fill out.
> + *
> + * Note that this is generally a two step process for each drm_i915_query_item
> + * in the array:
> + *
> + *	1.) Call the DRM_IOCTL_I915_QUERY, giving it our array of

I'm not sure this results in pretty rendering in htmldocs output. Please
check this.

This also made me realize that we're not pulling any of this into the drm
documents at all. I'll revise my review on patch 1.

Docs here look good:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> + *	drm_i915_query_item, with drm_i915_query_item.size set to zero. The
> + *	kernel will then fill in the size, in bytes, which tells userspace how
> + *	memory it needs to allocate for the blob(say for an array of
> + *	properties).
> + *
> + *	2.) Next we call DRM_IOCTL_I915_QUERY again, this time with the
> + *	drm_i915_query_item.data_ptr equal to our newly allocated blob. Note
> + *	that the i915_query_item.size should still be the same as what the
> + *	kernel previously set. At this point the kernel can fill in the blob.
> + *
> + */
>  struct drm_i915_query {
> +	/** @num_items: The number of elements in the @items_ptr array */
>  	__u32 num_items;
>  
> -	/*
> -	 * Unused for now. Must be cleared to zero.
> +	/**
> +	 * @flags: Unused for now. Must be cleared to zero.
>  	 */
>  	__u32 flags;
>  
> -	/*
> -	 * This points to an array of num_items drm_i915_query_item structures.
> +	/**
> +	 * @items_ptr: This points to an array of num_items drm_i915_query_item
> +	 * structures.
>  	 */
>  	__u64 items_ptr;
>  };
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
