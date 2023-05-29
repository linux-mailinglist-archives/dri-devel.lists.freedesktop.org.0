Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E2171495F
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 14:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9173C10E080;
	Mon, 29 May 2023 12:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBF410E080
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 12:22:42 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2af316b4515so32314811fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 05:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685362960; x=1687954960;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YKA7/hMqgo/H6bsA9YWjEB8LXPpVeFefHtEv+Ra/8S4=;
 b=R27sLwYuiCRCMjqMGuKtvYkajRc9K6BF7541pRI1LprNUjwVpsUbwcL5nrqoArXUpH
 rca4GzEKl/v2ML1orSY+R5aGxOkr5nWrJZ+tQUWOMIKgNruzbI5ntc67pQsun6iOwvZL
 JqZKvc9UQoNhSObJ4W1FfTy8Yr4Kj2XUFXQ4dTP19meD7l77J6N1aZs/K/3TJg41gW3R
 9wxc6MUO9HjZJ8dOepjLTijzOs3mdbsUssWGrc+ute04IZRyc2MItRRSv7L2WeoiOCMi
 IuSfNVTEZB494tvEtc9U5eay1SCHTZcrvDtAoIeZmte3ww9KfXjxLm5i7LX5Rljg8jgf
 qveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685362960; x=1687954960;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YKA7/hMqgo/H6bsA9YWjEB8LXPpVeFefHtEv+Ra/8S4=;
 b=dt2PzH+Z0zTlWvphvvsQ1Hb/YxQNCyYPEQncvT5cXaQv5vsO2cCEZlqSg04LAxTGQj
 kNzY3KVBn5nZoE6ptoKWJPc+aA9Ri8x7aMZ+7ON3cHmAl2jfgLDMiUdEkAySmhkoq7fN
 Ef8P2MO4maGLgFGShHi+I3w/x4S4B03pSboGvxttSrZXcRVSmQH8UG8Vp85dOTOSGmk6
 P2JaQwDsd2KleRDvMVKtsLybR8dAubwSaW7mLaeJ7hooizhNa/ocHQz7fD/UAkkzcmTU
 Hq/BYweqT+KDRhQc/lCUkERXj/x4/rnO2YApVAJJ6CbwBgRmHAfpA1peOLfdEXfoDhKE
 8xEQ==
X-Gm-Message-State: AC+VfDwT5P4lo2qYHsjGd+npTYlhLdiyhrufaqHAQOohvMtqzHJ+RPhO
 dggr7QrqSh5SKnGxDixavvqoVQ==
X-Google-Smtp-Source: ACHHUZ5JcAkkevtvFEwgxbEKu/NiJIB1tIffr4Xka3MEQnnoSH+uJnyR56/szW/OTdR2f5nyn5vK6Q==
X-Received: by 2002:a2e:9796:0:b0:29c:921c:4eb0 with SMTP id
 y22-20020a2e9796000000b0029c921c4eb0mr4737453lji.22.1685362960650; 
 Mon, 29 May 2023 05:22:40 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 y28-20020a05651c021c00b002adf8d948dasm2412411ljn.35.2023.05.29.05.22.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 05:22:40 -0700 (PDT)
Message-ID: <16ab0b91-1f8b-94ff-6fa6-1d879abc18e4@linaro.org>
Date: Mon, 29 May 2023 14:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 7/7] ARM: dts: qcom: msm8226: Add mdss nodes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
 <20230308-msm8226-mdp-v1-7-679f335d3d5b@z3ntu.xyz>
 <6c79b99e-cc69-8cd9-c990-5c0373e1f09c@linaro.org>
 <58e7e5ff-5e40-7871-efe2-bfe88bd19dad@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <58e7e5ff-5e40-7871-efe2-bfe88bd19dad@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 29.05.2023 14:19, Dmitry Baryshkov wrote:
> On 29/05/2023 15:10, Konrad Dybcio wrote:
>>
>>
>> On 29.05.2023 11:44, Luca Weiss wrote:
>>> Add the nodes that describe the mdss so that display can work on
>>> MSM8226.
>>>
>>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>>> ---
>>>   arch/arm/boot/dts/qcom-msm8226.dtsi | 118 ++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 118 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
>>> index 42acb9ddb8cc..182d6405032f 100644
>>> --- a/arch/arm/boot/dts/qcom-msm8226.dtsi
>>> +++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
>>> @@ -636,6 +636,124 @@ smd-edge {
>>>                   label = "lpass";
>>>               };
>>>           };
>>> +
>>> +        mdss: display-subsystem@fd900000 {
>>> +            compatible = "qcom,mdss";
>>> +            reg = <0xfd900000 0x100>, <0xfd924000 0x1000>;
>>> +            reg-names = "mdss_phys", "vbif_phys";
>>> +
>>> +            power-domains = <&mmcc MDSS_GDSC>;
>>> +
>>> +            clocks = <&mmcc MDSS_AHB_CLK>,
>>> +                 <&mmcc MDSS_AXI_CLK>,
>>> +                 <&mmcc MDSS_VSYNC_CLK>;
>>> +            clock-names = "iface", "bus", "vsync";
>> One per line, please
>>
>>> +
>>> +            interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
>>> +
>>> +            interrupt-controller;
>>> +            #interrupt-cells = <1>;
>> We're not using the irq cell, is that necessary/should that be 0?
> 
> No. With 0 it would mean that there is a single interrupt for mdss source, which clearly is not the case.
Obviously. Derp, sorry.

Konrad
> 
>>
>>> +
>>> +            status = "disabled";
>> status should go last
>>
>>> +
>>> +            #address-cells = <1>;
>>> +            #size-cells = <1>;
>>> +            ranges;
>>> +
>>> +            mdp: display-controller@fd900000 {
>>> +                compatible = "qcom,msm8226-mdp5", "qcom,mdp5";
>>> +                reg = <0xfd900100 0x22000>;
>>> +                reg-names = "mdp_phys";
>>> +
>>> +                interrupt-parent = <&mdss>;
>>> +                interrupts = <0>;
>>> +
>>> +                clocks = <&mmcc MDSS_AHB_CLK>,
>>> +                     <&mmcc MDSS_AXI_CLK>,
>>> +                     <&mmcc MDSS_MDP_CLK>,
>>> +                     <&mmcc MDSS_VSYNC_CLK>;
>>> +                clock-names = "iface", "bus", "core", "vsync";
>> One per line, please
>>
>>> +
>>> +                ports {
>>> +                    #address-cells = <1>;
>>> +                    #size-cells = <0>;
>> Would port { work here? I remember one mdss component's bindings
>> didn't allow it but don't recall which one
> 
> Let's use ports /port@0 for uniformity even if there is just a single port always.
> 
>>
>>> +
>>> +                    port@0 {
>>> +                        reg = <0>;
>>> +                        mdp5_intf1_out: endpoint {
>>> +                            remote-endpoint = <&dsi0_in>;
>>> +                        };
>>> +                    };
>>> +                };
>>> +            };
>>> +-- 
> With best wishes
> Dmitry
> 
