Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 172F66D04EB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A04D10E2F1;
	Thu, 30 Mar 2023 12:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223F010E2F1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:38:29 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id e21so19436808ljn.7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 05:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680179907;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=akRZyjqJclMdbp3N5bLTzvOQ/s247q8kDmVY+hohIX4=;
 b=LHhr/8GHEec7cDYXglHq9/Rv6mNTRGf7cNzyfxbrM1tVojyNSEcehJt9P0rkt+iRsZ
 BVb+fjEwQGkK8F7QkU1LyJGExkLYEFldRrBH0ulgD825ezPT3BexDGNUuoZJ9pRktQZr
 FdrEKRVG+1Ir1ae6QV1HzWn+qhyeMiyxdoXLlJSZ3UVyHrqh7YWY3vMMFK2ehkPeYbUt
 Jq5b5GDvctB1yeRdckp+u2N5fcg41Mg802C1k8QyewxbzZlVaYOqL818UAT/VAzOqkR5
 xMvq4ZvwCHlnjmtPVGNEine0GjfvZal1JeP7TXhRwwvwyxHeaCIjVkg6f4WFdehS+TUn
 AJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680179907;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=akRZyjqJclMdbp3N5bLTzvOQ/s247q8kDmVY+hohIX4=;
 b=wW4ELgjk9EBKkumeWERHa/aHIG29YNbQW2HY1nOW0Rm0IISP42nJVaQpWOimvL6i+U
 eZWCt7EPEUYridZTDNGNCN9dCGZkXAfpB40/Z99DvXuRaCRXCuyl3c/vst5ZgS2Ku3Df
 A9eYVxhOPOgUDHQhzqD6A3PUd4zb9ACzcPFCsYh15mngUrXBX1ns6X5rXA6buMdpwBjP
 6zB9pEWAH7aPnjmdgC7YmFsv2b1/hLvZmOXIH3GCZ4XobPBaCtysphbPfsFeqtbff/FQ
 ACetK5uJOQwb0QAenzEvnrmp6vNfGFCZ1mzeoP6aL4pS+noQH2fEIMQF75cP1mQF1/rX
 593w==
X-Gm-Message-State: AAQBX9fbiGA/SuqSJR11OTpuORXZp35JZPj+RuX2eOu1xCbPOPnXLm8H
 nmnRNFd0ggp0hmv0LhYtll5eVw==
X-Google-Smtp-Source: AKy350adA9ofQs86+ZGD0KxYL7LKIJfAhKSGxCfZ02uApda+TJqtVuHVJhj1AQGPK6HsEpi0hfmhGQ==
X-Received: by 2002:a05:651c:1028:b0:2a2:c618:1f51 with SMTP id
 w8-20020a05651c102800b002a2c6181f51mr6869251ljm.24.1680179907244; 
 Thu, 30 Mar 2023 05:38:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a2e900d000000b00290b375a068sm5873914ljg.39.2023.03.30.05.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:38:26 -0700 (PDT)
Message-ID: <60073c65-1df3-69f8-4755-798fe26a0905@linaro.org>
Date: Thu, 30 Mar 2023 15:38:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,38/50] drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-39-dmitry.baryshkov@linaro.org>
 <c7961d64-dc15-11d3-6269-74555c1c1b70@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c7961d64-dc15-11d3-6269-74555c1c1b70@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 15:33, Konrad Dybcio wrote:
> 
> 
> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>> Mark DSPP_2 and DSPP_3 as used for LM_2 and LM_3
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> Could you point me to where it's specified downstream? I can't find it.

https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/77276ed6a0055a4a0f41d7b0395a8b0bbcafd091/msm/sde/sde_hw_catalog.c#L2341

Which says assign DSPP to LMs for as long as we have a spare DSPP

> 
> Also, deserves a Fixes.

This is a tough question. We have been using sm8150_lm for sm8[2345]50. 
So before "drm/msm/dpu: duplicate sm8150 catalog entries" there is no 
way to fix that.

> 
> Konrad
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> index a3faaab2226c..3d95f2472e7a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> @@ -107,9 +107,9 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
>>   	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
>>   		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
>>   	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
>> -		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
>> +		&sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
>>   	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
>> -		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
>> +		&sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
>>   	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
>>   		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
>>   	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,

-- 
With best wishes
Dmitry

