Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80692529BA0
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 10:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F86D112ECE;
	Tue, 17 May 2022 08:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194F8112ECB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 08:01:42 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id g6so33117658ejw.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 01:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bUC5qooCkXEBvM8/KC7BA0VGv7TO8mNCzaiXDokrDsQ=;
 b=EiE/bxLhEziHG2s/bDv6Lxoin3dlIGvWYbTUlK+vE1vKxmN1tNhtKoWu2pYQ5KR3nZ
 AUX1yhsr5/lcbUt4t+RDDSWs2fD1fCVSz8+95Z6D2zEp/Y35e7YZYHSCt++gE9h0yhZ4
 7aPf/N60wlDY45FyVafs4cYpG/1HuUkkPc1XJnoSSXYXZmby6ShGNZWQLKs1OVThOasO
 yLmQKe3miMu0nKknPcsK/jfM/xUhMBrUDJd+bRj5lfnSlNjZW35NNyawyPB8jPpGLFl2
 kpKKqe27ag1IEVm27tT8pzAOLoGgcFG4mBGWAjvw8oqxvndr4S3sJokMmRYXaqMsFLfa
 PQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bUC5qooCkXEBvM8/KC7BA0VGv7TO8mNCzaiXDokrDsQ=;
 b=bb56LPIch/2+oRlt+xJotiGtCzjOdApbGXVZHbTJK6ObizmiuAdjFXe32qYmpTVzAd
 lAU7C0f4MkukFFdSQo0twIIuFDB+oWtvW5ymTlQZZMZu9XzsFOd1vbdIGpleuddrmel0
 AMOipIqMhCLhiBI3/OT2HhU+Ww6ajLne5n2H2OukcSR1Sd69aGZn0QeoQPxG0DM/EKP/
 7Zg4XyYQxOJu6sfihnllSk4muYp2QjwRqLPgpKe5EGdvnMuSuEg3887dPm1lR7CWqJvG
 pxLtXlPtZKMpr5tnQNNjdmYJVf1kRYw41JfKmw7jX3b2erVQIxgDVZYohGFOqn+5uFPu
 6Kgw==
X-Gm-Message-State: AOAM532tUdQInsH/E1DS9dxE3P6dL+xP4Xl/sTvPU93XbeImrdRUVscp
 N9sle34kQQY2/jdXRnuTdwvYGg==
X-Google-Smtp-Source: ABdhPJzyl8icDf8IgeEBFf6+3TEG9rkINLpv/OlZb6E4YCi4ETBNhQvDM95JnxmiJF6TXJMlTCEwgw==
X-Received: by 2002:a17:907:7b9b:b0:6fe:22cb:3adb with SMTP id
 ne27-20020a1709077b9b00b006fe22cb3adbmr11583841ejc.560.1652774501551; 
 Tue, 17 May 2022 01:01:41 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 gz15-20020a170907a04f00b006f5294986besm721119ejc.111.2022.05.17.01.01.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 01:01:41 -0700 (PDT)
Message-ID: <424b02f3-eb53-68d0-bfee-5488dbcefa71@linaro.org>
Date: Tue, 17 May 2022 10:01:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 03/13] arm64: tegra: Add Host1x and VIC on Tegra234
Content-Language: en-US
To: cyndis@kapsi.fi, thierry.reding@gmail.com, jonathanh@nvidia.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, digetx@gmail.com
References: <20220516100213.1536571-1-cyndis@kapsi.fi>
 <20220516100213.1536571-4-cyndis@kapsi.fi>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220516100213.1536571-4-cyndis@kapsi.fi>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/05/2022 12:02, cyndis@kapsi.fi wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Add device tree nodes for Host1x and VIC on Tegra234.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 46 ++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index cb3af539e477..cae68e59580c 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -454,6 +454,52 @@ misc@100000 {
>  			status = "okay";
>  		};
>  
> +		host1x@13e00000 {

Generic node names, if that possible. Since the bindings do not exist in
the next, I actually cannot figure out what's host1x...

> +			compatible = "nvidia,tegra234-host1x";
> +			reg = <0x13e00000 0x10000>,
> +			      <0x13e10000 0x10000>,
> +			      <0x13e40000 0x10000>;
> +			reg-names = "common", "hypervisor", "vm";
> +			interrupts = <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
> +			             <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "syncpt0", "syncpt1", "syncpt2", "syncpt3", "syncpt4",
> +			                  "syncpt5", "syncpt6", "syncpt7", "host1x";
> +			clocks = <&bpmp TEGRA234_CLK_HOST1X>;
> +			clock-names = "host1x";
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			ranges = <0x15000000 0x15000000 0x01000000>;
> +			interconnects = <&mc TEGRA234_MEMORY_CLIENT_HOST1XDMAR &emc>;
> +			interconnect-names = "dma-mem";
> +			iommus = <&smmu_niso1 TEGRA234_SID_HOST1X>;
> +
> +			vic@15340000 {

The same... vic is usually a vectored interrupt controller, so this
should be interrupt-controller. Unless it is something entirely else, so
then you need to come with a generic name.


Best regards,
Krzysztof
