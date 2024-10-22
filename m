Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 636FA9A9FF1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 12:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C162B10E1F0;
	Tue, 22 Oct 2024 10:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UAluNbN2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7D010E1E8;
 Tue, 22 Oct 2024 10:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729592803; x=1761128803;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=dn0FBzBRx9lboTaX1S21Vok/7qVGkRCjltGLvmzzM4E=;
 b=UAluNbN2znGh3im/R19cJS9ZbqPXiDXNRzr7TSiTZDW3lUCZmAut48EB
 MEjKhCElkVCRUeWjs2efb1Fgqq0Jk/TRw7Hzo4LTlklkCN8H2jW0U++Qi
 IVp7ZbmbVTQlJkDNB2fe9SpsCwkzPTLMJ03INyrnVvidH71dKhlJNvOf5
 c2PDr+MOoTYMy5i9Kt1kpevM7bysZDUGUC8aRq9f2PHYa/PlcWiLSkbmZ
 y1yue+dHFxaUHS1tSzYtZQ15CXVtiwwJIgB8CUA3pknoCjdBHQv6pSG8p
 nSlxQKbT5+CAo6izAWD8w14FpOEr0Uw1uaaEAYcK8NYQVHxme24dehHW5 g==;
X-CSE-ConnectionGUID: TAoTLhoCSr+ZXolOshKtjA==
X-CSE-MsgGUID: 95njbUD8Q3akzxYZhuFRBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29058654"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29058654"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 03:26:42 -0700
X-CSE-ConnectionGUID: cvFXmd5iSwiZjYvLVrZDdQ==
X-CSE-MsgGUID: qKHIyJ5VT8CQBjR0175XHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="79895167"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.4])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 03:26:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: R Sundar <prosunofficial@gmail.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imre.deak@intel.com, ville.syrjala@linux.intel.com, R Sundar
 <prosunofficial@gmail.com>, kernel test robot <lkp@intel.com>, Julia
 Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH linux-next] drm/i915/dp: use string choice helpers
In-Reply-To: <20241007174857.85061-1-prosunofficial@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241007174857.85061-1-prosunofficial@gmail.com>
Date: Tue, 22 Oct 2024 13:26:35 +0300
Message-ID: <87r088v3fo.fsf@intel.com>
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

On Mon, 07 Oct 2024, R Sundar <prosunofficial@gmail.com> wrote:
> Use str_on_off string helpers for better readability and to fix cocci
> warning.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/r/202410071252.cWILJzrH-lkp@intel.com/
> Signed-off-by: R Sundar <prosunofficial@gmail.com>

Pushed to drm-intel-next, thanks for the patch.

BR,
Jani.

> ---
>
> Reported in linux repo:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>
> cocci warnings: (new ones prefixed by >>)
>>> drivers/gpu/drm/i915/display/intel_dp.c:2243:6-9: opportunity for str_on_off(dsc)
>
> vim +2243 drivers/gpu/drm/i915/display/intel_dp.c
>
> compile tested only.
>
>  drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index fbb096be02ad..733619b14193 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2475,7 +2475,7 @@ intel_dp_compute_config_link_bpp_limits(struct intel_dp *intel_dp,
>  		    encoder->base.base.id, encoder->base.name,
>  		    crtc->base.base.id, crtc->base.name,
>  		    adjusted_mode->crtc_clock,
> -		    dsc ? "on" : "off",
> +		    str_on_off(dsc),
>  		    limits->max_lane_count,
>  		    limits->max_rate,
>  		    limits->pipe.max_bpp,

-- 
Jani Nikula, Intel
