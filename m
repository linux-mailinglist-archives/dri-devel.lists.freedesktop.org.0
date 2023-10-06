Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A517BBFD7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 21:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A59E10E556;
	Fri,  6 Oct 2023 19:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0B410E561;
 Fri,  6 Oct 2023 19:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696621779; x=1728157779;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yiDAlPrhtpCnpd2t7sdBP955q+zYb36AoPl06/5VppQ=;
 b=Wl/z+yXCfh9m3WgsUiQ3YWHAohkwrIfqlDcbvWk/s9u6tJhMjNY5cVug
 q53851uRwkRFKOeu4Qxi/qjigspInblF00oH9JunTZHCRVHqaiOp4njls
 tXeTJ5WnE3KmYIuBlQZdRxbTk0t09KdsaY2n6iPY7aRoQbM0jPuXzTlH1
 K0hVzCYKOsgjQUNHWlnOLOnHF+O+sQmWekzdo79ruD9W0DZ6lYFZfbaOR
 fPlxoxsAfdujFokZd5GteHH6j0I1ynu2fHJ7klyOjZgPBIfU/382+lqs0
 MzlYaTObl6jbUK/hASB2pGLeP8YVlTxXuxpgF3yGgNKoL0ACi4onDtSU/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="382686848"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="382686848"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 12:49:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="702151829"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="702151829"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.31.15])
 ([10.213.31.15])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 12:49:36 -0700
Message-ID: <5cebbf0f-54f2-4e08-bc48-2f9e5347b750@intel.com>
Date: Fri, 6 Oct 2023 21:49:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915: Remove early/pre-production
 Haswell code
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20231006083103.660153-1-tvrtko.ursulin@linux.intel.com>
 <20231006083103.660153-2-tvrtko.ursulin@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231006083103.660153-2-tvrtko.ursulin@linux.intel.com>
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
> It is not our policy to keep pre-production hardware support for this long
> so I guess this one was just forgotten.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/i915_driver.c | 1 -
>   drivers/gpu/drm/i915/i915_drv.h    | 2 --
>   2 files changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index ccbb2834cde0..78a42c8a8509 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -175,7 +175,6 @@ static void intel_detect_preproduction_hw(struct drm_i915_private *dev_priv)
>   {
>   	bool pre = false;
>   
> -	pre |= IS_HASWELL_EARLY_SDV(dev_priv);
>   	pre |= IS_SKYLAKE(dev_priv) && INTEL_REVID(dev_priv) < 0x6;
>   	pre |= IS_BROXTON(dev_priv) && INTEL_REVID(dev_priv) < 0xA;
>   	pre |= IS_KABYLAKE(dev_priv) && INTEL_REVID(dev_priv) < 0x1;
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index cb60fc9cf873..9d493ff1685a 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -590,8 +590,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>   	IS_SUBPLATFORM(i915, INTEL_ALDERLAKE_P, INTEL_SUBPLATFORM_RPL)
>   #define IS_RAPTORLAKE_U(i915) \
>   	IS_SUBPLATFORM(i915, INTEL_ALDERLAKE_P, INTEL_SUBPLATFORM_RPLU)
> -#define IS_HASWELL_EARLY_SDV(i915) (IS_HASWELL(i915) && \
> -				    (INTEL_DEVID(i915) & 0xFF00) == 0x0C00)
>   #define IS_BROADWELL_ULT(i915) \
>   	IS_SUBPLATFORM(i915, INTEL_BROADWELL, INTEL_SUBPLATFORM_ULT)
>   #define IS_BROADWELL_ULX(i915) \

