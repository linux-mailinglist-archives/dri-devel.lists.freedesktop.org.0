Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FC0568EEC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 18:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682EE10F6E3;
	Wed,  6 Jul 2022 16:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3563510E39C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 16:19:55 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bf9so3543639lfb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 09:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GcIvyPH2KizUihUSW8jy8Ob4N/0YG6AMAP1rAGpU7Ok=;
 b=xmMh6xC5pu7s4zzweT/syE2N332r0cw69GyAjGEnu4TghuS1S3W2P6TnWCwS9kVC5u
 zWprhnM1rt69W8pUeIyaBFhE3scZNFREnqx+6kMg6rhkzS2oQAFr2JxihXDSKRevPsUX
 Xi5yw7pk5BQR0R8GK+8cjgmNPvxRfAlfhYXGyeHq9d6N8WVHYMQiLtF5WRtwYIcLG91q
 zutq0jAIFD9uD1O19nPUaKge+9pgA4E785ssWXp/2eJVNp5gsR4D0kzfZBRSL34BAkIl
 mQsWBdKOVaV+SP2BZFaBbTS6A7IsUjWzvpaHrOAAa8fx/gNIOF3rbQYjBZ7vseLEghXE
 q53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GcIvyPH2KizUihUSW8jy8Ob4N/0YG6AMAP1rAGpU7Ok=;
 b=d1qXv9ZdOEWzydIX9E8hztfaVl9FZpILqcDZ9mDq4Ey9Qmq7+wWaROJOhuJfq3kk2j
 uKoQ7xeCf4UBgYbMMHqQ6AAgC7yhh65cXmogJVUFiTvoX6FE9QW3SZWEV8nw5z0d2nDg
 PUdULpUoyUO53e1bqmBdRb2PGGe5W8NVBWYl2Hm14gAoy9aa4b9oN1oxZTVU6aGE2WkI
 jGaRR/l5Rp5TPmxYchPlMHcD26UQSBwUhKBBJbn4pQP3C9U+TIIu1itcierCpSdS5tig
 ACqVlVXWvSso/PBPgir4FH28apXlq0O9evg0diCxTejRJLzrHNdWNyyIJlQd8ktxQ7j3
 iRYA==
X-Gm-Message-State: AJIora90TqFnwPHxlo/CZ1uc0zaSTVmuUKRUyAm+5NFBwMxUu8/KANnC
 xTL19QZQArSsqW9APjF8cyXJWQ==
X-Google-Smtp-Source: AGRyM1uj08Bgxjs0oo+U3pkd7e1TXBRKeScKxQEEM9E2gGyL0OVQWDueFmb58f+hNAm0OSgiBPsbBQ==
X-Received: by 2002:a05:6512:3f0f:b0:47f:6f89:326 with SMTP id
 y15-20020a0565123f0f00b0047f6f890326mr25036446lfa.124.1657124393536; 
 Wed, 06 Jul 2022 09:19:53 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a056512114600b0047f9aefa838sm6356219lfg.109.2022.07.06.09.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 09:19:53 -0700 (PDT)
Message-ID: <6c89ee27-43d1-b926-b061-c9f6c1085f24@linaro.org>
Date: Wed, 6 Jul 2022 18:19:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] dt-bindings: display/msm/gpu: document using the
 amd,imageon adreno too
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
 <20220706145222.1565238-3-dmitry.baryshkov@linaro.org>
 <088c1863-ad44-61b6-8757-bc3097369335@linaro.org>
 <c6c06a9e-8b06-cb15-ae81-07053bbf80a7@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c6c06a9e-8b06-cb15-ae81-07053bbf80a7@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/07/2022 18:00, Dmitry Baryshkov wrote:
> On 06/07/2022 18:50, Krzysztof Kozlowski wrote:
>> On 06/07/2022 16:52, Dmitry Baryshkov wrote:
>>> The DT binding desribes using amd,imageon only for Imageon 2xx GPUs. We
>>> have been using amd,imageon with newer (Adreno) GPUs to describe the
>>> headless setup, when the platform does not (yet) have the display DT
>>
>> Does not have "yet"? So later it will have and you drop a compatible?
> 
> Yes. For example see the arch/arm64/boot/dts/qcom/8150.dtsi, which 
> currently has only GPU node. Once we add MDSS/DPU/DSI/etc. nodes, we are 
> going to drop the compat string.
> 
>>
>>> nodes (and no display support). Document this trick in the schema.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>>> index 346aabdccf7b..e006da95462c 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>>> @@ -16,9 +16,13 @@ properties:
>>>         - description: |
>>>             The driver is parsing the compat string for Adreno to
>>>             figure out the gpu-id and patch level.
>>> +          Optional amd,imageon compatibility string enables using Adreno
>>> +          without the display node.
>>>           items:
>>>             - pattern: '^qcom,adreno-[3-6][0-9][0-9]\.[0-9]$'
>>>             - const: qcom,adreno
>>> +          - const: amd,imageon
>>> +        minItems: 2
>>
>> This is too unspecific. You allow any device to be and not to be
>> compatible with amd,imageon.
> 
> Yes, this is expected (kind of). Would you have any 
> alternatives/suggestions?

Using compatible for this kind of breaks the entire idea behind
compatibles, because the device does not stop being compatible with
amd,imageon. Either it is or it is not. I would understand that drop the
compatible per boards which physically do not have display, physically
are headless. But the comment in sm8250:
"make sure to remove it when display node is added"
is just confusing.

The typical solution would be to just check the properties of the device
and choose different mode if display is missing (via port graph or some
other way how the gpu is actually linked to the display).


Best regards,
Krzysztof
