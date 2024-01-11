Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C6582AB23
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 10:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2360510E878;
	Thu, 11 Jan 2024 09:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E98310E878;
 Thu, 11 Jan 2024 09:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704966233; x=1736502233;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=hYpwhw2ORAnQPU+cW+nYE2dd6gHgxE/HcMepJMGkY9w=;
 b=Pbp5s7Ay1k0DbgTgh9FxdC/hGhndTwFiVFqw/Po4XtqO1GgdvU6U78kf
 bx4N16DFmjyez4ED7GRVu4cGGKDJ56hqdGykH8+Ejpv0S+Ssm1mUmOgtJ
 o+ceZLrsbi0RdQzn6txQxmIKdwT6lQULstBO4voohJUkZ4IVUFf/DcjdI
 Q5UurX5BwK4FzsK0/nWC+Nz3xXHcAg7w/IRx0EyZNfyTBxyBSoqM3qn0U
 SZWSz9xzxKDI5WMrJ68YeZD0FynIt68BP8m4Wnh/SCmZBBd/y3B8v41V2
 VcjsK/w5kL6ObU/MiNzkRV/dts6giyxkK+fDAyQIDfUJPPnPDkfPEN9SR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5880068"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="5880068"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 01:43:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="901495120"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="901495120"
Received: from gaertgee-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.206])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 01:43:44 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/6] drm: enable (most) W=1 warnings by default across
 the subsystem
In-Reply-To: <5c4d7bfa-a1d2-42bb-a304-5a796a5d26fe@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1704908087.git.jani.nikula@intel.com>
 <1291306bedfd6297d4bf0fca5daa5bac46dde1ad.1704908087.git.jani.nikula@intel.com>
 <5c4d7bfa-a1d2-42bb-a304-5a796a5d26fe@amd.com>
Date: Thu, 11 Jan 2024 11:43:42 +0200
Message-ID: <87h6jkurw1.fsf@intel.com>
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
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Thomas Zimmermann <tzimmermann@suse.de>, Karol Herbst <kherbst@redhat.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org,
 Xinhui <Xinhui.Pan@amd.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Danilo Krummrich <dakr@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Jan 2024, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
> On 1/10/24 12:39, Jani Nikula wrote:
>> At least the i915 and amd drivers enable a bunch more compiler warnings
>> than the kernel defaults.
>>=20
>> Extend most of the W=3D1 warnings to the entire drm subsystem by
>> default. Use the copy-pasted warnings from scripts/Makefile.extrawarn
>> with s/KBUILD_CFLAGS/subdir-ccflags-y/ to make it easier to compare and
>> keep up with them in the future.
>>=20
>> This is similar to the approach currently used in i915.
>>=20
>> Some of the -Wextra warnings do need to be disabled, just like in
>> Makefile.extrawarn, but take care to not disable them for W=3D2 or W=3D3
>> builds, depending on the warning.
>>=20
>> There are too many -Wformat-truncation warnings to cleanly fix up front;
>> leave that warning disabled for now.
>>=20
>> v2:
>> - Drop -Wformat-truncation (too many warnings)
>> - Drop -Wstringop-overflow (enabled by default upstream)
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
>> Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
>> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   drivers/gpu/drm/Makefile | 27 +++++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 104b42df2e95..8b6be830f7c3 100644
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
>
> It would be safer to do something along the lines of:
>
> cond-flags :=3D $(call cc-option, -Wrestrict) \
> 	$(call cc-option, -Wunused-but-set-variable) \
> 	$(call cc-option, -Wunused-const-variable) \
> 	$(call cc-option, -Wunused-const-variable) \
> 	$(call cc-option, -Wformat-overflow) \
> 	$(call cc-option, -Wstringop-truncation)
> subdir-ccflags-y +=3D $(cond-flags)
>
> Otherwise, you will end up breaking `$ make M=3Ddrivers/gpu/drm`
> for a bunch of people.

I discussed this with Alex on IRC yesterday. The above seems obviously
correct in that it just changes the evaluation time of $(call cc-option,
...). Apparently not having it may lead to:

scripts/Makefile.lib:10: *** Recursive variable 'KBUILD_CFLAGS' references =
itself (eventually).  Stop.

Of course, I could just throw that in and be happy, but me being me, I'd
really like to know what is going on here first. :)

For one thing, I always thought M=3Ddir was only for out-of-tree modules,
though the IRC discussion seems to indicate a lot of people also use it
for in-tree modules. But I can't even make it to work for a lot of cases
on top of current drm-tip, without the changes here.

M=3Ddrivers/gpu/drm/i915 fails immediately. So does
M=3Ddrivers/gpu/drm/amd. And M=3Ddrivers/gpu/drm/nouveau. And
M=3Ddrivers/gpu/drm/radeon.

M=3Ddrivers/gpu/drm fails with the same cases as above. I always use
KBUILD_OUTPUT=3Ddir but I don't know if it makes a difference, I didn't
try.

However M=3Ddrivers/gpu/drm/amd/amdgpu works.

The only way I could reproduce the "recursive variable" issue in that
was using:

subdir-ccflags-y =3D -Wextra

instead of:

subdir-ccflags-y :=3D -Wextra

or:

subdir-ccflags-y +=3D -Wextra

in amdgpu/Makefile

Since I use the latter form in this pach, I think it should be fine for
M=3Ddir users even if M=3Ddir doesn't really seem to generally work for
in-tree modules (at least not for me).

Cc: Masahiro


BR,
Jani.


>
>> +subdir-ccflags-y +=3D -Wmissing-format-attribute
>> +subdir-ccflags-y +=3D -Wmissing-prototypes
>> +subdir-ccflags-y +=3D -Wold-style-definition
>> +subdir-ccflags-y +=3D -Wmissing-include-dirs
>> +subdir-ccflags-y +=3D $(call cc-option, -Wunused-but-set-variable)
>> +subdir-ccflags-y +=3D $(call cc-option, -Wunused-const-variable)
>> +subdir-ccflags-y +=3D $(call cc-option, -Wpacked-not-aligned)
>> +subdir-ccflags-y +=3D $(call cc-option, -Wformat-overflow)
>> +# FIXME: fix -Wformat-truncation warnings and uncomment
>> +#subdir-ccflags-y +=3D $(call cc-option, -Wformat-truncation)
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
