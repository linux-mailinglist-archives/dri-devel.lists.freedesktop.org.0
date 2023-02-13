Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B7F6940C5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 10:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FE510E500;
	Mon, 13 Feb 2023 09:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2E510E503
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 09:20:27 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id sa10so30119274ejc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 01:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SDDFIIaWpsZFTDw2O2h1MSF5xYK1K+uCRehpNOjoeqk=;
 b=FHFpfsiPbhIgCXBr+ScZv5ioWHMLabZ2mqshJoSdHtBmHlTHvuOzh8SX4kMAYjhVdG
 4B7U3Jj9b8/3oBQVdkXTjGDFX8B3dES2oLbNfl64VEUiptP87Qy8vrW9M+XPsD1AiWIL
 VJOE02A6upy4Z0hCu2lbEcr+qRAJTuLhzYRAEwYPIkY+vOhrenoV3c4I6z9DNtyglWrJ
 fbf4DMr56oLQPp8vQ0D6ik+O1Z84xiqSmlBDeH1ouT6bGYy+SJSwbDuXZif5i9/Et8h2
 XT238gi28rPOW3Bvfb2P73pWXHBC1Ns2owY5knelZE9ZrA0WQSfD34sTETnhTJLIqdC3
 mcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SDDFIIaWpsZFTDw2O2h1MSF5xYK1K+uCRehpNOjoeqk=;
 b=slPX/9nYL3Q5tUUjJ+2tYTN3UncJQzLVncUb98oYAja1Iq5dZgjU33beIPqAzAnugZ
 zYeXgDFuUqWv/1roa0XoaTqIG9JWUCyoZ9GGDpGCEWf1RPdstGK2Gv6oBMomkRzWJzVU
 LvkH7K26Vbij1wK3ueKFpUAA6k+8dlkO9D8NTmT9fbxVDRoX0HKEoj6A2D0VceiZOqzZ
 z1IaZP2nBY9aIqhi+8rennULsCFQHma+IBCGqdwvudUXXlzLe61Kw32kw42tWJVzWDwz
 fiNVVxpxdNV2VnRvrmGLRcpf4QW5nXeWxLpCyKds9NMyJqwTtf2dYdkuRoZAcPZkm0x0
 vbew==
X-Gm-Message-State: AO0yUKVU8KJ+4oDNXGzuQwR7bi01U4QD9sj0G/mZxtIlIlp61ok/j5iY
 Me2Ba+/uyT0PkHVW27Z3K/lmlw==
X-Google-Smtp-Source: AK7set95W8Ex46Zp9yW4bB2QEUdCsOwQWxTpEQYhsmAxdLhzAedmHI3UnPG28wRmrWObyph1Swvifg==
X-Received: by 2002:a17:907:c21:b0:8af:514f:1078 with SMTP id
 ga33-20020a1709070c2100b008af514f1078mr13187786ejc.31.1676280027099; 
 Mon, 13 Feb 2023 01:20:27 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a170906b00100b0087862f45a29sm6524747ejy.174.2023.02.13.01.20.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 01:20:26 -0800 (PST)
Message-ID: <db1d04ed-1841-5bcc-2611-84aa8fcec682@linaro.org>
Date: Mon, 13 Feb 2023 10:20:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 06/10] drm/msm/dsi: dsi_cfg: Merge SC7180 config into
 SDM845
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
References: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
 <20230211115110.1462920-7-konrad.dybcio@linaro.org>
 <d8d13ded-9f37-e96a-e34f-4e885fd15c0d@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <d8d13ded-9f37-e96a-e34f-4e885fd15c0d@linaro.org>
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
 Loic Poulain <loic.poulain@linaro.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11.02.2023 16:52, Dmitry Baryshkov wrote:
> On 11/02/2023 13:51, Konrad Dybcio wrote:
>> The configs are identical, other than the number of *maximum* DSI
>> hosts allowed. This isn't an issue, unless somebody deliberately
>> tries to access the inexistent host by adding a dt node for it.
>>
>> Remove the SC7180 struct and point the hw revision match to the
>> SDM845's one. On a note, this could have been done back when
>> 7180 support was introduced.
>>
>> Fixes: 6125bd327e16 ("drm/msm: add DSI support for sc7180")
> 
> Same comment regarding Fixes
Ack.

Konrad
> 
> Other than that:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_cfg.c | 15 ++-------------
>>   1 file changed, 2 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> index 860681bfc084..142a0f1e2576 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> @@ -169,7 +169,7 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
>>       .bus_clk_names = dsi_v2_4_clk_names,
>>       .num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
>>       .io_start = {
>> -        { 0xae94000, 0xae96000, 0 },
>> +        { 0xae94000, 0xae96000, 0 }, /* SDM845 / SDM670 / SC7180 */
>>       },
>>   };
>>   @@ -188,17 +188,6 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
>>       },
>>   };
>>   -static const struct msm_dsi_config sc7180_dsi_cfg = {
>> -    .io_offset = DSI_6G_REG_SHIFT,
>> -    .regulator_data = dsi_v2_4_regulators,
>> -    .num_regulators = ARRAY_SIZE(dsi_v2_4_regulators),
>> -    .bus_clk_names = dsi_v2_4_clk_names,
>> -    .num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
>> -    .io_start = {
>> -        { 0xae94000, 0 },
>> -    },
>> -};
>> -
>>   static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
>>       { .supply = "vdda", .init_load_uA = 8350 },    /* 1.2 V */
>>   };
>> @@ -299,7 +288,7 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>>       {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_0,
>>           &sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>>       {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
>> -        &sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>> +        &sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>>       {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
>>           &sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>>       {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,
> 
