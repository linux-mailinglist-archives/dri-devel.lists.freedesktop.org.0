Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3B7B4FD74
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 15:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2841C10E744;
	Tue,  9 Sep 2025 13:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UppggZ7L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B59810E744
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 13:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757425153; x=1788961153;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=G1YWknukSgFVvObigngVHnHpzeP2fXGCBKhsmC0D2aU=;
 b=UppggZ7LDCBrCoEoQqKL/LqvNvr2Ss/fAqQRWWbXqFPuk3tjlCJP16Ej
 RkkJPSosxlewYS2c+QpTcF/cKJwKrXoddcehSsp2Y4lHnaO2SjMNXKh66
 k2SduILhHb8juPIhDgQOjICnGyOyAVYhXZ+IHtrU2McIwCTlXyMF2jm2U
 2PmuE7xwYjWzng2xLCEJKKrQ0eRWv8uZA2LPhVrOWGiM4Ap2BNJTrU0M4
 /toajb1s/GqUujwRUEp16BvgusipX1o4X9TaEmRcbVlqIn0QiP21z0ss8
 54w/l9F5qI79tkjdUqdKavC4f3drtJ62FDl7FEwnjuwpWozJjyDjGLWJM g==;
X-CSE-ConnectionGUID: i8lt/SQ5S7G+u+yj5i468Q==
X-CSE-MsgGUID: o+xtYoZ9Q1Co6ZhHdIBDWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="71126244"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="71126244"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:39:13 -0700
X-CSE-ConnectionGUID: ynpV/gVkQbi5g9TnkYwE+Q==
X-CSE-MsgGUID: R4QO1tRoS366vb0Wtoc+QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172363755"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.181])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:39:10 -0700
Date: Tue, 9 Sep 2025 16:39:07 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 13/39] drm/armada: Drop always true condition in
 atomic_check
Message-ID: <aMAt-_CheWl5XGNF@intel.com>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
 <20250909-drm-no-more-existing-state-v3-13-1c7a7d960c33@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250909-drm-no-more-existing-state-v3-13-1c7a7d960c33@kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Sep 09, 2025 at 01:27:32PM +0200, Maxime Ripard wrote:
> The drm_atomic_state pointer passed to atomic_check is always valid, so
> checking if it's NULL or not is pointless. Remove the check.
> 
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> To: Russell King <linux@armlinux.org.uk>
> ---
>  drivers/gpu/drm/armada/armada_plane.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
> index cc47c032dbc151a463cbd0b0d048c74c2828f253..976b6a271c912421e3fec7525f77234e73a74212 100644
> --- a/drivers/gpu/drm/armada/armada_plane.c
> +++ b/drivers/gpu/drm/armada/armada_plane.c
> @@ -83,25 +83,20 @@ int armada_drm_plane_atomic_check(struct drm_plane *plane,
>  {
>  	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
>  										 plane);
>  	struct armada_plane_state *st = to_armada_plane_state(new_plane_state);
>  	struct drm_crtc *crtc = new_plane_state->crtc;
> -	struct drm_crtc_state *crtc_state;
> +	struct drm_crtc_state *crtc_state =
> +		drm_atomic_get_existing_crtc_state(state, crtc);

new_plane_state->crtc might be NULL here.

>  	bool interlace;
>  	int ret;
>  
>  	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc)) {
>  		new_plane_state->visible = false;
>  		return 0;
>  	}
>  

Here we know it's not NULL.

> -	if (state)
> -		crtc_state = drm_atomic_get_existing_crtc_state(state,
> -								crtc);
> -	else
> -		crtc_state = crtc->state;
> -
>  	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
>  						  0,
>  						  INT_MAX, true, false);
>  	if (ret)
>  		return ret;
> 
> -- 
> 2.50.1

-- 
Ville Syrjälä
Intel
