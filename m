Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6440763D42A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 12:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8365110E444;
	Wed, 30 Nov 2022 11:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09B210E446
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 11:17:19 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id bn5so20507347ljb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 03:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=afzp4FWEpwSn4P0lsi57nrF3Llc8uEfxBSb17oyT0Dc=;
 b=OFZnac3RQf0g0XdLHH+pZFgz2YWG12V3IOmX0UZWiEPxbfeLPv5iBAnVeM4cgXhRD4
 fcIxZhBGT52Ey+cpPhoL+XbWEo8TsCjMBfvLZaJxCZJiCf634DrjexXY1gEdKHMyTbDI
 AqXS0pv5qPLY3vEiDdzsCfGa0aXrY8DMtgomWD0esDjxzQlU+qH6J4+I9b/HTQ29HOQF
 Zx7vUvSerVFo1/wUo+AVdDY7Ob8kxPhRRztn5iQWT3+alJBGj0vQUB5Jsljm0gb+qko0
 g4WrgvOBeRHunQm3/r0fjVRKt+23QtsBpPnqoGAACBcphshprWFUaSk2bE5Qwfg730Z6
 XaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=afzp4FWEpwSn4P0lsi57nrF3Llc8uEfxBSb17oyT0Dc=;
 b=Ij0PDyvhTuB9qTxNLwdetHl2BN/VYw6Oi+M+dFZsykNnam59PcfQaVgNLFobtYD0/N
 WbTw4rBFNynmxROV4V190Ha8UyR+FBOn3wBKy8q76B8bOwOly2O+I0V634XklYIUfDDt
 XNDUFZq9T4Mwn3mfGeR7ekjY6v1XuNalzKPT/Ocia/B2ExXzhZ6hp0oWoc6Svm+K+LEV
 p74+c8NO0ki1KimQY9mVPsQLuVcEDzCDolhAz0zSXjnV/f9fkWEryDeJMPWpquq7HTHG
 a+KPq9TAk7cLHMdhByZL5827C1qpb1z2TmfXMLrOcRnWHz2EiU0OF9IsAvFr4MP5hWkc
 aeFQ==
X-Gm-Message-State: ANoB5plYnSZ7fnIiLKmdDhbsgy0tAW/4wcQY7cdQE2Df4QFpUFMyhUTU
 eYOAWWJEuCRgaHkabsnz51A8Gw==
X-Google-Smtp-Source: AA0mqf5mC/ri0BgfaDrZbrRFbczWPWfnOC6qwQb/WrdmleMZypvwB+lzH+SCuVbRmHd+GgSIBBwL3A==
X-Received: by 2002:a05:651c:ba5:b0:279:9a7c:ed14 with SMTP id
 bg37-20020a05651c0ba500b002799a7ced14mr6401877ljb.351.1669807037688; 
 Wed, 30 Nov 2022 03:17:17 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl.
 [95.49.125.236]) by smtp.gmail.com with ESMTPSA id
 a15-20020a19f80f000000b004949f7cbb6esm219873lff.79.2022.11.30.03.17.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 03:17:16 -0800 (PST)
Message-ID: <7169238b-becd-2702-278c-f355df66ea97@linaro.org>
Date: Wed, 30 Nov 2022 12:17:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 05/12] arm64: dts: qcom: sm6115: Add PRNG node
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
 <20221129204616.47006-6-a39.skl@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221129204616.47006-6-a39.skl@gmail.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 29.11.2022 21:46, Adam Skladowski wrote:
> Add a node for the PRNG to enable hw-accelerated pseudo-random number
> generation.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  ar
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
ch/arm64/boot/dts/qcom/sm6115.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index decbf7ca8a03..04620c272227 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -497,6 +497,13 @@ qusb2_hstx_trim: hstx-trim@25b {
>  			};
>  		};
>  
> +		rng: rng@1b53000 {
> +			compatible = "qcom,prng-ee";
> +			reg = <0x01b53000 0x1000>;
> +			clocks = <&gcc GCC_PRNG_AHB_CLK>;
> +			clock-names = "core";
> +		};
> +
>  		spmi_bus: spmi@1c40000 {
>  			compatible = "qcom,spmi-pmic-arb";
>  			reg = <0x01c40000 0x1100>,
