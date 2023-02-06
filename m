Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A621568BD2F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 13:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404AC10E3A9;
	Mon,  6 Feb 2023 12:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6D110E3A9
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 12:46:55 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id gr7so33806334ejb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 04:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gRx1x4R3ZCNW8PHzWzGk99Kr1Ri4nC4SgujcLpkGYRU=;
 b=JuWGrqbbjwx9BF87VT3l9QlU6FGHIa8PBf7ocrIT9xEzAm4c1NJZpLd0aHn7Kuseg+
 k+wXf0zmdkOhue9g1tsqYVUdvQrmGuEqsWNRL6k9HL181JnBgtAIv8YbN+6nhorz+Tlp
 N4sS1j20gZ0nSvhH5PjoJi6LSdC6PxlqdSB5ssbeCi3nX+5o+pkJPwMc88f9N/ZeNxbp
 eC21KQOB/fzJuZ2X3fFxV/JqFkb9jdSzbvhZSOy715zu0F6yG6nmgSEv6LpmeZordSnj
 hrooUhysad/2EiqWZK77sJasfxHYcfj9ACc6+ysScxV77HBf1ygxydWwNMn67W9RW3v8
 rc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gRx1x4R3ZCNW8PHzWzGk99Kr1Ri4nC4SgujcLpkGYRU=;
 b=vwKyDGrubDmmboNWzisdbelUFg5LCAQKZBqBbuqq9hzfcgm85RpuUcdzeoPptbjFRz
 jlKJQQuRGpnUh9IsPeFanpPF+4vgW5D4upXYq4UdtzvW475nQhwk4bquzZIRdacRKSFI
 W6OenvA6TOqP9xPEzKscQVSsBzJF4ZhU4msjzZlOYiFhynxU1LLE46MYn+lFqlo2MqQ1
 YSuLYoi/8+p53wY2gRFjnurtt6mMeAIMgP4p5CNyv8yxflm8OiIcYb5rdW4G3KOYzTTl
 iVE40ZG2Io8cYTlWOH8RsDHWuWZmTQSVwxgRk2YbCZ1LD0CYsmGI8AZJbOulPc6EoHGP
 rmDQ==
X-Gm-Message-State: AO0yUKWIp0Ba112ZRYQaENCE9m/dCRE79oVwe7L2N/0Ijow4Od8poD0G
 CDYn7l5l8ReaLmZ+XnDb0JcX6w==
X-Google-Smtp-Source: AK7set/dtnTUNxeyVligvd1p437lGQ2KM+5Hf5csI6w742KksWvXp9+BUhBR8go3wL9l3JSEFXBSDQ==
X-Received: by 2002:a17:907:2c63:b0:88d:f13e:cba3 with SMTP id
 ib3-20020a1709072c6300b0088df13ecba3mr22186994ejc.36.1675687613920; 
 Mon, 06 Feb 2023 04:46:53 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 bl11-20020a170906c24b00b0088d0b51f056sm5361176ejb.40.2023.02.06.04.46.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 04:46:53 -0800 (PST)
Message-ID: <11baf5db-bc50-8fbc-5725-edd75f319d4b@linaro.org>
Date: Mon, 6 Feb 2023 14:46:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/5] dt-bindings: display: msm: dp-controller: document
 SM8450 compatible
Content-Language: en-GB
To: neil.armstrong@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v1-0-f1345872ed19@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v1-1-f1345872ed19@linaro.org>
 <f1665a8f-5b5b-7d98-a94e-d1b1df04afdf@linaro.org>
 <a2ad7b78-d848-df9d-2646-476cb306c505@linaro.org>
 <56e3816e-c317-1772-1ef3-aeaa9ef0c890@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <56e3816e-c317-1772-1ef3-aeaa9ef0c890@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/02/2023 14:36, Neil Armstrong wrote:
> On 06/02/2023 12:20, Dmitry Baryshkov wrote:
>> On 06/02/2023 12:33, Krzysztof Kozlowski wrote:
>>> On 06/02/2023 11:17, Neil Armstrong wrote:
>>>> The SM8450 & SM350 shares the same DT TX IP version, use the
>>>> SM8350 compatible as fallback for SM8450.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 
>>>> 4 ++++
>>>>   1 file changed, 4 insertions(+)
>>>>
>>>> diff --git 
>>>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml 
>>>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> index 0e8d8df686dc..98bae326e655 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> @@ -25,6 +25,10 @@ properties:
>>>>         - qcom,sc8280xp-edp
>>>>         - qcom,sdm845-dp
>>>>         - qcom,sm8350-dp
>>>> +      - items:
>>>> +          - enum:
>>>> +            - qcom,sm8450-dp
>>>
>>> Indentation looks wrong here. Testing should fail, did you test it?
>>
>> Moreover it also breaks dt-schema, see 
>> https://github.com/devicetree-org/dt-schema/issues/98
> 
> Yep the change totally broke on rebase, will fix it
> 
> Sorry for the noise.

N/p.

You might want to check the sm8350 GPU patchset. I had to reorder DT nodes.

-- 
With best wishes
Dmitry

