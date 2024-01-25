Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D363183CF19
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 23:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F1310E378;
	Thu, 25 Jan 2024 21:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8C710E34A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 21:59:56 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-50eabbc3dccso9203555e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 13:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706219935; x=1706824735; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cgSuxwGL+KbYV8Y0kD0MNceK2EXDJrHqnOsevOqfDUM=;
 b=jry775iz6xpSqvzQaa3qhIRbiq4h+H4mAru6QC72JLkVzRuifHW1SmMZ2FuMLj9Wr6
 DhbLs1Wg2y2PVxjoJkzxcUSVcUtVUUf9xZ7muMG4fJ2tA+L3wMDVv3kpGiC7P2+BqzR+
 lgcIuWQ/l8ESYoUohT/t7V5VCrz8fmxLd7uRBcrXSCn2jBa1/h2R6O5pdNKyIY/R3SV0
 H2GlSUheUdugM3l6pbR6iM7z5EEzSGofYNzGTedr72fFhtILEuKaBPsYaSWgOaCTVBLg
 wpI5ft8+MAMH3+yQp2spKBqQAJZx+C0ISAarvtn4BlRprggIsgCrdh9gyqmhCYG5F6eF
 0Xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706219935; x=1706824735;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cgSuxwGL+KbYV8Y0kD0MNceK2EXDJrHqnOsevOqfDUM=;
 b=gfmne4u4hUuEdvonMHwdaNIh42QJWgfYA/15AFR1LI8bbsSxMg7KVGGrUhmtcJEZC7
 ocBzWVyIcpG1/ISJPH9MylruRZePowF3rAJWmr600wusVkU3erCtlFEpDftFZ0oUTHuz
 T5Yl9EGskRNhm1QJ6W2vbBg2g+NKHfnFU8Rdn2bUcHao0BUlPrLLF0dAPeZRv/jaytAL
 CwGi6/aQWShbIT+sozAu/4dt1v75NlykMZOhObs4dgTPCcVzRq5CU7VY2MBitUNdwkKG
 oNDzorCvL3n00eeKsS0j4t3EoqFGxIRonv91sOCOcPUeB/xRjbi30HzQYnDIl6ogE4e2
 hwQw==
X-Gm-Message-State: AOJu0YwgiRuBoyunsY+2YPk4ps8718DKaLgY68dlp2GvmWCDQOkg0x8f
 QcmlGlPIK9L0ZT/lIr5Cs/kXJI7T8YPC6AkJ+TRbyK97j3DV5w6JCmqmF5XL1G1qaFYYJBnVfw3
 b
X-Google-Smtp-Source: AGHT+IHwZ9f2wn5TlyuXfQu5Ilu3+L0qqCLifkKmuXWnXsL44h7Y3OuVUeYvEQ0bHUK26NOih3rJrA==
X-Received: by 2002:a05:6512:249:b0:510:14cb:79d8 with SMTP id
 b9-20020a056512024900b0051014cb79d8mr143888lfo.79.1706219934702; 
 Thu, 25 Jan 2024 13:58:54 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a056512047200b005101b72b1ffsm302483lfd.117.2024.01.25.13.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 13:58:54 -0800 (PST)
Message-ID: <e587b3e3-aa0a-44d6-a860-253d337397e3@linaro.org>
Date: Thu, 25 Jan 2024 23:58:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/17] drm/msm/dpu: allow certain formats for CDM for DP
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-16-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-16-quic_parellan@quicinc.com>
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
> CDM block supports formats other than H1V2 for DP. Since we are now
> adding support for CDM over DP, relax the checks to allow all other
> formats for DP other than H1V2.
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> index e9cdc7934a499..9016b3ade6bc3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> @@ -186,7 +186,7 @@ static int dpu_hw_cdm_enable(struct dpu_hw_cdm *ctx, struct dpu_hw_cdm_cfg *cdm)
>   	dpu_hw_cdm_setup_cdwn(ctx, cdm);
>   
>   	if (cdm->output_type == CDM_CDWN_OUTPUT_HDMI) {
> -		if (fmt->chroma_sample != DPU_CHROMA_H1V2)
> +		if (fmt->chroma_sample == DPU_CHROMA_H1V2)
>   			return -EINVAL; /*unsupported format */

This means that the original check was incorrect. Please add 
corresponding Fixes tag and move to the top of the patchset.

>   		opmode = CDM_HDMI_PACK_OP_MODE_EN;
>   		opmode |= (fmt->chroma_sample << 1);

-- 
With best wishes
Dmitry

