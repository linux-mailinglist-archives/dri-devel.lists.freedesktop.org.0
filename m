Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6130B63F63B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 18:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CC110E659;
	Thu,  1 Dec 2022 17:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1301710E65A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 17:36:23 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id z24so2699746ljn.4
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 09:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+IDJJ8iwQKSOrOee0LUttztO1ikmBHL9eZbYNjvPa90=;
 b=CPTun7yXSFFql3odJhnl0fPjTYcZ8kerJP9q4Z21pwC89aNVu0qNrS+acMT7ChawGD
 tCofOMdVuf+0TA7eIZlQQAqH7Ff/DnHR5RAXnXHH8wOsiEvOhupLvbz4sAxhxNUgZM/g
 v/EYQxiYv5hmqyDxK/MOwIOtUkbVzjgG5Z5duPGaZBB2pO3tktv7JQKh8LV7drH2wa96
 tOuGUuOM5igjpV6TxAXOJN4Ylho0uTnxUFg+Bwioylg8+PLuV1Uq8tmEB8s6fyc28Oks
 Tm+b8TziA/VJOPU6C07f8gRHFbFWJgyC0QejSAIlciH6v/1N6w2epoDK4beh+Jo+kKpO
 DLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+IDJJ8iwQKSOrOee0LUttztO1ikmBHL9eZbYNjvPa90=;
 b=NegWZUnLvCyO9CKapv577RvZDo6iZSALcCTXslV4eSCsa815tq7qbvBfpmDxl2IOVF
 RWO2zMkClg7UOHiTp5xNOrdPPm98QvucmGahXlOxma3DcLfnSpMRKatOzs6wtjwki25J
 8/MZZll160P1w8xqW4Jk82+8Iset8luywrnKTi3jwRLL2CqOit3YcY6dsCPkSMAoeT+6
 0wmQ6H1zYVn4XLfHUGBWLMio5OO5mQ1rwK9ab5mqGu/RYVcXO2rV1LSgb3xxJcH591wI
 xF/m59nprGYiQ0r5b2WamSD/4/xgT3MqwQ4hNC3linbrTXC7YITMNOae61M2M3wCxv2L
 iEFA==
X-Gm-Message-State: ANoB5plldbEqXVtta2qRujxzq/gDlf7rZV3Vgxro+TWg6Ch+aQu7MlnS
 V+gRaaKgaDtRC4UnAtLhfge5Qg==
X-Google-Smtp-Source: AA0mqf4oCjlx3y5ZA0TAXj6HqUdJYdc4tWeuZdaW4wxvDH0jzSoqOnNb8fLgjpLvWyShJHOJ55hCXA==
X-Received: by 2002:a2e:a90b:0:b0:277:794:ae09 with SMTP id
 j11-20020a2ea90b000000b002770794ae09mr21149541ljq.286.1669916181166; 
 Thu, 01 Dec 2022 09:36:21 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d23-20020a194f17000000b0049482adb3basm715458lfb.63.2022.12.01.09.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 09:36:20 -0800 (PST)
Message-ID: <64107527-ff02-6743-cfb2-aedb4241d531@linaro.org>
Date: Thu, 1 Dec 2022 19:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v6 1/4] arm64: dts: qcom: add data-lanes and
 link-freuencies into dp_out endpoint
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, bjorn.andersson@linaro.org
References: <1669852310-22360-1-git-send-email-quic_khsieh@quicinc.com>
 <1669852310-22360-2-git-send-email-quic_khsieh@quicinc.com>
 <7bf73466-e476-4a1d-5dc0-1b63ea742226@linaro.org>
 <edf6735c-9903-a3c1-fb6f-22a76b11604e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <edf6735c-9903-a3c1-fb6f-22a76b11604e@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/12/2022 19:34, Kuogee Hsieh wrote:
> 
> On 11/30/2022 4:07 PM, Dmitry Baryshkov wrote:
>> On 01/12/2022 01:51, Kuogee Hsieh wrote:
>>> Move data-lanes property from mdss_dp node to dp_out endpoint. Also
>>> add link-frequencies property into dp_out endpoint as well. The last
>>> frequency specified at link-frequencies will be the max link rate
>>> supported by DP.
>>>
>>> Changes in v5:
>>> -- revert changes at sc7180.dtsi and sc7280.dtsi
>>> -- add &dp_out to sc7180-trogdor.dtsi and sc7280-herobrine.dtsi
>>>
>>> Changes in v6:
>>> -- add data-lanes and link-frequencies to yaml
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   .../devicetree/bindings/display/msm/dp-controller.yaml  | 17 
>>> +++++++++++++++++
>>
>> Separate patch. Also you didn't check the get_maintainers output, so 
>> required parties were not included into the distribution.
>>
>> Also as you'd check the get_maintainers output, please fix other email 
>> addresses too.
>>
>>> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi            |  6 +++++-
>>>   arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi          |  6 +++++-
>>>   3 files changed, 27 insertions(+), 2 deletions(-)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml 
>>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> index 94bc6e1..af70343 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> @@ -90,6 +90,20 @@ properties:
>>>           $ref: /schemas/graph.yaml#/properties/port
>>>           description: Output endpoint of the controller
>>>   +        properties:
>>> +          endpoint:
>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>> +
>>> +          properties:
>>> +            link-frequencies: true
>>> +            data-lanes: true
>>
>> No. Use $ref for both of them.
>>
>>> +
>>> +          required:
>>> +            - link-frequencies
>>> +            - data-lanes
>>
>> No, they are not required.
>>
>>> +
>>> +          additionalProperties: false
>>> +
>>
>> deprecation of old data-lanes property?
> there is no old data-lanes property.

There is one:

$ grep -n data-lanes 
Documentation/devicetree/bindings/display/msm/dp-controller.yaml
82:  data-lanes:


-- 
With best wishes
Dmitry

