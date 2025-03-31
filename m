Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05612A76B15
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 17:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F98810E429;
	Mon, 31 Mar 2025 15:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D8xPbceH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813B210E429;
 Mon, 31 Mar 2025 15:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743436079; x=1774972079;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8+ApZg6DgNxNScXJizLtzSMbhcnkny6MGj62Z3KuyzU=;
 b=D8xPbceHUJhb9R4gaaSrMp5H0ljBEO3301tlR83Cm/5dVD80ajFjof83
 kqXtCCZPDI7Fo8jcGPt9Dtt7WIy8h0zzDhjmNDZOQiXEBf/+sMgJBe+s7
 hn1sSm7BQpXS0ZythXsN3V39ktGFrKok0SXvS6ttDU6tx3JQZB6rrCwuo
 dI8k3mSD7PVb4ql0GL3jBLih+JzyTsYUjZtZSLqMygjsVRzwq+x9UyHaZ
 NoaBhVJCwGyli55/Ji11x8pEJ+hwKH8EvqFEexIZiH09svW3mC4VXjOOd
 70KONOKtRShSN0xsv4aNoaVgvjJe34VZRQ4MytXeKdtnf/seVOeFXKCqS w==;
X-CSE-ConnectionGUID: X9YmuZG4SWSYjK/3R81MsQ==
X-CSE-MsgGUID: eMBVNMiZS6KOGyDeDFBkCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="43979624"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="43979624"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 08:47:58 -0700
X-CSE-ConnectionGUID: HOUtj5JfSOi5gIQOSagb/g==
X-CSE-MsgGUID: tU8/JQbJTO28cW99pevm9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="131339000"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 31 Mar 2025 08:47:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 31 Mar 2025 18:47:54 +0300
Date: Mon, 31 Mar 2025 18:47:54 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 chaitanya.kumar.borah@intel.com, ville.syrjala@intel.com
Subject: Re: [PATCH v11 5/5] drm/i915/display: Indexed 8bit format does not
 support async flip
Message-ID: <Z-q5Ki8FB5Y32eOw@intel.com>
References: <20250328-asyn-v11-0-a50d13bfea0d@intel.com>
 <20250328-asyn-v11-5-a50d13bfea0d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328-asyn-v11-5-a50d13bfea0d@intel.com>
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

On Fri, Mar 28, 2025 at 09:26:24PM +0530, Arun R Murthy wrote:
> Async flip is not supported with Indexed 8 bit format as it depends on
> LUT and can't be updated atomically.

We should again highlight that this may change the alignment for
C8 framebuffers on some platforms.

> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_atomic_plane.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index 3b9d3e1620cd882b8a7f9b4c96640e42367248bb..1bcfa5f4fd63442b632655ccaf325a87be78fe21 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -177,7 +177,8 @@ bool intel_plane_needs_physical(struct intel_plane *plane)
>  bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
>  				u64 modifier)
>  {
> -	if (intel_format_info_is_yuv_semiplanar(drm_format_info(format), modifier))
> +	if (intel_format_info_is_yuv_semiplanar(drm_format_info(format), modifier) ||
> +	    format == DRM_FORMAT_C8)
>  		return false;
>  
>  	return plane->can_async_flip && plane->can_async_flip(modifier);
> 
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
