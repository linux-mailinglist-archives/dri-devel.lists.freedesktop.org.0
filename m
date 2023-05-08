Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF686FA7AB
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 12:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A9010E20E;
	Mon,  8 May 2023 10:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADEF10E20D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 10:33:37 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ac81d2bfbcso46398291fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 03:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683542015; x=1686134015;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eMkK5cHocOkySdQ1dvULOQ4jNtQaf1to9XDN1aW8VkM=;
 b=cnTXZAY/dC1mZhWnJp12bXNBoExNjAwk+0GnUWEDkYavWKThKgPlaw3OWMDOtsO3wf
 nI+rUpF8DhpoFnT/ucaXQbtXuQOUHkEn/byigFXHp0Nkaqk7HuumTB+qU2DA7jss7SDJ
 98cY5IoqOXqf3ApD4dC1BwGBMpaQWgYy6Nc7PYvc/L3LgCpaTEf9FCvxf1HTvwHPJNLp
 3wD4LwKrHLxAa3dYgidb5Ap54WWAC4UCXm/S8EzEepcU+QtimXzqb8R7PsZpG9BUzoPl
 cJxaJ6wFn2ECWWIEtBNvEw9tJl0MoDbExxxvBWs47nOJsM5mFIWJOlgYVRemAkM4znZ9
 n0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683542015; x=1686134015;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eMkK5cHocOkySdQ1dvULOQ4jNtQaf1to9XDN1aW8VkM=;
 b=RiV0+u7aGQK6ZDEXA+hM+NiW/QMKCAgyvzj2OAuzJl50e2BKmPy+7dB/sIIJvA+5Gc
 4UR9J0wsvTHCh6LWyF5GOVxQVscyS6bndvsFMk0AQdBMqc6GeHbCx5jNYSaqJ9oO129h
 lk1WrDpLXnYpk2pyiUdug3qSr9w6kGQyE440kmXnTsEhkBQ/CZwG2HYdO23Inky80xuI
 tm6g4+IhchLC0uaTf5u819ms4mo/7qYs3WlveM0fd9V/hCk87Pgf5BU3wFtgUbF+7eiB
 u/1cd2LY3xXunBy0VK72pY8B+cmFh8ir27ExRt5qWbUISoRdXevs/V9GBWsyPi008VUC
 z0MQ==
X-Gm-Message-State: AC+VfDyCvxCWObV4JxZ7bUqx4hxzsqVolxr4vyKkyEONZnTmAVl2QV6v
 x1TyEOkkjDaYy5zr/22VIIsNUg==
X-Google-Smtp-Source: ACHHUZ6c1+OpsDSd4MYi0ZIkjZ8oJNw/uPXhw3lExTrIxEHsqFxKnyHc22rN/ZZOYQHgYm8zrvnpcg==
X-Received: by 2002:a2e:9590:0:b0:2ac:77fb:f2b3 with SMTP id
 w16-20020a2e9590000000b002ac77fbf2b3mr2810640ljh.40.1683542014794; 
 Mon, 08 May 2023 03:33:34 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a2e3516000000b002a77792f2c5sm1109979ljz.62.2023.05.08.03.33.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 03:33:34 -0700 (PDT)
Message-ID: <f705d3c0-3822-1760-ba1f-fa11ef295bc7@linaro.org>
Date: Mon, 8 May 2023 13:33:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/4] ARM: dts: qcom: apq8074-dragonboard: enable DSI panel
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
 <20230507190735.2333145-5-dmitry.baryshkov@linaro.org>
 <ca09ce7d-b0c4-1544-0c9e-fab823aa79e6@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ca09ce7d-b0c4-1544-0c9e-fab823aa79e6@linaro.org>
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

On 08/05/2023 11:34, Konrad Dybcio wrote:
> 
> 
> On 7.05.2023 21:07, Dmitry Baryshkov wrote:
>> Enable MDSS, GPU and DSI panel output on the APQ8074 dragonboard.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 51 +++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>> index c893afc00eb4..72f7e09a5bbf 100644
>> --- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>> @@ -48,6 +48,57 @@ eeprom: eeprom@52 {
>>   	};
>>   };
>>   
>> +&dsi0 {
> old junk could use some mdss_ prefixing to keep the nodes together
> 
> Could you please take care of that?

Ack

> 
>> +	vdda-supply = <&pm8941_l2>;
>> +	vdd-supply = <&pm8941_l22>;
>> +	vddio-supply = <&pm8941_l12>;
>> +
>> +	status = "okay";
>> +
>> +	panel: panel@0 {
>> +		compatible = "sharp,ls043t1le01-qhd";
>> +		reg = <0>;
>> +
>> +		avdd-supply = <&pm8941_l22>;
>> +		backlight = <&pm8941_wled>;
>> +		reset-gpios = <&pm8941_gpios 19 GPIO_ACTIVE_HIGH>;
>> +
>> +		port {
>> +			panel_in: endpoint {
>> +				remote-endpoint = <&dsi0_out>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&dsi0_out {
>> +	remote-endpoint = <&panel_in>;
>> +	data-lanes = <0 1 2 3>;
>> +};
>> +
>> +&dsi0_phy {
>> +	status = "okay";
>> +
>> +	vddio-supply = <&pm8941_l12>;
> status last
> 
> Konrad
>> +};
>> +
>> +&gpu {
>> +	status = "okay";
>> +};
>> +
>> +&mdss {
>> +	status = "okay";
>> +};
>> +
>> +&pm8941_wled {
>> +	qcom,cs-out;
>> +	qcom,switching-freq = <3200>;
>> +	qcom,ovp = <32>;
>> +	qcom,num-strings = <1>;
>> +
>> +	status = "okay";
>> +};
>> +
>>   &remoteproc_adsp {
>>   	cx-supply = <&pm8841_s2>;
>>   

-- 
With best wishes
Dmitry

