Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F686F3112
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 14:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447BC10E0FA;
	Mon,  1 May 2023 12:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70FE10E0FA
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 12:41:55 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4efefbd2c5eso3073298e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 May 2023 05:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682944913; x=1685536913;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kRAAC9w75oB/bIFgwxyTbBa5xqYXWbXvoGPKDNUWQSc=;
 b=zCAcfUi4sMydaQf3bWSZhtQ+7vrCZpB4JSecvfQIDL7W/UjnSOSDl9VWfMu+zpkfCp
 U01caRTVNBS1XLe/DX1lIpJbicWq1AOAuLcWJ84VyfmlMbZQghUjObMbb1GUaYedx8C8
 qEO9WpDOVMyLlPx5u3qqyg5P4MdlTsn4+E6gaCZWLjur9tNHK9kMbY7zM3nilqvXrp3N
 hccqFYzlACsnszl2tLO7VBvueuuYQNGPRDPQoNbcxrod2ultC2xbWaW194p97m8no0Pd
 PR4Db3+xyEQqrIkniSqcvgXpxO4LWX5keL5ULyh2VVnnfmqPjmgZ3t/ihPCevKf96C/F
 W0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682944913; x=1685536913;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kRAAC9w75oB/bIFgwxyTbBa5xqYXWbXvoGPKDNUWQSc=;
 b=Ik1e+Extrbs2WGCRUFpTda54JDburwrzl0vlYPEZp37QhgRkPeMoRJLKXf1pTGY56J
 AL+WdVG6MQI58Jl2S4R4IOJ6pLTs85SwUecjbuWjiJpIEfwETvbh030I1rSFyNhsE/49
 p/M+94E7cI1vD1o2lm/2s2wFIFbaRWhhm53NKSYeSDiO269QYhMdaoNdsOvKLIOwkdXq
 N7Kc4TZzuDZHTl+p3IK/yG288bcKPxrQjzyVK5Mg1cxLl90KtsTnGc2zVbnYys4ZE2Iu
 tpf5zV1yQKJRGji5wGmbblRE3inJughYKLX4G/sZzyJXqruHW6n+C7L+bgjRGMjLSPoz
 Ax+A==
X-Gm-Message-State: AC+VfDxPD27zaC2pMC8zMaiSTtwMXyDKo9M/ZVPtaYDDHtFAslwMT1St
 o9/moarocLcFBkeWF4cRMugyug==
X-Google-Smtp-Source: ACHHUZ72hLbvezX9uXS2Nydb9J0ngfEYbPtHxnRItKvjEZMFhFA2lLzYs5k6sPy+hyIKhRZ24pQzVA==
X-Received: by 2002:a05:6512:21ab:b0:4eb:252e:3ec5 with SMTP id
 c11-20020a05651221ab00b004eb252e3ec5mr3596940lft.14.1682944913514; 
 Mon, 01 May 2023 05:41:53 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 q27-20020ac2515b000000b004efe8174586sm4008405lfd.126.2023.05.01.05.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 05:41:53 -0700 (PDT)
Message-ID: <cfe771e1-6ce8-b6c5-dd65-ed18f84543a5@linaro.org>
Date: Mon, 1 May 2023 14:41:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] drm/msm/dsi: don't allow enabling 14nm VCO with
 unprogrammed rate
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230501011257.3460103-1-dmitry.baryshkov@linaro.org>
 <7cf248ee-d966-3aa5-91f1-3d93ab71cd4b@linaro.org>
 <516a1313-5dff-d471-2c41-405e2beed4d6@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <516a1313-5dff-d471-2c41-405e2beed4d6@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1.05.2023 14:39, Dmitry Baryshkov wrote:
> On 01/05/2023 15:37, Konrad Dybcio wrote:
>>
>>
>> On 1.05.2023 03:12, Dmitry Baryshkov wrote:
>>> If the dispcc uses CLK_OPS_PARENT_ENABLE (e.g. on QCM2290), CCF can try
>>> enabling VCO before the rate has been programmed. This can cause clock
>>> lockups and/or other boot issues. Program the VCO to the minimal PLL
>>> rate if the read rate is 0 Hz.
>>>
>>> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> I think this should also be implemented on other PLL gens.
>>
>>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
>>> index 9f488adea7f5..3ce45b023e63 100644
>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
>>> @@ -539,6 +539,9 @@ static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
>>>       if (unlikely(pll_14nm->phy->pll_on))
>>>           return 0;
>>>   +    if (dsi_pll_14nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
>>> +        dsi_pll_14nm_vco_set_rate(hw, pll_14nm->phy->cfg->min_pll_rate, VCO_REF_CLK_RATE);
>> VCO_REF_CLK_RATE ---> phy->cfg->min_pll_rate (VCO_MIN_RATE)?
> 
> No, this is the parent rate, which is VCO_REF_CLK_RATE for all practical purposes.
right!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

This probably deserves

Fixes: f079f6d999cb ("drm/msm/dsi: Add PHY/PLL for 8x96")

as the driver previously allowed for erroneous (and inherently racy) behavior

Konrad
> 
>>
>> Konrad
>>> +
>>>       dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VREF_CFG1, 0x10);
>>>       dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 1);
>>>   
> 
