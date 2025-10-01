Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8B2BB0CC2
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 16:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B167910E6D2;
	Wed,  1 Oct 2025 14:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="wGtP/68I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F77110E6D2;
 Wed,  1 Oct 2025 14:47:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 910741A0F6A;
 Wed,  1 Oct 2025 14:47:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 55547606BF;
 Wed,  1 Oct 2025 14:47:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 83D00102F1A4C; 
 Wed,  1 Oct 2025 16:47:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759330058; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=yL/Oyn3B70w8Mm1/pAZWqgPSUa9b8lCI/5PaHE+T3rU=;
 b=wGtP/68IjjzKyKKpBPbgrZ+9tKnGp3dUZCCL3afPEI01ucgRH416sjOQGyBIkNt7tU8qzi
 R4nZdlOxPLN7IpSl+Z4S9jvw2bNP10UyyDzNumHmj+FqLUUL4EP9gyKsTbHLZeJDCfQtE9
 I3Hrg0/TYJGDEYareuvKzBhsO6H5p8DnncKn0PgnNUARsS8W7hV/DTDvUewnhWTCnkMbOJ
 hCZz4GQr8WIbLQx5r/bAH1UOziGRmXohUf3hhAiRF7ctcVOkaQLH8OUjLDJCxBpyiykNLZ
 P8jdRXrdxvQrn3F7Sx0OiVq19C44V+5TZZn7IBDLeq8ZKF+hJJ8ER0svzthJoQ==
Message-ID: <75d34fe4-a820-4a2c-a73d-b4ce8e8e872f@bootlin.com>
Date: Wed, 1 Oct 2025 16:47:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] drm/atomic: Return user readable error in
 atomic_ioctl
To: Arun R Murthy <arun.r.murthy@intel.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org,
 harry.wentland@amd.com, uma.shankar@intel.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250916-atomic-v5-0-821525cfbf25@intel.com>
 <20250916-atomic-v5-4-821525cfbf25@intel.com>
Content-Language: en-US, fr
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250916-atomic-v5-4-821525cfbf25@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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



Le 16/09/2025 à 09:18, Arun R Murthy a écrit :
> Add user readable error codes for failure cases in drm_atomic_ioctl() so
> that user can decode the error code and take corrective measurements.
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>   drivers/gpu/drm/drm_atomic_uapi.c | 71 ++++++++++++++++++++++++++++-----------
>   1 file changed, 52 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 3ef478e717bec917d1b8803c72bbcc8d6409d745..3d4e9709e8e289cf302413e171b1336812d65c1c 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1036,6 +1036,11 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>   			ret = drm_atomic_connector_get_property(connector, connector_state,
>   								prop, &old_val);
>   			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
> +			if (ret) {
> +				drm_mode_atomic_add_error_msg(&state->error_code,
> +							      DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED,
> +							      "property change not allowed in async flip");
> +			}
>   			break;
>   		}
>   
> @@ -1058,6 +1063,11 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>   			ret = drm_atomic_crtc_get_property(crtc, crtc_state,
>   							   prop, &old_val);
>   			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
> +			if (ret) {
> +				drm_mode_atomic_add_error_msg(&state->error_code,
> +							      DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED,
> +							      "property change not allowed in async flip");
> +			}
>   			break;
>   		}
>   
> @@ -1096,9 +1106,10 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>   					ret = plane_funcs->atomic_async_check(plane, state, true);
>   
>   				if (ret) {
> -					drm_dbg_atomic(prop->dev,
> -						       "[PLANE:%d:%s] does not support async flips\n",
> -						       obj->id, plane->name);
> +					drm_mode_atomic_add_error_msg(&state->error_code,
> +								      DRM_MODE_ATOMIC_ASYNC_NOT_SUPP_PLANE,
> +								      "[PLANE:%d:%s] does not support async flip",
> +								      obj->id, plane->name);
>   					break;

Thanks for this series, it is a nice contribution!

I am not sure about this change, drm_dbg will be in debug logs, but 
drm_mode_atomic_add_error_msg do a drm_err, is it expected?
This is also the case for other drm_mode_atomic_add_error_msg calls in 
this patch and the next one.

>   				}
>   			}
> @@ -1393,6 +1404,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>   	struct drm_atomic_state *state;
>   	struct drm_modeset_acquire_ctx ctx;
>   	struct drm_out_fence_state *fence_state;
> +	struct drm_mode_atomic_err_code __user *error_code_ptr;
>   	int ret = 0;
>   	unsigned int i, j, num_fences = 0;
>   	bool async_flip = false;
> @@ -1401,6 +1413,14 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>   	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
>   		return -EOPNOTSUPP;
>   
> +	if (!arg->reserved)
> +		drm_dbg_atomic(dev,
> +			       "memory not allocated for drm_atomic error reporting\n");
> +	else
> +		/* update the error code if any error to allow user handling it */
> +		error_code_ptr = (struct drm_mode_atomic_err_code __user *)
> +				 (unsigned long)arg->reserved;
> +
>   	state = drm_atomic_state_alloc(dev);
>   	if (!state)
>   		return -ENOMEM;
> @@ -1409,31 +1429,35 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>   	state->acquire_ctx = &ctx;
>   	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
>   
> +	memset(&state->error_code, 0, sizeof(struct drm_mode_atomic_err_code));
> +
>   	/* disallow for userspace that has not enabled atomic cap (even
>   	 * though this may be a bit overkill, since legacy userspace
>   	 * wouldn't know how to call this ioctl)
>   	 */
>   	if (!file_priv->atomic) {
> -		drm_dbg_atomic(dev,
> -			       "commit failed: atomic cap not enabled\n");
> -		return -EINVAL;
> +		drm_mode_atomic_add_error_msg(&state->error_code,
> +					      DRM_MODE_ATOMIC_INVALID_API_USAGE,
> +					      "DRM_ATOMIC capability not enabled");
> +		ret = -EINVAL;
> +		goto out;
>   	}
>   
>   	if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS) {
> -		drm_dbg_atomic(dev, "commit failed: invalid flag\n");
> -		return -EINVAL;
> -	}
> -
> -	if (arg->reserved) {
> -		drm_dbg_atomic(dev, "commit failed: reserved field set\n");
> -		return -EINVAL;
> +		drm_mode_atomic_add_error_msg(&state->error_code,
> +					      DRM_MODE_ATOMIC_INVALID_API_USAGE,
> +					      "invalid flag");
> +		ret = -EINVAL;
> +		goto out;
>   	}
>   
>   	if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC) {
>   		if (!dev->mode_config.async_page_flip) {
> -			drm_dbg_atomic(dev,
> -				       "commit failed: DRM_MODE_PAGE_FLIP_ASYNC not supported\n");
> -			return -EINVAL;
> +			drm_mode_atomic_add_error_msg(&state->error_code,
> +						      DRM_MODE_ATOMIC_INVALID_API_USAGE,
> +						      "DRM_MODE_PAGE_FLIP_ASYNC not supported with ATOMIC ioctl");
> +			ret = -EINVAL;
> +			goto out;
>   		}
>   
>   		async_flip = true;
> @@ -1442,9 +1466,11 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>   	/* can't test and expect an event at the same time. */
>   	if ((arg->flags & DRM_MODE_ATOMIC_TEST_ONLY) &&
>   			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT)) {
> -		drm_dbg_atomic(dev,
> -			       "commit failed: page-flip event requested with test-only commit\n");
> -		return -EINVAL;
> +		drm_mode_atomic_add_error_msg(&state->error_code,
> +					      DRM_MODE_ATOMIC_INVALID_API_USAGE,
> +					      "page-flip event requested with test-only commit");
> +		ret = -EINVAL;
> +		goto out;
>   	}
>   
>   retry:
> @@ -1543,6 +1569,13 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>   	}
>   
>   out:
> +	/* update the error code if any error to allow user handling it */
> +	if (ret < 0 && arg->reserved) {
> +		if (copy_to_user(error_code_ptr, &state->error_code,
> +				 sizeof(state->error_code)))
> +			return -EFAULT;
> +	}
> +
>   	if (num_fences)
>   		complete_signaling(dev, state, fence_state, num_fences, !ret);
>   
> 

-- 
--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

