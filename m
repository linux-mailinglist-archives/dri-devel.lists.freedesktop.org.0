Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C20F657788B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 00:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B8195951;
	Sun, 17 Jul 2022 22:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B69C95959;
 Sun, 17 Jul 2022 22:03:30 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so19673463fac.9; 
 Sun, 17 Jul 2022 15:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:reply-to:from:in-reply-to:content-transfer-encoding;
 bh=5+edJ4Hsask+B6mIhMs3u4ALpZR+0BZKhH/Mjbl6xaY=;
 b=V1FYLtHrhGhTvZiE4kJca9uMpub/o6Ogu5XjYph8fNluqHIRGBumrOe7eACFEGa1LB
 eBNm0FOdVmVK4O5HtaokNrnGlf0l6L1slOOcBCzXfkvYc59uRntN3599t4u+SC9l+Unw
 AZ8AgH3S1gjsvNd/pTwqr3rtWM6wI6OXN/qmTLzWV7fCKfzbKrvL1QW02GSw5uCQARUy
 tkSmY+xufbvyaOiBPcQpYu8mBbou5jrjqDYlJ00oymqNvR2RvZWdDFdpi/NeP+KIol6F
 1aNgE+LZJaQrGM50cczzX4RVEzU3ljtkI6qWSVrPz6L7E3LNArE0rkrFFQbZtRpoOYHi
 RxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:reply-to:from:in-reply-to
 :content-transfer-encoding;
 bh=5+edJ4Hsask+B6mIhMs3u4ALpZR+0BZKhH/Mjbl6xaY=;
 b=rGjrIH91X+BbWdMM1Ckyd2eV8cVCWBSNhQ4Gc+7z0+Z9jElbuLtwJIcukng0S5xQuj
 MGN2c2hkffYhHRohvIfdUa0Gmh92Z2EZwRQt82aVWkLKfzNPEQIJNhNuiemo+Qx5ce8Z
 OU3Rwsn8+vrRtrEstR9xsAiQ8rCgOKfD4rRw5RSrKH5Gv1cWnXW1vtmioMuA1//dtNTf
 xy4j0efp9VuMVW8QPVX81mVk+jzNfwA9GJ1MhrSpr5ATbDBf8NmF7e0YKLY2dotOVvLm
 C3xliI+R3fK+Kyd6xcV8epJgtTtGDiz4ZzjuAquPOn4VaVoLkPQF0eQc2VvoFEuSMy6Z
 WJcw==
X-Gm-Message-State: AJIora+HGHxPZIeA3WTi0Q8C3/StRxhSmNChUjfLcj0cmKNyNVc5ang4
 VNyHyOIgrerse/HERyc+uCk=
X-Google-Smtp-Source: AGRyM1vST0n91aXYzmYxVBJLJwm9c1g3+Qn09C3J0rkRd6x7+ygE93g1l+1AAeb4BkkkP3eNTq9BsQ==
X-Received: by 2002:a05:6808:1b27:b0:33a:cf:7f7c with SMTP id
 bx39-20020a0568081b2700b0033a00cf7f7cmr11600851oib.1.1658095409080; 
 Sun, 17 Jul 2022 15:03:29 -0700 (PDT)
Received: from ?IPV6:2804:14c:4c2:8202::1003? ([2804:14c:4c2:8202::1003])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a9d6c50000000b0061c80736666sm3815069otq.28.2022.07.17.15.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jul 2022 15:03:28 -0700 (PDT)
Message-ID: <b3845482-c53e-0ea8-6893-834a93ea5444@gmail.com>
Date: Sun, 17 Jul 2022 19:03:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] Documentation/amdgpu_dm: Add DM color correction
 documentation
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20220716222529.421115-1-mwen@igalia.com>
 <20220716222529.421115-2-mwen@igalia.com>
From: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
In-Reply-To: <20220716222529.421115-2-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: 20220716222529.421115-2-mwen@igalia.com
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, nicholas.kazlauskas@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/07/2022 19:25, Melissa Wen wrote:
> AMDGPU DM maps DRM color management properties (degamma, ctm and gamma)
> to DC color correction entities. Part of this mapping is already
> documented as code comments and can be converted as kernel docs.
> 
> v2:
> - rebase to amd-staging-drm-next
> 
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../gpu/amdgpu/display/display-manager.rst    |   9 ++
>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 121 +++++++++++++-----
>   2 files changed, 98 insertions(+), 32 deletions(-)
> 
> diff --git a/Documentation/gpu/amdgpu/display/display-manager.rst b/Documentation/gpu/amdgpu/display/display-manager.rst
> index 7ce31f89d9a0..b1b0f11aed83 100644
> --- a/Documentation/gpu/amdgpu/display/display-manager.rst
> +++ b/Documentation/gpu/amdgpu/display/display-manager.rst
> @@ -40,3 +40,12 @@ Atomic Implementation
>   
>   .. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>      :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
> +
> +Color Management Properties
> +===========================
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +   :doc: overview
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +   :internal:
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index a71177305bcd..93c813089bff 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -29,7 +29,9 @@
>   #include "modules/color/color_gamma.h"
>   #include "basics/conversion.h"
>   
> -/*
> +/**
> + * DOC: overview
> + *
>    * The DC interface to HW gives us the following color management blocks
>    * per pipe (surface):
>    *
> @@ -71,8 +73,8 @@
>   
>   #define MAX_DRM_LUT_VALUE 0xFFFF
>   
> -/*
> - * Initialize the color module.
> +/**
> + * amdgpu_dm_init_color_mod - Initialize the color module.
>    *
>    * We're not using the full color module, only certain components.
>    * Only call setup functions for components that we need.
> @@ -82,7 +84,14 @@ void amdgpu_dm_init_color_mod(void)
>   	setup_x_points_distribution();
>   }
>   
> -/* Extracts the DRM lut and lut size from a blob. */
> +/**
> + * __extract_blob_lut - Extracts the DRM lut and lut size from a blob.
> + * @blob: DRM color mgmt property blob
> + * @size: lut size
> + *
> + * Returns:
> + * DRM LUT or NULL
> + */
>   static const struct drm_color_lut *
>   __extract_blob_lut(const struct drm_property_blob *blob, uint32_t *size)
>   {
> @@ -90,13 +99,18 @@ __extract_blob_lut(const struct drm_property_blob *blob, uint32_t *size)
>   	return blob ? (struct drm_color_lut *)blob->data : NULL;
>   }

I don't think everyone would approve using actual kernel-doc for these 
static functions, but I can appreciate they being formatted as such.
Consider replacing /** with /*.

> -/*
> - * Return true if the given lut is a linear mapping of values, i.e. it acts
> - * like a bypass LUT.
> +/**
> + * __is_lut_linear - check if the given lut is a linear mapping of values
> + * @lut: given lut to check values
> + * @size: lut size
>    *
>    * It is considered linear if the lut represents:
> - * f(a) = (0xFF00/MAX_COLOR_LUT_ENTRIES-1)a; for integer a in
> - *                                           [0, MAX_COLOR_LUT_ENTRIES)
> + * f(a) = (0xFF00/MAX_COLOR_LUT_ENTRIES-1)a; for integer a in [0,
> + * MAX_COLOR_LUT_ENTRIES)
> + *
> + * Returns:
> + * True if the given lut is a linear mapping of values, i.e. it acts like a
> + * bypass LUT. Otherwise, false.
>    */
>   static bool __is_lut_linear(const struct drm_color_lut *lut, uint32_t size)
>   {
> @@ -119,9 +133,13 @@ static bool __is_lut_linear(const struct drm_color_lut *lut, uint32_t size)
>   	return true;
>   }
>   
> -/*
> - * Convert the drm_color_lut to dc_gamma. The conversion depends on the size
> - * of the lut - whether or not it's legacy.
> +/**
> + * __drm_lut_to_dc_gamma - convert the drm_color_lut to dc_gamma.
> + * @lut: DRM lookup table for color conversion
> + * @gamma: DC gamma to set entries
> + * @is_legacy: legacy or atomic gamma
> + *
> + * The conversion depends on the size of the lut - whether or not it's legacy.
>    */
>   static void __drm_lut_to_dc_gamma(const struct drm_color_lut *lut,
>   				  struct dc_gamma *gamma, bool is_legacy)
> @@ -154,8 +172,11 @@ static void __drm_lut_to_dc_gamma(const struct drm_color_lut *lut,
>   	}
>   }
>   
> -/*
> - * Converts a DRM CTM to a DC CSC float matrix.
> +/**
> + * __drm_ctm_to_dc_matrix - converts a DRM CTM to a DC CSC float matrix
> + * @ctm: DRM color transformation matrix
> + * @matrix: DC CSC float matrix
> + *
>    * The matrix needs to be a 3x4 (12 entry) matrix.
>    */
>   static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
> @@ -189,7 +210,18 @@ static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
>   	}
>   }
>   
> -/* Calculates the legacy transfer function - only for sRGB input space. */
> +/**
> + * __set_legacy_tf - Calculates the legacy transfer function
> + * @func: transfer function
> + * @lut: lookup table that defines the color space
> + * @lut_size: size of respective lut
> + * @has_rom: if ROM can be used for hardcoded curve
> + *
> + * Only for sRGB input space
> + *
> + * Returns:
> + * 0 in case of sucess, -ENOMEM if fails

Typo sucess -> success

> + */
>   static int __set_legacy_tf(struct dc_transfer_func *func,
>   			   const struct drm_color_lut *lut, uint32_t lut_size,
>   			   bool has_rom)
> @@ -218,7 +250,16 @@ static int __set_legacy_tf(struct dc_transfer_func *func,
>   	return res ? 0 : -ENOMEM;
>   }
>   
> -/* Calculates the output transfer function based on expected input space. */
> +/**
> + * __set_output_tf - calculates the output transfer function based on expected input space.
> + * @func: transfer function
> + * @lut: lookup table that defines the color space
> + * @lut_size: size of respective lut
> + * @has_rom: if ROM can be used for hardcoded curve
> + *
> + * Returns:
> + * 0 in case of success. -ENOMEM if fails.
> + */
>   static int __set_output_tf(struct dc_transfer_func *func,
>   			   const struct drm_color_lut *lut, uint32_t lut_size,
>   			   bool has_rom)
> @@ -239,7 +280,7 @@ static int __set_output_tf(struct dc_transfer_func *func,
>   	__drm_lut_to_dc_gamma(lut, gamma, false);
>   
>   	if (func->tf == TRANSFER_FUNCTION_LINEAR) {
> -		/*
> +		/**

I don't think kernel-doc should be used inside functions, as well,
maybe keep the "/*" from before. This occurs in more places in this 
patch, remember to replace them as well, if you concur.

>   		 * Color module doesn't like calculating regamma params
>   		 * on top of a linear input. But degamma params can be used
>   		 * instead to simulate this.
> @@ -262,7 +303,16 @@ static int __set_output_tf(struct dc_transfer_func *func,
>   	return res ? 0 : -ENOMEM;
>   }
>   
> -/* Caculates the input transfer function based on expected input space. */
> +/**
> + * __set_input_tf - calculates the input transfer function based on expected
> + * input space.
> + * @func: transfer function
> + * @lut: lookup table that defines the color space
> + * @lut_size: size of respective lut.
> + *
> + * Returns:
> + * 0 in case of success. -ENOMEM if fails.
> + */
>   static int __set_input_tf(struct dc_transfer_func *func,
>   			  const struct drm_color_lut *lut, uint32_t lut_size)
>   {
> @@ -285,13 +335,15 @@ static int __set_input_tf(struct dc_transfer_func *func,
>   }
>   
>   /**
> - * amdgpu_dm_verify_lut_sizes
> + * amdgpu_dm_verify_lut_sizes - verifies if DRM luts match the hw supported sizes
>    * @crtc_state: the DRM CRTC state
>    *
> - * Verifies that the Degamma and Gamma LUTs attached to the |crtc_state| are of
> - * the expected size.
> + * Verifies that the Degamma and Gamma LUTs attached to the &crtc_state
> + * are of the expected size.
>    *
> - * Returns 0 on success.
> + * Returns:
> + * 0 on success.
> + * -EINVAL if any lut sizes are invalid.

I don't know if you expect this to be rendered in two lines, given that 
you wrote something equivalent in a single line in other docstrings 
above, but if you do, use instead:
```
* * 0 on success.
* * -EINVAL if any lut sizes are invalid.
```
As described at: 
https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#return-values

>    */
>   int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
>   {
> @@ -327,9 +379,9 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
>    * of the HW blocks as long as the CRTC CTM always comes before the
>    * CRTC RGM and after the CRTC DGM.
>    *
> - * The CRTC RGM block will be placed in the RGM LUT block if it is non-linear.
> - * The CRTC DGM block will be placed in the DGM LUT block if it is non-linear.
> - * The CRTC CTM will be placed in the gamut remap block if it is non-linear.
> + * * The CRTC RGM block will be placed in the RGM LUT block if it is non-linear.
> + * * The CRTC DGM block will be placed in the DGM LUT block if it is non-linear.
> + * * The CRTC CTM will be placed in the gamut remap block if it is non-linear.
>    *
>    * The RGM block is typically more fully featured and accurate across
>    * all ASICs - DCE can't support a custom non-linear CRTC DGM.
> @@ -338,7 +390,9 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
>    * management at once we have to either restrict the usage of CRTC properties
>    * or blend adjustments together.
>    *
> - * Returns 0 on success.
> + * Returns:
> + * 0 on success.
> + * Error code if setup fails.
>    */
>   int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>   {
> @@ -373,7 +427,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>   
>   	/* Setup regamma and degamma. */
>   	if (is_legacy) {
> -		/*
> +		/**
>   		 * Legacy regamma forces us to use the sRGB RGM as a base.
>   		 * This also means we can't use linear DGM since DGM needs
>   		 * to use sRGB as a base as well, resulting in incorrect CRTC
> @@ -393,7 +447,8 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>   		if (r)
>   			return r;
>   	} else if (has_regamma) {
> -		/* CRTC RGM goes into RGM LUT. */
> +		/**
> +		 * If atomic regamma, CRTC RGM goes into RGM LUT. */
>   		stream->out_transfer_func->type = TF_TYPE_DISTRIBUTED_POINTS;
>   		stream->out_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
>   
> @@ -402,7 +457,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>   		if (r)
>   			return r;
>   	} else {
> -		/*
> +		/**
>   		 * No CRTC RGM means we can just put the block into bypass
>   		 * since we don't have any plane level adjustments using it.
>   		 */
> @@ -410,7 +465,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>   		stream->out_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
>   	}
>   
> -	/*
> +	/**
>   	 * CRTC DGM goes into DGM LUT. It would be nice to place it
>   	 * into the RGM since it's a more featured block but we'd
>   	 * have to place the CTM in the OCSC in that case.
> @@ -421,7 +476,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>   	if (crtc->base.ctm) {
>   		ctm = (struct drm_color_ctm *)crtc->base.ctm->data;
>   
> -		/*
> +		/**
>   		 * Gamut remapping must be used for gamma correction
>   		 * since it comes before the regamma correction.
>   		 *
> @@ -452,7 +507,9 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>    * preparation for hardware commit. The transfer function used depends on
>    * the prepartion done on the stream for color management.

Could you fix this typo while you are here? prepartion -> preparation

>    *
> - * Returns 0 on success.
> + * Returns:
> + * 0 on success.
> + * ENOMEM if mem allocation fails.
>    */
>   int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>   				      struct dc_plane_state *dc_plane_state)

Thanks for creating more documentation!

Kind regards,
Tales
