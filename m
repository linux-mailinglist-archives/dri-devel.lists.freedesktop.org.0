Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E6F6FA83B
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 12:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DE210E211;
	Mon,  8 May 2023 10:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6262510E20A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 10:38:52 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ac7de2b72fso50377601fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 03:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683542330; x=1686134330;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ioq2SHcYvzdWJgMENWPLRbhibNiRpiB3AcW6l1wBqmo=;
 b=pPwt2Urq9QTN/xOxlOHg28lV78TNcLYFXCnGQ2ofYbevhZWyzB4u+8K20Tqb2OkdYA
 3wYrpHTS4dEv3cbSA5EFfNt0tpll3f2nrWSaeqmJaT2EvzCmsU2JK3D3Bwl2WUFNU7MV
 RjaiPY6hivn2CcXD3gHGE+zU/ZFRtM/8PcTjHBne6CmJLkdXUwd4ISnCQ2cPla80U7zG
 IJa7XxwwS9bJw8itdMyweLo9q/t8Dvz6JmGaObGVfeY1Vclm4E2byq8A7CdIilMYgZ9d
 vw4JyGUk8wzXgR00R2es8i5elY8xbkcMcJOdeWliawcyvqEwAP3acJngbUA6ghQK9cBc
 dCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683542330; x=1686134330;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ioq2SHcYvzdWJgMENWPLRbhibNiRpiB3AcW6l1wBqmo=;
 b=LtGQBpuuBMuWc5pvqlKikZW29TJm8Nyy+xBvdfoe//Tijnr4oCh0U60a7DgOVpCDXE
 IsaL1AqQkqzvGcUDUQxnAKYPd6B0W/0pJLU08e5CNxiJsxob2Qlcp92mHwQldkVGhGtd
 Y2e3iTFfBITYPp1Hnyrqc0ZuGvlMI7R26neKunoVRAp38N5E4baQUiSao2zj9Tmbqp1a
 tS9nSwkXUxQFsqFrxiYukBwe4KGF4hDltj51ZrwmsSB4SBOpEy6B/0P6liTL6EP4yvW/
 Eo4f71DgaJ638g02A1KX5waop+ppDYZPOa6tRVFHE1loBBouXijvO96S3fFrvQYuId8N
 8RIQ==
X-Gm-Message-State: AC+VfDzjeR7JCwdw+r6jh8kvfsh0i2++mAZOhNar8JwTPwy4KaUchqgc
 x8T3FX4r3GwAf/SjU17KjKHVgg==
X-Google-Smtp-Source: ACHHUZ7S5zP58g6KXG/JEkUocDxvEXW0bXVKra1pbbx4QdVHZkXdfPz0kZLX00pfASUO8PhnfzUK/g==
X-Received: by 2002:a2e:8508:0:b0:2a8:b070:c21f with SMTP id
 j8-20020a2e8508000000b002a8b070c21fmr2466304lji.16.1683542330361; 
 Mon, 08 May 2023 03:38:50 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a2e3e02000000b002a6168181d7sm1134847lja.7.2023.05.08.03.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 03:38:50 -0700 (PDT)
Message-ID: <f33f124e-a989-4501-a896-45649297d71c@linaro.org>
Date: Mon, 8 May 2023 13:38:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/4] ARM: dts: qcom: apq8074-dragonboard: Set DMA as
 remotely controlled
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
 <20230507190735.2333145-3-dmitry.baryshkov@linaro.org>
 <f968009f-c52b-5e4c-aa79-01c0ac53b8dc@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f968009f-c52b-5e4c-aa79-01c0ac53b8dc@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/05/2023 11:32, Konrad Dybcio wrote:
> 
> 
> On 7.05.2023 21:07, Dmitry Baryshkov wrote:
>> Add the qcom,controlled-remotely property for the blsp2_bam
>> controller node. This board requires this, otherwise the board stalls
>> during the boot for some reason (most probably because TZ mishandles the
>> protection error and keeps on looping somewhere inside).
>>
>> Fixes: 62bc81792223 dts: msm8974: Add blsp2_bam dma node
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> Looks like a common theme.. sony-rhine boards also have the DMA
> enabled *and* need this property.. perhaps it's a SoC-wide (or
> at least SoC-and-fw-distribution-wide) issue?

This looks like a strange history. Especially granted 338d51889851 
("Revert "dts: msm8974: Add blsp2_bam dma node"") and d44cbb1e9ca3 
("Revert "Revert "dts: msm8974: Add blsp2_bam dma node""")

And, of course, 
https://lore.kernel.org/linux-arm-msm/CAJAp7Oi33=kraAiU337JdFJZbuKZEVoCtY4FfAv_RgiWVmz+sw@mail.gmail.com/

Note, 338d51889851 mentions non-dragonboard boards. This makes me think 
that for some of the dragonboards/firmware combos this device was 
working as is, without controlled remotely. I could not get 'the latest 
bootloader package' (if there was one), so I'm stuck with what I have on 
my board. However there is no guarantee that it is the latest and 
greatest stuff.

Thus said, for this patch I decided to follow the rhino example and add 
this to the board file. Unless Bjorn (or anybody else remembering those 
times) can advise us.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Konrad
>>   arch/arm/boot/dts/qcom-apq8074-dragonboard.dts | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>> index 1345df7cbd00..6b047c679370 100644
>> --- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>> @@ -23,6 +23,10 @@ &blsp1_uart2 {
>>   	status = "okay";
>>   };
>>   
>> +&blsp2_dma {
>> +	qcom,controlled-remotely;
>> +};
>> +
>>   &blsp2_i2c5 {
>>   	status = "okay";
>>   	clock-frequency = <200000>;

-- 
With best wishes
Dmitry

