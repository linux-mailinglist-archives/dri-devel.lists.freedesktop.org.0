Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7DF6F21BE
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 02:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE2010EE28;
	Sat, 29 Apr 2023 00:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A3B10E126
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 00:52:44 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f19a7f9424so2782495e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 17:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682729563; x=1685321563;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=odbWTHvPupJsrWX9nKBm/60qI9CmVHX02UWj5e0Xtv8=;
 b=UvPI9fRe8oME5O5kIwsyFrQbHJwkjuvRWaN3KgAu7FKrWFcslgm1XC4adL07RM2Gec
 XIudlJclAGHCQzoQ5kL/Gui1RgB1+HstbbWTN5g0JtWvqN8NxzH2Qv8S+ay8h587/Fxe
 kMJ87Kes3zbsYdNUub4WmU1wQ1RzCv9EeOqfh0V/t0EbCrdwg3eeLPNTOJ4I77+GlxBn
 5aFXFOuREKzE5tFYQdU6o27oaiHTd+nIZyocsi9GwbaBUXPgsJX3fH2uYjb2BVTXzNww
 wiHobuIJ40osmMtPcCVjoLzbBP+dgLp5UrlEkXpRn+BYlUge69Qk4MqQRS0rLgFyNki0
 QpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682729563; x=1685321563;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=odbWTHvPupJsrWX9nKBm/60qI9CmVHX02UWj5e0Xtv8=;
 b=NTzU37AL+u4x9TchYcS8n9osCOFL3IEf7+oke/8X2BjXl1bHIr1GocwXyXoz6DoQi2
 90O4ZRr/jHGcSzmTJVF1jnU3Q2uoTvxiR8TuQ+02QLoXXdk2qkpIWhAC+ibJxJieBWOx
 H6PwOMEb1+3+lRHp3sbFIC8tmproPva5of7dACfbZSJOf6iXTTsXS4MHZCqfTgi0G2sn
 vz7PJ43uZDIouOMMMCGqfTUXifSKNwdwb/7mfxgrZwKJKj4VS+YlkRilI4iUfv/EJPFD
 nkF4ftin+/AO7q7FOVcyHGHe10YRLV7NljsnRbPZurzDDP4SMYQw2oOv/+0o4SAoI11m
 X/OQ==
X-Gm-Message-State: AC+VfDy/FKf5cC+gewHZHfZtrAOvqCpr/wqaSwd7HNpwIrw70lkWjmLR
 /vn5uH/09tBNb6lq3cWVVMa/MA==
X-Google-Smtp-Source: ACHHUZ7e2nsdZ6R/dM7+0BADPJikZexZncNI67KBMzTFMqCwQ2I95Y6B+WuW00CKN3woJsDEmVM+Lg==
X-Received: by 2002:a1c:f305:0:b0:3f1:93c2:4df7 with SMTP id
 q5-20020a1cf305000000b003f193c24df7mr5242363wmq.5.1682729562853; 
 Fri, 28 Apr 2023 17:52:42 -0700 (PDT)
Received: from [10.5.118.67] ([81.145.206.52])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a7bc44e000000b003f195d2f1a9sm21277897wmi.15.2023.04.28.17.52.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 17:52:42 -0700 (PDT)
Message-ID: <51edf131-8fe0-2187-a4ba-744cc0c81a99@linaro.org>
Date: Sat, 29 Apr 2023 03:52:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 7/7] drm/msm/dpu: calculate DSC encoder parameters
 dynamically
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
 <1682725511-18185-8-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1682725511-18185-8-git-send-email-quic_khsieh@quicinc.com>
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
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/04/2023 02:45, Kuogee Hsieh wrote:
> During DSC preparation, add run time calculation to figure out what
> usage modes, split mode and merge mode, is going to be setup.

This patch doesn't determine the mode. It changes programming of DSC 
bits according to the mode being selected.

> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 56 ++++++++++++++++-------------
>   1 file changed, 31 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 2fdacf1..3d18642 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -529,17 +529,9 @@ void dpu_encoder_helper_split_config(
>   bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>   {
>   	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> -	int i, intf_count = 0, num_dsc = 0;
> +	struct msm_display_topology *topology = &dpu_enc->topology;
>   
> -	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> -		if (dpu_enc->phys_encs[i])
> -			intf_count++;
> -
> -	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
> -	if (dpu_enc->dsc)
> -		num_dsc = 2;
> -
> -	return (num_dsc > 0) && (num_dsc > intf_count);
> +	return (topology->num_dsc > topology->num_intf);
>   }
>   
>   static void dpu_encoder_get_topology(
> @@ -1861,41 +1853,55 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>   	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
>   	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>   	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> -	int this_frame_slices;
> +	struct msm_display_topology *topology = &dpu_enc->topology;
>   	int intf_ip_w, enc_ip_w;
> -	int dsc_common_mode;
> -	int pic_width;
> +	int dsc_common_mode = 0;

Please don't top-init variables unless required (or unless they are 
constant).

>   	u32 initial_lines;
> +	int num_dsc = topology->num_dsc;
> +	int num_intf = topology->num_intf;
>   	int i;
>   
> -	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> +	for (i = 0; i < num_dsc; i++) {
>   		hw_pp[i] = dpu_enc->hw_pp[i];
>   		hw_dsc[i] = dpu_enc->hw_dsc[i];
>   
>   		if (!hw_pp[i] || !hw_dsc[i]) {
>   			DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
>   			return;
> -		}
> +		}

What is the difference here?

>   	}
>   
> -	dsc_common_mode = 0;
> -	pic_width = dsc->pic_width;
> +	intf_ip_w = dsc->pic_width;
>   
> -	dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
>   	if (enc_master->intf_mode == INTF_MODE_VIDEO)
>   		dsc_common_mode |= DSC_MODE_VIDEO;
>   
> -	this_frame_slices = pic_width / dsc->slice_width;
> -	intf_ip_w = this_frame_slices * dsc->slice_width;
> -
>   	/*
> -	 * dsc merge case: when using 2 encoders for the same stream,
> -	 * no. of slices need to be same on both the encoders.
> +	 * If this encoder is driving more than one DSC encoder, they
> +	 * operate in tandem, same pic dimension needs to be used by
> +	 * each of them.(pp-split is assumed to be not supported)
> +	 *

Extra empty line. Also the comment doesn't make sense here anymore. We 
already have comment for the division by two below.

>   	 */
> -	enc_ip_w = intf_ip_w / 2;
> +	enc_ip_w = intf_ip_w;
> +
> +	intf_ip_w /= num_intf;
> +
> +	if (num_dsc > 1)
> +		dsc_common_mode |= DSC_MODE_SPLIT_PANEL;
> +
> +	if (dpu_encoder_use_dsc_merge(&dpu_enc->base)) {
> +		dsc_common_mode |= DSC_MODE_MULTIPLEX;
> +		/*
> +		 * in dsc merge case: when using 2 encoders for the same
> +		 * stream, no. of slices need to be same on both the
> +		 * encoders.
> +		 */
> +		enc_ip_w = intf_ip_w / 2;
> +	}
> +
>   	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
>   
> -	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +	for (i = 0; i < num_dsc; i++)
>   		dpu_encoder_dsc_pipe_cfg(dpu_enc, hw_dsc[i], hw_pp[i], dsc,
>   					dsc_common_mode, initial_lines);
>   }

-- 
With best wishes
Dmitry

