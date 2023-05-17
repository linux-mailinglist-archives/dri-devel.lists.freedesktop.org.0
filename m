Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1828570641D
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 11:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10AB210E3D4;
	Wed, 17 May 2023 09:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9123A10E3D3;
 Wed, 17 May 2023 09:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684315713; x=1715851713;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=nKgzkfcVAPljUT2zjEKTschQjkA+e905vgG7hjXcyGc=;
 b=Cpd5aTXT9bewqKtkj+4JKPGwJyk9pM0vD5LrE/meobrM+EIjyvN4BOs9
 nqx75NmYehAcHa8x8FX3fmY3xU05Dc5cCDCpPSIReAhWoJNe7sIp/8TWv
 vuSV9RLVL6CcfP+Cuy/1A7h/8KmIyG1wqqJ8qobj9hDMpbDnFzP/5Zyjt
 p1ir2dQ4tU0iPPY6g/RG/GldnY755bWtcLyBCSCzJ0PYBac+7ri9D+xWN
 7x5O0RmyDpIDRvYNoIIGVCDHEYKCvJcyrVQAIs5zb9t7uMRJTm+441YNv
 8jlaYbyNdHWxVxcZBYqgdaML9zKvlQqaJF7mIoOCy6ubpQeZwJU3xaLqU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="350546064"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="350546064"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 02:28:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="825894450"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="825894450"
Received: from pakurapo-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.50.207])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 02:28:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] drm/i915: constify pointers to hwmon_channel_info
In-Reply-To: <20230511175446.282041-1-krzysztof.kozlowski@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230511175446.282041-1-krzysztof.kozlowski@linaro.org>
Date: Wed, 17 May 2023 12:28:14 +0300
Message-ID: <87cz2zgvdd.fsf@intel.com>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 May 2023, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> Statically allocated array of pointers to hwmon_channel_info can be made
> const for safety.
>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

FYI we'll merge this once we've done a backmerge to get the hwmon
changes to our tree.

BR,
Jani.


> ---
>  drivers/gpu/drm/i915/i915_hwmon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 8e7dccc8d3a0..e99e8c97ef01 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -267,7 +267,7 @@ static const struct attribute_group *hwm_groups[] = {
>  	NULL
>  };
>  
> -static const struct hwmon_channel_info *hwm_info[] = {
> +static const struct hwmon_channel_info * const hwm_info[] = {
>  	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
>  	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
> @@ -275,7 +275,7 @@ static const struct hwmon_channel_info *hwm_info[] = {
>  	NULL
>  };
>  
> -static const struct hwmon_channel_info *hwm_gt_info[] = {
> +static const struct hwmon_channel_info * const hwm_gt_info[] = {
>  	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
>  	NULL
>  };

-- 
Jani Nikula, Intel Open Source Graphics Center
