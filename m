Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A2B7BBFDD
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 21:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C399A10E565;
	Fri,  6 Oct 2023 19:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6F510E564;
 Fri,  6 Oct 2023 19:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696621875; x=1728157875;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OFLEl7Y+E7KCaKgUuW1hZcyCSBfFhL0D4OpiEJqxY8g=;
 b=hpYvOwtDPzqAAyiK7D7P/YDBjL1YAMp6Wzdt4TVc12iDy+DCr6FZLAl3
 OZ9lfvNR3tpHXrNgrFjawCKscvQ9M6LJJPIhicl8n+mHUXMGBjPmg+0+k
 xraQfY41duiEusD9XPwp4TyASZVPujvaBqK/p5V24hZHGWG03IrSa6S/A
 peuyD1FGcopwK9D81cL9JqYd0nG3ntazrb0HWconGR+wbhskIGi06KEP1
 GokDkp+w/YFPnCQJ6M4nHYXA2C3cgDDSqut1u2DKJoqzhEQQ2g+shJz43
 kFoFl0RZGYfYVmUTl0Efj6eiujlt3tq0JrPznWP+rZtyABKe5cTMUtv5w g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="382687079"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="382687079"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 12:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="702152356"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="702152356"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.31.15])
 ([10.213.31.15])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 12:51:12 -0700
Message-ID: <1543b945-fd0c-42da-8739-3558b98cb4ec@intel.com>
Date: Fri, 6 Oct 2023 21:51:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915: Remove xehpsdv support
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20231006083103.660153-1-tvrtko.ursulin@linux.intel.com>
 <20231006083103.660153-4-tvrtko.ursulin@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231006083103.660153-4-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06.10.2023 10:31, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> XeHP SDV was a pre-production hardware used to bring up ATS and was not
> generally available. Since latter was since explicitly added, there is no
> need to keep the code for the former around.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gsc.c         | 15 ----
>   drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 16 ----
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  1 -
>   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 20 ++---
>   drivers/gpu/drm/i915/gt/intel_mocs.c        | 31 -------
>   drivers/gpu/drm/i915/gt/intel_rps.c         |  4 +-
>   drivers/gpu/drm/i915/gt/intel_workarounds.c | 95 ---------------------
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c       |  4 -
>   drivers/gpu/drm/i915/i915_drv.h             |  4 -
>   drivers/gpu/drm/i915/i915_hwmon.c           |  6 --
>   drivers/gpu/drm/i915/i915_pci.c             | 17 ----
>   drivers/gpu/drm/i915/i915_perf.c            |  4 +-
>   drivers/gpu/drm/i915/i915_reg.h             |  1 -
>   drivers/gpu/drm/i915/intel_clock_gating.c   | 10 ---
>   drivers/gpu/drm/i915/intel_device_info.c    |  1 -
>   drivers/gpu/drm/i915/intel_device_info.h    |  1 -
>   drivers/gpu/drm/i915/intel_step.c           | 10 ---
>   17 files changed, 8 insertions(+), 232 deletions(-)

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

