Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0780758803
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 00:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F48210E3DC;
	Tue, 18 Jul 2023 22:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6F310E3C6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 22:01:58 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b6f943383eso93819101fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 15:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689717716; x=1690322516;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ef2ucOyrPFztJ167afpvPjPuWEm3c8OP5Iwr/4gr8wk=;
 b=rVijO4CFPg5o/ZAiyDM/6ao45V3lgDpgIuiPGl+Zkz81TNAG8UmbA0PNEmHUn8OICH
 dmNbY/KD+IIV/+e7OzaYDkquo0uWRz2ehH3FqM8FlDwm+qQFX2ftQBNI7szBKXf9AKu0
 gZ1PT+YKup8ADhqPIE7NVnFhRFdrhLoF485gKxBKVUoPqE7O24w7eUMs5b65T8zfuk0o
 xVWc/Ydd01e8+5gF2PfYjR/4rrbY3VySueIbThtJBS7EFHWvs6lKB1++In8e9EMFZkCL
 FweHyAhlbos9becjugcIyCWLETFKVIL+jCn7ZP4trb+mwYLw5ExDYH31tNlQgghewWeR
 pHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689717716; x=1690322516;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ef2ucOyrPFztJ167afpvPjPuWEm3c8OP5Iwr/4gr8wk=;
 b=TvIdHprtnprWpgEcJJqOp4Gi+u7aqKdbl0a1o81yIKaXMqXITQpvvCwdpxUYlcJvTX
 +qOueFmWxEJwnNh/fABkOhEBmTFxIukLmmpw+vtK89uwGFPkjqVU9IwI+fdWUwlVtKFR
 +HqctoMhLnAZ9hg/Adc2TZ0I0eURMBwHk4S7Dlb9Mihvw5WwuXs+dojQYBURNq9R2ylT
 ccVhwtRMs7Yhs73BVLXlORs+CXv6f7rNDjTa3j3NDtJT1R9mcEBXglc7riv7a6uuJOUG
 +Afj262fo0a/WbFlfo3iu85DnhWrpkRzPEqHm3jKGmsvZka+SWwNkuBY04eitXT0lMMe
 ZUGQ==
X-Gm-Message-State: ABy/qLa8VyvIF0jPoKMeDCxcTteBlO1eexsYz1qewJXQOg6mi6n1upsn
 hvO9UNiEuqY3AItyF7VhFInzyA==
X-Google-Smtp-Source: APBJJlEqQ6B3fMFXYN0weJXmUvo7Xz+RzFP6n1yfq5Vj0oMcfhZDr4qgLS5BY56lgOux4N5gGlD1oQ==
X-Received: by 2002:a05:651c:157:b0:2b4:5cad:f246 with SMTP id
 c23-20020a05651c015700b002b45cadf246mr420563ljd.7.1689717715701; 
 Tue, 18 Jul 2023 15:01:55 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05651c00cb00b002b6ce06618dsm700546ljr.21.2023.07.18.15.01.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 15:01:55 -0700 (PDT)
Message-ID: <d5f925e4-fbfe-cbb2-c3e6-8e806761d61e@linaro.org>
Date: Wed, 19 Jul 2023 01:01:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 10/15] dt-bindings: msm: dsi-phy-14nm: Document SM6125
 variant
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-10-03e430a2078c@somainline.org>
 <285facd1-bf20-aff2-b680-f796e8830038@linaro.org>
 <yzz4dddlh2no3lmuxrkuxhsuaf3brruo635pgfpnaxwffmnl6j@uk3jxtoarg7w>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <yzz4dddlh2no3lmuxrkuxhsuaf3brruo635pgfpnaxwffmnl6j@uk3jxtoarg7w>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>,
 Lux Aliaga <they@mint.lgbt>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Loic Poulain <loic.poulain@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/07/2023 00:00, Marijn Suijten wrote:
> On 2023-06-29 13:54:13, Dmitry Baryshkov wrote:
>> On 27/06/2023 23:14, Marijn Suijten wrote:
>>> Document availability of the 14nm DSI PHY on SM6125.  Note that this
>>> compatible uses the SoC-suffix variant, intead of postfixing an
>>> arbitrary number without the sm/sdm portion.  The PHY is not powered by
>>> a vcca regulator like on most SoCs, but by the MX power domain that is
>>> provided via the power-domains property and a single corresponding
>>> required-opps.
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>> ---
>>>    .../devicetree/bindings/display/msm/dsi-phy-14nm.yaml         | 11 +++++++++++
>>>    1 file changed, 11 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>>> index a43e11d3b00d..183a26f8a6dc 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>>> @@ -19,6 +19,7 @@ properties:
>>>          - qcom,dsi-phy-14nm-2290
>>>          - qcom,dsi-phy-14nm-660
>>>          - qcom,dsi-phy-14nm-8953
>>> +      - qcom,sm6125-dsi-phy-14nm
>>>    
>>>      reg:
>>>        items:
>>> @@ -35,6 +36,16 @@ properties:
>>>      vcca-supply:
>>>        description: Phandle to vcca regulator device node.
>>>    
>>> +  power-domains:
>>> +    description:
>>> +      A phandle and PM domain specifier for an optional power domain.
>>> +    maxItems: 1
>>> +
>>> +  required-opps:
>>> +    description:
>>> +      A phandle to an OPP node describing an optional performance point.
>>
>> I'd rephrase this to be something more exact, like 'desribing power
>> domain's performance point'.
> 
> Sure.  I'll leave out the word "optional", that becomes obvious from
> maxItems:1 without minItems, together with referencing a PM which itself
> is already optional.

no, default minItems is equal to maxItems. It is not listing this 
property under the required what makes it optional.

> 
> - Marijn
> 
>>> +    maxItems: 1
>>> +
>>>    required:
>>>      - compatible
>>>      - reg
>>>
>>
>> -- 
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

