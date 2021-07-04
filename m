Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D183BACD3
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 13:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F2B89C94;
	Sun,  4 Jul 2021 11:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E3C89C94
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 11:20:35 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id d25so20457063lji.7
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 04:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=seAgOoU8LPGtpTxTwpmp1FR4yyop7y2SFuZwT46eJwc=;
 b=Z+nDpUnEt6sz33EsA0R3Z5EzNfS/oAvRoHu01elFOiPeu8WBtCEVa5H8zWAhc6046g
 JdpVkEYBdb7CBfoBqJQjlknHZbz2UClZphbhLePhI1eiB5HNm3hK6Dbe12JelEpqtXe2
 S8e3Kyk1JwAiRMIFaZE/38SyHdvzjqOs0+n+1T2dGuOcCIQQ2mndsuzIA19vKiMNBrBx
 FZICUpUjhv7zTS2qnnkBOxb8sQCCxMVfLdeV6daAwdvIsrA3kn1F4Wa2IToCUxIPJYxU
 yg92yOERN7YAvCRS+mpbgN+tWJU66//J6v1P4X4tXqbp0q0VZAt+dRZAw5Q08zNur9l0
 M7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=seAgOoU8LPGtpTxTwpmp1FR4yyop7y2SFuZwT46eJwc=;
 b=EWUn9/2DiH99b1ucNIGlHIDU0L3WRBbDzl7X0NwyVd/9S5WBTSc2kz1fI5pWS5619O
 BRjl3UG6YKWn8WaG7FEEyojfJl0lvw0rNn17DSLdu31DU1WeUYhE5BDpk+7KDJrBTgA0
 GTYAZ4+oarNQY/FFr0PvQubBpb6pOEcEmVN06peK9Rht9pou1Jef9aWNSPkAaem7H+J9
 8ceASlfi7aqLXnZ7CVcU3d++NMWhvjoJ0ygyIeGboXiE9/VzRg4emzPxsx1eEUEq5Zr0
 nD2pllQe25UmrfS2NH8z6I4EslUTWT80CTGPhtjlA1VbuG9B0c/KldLXv3vADHMbb9h8
 QukA==
X-Gm-Message-State: AOAM533twEgSN34lCVQwTY3m1Ic2RGXxLpFGF+ZAzG0T3ZEKL1LL02gs
 VsSx152PLJGbd2nMPrpSZz2XtQ==
X-Google-Smtp-Source: ABdhPJy39hs6FGrpOrWNRZYCy7Py48Bb4XBxTqZkOIbcEz90CgBPa1CTHrhWEe03qD+rKSNEDWQo7g==
X-Received: by 2002:a2e:9d48:: with SMTP id y8mr6855431ljj.281.1625397633981; 
 Sun, 04 Jul 2021 04:20:33 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id r15sm1009369ljh.39.2021.07.04.04.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 04:20:33 -0700 (PDT)
Subject: Re: [RFC] drm/msm/disp/dpu1: add support for inline rotation in dpu
 driver
To: Kalyan Thota <kalyan_t@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1625311947-14114-1-git-send-email-kalyan_t@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <850a9dbb-2fec-869c-a87b-fe2261b96e33@linaro.org>
Date: Sun, 4 Jul 2021 14:20:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625311947-14114-1-git-send-email-kalyan_t@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: mkrishn@codeaurora.org, linux-kernel@vger.kernel.org, dianders@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/07/2021 14:32, Kalyan Thota wrote:
> Add inline rotation support in dpu driver. This change adds
> rotation config for SC7280 target.
> 
> Change-Id: I15861dc03422274ffd823fc0fc2c1e47909bb22c
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 47 +++++++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 20 ++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 93 ++++++++++++++++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |  2 +
>   4 files changed, 128 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index d01c4c9..45e4e56 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -25,6 +25,9 @@
>   #define VIG_SM8250_MASK \
>   	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
>   
> +#define VIG_SC7280_MASK \
> +	(VIG_SC7180_MASK | BIT(DPU_SSPP_INLINE_ROTATION))
> +
>   #define DMA_SDM845_MASK \
>   	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
>   	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
> @@ -102,6 +105,8 @@
>   #define MAX_DOWNSCALE_RATIO	4
>   #define SSPP_UNITY_SCALE	1
>   
> +#define INLINE_ROTATOR_V2	2
> +
>   #define STRCAT(X, Y) (X Y)
>   
>   static const uint32_t plane_formats[] = {
> @@ -177,6 +182,11 @@ static const uint32_t plane_formats_yuv[] = {
>   	DRM_FORMAT_YVU420,
>   };
>   
> +static const uint32_t rotation_formats[] = {
> +	DRM_FORMAT_NV12,
> +	/* TODO add formats after validation */
> +};
> +
>   /*************************************************************
>    * DPU sub blocks config
>    *************************************************************/
> @@ -465,7 +475,16 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
>   
>   /* SSPP common configuration */
>   
> -#define _VIG_SBLK(num, sdma_pri, qseed_ver) \
> +static const struct dpu_rotation_cfg dpu_rot_cfg = {
> +	.version = INLINE_ROTATOR_V2,
> +	.rot_maxdwnscale_ratio_num = 1,
> +	.rot_maxdwnscale_ratio_dem = 1,
> +	.rot_maxheight = 1088,
> +	.rot_num_formats = ARRAY_SIZE(rotation_formats),
> +	.rot_format_list = rotation_formats,
> +};
> +
> +#define _VIG_SBLK(num, sdma_pri, qseed_ver, rot_cfg) \
>   	{ \
>   	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
>   	.maxupscale = MAX_UPSCALE_RATIO, \
> @@ -482,6 +501,7 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
>   	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
>   	.virt_format_list = plane_formats, \
>   	.virt_num_formats = ARRAY_SIZE(plane_formats), \
> +	.rotation_cfg = rot_cfg, \
>   	}
>   
>   #define _DMA_SBLK(num, sdma_pri) \
> @@ -498,13 +518,13 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
>   	}
>   
>   static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
> -				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3);
> +				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3, 0);
>   static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
> -				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3);
> +				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3, 0);
>   static const struct dpu_sspp_sub_blks sdm845_vig_sblk_2 =
> -				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3);
> +				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3, 0);
>   static const struct dpu_sspp_sub_blks sdm845_vig_sblk_3 =
> -				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3);
> +				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3, 0);
>   
>   static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK("8", 1);
>   static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK("9", 2);
> @@ -543,7 +563,10 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
>   };
>   
>   static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
> -				_VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED4);
> +				_VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED4, 0);
> +
> +static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
> +				_VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED4, &dpu_rot_cfg);
>   
>   static const struct dpu_sspp_cfg sc7180_sspp[] = {
>   	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
> @@ -557,13 +580,13 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
>   };
>   
>   static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
> -				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
> +				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE, 0);
>   static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
> -				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3LITE);
> +				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3LITE, 0);
>   static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
> -				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3LITE);
> +				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3LITE, 0);
>   static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
> -				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
> +				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE, 0);
>   
>   static const struct dpu_sspp_cfg sm8250_sspp[] = {
>   	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK,
> @@ -585,8 +608,8 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
>   };
>   
>   static const struct dpu_sspp_cfg sc7280_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
> -		sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7280_MASK,
> +		sc7280_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>   	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
>   		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index d2a945a..8421001 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -129,6 +129,7 @@ enum {
>   	DPU_SSPP_TS_PREFILL,
>   	DPU_SSPP_TS_PREFILL_REC1,
>   	DPU_SSPP_CDP,
> +	DPU_SSPP_INLINE_ROTATION,
>   	DPU_SSPP_MAX
>   };
>   
> @@ -309,6 +310,24 @@ struct dpu_qos_lut_tbl {
>   };
>   
>   /**
> + * struct dpu_rotation_cfg - define inline rotation config
> + * @version: Inline rotation version
> + * @rot_maxdwnscale_ratio_num: max downscale ratio for rotation numerator
> + * @rot_maxdwnscale_ratio_dem: max downscale ratio for denominator
> + * @rot_maxheight: max pre rotated height allowed for rotation
> + * @rot_num_formats: count of the formats
> + * @rot_format_list: list of supported rotator formats
> + */
> +struct dpu_rotation_cfg {
> +	u32 version;
> +	u32 rot_maxdwnscale_ratio_num;
> +	u32 rot_maxdwnscale_ratio_dem;
> +	u32 rot_maxheight;
> +	u32 rot_num_formats;
> +	const u32 *rot_format_list;
> +};
> +
> +/**
>    * struct dpu_caps - define DPU capabilities
>    * @max_mixer_width    max layer mixer line width support.
>    * @max_mixer_blendstages max layer mixer blend stages or
> @@ -384,6 +403,7 @@ struct dpu_sspp_sub_blks {
>   	u32 num_formats;
>   	const u32 *virt_format_list;
>   	u32 virt_num_formats;
> +	const struct dpu_rotation_cfg *rotation_cfg;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index ec4a6f0..0daee63 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -539,16 +539,28 @@ static void _dpu_plane_set_scanout(struct drm_plane *plane,
>   
>   static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
>   		struct dpu_plane_state *pstate,
> -		uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
>   		struct dpu_hw_scaler3_cfg *scale_cfg,
>   		const struct dpu_format *fmt,
>   		uint32_t chroma_subsmpl_h, uint32_t chroma_subsmpl_v)
>   {
>   	uint32_t i;
> +	bool inline_rotation = (pstate->rotation & DRM_MODE_ROTATE_90);
> +	uint32_t src_w = drm_rect_width(&pdpu->pipe_cfg.src_rect);
> +	uint32_t src_h = drm_rect_height(&pdpu->pipe_cfg.src_rect);
> +	uint32_t dst_w = drm_rect_width(&pdpu->pipe_cfg.dst_rect);
> +	uint32_t dst_h = drm_rect_height(&pdpu->pipe_cfg.dst_rect);
>   
>   	memset(scale_cfg, 0, sizeof(*scale_cfg));
>   	memset(&pstate->pixel_ext, 0, sizeof(struct dpu_hw_pixel_ext));
>   
> +	/*
> +	 * For inline rotation cases, scaler config is post-rotation,
> +	 * so swap the dimensions here. However, pixel extension will
> +	 * need pre-rotation settings.
> +	 */
> +	if (inline_rotation)
> +		swap(src_w, src_h);
> +
>   	scale_cfg->phase_step_x[DPU_SSPP_COMP_0] =
>   		mult_frac((1 << PHASE_STEP_SHIFT), src_w, dst_w);
>   	scale_cfg->phase_step_y[DPU_SSPP_COMP_0] =
> @@ -587,10 +599,10 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
>   			scale_cfg->preload_y[i] = DPU_QSEED3_DEFAULT_PRELOAD_V;
>   		}
>   
> -		pstate->pixel_ext.num_ext_pxls_top[i] =
> -			scale_cfg->src_height[i];
> -		pstate->pixel_ext.num_ext_pxls_left[i] =
> -			scale_cfg->src_width[i];
> +		pstate->pixel_ext.num_ext_pxls_top[i] = inline_rotation ?
> +			scale_cfg->src_width[i] : scale_cfg->src_height[i];
> +		pstate->pixel_ext.num_ext_pxls_left[i] = inline_rotation ?
> +			scale_cfg->src_height[i] : scale_cfg->src_width[i];
>   	}
>   	if (!(DPU_FORMAT_IS_YUV(fmt)) && (src_h == dst_h)
>   		&& (src_w == dst_w))
> @@ -662,10 +674,6 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
>   	/* don't chroma subsample if decimating */
>   	/* update scaler. calculate default config for QSEED3 */
>   	_dpu_plane_setup_scaler3(pdpu, pstate,
> -			drm_rect_width(&pdpu->pipe_cfg.src_rect),
> -			drm_rect_height(&pdpu->pipe_cfg.src_rect),
> -			drm_rect_width(&pdpu->pipe_cfg.dst_rect),
> -			drm_rect_height(&pdpu->pipe_cfg.dst_rect),
>   			&pstate->scaler3_cfg, fmt,
>   			info->hsub, info->vsub);
>   }
> @@ -959,6 +967,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	const struct dpu_format *fmt;
>   	struct drm_rect src, dst, fb_rect = { 0 };
>   	uint32_t min_src_size, max_linewidth;
> +	unsigned int rotation;
>   
>   	if (new_plane_state->crtc)
>   		crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1028,6 +1037,48 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   		return -E2BIG;
>   	}
>   
> +	rotation = drm_rotation_simplify(new_plane_state->rotation,
> +			    DRM_MODE_ROTATE_0 |
> +			    DRM_MODE_ROTATE_90 |
> +			    DRM_MODE_REFLECT_X |
> +			    DRM_MODE_REFLECT_Y);
> +
> +	if (rotation & DRM_MODE_ROTATE_90) {
> +		struct msm_drm_private *priv = plane->dev->dev_private;
> +		struct dpu_kms *dpu_kms;
> +		const struct msm_format *msm_fmt;
> +		const struct dpu_format *fmt;
> +		bool found = false;
> +		u32 i, num_formats;
> +		const u32 *supported_formats;
> +
> +		if (src.y2 > pdpu->pipe_sblk->rotation_cfg->rot_maxheight) {

Another note: drm_rect_width(&src) rather than src.y2 here.

> +			DPU_DEBUG_PLANE(pdpu,
> +			"invalid height for inline rot:%d max:%d\n",
> +			src.y2, pdpu->pipe_sblk->rotation_cfg->rot_maxheight);
> +			return -EINVAL;
> +		}
> +
> +		/* check for valid formats supported by inline rotation */
> +		dpu_kms = to_dpu_kms(priv->kms);
> +		msm_fmt = msm_framebuffer_format(new_plane_state->fb);
> +		fmt = to_dpu_format(msm_fmt);
> +		supported_formats = pdpu->pipe_sblk->rotation_cfg->rot_format_list;
> +		num_formats = pdpu->pipe_sblk->rotation_cfg->rot_num_formats;
> +
> +		for (i = 0; i < num_formats; i++) {
> +			if (fmt->base.pixel_format == supported_formats[i] &&
> +				fmt->fetch_mode == DPU_FETCH_UBWC)
> +				found = true;
> +		}
> +
> +		if (!found || !num_formats) {
> +			DPU_DEBUG_PLANE(pdpu,
> +			"supported_format not found num:%d\n", num_formats);
> +			return -EINVAL;
> +		}
> +	}
> +	pstate->rotation = rotation;
>   	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
>   
>   	return 0;
> @@ -1153,21 +1204,18 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   				pstate->multirect_mode);
>   
>   	if (pdpu->pipe_hw->ops.setup_format) {
> -		unsigned int rotation;
>   
>   		src_flags = 0x0;
>   
> -		rotation = drm_rotation_simplify(state->rotation,
> -						 DRM_MODE_ROTATE_0 |
> -						 DRM_MODE_REFLECT_X |
> -						 DRM_MODE_REFLECT_Y);
> -
> -		if (rotation & DRM_MODE_REFLECT_X)
> +		if (pstate->rotation & DRM_MODE_REFLECT_X)
>   			src_flags |= DPU_SSPP_FLIP_LR;
>   
> -		if (rotation & DRM_MODE_REFLECT_Y)
> +		if (pstate->rotation & DRM_MODE_REFLECT_Y)
>   			src_flags |= DPU_SSPP_FLIP_UD;
>   
> +		if (pstate->rotation & DRM_MODE_ROTATE_90)
> +			src_flags |= DPU_SSPP_ROT_90;
> +
>   		/* update format */
>   		pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw, fmt, src_flags,
>   				pstate->multirect_index);
> @@ -1578,6 +1626,8 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   	int zpos_max = DPU_ZPOS_MAX;
>   	uint32_t num_formats;
>   	int ret = -EINVAL;
> +	unsigned int supported_rotations = DRM_MODE_ROTATE_0 |
> +			DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
>   
>   	/* create and zero local structure */
>   	pdpu = kzalloc(sizeof(*pdpu), GFP_KERNEL);
> @@ -1647,12 +1697,11 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   	if (ret)
>   		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
>   
> +	if (pdpu->features & BIT(DPU_SSPP_INLINE_ROTATION))
> +		supported_rotations |= DRM_MODE_ROTATE_90;
> +
>   	drm_plane_create_rotation_property(plane,
> -			DRM_MODE_ROTATE_0,
> -			DRM_MODE_ROTATE_0 |
> -			DRM_MODE_ROTATE_180 |
> -			DRM_MODE_REFLECT_X |
> -			DRM_MODE_REFLECT_Y);
> +		    DRM_MODE_ROTATE_0, supported_rotations);
>   
>   	drm_plane_enable_fb_damage_clips(plane);
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index 34e03ac..16ec8dc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -28,6 +28,7 @@
>    * @cdp_cfg:	CDP configuration
>    * @plane_fetch_bw: calculated BW per plane
>    * @plane_clk: calculated clk per plane
> + * @rotation: simplified drm rotation hint
>    */
>   struct dpu_plane_state {
>   	struct drm_plane_state base;
> @@ -45,6 +46,7 @@ struct dpu_plane_state {
>   	struct dpu_hw_pipe_cdp_cfg cdp_cfg;
>   	u64 plane_fetch_bw;
>   	u64 plane_clk;
> +	unsigned int rotation;
>   };
>   
>   /**
> 


-- 
With best wishes
Dmitry
