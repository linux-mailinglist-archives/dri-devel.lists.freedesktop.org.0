Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270336F979F
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 10:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F8910E145;
	Sun,  7 May 2023 08:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4F710E145
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 08:20:42 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50bcb4a81ceso6142371a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 01:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683447640; x=1686039640;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=boCU+xSxMYiK4ggeuuLGulnjF6pc3jTc885tMRMvfjE=;
 b=Sx+sVXCayBmfkCFY/ASVa/jlP+pfxJID9GqE233noKlpxuM+5LgkDNXXz2NYFOYun/
 8FChtAmAhUuvSBvjqE6h+mmFPtW3GUpXd5XtR1rQew/Lj+O4O9IKtb16ay2HAfluUMf4
 ebPOn8KSeVN2kBAzO0r2b8TyR18KDOKw4wTPj2E7RCviBLs3Lus2eZ8/qiWkhuErG5Um
 jftrOCBFYl0AZpo/lJZ6exDM+y3YOKmyNh0FCAxheyXwWHWK3jTrjSqmf2rwTXiLzqvc
 sTHYkPaKddnPsPOpgKva/MizH0bLJR9PrjZct7A7zzgtl5gBz/hLHWNHH9KOmHs08jal
 y44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683447640; x=1686039640;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=boCU+xSxMYiK4ggeuuLGulnjF6pc3jTc885tMRMvfjE=;
 b=IbS1HOayzDni5Kt15sAG95SaRLULKmKhRG693S1DhX+93TrwRUy1Zp2coYT9IBcL+V
 pcvQrADsX+MZzXSyO5MHSJ5Liph+KsXW0smHAt4mumAWEpTBCLlO3ms2CkMmPZX9xXM6
 SxEcfVYrUyzaGn7Wl8n2g+FD7nflws3waIA1zX8HJNbA1bDCaJ2PJf4y9ix2+waTeX7l
 +qmESJ+jaQgEHwQQgXDSbFrUT7Ec5VH8SoNot/mfXlwUkfcL9N1wGBuaBsPKu6SeOGHn
 xN3o7g5vQhRgb2QtwAnJCXfnuwl+JYtF3iSPRg8qNpx5nnzGJ4Y+5CzkyP4Xf8zYhgeW
 c6ZQ==
X-Gm-Message-State: AC+VfDyAbaTGaHh3n9XWYryiDZKzaJcCGL6qu1Icp4o32c+VXXwOArsm
 a+YpRsTE68gdFuPyH3aT7LVh3Q==
X-Google-Smtp-Source: ACHHUZ53kMjs+EfHzqrUSmeU9Q3E0/ZNi4xRtfsZw2slikzelkYYe+A5d4jvZP+RilK7xojyyhHK0w==
X-Received: by 2002:a17:907:7204:b0:94f:2bd0:4780 with SMTP id
 dr4-20020a170907720400b0094f2bd04780mr5910245ejc.58.1683447640154; 
 Sun, 07 May 2023 01:20:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:183b:950f:b4d5:135a?
 ([2a02:810d:15c0:828:183b:950f:b4d5:135a])
 by smtp.gmail.com with ESMTPSA id
 lc11-20020a170906f90b00b0096637a19dccsm939236ejb.210.2023.05.07.01.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 May 2023 01:20:39 -0700 (PDT)
Message-ID: <4a563d96-ec59-7db3-d288-1ba3bb9d8eb7@linaro.org>
Date: Sun, 7 May 2023 10:20:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 05/12] dt-bindings: display/msm: Add SM6375 MDSS
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
References: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
 <20230411-topic-straitlagoon_mdss-v3-5-9837d6b3516d@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v3-5-9837d6b3516d@linaro.org>
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

On 05/05/2023 23:40, Konrad Dybcio wrote:
> Document the SM6375 MDSS.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm6375-mdss.yaml     | 216 +++++++++++++++++++++
>  1 file changed, 216 insertions(+)
> 

Thank you for your patch. There is something to discuss/improve.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +    #include <dt-bindings/clock/qcom,sm6375-gcc.h>
> +    #include <dt-bindings/clock/qcom,sm6375-dispcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    display-subsystem@5e00000 {
> +        compatible = "qcom,sm6375-mdss";
> +        reg = <0x05e00000 0x1000>;
> +        reg-names = "mdss";
> +
> +        power-domains = <&dispcc MDSS_GDSC>;
> +
> +        clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +        clock-names = "iface", "ahb", "core";
> +
> +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +
> +        iommus = <&apps_smmu 0x820 0x2>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        display-controller@5e01000 {
> +            compatible = "qcom,sm6375-dpu";
> +            reg = <0x05e01000 0x8e030>,
> +                  <0x05eb0000 0x2008>;
> +            reg-names = "mdp", "vbif";
> +
> +            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                     <&gcc GCC_DISP_HF_AXI_CLK>,
> +                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                     <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
> +                     <&gcc GCC_DISP_THROTTLE_CORE_CLK>;
> +            clock-names = "iface",
> +                          "bus",
> +                          "core",
> +                          "lut",
> +                          "rot",
> +                          "vsync",
> +                          "throttle";

Are you sure you have clocks in correct order? I see warnings...

Best regards,
Krzysztof

