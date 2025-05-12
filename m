Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FF0AB4512
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 21:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD15F10E1F4;
	Mon, 12 May 2025 19:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="l7ZcM85u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5044610E02B;
 Mon, 12 May 2025 19:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AgcLE0Sd965sRgbNpulZultrhBcqqwWg+IHj30ZyR0Y=; b=l7ZcM85uw9AXzZ0lw2jtyJwx5x
 iT5n9H9uG47usGqOueUXw4npZqsBzjbHDNkidK+XvX4VduFji4eUvT4muXl/bAnocaAJE3xu/x8P0
 SADdE+MyvLDkW1imy3BugxMOXwnj7XSpA4f1lF+UiqllrhjMafl2KFzfjP6fO3w+S/iQ+DJIskOAk
 x7EIOhduVLpllgIwivramYyhcp2bVcKK6g+kzBY158EEMop2abTqfnUp+c7uRxPQSHLqAD4+aU/lz
 tCkxvwrAaXvi/WT/szlSoXO1tAYsL59x/bodS+A/fZx/ydpwjUkKMBFjexgiEZZ16fLlgDaxWvgFq
 ZNRwt/fg==;
Received: from [189.6.16.79] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uEYtU-007EkW-Dy; Mon, 12 May 2025 21:38:21 +0200
Date: Mon, 12 May 2025 16:37:51 -0300
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com, 
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH V9 32/43] drm/amd/display: Add support for BT.709 and
 BT.2020 TFs
Message-ID: <qanwqmtvbsne442nh3zndfxwvkf7m3nbffpb6feok4zvybgj76@lz6s4czyuft3>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <20250430011115.223996-33-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430011115.223996-33-alex.hung@amd.com>
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

On 04/29, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
> 
> This adds support for the BT.709/BT.2020 transfer functions
> on all current 1D curve plane colorops, i.e., on DEGAM, SHAPER,
> and BLND blocks.
> 
> With this change the following IGT subtests pass:
> kms_colorop --run plane-XR30-XR30-bt2020_inv_oetf
> kms_colorop --run plane-XR30-XR30-bt2020_oetf
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> ---
> V9:
>  - Move DRM_COLOROP_1D_CURVE_BT2020_* from middle to end
> 
> v8: 
>  - Move BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) in amdgpu_dm_supported_blnd_tfs
>    to "drm/amd/display: Enable support for PQ 125 EOTF and Inverse" (Leo Li)
> 
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c   | 11 ++++++++---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  9 ++++++---
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 63044e0296cb..f645f9ded95f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -679,6 +679,9 @@ amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
>  	case DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
>  	case DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
>  		return TRANSFER_FUNCTION_PQ;
> +	case DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
> +	case DRM_COLOROP_1D_CURVE_BT2020_OETF:
> +		return TRANSFER_FUNCTION_BT709;
>  	default:
>  		return TRANSFER_FUNCTION_LINEAR;
>  	}
> @@ -1284,8 +1287,10 @@ __set_colorop_1d_curve_blend_tf_lut(struct dc_plane_state *dc_plane_state,
>  	const struct drm_color_lut *blend_lut;
>  	uint32_t blend_size = 0;
>  
> -	if (colorop->type != DRM_COLOROP_1D_CURVE &&
> -	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)
> +	if (colorop->type != DRM_COLOROP_1D_CURVE)
> +		return -EINVAL;
> +
> +	if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs))
>  		return -EINVAL;
>  
>  	if (colorop_state->bypass) {
> @@ -1321,7 +1326,7 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
>  	/* 3nd op: 1d curve - blend */
>  	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
>  		if (new_colorop_state->colorop == old_colorop &&
> -		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
> +		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {

nitpick: I think these changes to check amdgpu_dm_supported_*_tfs should
happen earlier, together with degamma and shaper curves in the patch 30.

Melissa

>  			colorop_state = new_colorop_state;
>  			break;
>  		}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> index aa753b0d6f13..b989e1ca19e2 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -33,15 +33,18 @@
>  
>  const u64 amdgpu_dm_supported_degam_tfs =
>  	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
> -	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF);
> +	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
> +	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
>  
>  const u64 amdgpu_dm_supported_shaper_tfs =
>  	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) |
> -	BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF);
> +	BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF) |
> +	BIT(DRM_COLOROP_1D_CURVE_BT2020_OETF);
>  
>  const u64 amdgpu_dm_supported_blnd_tfs =
>  	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
> -	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF);
> +	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
> +	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
>  
>  #define MAX_COLOR_PIPELINE_OPS 10
>  
> -- 
> 2.43.0
> 
