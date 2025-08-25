Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6EBB33B60
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 11:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E79B10E40D;
	Mon, 25 Aug 2025 09:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3myDykN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C33A10E40D;
 Mon, 25 Aug 2025 09:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756115048; x=1787651048;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=AXL4TsQTS3cMXdmorgcmeisMbtbYH9ixpITz28maV/E=;
 b=B3myDykNX8TyrKyjkG+oO6Bu2TD2FpxwVUJvpjhODvBu63r4WpmPJxwy
 6rhqEX/xtMiGYtvwc+EeWa0JEGYFrClPGQofjC+f50a0t0+dcWetXcEea
 g/L9W79T+/hZL4zvQJOCJIBx1XaXrZeQcNr9TfMMLR+CHvqtXEgPdj+50
 tub9biP5amGwNO0OspWzHbOhmBY7cBo9iL5MxaEuo18sFcDJndvCa6tCz
 sNnKbx2FtsgJ5SxmE2v66Bpl5yVabvajggn+YddytqPWr2Cfe1vRvKe37
 OcWwVi++e3GYSNGBW+o6Q0wR5YbOfCOKIprTG6BN43fKqN5l83NVFEE0s w==;
X-CSE-ConnectionGUID: CGVbNq2jTF+KhRHPpGrikw==
X-CSE-MsgGUID: pg8DGxBtRMqTgAzv5DFRyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="61965804"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61965804"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 02:44:08 -0700
X-CSE-ConnectionGUID: 0RThKte8QbGBRXmiX0U4jw==
X-CSE-MsgGUID: tecA1ad6TwyOv6ogzg1Oeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="174560782"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.15])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 02:44:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, naveen1.kumar@intel.com,
 xaver.hugl@kde.org, uma.shankar@intel.com, harry.wentland@amd.com
Subject: Re: [PATCH v3 1/4] drm: Define user readable error codes for atomic
 ioctl
In-Reply-To: <12e88f43-98eb-43aa-931c-edac88d650aa@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
 <20250822-atomic-v3-1-13a0e8f2c581@intel.com>
 <8f24c0051cab99aa5f399dc3b6eb6dd2fb1e8b6c@intel.com>
 <12e88f43-98eb-43aa-931c-edac88d650aa@intel.com>
Date: Mon, 25 Aug 2025 12:44:00 +0300
Message-ID: <419591dda7158b3d56c40aac0df86ca499202676@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
> On 22-08-2025 16:07, Jani Nikula wrote:
>> On Fri, 22 Aug 2025, Arun R Murthy <arun.r.murthy@intel.com> wrote:
>>> There can be multiple reasons for a failure in atomic_ioctl. Most often
>>> in these error conditions -EINVAL is returned. User/Compositor would
>>> have to blindly take a call on failure of this ioctl so as to use
>>> ALLOW_MODESET or any. It would be good if user/compositor gets a
>>> readable error code on failure so they can take proper corrections in
>>> the next commit.
>>> The struct drm_mode_atomic is being passed by the user/compositor which
>>> holds the properties for modeset/flip. Reusing the same struct for
>>> returning the error code in case of failure can save by creating a new
>>> uapi/interface for returning the error code.
>>> The element 'reserved' in the struct drm_mode_atomic is used for
>>> returning the user readable error code. This points to the struct
>>> drm_mode_atomic_err_code. Failure reasons have been initialized in
>>> DRM_MODE_ATOMIC_FAILURE_REASON.
>> At the moment, I'm not (yet) convinced any of this will work, even as a
>> concept.
> km_flip test in IGT has been run and is working fine with these patch=20
> series. Also
> the existing kms_atomic test with atomic_invalid_test has been modified to
> test this error code(https://patchwork.freedesktop.org/series/153330/)
>
> Am I missing anything over here?

Having a few tests in IGT does not mean a non-trivial userspace
(compositor) can use the information in a useful way.

>> Even so, I'll comment on some of the choices in the series.
>>
>>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>>> ---
>>>   include/uapi/drm/drm_mode.h | 42 ++++++++++++++++++++++++++++++++++++=
++++++
>>>   1 file changed, 42 insertions(+)
>>>
>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>>> index a122bea2559387576150236e3a88f99c24ad3138..f0986a3fe9a7d61e57e9a9a=
5ec01a604343f6930 100644
>>> --- a/include/uapi/drm/drm_mode.h
>>> +++ b/include/uapi/drm/drm_mode.h
>>> @@ -45,6 +45,7 @@ extern "C" {
>>>   #define DRM_CONNECTOR_NAME_LEN	32
>>>   #define DRM_DISPLAY_MODE_LEN	32
>>>   #define DRM_PROP_NAME_LEN	32
>>> +#define DRM_MODE_ATOMIC_FAILURE_STRING_LEN	64
>>>=20=20=20
>>>   #define DRM_MODE_TYPE_BUILTIN	(1<<0) /* deprecated */
>>>   #define DRM_MODE_TYPE_CLOCK_C	((1<<1) | DRM_MODE_TYPE_BUILTIN) /* dep=
recated */
>>> @@ -1157,6 +1158,47 @@ struct drm_mode_destroy_dumb {
>>>   		DRM_MODE_ATOMIC_NONBLOCK |\
>>>   		DRM_MODE_ATOMIC_ALLOW_MODESET)
>>>=20=20=20
>>> +#define DRM_MODE_ATOMIC_FAILURE_REASON \
>>> +	FAILURE_REASON(DRM_MODE_ATOMIC_CAP_NOT_ENABLED, "DRM_ATOMIC capabilit=
y not enabled") \
>> Please don't add macros that expect other macros in the context. They
>> become very confusing. Just pass in the other macro to use. See MACRO__
>> in include/drm/intel/pciids.h for an example.
> Here we are mapping an error_code defined as enum with a corresponding=20
> string
> using the X macros.
>
> Anyway will have a look at the macro in include/drm/intel/pciids.h
>
>
>>> +	FAILURE_REASON(DRM_MODE_ATOMIC_INVALID_FLAG, "invalid flag") \
>>> +	FAILURE_REASON(DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC, "Legacy DRM_MODE_PAGE=
_FLIP_ASYNC not to be used in atomic ioctl") \
>>> +	FAILURE_REASON(DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY, "requesting=
 page-flip event with TEST_ONLY") \
>>> +	FAILURE_REASON(DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET, "Need full mod=
eset on this crtc") \
>>> +	FAILURE_REASON(DRM_MODE_ATOMIC_NEED_FULL_MODESET, "Need full modeset =
on all the connected crtc's") \
>>> +	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_NOT_SUP_PLANE, "Async flip not s=
upported on this plane") \
>>> +	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED, "Modifie=
r not supported on this plane with async flip") \
>>> +	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED, "No property chang=
e allowed when async flip is enabled")
>>> +
>>> +#define FAILURE_REASON(flag, reason) flag,
>>> +typedef enum {
>>> +	DRM_MODE_ATOMIC_FAILURE_REASON
>>> +} drm_mode_atomic_failure_flag;
>>> +#undef FAILURE_REASON
>> This is a uapi header. Do we really want all of that macro trickery here
>> in the first place? What's wrong with just a plain enum? (Or macros.)
> This is defined as enum. We have two separate list one for enum and
> other for error message(string) but=C2=A0 upon user adding a new
> element/error_code in the enum, there can be a possibility of missing
> adding the error string. So have linked enum with the corresponding
> error message/string so both are at a single place and upon adding new
> entry will be easy for the user.

I think the overall point is this:

a) If the messages are fixed for each enum, there is no point in passing
   that message across the ioctl. Userspace can map the enums and
   messages directly.

b) If the messages are not fixed, I see no point in having the above
   fixed messages at all.

c) If the messages are not fixed, but you want to have default messages,
   the messages do not belong in the uapi header at all. Hide them in
   the kernel.

>>> +
>>> +#define FAILURE_REASON(flag, reason) #reason,
>>> +extern const char *drm_mode_atomic_failure_string[];
>>> +#undef FAILURE_REASON
>> Data is not an interface. Don't expose arrays like this. Who is even
>> going to know what its size is? Again, uapi header, where does it point,
>> what address space is it?
>>
> Sorry missed adding documentation for this. Will add in my next series.

Documentation does not fix the issue that data is not an interface.

>>> +
>>> +/**
>>> + * drm_mode_atomic_err_code - struct to store the error code
>>> + *
>>> + * pointer to this struct will be stored in reserved variable of
>>> + * struct drm_mode_atomic to report the failure cause to the user.
>>> + *
>>> + * @failure_flags: error codes defined in drm_atomic_failure.failure_f=
lag
>> Flags? As in a mask of multiple things? Is 64 going to be enough for
>> everyone, all conditions in all drivers?
> Should be more that sufficient, this is an enum.

Then don't call it "flags".

>> OTOH, what's the promise wrt multiple reasons? Practically all drivers
>> bail out at the sight of first issue, and it's usually pretty much
>> meaningless to continue to figure out *other* reasons after that.
>>
>> And this brings us to one of my main concerns on making this fly:
>>
>> You bail out on the first thing, but you can't expect all drivers to
>> check stuff in the same order. It's not practical. So different drivers
>> will likely return different reasons for virtually the same
>> condition. So how is userspace going to handle that?
> Most of the error check is in the drm-core and these are common across
> the drivers.  Upon drivers sending driver specific error code, the
> compositor may not be able to handle the error code. But in cases
> required compositor changes can be added so as to handle them. In
> general the generic error conditions that are met by compositor and
> for which compositor can take corrective measurements are listed down
> first.

I think we're going to need a handful of error codes for starters, along
with compositor changes that make meaningful and benefitial usage of the
error codes.

>>> + * @failure_string_ptr: pointer to user readable error message drm_mod=
e_failure.failure_string
>> Is the string part of uapi, and can never change? Doesn't sound
>> great. What's wrong with just a plain enum?
> enum is sufficient enough and this string is added so that this error=20
> message
>
> can be printed out in the compositor logs for the user.
>
> Thanks and Regards,
> Arun R Murthy
> -------------------
>
>>> + * @failure_obj_ptr: pointer to the drm_object that caused error
>>> + * @reserved: reserved for future use
>>> + * @count_objs: count of drm_objects if multiple drm_objects caused er=
ror
>>> + */
>>> +struct drm_mode_atomic_err_code {
>>> +	__u64 failure_flags;
>>> +	__u64 failure_objs_ptr;
>>> +	__u64 reserved;
>>> +	__u32 count_objs;
>>> +	char failure_string[DRM_MODE_ATOMIC_FAILURE_STRING_LEN];
>>> +};
>>> +
>>>   struct drm_mode_atomic {
>>>   	__u32 flags;
>>>   	__u32 count_objs;

--=20
Jani Nikula, Intel
