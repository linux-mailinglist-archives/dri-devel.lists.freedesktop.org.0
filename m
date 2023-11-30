Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899A67FEB34
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 09:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3886910E122;
	Thu, 30 Nov 2023 08:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E2710E122;
 Thu, 30 Nov 2023 08:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701334347; x=1732870347;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=kOfX2UKfvYS4N6aEBG35lNvDQ8QT/RJ9RXUqbEoZd1M=;
 b=buUInluh5/fn2nK3PQ1AXIzKlgjTR/ZEs32VI1TzoXft+9LXHDhRT0ir
 +ILoe4lMkFq3IMQfoAxKl9RBSq12XeiSxBF4V+pJ66/mLyRAUAp3Hnvo4
 rw4rLCuWxNYKuNBsxXuYz6D1T5Vk5zeULCmHra3PByR4P2XHoqgL2HKEg
 1hUtvjLfm5LtpVqU/d8dFqsPQpu/OtWmaSJ9YoYjsFLES7lOCU6z953A3
 YecDP9vptvy2Sp6M5Fj2NQ0Ru9iyi5/KlyaWGcYTDX1fIVqoDSGDLfPPt
 zF+zTuqM/rJHiUMBwcoOL0AU8t6yPcNb36aEFKSrIW1NtOn1kBTOYiDiN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11997843"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="11997843"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 00:52:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="892747520"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="892747520"
Received: from nemelina-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.60.150])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 00:52:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, dri-devel@lists.freedesktop.org
Subject: Re: [RFC] drm: enable W=1 warnings by default across the subsystem
In-Reply-To: <72248f22-6337-487a-9979-a0d79e37a9ed@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231129181219.1237887-1-jani.nikula@intel.com>
 <72248f22-6337-487a-9979-a0d79e37a9ed@amd.com>
Date: Thu, 30 Nov 2023 10:52:17 +0200
Message-ID: <874jh362ta.fsf@intel.com>
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
Cc: Pan@freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 intel-gfx@lists.freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Nov 2023, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
> Cc: Nathan Chancellor <nathan@kernel.org>
>
> On 11/29/23 13:12, Jani Nikula wrote:
>> At least the i915 and amd drivers enable a bunch more compiler warnings
>> than the kernel defaults.
>>=20
>> Extend the W=3D1 warnings to the entire drm subsystem by default. Use the
>> copy-pasted warnings from scripts/Makefile.extrawarn with
>> s/KBUILD_CFLAGS/subdir-ccflags-y/ to make it easier to compare and keep
>> up with them in the future.
>>=20
>> This is similar to the approach currently used in i915.
>>=20
>> Some of the -Wextra warnings do need to be disabled, just like in
>> Makefile.extrawarn, but take care to not disable them for W=3D2 or W=3D3
>> builds, depending on the warning.
>
> I think this should go in after drm-misc-next has a clean build (for
> COMPILE_TEST builds) with this patch applied. Otherwise, it will break a
> lot of build configs.

Oh, I'm absolutely not suggesting this should be merged before known
warnings have been addressed one way or another. Either by fixing them
or by disabling said warning in driver local Makefiles, depending on the
case.

While I'm suggesting this, I obviously (I hope) can't take on fixing all
the warnings this exposes. One way to scale would be for folks to apply
this locally, see what it uncovers in their drivers, and fix some.

As an intermediate step we might also apply this to a topic branch in
drm-tip, so you'd see the warnings when building drm-tip, but not in
indidual branches or in anything that's merged upstream.

BR,
Jani.


>
>>=20
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
>> Cc: Karol Herbst <kherbst@redhat.com>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Cc: Sean Paul <sean@poorly.run>
>> Cc: Marijn Suijten <marijn.suijten@somainline.org>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>=20
>> ---
>>=20
>> With my admittedly limited and very much x86 focused kernel config, I
>> get some -Wunused-but-set-variable and -Wformat-truncation=3D warnings,
>> but nothing we can't handle.
>>=20
>> We could fix them up front, or disable the extra warnings on a per
>> driver basis with a FIXME comment in their respective Makefiles.
>>=20
>> With the experience from i915, I think this would significantly reduce
>> the constant loop of warnings added by people not using W=3D1 and
>> subsequently fixed by people using W=3D1.
>>=20
>> Note: I've Cc'd the maintainers of drm, drm misc and some of the biggest
>> drivers.
>> ---
>>   drivers/gpu/drm/Makefile | 27 +++++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index b4cb0835620a..6939e4ea13d5 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -5,6 +5,33 @@
>>=20=20=20
>>   CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+=3D -DDYNAMIC_DEBUG_MODULE
>>=20=20=20
>> +# Unconditionally enable W=3D1 warnings locally
>> +# --- begin copy-paste W=3D1 warnings from scripts/Makefile.extrawarn
>> +subdir-ccflags-y +=3D -Wextra -Wunused -Wno-unused-parameter
>> +subdir-ccflags-y +=3D -Wmissing-declarations
>> +subdir-ccflags-y +=3D $(call cc-option, -Wrestrict)
>> +subdir-ccflags-y +=3D -Wmissing-format-attribute
>> +subdir-ccflags-y +=3D -Wmissing-prototypes
>> +subdir-ccflags-y +=3D -Wold-style-definition
>> +subdir-ccflags-y +=3D -Wmissing-include-dirs
>> +subdir-ccflags-y +=3D $(call cc-option, -Wunused-but-set-variable)
>> +subdir-ccflags-y +=3D $(call cc-option, -Wunused-const-variable)
>> +subdir-ccflags-y +=3D $(call cc-option, -Wpacked-not-aligned)
>> +subdir-ccflags-y +=3D $(call cc-option, -Wformat-overflow)
>> +subdir-ccflags-y +=3D $(call cc-option, -Wformat-truncation)
>> +subdir-ccflags-y +=3D $(call cc-option, -Wstringop-overflow)
>> +subdir-ccflags-y +=3D $(call cc-option, -Wstringop-truncation)
>> +# The following turn off the warnings enabled by -Wextra
>> +ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
>> +subdir-ccflags-y +=3D -Wno-missing-field-initializers
>> +subdir-ccflags-y +=3D -Wno-type-limits
>> +subdir-ccflags-y +=3D -Wno-shift-negative-value
>> +endif
>> +ifeq ($(findstring 3, $(KBUILD_EXTRA_WARN)),)
>> +subdir-ccflags-y +=3D -Wno-sign-compare
>> +endif
>> +# --- end copy-paste
>> +
>>   drm-y :=3D \
>>   	drm_aperture.o \
>>   	drm_atomic.o \

--=20
Jani Nikula, Intel
