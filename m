Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB8269AA72
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 12:32:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F39610EF81;
	Fri, 17 Feb 2023 11:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C970310EF83
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 11:32:24 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id z18so1464218lfd.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 03:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xGMpYHsIeYJDIJGefg+6ErVmQQfHtNGslmwfKU0O4yI=;
 b=OvsZ7iovA4L6oucKG0b9h02NIVhPzkSAPETFU8v1m/z6VtZgecZFuPmTkEZNGjIPqO
 UjoWZ+ykHvNt8ppV6hXRCz0aiIUH+HqmT1bEYUeKQhfL1mt1ER3hhfvoRfD5xMvWQia1
 HUzSLNEp/TrSrSuCrH7uznPaDgkiXzZNkeJRp+AmH4MkhVAXY7U1rRSuRXbmv6BuODCh
 WLAAZKuGLjK/8DZ4IedVBHSo8B6Q4sXFfwc5UFGpEDIEZjTvLsuFsmDcXGEnDLXhw00U
 LkX4p1r+ZnaaFFV4hAPbehmyp3LMmJ8x2FdkMXsH4BQ38cp/net6qL7oB5ZdVgJ8BP//
 QW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xGMpYHsIeYJDIJGefg+6ErVmQQfHtNGslmwfKU0O4yI=;
 b=hs6aiPfZwUOnogKYxHlYdGmN2BXdhdWIX9wnI3pb4lG5lUUPbjH9oTfEqCs+1PkNSM
 6hjzf3uBDOr2XxhQD1J+ao3Jql5cMHJ94sMki4my2hgQ2qPwy1IvEqzXEcvYnbwWB8jD
 0lknn+6/EA6K+v5NiomTNshHVQ9/d9X/nxC6ZbupZHuA+OlAwMa0Qp284kBNUgAEpoJn
 owppplAr8bSM9YSPOrV8Kr0qY9l4rzqSAh0hAUqqXW6BUFqGLb9IBOedisO3Mo0LdDdn
 weeAWpjWf62tHJ7eSUzRpM7jNFlxAMHibjPU2MOUeWDCKqfVVHnWTboDl8HKocxyV+P3
 67UQ==
X-Gm-Message-State: AO0yUKUE/vfyseVQoTaOxZltdMEnjLQsc8qvscPuQiAU35BEryPwTbgg
 wcnwsGGJf3NzNiDBGxlzXbhynQ==
X-Google-Smtp-Source: AK7set9R6HGSn4FUFt0xxRI8wa1ODUDTPvkHwALZ1Cga62wXb4eVDRWoWs4V4aiV88nkdhF7UYiKEA==
X-Received: by 2002:a05:6512:3b88:b0:4cc:a107:4227 with SMTP id
 g8-20020a0565123b8800b004cca1074227mr1429190lfv.22.1676633543025; 
 Fri, 17 Feb 2023 03:32:23 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a19f611000000b004cc82b70809sm653491lfe.150.2023.02.17.03.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 03:32:22 -0800 (PST)
Message-ID: <a4eaccfd-34ba-15f3-033f-165b46c43317@linaro.org>
Date: Fri, 17 Feb 2023 12:32:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 1/2] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated QCM2290 compatible
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
 <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.02.2023 12:30, Krzysztof Kozlowski wrote:
> On 17/02/2023 12:13, Konrad Dybcio wrote:
>> SM6115 previously erroneously added just "qcom,dsi-ctrl-6g-qcm2290",
>> without the generic fallback. Fix the deprecated binding to reflect
>> that.
>>
>> Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>> Depends on (and should have been a part of):
>>
>> https://lore.kernel.org/linux-arm-msm/20230213121012.1768296-1-konrad.dybcio@linaro.org/
>>
>> v1 -> v2:
>> New patch
>>
>>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> index 41cdb631d305..ee19d780dea8 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> @@ -37,7 +37,6 @@ properties:
>>        - items:
> 
> If this way stays, drop the items as it is just an enum.
> 
>>            - enum:
>>                - qcom,dsi-ctrl-6g-qcm2290
>> -          - const: qcom,mdss-dsi-ctrl
> 
> Wasn't then intention to deprecate both - qcm2290 and mdss - when used
> alone?
"qcom,dsi-ctrl-6g-qcm2290", "qcom,mdss-dsi-ctrl"

was never used. The only upstream usage of the 2290 compat
is in sm6115.dtsi:

compatible = "qcom,dsi-ctrl-6g-qcm2290";
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/sm6115.dtsi?h=next-20230217#n1221

Konrad
> 
> 
> Best regards,
> Krzysztof
> 
