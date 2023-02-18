Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4075D69BA7C
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 15:49:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467F510E051;
	Sat, 18 Feb 2023 14:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934B610E051
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 14:49:40 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id cn9so2931575edb.7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 06:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kpH6WR+bqKoWno46gRZZ6t8aFUv5+bs2I4awyRCR6FA=;
 b=rEaYZ4lEtjWFBOCo6fKV5jfcQmxL9WR2+GrQ5KF3TotfUhraLpaDLMRbQJWksd56d9
 vZ3BLN81AjCGswmWZJFs7GRJI7sW1RZgbgRPtuGaYVjM5JFoD8k/Q/g58h5I4BFjfIe/
 A3cM8iWglxOQJcxB8TmEmmZnWQpSMAkhG3PYE5nBtbWF0h1+jNVwFU9VeaZ/7o8Cfjk4
 Rz4E32JFDsyqklYYoDOTumGrRVBBF8jvNUPI/kgbscrXWc/7+ZnZwpnhHbIWZDfXCc8U
 PyYr+Cfwu2MOCQFcwLCbfW02wLNcQ0N1w0OOPHjnFH2HKzXy1zGV4GKYk/pW2BlWomQU
 siZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kpH6WR+bqKoWno46gRZZ6t8aFUv5+bs2I4awyRCR6FA=;
 b=ThD5OedBbVYBQ5YVgh+U7FaqPDXH28E7T+8mhl9pxsok1jxizme+JHrpKd8FmTM60g
 bKe/A3lz1aXwqHsL0gus4vnqllkYJ4FRHKcsBlkSwhc9GwUBGdRzmTxdcTVxymnuZpp2
 ycZJR1gkyF3T+ZNzIFzL9lMktih7Vp9Pr+GubU8/T4zmnRURAz+wONdx9wttYJl4Q32U
 ySz33WBWDGGcIbW7rnLEWf99ZjR6LxnMfMz/6FcygVC3p84aYBbqvwS+vFfrJr4u9lZH
 y1UFOcCtNG3s+dCCUU0uoODfYl06brNJmhIhhQaRNIU5D+L9UBq3q87bTuxDzZCUqakL
 8TxQ==
X-Gm-Message-State: AO0yUKU2QOve7qtR+j1YJ33qfbHCAl2bUcoJF/vqqwZVO9/XbDCUSqDQ
 02ZVaR85vzX5oI0ejsm2C2o6cA==
X-Google-Smtp-Source: AK7set8fMukTd3S6JPnHsMQuo0S3kewjm1iq6LSD9WPiST+l1GpD6Xw8+bBakt04PTvD+qgtgvjSGQ==
X-Received: by 2002:a17:906:d925:b0:8b1:78b6:4b3c with SMTP id
 rn5-20020a170906d92500b008b178b64b3cmr6966704ejb.73.1676731779047; 
 Sat, 18 Feb 2023 06:49:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 v30-20020a50d09e000000b004acdef7baaesm3661310edd.96.2023.02.18.06.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Feb 2023 06:49:38 -0800 (PST)
Message-ID: <9a0245af-b7f3-0874-385b-47c86d6e6a60@linaro.org>
Date: Sat, 18 Feb 2023 15:49:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/2] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated QCM2290 compatible
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
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fbece9d6-2204-2534-e44f-29c29cc56413@linaro.org>
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

On 18/02/2023 12:23, Konrad Dybcio wrote:
> 
> 
> On 18.02.2023 11:14, Krzysztof Kozlowski wrote:
>> On 17/02/2023 22:13, Bryan O'Donoghue wrote:
>>> On 17/02/2023 12:24, Krzysztof Kozlowski wrote:
>>>> First, it would be nice to know what was the intention of Bryan's commit?
>>>
>>> Sorry I've been grazing this thread but, not responding.
>>>
>>> - qcom,dsi-ctrl-6g-qcm2290
>>>
>>> is non-compliant with qcom,socid-dsi-ctrl which is our desired naming 
>>> convention, so that's what the deprecation is about i.e. moving this 
>>> compat to "qcom,qcm2290-dsi-ctrl"
>>
>> OK, then there was no intention to deprecate qcom,mdss-dsi-ctrl and it
>> should be left as allowed compatible.
> Not sure if we're on the same page.

We are.

> 
> It wasn't intended to deprecate [1] "qcom,qcm2290-dsi-ctrl", "qcom-mdss-dsi-ctrl";
> (newly-introduced in Bryan's cleanup patchset) but it was intended to deprecate
> [2] "qcom,dsi-ctrl-6g-qcm2290"; which was introduced long before that *and* used in
> the 6115 dt (and it still is in linux-next today, as my cleanup hasn't landed yet).
> 
> [3] "qcom,dsi-ctrl-6g-qcm2290", "qcom,mdss-dsi-ctrl" was never used (and should never
> be, considering there's a proper compatible [1] now) so adding it to bindings
> didn't solve the undocumented-ness issue. Plus the fallback would have never
> worked back then, as the DSI hw revision check would spit out 2.4.1 or 2.4.
> which is SC7180 or SDM845 and then it would never match the base register, as
> they're waay different.

All these were known. I was asking about "qcom,mdss-dsi-ctrl", because
the original intention also affects the way we want to keep it now
(unless there are other reasons).

Best regards,
Krzysztof

