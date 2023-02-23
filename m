Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 593D76A0C36
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 15:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149A310EBAA;
	Thu, 23 Feb 2023 14:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C7810EBAA
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 14:51:37 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id s22so13963858lfi.9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 06:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cKP/YloJ0OTk1Xglp3NOzzCGaVgg7YFxQB7FIhSRxwQ=;
 b=gnuyw/43I9lW3uSoOmMTHB9/YkkCpbjw21JM58EHCFJLWthALpGuPkCXFguNsij/yu
 PUSnyr0KT4lK5RxcBbxBB/IByddBj+P3hdyl0bA6PW3BLjbDYhRDB8T/8TQbHwVujvNU
 JIfZn0vnE/sfwKnEKEqRz8W3TWmKVWDcuK4MNuo7diYXMlAiJaQQZq71VDIMgn09qsN4
 jDSHw1ew1lB1mruDtK8SCfYVGxtuSgOjlUVctPZDwcgppzmG27Jxn9FUFU5S9JZhRjtY
 +YczytkQAd6G1l4TdaqeD/3RQZACwgAV2nTzlnaKl8WhUF2gG6WHo6dXT1Tj6pWFmZhu
 9MeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cKP/YloJ0OTk1Xglp3NOzzCGaVgg7YFxQB7FIhSRxwQ=;
 b=AlKcaN4Hg2zaQCIlMNg/KuGCWrr3b+dvhgb3wenoA+J3iDubvLGC165oPtcnbVX03d
 OyfIS6gN6i4eDN/IyChgm7Tq8YZ7jyY46e7xbaSBky7gxd4zSTVdQQHwsrq4YmX7Uvqy
 vGRnCLWj3L+qtu+C6GyoKOeZiLgrT5rbgXq9/8GECiCCsoOg+DZWQ66+18qQAKS2sBfU
 StSD0ouYRGsLNpydlEp6+LJSscF3aYtEvdMLpk+AOKCW8mrDtGKSaXZYVVyvis+ATYWP
 USE3MYWzXb5jO0TuPuXYnhK/kmjl/92EutSGQB+VtD3QuOTORIXuo0IHpIhszog2RI94
 JmsA==
X-Gm-Message-State: AO0yUKUsdNhvJAguNOkhLIV8MOXCRAZk8bU39Vkhk+49OO4n01J/R35D
 0MtX1lyesoMdn4mZuS4umj57PQ==
X-Google-Smtp-Source: AK7set/JzmQxNYhoYOGR53AF3yyANHsb8TETRVoVhpKbUAMZWOA/GJaFtTbLDT5T7avOgrAT5PuOUA==
X-Received: by 2002:a19:ac4d:0:b0:4cb:64:ba93 with SMTP id
 r13-20020a19ac4d000000b004cb0064ba93mr3774850lfc.36.1677163895158; 
 Thu, 23 Feb 2023 06:51:35 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 u8-20020ac25188000000b004dda02f5e42sm337967lfi.298.2023.02.23.06.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 06:51:34 -0800 (PST)
Message-ID: <b39f63ce-7f88-ba68-df46-de9470d63a4e@linaro.org>
Date: Thu, 23 Feb 2023 15:51:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 10/15] drm/msm/a6xx: Fix A680 highest bank bit value
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
 <20230223-topic-gmuwrapper-v3-10-5be55a336819@linaro.org>
 <CAA8EJppi45K0hQ=1fZvf+Mps+4uEkXmLFeqdmyk-yk31CNvUsw@mail.gmail.com>
 <761e0aba-9364-557a-e6e5-e21494597dbc@linaro.org>
 <CAA8EJppvmojWnvwB1aKJ1M7CcoFHk9BLFR0U7CQGR9GexQckdw@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJppvmojWnvwB1aKJ1M7CcoFHk9BLFR0U7CQGR9GexQckdw@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23.02.2023 15:48, Dmitry Baryshkov wrote:
> On Thu, 23 Feb 2023 at 15:49, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 23.02.2023 14:06, Dmitry Baryshkov wrote:
>>> On Thu, 23 Feb 2023 at 14:07, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>
>>>> According to the vendor sources, it's equal to 16, which makes hbb_lo
>>>> equal to 3.
>>>
>>> I think we might be stricken with the ddr kind difference here, but I
>>> would not bet on it.
>> It totally is, but it also seems to be SoC-dependent..
>> I think all 8180x devices shipped with LPDDR4X FWIW
> 
> I think so too. However sdmshrike dts uses LPDDR5.
Yeah.. it may be better to skip this patch; it should be
possible to apply this series without this one.

Konrad
> 
>>
>> Konrad
>>>
>>>>
>>>> Fixes: 840d10b64dad ("drm: msm: Add 680 gpu to the adreno gpu list")
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 +++++++-
>>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> index b5017c56fa1b..2c4afecdd213 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -885,12 +885,18 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>>>>                 hbb_lo = 2;
>>>>         }
>>>>
>>>> -       if (adreno_is_a640_family(adreno_gpu)) {
>>>> +       if (adreno_is_a640(adreno_gpu)) {
>>>>                 amsbc = 1;
>>>>                 /* HBB = 15 */
>>>>                 hbb_lo = 2;
>>>>         }
>>>>
>>>> +       if (adreno_is_a680(adreno_gpu)) {
>>>> +               amsbc = 1;
>>>> +               /* HBB = 16 */
>>>> +               hbb_lo = 3;
>>>> +       }
>>>> +
>>>>         if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
>>>>                 amsbc = 1;
>>>>                 /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>>>>
>>>> --
>>>> 2.39.2
>>>>
>>>
>>>
> 
> 
> 
