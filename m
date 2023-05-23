Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D172570D69C
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCB810E00B;
	Tue, 23 May 2023 08:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2693110E03F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 08:04:44 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f4bdcde899so459319e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 01:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684829082; x=1687421082;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jlLi+ycwQXT/s4WU1mgXfkcIcnCNUrHoMrkamB93Vuw=;
 b=yEeshyscNoLJVMCqCweqT7Ymu1NIkldjVJKTiSLVvMMfvO32evYEr1WPg2d0BW1TRQ
 uhy9kH5wiSWDV02U5UF24Cf9OjMqYE19px5Eyhbvb9xyi7grAHpwTD2SEANSIyf6xav8
 UoWmMmUVmpolCh7YAVGAXm/LsM5uyVC438M0lVeufbXpqU9Y9ndJnZlSd//vloYbXXq8
 VgXKuOdTj9eIfIih72RkIaOT/uBz8lM/WPR8gege6DfW7Bg6HWwpqNpEbV9ItQbRw3eb
 VtPzhKn0D45xdMXzgbm6TotuMxybSoWw6FCKkoOSqMVAiKXn2Tyi5NXDnVWjNM+ttgAb
 ZlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684829082; x=1687421082;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jlLi+ycwQXT/s4WU1mgXfkcIcnCNUrHoMrkamB93Vuw=;
 b=OeDNuuzGgpcKNtgV3FZe46BrJ8jVh7e5JnV+SW1QkuQwSdvRSormFcjAMsiusY7L0/
 7Sx0OoAY5DO4sBtcK4g9gpVHVNpsIHdxyQIcODnVOr4A7YecKewoBPm6Z5XhkJVzicuW
 Go2G6O4ot96lNhFL4Zr9DUpTMc7IWZxMf7b2/n3JePuPorQHU3yJvVwtHx9ukMKvz8yp
 Dpq5PFS2Y8K3XU+MrCkNA0DuDMNyItD5nQIkwGK6VlCwfBWYDBcMxEOyKRDrOG6sP5vU
 4uohXwcBjsr/84n00u2WzZrG05lYbXK7lsmTM2uDS9jSjwCCCpuSXoTM+yfnffykgCDz
 AEOg==
X-Gm-Message-State: AC+VfDw2c/XaNU5wYuWc4kHaj56wrIyLyQEsrRsiRi9rtdIajd+3BbND
 vz3WFAWUFgf/xXKkasAvbfcYLQ==
X-Google-Smtp-Source: ACHHUZ5q1rbkyTP3VBE77IeCogBVNMojIQwKmhDiZgShpgGhFEFrKHs6LoV4mjCuEeutALVhZt49Cw==
X-Received: by 2002:ac2:5298:0:b0:4ef:eb50:4d3d with SMTP id
 q24-20020ac25298000000b004efeb504d3dmr4022870lfm.18.1684829082167; 
 Tue, 23 May 2023 01:04:42 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
 by smtp.gmail.com with ESMTPSA id
 h13-20020ac2596d000000b004f11eb32f20sm1266058lfp.13.2023.05.23.01.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 01:04:41 -0700 (PDT)
Message-ID: <1669ecc5-1845-e671-83f4-19ee14d37ce5@linaro.org>
Date: Tue, 23 May 2023 10:04:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc8280xp: Enable GPU related
 nodes
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>
References: <20230523011522.65351-1-quic_bjorande@quicinc.com>
 <20230523011522.65351-4-quic_bjorande@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230523011522.65351-4-quic_bjorande@quicinc.com>
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
Cc: devicetree@vger.kernel.org, mani@kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 johan@kernel.org, freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23.05.2023 03:15, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Add memory reservation for the zap-shader and enable the Adreno SMMU,
> GPU clock controller, GMU and the GPU nodes for the SC8280XP CRD and the
> Lenovo ThinkPad X13s.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> 
> Changes since v1:
> - None
> 
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     | 26 +++++++++++++++++++
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 26 +++++++++++++++++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> index 5b25d54b9591..547277924ea3 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> @@ -210,6 +210,11 @@ vreg_wwan: regulator-wwan {
>  	};
>  
>  	reserved-memory {
> +		gpu_mem: gpu-mem@8bf00000 {
The ZAP region is very seldom moved around, and I wouldn't expect it
to be uncommon among the very usecase-specific 8280 machines.

> +			reg = <0 0x8bf00000 0 0x2000>;
> +			no-map;
> +		};
> +
>  		linux,cma {
>  			compatible = "shared-dma-pool";
>  			size = <0x0 0x8000000>;
> @@ -259,6 +264,10 @@ usb1_sbu_mux: endpoint {
>  	};
>  };
>  
> +&adreno_smmu {
> +	status = "okay";
> +};
Ugh. Should definitely be enabled by default.

> +
>  &apps_rsc {
>  	regulators-0 {
>  		compatible = "qcom,pm8350-rpmh-regulators";
> @@ -376,6 +385,23 @@ &dispcc0 {
>  	status = "okay";
>  };
>  
> +&gmu {
> +	status = "okay";
> +};
You can keep the GMU enabled by default as well, it won't "probe" on
its own (the GPU's hw_init calls its registration)

> +
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		memory-region = <&gpu_mem>;
> +		firmware-name = "qcom/sc8280xp/qcdxkmsuc8280.mbn";
> +	};
> +};
> +
> +&gpucc {
> +	status = "okay";
> +};
Clock controllers have no reason to be off by default.

Konrad
> +
>  &mdss0 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index bdcba719fc38..5ef3f4c07d75 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -264,6 +264,11 @@ vreg_wwan: regulator-wwan {
>  	};
>  
>  	reserved-memory {
> +		gpu_mem: gpu-mem@8bf00000 {
> +			reg = <0 0x8bf00000 0 0x2000>;
> +			no-map;
> +		};
> +
>  		linux,cma {
>  			compatible = "shared-dma-pool";
>  			size = <0x0 0x8000000>;
> @@ -359,6 +364,10 @@ usb1_sbu_mux: endpoint {
>  	};
>  };
>  
> +&adreno_smmu {
> +	status = "okay";
> +};
> +
>  &apps_rsc {
>  	regulators-0 {
>  		compatible = "qcom,pm8350-rpmh-regulators";
> @@ -518,6 +527,23 @@ &dispcc0 {
>  	status = "okay";
>  };
>  
> +&gmu {
> +	status = "okay";
> +};
> +
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		memory-region = <&gpu_mem>;
> +		firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn";
> +	};
> +};
> +
> +&gpucc {
> +	status = "okay";
> +};
> +
>  &mdss0 {
>  	status = "okay";
>  };
