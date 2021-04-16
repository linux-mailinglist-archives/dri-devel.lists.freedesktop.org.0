Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B85361BAB
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 10:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2616E1B8;
	Fri, 16 Apr 2021 08:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8FE6EB2F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 08:44:32 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 n10-20020a05600c4f8ab0290130f0d3cba3so2025826wmq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 01:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GS6axXJYAn+Q0Wc2VRku2ebYmp+s13ePX3rriHqwwBs=;
 b=iGrv46dS9pGP3R4hDiKBWj8sMZbBwn2O87sd+UAQlMJjTfydk4BcIVkHeD44sX+SiJ
 0YbQ7nwNA280sIfN9CvI8dm3Be33Wv7wZ0+TO+8Q9ZkdFGDPSLpQyfH6MOGRlOtq6Wbx
 lleCuH3qSewtwHfVhbpo4Ez25ZZ6VIKO3sKXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GS6axXJYAn+Q0Wc2VRku2ebYmp+s13ePX3rriHqwwBs=;
 b=YYMI7DQbmisfWL7hEbcmtFr8uWR5wrupC8UCgqnYhAlxrZbU6hKCLPdurYuGLjP8Bo
 BpuOzwpKQuy/cjoh3viqM7/7S8O5yrSH5GVAdufSuCdI93RclABiysOaiJK6rHe2lUFX
 EcSW1L0WIXMb7rN5qTc8G4uW2I+xGquuINhumODQ6Dr1x/7LQH6y47sOqFU8c/GvLPkH
 Y0o/0ha6Kn8Nwl2166UCx2L41p7z73PdKd5J62cvJJ0ZbJcxGVLVD98EVzKEtPi9mKdv
 u8npWkJ3Pv5agl/R5CJRjsfsD8S65N1MtAerPC/aFZljsLsc0exjvYF0/0T/PVlh1rdL
 6ztg==
X-Gm-Message-State: AOAM531MkrStv509kOY2tHHn7qCyc4f7tFXXBmKU24AM8IER4+hRBcIG
 fd7x7Yqp5bbEPI97rFoXHp3DPg==
X-Google-Smtp-Source: ABdhPJycqJZcJ7vxIO6nGX0PcmSQETGxPw6IS/UUXWxARhPkhptuDnWPDfqJZhUv5UjrrWFQ3OOiAg==
X-Received: by 2002:a1c:2704:: with SMTP id n4mr7095535wmn.143.1618562670844; 
 Fri, 16 Apr 2021 01:44:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l25sm3202226wmi.17.2021.04.16.01.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 01:44:30 -0700 (PDT)
Date: Fri, 16 Apr 2021 10:44:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v3 1/4] drm/i915/uapi: hide kernel doc warnings
Message-ID: <YHlObAzsosrxXdm2@phenom.ffwll.local>
References: <20210415155958.391624-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210415155958.391624-1-matthew.auld@intel.com>
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
Cc: Jordan Justen <jordan.l.justen@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Kenneth Graunke <kenneth@whitecape.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@intel.com>,
 mesa-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 15, 2021 at 04:59:55PM +0100, Matthew Auld wrote:
> It's not properly formatted kernel doc, just nerf the warnings for now.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: mesa-dev@lists.freedesktop.org

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/uapi/drm/i915_drm.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index ddc47bbf48b6..a50257cde9ff 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -1054,12 +1054,12 @@ struct drm_i915_gem_exec_fence {
>  	__u32 flags;
>  };
>  
> -/**
> +/*
>   * See drm_i915_gem_execbuffer_ext_timeline_fences.
>   */
>  #define DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES 0
>  
> -/**
> +/*
>   * This structure describes an array of drm_syncobj and associated points for
>   * timeline variants of drm_syncobj. It is invalid to append this structure to
>   * the execbuf if I915_EXEC_FENCE_ARRAY is set.
> @@ -1700,7 +1700,7 @@ struct drm_i915_gem_context_param {
>  	__u64 value;
>  };
>  
> -/**
> +/*
>   * Context SSEU programming
>   *
>   * It may be necessary for either functional or performance reason to configure
> @@ -2067,7 +2067,7 @@ struct drm_i915_perf_open_param {
>  	__u64 properties_ptr;
>  };
>  
> -/**
> +/*
>   * Enable data capture for a stream that was either opened in a disabled state
>   * via I915_PERF_FLAG_DISABLED or was later disabled via
>   * I915_PERF_IOCTL_DISABLE.
> @@ -2081,7 +2081,7 @@ struct drm_i915_perf_open_param {
>   */
>  #define I915_PERF_IOCTL_ENABLE	_IO('i', 0x0)
>  
> -/**
> +/*
>   * Disable data capture for a stream.
>   *
>   * It is an error to try and read a stream that is disabled.
> @@ -2090,7 +2090,7 @@ struct drm_i915_perf_open_param {
>   */
>  #define I915_PERF_IOCTL_DISABLE	_IO('i', 0x1)
>  
> -/**
> +/*
>   * Change metrics_set captured by a stream.
>   *
>   * If the stream is bound to a specific context, the configuration change
> @@ -2103,7 +2103,7 @@ struct drm_i915_perf_open_param {
>   */
>  #define I915_PERF_IOCTL_CONFIG	_IO('i', 0x2)
>  
> -/**
> +/*
>   * Common to all i915 perf records
>   */
>  struct drm_i915_perf_record_header {
> @@ -2151,7 +2151,7 @@ enum drm_i915_perf_record_type {
>  	DRM_I915_PERF_RECORD_MAX /* non-ABI */
>  };
>  
> -/**
> +/*
>   * Structure to upload perf dynamic configuration into the kernel.
>   */
>  struct drm_i915_perf_oa_config {
> -- 
> 2.26.3
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
