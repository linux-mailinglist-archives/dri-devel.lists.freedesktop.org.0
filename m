Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E309A73EAAC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 20:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABF610E245;
	Mon, 26 Jun 2023 18:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0EA910E244
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 18:57:56 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f9fdb0ef35so2983221e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 11:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687805874; x=1690397874;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rCdLkrs2k8/GdjdTwOGaHO7ETa8DMcDvVAQQIXLxcIA=;
 b=rAeakYceWuhKPzsOkodDNmSHj+PzFIRXD01GV65oquCHX+0KTmawSHhTJ/ccJoD23H
 J920HjSqhstqpk+Cax6cRq/oFNe+k1enFlPu2/f+gBaSwJz+3NEXW5AHYOeY3EMXhSeS
 fprGmh0QEZ9xAjv8EzR9+H5JoKs/4ePJaRaLd8BbPAMOoQ/BHVOK0PC3jBB1htLkWZB6
 FLW1fPo/n2Myf/hFURBbP4EjaOSbPO6gvle6a+uGf/eUhkNIpViRlh54r7y1/IY+LU+V
 n+Gbkp1TMWbjw/D18GCy0O/nPEtsC0WAylsr1n51VQArHto0dVK5KielJEtnZgeEmz24
 MZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687805874; x=1690397874;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rCdLkrs2k8/GdjdTwOGaHO7ETa8DMcDvVAQQIXLxcIA=;
 b=ZL1vCZy6zRVu5nVZF0i8UuNYxvD1zmrdVjd7Gm6Awu+M0YZrMFzfMEPhZ15COnYeSY
 I3NRTaSDjlLpsViHyyDNZFMV1tD8PSUaTDAo6vBMUsUVGebSlPGdiptLumAZygRO4MtW
 CCi5Wd+LJsLgNrVEAGEQWLTsiGMb8Dj9kEm3sT6691JEyrp0zvQ+kark8ta+1p5hOd0W
 WYKwNaKDEr2cgRmUAlKxgkw0Yi+iq0eyHV7B73lavqf2qNlXClMZFIspUx5uB9hDdzdZ
 2VmEmlr5JW0WqQ7Y3AY/I6DfKTRsvopLaQ/LHhytdmKDBIHFpRbGmXTlIxTqcQM+6gDl
 Q8gg==
X-Gm-Message-State: AC+VfDxQgyKGmWkvej66+2/OS4aP++Cs6c3UXCNPDPGPW82M+qe9hTDj
 LB9p1AtTbtKI3xDHzYYpZN9bjw==
X-Google-Smtp-Source: ACHHUZ7+UEN56oLxNZpprzEBS8sPcmBjz5c7VRXtZgHtsWgmJKEs9PmiVBr7ZbZW5TN5i3z0lW7Tnw==
X-Received: by 2002:a05:6512:2348:b0:4fb:7592:cc7a with SMTP id
 p8-20020a056512234800b004fb7592cc7amr2668173lfu.20.1687805874286; 
 Mon, 26 Jun 2023 11:57:54 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
 by smtp.gmail.com with ESMTPSA id
 u27-20020ac248bb000000b004f861e64f24sm1225513lfg.113.2023.06.26.11.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 11:57:53 -0700 (PDT)
Message-ID: <3daf9990-79da-9adf-af6a-d9007c186557@linaro.org>
Date: Mon, 26 Jun 2023 20:57:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 06/15] dt-bindings: display/msm: sc7180-dpu: Describe
 SM6125
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-6-1d5a638cebf2@somainline.org>
 <6bbf239f-d530-2f1e-ff52-361f7c9cc951@linaro.org>
 <75d64lixeawfoqbrctm4thzh73cxkvnlmnh5xgbpf277pmh3gz@zthnqvvuxmeq>
 <a6f3906a-98a7-de7a-3e26-4b8c45fe93f7@linaro.org>
 <w3bbdq72thnerbyglb4dyshzg4vu5go2wpsciprk27vah6w2ms@yc4eqclct24a>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <w3bbdq72thnerbyglb4dyshzg4vu5go2wpsciprk27vah6w2ms@yc4eqclct24a>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, Lux Aliaga <they@mint.lgbt>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26.06.2023 19:54, Marijn Suijten wrote:
> On 2023-06-26 18:16:58, Krzysztof Kozlowski wrote:
>> On 25/06/2023 21:52, Marijn Suijten wrote:
>>> On 2023-06-24 11:12:52, Krzysztof Kozlowski wrote:
>>>> On 24/06/2023 02:41, Marijn Suijten wrote:
>>>>> SM6125 is identical to SM6375 except that while downstream also defines
>>>>> a throttle clock, its presence results in timeouts whereas SM6375
>>>>> requires it to not observe any timeouts.
>>>>
>>>> Then it should not be allowed, so you need either "else:" block or
>>>> another "if: properties: compatible:" to disallow it. Because in current
>>>> patch it would be allowed.
>>>
>>> That means this binding is wrong/incomplete for all other SoCs then.
>>> clock(-name)s has 6 items, and sets `minItems: 6`.  Only for sm6375-dpu
> 
> Of course meant to say that clock(-name)s has **7** items, not 6.
> 
>>> does it set `minItems: 7`, but an else case is missing.
>>
>> Ask the author why it is done like this.
> 
> Konrad, can you clarify why other 
6375 needs the throttle clk and the clock(-names) are strongly ordered
so having minItems: 6 discards the last entry

Konrad
> 
>>> Shall I send a Fixes: ed41005f5b7c ("dt-bindings: display/msm:
>>> sc7180-dpu: Describe SM6350 and SM6375") for that, and should maxItems:
>>> 6 be the default under clock(-name)s or in an else:?
>>
>> There is no bug to fix. Or at least it is not yet known. Whether other
>> devices should be constrained as well - sure, sounds reasonable, but I
>> did not check the code exactly.
> 
> I don't know either, but we need this information to decide whether to
> use `maxItems: 6`:
> 
> 1. Directly on the property;
> 2. In an `else:` case on the current `if: sm6375-dpu` (should have the
>    same effect as 1., afaik);
> 3. In a second `if:` case that lists all SoCS explicitly.
> 
> Since we don't have this information, I think option 3. is the right way
> to go, setting `maxItems: 6` for qcom,sm6125-dpu.
> 
> However, it is not yet understood why downstream is able to use the
> throttle clock without repercussions.
> 
>> We talk here about this patch.
> 
> We used this patch to discover that other SoCs are similarly
> unconstrained.  But if you don't want me to look into it, by all means!
> Saves me a lot of time.  So I will go with option 3.
> 
> - Marijn
