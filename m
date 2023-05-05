Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D396F8317
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 14:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06F010E218;
	Fri,  5 May 2023 12:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8691E10E218
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 12:38:14 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4efe8991bafso2011767e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 05:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683290292; x=1685882292;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yplmN4cjcMjpz7yzL0GhEZF8x3n7FeMV/awLTpA1Cds=;
 b=n+PCrxjHUW0iFTpnRlAN+eLhhGWqBvzuhiThIKBoygAfxiDUU+LH53XkQvLLeoTfS6
 bqfQFUQP0SoeF1DHMmjXuUC6NQBJuT1auu3P5Y8z5nRm3YB6tB/s99I1e4zlHaHsgILv
 IgjKdwFBmJKQ9Kpwv3f7IAGiwVh6ykYmZutvqca/tZPhwsVX7jEbCtgEPoX11bfnfgSf
 HHjl3+0JLKKsXnhWZ0NCUN+zCwdnJ+PfkAHy7UhGZpvtuP355tmBx+wP2nw/5h0xCh7/
 C/9/TiZvwWfpQFeAs4ZlV4rKrn2sgiSd+bldhNBWVxRPF/KtWRAiS3tCaqbG2uWmALcl
 airw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683290292; x=1685882292;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yplmN4cjcMjpz7yzL0GhEZF8x3n7FeMV/awLTpA1Cds=;
 b=dA1adKFW9TeYHccvt6wNsnF0dxpCFLP70JvHnhbiXyhL6fy0i/Sh8AJBjIl2SJdLaU
 IUUYZh724kZ8OTKxvrB2tWBWn3WFC9Vx/egmNM9rxdZsNxqJSAf/NttEWPJwNcXneDFZ
 0WY2G5spjtj96g44FMyj0ID6uTLIMi4r909PVKgW8N1leMSsSWTuJzqpYFxrknxikGNo
 vDPEU4TqPbzL5we4Qrcpxap+wwZWilgiOcFLSxCpB09zWVN69jmydCDCBxQel2rNHkPf
 gyEvt2Fg6nCSZf4yFkZOVM/srbJy9KVCO5KuiK8djPqkJRyhs2Z42Sz6zJ+Pwd2Dlkjr
 w+jg==
X-Gm-Message-State: AC+VfDykmvlaLTAmDd4spoxG/WQL7JHN1ERiHsmfeu4581rPWKhymKfN
 t+TaIycE+68Zk63N3izCOBvANQ==
X-Google-Smtp-Source: ACHHUZ6z59O8tplENC2bhQXd/JQWSp6AWPiroQfHmJwWkxLtJstvOyAq5du4f7CXb+84rHWoJ6jtOw==
X-Received: by 2002:a19:f502:0:b0:4f1:43b3:90bf with SMTP id
 j2-20020a19f502000000b004f143b390bfmr429933lfb.41.1683290292180; 
 Fri, 05 May 2023 05:38:12 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a19f717000000b004f142eac23fsm273394lfe.114.2023.05.05.05.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 05:38:11 -0700 (PDT)
Message-ID: <61a1441c-a948-bf89-a44f-a94c3956c41d@linaro.org>
Date: Fri, 5 May 2023 14:38:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 03/13] dt-bindings: display/msm: Add SM6350 DPU
To: Rob Herring <robh@kernel.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-3-5def73f50980@linaro.org>
 <20230425170320.GA1931576-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230425170320.GA1931576-robh@kernel.org>
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
Cc: freedreno@lists.freedesktop.org, iommu@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Joerg Roedel <joro@8bytes.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 25.04.2023 19:03, Rob Herring wrote:
> On Fri, Apr 21, 2023 at 12:31:12AM +0200, Konrad Dybcio wrote:
>> Document the SM6350 DPU.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../bindings/display/msm/qcom,sm6350-dpu.yaml      | 94 ++++++++++++++++++++++
>>  1 file changed, 94 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-dpu.yaml
>> new file mode 100644
>> index 000000000000..979fcf81afc9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-dpu.yaml
>> @@ -0,0 +1,94 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,sm6350-dpu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Display DPU dt properties for SM6350 target
>> +
>> +maintainers:
>> +  - Konrad Dybcio <konrad.dybcio@linaro.org>
>> +
>> +$ref: /schemas/display/msm/dpu-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,sm6350-dpu
>> +
>> +  reg:
>> +    items:
>> +      - description: Address offset and size for mdp register set
>> +      - description: Address offset and size for vbif register set
>> +
>> +  reg-names:
>> +    items:
>> +      - const: mdp
>> +      - const: vbif
>> +
>> +  clocks:
>> +    items:
>> +      - description: Display axi clock
>> +      - description: Display ahb clock
>> +      - description: Display rot clock
>> +      - description: Display lut clock
>> +      - description: Display core clock
>> +      - description: Display vsync clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: bus
>> +      - const: iface
>> +      - const: rot
>> +      - const: lut
>> +      - const: core
>> +      - const: vsync
> 
> Is there some reason the clocks are in different order?
Nope, I'll sort this out

They appear to 
> be the same minus the 'throttle' clock. Is there really no 'throttle' 
> clock?
Looks like GCC_DISP_THROTTLE_AXI_CLK does exist on sm6350 as well, no
idea how/if it's used though.. Perhaps I can just remove it from sm6375
and if it turns out necessary we can reintroduce it another day.

Maybe this platform just tied it to one of the same clocks in the 
> above?
Unlikely, most likely it's for some dire deep power saving stuff that
does not seem to be used/exposed, even on the bsp kernel

> 
> I really hate the mess that is clocks. We have the same or related 
> blocks with just totally different names and order. The result is 
> if/then schemas or separate schemas like this. Neither option is great, 
> but at least the if/then schemas provides some motivation to not have 
> pointless variations like this. </rant>
It's a totally valid rant..

> 
> As it seems the only difference between these 2 bindings is 1 extra 
> clock, can't they be shared?
Sounds like a plan!

Konrad
> 
> Rob
