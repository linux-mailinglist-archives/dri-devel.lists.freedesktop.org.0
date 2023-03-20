Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B64876C0EF7
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 11:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E17210E333;
	Mon, 20 Mar 2023 10:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8A310E333;
 Mon, 20 Mar 2023 10:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679308516; x=1710844516;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NMgVih2bb9ZIGrZ0tHJJKQ6aQUDZB3AYhIviYlKROhk=;
 b=bR+sXhTGyDshRP/jszlkmgPhl3rxk9rITkeIECl0ccz1z1qV1UoxnO0i
 Gvl9S7kba43KyLXcCuJlNTvOQn+BkJCzLw/5Z2At/62eZ0BQKDUCKI8f4
 GKQEWEsEzStUU50Cjs8Rb6AFy0WLoIEqKNGLwXms9MO0p3HO9Rb+/GAK1
 nM/WIIIHin3VjbAmjVuiBUPrEauOj4v2y5Jq0ERR28J8Iz8qRlByBYryW
 HHi8JMANQRXvtOL1fd+qxWs+TXXrSjYzelK0ezXcL53tpTIlapcR3asqt
 WpJgmZtdCt/0266d1nkQecxIOpvtpvVW7fqb6OMQ+idIcg09pjozGdJFG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="326998029"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="326998029"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 03:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="681029176"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="681029176"
Received: from mseifert-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.61.180])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 03:35:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] Revert "drm/i915/hwmon: Enable PL1 power limit"
In-Reply-To: <20230319140300.2892032-1-ashutosh.dixit@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230319140300.2892032-1-ashutosh.dixit@intel.com>
Date: Mon, 20 Mar 2023 12:35:07 +0200
Message-ID: <878rfraexw.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 19 Mar 2023, Ashutosh Dixit <ashutosh.dixit@intel.com> wrote:
> This reverts commit ee892ea83d99610fa33bea612de058e0955eec3a.
>
> 0349c41b0596 ("drm/i915/hwmon: Enable PL1 power limit") was reverted in
> 05d5562e401e ("Revert "drm/i915/hwmon: Enable PL1 power limit"") but has
> appeared again as ee892ea83d99 ("drm/i915/hwmon: Enable PL1 power
> limit"). Revert it again.

Thanks, applied to drm-intel-fixes with the commit message reduced to be
about this commit being picked up accidentally.

Sorry for the trouble.

BR,
Jani.

>
> Cc: <stable@vger.kernel.org> # v6.2+
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/8062
> Fixes: ee892ea83d99 ("drm/i915/hwmon: Enable PL1 power limit")
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_hwmon.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index ee63a8fd88fc1..596dd2c070106 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -688,11 +688,6 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>  		for_each_gt(gt, i915, i)
>  			hwm_energy(&hwmon->ddat_gt[i], &energy);
>  	}
> -
> -	/* Enable PL1 power limit */
> -	if (i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
> -		hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
> -						    PKG_PWR_LIM_1_EN, PKG_PWR_LIM_1_EN);
>  }
>  
>  void i915_hwmon_register(struct drm_i915_private *i915)

-- 
Jani Nikula, Intel Open Source Graphics Center
