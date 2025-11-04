Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D54C31089
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 13:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E1910E5CF;
	Tue,  4 Nov 2025 12:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hF1kd7O/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C680910E439
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 12:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762260228; x=1793796228;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=n2d0/3HYLnXf51mdXTNEiBLSgRi2I+wmqZKijUfYWjc=;
 b=hF1kd7O/GBALCOxp8Tb+OcqZhcOKddZJcDUp7xOHiqtFOUZXptiaddVI
 E46j8qZFCzJXBJ7YchHpquOqg6IpyeZqai6/+pG+B+iQxC2ZFgLctoOdq
 kpuQqLaj7ci0j4tfIRom+QG52g6IVWFSwTrhUu1aMqOKIJAXPqIbDyHjN
 IRz9SEWIHIzn2dBIMg9+hsYENJ+bAMTlhcwVZOUY4SXoELwHafshcb58+
 vk+xzjTzj/vHum67tvWi5uo13ePemMElBOMEDGsNSWAifDoKa0Mq+h49w
 zpNWxx0T5oejeXTCKBbYvYBcHyAvyRV8HfdrmWOecuJI5OLr/IQR1d3xm A==;
X-CSE-ConnectionGUID: nIymHn6lQh2GKu504VKfGw==
X-CSE-MsgGUID: h8ELBk7FRA2QFJaNqYoarg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75703497"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="75703497"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 04:43:47 -0800
X-CSE-ConnectionGUID: SZlbESd8SfSoluiF6Larsw==
X-CSE-MsgGUID: AZ19a2g4SISA5I0pcHhXLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="186826865"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.182])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 04:43:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/hyperv: include drm_print.h where needed
In-Reply-To: <71ba68da-2154-47dd-8a14-a4d35a5242a1@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251104100253.646577-1-jani.nikula@intel.com>
 <71ba68da-2154-47dd-8a14-a4d35a5242a1@suse.de>
Date: Tue, 04 Nov 2025 14:43:43 +0200
Message-ID: <7ac724fa3313cce334cdd04aca1696be6b7eac65@intel.com>
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

On Tue, 04 Nov 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 04.11.25 um 11:02 schrieb Jani Nikula:
>> hyperv_drm_drv.c and hyperv_drm_modeset.c depend on drm_print.h being
>> indirectly included via drm_buddy.h, drm_mm.h, or
>> ttm/ttm_resource.h. Include drm_print.h explicitly.
>>
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Closes: https://lore.kernel.org/r/20251104101158.1cc9abcd@canb.auug.org.au
>> Fixes: f6e8dc9edf96 ("drm: include drm_print.h where needed")
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks, pushed to drm-misc-next.

BR,
Jani.

>
>> ---
>>   drivers/gpu/drm/hyperv/hyperv_drm_drv.c     | 1 +
>>   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>> index 0d49f168a919..06b5d96e6eaf 100644
>> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>> @@ -14,6 +14,7 @@
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_fbdev_shmem.h>
>>   #include <drm/drm_gem_shmem_helper.h>
>> +#include <drm/drm_print.h>
>>   #include <drm/drm_simple_kms_helper.h>
>>   
>>   #include "hyperv_drm.h"
>> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
>> index 6e6eb1c12a68..7978f8c8108c 100644
>> --- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
>> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
>> @@ -19,6 +19,7 @@
>>   #include <drm/drm_probe_helper.h>
>>   #include <drm/drm_panic.h>
>>   #include <drm/drm_plane.h>
>> +#include <drm/drm_print.h>
>>   #include <drm/drm_vblank.h>
>>   #include <drm/drm_vblank_helper.h>
>>   

-- 
Jani Nikula, Intel
