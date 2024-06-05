Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3A98FCD11
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 14:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E367110E340;
	Wed,  5 Jun 2024 12:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ehSnSHzm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4225F10E5DB;
 Wed,  5 Jun 2024 12:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717590976; x=1749126976;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+YclYx0u1dt3KvnTUzDYgRHDIhFjiX1Hok5YG51qfsE=;
 b=ehSnSHzmHhJYU90LYsI4FydDDsLllI9n2hTduAhi7grjoCeHasNoUMdU
 U6Oig/jpkWUvnjpz8sbvy9ZFTLwxD2gxRgdV0U9eJ/9b74HwoEg4LhEoP
 e7lhIXUIAbPKRPJDRGhfa3AXnbHX0+ryVXaMlO5NqTVKMpsYtxj3400t8
 QbyK4kVw47Z5mYPRuAkLyqWioVF4QcF0oYmus+BhJvNvKuROSir+pDmRr
 20XdCJzzv6h10I6HTznfI3MjbNwJF49Fknjm6BYnyCEUw9hSsC5SxkE7g
 FQj4RcPFi4kAqb4qgNM0+EZ3LXhfqOyH478Rsoxihh7cycCwNYSlXikRH w==;
X-CSE-ConnectionGUID: l3pTT1kVSmWTLlIYv5ZhAg==
X-CSE-MsgGUID: 8Uxl6ttVQpyIJY03AO+2EQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14377308"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="14377308"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 05:36:15 -0700
X-CSE-ConnectionGUID: Lx6z27YWT7OSx6GJGc5JZg==
X-CSE-MsgGUID: 4BlE4sM/RKqGf9fTKsM1oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="37683913"
Received: from sbutnari-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.204])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 05:36:11 -0700
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
Subject: Re: [PATCH 1/3] drm/i915: drop redundant W=1 warnings from Makefile
In-Reply-To: <490931748fa9a1dbac2bceda0c4b778240b10b58.1716471145.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1716471145.git.jani.nikula@intel.com>
 <490931748fa9a1dbac2bceda0c4b778240b10b58.1716471145.git.jani.nikula@intel.com>
Date: Wed, 05 Jun 2024 15:36:06 +0300
Message-ID: <87sexrbm89.fsf@intel.com>
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

Pushed this patch to drm-intel-next with Lucas' irc ack.

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/Makefile | 25 +------------------------
>  1 file changed, 1 insertion(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 7cad944b825c..a70d95a8fd7a 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -3,31 +3,8 @@
>  # Makefile for the drm device driver.  This driver provides support for the
>  # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
>  
> -# Unconditionally enable W=1 warnings locally
> -# --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
> -subdir-ccflags-y += -Wextra -Wunused -Wno-unused-parameter
> -subdir-ccflags-y += -Wmissing-declarations
> -subdir-ccflags-y += $(call cc-option, -Wrestrict)
> -subdir-ccflags-y += -Wmissing-format-attribute
> -subdir-ccflags-y += -Wmissing-prototypes
> -subdir-ccflags-y += -Wold-style-definition
> -subdir-ccflags-y += -Wmissing-include-dirs
> -subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
> -subdir-ccflags-y += $(call cc-option, -Wunused-const-variable)
> -subdir-ccflags-y += $(call cc-option, -Wpacked-not-aligned)
> -subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
> +# Enable W=1 warnings not enabled in drm subsystem Makefile
>  subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
> -subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
> -# The following turn off the warnings enabled by -Wextra
> -ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
> -subdir-ccflags-y += -Wno-missing-field-initializers
> -subdir-ccflags-y += -Wno-type-limits
> -subdir-ccflags-y += -Wno-shift-negative-value
> -endif
> -ifeq ($(findstring 3, $(KBUILD_EXTRA_WARN)),)
> -subdir-ccflags-y += -Wno-sign-compare
> -endif
> -# --- end copy-paste
>  
>  # Enable -Werror in CI and development
>  subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror

-- 
Jani Nikula, Intel
