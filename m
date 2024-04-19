Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A3D8AAEB9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 14:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A6810FEBE;
	Fri, 19 Apr 2024 12:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2x2Zzxu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702AF10FEBC;
 Fri, 19 Apr 2024 12:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713530447; x=1745066447;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hcKmGQ9CcdXSAryxhB3HZOxyOLQlklmBU8HBrKB6OMU=;
 b=j2x2ZzxuGXIuX4l0BB8frdXnEfKQUbwwvug2fVaOpBNyNSxpOjHG4pF3
 lciezKpeszrYhPhPdl8YmSzidXxfrN7ahUz9KvoXstgs8nC8cnsOf6mvv
 pst4INqgSocf9peewcyZVQtYtWlKqXk7gikI4hBX+EcpUy/j8jzYA//NR
 7LGzDOCACMe7d637RFFBYCgiUt+/XUKRJ9bsXpjDtiupEXQzbNKQgo2ni
 A1lEJycXfxuspVuTMYXKiZkqbTCC6OJNlRtRRjclT1w5kRD4Tp8d9Tj6V
 laRJtBwwO1p4RBe1M7aFEdqjTRKMy9WidZinbRYVRUpLNgIHq95/Kcrqa g==;
X-CSE-ConnectionGUID: AkYJkyIxRO6MPzPqGtqXVg==
X-CSE-MsgGUID: 2bN0gYgTSlGqIupZfAuIsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="31610211"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="31610211"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 05:40:47 -0700
X-CSE-ConnectionGUID: hDgQShGpSfeTeepq1NPjQQ==
X-CSE-MsgGUID: m6dGr0cVSECmiDF49twzog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23350623"
Received: from agherasi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.46.119])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 05:40:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/dp: Fix documentation of DP tunnel functions
In-Reply-To: <20240228164636.1540903-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240228164636.1540903-1-imre.deak@intel.com>
Date: Fri, 19 Apr 2024 15:40:39 +0300
Message-ID: <87y199v83c.fsf@intel.com>
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

On Wed, 28 Feb 2024, Imre Deak <imre.deak@intel.com> wrote:
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

This came up today [1]. Even if the regressing commit was merged via
drm-intel, you still need the acks for queueing non-i915 changes via
drm-intel, and the acks absolutely must be recorded in the commit
messages when pushing the patches.

dim should complain about applying non-i915 patches without acks.

BR,
Jani.


[1] https://lore.kernel.org/r/Zh_Q72gYKMMbge9A@intel.com



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

-- 
Jani Nikula, Intel
