Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0399FF031
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 16:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBF410E088;
	Tue, 31 Dec 2024 15:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NH8ZUSOf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE7210E088;
 Tue, 31 Dec 2024 15:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735658723; x=1767194723;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=h0I2OeYhMI7wTDZMvjud5Q9tJDuK10Z1p0hcvVRKdJI=;
 b=NH8ZUSOfyOL3mXBkLJNjheBQbbhl8iKhSwKanHVGc3nEhQ76Hrsf9SV1
 ug7BfdA/3WhV1Fh4SmrFvFClEOSHJ4o3zp7CghwCpY6DfkxktYSiOFVwN
 oWQAs4x5M1WdjwuuG2z11AkdV1ewGeKD4pTToPTHsQGjPShp3V/miBFR7
 lb2gogmxPLXsSnIT4X3oZKtu55BzVMrJWiwyE32bxH1OgCPmIVj312HSZ
 pKIUGEmPwxbKoaHfqVhOuZLHO0S4+iLRiWAbp2jpOXUeTVHSk4R73cV4p
 ru5k3PRaAOFwCdNudUxGw4jngBpIoA/l/UO93oXR40QadJ4dOjboozy4H Q==;
X-CSE-ConnectionGUID: uqcgORDXSo+mH0ASzDpLkw==
X-CSE-MsgGUID: 42vwCNe0TAObu0RodRi6VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="58403554"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="58403554"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 07:25:22 -0800
X-CSE-ConnectionGUID: UAUbswnSTuGghB/oYPVcmg==
X-CSE-MsgGUID: LgS3xvxiRyGgIWmvPTMaWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106074499"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 07:25:21 -0800
Date: Tue, 31 Dec 2024 17:26:10 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 02/16] drm/i915/mst: drop connector parameter from
 intel_dp_mst_bw_overhead()
Message-ID: <Z3QNEr7aprdmY2A2@ideak-desk.fi.intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
 <0b69346ba12fde422758348b64d5666be2f955bb.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b69346ba12fde422758348b64d5666be2f955bb.1734643485.git.jani.nikula@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 19, 2024 at 11:33:51PM +0200, Jani Nikula wrote:
> intel_dp_mst_bw_overhead() doesn't need the connector. Remove the
> parameter.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 163a009e51b8..50426ba5bdeb 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -139,7 +139,6 @@ static int intel_dp_mst_max_dpt_bpp(const struct intel_crtc_state *crtc_state,
>  }
>  
>  static int intel_dp_mst_bw_overhead(const struct intel_crtc_state *crtc_state,
> -				    const struct intel_connector *connector,
>  				    bool ssc, int dsc_slice_count, int bpp_x16)
>  {
>  	const struct drm_display_mode *adjusted_mode =
> @@ -278,9 +277,9 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
>  		link_bpp_x16 = fxp_q4_from_int(dsc ? bpp :
>  					       intel_dp_output_bpp(crtc_state->output_format, bpp));
>  
> -		local_bw_overhead = intel_dp_mst_bw_overhead(crtc_state, connector,
> +		local_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
>  							     false, dsc_slice_count, link_bpp_x16);
> -		remote_bw_overhead = intel_dp_mst_bw_overhead(crtc_state, connector,
> +		remote_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
>  							      true, dsc_slice_count, link_bpp_x16);
>  
>  		intel_dp_mst_compute_m_n(crtc_state, connector,
> -- 
> 2.39.5
> 
