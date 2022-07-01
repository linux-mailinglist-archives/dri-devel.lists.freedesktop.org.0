Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64372563CE4
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 01:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6BC113DC0;
	Fri,  1 Jul 2022 23:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B6D113DA7;
 Fri,  1 Jul 2022 23:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656719540; x=1688255540;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fz2wiKfFmrVcH55ZKmrhExo8xdAIBvOdZGwrzWkYW40=;
 b=Z1lFLPcHycSeKYmr6KE5pMGaZeV5Q8r2AVuS052Vc8xeBrNbPXzSLNl0
 XD1dPInR/bNeBThbRjP2CWNhw9VUc8Ett6a8Hj+WrIjM2zhdu95OCOLYl
 iIXHQ4mAdhuNiRSTYmF2+CIPsWp/YAACBRvHqT0bHEuSuPrUpmQZjl7+p
 FS+7mj/cdTbabvhdzI5xeXxLqxjS78xp4LCBVdFQm8KsMhiM1MKGHAa+p
 5FbG9ys2P8rpMc+JJWGun8B7H7aitjK47R+Fu+59Qfqz9jMgHr0xZ5xYi
 nGdu+foCyOxVkKJqEtZL/4u74Wx25MV4EJDdENLlV+d8GK577MrxhC3xh g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="283498450"
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; d="scan'208";a="283498450"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 16:52:19 -0700
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; d="scan'208";a="566504290"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 16:52:19 -0700
Date: Fri, 1 Jul 2022 16:52:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tom Rix <trix@redhat.com>
Subject: Re: [PATCH] drm/i915/display: clean up comments
Message-ID: <Yr+IsQxHuq/SzPZa@mdroper-desk1.amr.corp.intel.com>
References: <20220701203236.1871668-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701203236.1871668-1-trix@redhat.com>
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
Cc: tvrtko.ursulin@linux.intel.com, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, gwan-gyeong.mun@intel.com, jose.souza@intel.com,
 rodrigo.vivi@intel.com, jouni.hogander@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 01, 2022 at 04:32:36PM -0400, Tom Rix wrote:
> spelling changes
> resoluition -> resolution
> dont        -> don't
> commmit     -> commit
> Invalidade  -> Invalidate
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

and applied to drm-intel-next.  Thanks for the patch.


Matt

> ---
>  drivers/gpu/drm/i915/display/intel_psr.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> index 7d61c55184e5..e6a870641cd2 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -555,7 +555,7 @@ static void hsw_activate_psr2(struct intel_dp *intel_dp)
>  		/*
>  		 * TODO: 7 lines of IO_BUFFER_WAKE and FAST_WAKE are default
>  		 * values from BSpec. In order to setting an optimal power
> -		 * consumption, lower than 4k resoluition mode needs to decrese
> +		 * consumption, lower than 4k resolution mode needs to decrease
>  		 * IO_BUFFER_WAKE and FAST_WAKE. And higher than 4K resolution
>  		 * mode needs to increase IO_BUFFER_WAKE and FAST_WAKE.
>  		 */
> @@ -959,7 +959,7 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
>  	int psr_setup_time;
>  
>  	/*
> -	 * Current PSR panels dont work reliably with VRR enabled
> +	 * Current PSR panels don't work reliably with VRR enabled
>  	 * So if VRR is enabled, do not enable PSR.
>  	 */
>  	if (crtc_state->vrr.enable)
> @@ -1664,7 +1664,7 @@ static void intel_psr2_sel_fetch_pipe_alignment(const struct intel_crtc_state *c
>   *
>   * Plane scaling and rotation is not supported by selective fetch and both
>   * properties can change without a modeset, so need to be check at every
> - * atomic commmit.
> + * atomic commit.
>   */
>  static bool psr2_sel_fetch_plane_state_supported(const struct intel_plane_state *plane_state)
>  {
> @@ -2203,7 +2203,7 @@ static void _psr_invalidate_handle(struct intel_dp *intel_dp)
>  }
>  
>  /**
> - * intel_psr_invalidate - Invalidade PSR
> + * intel_psr_invalidate - Invalidate PSR
>   * @dev_priv: i915 device
>   * @frontbuffer_bits: frontbuffer plane tracking bits
>   * @origin: which operation caused the invalidate
> -- 
> 2.27.0
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
