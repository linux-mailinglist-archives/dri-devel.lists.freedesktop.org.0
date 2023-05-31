Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41469718AEE
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 22:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDD510E05F;
	Wed, 31 May 2023 20:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5943710E0B0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 20:16:41 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f3b9e54338so7622793e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 13:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685564199; x=1688156199;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x9eYJWg+Z+b1a+E6Hrzk3FNFSPRGj5LfNanix7jwz0I=;
 b=Tgz3CX7lyJT1Z5ozBlXD/O6CZ4srDi1Cn356IL4wea7SeHNmPdblciCwObuf213y1N
 RynUQHrmHpEcD05kxajiM853Ja6pkBG5tPvbBXXqOTnsPr8p51OymjqXdhJzDeacVTvv
 3yHPaDfK2YXfBS+aga0O4GWXaoWDRfo4zUwe5M/1zUMVX1eKJmW2lqTwPAmfMsf43nio
 fThkOFlIP0cp1IK168sYbsUiPMimXoLU+XtnYUt6DYW6e//8WiiKKh9+cEezjDLTzxJz
 0HaZ0O1oAKk3VHnMVnZCaKE9ee43h4yysjjrV7P82DupzLN4kdHISxuJhtkafeFJTvpp
 fyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685564199; x=1688156199;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x9eYJWg+Z+b1a+E6Hrzk3FNFSPRGj5LfNanix7jwz0I=;
 b=OfqZc7w/m4o1CZNtYH578iob7S7aJjeXiONikr+kLNdMKRSD7XdRZS0We884wjKPlf
 VbYwH4wliy9VhNbmld9l7GpsWtjZ3AfRJD2ADdlfoslrw+KbuMd2QH3FTDGcBH8KiEvU
 ZQiTyszNiLUZ3GMlnjllcto5vlRWUb69tDCey0FvO2YUiDaeCFIPmYrV/HbxXpiH2RQO
 sRFzY8X7qkGuVIGg1butL+u3FUxyVa0OqS1he3HF62qJXpRvX6y610G8uibk8bVubzhD
 cTNYpL4WV4gMkOs3dIoCa1Bd/gjzXXH24z/PMOiNi1ddPD2Cku/Pd/YSvevt5g8E+Kqn
 A3zw==
X-Gm-Message-State: AC+VfDwYYtZ9YvedBCiLEU2pzxE44bZBPKcSoqCrvkS2R1lG3lqChVHa
 s7yuV4YHPwWjNwauhS5f+Qyagg==
X-Google-Smtp-Source: ACHHUZ6slYgd32qk+SuNISb320+i+gCUnqXk7fC8kqm+4GvOddfx5n7VVVRj0ttuSGgsc6c9sGGgyA==
X-Received: by 2002:ac2:5dd5:0:b0:4f2:7cb1:65fc with SMTP id
 x21-20020ac25dd5000000b004f27cb165fcmr71934lfq.64.1685564199513; 
 Wed, 31 May 2023 13:16:39 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 e2-20020ac25462000000b004f38e55ae79sm832743lfn.278.2023.05.31.13.16.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 13:16:39 -0700 (PDT)
Message-ID: <991fe23f-a9af-8929-00bf-94e623ef38cb@linaro.org>
Date: Wed, 31 May 2023 22:16:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sc8280xp: Enable GPU related
 nodes
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>
References: <20230531030945.4109453-1-quic_bjorande@quicinc.com>
 <20230531030945.4109453-4-quic_bjorande@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230531030945.4109453-4-quic_bjorande@quicinc.com>
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
 linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, johan@kernel.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 31.05.2023 05:09, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Add memory reservation for the zap-shader and enable the Adreno SMMU,
> GPU clock controller, GMU and the GPU nodes for the SC8280XP CRD and the
> Lenovo ThinkPad X13s.
> 
> Tested-by: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> 
> Changes since v2:
> - None
> 
> Changes since v1:
> - None
> 
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     | 26 +++++++++++++++++++
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 26 +++++++++++++++++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> index cd7e0097d8bc..58b1d920ea9c 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> @@ -210,6 +210,11 @@ vreg_wwan: regulator-wwan {
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
> @@ -259,6 +264,10 @@ usb1_sbu_mux: endpoint {
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
> @@ -390,6 +399,23 @@ &dispcc0 {
>  	status = "okay";
>  };
>  
> +&gmu {
> +	status = "okay";
> +};
As I pointed out in v2:

You can keep the GMU enabled by default as well, it won't "probe" on
its own (the GPU's hw_init calls its registration)

same for the other dt

Konrad
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
> +
>  &mdss0 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 5ae057ad6438..382f27946468 100644
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
