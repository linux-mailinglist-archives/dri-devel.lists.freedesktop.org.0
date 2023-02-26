Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2286A2F8C
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 13:59:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E2610E0A6;
	Sun, 26 Feb 2023 12:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52FD10E0A6
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 12:59:37 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id z42so3682739ljq.13
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 04:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u7AqhrHpy7D24ummh/8O9pL63VEF42zeM2+imtaKfbQ=;
 b=T3Nc+P2lu0Ei2sjTsr8OFKcmnpr8p2bytVOnFRKItBHaGAchTtAUyMFeE6+5uxwtmh
 krbshYDGSOnANQWDMh+yHmwk1AD8wtjfHJkkC2//Reeiip1HqWJi61SHzE5tSKE5yt3J
 7Te/iGlPNt3GGgttPph45hIp9lB/71H8JDQAZW3EXSPT/YkZJhjDR7MHB2owawgByXfA
 4HWsH8YC8McKTc5bB0TI+T8UJ6IBArfRoAxHMTWoerRJwVXgnB+ABJV1Rbv2WitrMTkG
 agCc9Oz8f7DGurRJX5vi0FFOCkaV/GpbVFJNa/VyAsC5BtdT/rmNFfZYVBKyN0OerD7B
 Za9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u7AqhrHpy7D24ummh/8O9pL63VEF42zeM2+imtaKfbQ=;
 b=lgcN8DaXXg1NiIS00wKD8hEArHNy+slljVOEvc5/oAeRyAT3rBwi/9X/55B9317X0P
 R7L9rO3RP/u74oF9p6iwC/CZmo3o8ta1S5tU5T+9Hq09BS6FUwjq7CPYA/mIBT2uHxBi
 0suNQEB6RNIcPILrFLePsqcIw0Ahn0t6CqfiAyizRwFkUSki2cmWw58VIPzb3qmUJvUY
 WATmn5dCXfjyGII6nOBIzZqQlcYlc6Aq6ckXnXNuruYo3AMeeue9Gq3aIl7D6FixEciY
 8kj+jxTf7AGU5km2pwO5w20/3+pPR6rL8Kqoacn4bN0YH57E5HJhTu8YcJeT1bAAY/qG
 szCw==
X-Gm-Message-State: AO0yUKXvMMD9w4MyvPLjlvxFpobhp1jUAes3eMDmifNONTOZZm3e/5er
 uGUvBcpIRUNwKg+SuNVIARbb3g==
X-Google-Smtp-Source: AK7set8xPB2ioUnO7U3xebgwAv+fHGs+Y/602hmlAK0+kP0fxnC9G0zBqMtxSdjsoY3p1e5fPVE/Jg==
X-Received: by 2002:a2e:350f:0:b0:294:669a:6adc with SMTP id
 z15-20020a2e350f000000b00294669a6adcmr6845872ljz.3.1677416375873; 
 Sun, 26 Feb 2023 04:59:35 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l6-20020ac24306000000b004d34238ca44sm548250lfh.214.2023.02.26.04.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 04:59:35 -0800 (PST)
Message-ID: <9c11e97a-31ba-621a-9322-1343199326fe@linaro.org>
Date: Sun, 26 Feb 2023 14:59:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 06/50] drm/msm/dpu: correct sm8550 scaler
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, neil.armstrong@linaro.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-7-dmitry.baryshkov@linaro.org>
 <5bc2221f-61ba-3801-6dbb-83587d986b50@linaro.org>
 <a589d45e-f084-9371-05dc-0676f12458a3@linaro.org>
 <e20d2b76-a446-019d-73db-6f16ba7cbfb5@linaro.org>
 <298eff36-1a55-75a8-d957-ab97504e5caf@quicinc.com>
 <2f7fb041-edf0-79b1-5005-2af19a3d4934@linaro.org>
 <533f2da0-fecc-27e9-7bab-2a9d51377833@quicinc.com>
 <423c71d1-70ce-ae97-3453-737c9cb179d3@linaro.org>
 <9d976322-14ba-6ada-ae26-174695509d10@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9d976322-14ba-6ada-ae26-174695509d10@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 26/02/2023 04:10, Abhinav Kumar wrote:
> 
> 
> On 2/25/2023 4:06 PM, Dmitry Baryshkov wrote:
>> On 26/02/2023 01:27, Abhinav Kumar wrote:
>>> Hi Dmitry
>>>
>>> On 2/25/2023 3:06 PM, Dmitry Baryshkov wrote:
>>>> On 24/02/2023 22:51, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 2/13/2023 9:36 AM, neil.armstrong@linaro.org wrote:
>>>>>> On 13/02/2023 12:16, Dmitry Baryshkov wrote:
>>>>>>> On 13/02/2023 12:41, Neil Armstrong wrote:
>>>>>>>> On 12/02/2023 00:12, Dmitry Baryshkov wrote:
>>>>>>>>> QSEED4 is a newer variant of QSEED3LITE, which should be used on
>>>>>>>>> sm8550. Fix the DPU caps structure and used feature masks.
>>>>>>>>
>>>>>>>> I found nowhere SM8550 uses Qseed4, on downstream DT, it's written:
>>>>>>>>          qcom,sde-qseed-sw-lib-rev = "qseedv3lite";
>>>>>>>>          qcom,sde-qseed-scalar-version = <0x3002>;
>>>>>>>
>>>>>>> And then the techpack tells us starting from 0x3000 the v3lite is 
>>>>>>> v4:
>>>>>>>
>>>>>>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.10.r8-rel/msm/sde/sde_hw_util.c#L59
>>>>>>>
>>>>>>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.10.r8-rel/msm/sde/sde_hw_util.c#L102
>>>>>>
>>>>>> OK then:
>>>>>>
>>>>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>
>>>>>>>
>>>>>
>>>>> This little bit of confusion is because with downstream, the qseed 
>>>>> is a separate usermode library having its own revision. So the SW 
>>>>> lib version in this case is not exactly correlating with the scalar 
>>>>> HW revision.
>>>>
>>>> Can you possibly spend some more words here? I see that 
>>>> sde_hw_utils.c programs scalers slightly different depending on the 
>>>> version of the scaler. At some point the SDE driver was reading the 
>>>> register to determine the revision. Then it switched to the revision 
>>>> specified in the DTS (which, as far as I understand, corresponds to 
>>>> the HW register contents).
>>>>
>>>> So, where does SW revision come into the play? (and which library 
>>>> are we talking about?). Is the 'v3lite' an SW revision? Or is the 
>>>> 0x3002 an SW revision?
>>>>
>>>
>>> qcom,sde-qseed-sw-lib-rev is the SW library revision for libscale.
>>>
>>> This is a proprietary library used to calculate the LUTs for the 
>>> qseed block. Its not used in the upstream version of the driver.
>>>
>>> For upstream driver, the driver uses default settings for the LUTs 
>>> which work for most of the common use-cases we see.
>>
>> Ack, thanks for the explanation. If default settings work, that's 
>> good. When you wrote about the proprietary lib, I started wondering if 
>> we loose anything (like worse quality of the images, etc).
>>
>>>
>>> You can refer the below property names, there are programmed by the 
>>> lib for the downstream driver.
>>>
>>> 3733         msm_property_install_range(
>>> 3734                 &psde->property_info, "scaler_v2",
>>> 3735                 0x0, 0, ~0, 0, PLANE_PROP_SCALER_V2);
>>> 3736         msm_property_install_blob(&psde->property_info,
>>> 3737                 "lut_sep", 0,
>>> 3738                 PLANE_PROP_SCALER_LUT_SEP);
>>>
>>> No, 0x3002 is the HW revision of the qseed and thats why this change 
>>> is correct because the SW library name/rev doesnt exactly match the 
>>> qseed HW revision as its possible that even qseed3lite library can 
>>> support the QSEED4 HW.
>>>
>>> So we should be going off qcom,sde-qseed-scalar-version and not 
>>> qcom,sde-qseed-sw-lib-rev.
>>
>> Thanks!
>>
>> So, we should further drop the v3lite/v4 from the scaler name/subblock 
>> and use qseed3 everywhere. Correct?
>>
> 
> No, even that wont be correct because as you pointed out anything we 
> need to handle < QSEED4 case differently from others over here

And 0x2004 are also programmed slightly differently, etc.



> 
> 537         if (pdpu->pipe_hw->cap->features &
> 538             BIT(DPU_SSPP_SCALER_QSEED4)) {
> 539             scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
> 540             scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
> 541         } else {
> 542             scale_cfg->preload_x[i] = DPU_QSEED3_DEFAULT_PRELOAD_H;
> 543             scale_cfg->preload_y[i] = DPU_QSEED3_DEFAULT_PRELOAD_V;
> 544         }
> 
> 
> If we want to clean this up more accurately, we should add qseed_rev in 
> the dpu caps or rename qseed_type to that which will hold the 0x3xxx 
> value and then write a small util which would set the the bit correctly 
> based on the qseed rev (0x3xxxx value).

Please excuse me if I was not fully obvious here. I meant using QSEED3 
and scaler rev.

> 
> 
>>>
>>>>>
>>>>> Since upstream DPU only cares about the HW revision of the scaler, 
>>>>> we should be going off the qcom,sde-qseed-scalar-version.
>>>>>
>>>>> This change LGTM,
>>>>>
>>>>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>>
>>

-- 
With best wishes
Dmitry

