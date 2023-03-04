Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1F16AABA3
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 18:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704C410E208;
	Sat,  4 Mar 2023 17:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1BF10E1E9
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Mar 2023 17:45:12 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id p26so3334341wmc.4
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Mar 2023 09:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677951911;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rsDOa+CNgxF+LrbSAZ/zI3/iIB1uuy0CX68cc9ZNyA0=;
 b=NW7OlzaI4JzVr0yaqHB5GmJkZtcr0ESKphODI8Lm4R+gfUZlVH438JMYWhaB7LL1Ap
 b84LlSJ56E8GM0WXUTekuV38nczf7lNeg6W/m/VP69nP2kFA3u/mec4lOjDtp07hLvf2
 GjPJpJ9f4L+5xtIcjHn4orq53+6QujHEaFNurRPPBIVd30yIq8iJgTs4uPk/5VsRqqU2
 v2CrJ8uDnkqBnMIp+N2F06ZY2LELmlz+jSlnFQKi2Ef1umyVOu8uckIFuEKyPb1gU990
 3mRai8jzyA2vGAhjjgnox70CIe2dk1j76Wh/U9U2FbspyFjJqtLBixoYrYr6lDekjLE6
 +8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677951911;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rsDOa+CNgxF+LrbSAZ/zI3/iIB1uuy0CX68cc9ZNyA0=;
 b=ubinPXrBaAFFVXS1O3YjtiMy3ZVx08LVDx+rLM+GnpBGfn1eCxw0IkFsrJNtX+Ordh
 t2GxB4tAJSDMelugzmWiy4MtXJrVfIHcJFRiRdCg8kV/QsfMuPNmeK1vEoq/B43+icVW
 odsxv5RsRqT4cHXigrBZ0kdI6r1lQcWH4dUQZfg8gQfhlauhKgmg2DWwDfF+HVrCsahv
 ysT+feC33FMxqj1BfeJqrtzBqARz7e/gCYI6WW9s2hi0Lh9ZR4B8VhVZhGhjB8DcdyKs
 uAKKInm3+rrSqBctGmO+V5PvE1cKIUhcRCifr0V2RrpGtkmmbpJQsNtOUge0mmuparKI
 /ciQ==
X-Gm-Message-State: AO0yUKXCNUHbRXKXmYdktu8jYmdIbiLI8jwBG3Q3vzRLECAO7sRr4MQC
 QYP3NEeXclCYH9bWsxKqV0MxyQ==
X-Google-Smtp-Source: AK7set/inqpSJRQRK+Fs1MdmEEpc2iqOvzWeyLhCqa0+AKUxKHSpRzR2JRlZJxO6iRpwlagKjhU5dA==
X-Received: by 2002:a05:600c:1e0e:b0:3dc:55d9:ec8 with SMTP id
 ay14-20020a05600c1e0e00b003dc55d90ec8mr4784841wmb.41.1677951911204; 
 Sat, 04 Mar 2023 09:45:11 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 g11-20020adffc8b000000b002c7b229b1basm5522533wrr.15.2023.03.04.09.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Mar 2023 09:45:10 -0800 (PST)
Message-ID: <28561c8b-e9a3-b58e-429a-6dc331ad94e4@linaro.org>
Date: Sat, 4 Mar 2023 17:45:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated compatible
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230304-topic-dsi_fixup-v3-0-b8565944d0e6@linaro.org>
 <20230304-topic-dsi_fixup-v3-1-b8565944d0e6@linaro.org>
 <c1a2ba5b-4cd9-362b-5a4e-e95a6bf27b3e@linaro.org>
 <30798bd2-5805-45e6-92d2-a9df6fb52600@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <30798bd2-5805-45e6-92d2-a9df6fb52600@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/03/2023 17:35, Konrad Dybcio wrote:
>> you'll see no error. However if you just do this
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
>> index 0733c2f4f3798..829fbe05b5713 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
>> @@ -1094,8 +1094,7 @@ mdp5_intf1_out: endpoint {
>>                          };
>>
>>                          dsi0: dsi@1a98000 {
>> -                               compatible = "qcom,msm8916-dsi-ctrl",
>> -                                            "qcom,mdss-dsi-ctrl";
>> +                               compatible = "qcom,mdss-dsi-ctrl";
>>                                  reg = <0x01a98000 0x25c>;
>>                                  reg-names = "dsi_ctrl";
>>
>>
>> and run the same test you get
> Yes, correct. It's valid but it's deprecated, so the bindings are
> sane. Keep in mind there's an ABI-like aspect to this.
> 
> Konrad

The _driver_ will still accept "qcom,mdss-dsi-ctrl" which is ABI 
compliant but, I don't see why the yaml should.

If you declare a new .dts with only "qcom,mdss-dsi-ctrl", that should 
throw a yaml check error.

---
bod
