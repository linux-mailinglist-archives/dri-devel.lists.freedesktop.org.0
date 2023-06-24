Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F66D73CB20
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 15:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FF010E13D;
	Sat, 24 Jun 2023 13:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AAB10E13D
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 13:51:40 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b45e347266so25093831fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 06:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687614698; x=1690206698;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3Oi1lF/kkeimU7XmipbBvg8q7/HjZupz5o5jzKFagIM=;
 b=IEz5Il4BczoOZSDNpKTWfxYQIXnw1PWYudJXZYKUh1P1aLgWGSoQgbgodcvqZI1clF
 oWRhs1G4zYF+AoqU+SYfNPkiyC5q4INa0Mok0aP9M0heefBSXKJZ8zH/dVmo0mwR9sFJ
 nl42A5o3UeS0BuJ+x0wvJ1ABU5GFzn1CHGJ/SI7XLNVqdPv9FVyOX3dIz1ON3qA2NzDx
 UsAJjsq7/UPGAf1/nJsuZuls/3oCtLrrwZLgFw2TMmmIodteMqm1Ul1E2OClrhPqpfd/
 D9XZAlZ6m029jawHWoHoTsl9VEhFikItbhwz6BGJ5rRb3CxTMq9KuqFvmULxl6zOFaMl
 vFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687614698; x=1690206698;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Oi1lF/kkeimU7XmipbBvg8q7/HjZupz5o5jzKFagIM=;
 b=AMncIyayB/1Gg/ckSBSTm1RKeuFQ3COo7Siv08Q3fUej8eCzoIatfGgqFP2vN3EDSJ
 A2ftcM+yb61rk2Qh4Qp+kTAX/7BL/ObKqmQrp8M/k7uXvzdK5kZNXCHp+51tzJjp8/mM
 TaKiu0it8717gjuUl6YYMLPe3f5+aLgpOpA2wF9qfErtha4bQFQQACC451N1+dIXjXvv
 K3HbkVDXqQkSPw2VMq3bhbo+73Lbs9gPC7RcGfbZjhqRedCm/X7bz/xww6fkuTCBQVip
 cwqiAXuv7uMHAJ/ptloBPhYc0+gJ/R9G5/1b5V0xwad1GSMOZ4o0v/QVRbICTB1M8Qv4
 2v7w==
X-Gm-Message-State: AC+VfDyumewUVyuN9Z2skG1vYoEnlR+YOP5QOVvSjq1BntnGuOevqPNT
 7dS2JCeovNlqLsDJODsXGgIR5g==
X-Google-Smtp-Source: ACHHUZ5FCA1DOZju+00ypB3OMYq3OCOWTLOYqZr6LPhb+QsOvI4uav5IUweih4iBraBcA7xOnGeREg==
X-Received: by 2002:a2e:83d0:0:b0:2b4:792d:a4ad with SMTP id
 s16-20020a2e83d0000000b002b4792da4admr10979503ljh.26.1687614698631; 
 Sat, 24 Jun 2023 06:51:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a2e8955000000b002b1a872c826sm282414ljk.61.2023.06.24.06.51.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jun 2023 06:51:38 -0700 (PDT)
Message-ID: <a91a9866-c31a-5136-02c0-78ab6e7bcd1d@linaro.org>
Date: Sat, 24 Jun 2023 16:51:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 11/15] drm/msm/dsi: Add 14nm phy configuration for SM6125
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-11-1d5a638cebf2@somainline.org>
 <18d969bb-69b5-0d42-1518-e8a3b92859b7@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <18d969bb-69b5-0d42-1518-e8a3b92859b7@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Lux Aliaga <they@mint.lgbt>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/06/2023 04:49, Konrad Dybcio wrote:
> On 24.06.2023 02:41, Marijn Suijten wrote:
>> SM6125 features only a single PHY (despite a secondary PHY PLL source
>> being available to the disp_cc_mdss_pclk0_clk_src clock), and downstream
>> sources for this "trinket" SoC do not define the typical "vcca"
>> regulator to be available nor used.
>>
>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>> ---
> The introduced ops are identical to 2290, modulo regulator..
> 
> But the regulator is absent on both (VDD_MX powers it instead), so
> feel free to clean that up and reuse it ;)

Could you please send a fix for qcm2290?

> 
> Konrad
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 15 +++++++++++++++
>>   3 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>> index 9d5795c58a98..8688ed502dcf 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>> @@ -559,6 +559,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>>   	  .data = &dsi_phy_14nm_2290_cfgs },
>>   	{ .compatible = "qcom,dsi-phy-14nm-660",
>>   	  .data = &dsi_phy_14nm_660_cfgs },
>> +	{ .compatible = "qcom,dsi-phy-14nm-6125",
>> +	  .data = &dsi_phy_14nm_6125_cfgs },
>>   	{ .compatible = "qcom,dsi-phy-14nm-8953",
>>   	  .data = &dsi_phy_14nm_8953_cfgs },
>>   #endif
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
>> index 8b640d174785..ebf915f5e6c6 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
>> @@ -52,6 +52,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
>>   extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
>>   extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
>>   extern const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs;
>> +extern const struct msm_dsi_phy_cfg dsi_phy_14nm_6125_cfgs;
>>   extern const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs;
>>   extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
>>   extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
>> index 3ce45b023e63..5d43c9ec69ae 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
>> @@ -1068,6 +1068,21 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
>>   	.num_dsi_phy = 2,
>>   };
>>   
>> +const struct msm_dsi_phy_cfg dsi_phy_14nm_6125_cfgs = {
>> +	.has_phy_lane = true,
>> +	.ops = {
>> +		.enable = dsi_14nm_phy_enable,
>> +		.disable = dsi_14nm_phy_disable,
>> +		.pll_init = dsi_pll_14nm_init,
>> +		.save_pll_state = dsi_14nm_pll_save_state,
>> +		.restore_pll_state = dsi_14nm_pll_restore_state,
>> +	},
>> +	.min_pll_rate = VCO_MIN_RATE,
>> +	.max_pll_rate = VCO_MAX_RATE,
>> +	.io_start = { 0x5e94400 },
>> +	.num_dsi_phy = 1,
>> +};
>> +
>>   const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs = {
>>   	.has_phy_lane = true,
>>   	.regulator_data = dsi_phy_14nm_17mA_regulators,
>>

-- 
With best wishes
Dmitry

