Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DF76ADA03
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 10:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4490810E387;
	Tue,  7 Mar 2023 09:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AC410E387
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 09:16:04 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id u9so49635661edd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 01:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678180562;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yV24tnK9cnyPzbacWjSliZZMed6YdF4OudMR8kk8ppo=;
 b=yH9a2qzDZBDhJ0CfTaJ9KXbqMMM4/wOMfUo1FqnskAtuzQZSlvl1kudZ497aYuNam/
 QvjK0cT0tFlr8BDWjQEhfmhc1iCxTDrz0WB9R+tliWK8IQmp7g1xOKMMCwezidS2Mk1o
 g4w3cAAPNM3X3tuM5hdGORLZFuzoPLUN8MJJkAtfpMu4qYiCN89YuajEVKIx8ZWU8MtU
 0gYZKYJyu/PWN5SxkxJtpqmvA+YCN6P3M9zhj3Vntqdw6YaBlMRCrdJRVVHkvFj/t2Dt
 g7NC8sLTSANitWx+tNWC5gUyK7lzC1gv3O90yKsq1gGQaztL771BALmjGztArMt0xaEQ
 wdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678180562;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yV24tnK9cnyPzbacWjSliZZMed6YdF4OudMR8kk8ppo=;
 b=FXkY6BxlnhjFY/DdpxIGrmN0CtjV6uG3rAeeOcsw/odS4CEI/j/AJTN3xrc1+/16gF
 Ref7X/cVh7qFlnHadle6c8O9c6V31guyinn2KoO5F0/ZlPkKidCr63+L62ltQpXkQVNV
 WDxHu4/nSmEcNHbZDe/p/qA9rhkOJYuuu0PAmbe6lsDkjzKnTc1oHcpKh8/P8SmJk/O1
 U6wGpmJV2Xz/BISKn5yiW5wEhCVDU+KrT3TpbwpUrEQTrZ4SsPVIF9E0HfYs7g6lShsy
 zNBSKCLZSZUJZEeBef+u1dSPTIJemyTNVMIAq174ooldjsb/NIMTBzfAQjNa8dD9bvMl
 A2gg==
X-Gm-Message-State: AO0yUKWqPtEUVpih6AV6ddE1TJymntHjQOBnD6UaaBzDKHz3qlO7z92c
 HNUAzoUO6+nmp1/yYXu6NwYuag==
X-Google-Smtp-Source: AK7set/5IpkbYD1GA2/KmDTDjFB7vnpSTjf66uNF56xzvLTuwRLzp+tFB9oszzAXMniobHQSWmu+6Q==
X-Received: by 2002:a17:907:cc1c:b0:8b1:781d:f9a8 with SMTP id
 uo28-20020a170907cc1c00b008b1781df9a8mr11869787ejc.72.1678180562499; 
 Tue, 07 Mar 2023 01:16:02 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:5310:35c7:6f9e:2cd3?
 ([2a02:810d:15c0:828:5310:35c7:6f9e:2cd3])
 by smtp.gmail.com with ESMTPSA id
 my22-20020a1709065a5600b008eabe71429bsm5794543ejc.63.2023.03.07.01.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 01:16:02 -0800 (PST)
Message-ID: <145066db-5723-6baa-237d-7c2b8fd476d9@linaro.org>
Date: Tue, 7 Mar 2023 10:16:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] dt-bindings: display: msm: sm6115-mdss: Fix DSI
 compatible
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20230304-topic-dsi_fixup-v3-0-b8565944d0e6@linaro.org>
 <20230304-topic-dsi_fixup-v3-2-b8565944d0e6@linaro.org>
 <e105eff0-816e-b9e8-b47a-5c85731c9ba0@linaro.org>
 <4b8745d8-144f-fb82-3e54-5ce6bd3162e6@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4b8745d8-144f-fb82-3e54-5ce6bd3162e6@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/03/2023 11:06, Konrad Dybcio wrote:
> 
> 
> On 6.03.2023 09:57, Krzysztof Kozlowski wrote:
>> On 04/03/2023 16:55, Konrad Dybcio wrote:
>>> Since the DSI autodetection is bound to work correctly on 6115 now,
>>> switch to using the correct per-SoC + generic fallback compatible
>>> combo.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>  .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 8 +++++++-
>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
>>> index 2491cb100b33..605b1f654d78 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
>>> @@ -40,7 +40,13 @@ patternProperties:
>>>      type: object
>>>      properties:
>>>        compatible:
>>> -        const: qcom,dsi-ctrl-6g-qcm2290
>>> +        oneOf:
>>> +          - items:
>>> +              - const: qcom,sm6115-dsi-ctrl
>>> +              - const: qcom,mdss-dsi-ctrl
>>
>> Does it actually work? You did not define qcom,sm6115-dsi-ctrl in
>> dsi-controller-main?
> Check the "Depends on" in the cover letter.
> 

Then it looks like it should be squashed with that patch. Why adding new
compatible in multiple steps?

Best regards,
Krzysztof

