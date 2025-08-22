Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23503B31594
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 12:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6D510EAB9;
	Fri, 22 Aug 2025 10:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJnRiaFA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B0F10EAB4;
 Fri, 22 Aug 2025 10:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755859085; x=1787395085;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7MSUp626NHVwKRmqYbY3wrHcCVUyrB7Bqzps/6zvcQ8=;
 b=cJnRiaFANi0LSAozeDcf6V/cwDy7fPdYVYs9D00dddukT2QTvm35/xtA
 s4C2ORqa9MxJ0dx2E8HWgJDtkFa0Ut1O/KUrCsIgtDbGQTJLaFf7yYiRI
 nncfzkCi4XHE/IV/8GsVg12yFLY2kN01U+D5Z72M825PGTX1KIBRilRx6
 3e6KbDC2RpABZHWD1OFZ2ZxN4vD6k4BU0dS2ZSxJ/NHqNMvx14BW62Iby
 Hvc7p2Pvt3Mg7R/O7c5SrdZbjwzIJ9UUFT93KgwOtlbNC0AjJ6vdQovHk
 tta6ix+7nRp57j0nIPoVeQ0xFhaxxzKxT+tSNNkME1XqH85nDg5Xc46Y3 Q==;
X-CSE-ConnectionGUID: KOVe8HR7RDWUo7kNiv0SaA==
X-CSE-MsgGUID: gsOaRYZmTBSPDUxXTSXxzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58088626"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="58088626"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 03:38:04 -0700
X-CSE-ConnectionGUID: otHkoO4eQAWLwChTK1wnvA==
X-CSE-MsgGUID: EUWTmwuzS6efU61QIsMkvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="173096753"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 03:37:59 -0700
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
Subject: Re: [PATCH v3 1/4] drm: Define user readable error codes for atomic
 ioctl
In-Reply-To: <20250822-atomic-v3-1-13a0e8f2c581@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
 <20250822-atomic-v3-1-13a0e8f2c581@intel.com>
Date: Fri, 22 Aug 2025 13:37:56 +0300
Message-ID: <8f24c0051cab99aa5f399dc3b6eb6dd2fb1e8b6c@intel.com>
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

At the moment, I'm not (yet) convinced any of this will work, even as a
concept.

Even so, I'll comment on some of the choices in the series.

> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  include/uapi/drm/drm_mode.h | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index a122bea2559387576150236e3a88f99c24ad3138..f0986a3fe9a7d61e57e9a9a5ec01a604343f6930 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -45,6 +45,7 @@ extern "C" {
>  #define DRM_CONNECTOR_NAME_LEN	32
>  #define DRM_DISPLAY_MODE_LEN	32
>  #define DRM_PROP_NAME_LEN	32
> +#define DRM_MODE_ATOMIC_FAILURE_STRING_LEN	64
>  
>  #define DRM_MODE_TYPE_BUILTIN	(1<<0) /* deprecated */
>  #define DRM_MODE_TYPE_CLOCK_C	((1<<1) | DRM_MODE_TYPE_BUILTIN) /* deprecated */
> @@ -1157,6 +1158,47 @@ struct drm_mode_destroy_dumb {
>  		DRM_MODE_ATOMIC_NONBLOCK |\
>  		DRM_MODE_ATOMIC_ALLOW_MODESET)
>  
> +#define DRM_MODE_ATOMIC_FAILURE_REASON \
> +	FAILURE_REASON(DRM_MODE_ATOMIC_CAP_NOT_ENABLED, "DRM_ATOMIC capability not enabled") \

Please don't add macros that expect other macros in the context. They
become very confusing. Just pass in the other macro to use. See MACRO__
in include/drm/intel/pciids.h for an example.

> +	FAILURE_REASON(DRM_MODE_ATOMIC_INVALID_FLAG, "invalid flag") \
> +	FAILURE_REASON(DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC, "Legacy DRM_MODE_PAGE_FLIP_ASYNC not to be used in atomic ioctl") \
> +	FAILURE_REASON(DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY, "requesting page-flip event with TEST_ONLY") \
> +	FAILURE_REASON(DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET, "Need full modeset on this crtc") \
> +	FAILURE_REASON(DRM_MODE_ATOMIC_NEED_FULL_MODESET, "Need full modeset on all the connected crtc's") \
> +	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_NOT_SUP_PLANE, "Async flip not supported on this plane") \
> +	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED, "Modifier not supported on this plane with async flip") \
> +	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED, "No property change allowed when async flip is enabled")
> +
> +#define FAILURE_REASON(flag, reason) flag,
> +typedef enum {
> +	DRM_MODE_ATOMIC_FAILURE_REASON
> +} drm_mode_atomic_failure_flag;
> +#undef FAILURE_REASON

This is a uapi header. Do we really want all of that macro trickery here
in the first place? What's wrong with just a plain enum? (Or macros.)

> +
> +#define FAILURE_REASON(flag, reason) #reason,
> +extern const char *drm_mode_atomic_failure_string[];
> +#undef FAILURE_REASON

Data is not an interface. Don't expose arrays like this. Who is even
going to know what its size is? Again, uapi header, where does it point,
what address space is it?

> +
> +/**
> + * drm_mode_atomic_err_code - struct to store the error code
> + *
> + * pointer to this struct will be stored in reserved variable of
> + * struct drm_mode_atomic to report the failure cause to the user.
> + *
> + * @failure_flags: error codes defined in drm_atomic_failure.failure_flag

Flags? As in a mask of multiple things? Is 64 going to be enough for
everyone, all conditions in all drivers?

OTOH, what's the promise wrt multiple reasons? Practically all drivers
bail out at the sight of first issue, and it's usually pretty much
meaningless to continue to figure out *other* reasons after that.

And this brings us to one of my main concerns on making this fly:

You bail out on the first thing, but you can't expect all drivers to
check stuff in the same order. It's not practical. So different drivers
will likely return different reasons for virtually the same
condition. So how is userspace going to handle that?

> + * @failure_string_ptr: pointer to user readable error message drm_mode_failure.failure_string

Is the string part of uapi, and can never change? Doesn't sound
great. What's wrong with just a plain enum?

> + * @failure_obj_ptr: pointer to the drm_object that caused error
> + * @reserved: reserved for future use
> + * @count_objs: count of drm_objects if multiple drm_objects caused error
> + */
> +struct drm_mode_atomic_err_code {
> +	__u64 failure_flags;
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
