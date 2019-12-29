Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092CB12C2D0
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2019 15:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF47889ED6;
	Sun, 29 Dec 2019 14:43:45 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2846A89E3E
 for <dri-devel@freedesktop.org>; Sun, 29 Dec 2019 06:33:29 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id r67so6580923pjb.0
 for <dri-devel@freedesktop.org>; Sat, 28 Dec 2019 22:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nqGIhwYTh0DiBSLBMDh1uZ5wGRcp0IHXwUhJAqa821o=;
 b=USXZNxmckjGT1gFkzviu7A1+ak1urciIU+1xtmdBGP0ny/2qFn4lPJ7F+3P+KjkWz9
 mypGG4CSY3rUakmiDqZvF0lYdz/8UogjLVzK0d5SGnOcNcwePrBRI7Z791bQXc0ZjUty
 y+Oa8LZmZW7sWHiej6XI9Yj7NxFkJJhH4/DmZH37fZzH+TH0MVbJaBcwf+UKlBbSDaeu
 HEEOzeXblFJOTV/smOAttBNrSAHmfbef47opWMEoQl8mvAC1F7cj+KNj0VLhQhXHon5T
 UWPnhJwG8lS2wST10uBq4bDGhFXdvlZKVQG7v2oFVVnNpTsNd3o09aBt5IR/hl83eBx+
 ZDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nqGIhwYTh0DiBSLBMDh1uZ5wGRcp0IHXwUhJAqa821o=;
 b=hF3z3SOfFfTg1E32lBlI5YEpvJENc0vrWQD4OLHCWKdwXNgPBgbmTZvpMbuqs5dcMs
 njzfhLMtHOq9AfmaTpJuyXcwICD+9ZGBoGFFd3QE/KC6142dJy4TTfkJ7io9rw5Kw+Zw
 dVDE/P6QaYQdHsNWau/t+uCYAuslSsH7DbsdUQPPVKMZP21rnAdV8+Jb62MbEqJIjihQ
 bzBNGzMdUg6VadivL51xIav/ZHcMYBHI2LQjtHqTDngXmUx9Wtpq42egle3M66Bf2pxl
 zBULpe5H+G/BEXKKlR2pduq6c3Pjye1TQ7nYZZ0I3Fiyf/IdIacRMe3/MKeYqJew9ef3
 XpPg==
X-Gm-Message-State: APjAAAWSlJMbZCmYkdQTNKlVwegvrX7ADNETdDHiItu4/8fkKZDS+heV
 SbH/0tlIL3eP+ztmp/GPJAqshw==
X-Google-Smtp-Source: APXvYqwxEV0O6vRqHXU4ePHQt8ChvcTTjo2G9Do4DVPv3Y1n/SAqrvUsgBmIZ4Je3/ZERvOyxrHdjA==
X-Received: by 2002:a17:902:b18e:: with SMTP id
 s14mr63595046plr.261.1577601208519; 
 Sat, 28 Dec 2019 22:33:28 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id i9sm45974852pfk.24.2019.12.28.22.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2019 22:33:27 -0800 (PST)
Date: Sat, 28 Dec 2019 22:33:25 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH] arm: dts: sc7180: Add A618 gpu dt blob
Message-ID: <20191229063325.GP3755841@builder>
References: <0101016ecc56c5c5-ab66c0ce-da45-4d8e-9cac-8f6be69001d3-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0101016ecc56c5c5-ab66c0ce-da45-4d8e-9cac-8f6be69001d3-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Sun, 29 Dec 2019 14:43:42 +0000
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 03 Dec 07:17 PST 2019, Sharat Masetty wrote:

Please update subject to "arm64: dts: qcom: sc7180: Add A618 GPU nodes"

> This patch adds the required dt nodes and properties
> to enabled A618 GPU.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 116 +++++++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index c3db2e5..31223d0 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -18,6 +18,8 @@
>  #include <dt-bindings/reset/qcom,sdm845-pdc.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/phy/phy-qcom-qusb2.h>
> +#include <dt-bindings/clock/qcom,gpucc-sc7180.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>

Please maintain sort order of includes.

> 
>  / {
>  	interrupt-parent = <&intc>;
> @@ -733,6 +735,120 @@
>  			#power-domain-cells = <1>;
>  		};
> 
> +		gpu: gpu@5000000 {

Please rebase this on linux-next and ensure to maintain the sort order.

> +			compatible = "qcom,adreno-618.0", "qcom,adreno";
> +			#stream-id-cells = <16>;
> +			reg = <0 0x5000000 0 0x40000>, <0 0x509e000 0 0x1000>,

Please pad addresses to 8 digits.

> +				<0 0x5061000 0 0x800>;
> +			reg-names = "kgsl_3d0_reg_memory", "cx_mem", "cx_dbgc";
> +
> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			iommus = <&adreno_smmu 0>;
> +
> +			operating-points-v2 = <&gpu_opp_table>;
> +
> +			interconnects = <&gem_noc 35 &mc_virt 512>;

Please use the defines for these ports.

> +
> +			qcom,gmu = <&gmu>;

You can reduce the number of empty lines above.

> +
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-800000000 {
> +					opp-hz = /bits/ 64 <800000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +				};
> +
> +				opp-650000000 {
> +					opp-hz = /bits/ 64 <650000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +				};
> +
> +				opp-565000000 {
> +					opp-hz = /bits/ 64 <565000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +				};
> +
> +				opp-430000000 {
> +					opp-hz = /bits/ 64 <430000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +				};
> +
> +                                opp-355000000 {

The indentation is off here.

> +					opp-hz = /bits/ 64 <355000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +				};
> +
> +                                opp-267000000 {

And here.

> +					opp-hz = /bits/ 64 <267000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +				};
> +
> +				opp-180000000 {
> +					opp-hz = /bits/ 64 <180000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +				};
> +			};
> +		};
> +
> +		adreno_smmu: iommu@5040000 {
> +			compatible = "qcom,sc7180-smmu-v2", "qcom,smmu-v2";
> +			reg = <0 0x5040000 0 0x10000>;
> +			#iommu-cells = <1>;
> +			#global-interrupts = <2>;
> +			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 364 IRQ_TYPE_EDGE_RISING>,
> +					<GIC_SPI 365 IRQ_TYPE_EDGE_RISING>,
> +					<GIC_SPI 366 IRQ_TYPE_EDGE_RISING>,
> +					<GIC_SPI 367 IRQ_TYPE_EDGE_RISING>,
> +					<GIC_SPI 368 IRQ_TYPE_EDGE_RISING>,
> +					<GIC_SPI 369 IRQ_TYPE_EDGE_RISING>,
> +					<GIC_SPI 370 IRQ_TYPE_EDGE_RISING>,
> +					<GIC_SPI 371 IRQ_TYPE_EDGE_RISING>;
> +			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				<&gcc GCC_GPU_CFG_AHB_CLK>,
> +				<&gcc GCC_DDRSS_GPU_AXI_CLK>;
> +
> +			clock-names = "bus", "iface", "mem_iface_clk";
> +			power-domains = <&gpucc CX_GDSC>;
> +		};
> +
> +		gmu: gmu@506a000 {
> +			compatible="qcom,adreno-gmu-618", "qcom,adreno-gmu";
> +
> +			reg = 	<0 0x506a000 0 0x31000>,

Extra spaces after =

> +				<0 0xb290000 0 0x10000>,
> +				<0 0xb490000 0 0x10000>;
> +			reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
> +
> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				   <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hfi", "gmu";
> +
> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +			       <&gpucc GPU_CC_CXO_CLK>,
> +			       <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +			       <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
> +			clock-names = "gmu", "cxo", "axi", "memnoc";
> +
> +			power-domains = <&gpucc CX_GDSC>;
> +
> +			iommus = <&adreno_smmu 5>;
> +
> +			operating-points-v2 = <&gmu_opp_table>;

As above, please drop a few of these empty lines.

Regards,
Bjorn

> +
> +			gmu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <200000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +				};
> +			};
> +		};
> +
>  		apps_smmu: iommu@15000000 {
>  			compatible = "qcom,sc7180-smmu-500", "arm,mmu-500";
>  			reg = <0 0x15000000 0 0x100000>;
> --
> 1.9.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
