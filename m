Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AE1735F3B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 23:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC9810E15C;
	Mon, 19 Jun 2023 21:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5E210E15C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 21:30:30 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b46a06c553so36581131fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 14:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687210228; x=1689802228;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q/v4jKV/v/ss0UgkWSkSr35lDQPiYbm4goSyQ755oto=;
 b=MlAcH3K9STzJq9DVgte/xtOcbBQcaFntPvVsv8v7mJZBV6JWVfXm+zu8RmdPxMlCgO
 5/7QWYwcn9XuGk+7h6CMH92f/jaAw3AhOxjdro/2OAM9wLRb3nb+LRzWvczRde0xCI7N
 i+AAQmPlfJyZrur4euTJwHEZKlbHMux1IziygrbWvQW1HZUCrU+wy3xeiqvfSOPr91rj
 t6YE+jnxKjFoxYIPTC2r4aKboqO0r0/Q5BvsP7jr9hN9jESWQW98uqPBrXtTtv+prAj0
 UUyspVBdbrJdaGmIcwQo9lH4Ms7ydU5vDzYpzdIAOdAgDr6p5VezbKiArSbV5CBBuw0Z
 RD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687210228; x=1689802228;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q/v4jKV/v/ss0UgkWSkSr35lDQPiYbm4goSyQ755oto=;
 b=Tzbxj3mQ+nkLd7BvJk32/zu8cyymArywMDprPilFU6RDfG6B9ACfyRe1vjETOx6DLZ
 W3wAhyMO91NSqqBOZ83DQr8gC7ffS1r4Ff0U26u3KePerDOPe0hr1Jj18t00lCXxH4LA
 vXfpGl0n7OxVR/Uv1aSnCAHs86WG1ObaeVMESsg4aahf25iCmQHVtWvD8cwniJKcaTcM
 uEscOl2jAb8nIipU1VvwgycupYaw+6ayepXF+2tOpbEjZQU3E+erDT5b+j9BorWVdvcl
 R4rTJsntBscGGmpfsEtnlqkQZVfUX5+SYnahq0Iio/PGfiC6ipkAG1U3EaY7ZJUovJ21
 qjDQ==
X-Gm-Message-State: AC+VfDzZ0OoZEMQzNCcRAa/Hrbs6/bVvUxwcMUiGr6D30QlZty5khukY
 NLd8jBCEo9VlZ06RIfiP5Moqww==
X-Google-Smtp-Source: ACHHUZ4o6dh5B2/cPLw+tC3fwf7EALethpsMM/RIRU+zmsmR1VvQNW66C59wPLdtGAiedCPoLkt0XQ==
X-Received: by 2002:a2e:9056:0:b0:2b4:76a8:bb97 with SMTP id
 n22-20020a2e9056000000b002b476a8bb97mr2374523ljg.14.1687210227840; 
 Mon, 19 Jun 2023 14:30:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a2e9990000000b002a8ae16ac8csm64180lji.18.2023.06.19.14.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 14:30:27 -0700 (PDT)
Message-ID: <bba3c566-5ec3-79ca-96cf-2a7d3133831e@linaro.org>
Date: Tue, 20 Jun 2023 00:30:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/2] drm/msm/dpu: retrieve DSI DSC struct through
 priv->dsi[0]
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1686694742-20862-1-git-send-email-quic_khsieh@quicinc.com>
 <1686694742-20862-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1686694742-20862-2-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/06/2023 01:19, Kuogee Hsieh wrote:
> Currently struct drm_dsc_config for DSI is populated at display
> setup during system boot up. This mechanism works fine with
> embedded display but not for pluggable displays as the
> struct drm_dsc_config will become stale once external display
> is unplugged.
> 
> Move storing of DSI DSC struct to atomic_enable() so that same
> mechanism will work for both embedded display and pluggable
> displays.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 42 ++++++++++++++++++++---------
>   1 file changed, 30 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 2e1873d..e00cd39 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -543,11 +543,24 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>   	return (num_dsc > 0) && (num_dsc > intf_count);
>   }
>   
> +static struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
> +{
> +	struct msm_drm_private *priv = drm_enc->dev->dev_private;
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	int index = dpu_enc->disp_info.h_tile_instance[0];
> +
> +        if (dpu_enc->disp_info.intf_type == INTF_DSI)
> +		return msm_dsi_get_dsc_config(priv->dsi[index]);

Wrong indentation.

> +
> +	return NULL;
> +}
> +				

A string of 4 tabs causes checkpatch.pl to report an error.

>   static struct msm_display_topology dpu_encoder_get_topology(
>   			struct dpu_encoder_virt *dpu_enc,
>   			struct dpu_kms *dpu_kms,
>   			struct drm_display_mode *mode,
> -			struct drm_crtc_state *crtc_state)
> +			struct drm_crtc_state *crtc_state,
> +			struct drm_dsc_config *dsc)
>   {
>   	struct msm_display_topology topology = {0};
>   	int i, intf_count = 0;
> @@ -579,7 +592,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   
>   	topology.num_intf = intf_count;
>   
> -	if (dpu_enc->dsc) {
> +	if (dsc) {
>   		/*
>   		 * In case of Display Stream Compression (DSC), we would use
>   		 * 2 DSC encoders, 2 layer mixers and 1 interface
> @@ -605,6 +618,7 @@ static int dpu_encoder_virt_atomic_check(
>   	struct drm_display_mode *adj_mode;
>   	struct msm_display_topology topology;
>   	struct dpu_global_state *global_state;
> +	struct drm_dsc_config *dsc;
>   	int i = 0;
>   	int ret = 0;
>   
> @@ -640,7 +654,9 @@ static int dpu_encoder_virt_atomic_check(
>   		}
>   	}
>   
> -	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
> +	dsc = dpu_encoder_get_dsc_config(drm_enc);
> +
> +	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
>   
>   	/*
>   	 * Release and Allocate resources on every modeset
> @@ -1072,14 +1088,12 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
>   						: NULL;
>   
> -	if (dpu_enc->dsc) {
> -		num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -							drm_enc->base.id, DPU_HW_BLK_DSC,
> -							hw_dsc, ARRAY_SIZE(hw_dsc));
> -		for (i = 0; i < num_dsc; i++) {
> -			dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
> -			dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
> -		}
> +	num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +						drm_enc->base.id, DPU_HW_BLK_DSC,
> +						hw_dsc, ARRAY_SIZE(hw_dsc));
> +	for (i = 0; i < num_dsc; i++) {
> +		dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
> +		dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
>   	}
>   
>   	dpu_enc->dsc_mask = dsc_mask;
> @@ -1187,6 +1201,8 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>   
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
>   
> +	dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
> +
>   	mutex_lock(&dpu_enc->enc_lock);
>   	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
>   
> @@ -2109,8 +2125,10 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>   					phys_enc->hw_pp->merge_3d->idx);
>   	}
>   
> -	if (dpu_enc->dsc)
> +	if (dpu_enc->dsc) {
>   		dpu_encoder_unprep_dsc(dpu_enc);
> +		dpu_enc->dsc = NULL;
> +	}
>   
>   	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>   	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);

-- 
With best wishes
Dmitry

