Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C33694098
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 10:16:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC66910E4F6;
	Mon, 13 Feb 2023 09:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4E210E4F5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 09:16:34 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id ml19so30308420ejb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 01:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ffU8sGbKz0z2ElJbTbQMzwUheG9ZFBNUT9R2bnCT9fc=;
 b=W2VHDevE2E8btW8qR/+w4xDl0AnPm7BODAW9vrKHhMCjiyITjk44rpRbOJyoZtbqlo
 ReOz3ukHokW9wsj/rZQSAEuF5+dJwY1MXbajSaG3Q9+Fc9c+l+qnlsYiI5NUbQ5skHep
 sJigXpIZthXkxiN2JtAaDCBJK2+LdiTEE1Cl8TW32mw0QMm//3SRAl/WH6j+PiyYaA4b
 mcs69PaOYCWIjRTHyqM0fTCf7RMokBIOtaMsZv7lK1sG5LwYYCTn5UlD8LYLfuBgmp7T
 gwILAx0j/hQ8F8+Fg0MttExIJc3+Q7Zk1U3uHBWi7/7vf8E5NJp47bJA1WoQqGAAXTmi
 R6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ffU8sGbKz0z2ElJbTbQMzwUheG9ZFBNUT9R2bnCT9fc=;
 b=ElsebIIqMaXErnHGQWsUq+4HFYmtF7gdCIMh/3VozkBCNjC/c9hYoZZ/EMzBeWzh2U
 AI5Rlf0MU3e5A8hUfO3qJMKnSvK4TKGftbj6nkksZeebaVxENWsNApJT1mUeYIvbh1FK
 NCGNTP09dESlMaDM6XW+K2u6VXfdceQdLgHxcx0yrvMZ1qWFeugBjvk1u6tlUhMSdQby
 YTGPlm9nye1zs6E6VXMOiznvLrX8GZ1Vatf3YvqfWK7GFagQ0uMhoiHAppW8EOPFQZVD
 htcLY49YPsI74fcoXOUsGRXv5qJ+O4Lwf19MEwLT+pgTaPUsBQixphd8XwJF4SMJDEw+
 xk+w==
X-Gm-Message-State: AO0yUKWnpnYSluF+nXziWrSIPA98Q1bS7RysDF/xTflH6guDJSjcUnWo
 UeEcFy/tARMsGSw46Px56vLj+Q==
X-Google-Smtp-Source: AK7set+dSF1gp8nSjaSbYMMdwmLbhN8OinauvAHBHeVZb26gkGLvNQgREzqzx4icab8vlZ38BS4Saw==
X-Received: by 2002:a17:906:3391:b0:877:5938:6f6d with SMTP id
 v17-20020a170906339100b0087759386f6dmr27538914eja.56.1676279792830; 
 Mon, 13 Feb 2023 01:16:32 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 qk8-20020a170906d9c800b008a654ade18csm6533721ejb.78.2023.02.13.01.16.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 01:16:32 -0800 (PST)
Message-ID: <6dfb39f9-cdc7-62a0-6ba7-dd8fa33d4d44@linaro.org>
Date: Mon, 13 Feb 2023 10:16:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 02/10] drm/msm/dsi: Turn msm_dsi_config::io_start into a
 2d array
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
References: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
 <20230211115110.1462920-3-konrad.dybcio@linaro.org>
 <4748cb49-0a17-2839-f99b-7578c0a4354b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <4748cb49-0a17-2839-f99b-7578c0a4354b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11.02.2023 14:17, Dmitry Baryshkov wrote:
> On 11/02/2023 13:51, Konrad Dybcio wrote:
>> Currently, we allow for MAX_DSI entries in io_start to facilitate for
>> MAX_DSI number of DSI hosts at different addresses. The configuration
>> is matched against the DSI CTRL hardware revision read back from the
>> component. We need a way to resolve situations where multiple SoCs
>> with different register maps may use the same version of DSI CTRL. In
>> preparation to do so, make msm_dsi_config a 2d array where each entry
>> represents a set of configurations adequate for a given SoC.
>>
>> This is totally fine to do, as the only differentiating factors
>> between same-version-different-SoCs configurations are the number of
>> DSI hosts (1 or 2, at least as of today) and the set of registers.
> 
> s/set of registers/starting address/ ?
Well, *technically* they both are accurate, as having the same DSI
HW at the same base address implies the entire DSI host address space
is the same.. But I can clean this up.

Konrad
> 
>> The regulator setup is the same, because the DSI hardware is the same,
>> regardless of the SoC it was implemented in.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 52 ++++++++++++++++++++++--------
>>   drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  5 ++-
>>   drivers/gpu/drm/msm/dsi/dsi_host.c |  2 +-
>>   3 files changed, 44 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> index 6d21f0b33411..068d45b3a8f0 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> @@ -21,7 +21,9 @@ static const struct msm_dsi_config apq8064_dsi_cfg = {
>>       .num_regulators = ARRAY_SIZE(apq8064_dsi_regulators),
>>       .bus_clk_names = dsi_v2_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_v2_bus_clk_names),
>> -    .io_start = { 0x4700000, 0x5800000 },
>> +    .io_start = {
>> +        { 0x4700000, 0x5800000 },
>> +    },
>>       .num_dsi = 2,
>>   };
>>   @@ -41,7 +43,9 @@ static const struct msm_dsi_config msm8974_apq8084_dsi_cfg = {
>>       .num_regulators = ARRAY_SIZE(msm8974_apq8084_regulators),
>>       .bus_clk_names = dsi_6g_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
>> -    .io_start = { 0xfd922800, 0xfd922b00 },
>> +    .io_start = {
>> +        { 0xfd922800, 0xfd922b00 },
>> +    },
>>       .num_dsi = 2,
>>   };
>>   @@ -60,7 +64,9 @@ static const struct msm_dsi_config msm8916_dsi_cfg = {
>>       .num_regulators = ARRAY_SIZE(msm8916_dsi_regulators),
>>       .bus_clk_names = dsi_8916_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_8916_bus_clk_names),
>> -    .io_start = { 0x1a98000 },
>> +    .io_start = {
>> +        { 0x1a98000 },
>> +    },
>>       .num_dsi = 1,
>>   };
>>   @@ -79,7 +85,9 @@ static const struct msm_dsi_config msm8976_dsi_cfg = {
>>       .num_regulators = ARRAY_SIZE(msm8976_dsi_regulators),
>>       .bus_clk_names = dsi_8976_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_8976_bus_clk_names),
>> -    .io_start = { 0x1a94000, 0x1a96000 },
>> +    .io_start = {
>> +        { 0x1a94000, 0x1a96000 },
>> +    },
>>       .num_dsi = 2,
>>   };
>>   @@ -98,7 +106,9 @@ static const struct msm_dsi_config msm8994_dsi_cfg = {
>>       .num_regulators = ARRAY_SIZE(msm8994_dsi_regulators),
>>       .bus_clk_names = dsi_6g_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
>> -    .io_start = { 0xfd998000, 0xfd9a0000 },
>> +    .io_start = {
>> +        { 0xfd998000, 0xfd9a0000 },
>> +    },
>>       .num_dsi = 2,
>>   };
>>   @@ -118,7 +128,9 @@ static const struct msm_dsi_config msm8996_dsi_cfg = {
>>       .num_regulators = ARRAY_SIZE(msm8996_dsi_regulators),
>>       .bus_clk_names = dsi_8996_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_8996_bus_clk_names),
>> -    .io_start = { 0x994000, 0x996000 },
>> +    .io_start = {
>> +        { 0x994000, 0x996000 },
>> +    },
>>       .num_dsi = 2,
>>   };
>>   @@ -137,7 +149,9 @@ static const struct msm_dsi_config msm8998_dsi_cfg = {
>>       .num_regulators = ARRAY_SIZE(msm8998_dsi_regulators),
>>       .bus_clk_names = dsi_msm8998_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_msm8998_bus_clk_names),
>> -    .io_start = { 0xc994000, 0xc996000 },
>> +    .io_start = {
>> +        { 0xc994000, 0xc996000 },
>> +    },
>>       .num_dsi = 2,
>>   };
>>   @@ -155,7 +169,9 @@ static const struct msm_dsi_config sdm660_dsi_cfg = {
>>       .num_regulators = ARRAY_SIZE(sdm660_dsi_regulators),
>>       .bus_clk_names = dsi_sdm660_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_sdm660_bus_clk_names),
>> -    .io_start = { 0xc994000, 0xc996000 },
>> +    .io_start = {
>> +        { 0xc994000, 0xc996000 },
>> +    },
>>       .num_dsi = 2,
>>   };
>>   @@ -177,7 +193,9 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
>>       .num_regulators = ARRAY_SIZE(sdm845_dsi_regulators),
>>       .bus_clk_names = dsi_sdm845_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
>> -    .io_start = { 0xae94000, 0xae96000 },
>> +    .io_start = {
>> +        { 0xae94000, 0xae96000 },
>> +    },
>>       .num_dsi = 2,
>>   };
>>   @@ -191,7 +209,9 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
>>       .num_regulators = ARRAY_SIZE(sm8550_dsi_regulators),
>>       .bus_clk_names = dsi_sdm845_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
>> -    .io_start = { 0xae94000, 0xae96000 },
>> +    .io_start = {
>> +        { 0xae94000, 0xae96000 },
>> +    },
>>       .num_dsi = 2,
>>   };
>>   @@ -205,7 +225,9 @@ static const struct msm_dsi_config sc7180_dsi_cfg = {
>>       .num_regulators = ARRAY_SIZE(sc7180_dsi_regulators),
>>       .bus_clk_names = dsi_sc7180_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
>> -    .io_start = { 0xae94000 },
>> +    .io_start = {
>> +        { 0xae94000 },
>> +    },
>>       .num_dsi = 1,
>>   };
>>   @@ -223,7 +245,9 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
>>       .num_regulators = ARRAY_SIZE(sc7280_dsi_regulators),
>>       .bus_clk_names = dsi_sc7280_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_sc7280_bus_clk_names),
>> -    .io_start = { 0xae94000, 0xae96000 },
>> +    .io_start = {
>> +        { 0xae94000, 0xae96000 },
>> +    },
>>       .num_dsi = 2,
>>   };
>>   @@ -241,7 +265,9 @@ static const struct msm_dsi_config qcm2290_dsi_cfg = {
>>       .num_regulators = ARRAY_SIZE(qcm2290_dsi_cfg_regulators),
>>       .bus_clk_names = dsi_qcm2290_bus_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_qcm2290_bus_clk_names),
>> -    .io_start = { 0x5e94000 },
>> +    .io_start = {
>> +        { 0x5e94000 },
>> +    },
>>       .num_dsi = 1,
>>   };
>>   diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> index 44be4a88aa83..df9f09876ccb 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> @@ -32,13 +32,16 @@
>>     #define DSI_6G_REG_SHIFT    4
>>   +/* Maximum number of configurations matched against the same hw revision */
>> +#define VARIANTS_MAX            2
>> +
>>   struct msm_dsi_config {
>>       u32 io_offset;
>>       const struct regulator_bulk_data *regulator_data;
>>       int num_regulators;
>>       const char * const *bus_clk_names;
>>       const int num_bus_clks;
>> -    const resource_size_t io_start[DSI_MAX];
>> +    const resource_size_t io_start[VARIANTS_MAX][DSI_MAX];
>>       const int num_dsi;
>>   };
>>   diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 18fa30e1e858..22ba8726b0ea 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -1869,7 +1869,7 @@ static int dsi_host_get_id(struct msm_dsi_host *msm_host)
>>           return -EINVAL;
>>         for (i = 0; i < cfg->num_dsi; i++) {
>> -        if (cfg->io_start[i] == res->start)
>> +        if (cfg->io_start[0][i] == res->start)
>>               return i;
>>       }
>>   
> 
