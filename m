Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 677E16B96A0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 14:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8206010E7EC;
	Tue, 14 Mar 2023 13:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1EB10E7EB
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 13:44:11 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id s22so20079631lfi.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 06:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678801449;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jmYDXc1m4ipXRhKVGpFbbcTg2x+quYyEc2SUvpi4ZtI=;
 b=V0gxCeN0uLEo7r2ZFnoxXs9uCSWWjH4cHQFIC4LOAbBQDPbX5XdqXPmLdPihUYECH1
 t1ZbUjxOoptLd9c4WxUL3hS755syjxtd9q2LO+Xi8OQe6ZXnkAd2FLr1dP0XAQRJ46Xd
 rMT0WCY57CUB/yko+paqEn6LJmwq+wHtgwnPHPjpiUokv+n0SbukMJv9DXtCP8tpldDD
 5v+/dO/Mvln9ahaANsudX+hE6OGLN2lD9rm9i+8aQL8hLwIJRZ0+h3g7QU3IcLjO/FC5
 i5m+Mc8fnLgE4azgp75Boq/aBoO/FfQHvvEaWCv9e/CTdq8BAf6Q+jELNsTBCoaRNUnS
 STxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678801449;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jmYDXc1m4ipXRhKVGpFbbcTg2x+quYyEc2SUvpi4ZtI=;
 b=r8nxmQXIvG6l+E0lim63Rid9uODM0svYWyDAyTGsyzCwD8L/lP/2GOciy3WJ3EknvB
 eoIKzajZeCPUN8dVQttBGcgj5JsH8CJc3BqWsXtsY2Wc7AN01qWABq57QJbJxDwx7jJE
 KX0KPbXEMLgHd0mEYEHp3NlBfTpe/aCqYAFs+Jji5Vbiw1gMiNQ3gtZYR+tFPvLJ4qC1
 DM2D4L5uV6zRB2ekAxqX94g57UrDqOD7s7b7KUsrRPvcAsyMw+jeLSiK5gAfmgJ4Y+vb
 KLa+JEvNFqo1+U9a3AQQS1A64u6zCe4jZqUnl+R4c/JUNvLnGTIFkPe4IkzaI7QuVT7H
 VwyQ==
X-Gm-Message-State: AO0yUKVk8hfMqsCuOKcwXLQNxWeoUBecond7a8qoHbKbT6OqpETSeq5a
 mj7zvxcl02WHnVAqncWYhT+6xQ==
X-Google-Smtp-Source: AK7set+NO6qaZeOqdzmcNO441RgYsVfp5nhWf8D6N1x6R7+Jj7PVVuYDxPH74EcVS5M7ls0+qtz6uA==
X-Received: by 2002:ac2:50c3:0:b0:4a4:68b7:deab with SMTP id
 h3-20020ac250c3000000b004a468b7deabmr813430lfm.7.1678801449609; 
 Tue, 14 Mar 2023 06:44:09 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 z9-20020ac24189000000b004d5813386fdsm405637lfh.139.2023.03.14.06.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 06:44:09 -0700 (PDT)
Message-ID: <441030fa-afcb-8e5f-ea5a-f467d9d11937@linaro.org>
Date: Tue, 14 Mar 2023 14:44:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 07/10] drm/msm/dsi: Remove custom DSI config handling
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
 <20230307-topic-dsi_qcm-v4-7-54b4898189cb@linaro.org>
 <20230314130522.wimbrf7d6lqwdbgz@SoMainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230314130522.wimbrf7d6lqwdbgz@SoMainline.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14.03.2023 14:05, Marijn Suijten wrote:
> On 2023-03-14 13:13:45, Konrad Dybcio wrote:
>> Now that the only user is handled by common code, remove the option to
>> specify custom handlers through match data.
>>
>> This is effectively a revert of commit:
>> 5ae15e76271 ("drm/msm/dsi: Allow to specify dsi config as pdata")
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
[...]
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> index 8772a3631ac1..91bdaf50bb1a 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> @@ -65,8 +65,5 @@ struct msm_dsi_cfg_handler {
>>  
>>  const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor);
>>  
>> -/* Non autodetect configs */
>> -extern const struct msm_dsi_cfg_handler qcm2290_dsi_cfg_handler;
>> -
> 
> Probably the wrong `fixup!` commit: this should have been part of patch
> 6 where the struct is removed, not patch 7 (this patch).
Yeah, that's most likely what happened.. Does that warrant another resend?

Konrad
> 
> - Marijn
> 
>>  #endif /* __MSM_DSI_CFG_H__ */
>>  
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 9cfb9e91bfea..961689a255c4 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -214,10 +214,6 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
>>  	int ret;
>>  	u32 major = 0, minor = 0;
>>  
>> -	cfg_hnd = device_get_match_data(dev);
>> -	if (cfg_hnd)
>> -		return cfg_hnd;
>> -
>>  	ahb_clk = msm_clk_get(msm_host->pdev, "iface");
>>  	if (IS_ERR(ahb_clk)) {
>>  		pr_err("%s: cannot get interface clock\n", __func__);
>>
>> -- 
>> 2.39.2
>>
