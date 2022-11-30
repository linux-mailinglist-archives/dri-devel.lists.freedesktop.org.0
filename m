Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65A063D440
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 12:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECB110E448;
	Wed, 30 Nov 2022 11:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE4510E448
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 11:19:04 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id g7so26426589lfv.5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 03:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RFIsvT51Wrc8AEADswZ6hxeryUff3byVSUzrQJGoVfU=;
 b=le4Xch2nyzzeVwKz1M51EeNRrUpaFDtDX4QhagI4NpvHnJB0sNgYhXN6WyGosXu0v4
 JFZrmNOARyq6gmK71OV9JtVhyyyxMfX2OH53yAoP0UmMoKsIC+Dgbvcqz9nr9bFVIn3w
 GALvD9/6mlGGnJ4h9YbLWAHSST4hyv0JF46tlVrQsh9WUQ1GLOIC+JVvAfmOj9c7bRXe
 J+Jmmt6dTjwvU2QYi00UXezUr6jmzL3Vfysk8Lt3PC/8DcU0lj6uo2OiEDxnke45/Jnk
 fzVNX9SH375kJYT64T6Pvn9HAXc1W+NFjZVkZnTQQoYxyiDHKxmaXZbmtoa2pROfrmTw
 OXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RFIsvT51Wrc8AEADswZ6hxeryUff3byVSUzrQJGoVfU=;
 b=OwPM28umEakXBNxefY08DEDyNIguCGsU04GfujKv2lOKoC/k+CWVtKUjAk928F9qnq
 4OaIGHIMxZehwrwuGFv+So33DdEmbgsAWDE48aM3oIf6whXxadLW1E6BiNMBStS8h/z4
 7jVDvxQ/eDeSiQUTWy2jyMiQu96Q52JFnb6QY6k6Bilj9+cDHkGK3IKEc5YCahgXSch6
 9JQycH+8obNRG4ibN2JXMKyWCjqDUYFkhfg269uwjgKtR7p7fmzzla0343jeEsATokV5
 IlmRc7GhwLFapXDwMsY7B3UYEUYwM8RJvdfNhCBsyYzoyfbcA/LdcoCZNJMJ0SGr1XXd
 vujw==
X-Gm-Message-State: ANoB5pmEpWx7IYqGHqmcfHUSRva++3Ie0oR8o32yyCm6zv93sgk8Nz9X
 QrttNYGtabE66y93XcLCOz/XCQ==
X-Google-Smtp-Source: AA0mqf67B1mIb5Epz/uGwtDLk61Rrh2XaO7mJ8+jxYGJKFGyDEEac/5JzzDcVDLFTU2zghbg3tWW6w==
X-Received: by 2002:ac2:4acc:0:b0:4b4:10ca:5240 with SMTP id
 m12-20020ac24acc000000b004b410ca5240mr22167633lfp.482.1669807142405; 
 Wed, 30 Nov 2022 03:19:02 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl.
 [95.49.125.236]) by smtp.gmail.com with ESMTPSA id
 p9-20020ac246c9000000b004b01305732bsm216973lfo.216.2022.11.30.03.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 03:19:01 -0800 (PST)
Message-ID: <72aede7c-deb6-6ec8-0a8d-c27d2c26e1f2@linaro.org>
Date: Wed, 30 Nov 2022 12:19:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 09/12] arm64: dts: qcom: sm6115: Add GPI DMA
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
 <20221129204616.47006-10-a39.skl@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221129204616.47006-10-a39.skl@gmail.com>
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
> Add GPI DMA node which will be wired to i2c/spi/uart.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index b459f1746a7f..e9de7aa1efdd 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -673,6 +673,26 @@ ufs_mem_phy_lanes: phy@4807400 {
>  			};
>  		};
>  
> +		gpi_dma0: dma-controller@4a00000 {
> +			compatible = "qcom,sm6115-gpi-dma", "qcom,sm6350-gpi-dma";
> +			reg = <0x04a00000 0x60000>;
> +			interrupts = <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-channels =  <10>;
> +			dma-channel-mask = <0xf>;
> +			iommus = <&apps_smmu 0xf6 0x0>;
> +			#dma-cells = <3>;
> +			status = "disabled";
> +		};
> +
>  		usb_1: usb@4ef8800 {
>  			compatible = "qcom,sm6115-dwc3", "qcom,dwc3";
>  			reg = <0x04ef8800 0x400>;
