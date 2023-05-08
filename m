Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A89956FA813
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 12:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE7C10E202;
	Mon,  8 May 2023 10:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5880B10E202
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 10:37:20 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f13d8f74abso4896390e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 03:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683542238; x=1686134238;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kLguggw99xxqCuarIT3sUQKT9PSunZQtK0bgeU/RtAI=;
 b=RunXxGhCzpDGn6pLJ57TvtLicVHmUMuaTPbKVbMh0/Tl9TAlIu4XLnfDIFLE7yUIvg
 2wcEjjES8dC+9VZn9XG2o8EvAT54X2PfBY6juyi4PbQL1RR1svi5RqUt4QahhHkcH0TG
 6WynqtLL2k7KYSuVvjPSuBHhTbpEWX8od55JmoWnwimRyTmJt6S4ajivW+DNGVn2ZlWh
 EPRJ1ncyqYIo2j/z8Ebjztf+SDGYALhjoHycP+3I6hOSbFi9ePwITc1B5Xh5QU59wx8z
 yhnJWXJL2Vn2h98+cRPYHR+v1iGcEYZKs2K2J/9n+X/0IqGFjIc0h7fDp5sx785HgY+t
 Dzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683542238; x=1686134238;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kLguggw99xxqCuarIT3sUQKT9PSunZQtK0bgeU/RtAI=;
 b=biAPZNkUIB30BaDm56ZZk34PPSZ5L5uwNQN5dkciCb4K027efvoMPBnHUKn1YmaQ4c
 nju0umuZYyVTJdor9uOcFFR9xFYA1xgsNfzxbYP991SCTIQVU7uhgPnawBLV6yMpNv4/
 Ui0YoadG70sq5W5D4IyHPjinqUIteCmyxT60AyKdKmcgW9uRIpJjvuVoC7Ok27e1ZEVe
 1MnBB9guGFIDaYcT5siYKpHYs2AsFRloS03xV1NNf2YhFi8+uMCdl1kj5g06UPNeSb5Q
 ty6CEDebaOJPG7MDmClq09+L4qc/hkDGTDtdMaPSG/RDntsxiC0MbonnaxwzXBsMItwg
 smrA==
X-Gm-Message-State: AC+VfDyMtHOKWR9fHWPagCI5i9G0TFhyp3JbPQBJcS9ZvoBbN+Ypfr7p
 IpvhLry1uupm0woIi3DVPJksxg==
X-Google-Smtp-Source: ACHHUZ5n18z4iUjRdX6K7JArdf1SKPjPwSsDbFmbRiDF7lAyFUSB4i9jw28FQgs11ZbpeZW1za5OPA==
X-Received: by 2002:ac2:5501:0:b0:4e8:5e39:6234 with SMTP id
 j1-20020ac25501000000b004e85e396234mr2228676lfk.16.1683542238452; 
 Mon, 08 May 2023 03:37:18 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a056512094100b004edd3f011cfsm1251929lft.43.2023.05.08.03.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 03:37:18 -0700 (PDT)
Message-ID: <f2754e31-ce69-9426-a41e-2c58686f7f53@linaro.org>
Date: Mon, 8 May 2023 12:37:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974: add ocmem clock to GPU
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
 <20230507190735.2333145-2-dmitry.baryshkov@linaro.org>
 <8cdecc51-2a42-4b82-9eb3-2ab77860c5d4@linaro.org>
 <c8144b21-d672-318e-2761-5d1daf384c30@linaro.org>
 <d357a6f9-d66b-0ba1-138c-4b541c3bebfb@linaro.org>
 <01fc4065-681f-daba-1c73-cc57768f880e@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <01fc4065-681f-daba-1c73-cc57768f880e@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8.05.2023 12:32, Dmitry Baryshkov wrote:
> On 08/05/2023 13:28, Konrad Dybcio wrote:
>>
>>
>> On 8.05.2023 12:24, Dmitry Baryshkov wrote:
>>> On 08/05/2023 11:30, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 7.05.2023 21:07, Dmitry Baryshkov wrote:
>>>>> To get GPU working with the OCMEM, the oxili_ocmemgx_clk clock should be
>>>>> enabled. Pass it to the GPU to get it to work on apq8074/msm8974 boards.
>>>>>
>>>>> Fixes: fe079442db63 ("ARM: dts: qcom: msm8974: add gpu support")
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>> Uhh.. this clock should be managed by RPM with:
>>>>
>>>> type = MEM
>>>> id = 2
>>>>
>>>> just like it's defined for 8994 today.
>>>>
>>>> Could you try adding it in rpmcc and confirming?
>>>
>>> There is an RPM_SMD_OCMEMGX_CLK clk already, it is a bus clock for the ocmemnoc.
>> It's wrong.
> 
> Can you possibly be more specific here?
> 
> On 8974 RPM_SMD_OCMEMGX_CLK is a core clock for ocmem and a bus clock for ocmemnoc.
The ocmemnoc bus is managed internally, the rpm clock is not used for scaling,
only to make sure the NIU is clocked for ocmem node access.

It's "scaled" with the ocmem-slv node, but the code never sets any rate,
only calls clk_get.

> 
> On 8994 this clocks is just a core clock for ocmem, there is no ocmemnoc.
It's there, named "fab-ovirt" and on 8994 it's actually used for scaling.

Konrad
> 
> 
>>
>> Konrad
>>>
>>>>
>>>> Konrad
>>>>>    arch/arm/boot/dts/qcom-msm8974.dtsi | 3 ++-
>>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
>>>>> index 834ad95515b1..fb661c1bd3d5 100644
>>>>> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
>>>>> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
>>>>> @@ -2104,8 +2104,9 @@ gpu: adreno@fdb00000 {
>>>>>                  clocks = <&mmcc OXILI_GFX3D_CLK>,
>>>>>                     <&mmcc OXILICX_AHB_CLK>,
>>>>> +                 <&mmcc OXILI_OCMEMGX_CLK>,
>>>>>                     <&mmcc OXILICX_AXI_CLK>;
>>>>> -            clock-names = "core", "iface", "mem_iface";
>>>>> +            clock-names = "core", "iface", "mem", "mem_iface";
>>>>>                  sram = <&gmu_sram>;
>>>>>                power-domains = <&mmcc OXILICX_GDSC>;
>>>
> 
