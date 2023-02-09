Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 841EE6910BC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 19:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351A310EB66;
	Thu,  9 Feb 2023 18:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B0810EB66
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 18:52:01 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id gr7so9290010ejb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 10:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x5LJPiqpx/vp1jhgzIqa9eAFSN89bT759X1KZY+TEZo=;
 b=Ht7Af3YVfTldlZXfDso2azYDl/h3WKteOjJpfbBnDV/O/JD/NgnEJqn0DFuRLjNbB7
 EInowGaec0IzBOoAZAtH467z69qvpy2J33AOgjH2GR8Jfxze2lNCmU9hLsEDsdkw/W6r
 kEbsIIj6dEiVVRRSnRDZ7rC2H/VwxDD1i0O9MvNFcipt0z0MDONKguNu4nn6M2Kl14QK
 8snvOyLCStxxGw45DPhaFeZL2g/3xWVjRvSNTldIiACYLEH4KuDa4IzpdVQKTwHt412w
 I6AETGhuguMkB9dAppFz66r1hWEeSSlzZXQOJq7xB6jqplnBWtVrxjERGbZvhBKxtZjO
 iI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x5LJPiqpx/vp1jhgzIqa9eAFSN89bT759X1KZY+TEZo=;
 b=LZnWwh8DUEyOb59Ll6otv38iLe1bR6MsgEkqe+ry1CpYskiv8L1TATy1hXrPKwW0oj
 cC30bYNhnWWixC8voHDB/mAGb09b+DYdvlwGXDRLe1bA9y/TWsXW9Lw1ub/73LT8hwfz
 g0RTfxPrIdzXWtaUKO1PyM0CY5OOrJBnQnZRfl8dPeCUl+C5DaTu+ImkepATcW4oFW00
 MeK7pAWOwgbsuvupt5JumPSZwF++D9rONiSaY5UficHlHWTaGJ0gchsLjZ17OPNNOjVH
 9AaBn74glCT5M+qFGnzrMBhmSCuaM0FohYYL+D9MQVb1w2lkcLmbx2cLzo2clJKfdBk+
 oryA==
X-Gm-Message-State: AO0yUKVMYpybmZ2V8Vwgi4aHAtnLE/oemjtnGlGCLgWUkbUqA+TKIF/S
 Qg6j82Hw0uJ7GDerJ1bquDJyLg==
X-Google-Smtp-Source: AK7set+Bl2xY5ebDAUqfkzSEeNxk/3Iuo7DLKdu5mlmIDj3DtDRQMnu7WF7nIQFpjUEYq/fAOBxdtA==
X-Received: by 2002:a17:906:fb98:b0:870:3c70:8c8d with SMTP id
 lr24-20020a170906fb9800b008703c708c8dmr11180821ejb.17.1675968720418; 
 Thu, 09 Feb 2023 10:52:00 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170906368b00b0088519b9206bsm1199304ejc.130.2023.02.09.10.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 10:52:00 -0800 (PST)
Message-ID: <4d11cb36-96eb-36ac-e86e-7a0947e4bdcf@linaro.org>
Date: Thu, 9 Feb 2023 20:51:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v2 1/4] drm/msm/dpu: Move TE setup to
 prepare_for_kickoff()
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230209184426.4437-1-quic_jesszhan@quicinc.com>
 <20230209184426.4437-2-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230209184426.4437-2-quic_jesszhan@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/02/2023 20:44, Jessica Zhang wrote:
> Currently, DPU will enable TE during prepare_commit(). However, this
> will cause issues when trying to read/write to register in
> get_autorefresh_config(), because the core clock rates aren't set at
> that time.
> 
> This used to work because phys_enc->hw_pp is only initialized in mode
> set [1], so the first prepare_commit() will return before any register
> read/write as hw_pp would be NULL.
> 
> However, when we try to implement support for INTF TE, we will run into
> the clock issue described above as hw_intf will *not* be NULL on the
> first prepare_commit(). This is because the initialization of
> dpu_enc->hw_intf has been moved to dpu_encoder_setup() [2].
> 
> To avoid this issue, let's enable TE during prepare_for_kickoff()
> instead as the core clock rates are guaranteed to be set then.
> 
> Depends on: "Implement tearcheck support on INTF block" [3]
> 
> [1] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L1109
> [2] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2339
> [3] https://patchwork.freedesktop.org/series/112332/
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 78 ++++++++++---------
>   1 file changed, 43 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index cb05036f2916..561406d92a1a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -583,39 +583,6 @@ static void dpu_encoder_phys_cmd_destroy(struct dpu_encoder_phys *phys_enc)
>   	kfree(cmd_enc);
>   }
>   
> -static void dpu_encoder_phys_cmd_prepare_for_kickoff(
> -		struct dpu_encoder_phys *phys_enc)
> -{
> -	struct dpu_encoder_phys_cmd *cmd_enc =
> -			to_dpu_encoder_phys_cmd(phys_enc);
> -	int ret;
> -
> -	if (!phys_enc->hw_pp) {
> -		DPU_ERROR("invalid encoder\n");
> -		return;
> -	}
> -	DRM_DEBUG_KMS("id:%u pp:%d pending_cnt:%d\n", DRMID(phys_enc->parent),
> -		      phys_enc->hw_pp->idx - PINGPONG_0,
> -		      atomic_read(&phys_enc->pending_kickoff_cnt));
> -
> -	/*
> -	 * Mark kickoff request as outstanding. If there are more than one,
> -	 * outstanding, then we have to wait for the previous one to complete
> -	 */
> -	ret = _dpu_encoder_phys_cmd_wait_for_idle(phys_enc);
> -	if (ret) {
> -		/* force pending_kickoff_cnt 0 to discard failed kickoff */
> -		atomic_set(&phys_enc->pending_kickoff_cnt, 0);
> -		DRM_ERROR("failed wait_for_idle: id:%u ret:%d pp:%d\n",
> -			  DRMID(phys_enc->parent), ret,
> -			  phys_enc->hw_pp->idx - PINGPONG_0);
> -	}
> -
> -	DPU_DEBUG_CMDENC(cmd_enc, "pp:%d pending_cnt %d\n",
> -			phys_enc->hw_pp->idx - PINGPONG_0,
> -			atomic_read(&phys_enc->pending_kickoff_cnt));
> -}
> -
>   static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
>   		struct dpu_encoder_phys *phys_enc)
>   {
> @@ -641,8 +608,7 @@ static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
>   	return false;
>   }
>   
> -static void dpu_encoder_phys_cmd_prepare_commit(
> -		struct dpu_encoder_phys *phys_enc)
> +static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc)
>   {
>   	struct dpu_encoder_phys_cmd *cmd_enc =
>   		to_dpu_encoder_phys_cmd(phys_enc);
> @@ -700,6 +666,48 @@ static void dpu_encoder_phys_cmd_prepare_commit(
>   			 "disabled autorefresh\n");
>   }
>   
> +static void dpu_encoder_phys_cmd_prepare_for_kickoff(
> +		struct dpu_encoder_phys *phys_enc)
> +{
> +	struct dpu_encoder_phys_cmd *cmd_enc =
> +			to_dpu_encoder_phys_cmd(phys_enc);
> +	int ret;
> +
> +	if (!phys_enc->hw_pp) {
> +		DPU_ERROR("invalid encoder\n");
> +		return;
> +	}
> +
> +
> +	DRM_DEBUG_KMS("id:%u pp:%d pending_cnt:%d\n", DRMID(phys_enc->parent),
> +		      phys_enc->hw_pp->idx - PINGPONG_0,
> +		      atomic_read(&phys_enc->pending_kickoff_cnt));
> +
> +	/*
> +	 * Mark kickoff request as outstanding. If there are more than one,
> +	 * outstanding, then we have to wait for the previous one to complete
> +	 */
> +	ret = _dpu_encoder_phys_cmd_wait_for_idle(phys_enc);
> +	if (ret) {
> +		/* force pending_kickoff_cnt 0 to discard failed kickoff */
> +		atomic_set(&phys_enc->pending_kickoff_cnt, 0);
> +		DRM_ERROR("failed wait_for_idle: id:%u ret:%d pp:%d\n",
> +			  DRMID(phys_enc->parent), ret,
> +			  phys_enc->hw_pp->idx - PINGPONG_0);
> +	}
> +
> +	dpu_encoder_phys_cmd_enable_te(phys_enc);
> +
> +	DPU_DEBUG_CMDENC(cmd_enc, "pp:%d pending_cnt %d\n",
> +			phys_enc->hw_pp->idx - PINGPONG_0,
> +			atomic_read(&phys_enc->pending_kickoff_cnt));
> +}

Quoting v1:

Could you please move the function back to the place, so that we can see 
the actual difference?

> +
> +static void dpu_encoder_phys_cmd_prepare_commit(
> +		struct dpu_encoder_phys *phys_enc)
> +{
> +}

This is not necessary and can be dropped. There is a safety check in 
dpu_encoder_prepare_commit().

> +
>   static int _dpu_encoder_phys_cmd_wait_for_ctl_start(
>   		struct dpu_encoder_phys *phys_enc)
>   {

-- 
With best wishes
Dmitry

