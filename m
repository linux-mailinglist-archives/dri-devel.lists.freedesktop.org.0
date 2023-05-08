Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8136A6FA793
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 12:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D8810E1FC;
	Mon,  8 May 2023 10:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F51110E202
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 10:32:23 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ac831bb762so41757541fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 03:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683541941; x=1686133941;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ScXfOKBt81Z5zV2cG1662UPRXJFST6VZnBC6VouOjSc=;
 b=GrmDkGJvrRaoi7LAewDtfUAM0YYBpgUMUKRpSX8RbK2obuLwBwfJlk2QZkc/b7PuJo
 HYWBbWCm6V2TXoHPv+iyQppf1PoYXtBvLAsZFcz5WgJI/QqSZMMF/sXoRZRS7bYhTX7u
 WwtTxeGprytGUZBpLQVgODKMSnmy8v6+XsCbjnm8J1ZIdM6GP0mN3E6/WvSHAO2l0AWe
 sgYQkjyPLeHPI4DErBPWlFeYnfWDxB7oN+SGqAUhJRzN1kmhH4kHm55/TPs4VUZPBhBn
 wWV+Y/Fk3TjSwEnn4WENzWiF0nqRTD6pmpzZdeH9eLGTDKYDM2MpSVAm9Qp2xLqeIZOt
 wnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683541941; x=1686133941;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ScXfOKBt81Z5zV2cG1662UPRXJFST6VZnBC6VouOjSc=;
 b=FWEiAi3r5hfc9EtbGL/5e/GPQ5c9Gy0ebGkAIIz1OQ9iiQGm/MGV0O+Khj+lizLyDh
 1AtLBnVtMva5eBFfc+zhDdsukjjxEtrVMbTrfil7yLuytwUvcV7arbujwTq0i8hJmBdw
 MnW1SoKRXIAuXnvYKPHvthmU9CvE+cUDnwgKRBSMIhG/b1JSY86CXsRIGNmq0UHN1lw9
 iJydGvl/Bte/6o8KyhsFDHvvY2+FiLq6rIJrLGpO6T8XfGHDrvg54CdOZjTXIlAcWP7Y
 TpwdHQUuH34u94LuGGk4KTcv+sgsycr9bKZHHbn5S0OCOIVbgiNvSvCZM8BaGXJzWJJl
 NLgg==
X-Gm-Message-State: AC+VfDzxEOSLa+4M4GpIJn5t45D5CB9eSS9t3zSCFjZYE4K3MGyOtO7z
 v8cqY1YYgLnpv2oKOrxr//uAZg==
X-Google-Smtp-Source: ACHHUZ4gpZuq2LgpGp2cEbClw5qjF/b0rPeJcLA8iwjKT4SpwOE0zQ62tK/5XBVkS0mkN6iyEv87UA==
X-Received: by 2002:a05:651c:236:b0:295:9be0:212b with SMTP id
 z22-20020a05651c023600b002959be0212bmr2763621ljn.8.1683541941628; 
 Mon, 08 May 2023 03:32:21 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a2e3e0b000000b002a8dce82cf6sm1127122lja.32.2023.05.08.03.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 03:32:21 -0700 (PDT)
Message-ID: <01fc4065-681f-daba-1c73-cc57768f880e@linaro.org>
Date: Mon, 8 May 2023 13:32:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974: add ocmem clock to GPU
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
 <20230507190735.2333145-2-dmitry.baryshkov@linaro.org>
 <8cdecc51-2a42-4b82-9eb3-2ab77860c5d4@linaro.org>
 <c8144b21-d672-318e-2761-5d1daf384c30@linaro.org>
 <d357a6f9-d66b-0ba1-138c-4b541c3bebfb@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d357a6f9-d66b-0ba1-138c-4b541c3bebfb@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/05/2023 13:28, Konrad Dybcio wrote:
> 
> 
> On 8.05.2023 12:24, Dmitry Baryshkov wrote:
>> On 08/05/2023 11:30, Konrad Dybcio wrote:
>>>
>>>
>>> On 7.05.2023 21:07, Dmitry Baryshkov wrote:
>>>> To get GPU working with the OCMEM, the oxili_ocmemgx_clk clock should be
>>>> enabled. Pass it to the GPU to get it to work on apq8074/msm8974 boards.
>>>>
>>>> Fixes: fe079442db63 ("ARM: dts: qcom: msm8974: add gpu support")
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>> Uhh.. this clock should be managed by RPM with:
>>>
>>> type = MEM
>>> id = 2
>>>
>>> just like it's defined for 8994 today.
>>>
>>> Could you try adding it in rpmcc and confirming?
>>
>> There is an RPM_SMD_OCMEMGX_CLK clk already, it is a bus clock for the ocmemnoc.
> It's wrong.

Can you possibly be more specific here?

On 8974 RPM_SMD_OCMEMGX_CLK is a core clock for ocmem and a bus clock 
for ocmemnoc.

On 8994 this clocks is just a core clock for ocmem, there is no ocmemnoc.


> 
> Konrad
>>
>>>
>>> Konrad
>>>>    arch/arm/boot/dts/qcom-msm8974.dtsi | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
>>>> index 834ad95515b1..fb661c1bd3d5 100644
>>>> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
>>>> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
>>>> @@ -2104,8 +2104,9 @@ gpu: adreno@fdb00000 {
>>>>                  clocks = <&mmcc OXILI_GFX3D_CLK>,
>>>>                     <&mmcc OXILICX_AHB_CLK>,
>>>> +                 <&mmcc OXILI_OCMEMGX_CLK>,
>>>>                     <&mmcc OXILICX_AXI_CLK>;
>>>> -            clock-names = "core", "iface", "mem_iface";
>>>> +            clock-names = "core", "iface", "mem", "mem_iface";
>>>>                  sram = <&gmu_sram>;
>>>>                power-domains = <&mmcc OXILICX_GDSC>;
>>

-- 
With best wishes
Dmitry

