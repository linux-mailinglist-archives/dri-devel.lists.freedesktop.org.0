Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1643F54C8AB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 14:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7170A10E537;
	Wed, 15 Jun 2022 12:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298DA10E537
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 12:36:54 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id l20so6336070lji.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 05:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wVJwhnAqXNlzz2ki9lvX5+eqiHTxgWuKOy9DNV5jL/4=;
 b=GGjb8taXbbbbqbCt5AkVsNvtUwPhWNoe4YMbuFxLkeRmgw9rRxlbQSbP5KDl0ELo45
 iHlAGiRifBs0h696kiwGoikxweNmEP/IeWPb035WeZ16Qemzh9doYlCYk7qjUZqS7cKT
 Vqn0nXtygXU5ZVd9vQdYfUz5ngI0HOHB1f2yG+0bmJrMiaGNeIGeK+/m9YgAWgayKCiK
 Rl2EsfNEcwpLBLdayLsOK+kT3GfavryTZwZ0+tfH18fUwV5gbEFEbiVnWXJBliQ8MZeW
 M+GF7cfIii0ABmIs+tA3ZYkWfVfreputf1MOfhH+OGrv8NSwN6VxmvNxsf2bRYI+Pm7p
 JW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wVJwhnAqXNlzz2ki9lvX5+eqiHTxgWuKOy9DNV5jL/4=;
 b=JUyNiw94i/RPRUAzFwYVzrH4V7Q3BqpHsi3XMOUWrKpyWvCQCfXFYzMvSrchOVTcNp
 1IF6Vhg+HULmVzYAIiNXyGkU9NMpTSRUSohGhAkVYI2jlMnqvzZ7TR36u3h53XZxI/tB
 qUC+HiofEJFjcAIbXQt9Gp6jjO5+oY3dqBt8HxEStOqHRHMOFpCuPLBIlR1HkZYQ4Wwy
 K4oVYbbVqRZ8/MmErEcKdNlSc+8L2UsS2CLJ5J06CTFBnoUiFBtQFYCyU47ODa8s1JmG
 OMq6WIoS+zGKcQ2ADNebx1YE2JBI9OAZhv/axZ5u4eNenUNMmZwt3zTiAYQNu79kTHPm
 ggtQ==
X-Gm-Message-State: AJIora9h3sVtkoRn9axUPxfBEPNMjMHLtiMxlEwVVO6EPxbEfQCN6a4V
 ys8osWfclSpjSt9dOIR34LyZGw==
X-Google-Smtp-Source: AGRyM1uXnWEKf8vuND04px8rwzbAV7oZKZOsxAypq66WxVE2bc4v4XUjybbs7nKGV6qHGBqlYJySmQ==
X-Received: by 2002:a2e:b601:0:b0:255:6fc9:e7ff with SMTP id
 r1-20020a2eb601000000b002556fc9e7ffmr4998997ljn.518.1655296612507; 
 Wed, 15 Jun 2022 05:36:52 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a056512074600b0047255d210e2sm1791470lfs.17.2022.06.15.05.36.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 05:36:51 -0700 (PDT)
Message-ID: <6ce50e83-3fbf-d97f-a4f2-0f5db389349c@linaro.org>
Date: Wed, 15 Jun 2022 15:36:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
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

Please retain these checks in dpu_encoder_setup_display().
It checks that we really have got the intf or wb. For example one might 
have specified the INTF that leads to INTF_NONE interface. Or 
non-existing/not supported WB.

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
