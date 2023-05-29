Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D194714B2C
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 15:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466EF10E29B;
	Mon, 29 May 2023 13:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0692610E2A2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 13:56:37 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30ad752f433so1911639f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 06:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685368596; x=1687960596;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9cbwoD1bDN3KeTSFxlU0dNxIG4pUsYvcyn2OEG5dA6Q=;
 b=P9z5GBmuumqpXC/Gaq66lcgqiAY/Pss4bmTLP+wq60i0MlcKwPs3S4uOVtCPyb28fH
 OoiHnTE1ViICbKKXgH37QBybD80O6JRJSRRZPjz2ysjynt4Tog74GNfvSrA3FfuvTlw8
 h/mrNsxY1Nax1/9BbwELXG1HshPnvUX2/j2+0ET2yrk1K+hbK4U1PchSSa/ah9kvaxUR
 sxujRG+zrr0f0NBHfQv0CDjysLAAp1uWo6yPkX9eZUMgjW25RLi2ODUlCG3UOMx6EQ1I
 NbLBtETwCRxTAo+zW2Adlyem4pYuG+HRUzLZs0P/x2ST380ED7ujhpvh8SmdMQuUnJGS
 XIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685368596; x=1687960596;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9cbwoD1bDN3KeTSFxlU0dNxIG4pUsYvcyn2OEG5dA6Q=;
 b=dLZXasW9EzcASDo3DL+vl3APGUCdUaLLGjQFvVPpyVrpKSglZdFB303Cy4aaiaLSEH
 rU2UWEQKPUYYvamGqrKwVH8+mKaA5BplEZHTeeiWmbtFVggDXoPYnYs2FPIE9J6Zmkfs
 C/pWIryGTUcDhuD2YyUu7Bq3BwUU7Vhe46tclWVW2vZEz8LemtTegj4YHRckAdkobGUT
 OjQFhtEEFirfpoJyfwtwI/tu/e8FWHX5Ht6Vnx4o96+1+FJP7zVROb0bT23ZyrWG4OkW
 dPgKwvpj+eAYjG7BG31OdiR1NZa/DDTmYSXY7p3TsWzzmLfboiw+J4bysOGptoqLaIvH
 Ha0Q==
X-Gm-Message-State: AC+VfDyHJckozMXbjwAw650QhAeSgAaam/QCYzC0C7CE7Ylvm9mTls66
 JvpYunJoxFid9esj1xnQSuE=
X-Google-Smtp-Source: ACHHUZ4wVc5iPVCtxm5Cr6CfPsCUAV2JxQmkDbIFVJyxLuluN7/4L9PtEZwmPvo0Q4/mI85A2+kIFg==
X-Received: by 2002:a5d:694b:0:b0:309:4ee8:35ce with SMTP id
 r11-20020a5d694b000000b003094ee835cemr11215209wrw.21.1685368595936; 
 Mon, 29 May 2023 06:56:35 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4f10000000b002fda1b12a0bsm80555wru.2.2023.05.29.06.56.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 06:56:34 -0700 (PDT)
Message-ID: <a24acb75-4503-d987-0ebb-cdbba564768f@gmail.com>
Date: Mon, 29 May 2023 15:56:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 18/27] arm64: dts: mediatek: mt6795: Add support for IOMMU
 and LARBs
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-19-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-19-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add nodes for the multimedia IOMMU and its LARBs: this includes all but
> the MJC LARB, which cannot currently be used and will be added later.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 60 ++++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index a8b2c4517e79..9cfa02085f61 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -8,6 +8,7 @@
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/clock/mediatek,mt6795-clk.h>
>   #include <dt-bindings/gce/mediatek,mt6795-gce.h>
> +#include <dt-bindings/memory/mt6795-larb-port.h>
>   #include <dt-bindings/pinctrl/mt6795-pinfunc.h>
>   #include <dt-bindings/power/mt6795-power.h>
>   #include <dt-bindings/reset/mediatek,mt6795-resets.h>
> @@ -390,6 +391,17 @@ systimer: timer@10200670 {
>   			clock-names = "clk13m";
>   		};
>   
> +		iommu: iommu@10205000 {
> +			compatible = "mediatek,mt6795-m4u";
> +			reg = <0 0x10205000 0 0x1000>;
> +			clocks = <&infracfg CLK_INFRA_M4U>;
> +			clock-names = "bclk";
> +			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_LOW>;
> +			mediatek,larbs = <&larb0 &larb1 &larb2 &larb3>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			#iommu-cells = <1>;
> +		};
> +
>   		apmixedsys: syscon@10209000 {
>   			compatible = "mediatek,mt6795-apmixedsys", "syscon";
>   			reg = <0 0x10209000 0 0x1000>;
> @@ -648,16 +660,64 @@ mmsys: syscon@14000000 {
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
>   		};
>   
> +		larb0: larb@14021000 {
> +			compatible = "mediatek,mt6795-smi-larb";
> +			reg = <0 0x14021000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_SMI_COMMON>, <&mmsys CLK_MM_SMI_LARB0>;
> +			clock-names = "apb", "smi";
> +			mediatek,smi = <&smi_common>;
> +			mediatek,larb-id = <0>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +		};
> +
> +		smi_common: smi@14022000 {
> +			compatible = "mediatek,mt6795-smi-common";
> +			reg = <0 0x14022000 0 0x1000>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			clocks = <&infracfg CLK_INFRA_SMI>, <&mmsys CLK_MM_SMI_COMMON>;
> +			clock-names = "apb", "smi";
> +		};
> +
> +		larb2: larb@15001000 {
> +			compatible = "mediatek,mt6795-smi-larb";
> +			reg = <0 0x15001000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_SMI_COMMON>, <&infracfg CLK_INFRA_SMI>;
> +			clock-names = "apb", "smi";
> +			mediatek,smi = <&smi_common>;
> +			mediatek,larb-id = <2>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_ISP>;
> +		};
> +
>   		vdecsys: clock-controller@16000000 {
>   			compatible = "mediatek,mt6795-vdecsys";
>   			reg = <0 0x16000000 0 0x1000>;
>   			#clock-cells = <1>;
>   		};
>   
> +		larb1: larb@16010000 {
> +			compatible = "mediatek,mt6795-smi-larb";
> +			reg = <0 0x16010000 0 0x1000>;
> +			mediatek,smi = <&smi_common>;
> +			mediatek,larb-id = <1>;
> +			clocks = <&vdecsys CLK_VDEC_CKEN>, <&vdecsys CLK_VDEC_LARB_CKEN>;
> +			clock-names = "apb", "smi";
> +			power-domains = <&spm MT6795_POWER_DOMAIN_VDEC>;
> +		};
> +
>   		vencsys: clock-controller@18000000 {
>   			compatible = "mediatek,mt6795-vencsys";
>   			reg = <0 0x18000000 0 0x1000>;
>   			#clock-cells = <1>;
>   		};
> +
> +		larb3: larb@18001000 {
> +			compatible = "mediatek,mt6795-smi-larb";
> +			reg = <0 0x18001000 0 0x1000>;
> +			clocks = <&vencsys CLK_VENC_VENC>, <&vencsys CLK_VENC_LARB>;
> +			clock-names = "apb", "smi";
> +			mediatek,smi = <&smi_common>;
> +			mediatek,larb-id = <3>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_VENC>;
> +		};
>   	};
>   };
