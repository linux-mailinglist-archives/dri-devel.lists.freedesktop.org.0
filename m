Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BD586E3FB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 16:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30ACE10E63D;
	Fri,  1 Mar 2024 15:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jsBJ7EG3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA5210E5F8;
 Fri,  1 Mar 2024 15:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709305485; x=1740841485;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Yiyug9sgNzn/NsP9H1GJ7xvlZGJUBvJJowCxMVC3jPc=;
 b=jsBJ7EG3+RMg70SWyYsaCWEvT5/VAXFfmHM5EZO4svw9tOFC0UAn+w5f
 dw3F9+KdAJ+dWL3M60AC23POcb7q4augsAVTkGD8UUOC4twLL++Ap0QFv
 E/0v+ruZb9u/rKYXCOfjZBzhjWg6TaLMonfPIWWN4oWDgij6X5O4TQYBF
 d0Di+T/dD0hWzf30dS/FlnmOCIMmjOKNv9nSAVH1uAGdIP/rev0P2nH6W
 xVx/iQiPJkZEVtqPIe17VxOb3C9v8jkWVFC3YrB4GykalHwVXBkYfZlX5
 WGVe+JAoJ8v9o0b0IcVKNMH3s7b0rLUYYDdotE2JhSj1PIwtAQNxyCu68 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="15278456"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; d="scan'208";a="15278456"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 07:04:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="827772006"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; d="scan'208";a="827772006"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 01 Mar 2024 07:04:41 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 01 Mar 2024 17:04:40 +0200
Date: Fri, 1 Mar 2024 17:04:40 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/dp: Fix documentation of DP tunnel functions
Message-ID: <ZeHuiNM1uO_Vk2ad@intel.com>
References: <20240228164636.1540903-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240228164636.1540903-1-imre.deak@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 28, 2024 at 06:46:36PM +0200, Imre Deak wrote:
> Fix the documentation issues below, also reported by 'make htmldocs':
> 
> drivers/gpu/drm/display/drm_dp_tunnel.c:447: warning: Function parameter or struct member 'tunnel' not described in 'drm_dp_tunnel_put'
> drivers/gpu/drm/display/drm_dp_tunnel.c:447: warning: Function parameter or struct member 'tracker' not described in 'drm_dp_tunnel_put'
> drivers/gpu/drm/display/drm_dp_tunnel.c:1185: warning: expecting prototype for drm_dp_tunnel_atomic_get_allocated_bw(). Prototype was for drm_dp_tunnel_get_allocated_bw() instead
> drivers/gpu/drm/display/drm_dp_tunnel.c:1903: warning: Function parameter or struct member 'max_group_count' not described in 'drm_dp_tunnel_mgr_create'
> 
> Fixes: 295654f7e554 ("drm/dp: Add support for DP tunneling")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/display/drm_dp_tunnel.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
> index 120e0de674c19..017f1d4c63415 100644
> --- a/drivers/gpu/drm/display/drm_dp_tunnel.c
> +++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
> @@ -436,8 +436,8 @@ EXPORT_SYMBOL(drm_dp_tunnel_get);
>  
>  /**
>   * drm_dp_tunnel_put - Put a reference for a DP tunnel
> - * @tunnel - Tunnel object
> - * @tracker - Debug tracker for the reference
> + * @tunnel: Tunnel object
> + * @tracker: Debug tracker for the reference
>   *
>   * Put a reference for @tunnel along with its debug *@tracker, which
>   * was obtained with drm_dp_tunnel_get().
> @@ -1170,7 +1170,7 @@ int drm_dp_tunnel_alloc_bw(struct drm_dp_tunnel *tunnel, int bw)
>  EXPORT_SYMBOL(drm_dp_tunnel_alloc_bw);
>  
>  /**
> - * drm_dp_tunnel_atomic_get_allocated_bw - Get the BW allocated for a DP tunnel
> + * drm_dp_tunnel_get_allocated_bw - Get the BW allocated for a DP tunnel
>   * @tunnel: Tunnel object
>   *
>   * Get the current BW allocated for @tunnel. After the tunnel is created /
> @@ -1892,6 +1892,7 @@ static void destroy_mgr(struct drm_dp_tunnel_mgr *mgr)
>  /**
>   * drm_dp_tunnel_mgr_create - Create a DP tunnel manager
>   * @dev: DRM device object
> + * @max_group_count: Maximum number of tunnel groups
>   *
>   * Creates a DP tunnel manager for @dev.
>   *
> -- 
> 2.43.3

-- 
Ville Syrjälä
Intel
