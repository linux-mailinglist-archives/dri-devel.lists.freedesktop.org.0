Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A80369C892
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 11:32:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F9B10E662;
	Mon, 20 Feb 2023 10:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FB210E660
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 10:32:03 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id h32so2927098eda.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 02:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=paV6BTyDbDK8lLzQOpiKyOjr8c2QWDAG5Sx7tYMnMf0=;
 b=sUqfx2GkQWW0/mkbayKMOts6wK8b0GxH1Wx6kW57PAX6jgwV5mRUPRISdjJ3is/FYv
 MWTXjdznl9W4rXCYpVlk4kLil0FT7CGJV9PSvsE/3CEeGIuX6ixxGGKWa1oke4nZpOSE
 wl9mVPIQGcOpYSYwjcSQ/mdyGoiefeUvXK8ujVnPHUwN/gIwDoL1WoCfEwdfiyZ6tdvE
 okeTXmUrXQ2NNGDat1+RKZaUI1KKSlgN2Mv5cpeStWkN9Mv1B+D9+UfS4+OHQtAWbgqr
 qrYn80u3pYIeJ2ZLti0clGlD8yWlGi+6V3BUtgfgZ+7/m8bHDagi73HBdNiB4doVUs7h
 WDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=paV6BTyDbDK8lLzQOpiKyOjr8c2QWDAG5Sx7tYMnMf0=;
 b=ckfhoUH7siHkvhI2T4VCTRxMEbVo+qHdzpZM1L33f4+HXIWwTQZMdDyEXedvQKrsWe
 2AabwRdAFafYQWpj5/Dpuc9Ql6pnz2lQzcrc+Z2NdEYUVmv35sUZuKBGknx/TLwT8lPe
 UoDoAcFXnyGoUtq3p2ALLiFnu102mknl52PQy8ml2hiwLVId6ZXQu5Dnwoo3QmiNw4CW
 Nkp9Sx2mC1E3KhhSEJTNrLZh8GuJaqlwcJ/Cgrr+3veKCIJ+p56SelqCQYADCEFjOH+x
 zJG1NaUPPx2lUqLJNpWI5zlWe+lyHvPQbpkaGRNswwDZ/f9hEo5xswE/e912ZF3hXTuD
 Ld7g==
X-Gm-Message-State: AO0yUKWHQYadZFxEp5XKLBEDoax0MYQPd/pLLypoUsQsGe+sS1DB2y43
 zOxwoQ+JoXwxOAdwSbNJ1PSTvQ==
X-Google-Smtp-Source: AK7set/vIPmDHCiFPf7406PxS4ywTJP3gluEz3K1IoOEEfYdwk4lcG5idx/OXz/rBTLLLjfWKSxprQ==
X-Received: by 2002:a17:906:edd2:b0:8b1:7e1e:7756 with SMTP id
 sb18-20020a170906edd200b008b17e1e7756mr10873066ejb.73.1676889122026; 
 Mon, 20 Feb 2023 02:32:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 qn19-20020a170907211300b008baeb5c9bdbsm3335412ejb.141.2023.02.20.02.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 02:32:01 -0800 (PST)
Message-ID: <761f1f4b-6f47-83a3-1e55-9e5dfccbaab8@linaro.org>
Date: Mon, 20 Feb 2023 11:31:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated QCM2290 compatible
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
 <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
 <a4eaccfd-34ba-15f3-033f-165b46c43317@linaro.org>
 <a158bca2-78bf-5b38-60fe-88118e8b4ad7@linaro.org>
 <ab35cdcf-53ae-a3f2-fc08-d0f58c51a0ae@linaro.org>
 <48cb00cd-961c-b72f-fba8-1842d658e289@linaro.org>
 <d4ffa9f0-797e-7a32-147e-64aa46d7e197@linaro.org>
 <e6d397bb-dd5d-8308-eb07-3aeb2589115c@linaro.org>
 <fbece9d6-2204-2534-e44f-29c29cc56413@linaro.org>
 <9a0245af-b7f3-0874-385b-47c86d6e6a60@linaro.org>
 <3d2e681b-0cc0-5d86-7d40-63022a5358c9@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3d2e681b-0cc0-5d86-7d40-63022a5358c9@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/02/2023 11:24, Konrad Dybcio wrote:
> 
> 
> On 18.02.2023 15:49, Krzysztof Kozlowski wrote:
>> On 18/02/2023 12:23, Konrad Dybcio wrote:
>>>
>>>
>>> On 18.02.2023 11:14, Krzysztof Kozlowski wrote:
>>>> On 17/02/2023 22:13, Bryan O'Donoghue wrote:
>>>>> On 17/02/2023 12:24, Krzysztof Kozlowski wrote:
>>>>>> First, it would be nice to know what was the intention of Bryan's commit?
>>>>>
>>>>> Sorry I've been grazing this thread but, not responding.
>>>>>
>>>>> - qcom,dsi-ctrl-6g-qcm2290
>>>>>
>>>>> is non-compliant with qcom,socid-dsi-ctrl which is our desired naming 
>>>>> convention, so that's what the deprecation is about i.e. moving this 
>>>>> compat to "qcom,qcm2290-dsi-ctrl"
>>>>
>>>> OK, then there was no intention to deprecate qcom,mdss-dsi-ctrl and it
>>>> should be left as allowed compatible.
>>> Not sure if we're on the same page.
>>
>> We are.
>>
>>>
>>> It wasn't intended to deprecate [1] "qcom,qcm2290-dsi-ctrl", "qcom-mdss-dsi-ctrl";
>>> (newly-introduced in Bryan's cleanup patchset) but it was intended to deprecate
>>> [2] "qcom,dsi-ctrl-6g-qcm2290"; which was introduced long before that *and* used in
>>> the 6115 dt (and it still is in linux-next today, as my cleanup hasn't landed yet).
>>>
>>> [3] "qcom,dsi-ctrl-6g-qcm2290", "qcom,mdss-dsi-ctrl" was never used (and should never
>>> be, considering there's a proper compatible [1] now) so adding it to bindings
>>> didn't solve the undocumented-ness issue. Plus the fallback would have never
>>> worked back then, as the DSI hw revision check would spit out 2.4.1 or 2.4.
>>> which is SC7180 or SDM845 and then it would never match the base register, as
>>> they're waay different.
>>
>> All these were known. I was asking about "qcom,mdss-dsi-ctrl", because
>> the original intention also affects the way we want to keep it now
>> (unless there are other reasons).
> Okay, so we want to deprecate:
> 
> "qcom,dsi-ctrl-6g-qcm2290", "qcom,mdss-dsi-ctrl"

No, we don't want to deprecate it. Such compatible was never existing
originally and was only introduced by mistake. We want to correct the
mistake, but we don't want to deprecate such list.

> 
> because it is:
> 
> 1) non-compliant with the qcom,socname-hwblock formula
> 2) replaceable since we rely on the fallback compatible
> 3) "qcom,dsi-ctrl-6g-qcm2290" alone would have been expected to
>    be fixed in the DTSI similar to other SoCs
> 
> Is that correct?

No. So again, I am talking only about qcom,mdss-dsi-ctrl. Since
beginning of this thread:

"Wasn't then intention to deprecate both - qcm2290 and mdss - when used
alone?"

Why do you bring the list to the topic? The list was created by mistake
and Bryan confirmed that it was never his intention.

> 
> Because 2) doesn't hold, as - at the time of the introduction
> of Bryan's patchset - the fallback compatible would not have
> been sufficient from the Linux POV [1]

There was no fallback compatible at that time.

> , though it would have been
> sufficient from the hardware description POV, as the hardware
> on the SoC *is* essentially what qcom,mdss-dsi-ctrl refers to.
> 
> [1] The driver would simply not probe. It *would be* Linux-correct
> after my code-fixing series was applied, but I think I'm just failing
> to comprehend what sort of ABI we're trying to preserve here :/

Best regards,
Krzysztof

