Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D25078BCA3D
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 11:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3548110FF45;
	Mon,  6 May 2024 09:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FwpagwlI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCAE10ED42;
 Mon,  6 May 2024 09:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714986412; x=1746522412;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cFwir4zc/nudwwhXcuiOwVfdum1PITTVnDd2nBJu8Qc=;
 b=FwpagwlIU1gYJMRynCb4vfFpMIzltg+VfPVyhmCZQP8b6/fVt/AvNw3n
 /cSbtZ+DeLIzkCdvyGbLqGh4kHBRbJn2L+fRQFDLx0asf8mQ/pcHF3z7R
 7ebfVGwPJk0fQGiLaUoOBX9I6dAsoF4+ZW4N0y52KJhKbH7A2U5V9zqcT
 H+FIQnS98/6iJhmRB2CePFJE/5T8DdLzFDlNmPYZMyj7KK6rOfqKCn0ww
 SaH33uKFoqwTLYfKEjEq8kS2lx6aqj0rSUtLsHLjT5vIeGDzsjh7W4179
 zk0ELYXDxLmkQzeejvNBwd850uOb74qUxOkpYX0pKXnRyxVaOMKx8tktE g==;
X-CSE-ConnectionGUID: TrEM8vnVT1isB2OtNTkzdQ==
X-CSE-MsgGUID: l7ZNanHuRnyKjOZ/kA5b1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14537048"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="14537048"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 02:06:51 -0700
X-CSE-ConnectionGUID: mJuLiGEIQAO84nD63Rj0+g==
X-CSE-MsgGUID: flJcUyFrSjOZAUPRd6GL3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="28208688"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.230])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 02:06:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Easwar Hariharan
 <eahariha@linux.microsoft.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Zhenyu
 Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>, "open
 list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, "open list:INTEL DRM DISPLAY FOR XE AND
 I915 DRIVERS" <intel-xe@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:INTEL GVT-g DRIVERS (Intel GPU
 Virtualization)" <intel-gvt-dev@lists.freedesktop.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, "open list:RADEON and AMDGPU DRM
 DRIVERS" <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, "open list:I2C
 SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, "open list:BTTV
 VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>, "open list:FRAMEBUFFER
 LAYER" <linux-fbdev@vger.kernel.org>, Zhi Wang <zhiwang@kernel.org>
Subject: Re: [PATCH v2 03/12] drm/i915: Make I2C terminology more inclusive
In-Reply-To: <ZjVTqNGjaAjuLdLi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
 <20240503181333.2336999-4-eahariha@linux.microsoft.com>
 <ZjU8NB-71xWI2X73@intel.com>
 <4f1e429c-794b-457c-ab1d-85eb97dc81c3@linux.microsoft.com>
 <ZjVTqNGjaAjuLdLi@intel.com>
Date: Mon, 06 May 2024 12:06:41 +0300
Message-ID: <87seyvnwbi.fsf@intel.com>
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

On Fri, 03 May 2024, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Fri, May 03, 2024 at 02:04:15PM -0700, Easwar Hariharan wrote:
>> On 5/3/2024 12:34 PM, Rodrigo Vivi wrote:
>> > On Fri, May 03, 2024 at 06:13:24PM +0000, Easwar Hariharan wrote:
>> >> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
>> >> with more appropriate terms. Inspired by and following on to Wolfram's
>> >> series to fix drivers/i2c/[1], fix the terminology for users of
>> >> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
>> >> in the specification.
>> >>
>> >> Compile tested, no functionality changes intended
>> >>
>> >> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
>> >>
>> >> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> >> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > 
>> > It looks like the ack is not needed since we are merging this through
>> > drm-intel-next. But I'm planing to merge this only after seeing the
>> > main drivers/i2c accepting the new terminology. So we don't have a
>> > risk of that getting push back and new names there and we having
>> > to rename it once again.
>> 
>> Just to be explicit, did you want me to remove the Acked-by in v3, or will you when you pull
>> the patch into drm-intel-next?
>> 
>> > 
>> > (more below)
>> > 
>> >> Acked-by: Zhi Wang <zhiwang@kernel.org>
>> >> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>> > 
>> > Cc: Jani Nikula <jani.nikula@intel.com>
>> > 
>> > Jani, what bits were you concerned that were not necessarily i2c?
>> > I believe although not necessarily/directly i2c, I believe they
>> > are related and could benefit from the massive single shot renable.
>> > or do you have any better split to suggest here?
>> > 
>> > (more below)
>> > 
>> >> ---
>> >>  drivers/gpu/drm/i915/display/dvo_ch7017.c     | 14 ++++-----
>> >>  drivers/gpu/drm/i915/display/dvo_ch7xxx.c     | 18 +++++------
>> >>  drivers/gpu/drm/i915/display/dvo_ivch.c       | 16 +++++-----
>> >>  drivers/gpu/drm/i915/display/dvo_ns2501.c     | 18 +++++------
>> >>  drivers/gpu/drm/i915/display/dvo_sil164.c     | 18 +++++------
>> >>  drivers/gpu/drm/i915/display/dvo_tfp410.c     | 18 +++++------
>> >>  drivers/gpu/drm/i915/display/intel_bios.c     | 22 +++++++-------
>> >>  drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +-
>> >>  .../gpu/drm/i915/display/intel_display_core.h |  2 +-
>> >>  drivers/gpu/drm/i915/display/intel_dsi.h      |  2 +-
>> >>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c  | 20 ++++++-------
>> >>  drivers/gpu/drm/i915/display/intel_dvo.c      | 14 ++++-----
>> >>  drivers/gpu/drm/i915/display/intel_dvo_dev.h  |  2 +-
>> >>  drivers/gpu/drm/i915/display/intel_gmbus.c    |  4 +--
>> >>  drivers/gpu/drm/i915/display/intel_sdvo.c     | 30 +++++++++----------
>> >>  drivers/gpu/drm/i915/display/intel_vbt_defs.h |  4 +--
>> >>  drivers/gpu/drm/i915/gvt/edid.c               | 28 ++++++++---------
>> >>  drivers/gpu/drm/i915/gvt/edid.h               |  4 +--
>> >>  drivers/gpu/drm/i915/gvt/opregion.c           |  2 +-
>> >>  19 files changed, 119 insertions(+), 119 deletions(-)
>> >>
>> 
>> <snip>
>> 
>> >> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
>> >> index c17462b4c2ac..64db211148a8 100644
>> >> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> >> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>> >> @@ -4332,7 +4332,7 @@ static int intel_ddi_compute_config_late(struct intel_encoder *encoder,
>> >>  									connector->tile_group->id);
>> >>  
>> >>  	/*
>> >> -	 * EDP Transcoders cannot be ensalved
>> >> +	 * EDP Transcoders cannot be slaves
>> > 
>> >                                      ^ here
>> > perhaps you meant 'targeted' ?
>> > 
>> >>  	 * make them a master always when present
>> 
>> <snip>
>> 
>> This is not actually I2C related as far as I could tell when I was making the change, so this was more of a typo fix.
>> 
>> If we want to improve this, a quick check with the eDP v1.5a spec suggests using primary/secondary instead,
>> though in a global fashion rather than specifically for eDP transcoders. There is also source/sink terminology
>> in the spec related to DP encoders.
>> 
>> Which would be a more acceptable change here?
>
> hmmm probably better to split the patches and align with the spec naming where it applies.
> and with i2c name where it applies.

Yeah this one is completely unrelated to i2c and aux, and what the eDP
spec says is irrelevant here. This should follow Intel hw specs.

BR,
Jani.



-- 
Jani Nikula, Intel
