Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C577B7D8017
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 11:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D8310E79B;
	Thu, 26 Oct 2023 09:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA0310E795
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 09:55:53 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4079ed65471so5356535e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 02:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698314152; x=1698918952; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=HzK9VMU7biBwtYpWfbq1vfPfka6gtKA3XTGeKlqZMFE=;
 b=O5Ura00NN011S+Un72BHeeSXscgPfqkF/ghujW3ojWY1A3oI5YgMF9qyVtjuG8co0m
 4y4ZAtyOiEuAiCcgOLeOajSSrKaouIjgoJ7maleUJSE/lHz98DNTG0CGm9fveTwEqvym
 TXq88kEPqi0JNrYLsosWcHeNCVk7pbCm4BU2vwbrVzWar59Dw/GX8mTrpoiUPPBkdS7D
 ZVsx7CBhCUjQiYsM4i6a3nykuJ/GVXE3D3ST80bI7dBvSlJBg/l1PNePP41j+js/XbIN
 hg2oyr7/PbLCyaRWT5eLc/joPdKru9c46GmbSzjug1AiOS/weKlRU0k4lD0lfCGaAfIW
 7iIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698314152; x=1698918952;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HzK9VMU7biBwtYpWfbq1vfPfka6gtKA3XTGeKlqZMFE=;
 b=kb7SAgnMvlT0CPND6JzA45vvJ9um6eBvhe/HqN7Oldry0CM5UNHrJeVWHwyEp3JJDO
 0U+t+G4GyeD7LPVJt99TkFX9smuJryO42G2clu4OAMw6n/c0z5L7oGhPYBRSAu3CKhWS
 yx0PPbW8tkZTAmXzh9MIZzSDwhGO5E9n0XRdigG/SnqeUxUtpq9rHIRSgv2Vl5059R2l
 a778Rm2EC8inNIT+dq2l+l8T1xbwmOV8/yjdI8hFO23XzYNZyPbv2H6kVaA4phCAJNvP
 QM4N3DFpdsC1dDUL1YB7W629r+A6dUn60/o42Cv7FQQHWVzdHLJZMQD5gl5ADgRerfl+
 6ULg==
X-Gm-Message-State: AOJu0YyYSF226NPhgPGudnsasDqaWkiUSZGDkj4c3dnBEwiM3nJ5hmEn
 b0IjPnwOE7Rwvjpc6jpPLVE42A==
X-Google-Smtp-Source: AGHT+IFb0olVf7k+kG9TMpqi8I49DaAUrabsj77Wjiv7YCbMUEoPbXGZ2VvBCXxZiIXUx1mwSdp7Ww==
X-Received: by 2002:adf:ef48:0:b0:32d:84a3:f3fe with SMTP id
 c8-20020adfef48000000b0032d84a3f3femr12620181wrp.41.1698314151935; 
 Thu, 26 Oct 2023 02:55:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f57f:eb08:d29b:8c9c?
 ([2a01:e0a:982:cbb0:f57f:eb08:d29b:8c9c])
 by smtp.gmail.com with ESMTPSA id
 n12-20020adfe78c000000b00326f0ca3566sm13990599wrm.50.2023.10.26.02.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 02:55:51 -0700 (PDT)
Message-ID: <24ee41f5-1eb3-4f46-b198-a3123a64a39c@linaro.org>
Date: Thu, 26 Oct 2023 11:55:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 7/8] drm/msm: dsi: add support for DSI-PHY on SM8650
Content-Language: en-US, fr
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231025-topic-sm8650-upstream-mdss-v1-0-bb219b8c7a51@linaro.org>
 <20231025-topic-sm8650-upstream-mdss-v1-7-bb219b8c7a51@linaro.org>
 <CAA8EJpr+QGBFchG9aXJLxyhbMwMWZF6RjSVOpORkP_KFrV=P1A@mail.gmail.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <CAA8EJpr+QGBFchG9aXJLxyhbMwMWZF6RjSVOpORkP_KFrV=P1A@mail.gmail.com>
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
Reply-To: neil.armstrong@linaro.org
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/10/2023 10:03, Dmitry Baryshkov wrote:
> On Wed, 25 Oct 2023 at 10:35, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> Add DSI PHY support for the SM8650 platform.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 27 +++++++++++++++++++++++++++
>>   3 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>> index 05621e5e7d63..7612be6c3618 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>> @@ -585,6 +585,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>>            .data = &dsi_phy_5nm_8450_cfgs },
>>          { .compatible = "qcom,sm8550-dsi-phy-4nm",
>>            .data = &dsi_phy_4nm_8550_cfgs },
>> +       { .compatible = "qcom,sm8650-dsi-phy-4nm",
>> +         .data = &dsi_phy_4nm_8650_cfgs },
>>   #endif
>>          {}
>>   };
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
>> index 8b640d174785..e4275d3ad581 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
>> @@ -62,6 +62,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
>>   extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
>>   extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
>>   extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
>> +extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
>>
>>   struct msm_dsi_dphy_timing {
>>          u32 clk_zero;
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> index 3b1ed02f644d..c66193f2dc0d 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> @@ -1121,6 +1121,10 @@ static const struct regulator_bulk_data dsi_phy_7nm_37750uA_regulators[] = {
>>          { .supply = "vdds", .init_load_uA = 37550 },
>>   };
>>
>> +static const struct regulator_bulk_data dsi_phy_7nm_98000uA_regulators[] = {
>> +       { .supply = "vdds", .init_load_uA = 98000 },
>> +};
>> +
>>   static const struct regulator_bulk_data dsi_phy_7nm_97800uA_regulators[] = {
>>          { .supply = "vdds", .init_load_uA = 97800 },
>>   };
>> @@ -1281,3 +1285,26 @@ const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs = {
>>          .num_dsi_phy = 2,
>>          .quirks = DSI_PHY_7NM_QUIRK_V5_2,
>>   };
>> +
>> +const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs = {
> 
> So, this is the same as sm8550 config, just using 400 uA less? I
> wonder if it makes sense to go for setting the regulator mode instead
> of setting the load.

I have no idea, we keep changing this but indeed we should instead change
the regulator mode, it's safer to keep it that way until we figure that out.

I'll double check anyway

> 
> Nevertheless (unless you'd like to reuse sm8550 config entry):
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks,
Neil

> 
>> +       .has_phy_lane = true,
>> +       .regulator_data = dsi_phy_7nm_98000uA_regulators,
>> +       .num_regulators = ARRAY_SIZE(dsi_phy_7nm_98000uA_regulators),
>> +       .ops = {
>> +               .enable = dsi_7nm_phy_enable,
>> +               .disable = dsi_7nm_phy_disable,
>> +               .pll_init = dsi_pll_7nm_init,
>> +               .save_pll_state = dsi_7nm_pll_save_state,
>> +               .restore_pll_state = dsi_7nm_pll_restore_state,
>> +               .set_continuous_clock = dsi_7nm_set_continuous_clock,
>> +       },
>> +       .min_pll_rate = 600000000UL,
>> +#ifdef CONFIG_64BIT
>> +       .max_pll_rate = 5000000000UL,
>> +#else
>> +       .max_pll_rate = ULONG_MAX,
>> +#endif
>> +       .io_start = { 0xae95000, 0xae97000 },
>> +       .num_dsi_phy = 2,
>> +       .quirks = DSI_PHY_7NM_QUIRK_V5_2,
>> +};
>>
>> --
>> 2.34.1
>>
> 
> 

