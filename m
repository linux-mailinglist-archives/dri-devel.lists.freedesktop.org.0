Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 406ED924C1D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 01:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAE010E1C7;
	Tue,  2 Jul 2024 23:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqdwRuld";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D7310E08E;
 Tue,  2 Jul 2024 23:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719963191; x=1751499191;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yzH45tjsH2DZUqSlBKr2pzDg/aEQ+EnDG+CHzo/H0lA=;
 b=bqdwRuldn8lP/r4VbPDQhWaTAvelFNgmFA017mCQ9+heY5ET4ZGFhnSO
 VgZ/BMh+3v3VIyT2lFlHQmO4SOYUZEUNz/bsiFtXv0t/g3EyrrGlM5N2u
 fPelH9Hjg8SgsAS40jA2X9vbFtJz9EJOLaAFs6mITQ+3pwX2XG4w63YV3
 W4LeTlL9NcZwPSjNv4XzkOjOzzUin8Ez5aleU483iyIPLAVWiAMDAMJLw
 4u1rECvZErjXoKtebtkm1UdK4FSkpSTJ63Rrhr7sTVq77wsuHCooXJbvH
 XwyKWJqIl4H/foEQZepu0NVExI/u6DTzLJILXI6rTDYeOoIKrHe0j+d02 w==;
X-CSE-ConnectionGUID: nOi6DQbuSYa9P4cl91nN7w==
X-CSE-MsgGUID: rmzlec3wTmiEWhqkJOlUbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28560118"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28560118"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:33:10 -0700
X-CSE-ConnectionGUID: wlmUeZSkQiKsUdeM5/hFnA==
X-CSE-MsgGUID: mtMT8fVyREWBfB1jcOhZ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46044198"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:33:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:33:04 +0300
Date: Wed, 3 Jul 2024 02:33:04 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk,
 joe@perches.com, mcgrof@kernel.org
Subject: Re: [PATCH v9 30/52] drm-dyndbg: adapt drm core to use dyndbg
 classmaps-v2
Message-ID: <ZoSOMClB0MeWeokU@intel.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
 <20240702215804.2201271-31-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240702215804.2201271-31-jim.cromie@gmail.com>
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

On Tue, Jul 02, 2024 at 03:57:20PM -0600, Jim Cromie wrote:
> dyndbg's CLASSMAP-v1 api was broken; DECLARE_DYNDBG_CLASSMAP tried to
> do too much.  Its replaced by DRM_CLASSMAP_DEFINE, which creates &
> EXPORTs the classmap when CONFIG_DRM_USE_DYNAMIC_DEBUG=y, for direct
> reference by drivers.
> 
> The drivers still use DECLARE_DYNDBG_CLASSMAP for now, so they still
> redundantly re-declare the classmap, but we can convert the drivers
> later to DYNDBG_CLASSMAP_USE
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>  drivers/gpu/drm/drm_print.c | 25 +++++++++++++------------
>  include/drm/drm_print.h     |  8 ++++++++
>  2 files changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index 699b7dbffd7b..4a5f2317229b 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -55,18 +55,19 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
>  #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
>  module_param_named(debug, __drm_debug, ulong, 0600);
>  #else
> -/* classnames must match vals of enum drm_debug_category */
> -DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
> -			"DRM_UT_CORE",
> -			"DRM_UT_DRIVER",
> -			"DRM_UT_KMS",
> -			"DRM_UT_PRIME",
> -			"DRM_UT_ATOMIC",
> -			"DRM_UT_VBL",
> -			"DRM_UT_STATE",
> -			"DRM_UT_LEASE",
> -			"DRM_UT_DP",
> -			"DRM_UT_DRMRES");
> +/* classnames must match value-symbols of enum drm_debug_category */
> +DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
> +		    DRM_UT_CORE,
> +		    "DRM_UT_CORE",
> +		    "DRM_UT_DRIVER",
> +		    "DRM_UT_KMS",
> +		    "DRM_UT_PRIME",
> +		    "DRM_UT_ATOMIC",
> +		    "DRM_UT_VBL",
> +		    "DRM_UT_STATE",
> +		    "DRM_UT_LEASE",
> +		    "DRM_UT_DP",
> +		    "DRM_UT_DRMRES");

Looks like this stuff just ends up in an array, so presumably
it should be possible to use designated initializers to make this
less fragile?

-- 
Ville Syrjälä
Intel
