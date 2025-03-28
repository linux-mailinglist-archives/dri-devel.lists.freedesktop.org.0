Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C727A74AC9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 14:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A886110E180;
	Fri, 28 Mar 2025 13:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RXVsuT0p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C2710EA17;
 Fri, 28 Mar 2025 13:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743169183; x=1774705183;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=d72R6ByOdrC+neEIx+se8x1+ce4CLQN/URTrQCPg2iY=;
 b=RXVsuT0pt7LRGi44kUnYpgxK8YHqVehe85Y+4nfF2DqYyCM812LziOS3
 DUeIIwtYLyCXv5jCXPtkf2TPOyPXksuTRhcNZGQK3ltqWkp0ccDbLuu6/
 MUMdC7ziT1oPGaGj5dXCNezf2e/MBJ8QVdGIoOuLZJ9YnXtEtSRxtvfgo
 wcesPQuhDzbIamb/8j3Zcx8kqpfCJ/qW+yx4TATl9V2+n2XKe4h3DLQ8p
 O4o0PQoS2kVwIK9YVUAcCu0aCZqzptC7wZSSWP29ogPBNYyZHefy0lbrE
 m9gQYKqH72m3YGowM/5n8WZ0volvzWdYvxtXX+VKZtdcrFOd2cG7avBky w==;
X-CSE-ConnectionGUID: DYiliV0ZQNuUNXFq+Y3FIQ==
X-CSE-MsgGUID: nClVRTnOTGeTmbuk9gDxOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44712006"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="44712006"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 06:39:39 -0700
X-CSE-ConnectionGUID: izncqzwVRnScJ7kj+ttBew==
X-CSE-MsgGUID: NAe5tfhHQCqxl2IbxTz8QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="130659792"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 28 Mar 2025 06:37:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 28 Mar 2025 15:37:40 +0200
Date: Fri, 28 Mar 2025 15:37:40 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 chaitanya.kumar.borah@intel.com, ville.syrjala@intel.com
Subject: Re: [PATCH v11 5/5] drm/i915/display: Indexed 8bit format does not
 support async flip
Message-ID: <Z-amJBKioYObnoQT@intel.com>
References: <20250328-asyn-v11-0-ecc2d33aac69@intel.com>
 <20250328-asyn-v11-5-ecc2d33aac69@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328-asyn-v11-5-ecc2d33aac69@intel.com>
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

On Fri, Mar 28, 2025 at 06:15:39PM +0530, Arun R Murthy wrote:
> Async flip is not supported with Indexed 8 bit format as it depends on
> LUT and can't be updated atomically.
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>

Seems OK to me.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_atomic_plane.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index baa82d58900d38caf1420ce46ff6d1c003d12138..78dbbe5d1f293316dc097ce58275569eeed0b34b 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -177,7 +177,8 @@ bool intel_plane_needs_physical(struct intel_plane *plane)
>  bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
>  				u64 modifier)
>  {
> -	if (intel_format_info_is_yuv_semiplanar(drm_format_info(format), modifier)) {
> +	if (intel_format_info_is_yuv_semiplanar(drm_format_info(format), modifier) ||
> +	    format == DRM_FORMAT_C8) {
>  		drm_dbg_kms(plane->base.dev,
>  			    "[PLANE:%d:%s] Planar formats do not support async flips\n",
>  			    plane->base.base.id, plane->base.name);
> 
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
