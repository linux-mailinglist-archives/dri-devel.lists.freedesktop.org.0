Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B799F6CF42C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 22:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566CD10EC28;
	Wed, 29 Mar 2023 20:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4361C10EC30
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 20:13:37 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id x17so21769734lfu.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 13:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680120815;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zQCrJvIAi8d5vr9Rmgb3GfKwe2GYjnRcMdwIw2E9S1Q=;
 b=PBm+HevLzaANAiaOKuKR9wz5q1jaq2klVC3G7CGePfsI7ciPdEvadZ/5ugn9pPydb0
 pNDZpqc06g+MopXZNlylyBEpMaYKY28YTsUkw92aGyY6ja2bQ/Q+J9M+ufP/UMVjkCxm
 b4yNpJ9yS52MpUN10wk7Ov2b1BIVxTky08nCz+k9D6osa5WWprSxkr9G2CpgJDzzcKvd
 wPp6nNA2zSQ1wNO/Hd38HMRKJc17t9ASWPVNjbub4COwB1sbNRnC6M6g6dxhSCE9yMBq
 Bpp61bKCtEk5V2PRtjf8ROQ+u2U8Z3zLbszk47VsZYuAAW89YJCx7wdPC6uSIvruvxOG
 9qRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680120815;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zQCrJvIAi8d5vr9Rmgb3GfKwe2GYjnRcMdwIw2E9S1Q=;
 b=hCuHH4WPnyMQZAryw49HJe6mIW75rFnmWtCT8s1pqKELye4ah7cz96FhCR99PiIe63
 y1bpkVWi3aYO0SLT2sXdzFKRQBhMaWChzdUhfde4rpfuBP+ezBkF7vFYsns37BV+VrPc
 EmNNkKGMHdBQcOxxwFLnu7HZGQESZX3PfUdKWnuORDPhp5r19ZThqn5TgQa3iqrZKeeo
 p4yW5tnSGTdwqLXCEnM5c0Rudt+qu5tQ4dowuW9lO+WHP/5U+8EEM2FPidIGi8driAbL
 i6IQBk/NLPyoPbbdVAtR0bC9uE85UrtiEQCwnSFypE8FTrcHkwC8jQshlPKX+OPBR7f+
 BG7w==
X-Gm-Message-State: AAQBX9fy46gBlJo6EdPe9aTw/k5ekFibZRzwJp6jJjFVSXGcTS8tOlB7
 DIQZvk1LbxUb3e9qwNUhPpzJDg==
X-Google-Smtp-Source: AKy350bqFBR1/bLn2+h5C96CNiXHrwe4VeVDilWwnXSAsd4PHM96EcS8ugCMls5mi4Wc9S4QapkSIQ==
X-Received: by 2002:a19:ad48:0:b0:4ea:f6ad:2975 with SMTP id
 s8-20020a19ad48000000b004eaf6ad2975mr5918334lfd.60.1680120815483; 
 Wed, 29 Mar 2023 13:13:35 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a197012000000b004e95a1aca1bsm5581253lfc.87.2023.03.29.13.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 13:13:35 -0700 (PDT)
Message-ID: <420b5400-844f-4ca9-a4e3-1f5f6536f7a2@linaro.org>
Date: Wed, 29 Mar 2023 23:13:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 0/7] drm/msm: add support for SM8550
Content-Language: en-GB
To: Rob Herring <robh+dt@kernel.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
 <168004255469.1060915.1800625604847213121.b4-ty@linaro.org>
 <CAL_Jsq+VoBkpCT_iUD1Nq_SazCVDa49rn0qtX3Qnm1KBB3gkcg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAL_Jsq+VoBkpCT_iUD1Nq_SazCVDa49rn0qtX3Qnm1KBB3gkcg@mail.gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/03/2023 22:52, Rob Herring wrote:
> On Tue, Mar 28, 2023 at 5:38 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>>
>> On Mon, 09 Jan 2023 11:15:17 +0100, Neil Armstrong wrote:
>>> This adds support for the MDSS/DPU/DSI on the Qualcomm SM8550 platform.
>>>
>>> This patchset is based on the SM8450 display support serie at [1].
>>>
>>> In order to work, the following patchsets are required:
>>> - PM8550 LDO fix at [2]
>>> - DISPCC driver at [3]
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [2/7] dt-bindings: display/msm: document DPU on SM8550
>>        https://gitlab.freedesktop.org/lumag/msm/-/commit/4557e40338d2
>> [3/7] dt-bindings: display/msm: document MDSS on SM8550
>>        https://gitlab.freedesktop.org/lumag/msm/-/commit/0e4205eb8663
> 
> And now failing on linux-next just as my bot reported:
> 
> Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.example.dts:24:18:
> fatal error: dt-bindings/interconnect/qcom,sm8550.h: No such file or
> directory
>     24 |         #include <dt-bindings/interconnect/qcom,sm8550.h>
>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:419:
> Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.example.dtb]
> Error 1
> Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.example.dts:25:18:
> fatal error: dt-bindings/interconnect/qcom,sm8550.h: No such file or
> directory
>     25 |         #include <dt-bindings/interconnect/qcom,sm8550.h>
>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> 
> Please fix. And quickly please. Fixes in the DRM tree seem to take
> forever to get in...

I pushed the fix, so it will arrive in linux-next tomorrow or the day 
after tomorrow. Please excuse me for breaking it again. I checked that 
the patches were merged, but didn't notice that the header name was 
changed in the process. Mea culpa.

-- 
With best wishes
Dmitry

