Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDC2681A29
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 20:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A129310E004;
	Mon, 30 Jan 2023 19:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59C210E043
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 19:17:35 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id p26so23612007ejx.13
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 11:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VraYRGi48M13efgjQcov3Fg2IFzr+fWigVm5w2musCU=;
 b=YM9OzZWcEHlkVPZrFF3kUeF9nLjSyb3Nb2gAcmIKxL+mk0zAniYeXaFe//0LcMhwhD
 GAN5+09mkI/hqJLV4iZmKgk8iW2B2rqSyTybENSildSFQXCSXxOpA8xDmlx8dgzecyK3
 83pcJkFNXasDggLkkDTLS3dRlegOmN2Z9jGRFkGiuFXjQcd/MGGikCtG1J3R08Lzyw0s
 Gkt5VT4yRy6XD3AvKktyvARcXiaJHgnxxyx3uQdYy3lKMMflmmHzjkiZSzmTyKjKX6c0
 7z7xo+JkdmitDJ8xjHjXRFfuvy+gCG8ssfKxgbgypURgoi5lUleOLXrlKRI6cRdxxaQo
 1/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VraYRGi48M13efgjQcov3Fg2IFzr+fWigVm5w2musCU=;
 b=mtjgfUnLybEIBb6GHV1CWxzQ6ZVTVfH1dlcmu1fPBggnzX6m/6ktRMEGKbp4UWMaaG
 ouTJH5ilKaSPOrKBHMAkmlrz6I3Y9K2bwtDNsJS2AnXVBXs4mUCsarZ/8Gs2anhCHS5L
 +ijRxiQbPYHaOAPisclYxkUwOFXbCU0tlM0igOb3mGCFDsjYsNp4UzbWJaDCNr5RauYH
 R6wD6jmKVw49Opc6nIv3hqt0B3aEjY8P6mSikeG1bWohy3FmJpJ04f4+Bwbbf+lgebpz
 kxSylaMyA/FiFpl3GDSTfT4r43eFlmK5NXVhWJthzBpyaBHfXCdd2AjsYbkn4sx8L+23
 iaTQ==
X-Gm-Message-State: AO0yUKUL6MSRJw++G/facxHEYuv4f02gPRq2aEUehNu72S3W+D50zgV1
 OXxLM8bT5gK1hqTsY5LBz6yXyw==
X-Google-Smtp-Source: AK7set+fi4JDOTUE1SqIlnoux+VpyqYVS5nJXqZ0xs/dTDOC/j1+4TIq98GdnBbFisqgWO/jspnQLA==
X-Received: by 2002:a17:906:3a82:b0:873:2612:e12c with SMTP id
 y2-20020a1709063a8200b008732612e12cmr744302ejd.21.1675106254068; 
 Mon, 30 Jan 2023 11:17:34 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a170906594e00b00857c2c29553sm7321373ejr.197.2023.01.30.11.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 11:17:33 -0800 (PST)
Message-ID: <01f61ae7-dfa0-6c21-d1ac-3ae428c3f5e2@linaro.org>
Date: Mon, 30 Jan 2023 21:17:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [v1 3/3] drm/msm/disp/dpu1: reserve the resources on topology
 change
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1675092092-26412-1-git-send-email-quic_kalyant@quicinc.com>
 <1675092092-26412-4-git-send-email-quic_kalyant@quicinc.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1675092092-26412-4-git-send-email-quic_kalyant@quicinc.com>
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com,
 marijn.suijten@somainline.org, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/01/2023 17:21, Kalyan Thota wrote:
> Some features like ctm can be enabled dynamically. Release and reserve
> the dpu resources whenever a topology change occurs such that
> required hw blocks are allocated appropriately.
> 
> Changes in v1:
> - Avoid mode_set call directly instead change the mode_changed (Dmitry)

Thanks, I like the overall idea. Minor nits below.

Also, could you please fix your scripts to include the PATCH keyword 
into the subject? If you do `git format-patches -# -v#`, where # is the 
number of commits to include and the version of the patchset, it will do 
the trick on its own.

> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 42 ++++++++++++++++++-----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++-
>   3 files changed, 32 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 539b68b..58e8c72 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -204,6 +204,7 @@ struct dpu_crtc {
>    * @hw_ctls       : List of active ctl paths
>    * @crc_source    : CRC source
>    * @crc_frame_skip_count: Number of frames skipped before getting CRC
> + * @ctm_enabled   : Cached ctm reservation state

Nit: we do not reserve CTMs. We reserve DSPPs.
So, ctm_enabled is 'Cached color management enablement state'.

>    */
>   struct dpu_crtc_state {
>   	struct drm_crtc_state base;
> @@ -225,6 +226,7 @@ struct dpu_crtc_state {
>   
>   	enum dpu_crtc_crc_source crc_source;
>   	int crc_frame_skip_count;
> +	bool ctm_enabled;
>   };
>   
>   #define to_dpu_crtc_state(x) \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 3bd46b4..0ddf2c9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -217,6 +217,22 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>   	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>   };
>   
> +static bool _dpu_enc_is_dspps_changed(struct drm_crtc_state *crtc_state,
> +	struct msm_display_topology topology)
> +{
> +	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
> +
> +	if (drm_atomic_crtc_needs_modeset(crtc_state))
> +		return true;
> +
> +	if ((cstate->ctm_enabled && !topology.num_dspp) ||
> +	    (!cstate->ctm_enabled && topology.num_dspp)) {
> +		crtc_state->mode_changed = true;
> +		return true;
> +	}
> +
> +	return false;
> +}
>   
>   bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
>   {
> @@ -638,25 +654,21 @@ static int dpu_encoder_virt_atomic_check(
>   		if (ret) {
>   			DPU_ERROR_ENC(dpu_enc,
>   					"mode unsupported, phys idx %d\n", i);
> -			break;
> +			return ret;

This deserves a separate commit with the proper Fixes: tag.

>   		}
>   	}
>   
>   	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
>   
> +	_dpu_enc_is_dspps_changed(crtc_state, topology);
> +
>   	/* Reserve dynamic resources now. */
> -	if (!ret) {
> -		/*
> -		 * Release and Allocate resources on every modeset
> -		 * Dont allocate when active is false.
> -		 */
> -		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> -			dpu_rm_release(global_state, drm_enc);
> +	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> +		dpu_rm_release(global_state, drm_enc);
>   
> -			if (!crtc_state->active_changed || crtc_state->active)
> -				ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> -						drm_enc, crtc_state, topology);
> -		}
> +		if (crtc_state->enable)
> +			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> +					drm_enc, crtc_state, topology);
>   	}
>   
>   	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
> @@ -1027,7 +1039,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>   	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
>   	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> -	int num_lm, num_ctl, num_pp, num_dsc;
> +	int num_lm, num_ctl, num_pp, num_dsc, num_dspp;
>   	unsigned int dsc_mask = 0;
>   	int i;
>   
> @@ -1058,7 +1070,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
>   	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>   		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> -	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>   		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
>   		ARRAY_SIZE(hw_dspp));
>   
> @@ -1089,7 +1101,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   	}
>   
>   	cstate->num_mixers = num_lm;
> -
> +	cstate->ctm_enabled = !!num_dspp;
>   	dpu_enc->connector = conn_state->connector;
>   
>   	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 9e7236e..4cbe20c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -150,8 +150,10 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>    * dpu_encoder_prepare_commit - prepare encoder at the very beginning of an
>    *	atomic commit, before any registers are written
>    * @drm_enc:    Pointer to previously created drm encoder structure
> + * @crtc_state: Pointer to drm crtc state
>    */
> -void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc);
> +void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc,
> +		struct drm_crtc_state *crtc_state);

I think this change on it's own breaks compilation. Please drop it.

>   
>   /**
>    * dpu_encoder_set_idle_timeout - set the idle timeout for video

-- 
With best wishes
Dmitry

