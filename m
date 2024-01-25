Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446A383CF1E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 23:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECBB10E3F7;
	Thu, 25 Jan 2024 22:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C3B10E3F7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 22:02:34 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-50e7d6565b5so9148515e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 14:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706220093; x=1706824893; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N1c30FraN5NBmhRkY7x/gyWQbLWA0MDZZ+3VKQqjtk8=;
 b=QihpKA2hJ3FZwYfrzWNasPkJr/g1PWxn2BXfXxiUcC43j0a9qeWs1sQ926J46DCtlN
 ezz+KkDR8617aiN7GjA1xelDxqqthbSYFm7xTGcLc2LKiEXPv+ays8LRXABQ+dP5q+Oz
 D25ssgzBRS3S3c17Y0h45Hp5X4L+PWV35VWy4cCc7orCXvo61uR/fdAFIl6YMYXAYMrK
 tUDBMediPnb7mEfYvueyPl3ZKM7fFzdWjUJl358BdRtg15h6Ri3qC8Nt/mAqTdGNzgty
 sR2lF4+FkiwsVGItp9BxGj6Uj0JB3w/MYItz3q/69WiN/SUqIN7oAiVM9tWR3v/hepfv
 CibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706220093; x=1706824893;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N1c30FraN5NBmhRkY7x/gyWQbLWA0MDZZ+3VKQqjtk8=;
 b=YuM4Qe7o8h9X5Uc61zXNh+wdbaTgWI+3qo1VZIHcJ+YJT+h7r5NvorBwjpr57+cJ+c
 K4GTn76Qxbr5fqr8GlmNZjiKXfzG0eJ27tdqg6AKk54dAfJe5+4WFiQP3y/rDtPWK/El
 OrVya9KggizPhVWMTc0/pAVIx5XRvKgYYm/nJQABHZEA7ePCCG1CZnU6avvSX/iA9Au3
 pBNbn2oGBjlD4/Gt5mUVyTjRoDDbVX/vY9emltInHcWCcNdolr0mRL1bbl7vcCTDrwGE
 CX4zy3fnwCYrc+sKi9kX4tpWRzKlAylKGocA+lCf7BjXY1FvWhdAuSsFNUVDnEFzcHG+
 fy3A==
X-Gm-Message-State: AOJu0YypezHET/xdDXxvp+XDa1LTJofn1oaBnRBcRgD1YfBU03IzGXFB
 0FhCaorguS9IhM1FToPG//vfFVhdVeHFZKJIN8DrsJS6xqPff0Nd8q1uJoRyebw=
X-Google-Smtp-Source: AGHT+IERGRBYPlv5GM7pjTZeMCQZyP9iUdk1BpZBZTLpdtFxDQwwAqLMfXFEBNTt9NG+/34Z7ZQKhw==
X-Received: by 2002:a05:6512:ad3:b0:510:121d:939e with SMTP id
 n19-20020a0565120ad300b00510121d939emr326792lfu.36.1706220093184; 
 Thu, 25 Jan 2024 14:01:33 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a19c50b000000b005101ea5ca1csm225562lfe.178.2024.01.25.14.01.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 14:01:32 -0800 (PST)
Message-ID: <2d9bbcf8-e292-49e7-a357-f421438c2bf1@linaro.org>
Date: Fri, 26 Jan 2024 00:01:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] drm/msm/dpu: reserve CDM blocks for DP if mode is
 YUV420
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-17-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-17-quic_parellan@quicinc.com>
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/01/2024 21:38, Paloma Arellano wrote:
> Reserve CDM blocks for DP if the mode format is YUV420. Currently this
> reservation only works for writeback and DP if the format is YUV420. But
> this can be easily extented to other YUV formats for DP.
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 +++++++++++++-------
>   1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 99ec53446ad21..c7dcda3d54ae6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -613,6 +613,7 @@ static int dpu_encoder_virt_atomic_check(
>   	struct dpu_kms *dpu_kms;
>   	struct drm_display_mode *adj_mode;
>   	struct msm_display_topology topology;
> +	struct msm_display_info *disp_info;
>   	struct dpu_global_state *global_state;
>   	struct drm_framebuffer *fb;
>   	struct drm_dsc_config *dsc;
> @@ -629,6 +630,7 @@ static int dpu_encoder_virt_atomic_check(
>   	DPU_DEBUG_ENC(dpu_enc, "\n");
>   
>   	priv = drm_enc->dev->dev_private;
> +	disp_info = &dpu_enc->disp_info;
>   	dpu_kms = to_dpu_kms(priv->kms);
>   	adj_mode = &crtc_state->adjusted_mode;
>   	global_state = dpu_kms_get_global_state(crtc_state->state);
> @@ -656,8 +658,8 @@ static int dpu_encoder_virt_atomic_check(
>   	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
>   
>   	/*
> -	 * Use CDM only for writeback at the moment as other interfaces cannot handle it.
> -	 * if writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
> +	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
> +	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
>   	 * earlier.
>   	 */
>   	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
> @@ -665,12 +667,15 @@ static int dpu_encoder_virt_atomic_check(
>   
>   		if (fb && DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))))
>   			topology.needs_cdm = true;
> -		if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> -			crtc_state->mode_changed = true;
> -		else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> -			crtc_state->mode_changed = true;
> +	} else if (dpu_enc->disp_info.intf_type == INTF_DP) {

You can use disp_info directly here.

> +		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
> +			topology.needs_cdm = true;
>   	}
>   
> +	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> +		crtc_state->mode_changed = true;
> +	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> +		crtc_state->mode_changed = true;
>   	/*
>   	 * Release and Allocate resources on every modeset
>   	 * Dont allocate when active is false.
> @@ -1111,7 +1116,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   
>   	dpu_enc->dsc_mask = dsc_mask;
>   
> -	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
> +	if ((dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) ||
> +	    dpu_enc->disp_info.intf_type == INTF_DP) {
>   		struct dpu_hw_blk *hw_cdm = NULL;
>   
>   		dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,

-- 
With best wishes
Dmitry

