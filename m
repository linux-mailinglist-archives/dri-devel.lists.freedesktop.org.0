Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3143171494C
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 14:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FEAB10E284;
	Mon, 29 May 2023 12:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C8510E284
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 12:19:15 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f4d6aee530so3347928e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 05:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685362753; x=1687954753;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YECXa3X/DxmraiWq2kY1kuESj9S065EhI3PmyoIgQQU=;
 b=jVBrGtJnd6soXtOqbUpHJU1830vJv+VTsU77nmdFHHhlV/9Ho04aTrAHvGu8QGikjZ
 KYayQyXjcBm+YVmxLl+ws1vFxcpQxT6asCZTQdm4DckgOdfKtHuN4jr4LzbREd9DQUhN
 Hz3rMoPrBTmTl/6Sf/g7gVXVqselWbcTxF4D3TNrizHitQprx+/vexyiPgygga1Dp1me
 B/LRYoRe4LLeL+7ekja1fv6BunFx4gVPmX8YSeIDBiFeSKRDnelmXOnrgyvLA6oPGTyR
 y1By6leTvSwqXtWMoomn+XkHTrI0w7RK3CJbiT3tQeyzugGG3kkRhI8/IsHS+nIqklQW
 A7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685362753; x=1687954753;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YECXa3X/DxmraiWq2kY1kuESj9S065EhI3PmyoIgQQU=;
 b=hdZcMD9u7PI3qjGagEuhnTJcgZaYv5CEmVs76Djk5diIZ1AqKIKuPQr77eN5odMBT7
 F7cd8vCbZ3TYksCUYKdrCFGD722CxpFvx48Dfle8Mq+NkbTR+1JUPDWaMhLNB8j+FgHt
 A52Vaaj1AgIZBXq2Tfuc5KEYRL7rUUQtp1te4wQjpRqsogpmbX1dLNIvryUphzm1apzd
 XF5b5jh5OvA6zyX21OlzHKv/f1uPyNf4OtSh2In2x50g6t7IJlMYBCShNUN6505X+3Gv
 mmTnc/kwVaRAzO3pwRNQT8TnYVnv3UVBOlus3KT1zhZgJDOcKEjsPUYes4R/cefp7wAM
 pF8Q==
X-Gm-Message-State: AC+VfDxCOMGfnJpuwr5YaWuEzkl4NALVmLcmrqparQ6ZJY3JjvxXI6Ii
 MLOrhoYfe5UkKVaPKiUfuhkTjpAHt5H3JtcME40=
X-Google-Smtp-Source: ACHHUZ763qQqMP7KPrX70p+UDKi6WNOOXFBaePb7niWyZD7/Ea1KfN14TiBixaTiQxjWYxnhiHXcMw==
X-Received: by 2002:a19:5201:0:b0:4f4:3418:4726 with SMTP id
 m1-20020a195201000000b004f434184726mr2931247lfb.56.1685362753224; 
 Mon, 29 May 2023 05:19:13 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 16-20020ac24830000000b004f13c00dd9bsm1972467lft.135.2023.05.29.05.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 05:19:12 -0700 (PDT)
Message-ID: <58e7e5ff-5e40-7871-efe2-bfe88bd19dad@linaro.org>
Date: Mon, 29 May 2023 15:19:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 7/7] ARM: dts: qcom: msm8226: Add mdss nodes
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Luca Weiss <luca@z3ntu.xyz>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
 <20230308-msm8226-mdp-v1-7-679f335d3d5b@z3ntu.xyz>
 <6c79b99e-cc69-8cd9-c990-5c0373e1f09c@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6c79b99e-cc69-8cd9-c990-5c0373e1f09c@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/05/2023 15:10, Konrad Dybcio wrote:
> 
> 
> On 29.05.2023 11:44, Luca Weiss wrote:
>> Add the nodes that describe the mdss so that display can work on
>> MSM8226.
>>
>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>> ---
>>   arch/arm/boot/dts/qcom-msm8226.dtsi | 118 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 118 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
>> index 42acb9ddb8cc..182d6405032f 100644
>> --- a/arch/arm/boot/dts/qcom-msm8226.dtsi
>> +++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
>> @@ -636,6 +636,124 @@ smd-edge {
>>   				label = "lpass";
>>   			};
>>   		};
>> +
>> +		mdss: display-subsystem@fd900000 {
>> +			compatible = "qcom,mdss";
>> +			reg = <0xfd900000 0x100>, <0xfd924000 0x1000>;
>> +			reg-names = "mdss_phys", "vbif_phys";
>> +
>> +			power-domains = <&mmcc MDSS_GDSC>;
>> +
>> +			clocks = <&mmcc MDSS_AHB_CLK>,
>> +				 <&mmcc MDSS_AXI_CLK>,
>> +				 <&mmcc MDSS_VSYNC_CLK>;
>> +			clock-names = "iface", "bus", "vsync";
> One per line, please
> 
>> +
>> +			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			interrupt-controller;
>> +			#interrupt-cells = <1>;
> We're not using the irq cell, is that necessary/should that be 0?

No. With 0 it would mean that there is a single interrupt for mdss 
source, which clearly is not the case.

> 
>> +
>> +			status = "disabled";
> status should go last
> 
>> +
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			ranges;
>> +
>> +			mdp: display-controller@fd900000 {
>> +				compatible = "qcom,msm8226-mdp5", "qcom,mdp5";
>> +				reg = <0xfd900100 0x22000>;
>> +				reg-names = "mdp_phys";
>> +
>> +				interrupt-parent = <&mdss>;
>> +				interrupts = <0>;
>> +
>> +				clocks = <&mmcc MDSS_AHB_CLK>,
>> +					 <&mmcc MDSS_AXI_CLK>,
>> +					 <&mmcc MDSS_MDP_CLK>,
>> +					 <&mmcc MDSS_VSYNC_CLK>;
>> +				clock-names = "iface", "bus", "core", "vsync";
> One per line, please
> 
>> +
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
> Would port { work here? I remember one mdss component's bindings
> didn't allow it but don't recall which one

Let's use ports /port@0 for uniformity even if there is just a single 
port always.

> 
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +						mdp5_intf1_out: endpoint {
>> +							remote-endpoint = <&dsi0_in>;
>> +						};
>> +					};
>> +				};
>> +			};
>> +-- 
With best wishes
Dmitry

