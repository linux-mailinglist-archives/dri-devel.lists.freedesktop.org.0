Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84738ADF69
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 10:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67C11129A1;
	Tue, 23 Apr 2024 08:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBTvbE7w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC7B1131B5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 08:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713859565; x=1745395565;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1G2wfwFlzUQsBtBXl3QVOUc+WealeiEYe1NA+eUKk9w=;
 b=GBTvbE7wQRc21Y3OqM0TlLugeQk0gMfA0Ksqe5lFmfItBEEUwOqodlWK
 OvSrv8OY6/PFTFSBxoIHr2ZOW7I9sonsd51EA5YiJIr+0IvKD1biS9KJd
 8D97n73uPsUJLg4l5yNfzTHQBcRWaajIJPbGxuSNEmSimM26l8C500lme
 NiSRnegI86YqN8kwn5tNd0DEnuGZtpLPmnWynGcCIhrkHpN//vpbrHwu6
 sBz6W+k+rd4IrO9KhiMMlFLgeGArUem1+/4UnSYWleUHlT6yQ8/4x5lPN
 puRLMpCrBwfLy2r03w9h7i7hBqiYC/wx9Czr+m/tBKjX936wkI3Y0lq81 w==;
X-CSE-ConnectionGUID: wof96NCGRAme3c4Hvk3fRQ==
X-CSE-MsgGUID: z+nkRK2gRhWC7pGfmeTihg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9649881"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9649881"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 01:06:05 -0700
X-CSE-ConnectionGUID: 2pZv5y+bRdWiLyPwdQlQmg==
X-CSE-MsgGUID: PVL+lBr9SF6FJ1Vhx70a/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24736040"
Received: from fpirou-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.46.117])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 01:06:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, kernel test robot
 <lkp@intel.com>, soc@kernel.org
Subject: Re: [PATCH v3 07/13] drm: Make drivers depends on DRM_DW_HDMI
In-Reply-To: <ZidLFpREqwKd9FHK@finisterre.sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
 <20240327-kms-kconfig-helpers-v3-7-eafee11b84b3@kernel.org>
 <2c78772a-1d3f-47dd-9c3f-a3011703e1ab@sirena.org.uk>
 <ZidLFpREqwKd9FHK@finisterre.sirena.org.uk>
Date: Tue, 23 Apr 2024 11:05:58 +0300
Message-ID: <87le54sduh.fsf@intel.com>
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

On Tue, 23 Apr 2024, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Apr 02, 2024 at 04:43:46PM +0100, Mark Brown wrote:
>> On Wed, Mar 27, 2024 at 11:57:02AM +0100, Maxime Ripard wrote:
>> 
>> > DRM_DW_HDMI has a number of dependencies that might not be enabled.
>> > However, drivers were used to selecting it while not enforcing the
>> > DRM_DW_HDMI dependencies.
>> > 
>> > This could result in Kconfig warnings (and further build breakages) such
>> > as:
>> > 
>> >   Kconfig warnings: (for reference only)
>> >      WARNING: unmet direct dependencies detected for DRM_DW_HDMI
>> >      Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && DRM_BRIDGE [=y] && DRM_DISPLAY_HELPER [=n]
>> >      Selected by [m]:
>> >      - DRM_SUN8I_DW_HDMI [=m] && HAS_IOMEM [=y] && DRM_SUN4I [=m]
>
>> This has landed in -next and appears to be causing breakage for several
>> platforms using these devices.  For example I'm seeing the HDMI fail to
>> probe on sun50i-a64-pin64-plus with arm64 defconfig, the DT kselftest
>> result isn't terribly informative but it can be seen here:
>
> It has now been *three* weeks that this breakage has sat unaddressed in
> -next, this has been making my CI for -next unusable.  Given that
> getting the defconfig bits of this merged appears somwhow unreasonably
> difficult can we please drop these changes from the DRM tree until some
> strategy for getting everything merged is put into place?

This is what's being done [1].


BR,
Jani.


[1] https://lore.kernel.org/r/cover.1713780345.git.geert+renesas@glider.be


-- 
Jani Nikula, Intel
