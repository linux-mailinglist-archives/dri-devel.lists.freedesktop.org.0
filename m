Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A50134198F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 11:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D987D6E9DC;
	Fri, 19 Mar 2021 10:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EEA6E9DC;
 Fri, 19 Mar 2021 10:10:46 +0000 (UTC)
IronPort-SDR: RkcdqRwR2HL7LZeLOnxjg6qrIplmnvGzv/MvKfGMsDjEZm1JRVRLL3SbVKsWqa9bkfV1aZlkBz
 8hz4hTRdn+ow==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="251218515"
X-IronPort-AV: E=Sophos;i="5.81,261,1610438400"; d="scan'208";a="251218515"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 03:10:45 -0700
IronPort-SDR: BP2x8eNN1duoqgsKcaQCBQEhSMeMBqP1S4Wlb+4Ha0LXvx0vzz62ouEWA9Axsm/nDMrHTeOYo1
 EP9QC4iBNurg==
X-IronPort-AV: E=Sophos;i="5.81,261,1610438400"; d="scan'208";a="413453437"
Received: from koehlcla-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.50.135])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 03:10:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch, imre.deak@intel.com,
 ville.syrjala@linux.intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com, tejaskumarx.surendrakumar.upadhyay@intel.com,
 aditya.swarup@intel.com, anusha.srivatsa@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: i915: Fix a typo
In-Reply-To: <20210319043701.14105-1-unixbhaskar@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210319043701.14105-1-unixbhaskar@gmail.com>
Date: Fri, 19 Mar 2021 12:10:37 +0200
Message-ID: <87mtuz78te.fsf@intel.com>
MIME-Version: 1.0
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Mar 2021, Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
> s/nothign/nothing/
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Thanks, pushed.

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> index f6ad257a260e..14d784a6fae5 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> @@ -4185,7 +4185,7 @@ static void icl_pll_disable(struct drm_i915_private *dev_priv,
>  	/*
>  	 * DVFS pre sequence would be here, but in our driver the cdclk code
>  	 * paths should already be setting the appropriate voltage, hence we do
> -	 * nothign here.
> +	 * nothing here.
>  	 */
>
>  	val = intel_de_read(dev_priv, enable_reg);
> --
> 2.26.2
>

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
