Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C678654141
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 13:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE08910E157;
	Thu, 22 Dec 2022 12:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B026A10E159
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 12:46:02 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w15so1500099wrl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 04:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6n0bW6AEyag4Yz/fTHAES88HSyxxmFvstBuhh9x5saw=;
 b=KOROV8lX7w89xX5ufKygg/XiKOHbwq+ahSq/EFXdClSz6A6PPIASH93vwSblhvyfvP
 z065xKqyID4B23C5FKRtCNBRT7EZeHKqBaXWbTm25nv5NSIM4YVpd6sapwFwIVxhDl9W
 vgS1DDELxOfO9UFeHBkuF3kXiBeX2Z9lJnUFB7VxxeWgDG2J9dKD9d4mhaDEElya+7OC
 J/Ifu+V/cIVhsVdOkWv9imdoqJp91AmZx3BU1lsgG0BAioTGznMGTy/nSQNLUBVfUTbu
 59/w/iEnZzmu8sYKq1kwC+RZvZABDeTzNELZU1mol/HdAZezfgpti3m/1ZYHUj2Ma+AJ
 OpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6n0bW6AEyag4Yz/fTHAES88HSyxxmFvstBuhh9x5saw=;
 b=wIqZWFe/wv8ye8oIe1Jti9xHqds2MNpdBd+cdag6bFBWIcI5x2JmLgEmLCiWAkfjqo
 0d5wNSqiFFN4C5KjGAFh6qZSCvK113pwj7vE8U+up02LTFKlQPGl+4SBhg97VoD6f2DE
 xNnjpZ8jU1niNdEk3Yp+UEXQz0PbaMxHdQpTC3+MQYcSAN2HcBHOG1JrXCseUdMRNro1
 tpB+qP3zVGx9F+Y6VyF/ZAqRHvdiglOjZ+UBITq/O6KvxMZvJn3o0l0egL2ZdCn0glL8
 mvCKbIFs7MgGnwHn8r69uZYJDKf+5fv9aIGNbKhhfBCnx59XNgKRCwTYNHLcUTNKB9GN
 yNDQ==
X-Gm-Message-State: AFqh2kp5fuEOgC8RUGYQtG0uVber66lwnTZsBE8TX/x2GChFvWi3x5Ob
 mRPN7pTIEL1ddL7gxK3yFaJXGw==
X-Google-Smtp-Source: AMrXdXv2CMOs1kyvXBletImJqlJC+DtSfV8o0e7xTIWzSkmMqSaL7v/keKysbviY3GcBchUTo4+AIw==
X-Received: by 2002:adf:fd4a:0:b0:242:593e:ee08 with SMTP id
 h10-20020adffd4a000000b00242593eee08mr3616514wrs.36.1671713160841; 
 Thu, 22 Dec 2022 04:46:00 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b0026a4bb75477sm456705wrf.28.2022.12.22.04.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 04:46:00 -0800 (PST)
Message-ID: <b1f9dd11-b626-26d8-c6bd-7b5af7340dbb@linaro.org>
Date: Thu, 22 Dec 2022 12:45:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 05/21] dt-bindings: msm: dsi-controller-main: Deprecate
 qcom,dsi-ctrl-6g-qcm2290 in favour of qcom,qcm2290-dsi-ctrl
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
 <20221220123634.382970-6-bryan.odonoghue@linaro.org>
 <4115ec26-dedf-ca80-b81a-409d9db88f52@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <4115ec26-dedf-ca80-b81a-409d9db88f52@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/12/2022 11:50, Krzysztof Kozlowski wrote:
> On 20/12/2022 13:36, Bryan O'Donoghue wrote:
>> Deprecate qcom,dsi-ctrl-6g-qcm2290 in favour of the desired format
>> qcom,qcm2290-dsi-ctrl.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../display/msm/dsi-controller-main.yaml      | 36 +++++++++++--------
>>   1 file changed, 21 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> index 01afa9e9c4b3c..98d54a7ee28d4 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> @@ -14,21 +14,27 @@ allOf:
>>   
>>   properties:
>>     compatible:
>> -    items:
>> -      - enum:
>> -          - qcom,apq8064-dsi-ctrl
>> -          - qcom,msm8916-dsi-ctrl
>> -          - qcom,msm8953-dsi-ctrl
>> -          - qcom,msm8974-dsi-ctrl
>> -          - qcom,msm8996-dsi-ctrl
>> -          - qcom,msm8998-dsi-ctrl
>> -          - qcom,dsi-ctrl-6g-qcm2290
>> -          - qcom,sc7180-dsi-ctrl
>> -          - qcom,sc7280-dsi-ctrl
>> -          - qcom,sdm660-dsi-ctrl
>> -          - qcom,sdm845-dsi-ctrl
>> -          - qcom,sm8250-dsi-ctrl
>> -      - const: qcom,mdss-dsi-ctrl
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,apq8064-dsi-ctrl
>> +              - qcom,msm8916-dsi-ctrl
>> +              - qcom,msm8953-dsi-ctrl
>> +              - qcom,msm8974-dsi-ctrl
>> +              - qcom,msm8996-dsi-ctrl
>> +              - qcom,msm8998-dsi-ctrl
>> +              - qcom,qcm2290-dsi-ctrl
>> +              - qcom,sc7180-dsi-ctrl
>> +              - qcom,sc7280-dsi-ctrl
>> +              - qcom,sdm660-dsi-ctrl
>> +              - qcom,sdm845-dsi-ctrl
>> +              - qcom,sm8250-dsi-ctrl
>> +          - const: qcom,mdss-dsi-ctrl
>> +      - items:
> 
> I would just squash it with previous. You are adding some code and in
> next patch immediately:
> 1. re-indent it,
> 2. remove it (qcom,dsi-ctrl-6g-qcm2290)
> 
> 
> Best regards,
> Krzysztof
> 

Just to make sure.

I'll squash this patch down in the previous and include your RB.
