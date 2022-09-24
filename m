Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530D75E8A9C
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 11:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C1210E584;
	Sat, 24 Sep 2022 09:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D164C10E568
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 09:15:38 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id j16so3698739lfg.1
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 02:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=4mnI565TuxegE5VseMU3JwVMU12fPo+/PxgNA7jWQQQ=;
 b=fMyRTbN35ZzvmScJd/LmTt95QI7QO4AXCRJmwLoR2MnUbAo+wvuY/jefsRbDNIgeyC
 uO6CxSs4aTXOrM2QmYPqIADkDjPCJ/Fy81FBumUHABklu6fjko4uSkMMkUcEA5Po3wFB
 hRwsxy4KB3gvqNdqjT4zHpIz5/1vsoanjrzswvFIz6IpX4XBOAPJ1gfVq8HJ7HnRvcbH
 mu6pTVADJqdRGc7stWW0k7CtFLMUdlkaDeuE6N5N+exhYnWJOrrtrzfS6eplWpTnAWgF
 ieQBuXDTBy8m6tuOVsxuTnFSScI63Vslcjmj+RRx15V/ut38iTT2bWcElgw1gBzZj1HM
 TWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=4mnI565TuxegE5VseMU3JwVMU12fPo+/PxgNA7jWQQQ=;
 b=CHHsS7yPjLl35rL174uqZ14onM2tilhiT1mDQjwgg4JQmlK3op4NUoqIOdvxBBoQQH
 otW2junR3R7NsnI1ANmGXFJx5tajc3qfANeKZrgzpe5cK1JHEIm77OuRzohLLIf5r2XL
 6wKw3xN9PnqcpTy/TUkT+KyPwZXx23xbvt934Tz3gltAu5p5KlOcGebtVZ7BW2UhHR7o
 840ADCcLQbzbaohrmHlXP+2K5Al4LWLcypD8LVTa2bzddHBdTEkIJyNfAAhLlArFA7Nb
 X4eVyPhh53M5BIXVllbS2efeZwuEFzOA9Yf7TWohBBDRPGjt0bkG/lIC5vErhVWkNe15
 A2fQ==
X-Gm-Message-State: ACrzQf2oKgeHyCMkkKQs2RV/AmSu72yIuWVq+22iDYNJ133hLz+s0E6P
 YgsalSKwoqZ8lCfCyZ5tzRZM6Q==
X-Google-Smtp-Source: AMsMyM5dfRAZ8UKZu8Bcv93uzMEtc9dO1/QxfUGmnIv5IMIYlUi7Y3m35WVUeNL/cv8CTbGBAAO2qg==
X-Received: by 2002:a05:6512:11e9:b0:49d:7909:ff9b with SMTP id
 p9-20020a05651211e900b0049d7909ff9bmr4570042lfs.568.1664010936884; 
 Sat, 24 Sep 2022 02:15:36 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a05651234c500b0049f54c5f2a4sm1829258lfr.229.2022.09.24.02.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:15:36 -0700 (PDT)
Message-ID: <3a14c5a3-e4f2-a89d-815b-8923d1d189c1@linaro.org>
Date: Sat, 24 Sep 2022 12:15:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/2] dt-bindings: display/msm: Add QCM2290 DSI phy
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924085129.161086-1-dmitry.baryshkov@linaro.org>
 <20220924085129.161086-2-dmitry.baryshkov@linaro.org>
 <f6ed6e44-ab28-9f13-4193-517eef0edea1@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f6ed6e44-ab28-9f13-4193-517eef0edea1@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/09/2022 12:12, Krzysztof Kozlowski wrote:
> On 24/09/2022 10:51, Dmitry Baryshkov wrote:
>> From: Loic Poulain <loic.poulain@linaro.org>
>>
>> QCM2290 platform uses the 14nm DSI PHY driver.
>>
>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>> [DB: changed compat to follow the agreed scheme]
> 
> Bjorn asked to keep consistency in other case:
> https://lore.kernel.org/all/20220829210408.gxbv6szxfwiiwrbv@builder.lan/

Ack. Should I use qcom,dsi-phy-14nm-2290 or qcom,dsi-phy-14nm-qcm2290?

Note we already have "qcom,sc7280-dsi-phy-10nm".

> 
>> ---
>>   Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> index bc3d0b4063c7..088a03ed5f80 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> @@ -17,6 +17,7 @@ properties:
>>         - qcom,dsi-phy-14nm
>>         - qcom,dsi-phy-14nm-660
>>         - qcom,dsi-phy-14nm-8953
>> +      - qcom,qcm2290-dsi-phy-14nm
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

