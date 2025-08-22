Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6497EB315C0
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 12:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99F110EABF;
	Fri, 22 Aug 2025 10:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFiBDPCz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5751010EABB;
 Fri, 22 Aug 2025 10:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755859827; x=1787395827;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=a+42Fe+87HocRbu1N9P0T+fMcFa/NUGTH2WIp1alzpY=;
 b=iFiBDPCz9+CnBLs+hfzHTO4GRTPLlEF47PleHfTIp1RhEt2LJV+Maz58
 jbTatmQUq/iUO5Q5UQaTh8A+/8OoVkAXuCUMahX8PcP4XWcZgyOvT7bdG
 0hj9Ybns+U1GFkuYFJb4Sek51dkdo4tk+Zd2hJvav9hD+BNX/Ye94o3zG
 n3Dsnz/YUiaJM0Y5gA9sovFQhv7no1i0w7TdID/ceTmBYgJEN7q/xStyR
 Vt+gDR4F7WKjdMnGCkTkqrWkZvcccCUE01SSlL/fKKCH8vrzmrnk90UvW
 x8R+Cp9L5vGcd2cnNnGtTi5+LXFFJQmMHc0bacMM17SVCDnVTadyslwod A==;
X-CSE-ConnectionGUID: S+dpUlJrSou5CYebQ7GLfA==
X-CSE-MsgGUID: iGYEVHMwSdaV2f4Fncbvaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61977795"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="61977795"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 03:50:27 -0700
X-CSE-ConnectionGUID: qxoSMHNyRVqoYTZDcBNalA==
X-CSE-MsgGUID: H9cTNwWWRKKRB1g9pdFNoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="199556647"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 03:50:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, naveen1.kumar@intel.com,
 xaver.hugl@kde.org, uma.shankar@intel.com, harry.wentland@amd.com, Arun R
 Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH v3 3/4] drm/atomic: Return user readable error in
 atomic_ioctl
In-Reply-To: <20250822-atomic-v3-3-13a0e8f2c581@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
 <20250822-atomic-v3-3-13a0e8f2c581@intel.com>
Date: Fri, 22 Aug 2025 13:50:19 +0300
Message-ID: <dc5d62fc065b1273f04f07422be61e94a0d153f7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 22 Aug 2025, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> Add user readable error codes for failure cases in drm_atomic_ioctl() so
> that user can decode the error code and take corrective measurements.
>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic.c      |  6 ++++
>  drivers/gpu/drm/drm_atomic_uapi.c | 60 ++++++++++++++++++++++++++++++++-------
>  2 files changed, 56 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index cd15cf52f0c9144711da5879da57884674aea9e4..5f25e6d3cf6cf246f83a8c39450b410e97fe45bb 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1513,6 +1513,9 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  			if (drm_atomic_crtc_needs_modeset(new_crtc_state)) {
>  				drm_dbg_atomic(dev, "[CRTC:%d:%s] requires full modeset\n",
>  					       crtc->base.id, crtc->name);
> +				state->error_code->failure_flags =
> +					DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET;

It says flags, implying multiple, but you're just adding one there
anyway. Just like it was a regular enum.

> +
>  				return -EINVAL;
>  			}
>  		}
> @@ -1537,8 +1540,11 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  		drm_dbg_atomic(dev,
>  			       "driver added CRTC to commit: requested 0x%x, affected 0x%0x\n",
>  			       requested_crtc, affected_crtc);
> +		state->error_code->failure_flags = DRM_MODE_ATOMIC_NEED_FULL_MODESET;
>  		WARN(!state->allow_modeset, "adding CRTC not allowed without modesets: requested 0x%x, affected 0x%0x\n",
>  		     requested_crtc, affected_crtc);
> +
> +		return -EINVAL;

This changes behaviour.

>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index ecc73d52bfae41a7ef455a7e13649ec56c690b90..94eaf9c98eb4ac2455799f1416010d366e1b5bbc 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1058,6 +1058,9 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>  			ret = drm_atomic_crtc_get_property(crtc, crtc_state,
>  							   prop, &old_val);
>  			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
> +			if (ret)
> +				state->error_code->failure_flags =
> +					DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED;
>  			break;
>  		}
>  
> @@ -1089,6 +1092,8 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>  
>  			/* ask the driver if this non-primary plane is supported */
>  			if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
> +				state->error_code->failure_flags =
> +					DRM_MODE_ATOMIC_ASYNC_NOT_SUP_PLANE;
>  				ret = -EINVAL;
>  
>  				if (plane_funcs && plane_funcs->atomic_async_check)
> @@ -1380,6 +1385,13 @@ set_async_flip(struct drm_atomic_state *state)
>  	}
>  }
>  
> +#define FAILURE_REASON(flag, reason) #reason,
> +const char *drm_mode_atomic_failure_string[] = {
> +	DRM_MODE_ATOMIC_FAILURE_REASON
> +};
> +
> +#undef FAILURE_REASON
> +
>  int drm_mode_atomic_ioctl(struct drm_device *dev,
>  			  void *data, struct drm_file *file_priv)
>  {
> @@ -1389,9 +1401,11 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  	uint32_t __user *props_ptr = (uint32_t __user *)(unsigned long)(arg->props_ptr);
>  	uint64_t __user *prop_values_ptr = (uint64_t __user *)(unsigned long)(arg->prop_values_ptr);
>  	unsigned int copied_objs, copied_props;
> -	struct drm_atomic_state *state;
> +	struct drm_atomic_state *state = NULL;
>  	struct drm_modeset_acquire_ctx ctx;
>  	struct drm_out_fence_state *fence_state;
> +	struct drm_mode_atomic_err_code error_code;
> +	struct drm_mode_atomic_err_code __user *error_code_ptr;
>  	int ret = 0;
>  	unsigned int i, j, num_fences;
>  	bool async_flip = false;
> @@ -1400,6 +1414,11 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
>  		return -EOPNOTSUPP;
>  
> +	if (!arg->reserved)
> +		drm_err(dev, "memory not allocated for drm_atomic error reporting\n");

This right here makes me suspect you never really tried this with your
regular desktop environment.

> +
> +	memset(&error_code, 0, sizeof(struct drm_mode_atomic_err_code));
> +
>  	/* disallow for userspace that has not enabled atomic cap (even
>  	 * though this may be a bit overkill, since legacy userspace
>  	 * wouldn't know how to call this ioctl)
> @@ -1407,24 +1426,25 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  	if (!file_priv->atomic) {
>  		drm_dbg_atomic(dev,
>  			       "commit failed: atomic cap not enabled\n");
> -		return -EINVAL;
> +		error_code.failure_flags = DRM_MODE_ATOMIC_CAP_NOT_ENABLED;
> +		ret = -EINVAL;
> +		goto out;
>  	}
>  
>  	if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS) {
>  		drm_dbg_atomic(dev, "commit failed: invalid flag\n");
> -		return -EINVAL;
> -	}
> -
> -	if (arg->reserved) {
> -		drm_dbg_atomic(dev, "commit failed: reserved field set\n");
> -		return -EINVAL;
> +		error_code.failure_flags = DRM_MODE_ATOMIC_INVALID_FLAG;
> +		ret = -EINVAL;
> +		goto out;
>  	}
>  
>  	if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC) {
>  		if (!dev->mode_config.async_page_flip) {
>  			drm_dbg_atomic(dev,
>  				       "commit failed: DRM_MODE_PAGE_FLIP_ASYNC not supported\n");
> -			return -EINVAL;
> +			error_code.failure_flags = DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC;
> +			ret = -EINVAL;
> +			goto out;
>  		}
>  
>  		async_flip = true;
> @@ -1435,7 +1455,9 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT)) {
>  		drm_dbg_atomic(dev,
>  			       "commit failed: page-flip event requested with test-only commit\n");
> -		return -EINVAL;
> +		error_code.failure_flags = DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY;
> +		ret = -EINVAL;
> +		goto out;
>  	}
>  
>  	state = drm_atomic_state_alloc(dev);
> @@ -1446,6 +1468,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  	state->acquire_ctx = &ctx;
>  	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
>  
> +	state->error_code = &error_code;
> +
>  retry:
>  	copied_objs = 0;
>  	copied_props = 0;
> @@ -1542,6 +1566,22 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  	}
>  
>  out:
> +	/* update the error code if any error to allow user handling it */
> +	if (ret < 0 && arg->reserved) {
> +		error_code_ptr = (struct drm_mode_atomic_err_code __user *)
> +				 (unsigned long)arg->reserved;
> +
> +		strscpy_pad(error_code.failure_string,
> +			    drm_mode_atomic_failure_string[error_code.failure_flags],
> +			    sizeof(error_code.failure_string));
> +
> +		if (copy_to_user(error_code_ptr, &error_code, sizeof(error_code)))
> +			return -EFAULT;
> +	}
> +
> +	if (!state)
> +		return ret;
> +
>  	complete_signaling(dev, state, fence_state, num_fences, !ret);
>  
>  	if (ret == -EDEADLK) {

-- 
Jani Nikula, Intel
