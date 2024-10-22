Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C3A9A9FF4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 12:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A0D10E303;
	Tue, 22 Oct 2024 10:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZH+mEtuK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EAC10E300;
 Tue, 22 Oct 2024 10:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729592823; x=1761128823;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9FZ5ssmarZf/O4MWtFd4ckA+07hvM1UbBGqTaa/fvBs=;
 b=ZH+mEtuKXzDBMsy0wtOOG+CjIv0jp3M3LCwOD3EYHEp8yNEmgcvkMxSs
 rAYhxEKttAnXI8JZOp59s1BsEmQaJCmRNgrppkG0TVVfEt7rZD7a+d32S
 aLKlefBhSGzO6MEmCsQ90kKDTv2khzf5meLgDySPpesvYaj0Z6VV1xM3J
 t9c4X46KLdWoU9SeFUz9UbpYTenj/PboPnP1jWTaLUdk7SVCYSrtjnm31
 5di7BmF0fZ3OAeThKCcwknAXxloCGXhLA7TlGUrxE3y4IPvjqgxTBAhmv
 c2d4DEoOVkUcCaSorRpHosQ0r2/3LVb5nEh+Vy1O9CgFpdiJATVnUFRaB g==;
X-CSE-ConnectionGUID: nCg9H3zJSH+3XoM1B9Knsw==
X-CSE-MsgGUID: TXE4Qi19Ss+IKDA0kCXljw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29058709"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29058709"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 03:27:00 -0700
X-CSE-ConnectionGUID: 0k/is+bsTY62TWjhwvxgjA==
X-CSE-MsgGUID: KtQALvB5QYadkpzzJFYzCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="79895298"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.4])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 03:26:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: R Sundar <prosunofficial@gmail.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imre.deak@intel.com
Cc: R Sundar <prosunofficial@gmail.com>, kernel test robot <lkp@intel.com>,
 Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH linux-next] drm/i915/ddi: use string choice helpers
In-Reply-To: <20241007173300.83902-1-prosunofficial@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241007173300.83902-1-prosunofficial@gmail.com>
Date: Tue, 22 Oct 2024 13:26:53 +0300
Message-ID: <87o73cv3f6.fsf@intel.com>
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
> Use str_enabled_disabled string helpers for better readability and to
> fix cocci warning.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/r/202410071601.TFpXoqgW-lkp@intel.com/
> Signed-off-by: R Sundar <prosunofficial@gmail.com>

Pushed to drm-intel-next, thanks for the patch.

BR,
Jani.

> ---
>
> Reported in linux repo:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>
> cocci warnings: (new ones prefixed by >>)
>>> drivers/gpu/drm/i915/display/intel_ddi.c:2225:7-13: opportunity for str_enabled_disabled(enable)
>
> vim +2225 drivers/gpu/drm/i915/display/intel_ddi.c
>
> compile tested only.
>
>  drivers/gpu/drm/i915/display/intel_ddi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index fe1ded6707f9..ff4c633c8546 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -2236,7 +2236,7 @@ static void intel_dp_sink_set_fec_ready(struct intel_dp *intel_dp,
>  	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_FEC_CONFIGURATION,
>  			       enable ? DP_FEC_READY : 0) <= 0)
>  		drm_dbg_kms(display->drm, "Failed to set FEC_READY to %s in the sink\n",
> -			    enable ? "enabled" : "disabled");
> +			    str_enabled_disabled(enable));
>  
>  	if (enable &&
>  	    drm_dp_dpcd_writeb(&intel_dp->aux, DP_FEC_STATUS,

-- 
Jani Nikula, Intel
