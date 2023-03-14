Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D359D6B92A5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 13:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7FB10E78F;
	Tue, 14 Mar 2023 12:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637D310E15C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 12:06:17 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id n2so19658364lfb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 05:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678795575;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e6PMzxNPu0tsz3tjRajBCZnSPtI1e5mB9Su+fsMf3bk=;
 b=Dkuwu1dFGFoMSVkuxQVa1GD2Nl2OPE0YFBafjm4iaAtc+EQ3/NFUJ+GST24b3ymsk6
 um+RZQxhy6h4v6XpKGwQxpxPqWHbeAlSvSMmMMY/SS+evvb/aJN7KzCddo/jt0n6ifFk
 AKIB8DZ+nAbo5tzq8nFdIYGXgfQiBDidop5k9mLq/HcuNnmauJaZjtkceAQilJhSVqzD
 ynqDM13h6tIfchnN5G+2V2a8vEmaxKx6YmStmk+soihKqtVx/mr4lOgFQJ9CLdKKY5mF
 qUSxVkozbLLnGjWcffoaHK9E2+Dq301aqJYS1TI5TQ5jcmHLJF+VlULpRU+TE5LVuN+v
 IXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678795575;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e6PMzxNPu0tsz3tjRajBCZnSPtI1e5mB9Su+fsMf3bk=;
 b=1pwypEifb30nN7XGL/7YuvBT5xPPeWne5IOqAJfvUoh9D0lQYi+9XpCqfCzT0bD2gx
 nU8TRlHf2vZ9ffeZrP7nSiKhtrUFEddnSjhmCmd6lbOYAoXCAu0xBaphVBu6COOBuKjg
 IS19SAJX+ZzGZnGGYRjTKkUefs6QG8vm+QPKcdIEoTEGpF2tc/Z5oR3IawAFgJSRgkW4
 GkX8mF1iiUJ180Fr0LEFD6I4M9GKmAKsMWaAZpmPDmcuu8h6Pf7FY1BwVTEHvOB5k9E8
 Q55N9alJI9BHjzhoQeRkxqgh5tX8bj16Wpx5yAGSJz1n/1+b5m48OIPnaNgkVODG0DWO
 RYPw==
X-Gm-Message-State: AO0yUKX55R4nqw8WELUW5qK2K/oB6PFnnVmQPLEg/OOZVpUCDJHBF3Ht
 1Q4Ml44KmID6kY7HdMN4SdroVg==
X-Google-Smtp-Source: AK7set8y1S3Ew42r0fNJc7kHIb75SA1cUzze9ztJfgE0b5T6mi+HLLRdUIRz6wmiM+EMjWdU5uLedg==
X-Received: by 2002:ac2:4189:0:b0:4dd:ad88:ba5c with SMTP id
 z9-20020ac24189000000b004ddad88ba5cmr712969lfh.4.1678795575616; 
 Tue, 14 Mar 2023 05:06:15 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 f25-20020ac251b9000000b004dab932248fsm378828lfk.180.2023.03.14.05.06.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 05:06:14 -0700 (PDT)
Message-ID: <20ebe4a3-1352-ae02-a56b-672ff3fcf12d@linaro.org>
Date: Tue, 14 Mar 2023 13:06:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 06/10] drm/msm/dsi: Switch the QCM2290-specific
 compatible to index autodetection
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
 <20230307-topic-dsi_qcm-v3-6-8bd7e1add38a@linaro.org>
 <20230314000322.ptxs5d5mx54vdopa@SoMainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230314000322.ptxs5d5mx54vdopa@SoMainline.org>
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



On 14.03.2023 01:03, Marijn Suijten wrote:
> On 2023-03-07 14:01:44, Konrad Dybcio wrote:
>> Now that the logic can handle multiple sets of registers, move
>> the QCM2290 to the common logic and mark it deprecated. This allows us
>> to remove a couple of structs, saving some memory.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/dsi/dsi.c     |  4 +++-
>>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 28 ++--------------------------
>>  2 files changed, 5 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
>> index 31fdee2052be..90d43628b22b 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
>> @@ -174,7 +174,9 @@ static int dsi_dev_remove(struct platform_device *pdev)
>>  
>>  static const struct of_device_id dt_match[] = {
>>  	{ .compatible = "qcom,mdss-dsi-ctrl", .data = NULL /* autodetect cfg */ },
>> -	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290", .data = &qcm2290_dsi_cfg_handler },
>> +
>> +	/* Deprecated, don't use */
>> +	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290", .data = NULL },
>>  	{}
>>  };
>>  
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> index 6d4b2ce4b918..29ccd755cc2e 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> @@ -169,7 +169,8 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
>>  	.bus_clk_names = dsi_v2_4_clk_names,
>>  	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
>>  	.io_start = {
>> -		{ 0xae94000, 0xae96000 }, /* SDM845 / SDM670 / SC7180 */
>> +		{ 0xae94000, 0xae96000 }, /* SDM845 / SDM670 */
>> +		{ 0x5e94000 }, /* QCM2290 / SM6115 / SM6125 / SM6375 */
>>  	},
>>  };
>>  
>> @@ -203,25 +204,6 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
>>  	},
>>  };
>>  
>> -static const char * const dsi_qcm2290_bus_clk_names[] = {
>> -	"iface", "bus",
>> -};
>> -
>> -static const struct regulator_bulk_data qcm2290_dsi_cfg_regulators[] = {
>> -	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
>> -};
> 
> These two consts should really have already been deleted as part of
> 04/10: drm/msm/dsi: dsi_cfg: Deduplicate identical structs.
Right, will fix

> 
>> -static const struct msm_dsi_config qcm2290_dsi_cfg = {
>> -	.io_offset = DSI_6G_REG_SHIFT,
>> -	.regulator_data = qcm2290_dsi_cfg_regulators,
>> -	.num_regulators = ARRAY_SIZE(qcm2290_dsi_cfg_regulators),
>> -	.bus_clk_names = dsi_qcm2290_bus_clk_names,
>> -	.num_bus_clks = ARRAY_SIZE(dsi_qcm2290_bus_clk_names),
>> -	.io_start = {
>> -		{ 0x5e94000 },
>> -	},
>> -};
>> -
>>  static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
>>  	.link_clk_set_rate = dsi_link_clk_set_rate_v2,
>>  	.link_clk_enable = dsi_link_clk_enable_v2,
>> @@ -312,9 +294,3 @@ const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
>>  
>>  	return cfg_hnd;
>>  }
>> -
>> -/*  Non autodetect configs */
>> -const struct msm_dsi_cfg_handler qcm2290_dsi_cfg_handler = {
>> -	.cfg = &qcm2290_dsi_cfg,
>> -	.ops = &msm_dsi_6g_v2_host_ops,
>> -};
> 
> And how do you think dsi.c is able to reference this... don't forget to
> remove it from dsi_cfg.h in v4.  In fact, if you look at how this was
> implemented you should also be able to remove #include "dsi_cfg.h" from
> dsi.c.  A clean revert of that patch would be nice, or just use it as
> reference to find the remnants:
> 
> https://lore.kernel.org/all/1644853060-12222-2-git-send-email-loic.poulain@linaro.org/
Ack

Konrad
> 
> - Marijn
