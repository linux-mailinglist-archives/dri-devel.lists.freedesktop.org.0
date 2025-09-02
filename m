Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A553B3FBC4
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 12:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295A010E647;
	Tue,  2 Sep 2025 10:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXTl1tZr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226F810E647;
 Tue,  2 Sep 2025 10:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756807579; x=1788343579;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KFg2SpqDcT2OUfvfjPTfytrhkxekNr/vh3quatMTd8Y=;
 b=dXTl1tZrk1rBJ3oFIdjjL6qtF7nPmDb3H/uv4gAwci9+MJWkuZDYcbiM
 4im6/4wOqWWLaUGLGmUkUT7or6hOXTyThU6xoFS5gqeYWFUsCCqAdrLTG
 UehYeST6g9rH7VlUY2wsUuTf4/NBfraZCoFdDS3Nix3UPtHILqMHYotgQ
 qu1shDa/8GHmd1lgvbRAD6rSqDphEMRG6lQlcW5TCmQJ6ObRyp7yKzjcR
 Pq6M55ZR/cj65gdSMmZN3hnb/wJ1P6qNPIcti8WiveJ+dHic8nz/3IzFF
 WjRKTiSJocgflTzmnH0M618hhI6eh/jZXQvfI7526GbcOOFEPqhqyZiSy A==;
X-CSE-ConnectionGUID: ozXGOIauR8KdTXPnql9NXg==
X-CSE-MsgGUID: HF42twvTRVeWTKlKDzSFlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70502503"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="70502503"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 03:06:18 -0700
X-CSE-ConnectionGUID: 4mNxlZfATPm/Hl8Y2uA3zg==
X-CSE-MsgGUID: GqyBaTX7S4egJGuHUTwjog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="170793683"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.193])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 03:06:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, xaver.hugl@kde.org, harry.wentland@amd.com,
 uma.shankar@intel.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH v4 1/4] drm: Define user readable error codes for atomic
 ioctl
In-Reply-To: <20250902-atomic-v4-1-a97b4bed969b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250902-atomic-v4-0-a97b4bed969b@intel.com>
 <20250902-atomic-v4-1-a97b4bed969b@intel.com>
Date: Tue, 02 Sep 2025 13:06:09 +0300
Message-ID: <151f2f238b7ad4d86e503a1b0061a5bd840a55d0@intel.com>
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

On Tue, 02 Sep 2025, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> There can be multiple reasons for a failure in atomic_ioctl. Most often
> in these error conditions -EINVAL is returned. User/Compositor would
> have to blindly take a call on failure of this ioctl so as to use
> ALLOW_MODESET or any. It would be good if user/compositor gets a
> readable error code on failure so they can take proper corrections in
> the next commit.
> The struct drm_mode_atomic is being passed by the user/compositor which
> holds the properties for modeset/flip. Reusing the same struct for
> returning the error code in case of failure can save by creating a new
> uapi/interface for returning the error code.
> The element 'reserved' in the struct drm_mode_atomic is used for
> returning the user readable error code. This points to the struct
> drm_mode_atomic_err_code. Failure reasons have been initialized in
> DRM_MODE_ATOMIC_FAILURE_REASON.
>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>

Please run 'scripts/kernel-doc -Wall -none path/to/file' on all changes,
and make sure you're not adding new errors. There are plenty, and I'm
not going to iterate to you separately what the tool can tell you.

> ---
>  include/uapi/drm/drm_mode.h | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index a122bea2559387576150236e3a88f99c24ad3138..6c4929e591b30b7a5eac472dadeeb3c9400e36df 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -45,6 +45,7 @@ extern "C" {
>  #define DRM_CONNECTOR_NAME_LEN	32
>  #define DRM_DISPLAY_MODE_LEN	32
>  #define DRM_PROP_NAME_LEN	32
> +#define DRM_MODE_ATOMIC_FAILURE_STRING_LEN	64

64 is enough for everyone?

>  
>  #define DRM_MODE_TYPE_BUILTIN	(1<<0) /* deprecated */
>  #define DRM_MODE_TYPE_CLOCK_C	((1<<1) | DRM_MODE_TYPE_BUILTIN) /* deprecated */
> @@ -1157,6 +1158,46 @@ struct drm_mode_destroy_dumb {
>  		DRM_MODE_ATOMIC_NONBLOCK |\
>  		DRM_MODE_ATOMIC_ALLOW_MODESET)
>  
> +/**
> + * enum drm_mode_atomic_err_code -  error codes for failures in atomic_ioctl
> + * @DRM_MODE_ATOMIC_INVALID_API_USAGE: invallid API usage(DRM_ATOMIC not
> + *				       enabled, invalid falg, page_flip event
> + *				       with test-only, etc)
> + * @DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET: Need full modeset on this crtc
> + * @DRM_MODE_ATOMIC_NEED_FULL_MODESET: Need full modeset on all connected crtc's
> + * @DRM_MODE_ATOMIC_ASYN_NOTSUPP_PLANE: Aync flip not supported on this plane
> + * DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPP: Modifier not supported by async flip
> + * @DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED: Property changed in async flip
> + */
> +enum drm_mode_atomic_failure_codes {
> +	DRM_MODE_ATOMIC_INVALID_API_USAGE,
> +	DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET,
> +	DRM_MODE_ATOMIC_NEED_FULL_MODESET,
> +	DRM_MODE_ATOMIC_ASYNC_NOT_SUPP_PLANE,
> +	DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPP,
> +	DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED,
> +};
> +
> +/**
> + * drm_mode_atomic_err_code - struct to store the error code
> + *
> + * pointer to this struct will be stored in reserved variable of
> + * struct drm_mode_atomic to report the failure cause to the user.
> + *
> + * @failure_code: error codes defined in enum drm_moide_atomic_failure_code
> + * @failure_string_ptr: pointer to user readable error message string
> + * @failure_obj_ptr: pointer to the drm_object that caused error
> + * @reserved: reserved for future use
> + * @count_objs: count of drm_objects if multiple drm_objects caused error
> + */
> +struct drm_mode_atomic_err_code {
> +	__u64 failure_code;
> +	__u64 failure_objs_ptr;
> +	__u64 reserved;
> +	__u32 count_objs;
> +	char failure_string[DRM_MODE_ATOMIC_FAILURE_STRING_LEN];
> +};
> +
>  struct drm_mode_atomic {
>  	__u32 flags;
>  	__u32 count_objs;

-- 
Jani Nikula, Intel
