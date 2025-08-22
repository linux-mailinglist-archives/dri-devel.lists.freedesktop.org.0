Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 232D1B31656
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 13:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4163410EAC9;
	Fri, 22 Aug 2025 11:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dc400R1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6D110EAC9;
 Fri, 22 Aug 2025 11:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755862267; x=1787398267;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aNsUMxdllxsCnNXUJqbbfxMa47dm9MKdxbDcENRUiec=;
 b=Dc400R1xUlGzJuF4Faba5YWrS9PoA11v2H43J1Z5wZIKeGdW/LGGhC/i
 utA2P6rgk21n63b3O2ouQbbZHqzVWg/Iw2IliWSmrbe7/KloClD/bBDX7
 e21tj+UwwcW0oBZC+6zb5KtrYRE5LvZLEi2A8ahbpjn62rZBWhLHMi6wT
 zZf9RWnv2CaqlnHyN8v7oTz/cL3jVMqIxjB6JIifxccvxl/DOpstqy7Wx
 pGHvAQ1C5Mm9xDdCk/2mFjJYhGS/1whRm/3uPY33zGfcjB7e/P15Fi61V
 ZXh9lbQ6cMGaOdB1guUxZljQWHRSnsmMcHGgjl+ZnTx/1VciWsYUZHup6 w==;
X-CSE-ConnectionGUID: IJ+uhJ5zQtKjRqlRFblyXQ==
X-CSE-MsgGUID: dB+V+Z0iQHaO8Yf61oZLsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61813022"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="61813022"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 04:31:06 -0700
X-CSE-ConnectionGUID: mF0eEZMgTQOP4Se+1QoHlQ==
X-CSE-MsgGUID: mH5h8zimQQGfM3LflSsuUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="168590019"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.105])
 ([10.245.244.105])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 04:31:03 -0700
Message-ID: <1043ceb7-8198-48ed-9040-9e5d08a01723@linux.intel.com>
Date: Fri, 22 Aug 2025 13:31:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/i915/display: Error codes for async flip
 failures
To: Arun R Murthy <arun.r.murthy@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, naveen1.kumar@intel.com,
 xaver.hugl@kde.org, uma.shankar@intel.com, harry.wentland@amd.com
References: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
 <20250822-atomic-v3-4-13a0e8f2c581@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20250822-atomic-v3-4-13a0e8f2c581@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hey,

I'm not entirely sold on the design, it's way more complicated than it should be, it should be trivial to add any amount of error messages.

Replace return -EINVAL; with return drm_atomic_error_einval(state, class, "string");
Where class may be an enum, but in a way more generic way than currently specified, for example "invalid use of api", "requires modeset", "invalid arguments", "driver limitations", "async flip not possible".

The drm_atomic_error_einval() would set class and str as appropriate, and then return -EINVAL.

That's probably all we should need here.

Kind regards,
~Maarten

Den 2025-08-22 kl. 09:00, skrev Arun R Murthy:
> For failures in async flip atomic check/commit path return user readable
> error codes in struct drm_atomic_state.
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index c1a3a95c65f0b66c24ddd64f47dfdc67bbde86c9..5e23f4fc747bd01fa05eba63661bf7279b083317 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5950,6 +5950,7 @@ static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
>  		drm_dbg_kms(display->drm,
>  			    "[CRTC:%d:%s] modeset required\n",
>  			    crtc->base.base.id, crtc->base.name);
> +		state->base.error_code->failure_flags = DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET;
>  		return -EINVAL;
>  	}
>  
> @@ -6019,6 +6020,7 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
>  		drm_dbg_kms(display->drm,
>  			    "[CRTC:%d:%s] modeset required\n",
>  			    crtc->base.base.id, crtc->base.name);
> +		state->base.error_code->failure_flags = DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET;
>  		return -EINVAL;
>  	}
>  
> @@ -6061,6 +6063,8 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
>  				    plane->base.base.id, plane->base.name,
>  				    &new_plane_state->hw.fb->format->format,
>  				    new_plane_state->hw.fb->modifier);
> +			state->base.error_code->failure_flags =
> +				DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED;
>  			return -EINVAL;
>  		}
>  
> 

