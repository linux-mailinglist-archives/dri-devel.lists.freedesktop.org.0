Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C5968FA2E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 23:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E2F10E8A9;
	Wed,  8 Feb 2023 22:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FE110E8A9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 22:18:14 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id gr7so1137901ejb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 14:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U+j6KFfx3Qmji48Cg2CDZ+WAkdPyel9k/170nDiJ78M=;
 b=yjjwHJecKsnyrg8KPmSqiXjjFu98Uu2LRvMN+REP94WD9IEggEzD9t0Cd5M7EHC9DK
 zbxuE7uh/LUmtv+EJxvgaOGw+/a9xq3YTPtr/P/4MHaSMTPkvRWmmkDjXGpbr59YlL5v
 qLkhOmLNlDiJX8Dd0UYSu0MCYIyeUeoRg/vPtCGuFiLdAGzeUJeZgUSf0IYCow4FzI5Z
 sJSaQjEOKJJbq06HlrU/EizpM4dx09aADyIp2M/3Lg6p39w2AbZpW5a10KEGocCq9z+0
 bNyBbIqrXiPBpQS+xVQXPgpLrl2e0LW5lBDMWV1VJpRBHwIqHQbHrRW5KkohheflL/aF
 WNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U+j6KFfx3Qmji48Cg2CDZ+WAkdPyel9k/170nDiJ78M=;
 b=NlVATrKZuBQy1SUCOJM34Fy+/3U7KLkDLLVBf2pOOIuS8YFXn0B+FV7EFFFsYp4Jnt
 6MsclLCmlV5JPk275DGQhiad5uqX+AKVW+3w5DvrVdy6Jks4Wmk/dHvmftjSYe3IuUTO
 zooqnyXuuW/fl82ecNyVvj4OSXvrifjc0YpBXrGkbQSqzlLaDybYJP/vvRKzcPI5S/Nn
 JslAu/LOFnuYm36+5TJOlz1HJQE9liwB+C252+FSMXVp1Zg29ZcFM1B4O547g6pVf6pn
 bMXucjallLnlCV9gaxYdmP/4gxwwXX5587enChnLvdj4hPIL1cQWBeTZZleRsolF/E5K
 VBOA==
X-Gm-Message-State: AO0yUKVxQG6uIWHWFJKIIc64QuK8/F9scLY3PE27Kh/JsVwVyfiefUT4
 hhHT5rT+Oki2ui5MXh12a4Cskg==
X-Google-Smtp-Source: AK7set+S1W2pAxZxf43mLeE36cu3JKEoD8I483Ygu7n6ijkNwN48EBk193sZSV5rlHbyvl6slS1QVg==
X-Received: by 2002:a17:906:c9d2:b0:8aa:9831:6eb6 with SMTP id
 hk18-20020a170906c9d200b008aa98316eb6mr6806195ejb.18.1675894692495; 
 Wed, 08 Feb 2023 14:18:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 ko3-20020a170907986300b0088b93bfa782sm13274ejc.176.2023.02.08.14.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 14:18:12 -0800 (PST)
Message-ID: <884097ab-41c7-2889-5b11-91451e2f994a@linaro.org>
Date: Thu, 9 Feb 2023 00:18:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] drm/msm/dpu: Move TE setup to prepare_for_kickoff()
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230208213713.1330-1-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230208213713.1330-1-quic_jesszhan@quicinc.com>
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

On 08/02/2023 23:37, Jessica Zhang wrote:
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
> index 279a0b7015ce..746250bce3d1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -587,39 +587,6 @@ static void dpu_encoder_phys_cmd_destroy(struct dpu_encoder_phys *phys_enc)
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
> @@ -645,8 +612,7 @@ static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
>   	return false;
>   }
>   
> -static void dpu_encoder_phys_cmd_prepare_commit(
> -		struct dpu_encoder_phys *phys_enc)
> +static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc)
>   {
>   	struct dpu_encoder_phys_cmd *cmd_enc =
>   		to_dpu_encoder_phys_cmd(phys_enc);
> @@ -704,6 +670,48 @@ static void dpu_encoder_phys_cmd_prepare_commit(
>   			 "disabled autorefresh\n");
>   }
>   
> +static void dpu_encoder_phys_cmd_prepare_for_kickoff(
> +		struct dpu_encoder_phys *phys_enc)

Could you please move the function back to the place, so that we can see 
the actual difference?

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
> +
> +static void dpu_encoder_phys_cmd_prepare_commit(
> +		struct dpu_encoder_phys *phys_enc)
> +{
> +}

There is no need to have the empty callback, you can skip it completely. 
Actually, if it is not needed anymore for the cmd encoders, you can drop 
the .prepare_commit from struct dpu_encoder_phys_ops. And then, by 
extension, dpu_encoder_prepare_commit(), dpu_kms_prepare_commit(). This 
sounds like a nice second patch for this rfc.

> +
>   static int _dpu_encoder_phys_cmd_wait_for_ctl_start(
>   		struct dpu_encoder_phys *phys_enc)
>   {

-- 
With best wishes
Dmitry

