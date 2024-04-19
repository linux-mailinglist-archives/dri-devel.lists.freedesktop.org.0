Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEA08AAFD3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 15:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115C410F5AD;
	Fri, 19 Apr 2024 13:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFtK+QSt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6914310EE8E;
 Fri, 19 Apr 2024 13:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713534896; x=1745070896;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=SsqOsJD40VPMRR9SEmzB+wd1VjhsE4jsPF+Ceaf+jOw=;
 b=iFtK+QStoMgG774DOSFG5j6Yyl6MH/K+SLblCnLq4Ps4lLZrUhbbLuj7
 RI5dnr025ojHtE5K4WF2jI8qBnIwkjDfIWRBVN7YQ/I7YF3EaAgm6wZEq
 S+lA6f85ps2NipaYNQICiqShPifwUs6ME/DV7MY//Z7v1Pz0pWcgCiTVU
 7wxCyM9eI0J3uj1zuhTTQO5lLMj8B9tnHKz+GXJF2x5gGZW8B5sQyZooA
 vcDL1QL9o/Tb9I9SPQK0J3+0CphBJucLYfKUmGCbLOymWQXA7X1ki/9+0
 6My6lUhQZWkmRLwblQL2y1DzCKT811mrtsWcHqgJKZRYf50ou4lNzpXVC g==;
X-CSE-ConnectionGUID: t+u3Oy2tQfOpVttUrOMLqg==
X-CSE-MsgGUID: XvK+3TkVS8aq5Hcje6DCew==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="12917046"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="12917046"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 06:54:55 -0700
X-CSE-ConnectionGUID: +YQHX04VR0eTwD0B/KnHYw==
X-CSE-MsgGUID: 2cLOJwzlR4q22Ku1Gk1Ikg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23779348"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 06:54:53 -0700
Date: Fri, 19 Apr 2024 16:54:50 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/dp: Fix documentation of DP tunnel functions
Message-ID: <ZiJ3qt2Fvi982fkQ@ideak-desk.fi.intel.com>
References: <20240228164636.1540903-1-imre.deak@intel.com>
 <87y199v83c.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y199v83c.fsf@intel.com>
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

On Fri, Apr 19, 2024 at 03:40:39PM +0300, Jani Nikula wrote:
> On Wed, 28 Feb 2024, Imre Deak <imre.deak@intel.com> wrote:
> > Fix the documentation issues below, also reported by 'make htmldocs':
> >
> > drivers/gpu/drm/display/drm_dp_tunnel.c:447: warning: Function parameter or struct member 'tunnel' not described in 'drm_dp_tunnel_put'
> > drivers/gpu/drm/display/drm_dp_tunnel.c:447: warning: Function parameter or struct member 'tracker' not described in 'drm_dp_tunnel_put'
> > drivers/gpu/drm/display/drm_dp_tunnel.c:1185: warning: expecting prototype for drm_dp_tunnel_atomic_get_allocated_bw(). Prototype was for drm_dp_tunnel_get_allocated_bw() instead
> > drivers/gpu/drm/display/drm_dp_tunnel.c:1903: warning: Function parameter or struct member 'max_group_count' not described in 'drm_dp_tunnel_mgr_create'
> >
> > Fixes: 295654f7e554 ("drm/dp: Add support for DP tunneling")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> 
> This came up today [1]. Even if the regressing commit was merged via
> drm-intel, you still need the acks for queueing non-i915 changes via
> drm-intel, and the acks absolutely must be recorded in the commit
> messages when pushing the patches.

There wasn't a reason to merge this via drm-intel instead of
drm-misc-next, not sure why I did that; otherwise I always ask and
record the acks.

> dim should complain about applying non-i915 patches without acks.

I don't remember seeing it this time, but yes it should complain and
require an override; maybe I managed to overlook somehow that as well.

> BR,
> Jani.
> 
> 
> [1] https://lore.kernel.org/r/Zh_Q72gYKMMbge9A@intel.com
> 
> 
> 
> > ---
> >  drivers/gpu/drm/display/drm_dp_tunnel.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
> > index 120e0de674c19..017f1d4c63415 100644
> > --- a/drivers/gpu/drm/display/drm_dp_tunnel.c
> > +++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
> > @@ -436,8 +436,8 @@ EXPORT_SYMBOL(drm_dp_tunnel_get);
> >  
> >  /**
> >   * drm_dp_tunnel_put - Put a reference for a DP tunnel
> > - * @tunnel - Tunnel object
> > - * @tracker - Debug tracker for the reference
> > + * @tunnel: Tunnel object
> > + * @tracker: Debug tracker for the reference
> >   *
> >   * Put a reference for @tunnel along with its debug *@tracker, which
> >   * was obtained with drm_dp_tunnel_get().
> > @@ -1170,7 +1170,7 @@ int drm_dp_tunnel_alloc_bw(struct drm_dp_tunnel *tunnel, int bw)
> >  EXPORT_SYMBOL(drm_dp_tunnel_alloc_bw);
> >  
> >  /**
> > - * drm_dp_tunnel_atomic_get_allocated_bw - Get the BW allocated for a DP tunnel
> > + * drm_dp_tunnel_get_allocated_bw - Get the BW allocated for a DP tunnel
> >   * @tunnel: Tunnel object
> >   *
> >   * Get the current BW allocated for @tunnel. After the tunnel is created /
> > @@ -1892,6 +1892,7 @@ static void destroy_mgr(struct drm_dp_tunnel_mgr *mgr)
> >  /**
> >   * drm_dp_tunnel_mgr_create - Create a DP tunnel manager
> >   * @dev: DRM device object
> > + * @max_group_count: Maximum number of tunnel groups
> >   *
> >   * Creates a DP tunnel manager for @dev.
> >   *
> 
> -- 
> Jani Nikula, Intel
