Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED786EA09C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 02:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B739010ED6B;
	Fri, 21 Apr 2023 00:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0274710ED6B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 00:27:42 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4eed6ddcae1so4892188e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 17:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682036861; x=1684628861;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m0hguSLcEhIJjKI9l7bUfGJDhsIX62v6X4BxLPgYVVg=;
 b=EtBcWOvWA9eoxdYEngxgKW+zyiQfr3a/swgMrgcwCvOTf2G+faAxKThzXliGTFbxvW
 Of4EwSrk1E9l1ojBrSXHQzjX+OYl+XqqctCdL3yBs1FvvpYfbfIdFoJnOHzNK5bX+THT
 SKoonmZtNHpw7UvZ5aTrnOEw0Qe1uZYjUHl/mvEv+V4D9vYukuflV6OpnbxHqGU0nQTO
 b0NTicCOA02fNw2zGUZOzLaOnq6wWbG9e36XuyGaqngXXt4LnYNRyg8OfmQT4YHRFPeW
 p1xua1iSCud34MeaxgPMLkUDTg2DYPNHq2AlyXmwroVFwpvLvP9P4gqDM6Z6yBqrbz91
 o9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682036861; x=1684628861;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m0hguSLcEhIJjKI9l7bUfGJDhsIX62v6X4BxLPgYVVg=;
 b=eMnNQIjpXhMXB3d8y4DO1ry16OSzJdULcQ9FwZoBMbIeliblBNEHh026QJZlbWkho0
 VlCGKwwcGghz5MJ2hb2bLw0SKWdIhWqdkpW75cE4nj0gmXEaWeZb2ae5mUd/tJq0VblC
 uOPGOR5mhBE0R/fbemLemTEaTetQyw2sM1d0XKCMQ6V4xwP25oU4m9VYof3trpyjzkac
 Dtwey/ZJEqZmQcHuXBjpH10KLhLY0Yehvpq5YLTawMmolfNbleeTrzY+Rrj9YOfKx42W
 quCifbT4FUI5t8CWgM/2TI7ODvkovH76D/kxX7RX+0NWR0sNv8TPRr5033plTRCXIZTi
 efRw==
X-Gm-Message-State: AAQBX9fvp7vHkXK5yu/xalCo66gOsx4TZDCNflKg4ebW/9ZXCdlXv9vY
 ON/gZ6EQ0StTiGGZKdskfCrYpQ==
X-Google-Smtp-Source: AKy350aStGiCG685IPf4NgeK8Bkv2nyoik3qeoVlBzvFsCPbWN+HNpCTFCgM/UoCcsEx8w2KHGp0rA==
X-Received: by 2002:a2e:aaa3:0:b0:2a8:ea1f:428c with SMTP id
 bj35-20020a2eaaa3000000b002a8ea1f428cmr99257ljb.23.1682036861058; 
 Thu, 20 Apr 2023 17:27:41 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t28-20020ac243bc000000b004edd5f7f297sm376111lfl.28.2023.04.20.17.27.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 17:27:40 -0700 (PDT)
Message-ID: <c8089d0f-c8cd-6a24-718f-682145d04f02@linaro.org>
Date: Fri, 21 Apr 2023 03:27:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 4/5] drm/msm/dpu: calculate DSC encoder parameters
 dynamically
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1682033114-28483-1-git-send-email-quic_khsieh@quicinc.com>
 <1682033114-28483-5-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1682033114-28483-5-git-send-email-quic_khsieh@quicinc.com>
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

On 21/04/2023 02:25, Kuogee Hsieh wrote:
> During DSC preparation, add run time calculation to figure out what
> usage modes, split mode and merge mode, is going to be setup.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 56 ++++++++++++++++-------------
>   1 file changed, 32 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 2fdacf1..5677728 100644
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
> @@ -1861,41 +1853,57 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>   	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
>   	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>   	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> +	struct msm_display_topology *topology = &dpu_enc->topology;
>   	int this_frame_slices;
>   	int intf_ip_w, enc_ip_w;
> -	int dsc_common_mode;
> +	int dsc_common_mode = 0;
>   	int pic_width;
>   	u32 initial_lines;
> +	int num_dsc, num_intf;
>   	int i;
>   
>   	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
>   		hw_pp[i] = dpu_enc->hw_pp[i];
>   		hw_dsc[i] = dpu_enc->hw_dsc[i];
> -
> -		if (!hw_pp[i] || !hw_dsc[i]) {
> -			DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
> -			return;
> -		}

Why?

>   	}
>   
> -	dsc_common_mode = 0;
> +	num_dsc = topology->num_dsc;
> +	num_intf = topology->num_intf;
> +
>   	pic_width = dsc->pic_width;
>   
> -	dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
>   	if (enc_master->intf_mode == INTF_MODE_VIDEO)
>   		dsc_common_mode |= DSC_MODE_VIDEO;
>   
> +	/*
> +	 * If this encoder is driving more than one DSC encoder, they
> +	 * operate in tandem, same pic dimension needs to be used by
> +	 * each of them.(pp-split is assumed to be not supported)
> +	 *
> +	 */
> +
>   	this_frame_slices = pic_width / dsc->slice_width;
>   	intf_ip_w = this_frame_slices * dsc->slice_width;
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

So do you want to get enc_ip_w / 2 or enc_ip_w / num_intf / 2 here?

> +	}
>   
> -	/*
> -	 * dsc merge case: when using 2 encoders for the same stream,
> -	 * no. of slices need to be same on both the encoders.
> -	 */
> -	enc_ip_w = intf_ip_w / 2;
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

