Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA1654DA0E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 07:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1EA11A037;
	Thu, 16 Jun 2022 05:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF3411A031
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 05:55:38 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id h23so364453ljl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 22:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HarZZOMqwX2nfuyIoxzYBsQI132xDDkrDcmus7kOCgs=;
 b=SlA1XLYB3V/+F+CAnL6en02LkgCxHCp+zojbpaj0GHSbiQX88d2JLUitWXhv/WEB7e
 D/urnYBTFbNFLwEx42GfdgdnBm6nHoKeQI/02GuRA0AiPUg8ISsKOdtFOTOs9i5haddz
 6JzqE8pbCgFnFh6DNRKi0O28d5WJzpZ/Isf1pYi25sg7rMPOUktALmywdgTBIwEbUL2p
 yeswd9z5o0oYxUXquUWLwXdOrc+5yetnnDR0iDav1S/iJcak+j8R4elXU2KFawArilC5
 fbkm2mIWvLLwEn39ya+ywFTa0rBm26JIQeyKgUhnKFlgtZs6F8lPSIuXAADjuoHGN/2C
 cLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HarZZOMqwX2nfuyIoxzYBsQI132xDDkrDcmus7kOCgs=;
 b=7zC4RryQb2wEv8jKwCuctiNNWKgKzJoIjCIpewdW7km7zIhURmaqs4dUrtF3wy+dlk
 flw9paLPnn3ZeADZ7eb6qSf+fuEwhoCjd5o73iwIMZWnc3+aYJQz5bPSkUYUG4Be3zK5
 Ihb9X2mibMrFJk5l/vED5jfc/n5bc3THCNw6GQtaCe72tmaRPn0QRU/uxUHqBLJUr6H9
 aNBOvGM6r9ii3WXFn1wy5kI6WnjVnlgka6G8XqqKF6hCQIwqYHugKhfhL8QJtjKfllvL
 fDuP3iUrtHr2FBgrLSneA+1nosQWnImH29xhi/lS87V3cf0vA6vd/DwE8lHQ4LxkZQaF
 u7ZQ==
X-Gm-Message-State: AJIora/rdFB8Cx/tkb5+gQBcOmuewkuwFllWixUGIWk820RnN+cH+Grl
 x/XcCzcOm98rjGsP6k7zrlnT8w==
X-Google-Smtp-Source: AGRyM1u2eCbA4NOP1GqEYww+pLp4BPVnEoT9h4a2CfaGiqPHGf8dobXXLe2o5ffEtjsRKP2cgXRMKA==
X-Received: by 2002:a05:651c:a11:b0:255:af78:48d9 with SMTP id
 k17-20020a05651c0a1100b00255af7848d9mr1718828ljq.508.1655358936500; 
 Wed, 15 Jun 2022 22:55:36 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a056512359100b00477b38eabd1sm98951lfr.94.2022.06.15.22.55.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 22:55:36 -0700 (PDT)
Message-ID: <82b09d4d-1985-519e-3657-0d15e07ccc2f@linaro.org>
Date: Thu, 16 Jun 2022 08:55:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] drm/msm/dpu: move intf and wb assignment to
 dpu_encoder_setup_display()
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1655235140-16424-1-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655235140-16424-1-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/06/2022 22:32, Abhinav Kumar wrote:
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
> Fixes: e02a559a720f ("make changes to dpu_encoder to support virtual encoder")

Please adjust the Fixes tags in all three commits. I didn't notice this 
beforehand and Stephen has complained.

> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 25 +++++++------------------
>   1 file changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 3a462e327e0e..e991d4ba8a40 100644
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
> @@ -2293,7 +2275,14 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>   		atomic_set(&phys->vsync_cnt, 0);
>   		atomic_set(&phys->underrun_cnt, 0);
> +
> +		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
> +			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
> +
> +		if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
> +			phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
>   	}
> +
>   	mutex_unlock(&dpu_enc->enc_lock);
>   
>   	return ret;


-- 
With best wishes
Dmitry
