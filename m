Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF9561F1F1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 12:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5860210E2ED;
	Mon,  7 Nov 2022 11:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8512010E2EB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 11:36:27 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id c1so14699293lfi.7
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 03:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4RvAclY+neH49C1cBsdQNnQdmHNpl6bHWNQMQFTUziI=;
 b=Y84q8IKqYWPLVgdrd9IB24CTZK4TkD31OXVWydpwXjb9dNftk4y9wVKt6z5pvCHydQ
 LVRAlFjZTi+0O9RQea6JzJfVeQHQsGDuKVUMKIOFkDZCyvppXzjAGWK4Oc268BGfVix3
 rVyF52l/ljmK7LIIrm57PJzQJ/nG07TzkC4T4ZjM2XQBk0OGUKdkYcxGhbZV3voddcKC
 4gkV9YOltOD1ij38GSGEkOGnSjHp0qXB4k8ZUApKRlvRp7o3wJ6ZfY1xf0Xw/rhJcSmZ
 79klGfdR4EPSScwgCOf7Sxh8B6ANutE/D7xkNng0aKm2ePOALPC15Y07AYDnEDGFYjp5
 lkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4RvAclY+neH49C1cBsdQNnQdmHNpl6bHWNQMQFTUziI=;
 b=OUwxX7OKdeG5a+SxCM1iXhwWJ8kfh+1Vky4gSqTtsuKVwCtWy2rErkSjUuTT6ehQxT
 ObekYHhvoj0DjflLJ+ETtmBlio2x0ksRVkI+t2v5JpISSh/5z78NK64ICpJZhCk1UTCy
 uhiDX5x4OOlOUwNG+HJBTwsZuUJl36bBDGm3J8AHc00BjJ4N/FBI2isRDYIvd96OaIUC
 r4J8Yt3PXSKjyM1ULrN3FlitdwcTH11At3ylRnSQjW/rN20nZi1LgxLqRNbBF6ItLu3j
 IIF3nc5QXZ+fy01XB819GTh0pbF9/FqLfvl4L8VrwVMghYUbsF08qA8Xlao0xHw0H0VC
 4qqA==
X-Gm-Message-State: ACrzQf3Xq/Uk7KkNGjT9C5m0wRaphBXKVsC6yoH6ktQ60YlRg+q+LuFq
 v7EDQKrlRO4qwlXwU+0IkFob0g==
X-Google-Smtp-Source: AMsMyM6FupxNgodwKghj39xjwOBD/jd7eC3m/sYxk9JT9Cl6jC+t5ibvzXVL4AV6K2lERpbW2FUNJQ==
X-Received: by 2002:ac2:4f0a:0:b0:4af:eacf:fb79 with SMTP id
 k10-20020ac24f0a000000b004afeacffb79mr16847457lfr.420.1667820985805; 
 Mon, 07 Nov 2022 03:36:25 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a05651205d600b004aa0870b5e5sm1199763lfo.147.2022.11.07.03.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 03:36:25 -0800 (PST)
Message-ID: <163d117e-e519-e86d-b052-e4a2a53388d7@linaro.org>
Date: Mon, 7 Nov 2022 12:36:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 3/5] arm64: dts: qcom: sm8450-hdk: enable display
 hardware
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
 <20221104131358.1025987-4-dmitry.baryshkov@linaro.org>
 <20221106043011.pw5fqeame7otzdcn@builder.lan>
 <dc19c341-c653-c60e-dd45-5c87ed4c6811@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <dc19c341-c653-c60e-dd45-5c87ed4c6811@linaro.org>
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
Cc: devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/11/2022 11:46, Konrad Dybcio wrote:
> 
> 
> On 06/11/2022 05:30, Bjorn Andersson wrote:
>> On Fri, Nov 04, 2022 at 04:13:56PM +0300, Dmitry Baryshkov wrote:
>>> Enable MDSS/DPU/DSI0 on SM8450-HDK device. Note, there is no panel
>>> configuration (yet).
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 18 ++++++++++++++++++
>>>   1 file changed, 18 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>>> index 38ccd44620d0..e1a4cf1ee51d 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>>> @@ -442,3 +442,21 @@ &usb_1_qmpphy {
>>>   	vdda-phy-supply = <&vreg_l6b_1p2>;
>>>   	vdda-pll-supply = <&vreg_l1b_0p91>;
>>>   };
>>> +
>>> +&mdss {
>>> +	status = "okay";
>>> +};
>>> +
>>> +&mdss_mdp {
>>> +	status = "okay";
>>> +};
>>> +
>>> +&dsi0 {
>>
>> Please prefix the labels with "mdss_" so that you can keep them sorted
>> alphabetically.
> Why such a change all of a sudden? Only downstream (and sc7280 upstream) 
> has mdss_ prefixes for dsi. 

For keeping the nodes together - this makes review of code and patches
easier.

> Plain 'dsiN' is more generic.

And why the label should be generic? Label should be useful and
descriptive, although not too much, so mdss_dsi still fits in reasonable
choice.

Best regards,
Krzysztof

