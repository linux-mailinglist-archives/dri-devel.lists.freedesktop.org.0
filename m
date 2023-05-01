Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE656F30FA
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 14:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64B910E0E5;
	Mon,  1 May 2023 12:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984FE10E0E5
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 12:39:23 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4efe8991bafso3412800e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 May 2023 05:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682944761; x=1685536761;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=txv8tQSio/M3dr4hEPoHmQc4pniTKGNhytxfW6spvgI=;
 b=KSRQ2R4Sz5YdufUS6lM14Io9QXefXtExQ2pWueysRvPauRftuHvhUeZ1bI1TbV3Tzu
 xmmHCdo/IU8xtjilSr8bueOb2ISWezC+gzzWqwxYJYcqIIztdPJQwFDQC5gR5mRjX2VR
 FD8Jv0WR7T+pU6nsYVFuBG5DEFu2xisYEvIx7vDQDj1ARsuAYmLGRNBZvX04OH9Z+HG7
 weRW4wU9uWKqybWfHRDTq6+Gq2Dw1mnG4P8O59ZslOHInWJfIcjxyLdmNxrZc7kzQmat
 NxXZe+ZgUS+f52xLRJaJM9Dgw541L6eurO2wJhc6gh0v6MUGcRq3IB6wbI5HnT1vUrsU
 ajYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682944761; x=1685536761;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=txv8tQSio/M3dr4hEPoHmQc4pniTKGNhytxfW6spvgI=;
 b=lQ9sQZt3Lfsjc1iG10QrAl/szYdd01q5NEo2SetENHSPInuICSxM0YaPoa0753EzYj
 /tztrfl5fDlH1SPobXWwLykaepj4nElZk0YxIUpsj8+JPgO+bqcgxlvyLYKE1MMoeyhq
 N9tkF8bWb7W7NjQqgbvz8hhR2hEkxiw+12HDesoSICpJCP7e4Wc1vf498PnB2NTLsSS1
 J/c5W1SISBL3scZkwQme5Lf1dq4dhjFIA26z34qgmRfcdel6RpC5kpL3ePbu9ApMAN2z
 VYwtEQz6zUcnzZWHde6xH8zwc3XgSMNn/UVm+ZZYX8wwQgyd4AEMPINeWyBFYgLckOds
 rNGQ==
X-Gm-Message-State: AC+VfDyrKAE0u/KJLB6+eZumkjq+mb8NVQgaJMULkGnfDsk0zby9n6z5
 geTBLv9KmKyujiiU9tweUmjrHT1teFFX4AXloWY=
X-Google-Smtp-Source: ACHHUZ537lR+5PkqrFZ3S2brdOeZdCOK7zcgsaCORpxqMGPqbBWcXLvuItzwaWxyKhQmJnG3m8pdxg==
X-Received: by 2002:ac2:511d:0:b0:4ef:f64b:65a9 with SMTP id
 q29-20020ac2511d000000b004eff64b65a9mr3750337lfb.36.1682944761355; 
 Mon, 01 May 2023 05:39:21 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q27-20020ac2529b000000b004f021a4e5f6sm1038349lfm.52.2023.05.01.05.39.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 05:39:20 -0700 (PDT)
Message-ID: <516a1313-5dff-d471-2c41-405e2beed4d6@linaro.org>
Date: Mon, 1 May 2023 15:39:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/msm/dsi: don't allow enabling 14nm VCO with
 unprogrammed rate
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230501011257.3460103-1-dmitry.baryshkov@linaro.org>
 <7cf248ee-d966-3aa5-91f1-3d93ab71cd4b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <7cf248ee-d966-3aa5-91f1-3d93ab71cd4b@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/05/2023 15:37, Konrad Dybcio wrote:
> 
> 
> On 1.05.2023 03:12, Dmitry Baryshkov wrote:
>> If the dispcc uses CLK_OPS_PARENT_ENABLE (e.g. on QCM2290), CCF can try
>> enabling VCO before the rate has been programmed. This can cause clock
>> lockups and/or other boot issues. Program the VCO to the minimal PLL
>> rate if the read rate is 0 Hz.
>>
>> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> I think this should also be implemented on other PLL gens.
> 
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
>> index 9f488adea7f5..3ce45b023e63 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
>> @@ -539,6 +539,9 @@ static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
>>   	if (unlikely(pll_14nm->phy->pll_on))
>>   		return 0;
>>   
>> +	if (dsi_pll_14nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
>> +		dsi_pll_14nm_vco_set_rate(hw, pll_14nm->phy->cfg->min_pll_rate, VCO_REF_CLK_RATE);
> VCO_REF_CLK_RATE ---> phy->cfg->min_pll_rate (VCO_MIN_RATE)?

No, this is the parent rate, which is VCO_REF_CLK_RATE for all practical 
purposes.

> 
> Konrad
>> +
>>   	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VREF_CFG1, 0x10);
>>   	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 1);
>>   

-- 
With best wishes
Dmitry

