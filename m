Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EC2AB4899
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 02:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A2B10E4BD;
	Tue, 13 May 2025 00:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="l022J4n9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918B910E273;
 Tue, 13 May 2025 00:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M/2eSaMA5/pbWI55B/URgkofijaNSxk2TTJP3iLiEP8=; b=l022J4n9sAsd5K7wfeiRSvTFxD
 fDCEkpORCFQSYubWWst1Vn/Mlrv1a+DSZb2ivfwjK32hlfIoEvw2cJnxkwwfBkWFDvn4r2hohoWTi
 6bRvJyCdUIDuaqZTZhia2OuHFtQCLYJpJqaTPp2kan/tJArfiC/s3yMQYyuhyznAV7r8dZz49PJeF
 p/xBucRa4sWBip8HZy+KMKEZ4e/iQfY8/dtpHbB5tQal//fdJd/8rwEtMSB14/wUWkajhao6dt6RW
 UQnlZ0nvUTWGwnURc0Gjma2dNjNIYYRZ8zev9djecCoEyhPFWvTNXeakjTg1Z5YEZvae6XuO5ciGn
 Q0L0g9zA==;
Received: from [189.6.16.79] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uEdo6-007LzW-TO; Tue, 13 May 2025 02:53:10 +0200
Date: Mon, 12 May 2025 21:52:54 -0300
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
Subject: Re: [PATCH V9 42/43] drm/amd/display: add 3D LUT colorop
Message-ID: <lyrpq2f7ypi7htircam6o4sd2yfxqnkn4zlre3lbh3ffsbtjcn@onpawcyobyvu>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <20250430011115.223996-43-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430011115.223996-43-alex.hung@amd.com>
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
> This adds support for a 3D LUT.
> 
> The color pipeline now consists of the following colorops:
> 1. 1D curve colorop
> 2. Multiplier
> 3. 3x4 CTM
> 4. 1D curve colorop
> 5. 1D LUT
> 6. 3D LUT
> 7. 1D curve colorop
> 8. 1D LUT
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> ---
> V9:
>  - Return a value in __set_dm_plane_colorop_3dlut
> 
> v8:
>  - Set initialized to 0 and return when drm_lut3d_size is 0 (Harry Wentland)
>  - Rework tf->type = TF_TYPE_BYPASS for shaper (Harry Wentland & Leo Li)
> 
> v7:
>  - Simplify 3D LUT according to drm_colorop changes (Simon Ser)
> 
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 94 +++++++++++++++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 20 ++++
>  2 files changed, 114 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 313716f2003f..dfdd3f557570 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -1293,6 +1293,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
>  	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
>  	const struct drm_color_lut *shaper_lut;
>  	struct drm_device *dev = colorop->dev;
> +	bool enabled = false;
>  	uint32_t shaper_size;
>  	int i = 0, ret = 0;
>  
> @@ -1314,6 +1315,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
>  		ret = __set_output_tf(tf, 0, 0, false);
>  		if (ret)
>  			return ret;
> +		enabled = true;
>  	}
>  
>  	/* 1D LUT - SHAPER LUT */
> @@ -1345,12 +1347,93 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
>  			ret = __set_output_tf(tf, shaper_lut, shaper_size, false);
>  			if (ret)
>  				return ret;
> +			enabled = true;
>  		}
>  	}
>  
> +	if (!enabled)
> +		tf->type = TF_TYPE_BYPASS;
> +
>  	return 0;
>  }
>  
> +/* __set_colorop_3dlut - set DRM 3D LUT to DC stream
> + * @drm_lut3d: user 3D LUT
> + * @drm_lut3d_size: size of 3D LUT
> + * @lut3d: DC 3D LUT
> + *
> + * Map user 3D LUT data to DC 3D LUT and all necessary bits to program it
> + * on DCN accordingly.
> + */
> +static void __set_colorop_3dlut(const struct drm_color_lut *drm_lut3d,
> +				uint32_t drm_lut3d_size,
> +				struct dc_3dlut *lut)
> +{
> +	if (!drm_lut3d_size) {
> +		lut->state.bits.initialized = 0;
> +		return;
> +	}
> +
> +	/* Only supports 17x17x17 3D LUT (12-bit) now */
> +	lut->lut_3d.use_12bits = true;
> +	lut->lut_3d.use_tetrahedral_9 = false;
> +
> +	lut->state.bits.initialized = 1;
> +	__drm_3dlut_to_dc_3dlut(drm_lut3d, drm_lut3d_size, &lut->lut_3d,
> +				lut->lut_3d.use_tetrahedral_9, 12);
> +
> +}
> +
> +static int
> +__set_dm_plane_colorop_3dlut(struct drm_plane_state *plane_state,
> +			     struct dc_plane_state *dc_plane_state,
> +			     struct drm_colorop *colorop)
> +{
> +	struct drm_colorop *old_colorop;
> +	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
> +	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
> +	struct drm_atomic_state *state = plane_state->state;
> +	const struct amdgpu_device *adev = drm_to_adev(colorop->dev);
> +	const struct drm_device *dev = colorop->dev;
> +	const struct drm_color_lut *lut3d;
> +	uint32_t lut3d_size;
> +	int i = 0, ret = 0;
> +
> +	/* 3D LUT */
> +	old_colorop = colorop;
> +	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
> +		if (new_colorop_state->colorop == old_colorop &&
> +		    new_colorop_state->colorop->type == DRM_COLOROP_3D_LUT) {
> +			colorop_state = new_colorop_state;
> +			break;
> +		}
> +	}
> +
> +	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_3D_LUT) {
> +		if (!adev->dm.dc->caps.color.dpp.hw_3d_lut) {

I wonder if this check is no longer accurate in DCN versions with MCM
(MPC only) 3D LUT caps, such as DCN 3.2 and DCN 4.01.

Also, looking back those patches that introduced shaper and blnd tf and
luts, I don't see similar validation, but IIRC shaper caps directly
depends on 3d lut, for example. IIRC something around blnd func caps
also changed in the above-mentioned DCN versions.

Melissa

> +			drm_dbg(dev, "3D LUT is not supported by hardware\n");
> +			return -EINVAL;
> +		}
> +
> +		drm_dbg(dev, "3D LUT colorop with ID: %d\n", colorop->base.id);
> +		lut3d = __extract_blob_lut(colorop_state->data, &lut3d_size);
> +		lut3d_size = lut3d != NULL ? lut3d_size : 0;
> +		__set_colorop_3dlut(lut3d, lut3d_size, &dc_plane_state->lut3d_func);
> +
> +		/* 3D LUT requires shaper. If shaper colorop is bypassed, enable shaper curve
> +		 * with TRANSFER_FUNCTION_LINEAR
> +		 */
> +		if (tf->type == TF_TYPE_BYPASS) {
> +			tf->type = TF_TYPE_DISTRIBUTED_POINTS;
> +			tf->tf = TRANSFER_FUNCTION_LINEAR;
> +			tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
> +			ret = __set_output_tf(tf, NULL, 0, false);
> +		}
> +	}
> +
> +	return ret;
> +}
> +
>  static int
>  __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
>  			     struct dc_plane_state *dc_plane_state,
> @@ -1522,6 +1605,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>  	if (!colorop)
>  		return -EINVAL;
>  
> +	/* 3D LUT */
> +	colorop = colorop->next;
> +	if (!colorop) {
> +		drm_dbg(dev, "no 3D LUT colorop found\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = __set_dm_plane_colorop_3dlut(plane_state, dc_plane_state, colorop);
> +	if (ret)
> +		return ret;
> +
>  	/* 1D Curve & LUT - BLND TF & LUT */
>  	colorop = colorop->next;
>  	if (!colorop) {
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> index 10b3e3906461..e90774294971 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -49,6 +49,8 @@ const u64 amdgpu_dm_supported_blnd_tfs =
>  
>  #define MAX_COLOR_PIPELINE_OPS 10
>  
> +#define LUT3D_SIZE		17
> +
>  int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
>  {
>  	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
> @@ -145,6 +147,24 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>  
>  	i++;
>  
> +	/* 3D LUT */
> +	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +	if (!ops[i]) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		ret = -ENOMEM;
> +		goto cleanup;
> +	}
> +
> +	ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
> +				     DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
> +				     DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	if (ret)
> +		goto cleanup;
> +
> +	drm_colorop_set_next_property(ops[i-1], ops[i]);
> +
> +	i++;
> +
>  	/* 1D curve - BLND TF */
>  	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>  	if (!ops[i]) {
> -- 
> 2.43.0
> 
