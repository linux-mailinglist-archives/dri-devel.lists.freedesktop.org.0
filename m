Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD00963F6D2
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 18:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7B610E65E;
	Thu,  1 Dec 2022 17:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705AB10E65E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 17:49:59 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id c1so3620000lfi.7
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 09:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4KQ3/tBCCX08RqaHAVKz1V3BoqU0bl5hV6otFx1dW9g=;
 b=qzvdvgQzom2VSHmp9Pezrsgvfsgdx+1z0vQpUjMuSyJOYGThCuYIN19bHsD9U0KkfT
 +qvq46IyIYOML0N35RAyZyeonNmEaibF+N8yNdYlEINzYjDRjvPmcb9sYP+Qfh3hShza
 UNLWwlkzviQm9Ik+FYjKiByYpvj9ZTJ6p3VbrAt01t3BPq/Q3/hCCwvyUjE5GNPaWCHH
 q8OdAD4EWvLOBT/+AsUq0HSM0GMKxMM+IhgAuMJ5JRvtzp3A8niKzyLbdjwm078ZdH4z
 jZnACrkTEbwqgeJbStuYuqFxh7ZJiLaYEHTMO5wbAbIhOEfBGi2frFJNLgUH2H8Z70Lh
 vbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4KQ3/tBCCX08RqaHAVKz1V3BoqU0bl5hV6otFx1dW9g=;
 b=DvqdlBwuX/Q/nv1UAru8SgOpfyqt6aHv31yFk5+C6We9RyIw6W21u86FiGFQbljZlW
 32+z3LKKuPsBDRMbGs1P4deHwV6nnGN0EmSNesJkA4xRdjBPHKr0b68TS/iYgXNyZB83
 ap8D0iV2iaBXPBYKlXMwvQq3hqr9+oIXQXpTVlMdkMZo6kdFimkTXte3x/1JThzduu9C
 G2EteiQwiPzVcil0p2VzHbBGXtoOWAY19VCzX6QIqnpLn8Sm9ex4bpT3Zyf6azDnOpQj
 5jcJ8b4jjQYMUEN1yLK4dOMMx2bdtF2CcnQSOXLb6UGLAXGB1dJfyf4FGwyAwqUEmBbS
 yBZA==
X-Gm-Message-State: ANoB5pkDs51b6xUBjzoXjMzpCD0n5EG7zICeobl5bzMpq8wgUSAU4Gyu
 mlFf2m4jll6ONyVPEU9puFMgOw==
X-Google-Smtp-Source: AA0mqf4zoEW9WRjyxsPxOYTuP8r4W8DGIvfaMHnxjM9PP0VrEWHzZMXjvjkYJoov0C9kqXwic6F9TA==
X-Received: by 2002:ac2:5e2c:0:b0:4a2:243a:ef6e with SMTP id
 o12-20020ac25e2c000000b004a2243aef6emr18500552lfg.454.1669916997677; 
 Thu, 01 Dec 2022 09:49:57 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a195001000000b0048aee825e2esm713823lfb.282.2022.12.01.09.49.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 09:49:57 -0800 (PST)
Message-ID: <4ff2a5f9-1fc9-a431-b5f1-f65df7e47caa@linaro.org>
Date: Thu, 1 Dec 2022 19:49:56 +0200
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
 <29d12e26-b3c8-dbf6-de1f-5c6ae4a5a705@linaro.org>
 <f03233b4-2850-c206-724c-0b6568b6a876@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f03233b4-2850-c206-724c-0b6568b6a876@quicinc.com>
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

On 01/12/2022 19:32, Kuogee Hsieh wrote:
> 
> On 11/30/2022 4:21 PM, Dmitry Baryshkov wrote:
>> On 01/12/2022 02:07, Dmitry Baryshkov wrote:
>>> On 01/12/2022 01:51, Kuogee Hsieh wrote:
>>>> Move data-lanes property from mdss_dp node to dp_out endpoint. Also
>>>> add link-frequencies property into dp_out endpoint as well. The last
>>>> frequency specified at link-frequencies will be the max link rate
>>>> supported by DP.
>>>>
>>>> Changes in v5:
>>>> -- revert changes at sc7180.dtsi and sc7280.dtsi
>>>> -- add &dp_out to sc7180-trogdor.dtsi and sc7280-herobrine.dtsi
>>>>
>>>> Changes in v6:
>>>> -- add data-lanes and link-frequencies to yaml
>>>>
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> ---
>>>>   .../devicetree/bindings/display/msm/dp-controller.yaml  | 17 
>>>> +++++++++++++++++
>>>
>>> Separate patch. Also you didn't check the get_maintainers output, so 
>>> required parties were not included into the distribution.
>>>
>>> Also as you'd check the get_maintainers output, please fix other 
>>> email addresses too.
>>>
>>>> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi            |  6 +++++-
>>>>   arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi          |  6 +++++-
>>>>   3 files changed, 27 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git 
>>>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml 
>>>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> index 94bc6e1..af70343 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> @@ -90,6 +90,20 @@ properties:
>>>>           $ref: /schemas/graph.yaml#/properties/port
>>>>           description: Output endpoint of the controller
>>>> +        properties:
>>>> +          endpoint:
>>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>>> +
>>>> +          properties:
>>>> +            link-frequencies: true
>>>> +            data-lanes: true
>>>
>>> No. Use $ref for both of them.
>>>
>>>> +
>>>> +          required:
>>>> +            - link-frequencies
>>>> +            - data-lanes
>>>
>>> No, they are not required.
>>>
>>>> +
>>>> +          additionalProperties: false
>>>> +
>>>
>>> deprecation of old data-lanes property?
>>>
>>>>   required:
>>>>     - compatible
>>>>     - reg
>>>> @@ -158,6 +172,9 @@ examples:
>>>>                   reg = <1>;
>>>>                   endpoint {
>>>>                       remote-endpoint = <&typec>;
>>>> +                    data-lanes = <1 2>;
>>>> +                    link-frequencies = /bits/ 64 <160000000 270000000
>>
>> s/1600/1620
>>
>>>> + 540000000 810000000>;
>>>
>>> I guess the number of zeroes is wrong here. This is 160 MHz ... 810 
>>> Mhz, rather than 1.6 GHz ... 8.1 GHz
>>
>> Ok, I was wrong here. The old code definitely defaults to 570 
>> mega-something. Now I'd really like to read your description for the 
>> link-frequencies property, because the 
>> phy_configure_opts_dp::link_rate is clearly specified in Mb/s and it 
>> takes a fixed set of values from 1.62 Gb/s up to 8.1 Gb/s.
>>
>> I think the drm_dp_bw_code_to_link_rate() function is incorrect by 
>> itself, as it multiplies with 27000 (27 Mbps) rather than 270000 (0.27 
>> Gbps) as required by the standard. So first, we should fix the 
>> function, then all the rates would become logical.
> 
> no, drm_dp_bw_code_to_link_rate() is correct and should not be changes 
> since it impact to other dp drivers too.
> 
> 0.27Gbps/lane is specified at DP spec.
> 
> DP use 8b/10b coding rule (10 bits symbol contains 8 bits data).

At least it should get documentation that it returns Kylo-bytes per second.

But, getting back to link-frequencies. The documentation clearly says 
that it should be allowed data bus _frequencies_. And frequencies are 
measured in Hz, not in bits/sec or bytes/sec.


>>>>                   };
>>>>               };
>>>>           };
>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi 
>>>> b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>>>> index 754d2d6..39f0844 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>>>> @@ -812,7 +812,11 @@ hp_i2c: &i2c9 {
>>>>       status = "okay";
>>>>       pinctrl-names = "default";
>>>>       pinctrl-0 = <&dp_hot_plug_det>;
>>>> -    data-lanes = <0 1>;
>>>> +};
>>>> +
>>>> +&dp_out {
>>>> +    data-lanes = <0  1>;
>>>> +    link-frequencies = /bits/ 64 <160000000 270000000 540000000>;
>>>
>>> Same comment here.
>>>
>>>>   };
>>>>   &pm6150_adc {
>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi 
>>>> b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>>>> index 93e39fc..b7c343d 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>>>> @@ -440,7 +440,11 @@ ap_i2c_tpm: &i2c14 {
>>>>       status = "okay";
>>>>       pinctrl-names = "default";
>>>>       pinctrl-0 = <&dp_hot_plug_det>;
>>>> -    data-lanes = <0 1>;
>>>> +};
>>>> +
>>>> +&dp_out {
>>>> +    data-lanes = <0  1>;
>>>> +    link-frequencies = /bits/ 64 <160000000 270000000 540000000 
>>>> 810000000>;
>>>
>>> And here.
>>>
>>>>   };
>>>>   &mdss_mdp {
>>>
>>

-- 
With best wishes
Dmitry

