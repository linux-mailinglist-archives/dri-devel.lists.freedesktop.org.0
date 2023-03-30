Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29276D0498
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C3410E335;
	Thu, 30 Mar 2023 12:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6277510E335
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:23:01 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id h25so24254758lfv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 05:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680178979;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=glZTTXa5a7ZHyxvnvI6hzXt9JLLInfunJqkiquyqXT8=;
 b=gChhLOjymoB27eWcS5/h90+2USxKm3mmok3RlhOKaiKEtJ0lmPk7fxD+7uH/j6wEbG
 ZUmOsqJdfcYiP+EcPhokOHmIWrIuavcdAoSEg9rKtDodWsfy2MZL+tP47TaVL3Gh0dmF
 epwMUtIBfqYxtHu84y4wTzwyoQeV9fowoNaMAad+MqEvzCRCpFTCqL57GRcX0DjD1UWa
 ITwawIjG7sCEX/ckB/VtHU8ex6fTHpioz/9p5/ohjue51UAI2GgqB8JSxamq3NAzo2yQ
 B7vx9WoiFWkeEvB+l9eSsN0wjRhNTkK1bdiHYDtiWag0Her63/tYDR1uT9Z3Rsat8APv
 k2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680178979;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=glZTTXa5a7ZHyxvnvI6hzXt9JLLInfunJqkiquyqXT8=;
 b=tw80bSCU7LO7rEB/TD0J/SyoVwSvN2Zi8NjgV3FO3froc4kGGG3TdUWUxQtyzQS65N
 /NUf/XtnqiU6Tc7sjSQwVmlWZtX/Cvy9tE2b5Q1gO9jIMFRNr867SaOgUHbZcGki5bbU
 9dScJ3tnnGh96JSjY88yuownEjaMAO8CC/p4dhzQtZ19prbj5tCAerZXq5mUO4fyr0sE
 E8TaOKazcZz0yy5rUqyjpH0u8cuLuoRYx1BOpU8FS0bM6DCp5F8sGnn5S7VE+jyxDPcM
 c6hmHutVphPigsLze9SVm+uYYW9ybreDXk8393W6g2o/pYW0sn21sY4S4Lh4Wu/y0hjP
 yolg==
X-Gm-Message-State: AAQBX9eLrtfdTqyG72o0XGAjniUvvwgkdOqJKTWmzye2H2rKkTJFVPJZ
 Y1loeDZ7qllkgxWaeklNXxyvLYXUY2UGut2CHmM=
X-Google-Smtp-Source: AKy350YQNaSVlwnDMEE+lALdvIJ76GXj0hEGsLrPFA7MLJQ15GOBgU82/Pqrw1CCNTQ+BOyQG10bJg==
X-Received: by 2002:a19:f51a:0:b0:4bb:9415:38a2 with SMTP id
 j26-20020a19f51a000000b004bb941538a2mr6675098lfb.51.1680178979500; 
 Thu, 30 Mar 2023 05:22:59 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 q5-20020ac25145000000b004d3d43c7569sm5855445lfd.3.2023.03.30.05.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:22:59 -0700 (PDT)
Message-ID: <8b3ce350-3cd0-2712-3de5-a29a2592e440@linaro.org>
Date: Thu, 30 Mar 2023 14:22:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,32/50] drm/msm/dpu: duplicate sc7180 catalog entries
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-33-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-33-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Duplicate some of sc7180 catalog entries to remove dependencies between
> DPU major generations.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 8977878890f1..3117bb358117 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -82,6 +82,11 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
>  		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
>  };
>  
> +static const struct dpu_dspp_cfg sc7280_dspp[] = {
> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> +		 &sc7180_dspp_sblk),
If I'm following correctly, the sc7180_dspp_sblk is still defined
in the common hw_catalog.c and things won't explode.

In that case:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +};
> +
>  static const struct dpu_pingpong_cfg sc7280_pp[] = {
>  	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
>  	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
> @@ -132,8 +137,8 @@ static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
>  	.ctl = sc7280_ctl,
>  	.sspp_count = ARRAY_SIZE(sc7280_sspp),
>  	.sspp = sc7280_sspp,
> -	.dspp_count = ARRAY_SIZE(sc7180_dspp),
> -	.dspp = sc7180_dspp,
> +	.dspp_count = ARRAY_SIZE(sc7280_dspp),
> +	.dspp = sc7280_dspp,
>  	.mixer_count = ARRAY_SIZE(sc7280_lm),
>  	.mixer = sc7280_lm,
>  	.pingpong_count = ARRAY_SIZE(sc7280_pp),
