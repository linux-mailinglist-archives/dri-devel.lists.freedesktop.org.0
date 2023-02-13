Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E744694780
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 14:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BD910E5C4;
	Mon, 13 Feb 2023 13:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E986E10E5BD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 13:56:08 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k3so4687603wrv.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 05:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=1Uy5CSnBerGct98JAqbVYGF95fZTgd+o15YjTkcuIPk=;
 b=xZJT6Spjz5YhxcyphM9ApKsAYqrAbbXecAiawIW5K2Flh9rnsQ8qDatufAylRsgoki
 ++yrs+wwnD3MuoQarcAugWmIIqSDY0AaiDd1NiQzVxNQS/sQUqFU5YrtEbaxdJQ3BS/M
 NWAxYNH73CvXqqzp5BbXuN7fHKbyy3mG9EoS3DYshvTymcoVgCNPde3dvMRuj27aLeOM
 ui6UJzcSabTiHtaRUOW/xeUoEoToFsqP5KSbTMz8hwlgyZ1nLEqOctDKSNb+Gus8KYoL
 p0SeR4LyIjc+UAmtI4TeCEfXdzdgp7f8ZrY8u2g4RHCEEqNBk6eFbYLVQIznT2pt0rVX
 RFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Uy5CSnBerGct98JAqbVYGF95fZTgd+o15YjTkcuIPk=;
 b=O5cNp857N9PeRvLTnwtfZy3/5dFuvMySnjSNTbq+IpIYFBMdaPRsq4p1HJ+pBnDPdx
 HvaSuc/eDZK9Ue2NoYXohArL4WK0CnXUBO2jFNYuTuoQLu5h6t6Okx+++HLd22hj4scF
 piyINS7loi/o8FgztScIhOfdhss9lkrkMAi2td0RAgUSIxZIEsWcAc5T6MO9K6QfZrW8
 QshoacZ+xyCwEr1kZgtaGf9mPu4JI54MU4pLzwuSZKckSWufZF1LIg8odPolwpIKAWzM
 sXF88Vp9NGfbJmHbH7Umc1EwMeO4yip2sqplWwODfrmcy8RUpSv4hnttYzTVAsmJn/S1
 mF8g==
X-Gm-Message-State: AO0yUKWGFRN46ZHNzVvcgTx413+Z+8A81ObZEbRF3kHFVd8EuLgax++4
 1Cist03YPOWsHNziHs4ENMgMIw==
X-Google-Smtp-Source: AK7set+D3CHlBRertMGZvD1SZZYSxdyV0jk07kZ5xiDaPn1MIZfSnQEaX9uZIv7om6WSAzxFky7u9Q==
X-Received: by 2002:a5d:6210:0:b0:2be:c41:4758 with SMTP id
 y16-20020a5d6210000000b002be0c414758mr20399555wru.38.1676296567433; 
 Mon, 13 Feb 2023 05:56:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:915c:811a:b081:f099?
 ([2a01:e0a:982:cbb0:915c:811a:b081:f099])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a5d6dcf000000b002c3f9404c45sm10917766wrz.7.2023.02.13.05.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 05:56:06 -0800 (PST)
Message-ID: <83603bc5-4b32-b759-5e5c-a590c2952039@linaro.org>
Date: Mon, 13 Feb 2023 14:56:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sm8450: add dp controller
Content-Language: en-US
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v3-0-636ef9e99932@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v3-5-636ef9e99932@linaro.org>
 <347a5193-f7b1-7f8e-0c60-3d435bdf952c@linaro.org>
 <f5a26fff-2dc2-2397-a80c-2477176a5864@linaro.org>
 <880e691a-0512-6325-f27c-9be59abdd647@linaro.org>
 <b43179c4-bbf5-1d38-6ff0-8ddd0356d6d1@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <b43179c4-bbf5-1d38-6ff0-8ddd0356d6d1@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2023 13:32, neil.armstrong@linaro.org wrote:
> On 10/02/2023 16:54, Dmitry Baryshkov wrote:
>> On 10/02/2023 17:28, Neil Armstrong wrote:
>>> On 10/02/2023 16:24, Dmitry Baryshkov wrote:
>>>> On 10/02/2023 16:44, Neil Armstrong wrote:
>>>>> Add the Display Port controller subnode to the MDSS node.
>>>>>
>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> ---
>>>>>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 79 ++++++++++++++++++++++++++++++++++++
>>>>>   1 file changed, 79 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>>>> index 6caa2c8efb46..72d54beb7d7c 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>>>> @@ -2751,6 +2751,13 @@ dpu_intf2_out: endpoint {
>>>>>                           };
>>>>>                       };
>>>>> +                    port@2 {
>>>>> +                        reg = <2>;
>>>>> +                        dpu_intf0_out: endpoint {
>>>>> +                            remote-endpoint = <&mdss_dp0_in>;
>>>>> +                        };
>>>>> +                    };
>>>>> +
>>>>>                   };
>>>>>                   mdp_opp_table: opp-table {
>>>>> @@ -2783,6 +2790,78 @@ opp-500000000 {
>>>>>                   };
>>>>>               };
>>>>> +            mdss_dp0: displayport-controller@ae90000 {
>>>>> +                compatible = "qcom,sm8350-dp";
>>>
>>> Exact, must fix.
>>>
>>>>
>>>> Missing "qcom,sm8450-dp". As I wrote in the comment to patch 1, I'd suggest having just a single entry here rather than keeping both 8350 and 8450 entries.
>>>>
>>>>> +                reg = <0 0xae90000 0 0xfc>,
>>>>> +                      <0 0xae90200 0 0xc0>,
>>>>> +                      <0 0xae90400 0 0x770>,
>>>>> +                      <0 0xae91000 0 0x98>,
>>>>> +                      <0 0xae91400 0 0x98>;
>>>>
>>>>
>>>> While this sounds correct, usually we used the even size here (0x200, 0x400, etc.). Can we please switch to it (especially since sm8350-dp uses even sizes).
>>>
>>> I don't have access to registers layout for HDK8450 but the system freezes when using even sizes, using
>>> the exact register size works fine.
>>
>> Interesting. Could you please trace, what exactly makes it fail, since specifying bigger region size should not cause such issues.
> 
> Yep I'll trace what's happening.

OK weird, I tried with the same sizes as sm8350, and it works fine.

Will resend with this fixed.

Neil

> 
> Neil
> 
>>
> 

