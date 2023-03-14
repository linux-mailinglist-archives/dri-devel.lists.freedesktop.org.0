Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD066B9068
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 11:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DEAA10E76C;
	Tue, 14 Mar 2023 10:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE13B10E76C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 10:44:32 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id g17so19401441lfv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 03:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678790671;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CufXOi5c6WNCFc2hn9WjIYddQXgO4QrrUY1LyXBd3X8=;
 b=W56mMayMPeN2W9jPfcdDtVhOQuRfeApv6Ko8Of8fiDNwRm+gYduoghDxuSMmCPEv7Y
 QHnEtHcMkPIOn6/+RaeXQmeSh3GZJbzVbIbLHPSWiKN8ZfCQhY21sa71xxdtr/VUWvh0
 7Y7pV9nuW+tLel3NvtvqdprIGffvByw0pYaIazoyqEP8xHMjRYf/S6UaXD/rhxq57Gan
 Jh4RaRCq6BZE8FqZ5uV8QG3JVW00I7r4Pyds3rnf0HLhW7sXbajOrFxpPqtjT+ZXxg0K
 1MqdYeCOzm1VObwiIH/NnojnF/0YlaEK/u15nhjyawJKRK3OH91xU8qtEpBMLeIkr/4B
 la1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678790671;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CufXOi5c6WNCFc2hn9WjIYddQXgO4QrrUY1LyXBd3X8=;
 b=t1wweHhNLLlSpur9BnRYloXoCxJRvwmXKt5omHG9txWjLWKq6XrHkqrKibtIScfmc4
 LzM9B9GYs4nRs+VP7iaNhXzt2d3Qw/GQ4fTyT8rQ3o8IdYKrkUUe9hlfZCvoMvtjfcTI
 aGkjtD/6f6kVafdb2GP6EnhlFhLZ1NJJlirssqZgdNbsfX9y4baa9/A7MmnlvJc8VTjO
 HUym+lHTph/wmTtQoCbaN2k4t9aDCYRmT/VDoUL9OIlY49tF3U905/e65xsTh2xyCvAX
 AwbniesgWNoZ8QnkYj32wMnhJX+bfFwE6GjoPx7lewE/nPHl0cRhRC54fi0MCRiKfpli
 Jf1A==
X-Gm-Message-State: AO0yUKXFDmrva/QvGU61M+UA6EaMd4jvTq06me2ufYlc6iRmqAiHCeWq
 YfjIgq515SC1Iu8GRmMl9na+5w==
X-Google-Smtp-Source: AK7set+nMsNuL1g/hWyGWiP+PNe3XYuVxVqLi7qVVRwksPTVN6qKnSykp82XjB1fUFB8Wj9TpeVKBw==
X-Received: by 2002:ac2:5a0f:0:b0:4e1:36a:eda5 with SMTP id
 q15-20020ac25a0f000000b004e1036aeda5mr738730lfn.30.1678790671265; 
 Tue, 14 Mar 2023 03:44:31 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 i2-20020ac25222000000b004ddaea30ba6sm348369lfl.235.2023.03.14.03.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 03:44:30 -0700 (PDT)
Message-ID: <a8a3f655-13de-46ce-5af9-177cb5e003c8@linaro.org>
Date: Tue, 14 Mar 2023 11:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 08/10] dt-bindings: display/msm: dsi-controller-main:
 Fix deprecated compatible
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
 <20230307-topic-dsi_qcm-v3-8-8bd7e1add38a@linaro.org>
 <20230314001527.lrd65j42esfomcje@SoMainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230314001527.lrd65j42esfomcje@SoMainline.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14.03.2023 01:15, Marijn Suijten wrote:
> On 2023-03-07 14:01:46, Konrad Dybcio wrote:
>> The point of the previous cleanup was to disallow "qcom,mdss-dsi-ctrl"
>> alone. This however didn't quite work out and the property became
>> undocumented instead of deprecated. Fix that.
>>
>> Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Yes.  From the previous binding (prior to that patch) either
> qcom,mdss-dsi-ctrl _or_ qcom,dsi-ctrl-6g-qcm2290 was allowed, not a pair
> of both.
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>  Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> index 2494817c1bd6..94f4cdf88c95 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> @@ -34,7 +34,7 @@ properties:
>>        - items:
>>            - enum:
>>                - qcom,dsi-ctrl-6g-qcm2290
> 
> No comment that it was simply renamed?
That was mostly handled by Bryan's series.

Konrad
> 
>> -          - const: qcom,mdss-dsi-ctrl
>> +              - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
>>          deprecated: true
>>  
>>    reg:
>>
>> -- 
>> 2.39.2
>>
