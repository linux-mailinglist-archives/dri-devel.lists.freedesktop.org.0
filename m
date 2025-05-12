Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A03AB4415
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0ABE10E49A;
	Mon, 12 May 2025 18:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MeFZWAhX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5515410E45A;
 Mon, 12 May 2025 18:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WH1+IZzkeKRCx0OH7kXf9a7sRqUmWWFJqxIZ12mD+n0=; b=MeFZWAhXA/YnuvkkhWmMmRs2nq
 2Y9wbEpeBF6WXnVcJO8y4BDkTwU2UbJbRPUMBGC3wafFiICwzcegxexcERQb+mLrHqXdBvHFjyox+
 VhwydBpdZDidtv6VWTVlPFDYtjGLhULgwc09CKCemtE/HAtgDbNGuVvk0/CSnGXA7ihatNvFfKb1P
 PCIHFxzAp5BxE589xQnRMKpfqlaRId56+ZkNPPhn+1Rwprx8q97AUS9ttHDACthVwoQ09Jgr7pCUB
 tI0WMLtL7g/JXHDzyuI7oxmlKtpHBxF3IfDjeJcWFTn874HusOBf/L7A1+MgXJyIaulDzUpuCAc85
 Uxs/Yj3Q==;
Received: from [189.6.16.79] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uEY9C-007Dfw-S4; Mon, 12 May 2025 20:50:30 +0200
Date: Mon, 12 May 2025 15:50:17 -0300
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
Subject: Re: [PATCH V9 26/43] drm/amd/display: Add support for sRGB EOTF in
 DEGAM block
Message-ID: <twwndnvjm6rmxdt4cs747fixvplpeuy3yh3ho6d4yq3y3prhub@fag4kafh2xct>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <20250430011115.223996-27-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430011115.223996-27-alex.hung@amd.com>
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
> Expose one 1D curve colorop with support for
> DRM_COLOROP_1D_CURVE_SRGB_EOTF and program HW to perform
> the sRGB transform when the colorop is not in bypass.
> 
> With this change the following IGT test passes:
> kms_colorop --run plane-XR30-XR30-srgb_eotf
> 
> The color pipeline now consists of a single colorop:
> 1. 1D curve colorop w/ sRGB EOTF
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Co-developed-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> ---
> V9:
>  - Update function names by _plane_ (Chaitanya Kumar Borah)
>  - Update replace cleanup code by drm_colorop_pipeline_destroy (Simon Ser)
> 
> v8:
>  - Fix incorrect && by || in __set_colorop_in_tf_1d_curve (Leo Li)
> 
> v7:
>  - Fix checkpatch warnings
>   - Change switch "{ }" position
>   - Delete double ";"
>   - Delete "{ }" for single-line if-statement
>   - Add a new line at EOF
>   - Change SPDX-License-Identifier: GPL-2.0+ from // to /* */
> 
> v6:
>  - cleanup if colorop alloc or init fails
> 
>  .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  3 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 86 +++++++++++++++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 69 +++++++++++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h | 34 ++++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 10 +++
>  5 files changed, 201 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> index ab2a97e354da..46158d67ab12 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> @@ -38,7 +38,8 @@ AMDGPUDM = \
>  	amdgpu_dm_pp_smu.o \
>  	amdgpu_dm_psr.o \
>  	amdgpu_dm_replay.o \
> -	amdgpu_dm_wb.o
> +	amdgpu_dm_wb.o \
> +	amdgpu_dm_colorop.o
>  
>  ifdef CONFIG_DRM_AMD_DC_FP
>  AMDGPUDM += dc_fpu.o
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index ebabfe3a512f..0b513ab5050f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -668,6 +668,18 @@ amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
>  	}
>  }
>  
> +static enum dc_transfer_func_predefined
> +amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
> +{
> +	switch (tf) {
> +	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
> +	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
> +		return TRANSFER_FUNCTION_SRGB;
> +	default:
> +		return TRANSFER_FUNCTION_LINEAR;
> +	}
> +}
> +
>  static void __to_dc_lut3d_color(struct dc_rgb *rgb,
>  				const struct drm_color_lut lut,
>  				int bit_precision)
> @@ -1137,6 +1149,59 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
>  	return 0;
>  }
>  
> +static int
> +__set_colorop_in_tf_1d_curve(struct dc_plane_state *dc_plane_state,
> +		       struct drm_colorop_state *colorop_state)
> +{
> +	struct dc_transfer_func *tf = &dc_plane_state->in_transfer_func;
> +	struct drm_colorop *colorop = colorop_state->colorop;
> +	struct drm_device *drm = colorop->dev;
> +
> +	if (colorop->type != DRM_COLOROP_1D_CURVE ||
> +	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)
> +		return -EINVAL;
> +
> +	if (colorop_state->bypass) {
> +		tf->type = TF_TYPE_BYPASS;
> +		tf->tf = TRANSFER_FUNCTION_LINEAR;
> +		return 0;
> +	}
> +
> +	drm_dbg(drm, "Degamma colorop with ID: %d\n", colorop->base.id);
> +
> +	tf->type = TF_TYPE_PREDEFINED;
> +	tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
> +
> +	return 0;
> +}
> +
> +static int
> +__set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
> +			       struct dc_plane_state *dc_plane_state,
> +			       struct drm_colorop *colorop)
> +{
> +	struct drm_colorop *old_colorop;
> +	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
> +	struct drm_atomic_state *state = plane_state->state;
> +	int i = 0;
> +
> +	old_colorop = colorop;
> +
> +	/* 1st op: 1d curve - degamma */
> +	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
> +		if (new_colorop_state->colorop == old_colorop &&
> +		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
> +			colorop_state = new_colorop_state;
> +			break;
> +		}
> +	}
> +
> +	if (!colorop_state)
> +		return -EINVAL;
> +
> +	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);

I wonder what will happen if plane degamma isn't set, but CRTC degamma
LUT or legacy CRTC regamma LUT (with its implicity sRGB degamma) is used
together with other plane color ops.

I can imagine the mess, so I think CRTC degamma LUT and legacy CRTC
regamma LUT should be somehow entirely disabled (or rejected) if plane
color pipeline is in use.

Melissa

> +}
> +
>  static int
>  amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
>  				     struct dc_plane_state *dc_plane_state)
> @@ -1187,6 +1252,24 @@ amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
>  	return 0;
>  }
>  
> +static int
> +amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
> +		       struct dc_plane_state *dc_plane_state)
> +{
> +	struct drm_colorop *colorop = plane_state->color_pipeline;
> +	int ret;
> +
> +	/* 1D Curve - DEGAM TF */
> +	if (!colorop)
> +		return -EINVAL;
> +
> +	ret = __set_dm_plane_colorop_degamma(plane_state, dc_plane_state, colorop);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  /**
>   * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
>   * @crtc: amdgpu_dm crtc state
> @@ -1283,5 +1366,8 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
>  	}
>  
> +	if (!amdgpu_dm_plane_set_colorop_properties(plane_state, dc_plane_state))
> +		return 0;
> +
>  	return amdgpu_dm_plane_set_color_properties(plane_state, dc_plane_state);
>  }
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> new file mode 100644
> index 000000000000..bc9980aad7d8
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: AMD
> + *
> + */
> +
> +#include <drm/drm_print.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_property.h>
> +#include <drm/drm_colorop.h>
> +
> +#include "amdgpu_dm_colorop.h"
> +
> +const u64 amdgpu_dm_supported_degam_tfs =
> +	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
> +
> +#define MAX_COLOR_PIPELINE_OPS 10
> +
> +int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
> +{
> +	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
> +	struct drm_device *dev = plane->dev;
> +	int ret;
> +	int i = 0;
> +
> +	memset(ops, 0, sizeof(ops));
> +
> +	/* 1D curve - DEGAM TF */
> +	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +	if (!ops[i]) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		ret = -ENOMEM;
> +		goto cleanup;
> +	}
> +
> +	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_degam_tfs);
> +	if (ret)
> +		goto cleanup;
> +
> +	list->type = ops[i]->base.id;
> +	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);
> +
> +	return 0;
> +
> +cleanup:
> +	drm_colorop_pipeline_destroy(plane);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
> new file mode 100644
> index 000000000000..3324e2a66079
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: AMD
> + *
> + */
> +
> +#ifndef __AMDGPU_DM_COLOROP_H__
> +#define __AMDGPU_DM_COLOROP_H__
> +
> +extern const u64 amdgpu_dm_supported_degam_tfs;
> +
> +int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list);
> +
> +#endif /* __AMDGPU_DM_COLOROP_H__*/
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index feb4b99bf629..742ed56d1e58 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -37,6 +37,7 @@
>  #include "amdgpu_display.h"
>  #include "amdgpu_dm_trace.h"
>  #include "amdgpu_dm_plane.h"
> +#include "amdgpu_dm_colorop.h"
>  #include "gc/gc_11_0_0_offset.h"
>  #include "gc/gc_11_0_0_sh_mask.h"
>  
> @@ -1791,10 +1792,19 @@ dm_plane_init_colorops(struct drm_plane *plane)
>  {
>  	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
>  	int len = 0;
> +	int ret;
>  
>  	if (plane->type == DRM_PLANE_TYPE_CURSOR)
>  		return 0;
>  
> +	/* initialize default pipeline */
> +	ret = amdgpu_dm_initialize_default_pipeline(plane, &(pipelines[len]));
> +	if (ret) {
> +		DRM_ERROR("Failed to create color pipeline for plane %d: %d\n", plane->base.id, ret);
> +		return ret;
> +	}
> +	len++;
> +
>  	/* Create COLOR_PIPELINE property and attach */
>  	drm_plane_create_color_pipeline_property(plane, pipelines, len);
>  
> -- 
> 2.43.0
> 
