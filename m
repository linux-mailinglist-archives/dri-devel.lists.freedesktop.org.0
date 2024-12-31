Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE2F9FF0A8
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 17:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290F810E685;
	Tue, 31 Dec 2024 16:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htL8Lbvr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7921C10E0AE;
 Tue, 31 Dec 2024 16:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735662408; x=1767198408;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=M1WH21xjQtOFMkyb3VlOpkRxiArNJddb/rBJUOyS7MM=;
 b=htL8LbvrnDx7JRf2RunTTH2Leyv2G2o0c/zcLAXGWY91wuo9Iucqhu9R
 4eXcC9zfXtKUC4+aQM7DTZotO1IuaMZbAWyoxG0h1d04UwN90zdybYNVO
 4MEgizq1GQ8/jJF/gib1QZt0Dyj/MrDVBhh+NdFwJVlYGZSMpa0PK/xM0
 NU4bC87F2yGyx1oD0tMjEttvEgFSXj/VFIJjQNKa0qxBCD3LvUeU3d2h1
 z+9cncXLyDhDY4zHk6izOEe2rmdqQWRyG4UKeV3DG3Ij7gW6kxxHbWgfb
 TkDxLRi82+7PAw9jdk+NnC/+0tPpUU8CeP3L3PaG7/OP2267GIEn3C+9O w==;
X-CSE-ConnectionGUID: UltRXrboT+aA+MUoPnC71Q==
X-CSE-MsgGUID: mvhaPx7NSF6BS7ZVza7ZkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35843707"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="35843707"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 08:26:47 -0800
X-CSE-ConnectionGUID: FO/pMQ2KSJKSR7FWDz9YZQ==
X-CSE-MsgGUID: tl7xYPsFSd+Mm/+m7+YARA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="106147814"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 08:26:45 -0800
Date: Tue, 31 Dec 2024 18:27:36 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 09/16] drm/i915/ddi: 128b/132b SST also needs
 DP_TP_CTL_MODE_MST
Message-ID: <Z3QbeEAUr99-I88e@ideak-desk.fi.intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
 <600a928f06d7c77b7b10672b7e09e083caa72c0c.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <600a928f06d7c77b7b10672b7e09e083caa72c0c.1734643485.git.jani.nikula@intel.com>
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

On Thu, Dec 19, 2024 at 11:33:58PM +0200, Jani Nikula wrote:
> It's not very clearly specified, and the hardware bit is ill-named, but
> 128b/132b SST also needs the MST mode set in the DP_TP_CTL register.
> 
> This is preparation for enabling 128b/132b SST. This path is not
> reachable yet.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index ce34a619d48a..6f813bf85b23 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3656,7 +3656,8 @@ static void mtl_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
>  
>  	/* 6.d Configure and enable DP_TP_CTL with link training pattern 1 selected */
>  	dp_tp_ctl = DP_TP_CTL_ENABLE | DP_TP_CTL_LINK_TRAIN_PAT1;
> -	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST)) {
> +	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST) ||
> +	    intel_dp_is_uhbr(crtc_state)) {
>  		dp_tp_ctl |= DP_TP_CTL_MODE_MST;
>  	} else {
>  		dp_tp_ctl |= DP_TP_CTL_MODE_SST;
> @@ -3716,7 +3717,8 @@ static void intel_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
>  	}
>  
>  	dp_tp_ctl = DP_TP_CTL_ENABLE | DP_TP_CTL_LINK_TRAIN_PAT1;
> -	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST)) {
> +	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST) ||
> +	    intel_dp_is_uhbr(crtc_state)) {
>  		dp_tp_ctl |= DP_TP_CTL_MODE_MST;
>  	} else {
>  		dp_tp_ctl |= DP_TP_CTL_MODE_SST;
> -- 
> 2.39.5
> 
