Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEE288FE22
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 12:34:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B52D1120C0;
	Thu, 28 Mar 2024 11:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yd69XgQC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D46010FF2D;
 Thu, 28 Mar 2024 11:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711625647; x=1743161647;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=eBy42X35pJreeO0yYa4HjMU6RLBU89fmPu6IVcsQXa4=;
 b=Yd69XgQCgHNADQiqP8MkFqumlxehwR2w89jdZw8mYC74P3QyZmTpyBzl
 WrAs8qwUAKMJfP5dw+I8L/RYqSjIwBNcvf/koIFyCAoLvKKjoY1gjJLW1
 RVqs6dwBI1xhklFlXouiHYtFWK/wmnpxXMV2Lez5aaFT4K0dVHZx8Xu1u
 zkzMqCtdo0WvW09HvAr22gsofos1N58KAOrYWdLTbehyMc6aG1TNhMizt
 Y6WwsRtzLWlEnrzna9Q0BK4+/xNWByuys2/i9xHq8PTGzjAxR657qyCdL
 K+8f/VNqOJY1wg9iGuW2jMDJ5p5pZUkK/QAixXYUfilaRQg19m2EkxF+B A==;
X-CSE-ConnectionGUID: Db/nJsGZSBGXUz075c2qJw==
X-CSE-MsgGUID: BvNglSicR1me2xEp0+LJtw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="32175438"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="32175438"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 04:34:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="21344061"
Received: from abdulqaf-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.57.138])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 04:33:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
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
In-Reply-To: <20240327163331.GB1153323@dev-arch.thelio-3990X>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1709629403.git.jani.nikula@intel.com>
 <afe5ed943414f7ec3044c1547503b9941686a867.1709629403.git.jani.nikula@intel.com>
 <20240326225650.GA2784736@dev-arch.thelio-3990X>
 <20240327-cherubic-steel-tiger-e1c36a@houat> <87a5mkgl6i.fsf@intel.com>
 <20240327163331.GB1153323@dev-arch.thelio-3990X>
Date: Thu, 28 Mar 2024 13:33:53 +0200
Message-ID: <87il16fv4u.fsf@intel.com>
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

On Wed, 27 Mar 2024, Nathan Chancellor <nathan@kernel.org> wrote:
> On Wed, Mar 27, 2024 at 09:59:01AM +0200, Jani Nikula wrote:
>> An alternative would be to "depends on !COMPILE_TEST" that we have in
>> i915, but then some folks want to have COMPILE_TEST in drm, because some
>> drivers are otherwise hard for people to build.
>
> Right. I think it is unfortunate how (at least in my opinion)
> CONFIG_COMPILE_TEST has two meanings: genuinely just compile testing or
> "allmodconfig". For the first case, we would want CONFIG_DRM_WERROR=y
> but for the second case, it would be nice for CONFIG_DRM_WERROR to
> default to off (because CONFIG_WERROR is enabled) but allow developers
> to turn it on explicitly.

Yes, CONFIG_COMPILE_TEST has become overloaded.

> Another lofty/wistful idea to solve this would be to implement something
> similar to compiler diagnostic groups for Kconfig, where there would be
> a hierarchy like
>
>   CONFIG_WERROR
>     CONFIG_DRM_WERROR
>     CONFIG_SUBSYSTEM_A_WERROR
>     CONFIG_SUBSYSTEM_B_WERROR
>
> where the value of CONFIG_WERROR is the same value for all
> subconfigurations under it but they could still be enabled individually
> without any additional dependencies (ala something like '-Wno-unused
> -Wunused-variable'), which would allow my use case of CONFIG_WERROR=n
> removing all instances of -Werror to continue to work but allow other
> developers and CI systems to just set their specific -Werror
> configuration and be done with it. I don't think something like that
> exists but maybe I don't know Kconfig as well as I think I do :)

Yet another idea is to have a way to mark a config option "manual", that
is, never enable this automatically under any circumstances, not in make
allyesconfig or allmodconfig, don't ask in make oldconfig, don't allow
selects. The only way to enable is to toggle it manually. If you want it
and enable it and see problems, it's on you.

CONFIG_WERROR and CONFIG_DRM_WERROR could both be like this. The problem
with them is that they're not so much different configurations, they are
about how to deal with build errors, and that's not really what, say,
make allyesconfig should be about.

BR,
Jani.


-- 
Jani Nikula, Intel
