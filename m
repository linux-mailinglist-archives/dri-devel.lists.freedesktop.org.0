Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8936D7BB597
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 12:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591F510E0CD;
	Fri,  6 Oct 2023 10:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4020B10E0CA;
 Fri,  6 Oct 2023 10:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696589206; x=1728125206;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5GA9UukmP7IwztBZson5QcfsXojL/8JJ7BPLbDPEPPY=;
 b=iwGkIRRd3i540j5fCt3c4+bvUdohxX6xhOhCx5HVDdIJqKdQJpln3u++
 HfySPr6ChRbQYk3F0COCB3qsGjlHwAn/vkM4JUbhhkrXfOrcpEoKzUGi0
 NSHwWdO8yKh8TFUHicHLSmGmbEC/vmD39OfDbPYr9HqkOIwd+7Ez9fzG8
 1fVWu6shdRhhk+8aRlM7ysfBnztHBonD+thDjKON8QrIcN5PGCxVZC2/k
 5CtjHJBRL753FWbAdcaC61GwMrh6ZPTHEJsVfklCE+cq+wBDlHaYhPLDy
 52shX6toLQLC+ZxpfwhRW+eFsg/rAqFVkfHQJoCrOn8Qiapz4UrS9nsRH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="447914375"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="447914375"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:46:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="728804348"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="728804348"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga006.jf.intel.com with SMTP; 06 Oct 2023 03:46:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 06 Oct 2023 13:46:41 +0300
Date: Fri, 6 Oct 2023 13:46:41 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915: Remove early/pre-production
 Haswell code
Message-ID: <ZR_lkR7naHjjuc99@intel.com>
References: <20231006083103.660153-1-tvrtko.ursulin@linux.intel.com>
 <20231006083103.660153-2-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231006083103.660153-2-tvrtko.ursulin@linux.intel.com>
X-Patchwork-Hint: comment
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 06, 2023 at 09:31:01AM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> It is not our policy to keep pre-production hardware support for this long
> so I guess this one was just forgotten.

This is about detecting pre-prod hw, not supporting it. I think keeping
the detection forever is a good idea since otherwise we may end up
mistakenly debugging pre-prod hw without even realizing it.

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_driver.c | 1 -
>  drivers/gpu/drm/i915/i915_drv.h    | 2 --
>  2 files changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index ccbb2834cde0..78a42c8a8509 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -175,7 +175,6 @@ static void intel_detect_preproduction_hw(struct drm_i915_private *dev_priv)
>  {
>  	bool pre = false;
>  
> -	pre |= IS_HASWELL_EARLY_SDV(dev_priv);
>  	pre |= IS_SKYLAKE(dev_priv) && INTEL_REVID(dev_priv) < 0x6;
>  	pre |= IS_BROXTON(dev_priv) && INTEL_REVID(dev_priv) < 0xA;
>  	pre |= IS_KABYLAKE(dev_priv) && INTEL_REVID(dev_priv) < 0x1;
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index cb60fc9cf873..9d493ff1685a 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -590,8 +590,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  	IS_SUBPLATFORM(i915, INTEL_ALDERLAKE_P, INTEL_SUBPLATFORM_RPL)
>  #define IS_RAPTORLAKE_U(i915) \
>  	IS_SUBPLATFORM(i915, INTEL_ALDERLAKE_P, INTEL_SUBPLATFORM_RPLU)
> -#define IS_HASWELL_EARLY_SDV(i915) (IS_HASWELL(i915) && \
> -				    (INTEL_DEVID(i915) & 0xFF00) == 0x0C00)
>  #define IS_BROADWELL_ULT(i915) \
>  	IS_SUBPLATFORM(i915, INTEL_BROADWELL, INTEL_SUBPLATFORM_ULT)
>  #define IS_BROADWELL_ULX(i915) \
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
