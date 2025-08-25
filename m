Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B11B33B7C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 11:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7475C10E41A;
	Mon, 25 Aug 2025 09:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FxiRWT+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EC210E36D;
 Mon, 25 Aug 2025 09:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756115252; x=1787651252;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=C+pGhj+NG3itKRpGqPrmJzfKs8DQLu7RcU6xA1Y5fmM=;
 b=FxiRWT+ESuDLnqkKdxT5RlKuyNkF/yHemJMQdjUtBzKf+rcSg1eyph2y
 ksp9taQIGi2piVAiRzr8ixDbUyKhQ4ecA8J7JSUlTnOrN/a5acCIfNSa0
 KqZBhW4KjGQKF+kMbw//v7PY80WDQ+gywXQ5gUdbdNtC6HWTsNziNuKmH
 JwYo6d7RQHQRVpnt4C4JzBA0GM7N9I8qiFcTC90g3MDX9++TvEkL/QzNf
 FwSjNPOPIHTytbL1LgmKe/iWedlp2xhYNXKXH9l8u1YWyDQL6afvWMNxY
 4+Y+hJMWy0bidpf4MwdwCf4bdzdfWL9DFsb2tQ/h59U1vwfvh1vth7cUg Q==;
X-CSE-ConnectionGUID: BL9q8NAlRYy4nXmz+ouYOg==
X-CSE-MsgGUID: ONYuOxbQQUeoMEWjuwvM+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62151664"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62151664"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 02:47:29 -0700
X-CSE-ConnectionGUID: Xk5XwEpzRImnkpej4iLJOA==
X-CSE-MsgGUID: fZhrP0WsSpGsIgkUFmKPIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="192913671"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.15])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 02:47:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, Xaver Hugl <xaver.hugl@kde.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, naveen1.kumar@intel.com,
 uma.shankar@intel.com, harry.wentland@amd.com
Subject: Re: [PATCH v3 1/4] drm: Define user readable error codes for atomic
 ioctl
In-Reply-To: <3d0136ee-fa1d-40ff-8304-da4d7432b1f1@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
 <20250822-atomic-v3-1-13a0e8f2c581@intel.com>
 <CAFZQkGwqgo7FavPQecKgwaZ1DcXccY9urRzcfocg+Srd4P9WPA@mail.gmail.com>
 <3d0136ee-fa1d-40ff-8304-da4d7432b1f1@intel.com>
Date: Mon, 25 Aug 2025 12:47:18 +0300
Message-ID: <141904c898c16c8c3b03b48ba2809b5046ed9f0a@intel.com>
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

On Sat, 23 Aug 2025, "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
> On 22-08-2025 21:44, Xaver Hugl wrote:
>>> +#define DRM_MODE_ATOMIC_FAILURE_REASON \
>>> +       FAILURE_REASON(DRM_MODE_ATOMIC_CAP_NOT_ENABLED, "DRM_ATOMIC capability not enabled") \
>>> +       FAILURE_REASON(DRM_MODE_ATOMIC_INVALID_FLAG, "invalid flag") \
>>> +       FAILURE_REASON(DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC, "Legacy DRM_MODE_PAGE_FLIP_ASYNC not to be used in atomic ioctl") \
>>> +       FAILURE_REASON(DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY, "requesting page-flip event with TEST_ONLY") \
>>> +       FAILURE_REASON(DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET, "Need full modeset on this crtc") \
>>> +       FAILURE_REASON(DRM_MODE_ATOMIC_NEED_FULL_MODESET, "Need full modeset on all the connected crtc's") \
>>> +       FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_NOT_SUP_PLANE, "Async flip not supported on this plane") \
>>> +       FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED, "Modifier not supported on this plane with async flip") \
>>> +       FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED, "No property change allowed when async flip is enabled")
>> As mentioned before, some of these errors are a bit too specific. We
>> don't need to have an enum value for every way the API can be used
>> wrongly - CAP_NOT_ENABLED, INVALID_FLAG, PAGE_FLIP_ASYNC and
>> MODIFIER_NOT_SUPPORTED should all just be one enum value for "invalid
>> API usage".
>> In general, there should only be enum values that the compositor
>> implementation can actually use on end-user systems. For further
>> information when debugging a broken compositor implementation, other
>> tools can be used instead, like drm debug logging or the returned
>> string.
> I have considered your comment in the last series and have removed 
> driver specific errors.
> Anyway will have a look again on this and will get back.
>>> +#define FAILURE_REASON(flag, reason) flag,
>>> +typedef enum {
>>> +       DRM_MODE_ATOMIC_FAILURE_REASON
>>> +} drm_mode_atomic_failure_flag;
>>> +#undef FAILURE_REASON
>>> +
>>> +#define FAILURE_REASON(flag, reason) #reason,
>>> +extern const char *drm_mode_atomic_failure_string[];
>>> +#undef FAILURE_REASON
>> The intention for the string wasn't for the enum values to be paired
>> with a description of the enum - that belongs into documentation, not
>> uAPI.
>>
>> The idea behind it was that drivers could add driver-specific
>> information in the string for compositors to log (only in commits
>> where failure isn't normally expected), so we have an easier time
>> debugging issues a user system experienced by looking at the
>> compositor logs. Sending the enum value again in string form isn't
>> useful.
>
> We are not sending enum value in string. Its just a single place where 
> we have both enum and string. Upon user adding new error codes if both 
> enum and string are at a single place it would be easy for the user. 
> Hence adding both in a single place using X macros.
>
> Its not mandatory to have a string for every enum, the string can be 
> left empty if not required, or later in the driver user can overwrite 
> the string as well.

See my reply [1] about fixed vs. non-fixed error messages.

I believe Xaver is also saying we don't want the fixed error messages,
and especially not in a uapi header.

BR,
Jani.


[1] https://lore.kernel.org/r/419591dda7158b3d56c40aac0df86ca499202676@intel.com

-- 
Jani Nikula, Intel
