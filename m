Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B38DD8FCD54
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 14:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986CB10E77F;
	Wed,  5 Jun 2024 12:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/ZIqWNl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB64910E77F;
 Wed,  5 Jun 2024 12:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717591211; x=1749127211;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=YAJJrWwl4fEUOKRvq0Kg7pjzpX3qFQrGjEKU3u2/VuE=;
 b=m/ZIqWNlUu7Z/pQiDHAx0KSY0oFDJYMILG+zMv/Pyx80kZd7zRcImEEp
 zJMBfLUwOtdi+MjGMT3kizlN7V/kim+7HClkMReE3F9TwLuWtfwqt/BGT
 gmUA/UIbABfbvsk6pRd+wd5kGWeIpIPg5/+8cAMjbTsWSiv9dh7KKZvxO
 wXtLo8CXv30yNkKv1impInDLI6wtwzRmBy4O8b5KBtO2/lAWU0MS1LFjj
 XyeIn/yHb0mNXC4G9c1O2V95BdhLG5gs62QwPMfA6GJq0LThgoawZBGxw
 8hGb77UlhOFNMmTH4bqrUfPXTvr27F6QA2pivvZ82YnSIsTDGZ1uGiK7b w==;
X-CSE-ConnectionGUID: JWavs4ANQUm0lRSnpblJYw==
X-CSE-MsgGUID: nYeZkBzuQzWgO4oULtEk4g==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="24826446"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="24826446"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 05:40:10 -0700
X-CSE-ConnectionGUID: HVDNGhWAQJCFu2GvZtlIDw==
X-CSE-MsgGUID: M2h9MauQScSGM30EsjTIDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="37471375"
Received: from sbutnari-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.204])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 05:40:06 -0700
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
Subject: Re: [PATCH 2/3] drm/xe: drop redundant W=1 warnings from Makefile
In-Reply-To: <958a67adcbb64d3a387d2a07d83b05d71176e938.1716471145.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1716471145.git.jani.nikula@intel.com>
 <958a67adcbb64d3a387d2a07d83b05d71176e938.1716471145.git.jani.nikula@intel.com>
Date: Wed, 05 Jun 2024 15:40:01 +0300
Message-ID: <87plsvbm1q.fsf@intel.com>
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

Pushed this patch to drm-xe-next with Lucas' irc ack.

BR,
Jani.


> ---
>  drivers/gpu/drm/xe/Makefile | 25 +------------------------
>  1 file changed, 1 insertion(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index c9f067b8f54d..f4366cb958be 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
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
>  subdir-ccflags-$(CONFIG_DRM_XE_WERROR) += -Werror

-- 
Jani Nikula, Intel
