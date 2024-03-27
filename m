Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8956188D84B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 09:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD21810F910;
	Wed, 27 Mar 2024 08:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kk/lQS6b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1649A10F910;
 Wed, 27 Mar 2024 08:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711526479; x=1743062479;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GucQb4cLBgLnk1QG1F+L4Qynfl5w2SWCeBiPx1JgM5s=;
 b=kk/lQS6b+2azRqEv1dq49LpZXL4EgjnxTV3x7FFp1KFgOpmWvh7uzx7D
 88Ccu2WIk1epHEwo8fH0k5Nx5zkgluXF6c59v/zQO31JL68v1vH0C+LcQ
 2FvfrOmzfwqqTZlQL079KxcODQweXDHaKDgb6XNz/wKZyopxTkcSLK77m
 DWQxouJqmjqeputYTCbHKRvcg3OEcB6QJpEVr6aQRriN/CQkPLGL7cGn0
 PDHQjRDzDarGHi+l2IrX4G5LfRBZNDr0m588Uz5k+kuGajS+D7B/jI9E5
 BDGyzHO9ZCzD2Y2f8yecwgrU/RX1NeJFuPiOIQdfiI0uY56MapDY5lvo/ A==;
X-CSE-ConnectionGUID: h+JdJgi1QNuiEYPaO4/lVQ==
X-CSE-MsgGUID: LYDdeH7BRWCCxlfKwD9QjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6725555"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6725555"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 00:59:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16863269"
Received: from mmazilu-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.43])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 00:59:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Maxime Ripard <mripard@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@redhat.com>, Rob Clark <robdclark@gmail.com>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Sui Jingfeng
 <sui.jingfeng@linux.dev>, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [RESEND v3 2/2] drm: Add CONFIG_DRM_WERROR
In-Reply-To: <20240327-cherubic-steel-tiger-e1c36a@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1709629403.git.jani.nikula@intel.com>
 <afe5ed943414f7ec3044c1547503b9941686a867.1709629403.git.jani.nikula@intel.com>
 <20240326225650.GA2784736@dev-arch.thelio-3990X>
 <20240327-cherubic-steel-tiger-e1c36a@houat>
Date: Wed, 27 Mar 2024 09:59:01 +0200
Message-ID: <87a5mkgl6i.fsf@intel.com>
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

On Wed, 27 Mar 2024, Maxime Ripard <mripard@kernel.org> wrote:
> Hi,
>
> On Tue, Mar 26, 2024 at 03:56:50PM -0700, Nathan Chancellor wrote:
>> On Tue, Mar 05, 2024 at 11:07:36AM +0200, Jani Nikula wrote:
>> > Add kconfig to enable -Werror subsystem wide. This is useful for
>> > development and CI to keep the subsystem warning free, while avoiding
>> > issues outside of the subsystem that kernel wide CONFIG_WERROR=y might
>> > hit.
>> > 
>> > v2: Don't depend on COMPILE_TEST
>> > 
>> > Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com> # v1
>> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> > ---
>> >  drivers/gpu/drm/Kconfig  | 13 +++++++++++++
>> >  drivers/gpu/drm/Makefile |  3 +++
>> >  2 files changed, 16 insertions(+)
>> > 
>> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> > index 6e853acf15da..c08e18108c2a 100644
>> > --- a/drivers/gpu/drm/Kconfig
>> > +++ b/drivers/gpu/drm/Kconfig
>> > @@ -416,3 +416,16 @@ config DRM_LIB_RANDOM
>> >  config DRM_PRIVACY_SCREEN
>> >  	bool
>> >  	default n
>> > +
>> > +config DRM_WERROR
>> > +	bool "Compile the drm subsystem with warnings as errors"
>> > +	depends on EXPERT
>> > +	default n
>> > +	help
>> > +	  A kernel build should not cause any compiler warnings, and this
>> > +	  enables the '-Werror' flag to enforce that rule in the drm subsystem.
>> > +
>> > +	  The drm subsystem enables more warnings than the kernel default, so
>> > +	  this config option is disabled by default.
>> > +
>> > +	  If in doubt, say N.
>> 
>> While I understand the desire for an easy switch that maintainers and
>> developers can use to ensure that their changes are warning free for the
>> drm subsystem specifically, I think subsystem specific configuration
>> options like this are actively detrimental to developers and continuous
>> integration systems that build test the entire kernel. For example, we
>> turned off CONFIG_WERROR for our Hexagon builds because of warnings that
>> appear with -Wextra that are legitimate but require treewide changes to
>> resolve in a manner sufficient for Linus:
>> 
>> https://github.com/ClangBuiltLinux/linux/issues/1285
>> https://lore.kernel.org/all/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
>> https://lore.kernel.org/all/20230522105049.1467313-1-schnelle@linux.ibm.com/
>> 
>> But now, due to CONFIG_DRM_WERROR getting enabled by all{mod,yes}config
>> and -Wextra being unconditionally enabled for DRM, those warnings hard
>> break the build despite CONFIG_WERROR=n...
>
> Would making DRM_WERROR depends on WERROR address your concerns?

But then what would be the point of having DRM_WERROR at all? For me the
point is, "werror in drm, ignore the rest, they're someone else's
problem".

An alternative would be to "depends on !COMPILE_TEST" that we have in
i915, but then some folks want to have COMPILE_TEST in drm, because some
drivers are otherwise hard for people to build.

Nathan, we do want to fix any issues switfly. Are you hitting specific
build problems?


BR,
Jani.



>
> Maxime

-- 
Jani Nikula, Intel
