Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA48653F66
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 12:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4D210E049;
	Thu, 22 Dec 2022 11:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0805A10E4F6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 11:48:22 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id y25so2338507lfa.9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 03:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NVCRdiTbSjX2av+xZv+BZhudvMB52xvAnvKnjqYLwtI=;
 b=neyzDcMzrRlme9nTb9aFRxmG4XH6Wq/HLlBwDfyliA3EUnc71x6JEkiVUvxjvz9xva
 PSeeOI/d5nT/oJxic1y7j66cOCI51cEjFZGnvCE19Bv26qY0oZQOMOR6CkE2v5/0K+K0
 81ncLH3XAZ377wX4RbVT9KZNbP38anzoVC0zRkiq7DVxRJzcK/GQLYXe6If//wK4vKGn
 KauB/VLKTs4DSoLx+dx5VlAg7EnT+F3hqL3G+9J4ITpxlj4kiUytma0+mPRMlUJQSGFa
 zECgZAZfxc0RStMP8sbzA+Or+hfM4Xf4OTi+aqcX6aA9JlqSbG9hj4vEBW+fRNyUZ1P/
 KOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NVCRdiTbSjX2av+xZv+BZhudvMB52xvAnvKnjqYLwtI=;
 b=gGbXtXo0I3gcBYUCRPwAxAXWnjm8ecj42cUl5M+z8SOrrQU/zDCXbq4qiTxtOrv9rN
 /FfeEfkDmQqhrMz8ZvpUH0mFCKzFxy7Tri9Hpc4INU2wj8FPHZlM7RnlGQ5ePGWsTNgU
 87LMDByN2rUnU/wmgCR5ZwDduWKrbEfiKnnGFbCmVc+oIIrDMNH8/XPFEWm3+H4P5FST
 RABWlOZYo4wJmyUR3GvOT85zjzOgnKnbwj3ibHlC7F2oej7zIyTR//sfuYh/qVrDMlL5
 f5/GvJx/WxZxwEy8gLiO47U7ObR+iS9KoDWcgOmqCxkOdZ2HMXqmDUMyA03t7ft50Vrr
 UPvg==
X-Gm-Message-State: AFqh2kqwgXllWpHWrF8aSAXuRJkQKqscX784BM4hQKbQkAREbG+81JW+
 CXvXFMZKAAPkVRzK3+7pfouVBQ==
X-Google-Smtp-Source: AMrXdXtX5DD1vsG47Vq+ym2gFuOKPYuvtXbBe41PUSZX9Q2fU9J9oRs2DwUEp7aURJKPeUocqleA2A==
X-Received: by 2002:ac2:4d87:0:b0:4c0:2d9e:f9d9 with SMTP id
 g7-20020ac24d87000000b004c02d9ef9d9mr1684900lfe.22.1671709700360; 
 Thu, 22 Dec 2022 03:48:20 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 c14-20020ac25f6e000000b004b5821219fbsm47643lfc.60.2022.12.22.03.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 03:48:19 -0800 (PST)
Message-ID: <00bcc651-3540-04b1-e0c0-d80335bf1bff@linaro.org>
Date: Thu, 22 Dec 2022 12:48:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 04/21] dt-bindings: msm: dsi-controller-main: Add
 compatible strings for every current SoC
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
 <20221220123634.382970-5-bryan.odonoghue@linaro.org>
 <51770a1c-45f6-9f5a-871d-022cd78a0d4b@linaro.org>
In-Reply-To: <51770a1c-45f6-9f5a-871d-022cd78a0d4b@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/12/2022 12:47, Krzysztof Kozlowski wrote:
> On 20/12/2022 13:36, Bryan O'Donoghue wrote:
>> Currently we do not differentiate between the various users of the
>> qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
>> compatible string but, the hardware does have some significant differences
>> in the number of clocks.
>>
>> To facilitate documenting the clocks add the following compatible strings
>>
>> - qcom,apq8064-dsi-ctrl
>> - qcom,msm8916-dsi-ctrl
>> - qcom,msm8953-dsi-ctrl
>> - qcom,msm8974-dsi-ctrl
>> - qcom,msm8996-dsi-ctrl
>> - qcom,msm8998-dsi-ctrl
>> - qcom,sc7180-dsi-ctrl
>> - qcom,sc7280-dsi-ctrl
>> - qcom,sdm660-dsi-ctrl
>> - qcom,sdm845-dsi-ctrl
>> - qcom,sm8250-dsi-ctrl
>>
>> Each SoC dtsi should declare "qcom,socname-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>  .../display/msm/dsi-controller-main.yaml      | 20 +++++++++++++++----
>>  1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> index 6e2fd6e9fa7f0..01afa9e9c4b3c 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> @@ -14,9 +14,21 @@ allOf:
>>  
>>  properties:
>>    compatible:
>> -    enum:
>> -      - qcom,mdss-dsi-ctrl
>> -      - qcom,dsi-ctrl-6g-qcm2290
>> +    items:
>> +      - enum:
>> +          - qcom,apq8064-dsi-ctrl
>> +          - qcom,msm8916-dsi-ctrl
>> +          - qcom,msm8953-dsi-ctrl
>> +          - qcom,msm8974-dsi-ctrl
>> +          - qcom,msm8996-dsi-ctrl
>> +          - qcom,msm8998-dsi-ctrl
>> +          - qcom,dsi-ctrl-6g-qcm2290
>> +          - qcom,sc7180-dsi-ctrl
>> +          - qcom,sc7280-dsi-ctrl
>> +          - qcom,sdm660-dsi-ctrl
>> +          - qcom,sdm845-dsi-ctrl
>> +          - qcom,sm8250-dsi-ctrl
> 
> Usual comment: can we keep the list sorted?

Actually it is sorted, except the qcom,dsi-ctrl-6g-qcm2290. Please move
it after apq.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

