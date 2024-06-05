Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F078FCD61
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 14:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D8910E7AD;
	Wed,  5 Jun 2024 12:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VZavyBA0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA01F10E7AB;
 Wed,  5 Jun 2024 12:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717591293; x=1749127293;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tWQjC85soaAJGSGucvbbpKV8JVdZAx4uBgUfZGKI1g8=;
 b=VZavyBA0LdMi9dHHU/suunmbhr1+W1DE0+lqRb3lcqfd0BoMwc9e9INM
 JFQxWJty+SZzf9oGIT1tVfHFrRNcaCrVXvNhz/l8xwolEsPDCtP5LuQAj
 v5oqdCSJaGdTs4vD+q0Q0wpwiJTvD6DtuG5/Hf6CIrqDI3pY1D/qHP5KY
 mYeJeQnkqq/I853juOhxtfjI5L2KyYZvN4He6S7zAAJOq/kKwsd/gbb1U
 D80eNtmKdX9gYEnVLq9n+Wt5bINXsRXchLWWjDnGh/waT3U/SrWYncxNY
 pBxavcSHMaOW7V/5rukR9m323xKUVq1I7QHY1mwhZSBg/5laSRwXlqfIN w==;
X-CSE-ConnectionGUID: fmx09KyuQs+vqpau/G5z3A==
X-CSE-MsgGUID: YKdC16f4Q2Gt4iqLE3jDjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14377802"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="14377802"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 05:41:32 -0700
X-CSE-ConnectionGUID: g8cZwf0HTHisSKVkTDtLFw==
X-CSE-MsgGUID: zkGBCyDaTVChO1WO3y9E9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="37569708"
Received: from sbutnari-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.204])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 05:41:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6n?=
 =?utf-8?Q?ig?=
 <christian.koenig@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH 3/3] drm/amdgpu: drop redundant W=1 warnings from Makefile
In-Reply-To: <c7dffe59c8abe6beaef70ea1f726a6598c9dad77.1716471145.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1716471145.git.jani.nikula@intel.com>
 <c7dffe59c8abe6beaef70ea1f726a6598c9dad77.1716471145.git.jani.nikula@intel.com>
Date: Wed, 05 Jun 2024 15:41:23 +0300
Message-ID: <87msnzblzg.fsf@intel.com>
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

On Thu, 23 May 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Since commit a61ddb4393ad ("drm: enable (most) W=1 warnings by default
> across the subsystem"), most of the extra warnings in the driver
> Makefile are redundant. Remove them.
>
> Note that -Wmissing-declarations and -Wmissing-prototypes are always
> enabled by default in scripts/Makefile.extrawarn.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Alex, this one's for you to do whatever you want. ;)

BR,
Jani.


> ---
>  drivers/gpu/drm/amd/amdgpu/Makefile | 18 +-----------------
>  1 file changed, 1 insertion(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
> index 1f6b56ec99f6..9508d0b5708e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -39,23 +39,7 @@ ccflags-y := -I$(FULL_AMD_PATH)/include/asic_reg \
>  	-I$(FULL_AMD_DISPLAY_PATH)/amdgpu_dm \
>  	-I$(FULL_AMD_PATH)/amdkfd
>  
> -subdir-ccflags-y := -Wextra
> -subdir-ccflags-y += -Wunused
> -subdir-ccflags-y += -Wmissing-prototypes
> -subdir-ccflags-y += -Wmissing-declarations
> -subdir-ccflags-y += -Wmissing-include-dirs
> -subdir-ccflags-y += -Wold-style-definition
> -subdir-ccflags-y += -Wmissing-format-attribute
> -# Need this to avoid recursive variable evaluation issues
> -cond-flags := $(call cc-option, -Wunused-but-set-variable) \
> -	$(call cc-option, -Wunused-const-variable) \
> -	$(call cc-option, -Wstringop-truncation) \
> -	$(call cc-option, -Wpacked-not-aligned)
> -subdir-ccflags-y += $(cond-flags)
> -subdir-ccflags-y += -Wno-unused-parameter
> -subdir-ccflags-y += -Wno-type-limits
> -subdir-ccflags-y += -Wno-sign-compare
> -subdir-ccflags-y += -Wno-missing-field-initializers
> +# Locally disable W=1 warnings enabled in drm subsystem Makefile
>  subdir-ccflags-y += -Wno-override-init
>  subdir-ccflags-$(CONFIG_DRM_AMDGPU_WERROR) += -Werror

-- 
Jani Nikula, Intel
