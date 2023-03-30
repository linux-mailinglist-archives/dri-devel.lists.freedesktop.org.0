Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4554A6D04AC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BBE10EDFC;
	Thu, 30 Mar 2023 12:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006B110EDFC
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:27:57 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id y20so24313486lfj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 05:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680179276;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gvEbveK1uWCeCDd1RWXdS2lL6JVQ6l3y8DwliRMNQDc=;
 b=VUbl0GXZMqbt696T8nIZrxZJtcgX/q3qblDeghahOHqODqM2mNOrJGK5sym+faqrq2
 Tc5Z6717oVrFBXrLYQPOOAlsOLq+FGK6c74GfVr7r50SplJh2lFHqfp9kHOqN4TFN7yN
 NsPqcBYHXtO/Yr4AGClDN8vtDqPRXwhYnDix3bP5kz5w7O2bWq3cxVqVxrQracHg2b1b
 fXp0MvIIqqxMzMwQ29yYVR8D5waFAbcbvV3tqp1mA8CW5CDU/E/EbJlwyAgna1JZ69bL
 usRUlqRoLI4T8lB1qkk8fukyU80C8HfLJPXta9bkxI3ZG9N0SD8pj/UHB+alnUtyNg+1
 SaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680179276;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gvEbveK1uWCeCDd1RWXdS2lL6JVQ6l3y8DwliRMNQDc=;
 b=I9fN8H0JR+fG7q5cd+LPJRbywJf1a6SuNYNLtn31rfC1ok4bOuvdvTUYiCZur1VUBJ
 tgXhTlCakkXdDQtJFJ9neq6ptRP9WQTugdjwcgVULh/u3cHlrpe02tel2kDvz4eqcv4Z
 F44auQn9H5+v5j8A7nkbagtO72Sfd071ufSTMpsM4n4A5qFBUyLMBnWntVoIqe/yd7Kx
 KrtoTA3dyff6jONFt9suVhLDLAvk+39GfdZFlEuML+bTqFAXdX9wf0ZByDcHB5xIn6rq
 YRQXI8k1OIVw4cWakXJX8FUP+ArGKBzjaceUarDFw89hDbbeJy0FOhmQiNyetUl3Q+QZ
 my3Q==
X-Gm-Message-State: AAQBX9cDhZI0ckhvw8pfIClPUjCUg8lUy3SwFcW5vMfqPrFZjamazHfj
 w3ZZBYx6pO2/GSAK7/j9ki1lbkkKmdVuEo4rbB0=
X-Google-Smtp-Source: AKy350Y1ZQJEhnif7Db4/DhBLluxZ+Poft+wmesJ0nfJVQ9JFGpmHrq9djlwFb1Z+iwpnc/OUnml+g==
X-Received: by 2002:a05:6512:92a:b0:4e9:8994:49bd with SMTP id
 f10-20020a056512092a00b004e9899449bdmr6044678lft.3.1680179276029; 
 Thu, 30 Mar 2023 05:27:56 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a056512094e00b004cb35b31b96sm5847822lft.257.2023.03.30.05.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:27:55 -0700 (PDT)
Message-ID: <f9ecaf20-bb35-57e9-d604-a2f47a614732@linaro.org>
Date: Thu, 30 Mar 2023 14:27:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,35/50] drm/msm/dpu: duplicate sm8350 catalog entries
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-36-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-36-dmitry.baryshkov@linaro.org>
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
> Duplicate some of sm8350 catalog entries to remove dependencies between
> DPU major generations.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 748f7e14dfcc..0a5d6d9fe751 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -137,6 +137,12 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
>  		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
>  };
>  
> +static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
> +	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
> +	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
> +	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
> +};
> +
>  /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
>  static const struct dpu_intf_cfg sc8280xp_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> @@ -192,8 +198,8 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
>  	.dspp = sc8280xp_dspp,
>  	.pingpong_count = ARRAY_SIZE(sc8280xp_pp),
>  	.pingpong = sc8280xp_pp,
> -	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
> -	.merge_3d = sm8350_merge_3d,
> +	.merge_3d_count = ARRAY_SIZE(sc8280xp_merge_3d),
> +	.merge_3d = sc8280xp_merge_3d,
>  	.intf_count = ARRAY_SIZE(sc8280xp_intf),
>  	.intf = sc8280xp_intf,
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
