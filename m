Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CCB7042E1
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 03:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1082010E2CB;
	Tue, 16 May 2023 01:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E5010E2CB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 01:26:25 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ac88d9edf3so132873441fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 18:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684200384; x=1686792384;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iCXuzrQVE7NqQDfgmpBc13d69ZLB2zjvkbjuCp0orcg=;
 b=fo7JEKjFInLMQlPsQc9w3oWP9T2Aj3MwuPxcvyHykOb2kVt4FarGuSfCQP4XU4Xnn5
 x5GH+EB4iUanMe7Bfr7LNvrgKn3WpFmIzLB0BdD7ArHp+OQKi244DylCU+iCmzRRyOvB
 YUaC+Sve3s2lOHw85mHDkjdteeYJfIA3SYA2Vumbsg5KhYoXmqTEoDE8CuRZ6xsS54WD
 s+v/0xEmG/HaXwivV50aKTUSU83U9wFHWwmdPQ1FEwYgtrlzAaWGeKImVizgwaxfRdDG
 qEuPlIASiqDQquTEvvyuZneyvqtcnEODZ6i+p2UFNPdAMbXlyJxkzsz70wwLnYvfKwrz
 IhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684200384; x=1686792384;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iCXuzrQVE7NqQDfgmpBc13d69ZLB2zjvkbjuCp0orcg=;
 b=bhrzVJoSXofSdbUphO0vXRxV9gBkXiH7fKJEKOVEyoYJ9wvb21DGeMlBaseXC+g+Lr
 pssClBeNPDaNYD75thF8cK1lvmaIupuQRvzDuvm4wTwXz3I83sKGg+xyiqRS5QRvqArx
 9nWpNn09qWBoC7Sr97Gxb4jMwL0oBkmxXS2qL40Myi3gMDiFJp8OnsemniWx3jbIJ2W5
 FJAh6Q+5VKpZ0mpDKHucxZdVsKEZzgrkQyDtC2h1K1Pbn8p46Cd7HKc5uLlWEcFniPnC
 nPw+gyU6QsovmifZs04qdH2ImJCSTbNtm7z+xk5c5F7sbfUdi1IAAAE3y2wOAM9JUy1n
 C5UQ==
X-Gm-Message-State: AC+VfDwbTNKtPOGcczptFV7jaNAe53SQ+kjyjECJx7CAb2CD4V99Z4qz
 WQhwZ7ezI8O2+DK8aghv6sQN5w==
X-Google-Smtp-Source: ACHHUZ4v2kFHkHVE+gkX96V7S+QQVZsWTNBB9cJxYxR5LY8juK88Lz0HRrauXlwj+MM81B5kOulXgw==
X-Received: by 2002:a2e:2c09:0:b0:2ad:bb53:8b9a with SMTP id
 s9-20020a2e2c09000000b002adbb538b9amr6041019ljs.20.1684200384228; 
 Mon, 15 May 2023 18:26:24 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a2e3a04000000b002adbe01cd69sm1912340lja.9.2023.05.15.18.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 18:26:23 -0700 (PDT)
Message-ID: <1801db13-aeb7-ba50-6939-d194a9029f18@linaro.org>
Date: Tue, 16 May 2023 03:26:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 05/12] dt-bindings: display/msm: Add SM6375 MDSS
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
References: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
 <20230411-topic-straitlagoon_mdss-v3-5-9837d6b3516d@linaro.org>
 <4a563d96-ec59-7db3-d288-1ba3bb9d8eb7@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <4a563d96-ec59-7db3-d288-1ba3bb9d8eb7@linaro.org>
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
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7.05.2023 10:20, Krzysztof Kozlowski wrote:
> On 05/05/2023 23:40, Konrad Dybcio wrote:
>> Document the SM6375 MDSS.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../bindings/display/msm/qcom,sm6375-mdss.yaml     | 216 +++++++++++++++++++++
>>  1 file changed, 216 insertions(+)
>>
> 
> Thank you for your patch. There is something to discuss/improve.
> 
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmcc.h>
>> +    #include <dt-bindings/clock/qcom,sm6375-gcc.h>
>> +    #include <dt-bindings/clock/qcom,sm6375-dispcc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>> +
>> +    display-subsystem@5e00000 {
>> +        compatible = "qcom,sm6375-mdss";
>> +        reg = <0x05e00000 0x1000>;
>> +        reg-names = "mdss";
>> +
>> +        power-domains = <&dispcc MDSS_GDSC>;
>> +
>> +        clocks = <&gcc GCC_DISP_AHB_CLK>,
>> +                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
>> +        clock-names = "iface", "ahb", "core";
>> +
>> +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-controller;
>> +        #interrupt-cells = <1>;
>> +
>> +        iommus = <&apps_smmu 0x820 0x2>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
>> +
>> +        display-controller@5e01000 {
>> +            compatible = "qcom,sm6375-dpu";
>> +            reg = <0x05e01000 0x8e030>,
>> +                  <0x05eb0000 0x2008>;
>> +            reg-names = "mdp", "vbif";
>> +
>> +            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                     <&gcc GCC_DISP_HF_AXI_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_ROT_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
>> +                     <&gcc GCC_DISP_THROTTLE_CORE_CLK>;
>> +            clock-names = "iface",
>> +                          "bus",
>> +                          "core",
>> +                          "lut",
>> +                          "rot",
>> +                          "vsync",
>> +                          "throttle";
> 
> Are you sure you have clocks in correct order? I see warnings...
Right, testing *both* the DTs and bindings after making changes sounds
like a good thing to stop forgetting..

Konrad
> 
> Best regards,
> Krzysztof
> 
