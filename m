Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB6854DCFF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 10:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F14113A10;
	Thu, 16 Jun 2022 08:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B2C113A04
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 08:36:31 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id r24so736856ljn.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 01:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6388miRoWIYT9dGyAUk+0Vfnm67yqSa2KGN9cxoVxYU=;
 b=HPTjmcdXqAHOb+/kWhdDRqPWnxjuqGaPWvNOUqqoZxlz/Ok1yJTLxulryBj58j0dgV
 tH54KxkCCJaMpsLBfv3FTfaMtQjDKGq0hYGO6YbpaglFabQd7BxaUhPkgZ8zTm6I63NU
 Eoe2UrH14znnPgvS+L/r/Cu6Q8/HhHZhRxrOyx4eE9tPy4XrV/JK8h1Af0AC58FqfKMX
 Pt+jNodkC+Qhl0Tu246EiWrWzHDKnIsPW45yL1nvz7GH6vrDMl6I198g0tnjOShwO2Rz
 f4dH4tkU0OhaoG1pfm/ScdGZU8Pxpc987PZ59/ZvV+C69mWEXkVFVL3l1KuAI26YSMEh
 MfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6388miRoWIYT9dGyAUk+0Vfnm67yqSa2KGN9cxoVxYU=;
 b=dpE8wHPngcjGx8yCxoTRqWyuRssMEtsbK75CjsohGcUbVT+Yth8oKZyjwr45wliZSd
 D0wUvQ3VR9D8w3ELs8DFPKetTBth9cWIEbDXn0hSaqdoDQcrpkpyQ1BzpRhWUtC1eyNc
 LaNZ/R7VPcXD1Ct6/23wSDaaQpHZfPo/PDkLwYayOqrbqWtWIOgPQHVDIBpaqwq/5WEp
 8VpETZPFweHGpKIqI3PeUZ8TSAOsdWrcmYuv0yu3DhNvJm+HSlpW9uTXUl2BY6bAVPf+
 JY6gEqYgu8n+gpGGnNBHjEwcYHsLizJc8WMlONoZU4LRroi6jCXBqw26PHwkB8Vtk3Pj
 QNfw==
X-Gm-Message-State: AJIora/MXCUrRWD12yX3bJaP+1ThANDdWK98IP2P0NH/SN6+SL8vj5x/
 L2L/ApZjxuk3EvRFzBSg/yxCqg==
X-Google-Smtp-Source: AGRyM1s8sjxgTCCOAcPmpljWMrnYoUKQY/eVbof0PmYJs/AiR/cN011zrxImw3/Twyg66Yc7JOIVRQ==
X-Received: by 2002:a2e:904a:0:b0:255:7b02:8f32 with SMTP id
 n10-20020a2e904a000000b002557b028f32mr1917751ljg.133.1655368588998; 
 Thu, 16 Jun 2022 01:36:28 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 8-20020a05651c00c800b002555dd9c20fsm169041ljr.20.2022.06.16.01.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 01:36:28 -0700 (PDT)
Message-ID: <d5579158-631c-4e7f-afcf-437f318b03bd@linaro.org>
Date: Thu, 16 Jun 2022 11:36:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/3] drm/msm/dpu: move intf and wb assignment to
 dpu_encoder_setup_display()
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1655328122-23619-1-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655328122-23619-1-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: markyacoub@chromium.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/06/2022 00:22, Abhinav Kumar wrote:
> intf and wb resources are not dependent on the rm global
> state so need not be allocated during dpu_encoder_virt_atomic_mode_set().
> 
> Move the allocation of intf and wb resources to dpu_encoder_setup_display()
> so that we can utilize the hw caps even during atomic_check() phase.
> 
> Since dpu_encoder_setup_display() already has protection against
> setting invalid intf_idx and wb_idx, these checks can now
> be dropped as well.
> 
> changes in v2:
> 	- add phys->hw_intf and phys->hw_wb checks back
> 
> Fixes: e02a559a720f ("make changes to dpu_encoder to support virtual encoder")

Reviewed: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 36 ++++++++++++++---------------
>   1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 3a462e327e0e..3be73211d631 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1048,24 +1048,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   		phys->hw_pp = dpu_enc->hw_pp[i];
>   		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>   
> -		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
> -			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
> -
> -		if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
> -			phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
> -
> -		if (!phys->hw_intf && !phys->hw_wb) {
> -			DPU_ERROR_ENC(dpu_enc,
> -				      "no intf or wb block assigned at idx: %d\n", i);
> -			return;
> -		}
> -
> -		if (phys->hw_intf && phys->hw_wb) {
> -			DPU_ERROR_ENC(dpu_enc,
> -					"invalid phys both intf and wb block at idx: %d\n", i);
> -			return;
> -		}
> -
>   		phys->cached_mode = crtc_state->adjusted_mode;
>   		if (phys->ops.atomic_mode_set)
>   			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
> @@ -2293,7 +2275,25 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>   		atomic_set(&phys->vsync_cnt, 0);
>   		atomic_set(&phys->underrun_cnt, 0);
> +
> +		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
> +			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
> +
> +		if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
> +			phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
> +
> +		if (!phys->hw_intf && !phys->hw_wb) {
> +			DPU_ERROR_ENC(dpu_enc, "no intf or wb block assigned at idx: %d\n", i);
> +			ret = -EINVAL;
> +		}
> +
> +		if (phys->hw_intf && phys->hw_wb) {
> +			DPU_ERROR_ENC(dpu_enc,
> +					"invalid phys both intf and wb block at idx: %d\n", i);
> +			ret = -EINVAL;
> +		}
>   	}
> +
>   	mutex_unlock(&dpu_enc->enc_lock);
>   
>   	return ret;


-- 
With best wishes
Dmitry
