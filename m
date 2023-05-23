Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0F070DD15
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 14:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD34C10E43E;
	Tue, 23 May 2023 12:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A89A10E43A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 12:56:30 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2af29e51722so49195671fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 05:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684846588; x=1687438588;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YpPwKZ/pHSK5WOwFpXpf+dWli/bJbY6VBZD/E/hAP6M=;
 b=b3DIamYxTi/v51EdZ7SDh+hBPqRnIDi2rx+vibVvM23RP7rzyneyxLRB/Axlc5MBzO
 utZ0ym+QKi6LRKwRFLZYT8kMmOsYe7sNQSOdPupxujrdTkT5+ZtDJuXI0VxaI9ncg4/b
 uwRF+nGfeB+kjW6kraUREcEDLqyR5WP476SDCyqVXEHpSUBmhotJySJ7QCSqJe35hCgh
 urAll0vklxPAr1SBcoP9YhVG9VUv8SAFXYePLOpCKrIsG4r/+X/NYx13/EH668fJo+eo
 NL1NZvXZJUO7+EssMt5Pi+VZfbFtHMgoTYSLvrTR71YMvYnH0srbD/ZyIzqWgZBaj6d8
 8O4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684846588; x=1687438588;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YpPwKZ/pHSK5WOwFpXpf+dWli/bJbY6VBZD/E/hAP6M=;
 b=MbeBpTC9/7qrnwcviA6xBax4qG1TPlUHS6oBLfX+8yMf0KpJ0rqOd4pQNmsnCKUC9y
 JY15Ged3TexJbxgjAQTWQBd666/NuGTfiY1QOaajKM43M/5+eNHwkgdPineA4IiayozA
 F7DN1I/b2sKitM8GbzV1E1yxwhiUDuIw0yB8OAZHVSDDIhDdIYC0U4jbLpd3csh/YBBT
 RgO6aaALPHe0dnxXPQopX4AKkveXfB6pFX2kFHS/WCqmGqG9giRUO86x/p35tbWLB1Oi
 lG0nFE9AK4xChcc+SZgrVlvIprqfTGAkmGyczzbtf/hX+XVyu1IE9sv5orHPtJlErW52
 sneg==
X-Gm-Message-State: AC+VfDwqQf5f8PwBkT6K8FrqRPmlbxavGiCGMcQV+tiRwRsY5wwABYqC
 vFhse6vkeQawbSepVCbVeCQioA==
X-Google-Smtp-Source: ACHHUZ6c/kauyo/sRXK7gC6gSHRvq37cCYQro1FP0DCL+bzRiQxIwgpFpYqew7cK1BFsw+yt12lPGQ==
X-Received: by 2002:a2e:b1c4:0:b0:2af:22a0:81fd with SMTP id
 e4-20020a2eb1c4000000b002af22a081fdmr4691128lja.11.1684846588241; 
 Tue, 23 May 2023 05:56:28 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
 by smtp.gmail.com with ESMTPSA id
 a19-20020a2e9813000000b002a7746800d0sm1605159ljj.130.2023.05.23.05.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 05:56:27 -0700 (PDT)
Message-ID: <19f30d4c-d879-ce2f-1cd7-ebcb941bbcec@linaro.org>
Date: Tue, 23 May 2023 14:56:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc8280xp: Enable GPU related
 nodes
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>
References: <20230523011522.65351-1-quic_bjorande@quicinc.com>
 <20230523011522.65351-4-quic_bjorande@quicinc.com>
 <1669ecc5-1845-e671-83f4-19ee14d37ce5@linaro.org>
 <20230523122842.cueyeovuzpx63def@ripper>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230523122842.cueyeovuzpx63def@ripper>
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>,
 mani@kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, johan@kernel.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23.05.2023 14:28, Bjorn Andersson wrote:
> On Tue, May 23, 2023 at 10:04:40AM +0200, Konrad Dybcio wrote:
>>
>>
>> On 23.05.2023 03:15, Bjorn Andersson wrote:
>>> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>
>>> Add memory reservation for the zap-shader and enable the Adreno SMMU,
>>> GPU clock controller, GMU and the GPU nodes for the SC8280XP CRD and the
>>> Lenovo ThinkPad X13s.
>>>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>>> ---
>>>
>>> Changes since v1:
>>> - None
>>>
>>>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     | 26 +++++++++++++++++++
>>>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 26 +++++++++++++++++++
>>>  2 files changed, 52 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
>>> index 5b25d54b9591..547277924ea3 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
>>> @@ -210,6 +210,11 @@ vreg_wwan: regulator-wwan {
>>>  	};
>>>  
>>>  	reserved-memory {
>>> +		gpu_mem: gpu-mem@8bf00000 {
>> The ZAP region is very seldom moved around, and I wouldn't expect it
>> to be uncommon among the very usecase-specific 8280 machines.
>>
>>> +			reg = <0 0x8bf00000 0 0x2000>;
>>> +			no-map;
>>> +		};
>>> +
>>>  		linux,cma {
>>>  			compatible = "shared-dma-pool";
>>>  			size = <0x0 0x8000000>;
>>> @@ -259,6 +264,10 @@ usb1_sbu_mux: endpoint {
>>>  	};
>>>  };
>>>  
>>> +&adreno_smmu {
>>> +	status = "okay";
>>> +};
>> Ugh. Should definitely be enabled by default.
>>
>>> +
>>>  &apps_rsc {
>>>  	regulators-0 {
>>>  		compatible = "qcom,pm8350-rpmh-regulators";
>>> @@ -376,6 +385,23 @@ &dispcc0 {
>>>  	status = "okay";
>>>  };
>>>  
>>> +&gmu {
>>> +	status = "okay";
>>> +};
>> You can keep the GMU enabled by default as well, it won't "probe" on
>> its own (the GPU's hw_init calls its registration)
>>
>>> +
>>> +&gpu {
>>> +	status = "okay";
>>> +
>>> +	zap-shader {
>>> +		memory-region = <&gpu_mem>;
>>> +		firmware-name = "qcom/sc8280xp/qcdxkmsuc8280.mbn";
>>> +	};
>>> +};
>>> +
>>> +&gpucc {
>>> +	status = "okay";
>>> +};
>> Clock controllers have no reason to be off by default.
>>
> 
> On sa8295p/sa8540p the GPU is powered differently, so if I leave it
> enabled by default I need to disable it (or configure it) for those, or
> they won't boot.
Another "messed up automotive forks" situation, eh..
Would it take a lot of new code to configure these platforms correctly?

Konrad
> 
> Regards,
> Bjorn
> 
>> Konrad
>>> +
>>>  &mdss0 {
>>>  	status = "okay";
>>>  };
>>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
>>> index bdcba719fc38..5ef3f4c07d75 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
>>> @@ -264,6 +264,11 @@ vreg_wwan: regulator-wwan {
>>>  	};
>>>  
>>>  	reserved-memory {
>>> +		gpu_mem: gpu-mem@8bf00000 {
>>> +			reg = <0 0x8bf00000 0 0x2000>;
>>> +			no-map;
>>> +		};
>>> +
>>>  		linux,cma {
>>>  			compatible = "shared-dma-pool";
>>>  			size = <0x0 0x8000000>;
>>> @@ -359,6 +364,10 @@ usb1_sbu_mux: endpoint {
>>>  	};
>>>  };
>>>  
>>> +&adreno_smmu {
>>> +	status = "okay";
>>> +};
>>> +
>>>  &apps_rsc {
>>>  	regulators-0 {
>>>  		compatible = "qcom,pm8350-rpmh-regulators";
>>> @@ -518,6 +527,23 @@ &dispcc0 {
>>>  	status = "okay";
>>>  };
>>>  
>>> +&gmu {
>>> +	status = "okay";
>>> +};
>>> +
>>> +&gpu {
>>> +	status = "okay";
>>> +
>>> +	zap-shader {
>>> +		memory-region = <&gpu_mem>;
>>> +		firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn";
>>> +	};
>>> +};
>>> +
>>> +&gpucc {
>>> +	status = "okay";
>>> +};
>>> +
>>>  &mdss0 {
>>>  	status = "okay";
>>>  };
