Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7888866BD2C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 12:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F32F10E3D8;
	Mon, 16 Jan 2023 11:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2972610E3D9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 11:49:17 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id q2so29748957ljp.6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 03:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uUAbrSURx8Khf0HlL/kZdlVXE9xkryXsu1r8+broRMI=;
 b=FVAuEg1czWMlllnkYULrHRLt5WFiUjAdRAoXjk4i1AuAffQCF8lKeu9vTg1gYEqwO+
 KfbRjJilZKrlPpZCwqJTDCsLSxqrtQ4DUOUSLi4kvvUZ0dl8tFJhjiK1zdoiMXJCBQnW
 MDc1FA100zW9mzrylsNe2DI5ONQoHQ8Uu8EpQkG5lYGASHbR57qBftKba2f/XQSlb9lG
 Kqopf2jAuU+JzfN9KZH3iWqrPeo7zpWCjy8yG6kF5kI1byEf5+MOLuIz0d/p908OrBc6
 jgCx33GFWp2zxuXyxtOFwJh+qfjy1NCP+8lumePQoWEv5A/SO2CgkHGdSwo+vK9MfYGZ
 Lg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uUAbrSURx8Khf0HlL/kZdlVXE9xkryXsu1r8+broRMI=;
 b=PqY/EU42Xh71y77DnNPyaGltCGpshbfeC976JOrxJT0XKNrTyOocvHCrZtml071SX1
 SbIOI1M8eCcdEAaU3y7lcI9MwIhNrF0wmflPGJ3p/aq2094Ai6JWRrhyTWbWuKzmq8M9
 HWkq/0k2kQtKGtv0ELV3JDwDkkN7a/DCzDwCZ75CfbZgB/kI8aMtilGLPZ2XjRgX78n4
 1PnqCaKrdkTAI9wRJ/2xG396clmaXnAdNsRB1fFMilwo4H/cI3n7DqlizHmxqXRA/xaj
 BsupSIxxv64s5JFEmY42n/LlW7JiPN6IJIl9liqPoAWEDLK/lIgx8v9CP+tPggxL/sDX
 fQtg==
X-Gm-Message-State: AFqh2kqK46d8faVzZquXSCteIpFyrU6qCMUfM0ugZH9mqsG1yG8ByKed
 gAmgozGYYl47nNQvUlsua+Yz4w==
X-Google-Smtp-Source: AMrXdXtWDitnC0VttiztQIbhNA5dQhacWb0uAo5oHslocyRjaKDSlcpjVeu8MYt8GFLJ5XVIM4Uu1Q==
X-Received: by 2002:a2e:9a97:0:b0:287:801e:4424 with SMTP id
 p23-20020a2e9a97000000b00287801e4424mr7321168lji.37.1673869755472; 
 Mon, 16 Jan 2023 03:49:15 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a2e8e6c000000b0028b64c7bd75sm1273078ljk.139.2023.01.16.03.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 03:49:15 -0800 (PST)
Message-ID: <0df556d3-b478-d8e6-fa85-8696ff2377d0@linaro.org>
Date: Mon, 16 Jan 2023 12:49:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] drm/msm/dsi: Add phy configuration for SM6375
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230116114059.346327-1-konrad.dybcio@linaro.org>
 <20230116114059.346327-2-konrad.dybcio@linaro.org>
 <3b4e5183-25c4-ab04-6b0c-74a57540d00e@linaro.org>
 <CAA8EJprgFA-vod9vnt+uzptzgbvbrMSe+zOpd2ftsz0pS9jb8w@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJprgFA-vod9vnt+uzptzgbvbrMSe+zOpd2ftsz0pS9jb8w@mail.gmail.com>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 marijn.suijten@somainline.org, Jonathan Marek <jonathan@marek.ca>,
 agross@kernel.org, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, andersson@kernel.org,
 Douglas Anderson <dianders@chromium.org>, krzysztof.kozlowski@linaro.org,
 sunliming <sunliming@kylinos.cn>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 16.01.2023 12:47, Dmitry Baryshkov wrote:
> On Mon, 16 Jan 2023 at 13:42, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 16.01.2023 12:40, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@somainline.org>
>>>
>>> SM6375 uses a boring standard 7nm PHY. Add a configuration entry for it.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>>> ---
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Sorry, bit messy revisiting old patches before the email change..
>>
>> Konrad
>>> Depends on [1] to work properly, but won't hurt for it to land
>>> separately..
>>>
>>> [1] https://patchwork.kernel.org/project/linux-arm-msm/patch/1642586079-12472-1-git-send-email-loic.poulain@linaro.org/
>>>
>>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 20 ++++++++++++++++++++
>>>  3 files changed, 23 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>>> index cbe669fca26d..57445a5dc816 100644
>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>>> @@ -569,6 +569,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>>>         .data = &dsi_phy_7nm_8150_cfgs },
>>>       { .compatible = "qcom,sc7280-dsi-phy-7nm",
>>>         .data = &dsi_phy_7nm_7280_cfgs },
>>> +     { .compatible = "qcom,sm6375-dsi-phy-7nm",
>>> +       .data = &dsi_phy_7nm_6375_cfgs },
>>>       { .compatible = "qcom,sm8350-dsi-phy-5nm",
>>>         .data = &dsi_phy_5nm_8350_cfgs },
>>>       { .compatible = "qcom,sm8450-dsi-phy-5nm",
>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
>>> index 5f0b1c9b09ef..c849bfd7494e 100644
>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
>>> @@ -55,6 +55,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs;
>>>  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
>>>  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
>>>  extern const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs;
>>> +extern const struct msm_dsi_phy_cfg dsi_phy_7nm_6375_cfgs;
>>>  extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
>>>  extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
>>>  extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> index af5c952c6ad0..3b1ed02f644d 100644
>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> @@ -1152,6 +1152,26 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>>>       .quirks = DSI_PHY_7NM_QUIRK_V4_1,
>>>  };
>>>
>>> +const struct msm_dsi_phy_cfg dsi_phy_7nm_6375_cfgs = {
>>> +     .has_phy_lane = true,
> 
> Any regulators here?
Nope, looks like 7nm also deserves a "don't require vdds-supply"
patch, gonna send it right away..

Konrad
> 
>>> +     .ops = {
>>> +             .enable = dsi_7nm_phy_enable,
>>> +             .disable = dsi_7nm_phy_disable,
>>> +             .pll_init = dsi_pll_7nm_init,
>>> +             .save_pll_state = dsi_7nm_pll_save_state,
>>> +             .restore_pll_state = dsi_7nm_pll_restore_state,
>>> +     },
>>> +     .min_pll_rate = 600000000UL,
>>> +#ifdef CONFIG_64BIT
>>> +     .max_pll_rate = 5000000000ULL,
>>> +#else
>>> +     .max_pll_rate = ULONG_MAX,
>>> +#endif
>>> +     .io_start = { 0x5e94400 },
>>> +     .num_dsi_phy = 1,
>>> +     .quirks = DSI_PHY_7NM_QUIRK_V4_1,
>>> +};
>>> +
>>>  const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
>>>       .has_phy_lane = true,
>>>       .regulator_data = dsi_phy_7nm_36mA_regulators,
> 
> 
> 
