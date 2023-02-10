Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CC1691D8C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 12:04:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD93110ECE1;
	Fri, 10 Feb 2023 11:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF0A10ECD7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 11:04:03 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id p26so14768211ejx.13
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 03:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r2U3F1uwjHuiqAIBv6x42HMg+Ngi+9HEBlLmfRU10dY=;
 b=sNU+vqWq+Ivn/7scG/wrYUESzYM2w8UZrlpU+1KA/KCciCbp8dN7Ys22Xb4UWF8fmw
 /sBrqExdaeAb9IXWtMXZy+Kh1CxGIpb0m6XzAP7fxHTUo4/fdWHa3x+YJlf9maz7WvHQ
 ifX9D9391L80rzk3rsgBh1ErSHfjliHkSYUqQRnwjXti+LxsvAtztBV1UwwsmzoaNSlk
 lY4oLPThik7vcvaBufqk6A9mITfa0LyqCmMatkL10nB/zZAZcw1chwREOGTgzSWAZPZe
 DsSQWNwtuX59xLvwsywjf4Km5b6xjb4OVc1kQafRf7DZRy0fIDanTz5Dj2G9HUNJb+KV
 6Plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r2U3F1uwjHuiqAIBv6x42HMg+Ngi+9HEBlLmfRU10dY=;
 b=C++6ZNeQXSPjZ8UoAMvFF1BvDHLpARLbZzJBrS/n7CTqqx6kNn4fSbZ4PIYA//CO51
 BpybStyL7QBVSYuJwVLYru4cGVRtwyH7MnjNNtPJuzCsuxm0jrFWWsVB9SpxpFKB3McY
 LItvWhmzwz2au64uiNKWczgSn6aVoZm0OWd+9IxfVOPaobDjWPeMDqMV+rINpbvIkPrD
 3L+eojNtW4MeTdq6q6kiT3OYo8nULKU62lsoXsKLiY+Kq7syN0aADCvHgObWlLylMS05
 4lnIlM/72fVZPImazmn28IZeuT4wOltnlT4dPLwFHeqqCuQPZdhzgyxSycLTrDI38HEd
 W3Og==
X-Gm-Message-State: AO0yUKXtWOx8YRXWZPPShKl5Wqh3No72O23SR0VfnY9cd/HzGOkjtDfl
 nqQAzsZ5msFat0JPIBpDoXY0kg==
X-Google-Smtp-Source: AK7set+cf/2j9bzg5hcSYnMQxA4s688mptKE/8TYDB4LNSSKTNiil0acJUZs6xlyHtaKqW3VDA3iGg==
X-Received: by 2002:a17:906:2851:b0:8a6:93a4:c892 with SMTP id
 s17-20020a170906285100b008a693a4c892mr15372625ejc.44.1676027041858; 
 Fri, 10 Feb 2023 03:04:01 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a170906379800b008af2c131d4csm2222698ejc.5.2023.02.10.03.03.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 03:04:01 -0800 (PST)
Message-ID: <addce6b1-1d3c-9094-b6e6-c060b0d0435a@linaro.org>
Date: Fri, 10 Feb 2023 12:03:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: sm8350: move more nodes to
 correct place
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
 <20230209133839.762631-4-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230209133839.762631-4-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9.02.2023 14:38, Dmitry Baryshkov wrote:
> Continue ordering DT nodes by their address. Move RNG, UFS, system NoC
> and SLPI nodes to the proper position.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 314 +++++++++++++--------------
>  1 file changed, 157 insertions(+), 157 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index b85bd8fd28c0..8bf38d350521 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -1421,6 +1421,13 @@ spi13: spi@a94000 {
>  			};
>  		};
>  
> +		rng: rng@10d3000 {
> +			compatible = "qcom,prng-ee";
> +			reg = <0 0x010d3000 0 0x1000>;
> +			clocks = <&rpmhcc RPMH_HWKM_CLK>;
> +			clock-names = "core";
> +		};
> +
>  		config_noc: interconnect@1500000 {
>  			compatible = "qcom,sm8350-config-noc";
>  			reg = <0 0x01500000 0 0xa580>;
> @@ -1641,18 +1648,76 @@ pcie1_phy: phy@1c0f000 {
>  			status = "disabled";
>  		};
>  
> -		lpass_ag_noc: interconnect@3c40000 {
> -			compatible = "qcom,sm8350-lpass-ag-noc";
> -			reg = <0 0x03c40000 0 0xf080>;
> -			#interconnect-cells = <2>;
> -			qcom,bcm-voters = <&apps_bcm_voter>;
> +		ufs_mem_hc: ufshc@1d84000 {
> +			compatible = "qcom,sm8350-ufshc", "qcom,ufshc",
> +				     "jedec,ufs-2.0";
> +			reg = <0 0x01d84000 0 0x3000>;
> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> +			phys = <&ufs_mem_phy_lanes>;
> +			phy-names = "ufsphy";
> +			lanes-per-direction = <2>;
> +			#reset-cells = <1>;
> +			resets = <&gcc GCC_UFS_PHY_BCR>;
> +			reset-names = "rst";
> +
> +			power-domains = <&gcc UFS_PHY_GDSC>;
> +
> +			iommus = <&apps_smmu 0xe0 0x0>;
> +
> +			clock-names =
> +				"core_clk",
> +				"bus_aggr_clk",
> +				"iface_clk",
> +				"core_clk_unipro",
> +				"ref_clk",
> +				"tx_lane0_sync_clk",
> +				"rx_lane0_sync_clk",
> +				"rx_lane1_sync_clk";
> +			clocks =
> +				<&gcc GCC_UFS_PHY_AXI_CLK>,
> +				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> +				<&gcc GCC_UFS_PHY_AHB_CLK>,
> +				<&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> +				<&rpmhcc RPMH_CXO_CLK>,
> +				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> +				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
> +				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
> +			freq-table-hz =
> +				<75000000 300000000>,
> +				<0 0>,
> +				<0 0>,
> +				<75000000 300000000>,
> +				<0 0>,
> +				<0 0>,
> +				<0 0>,
> +				<0 0>;
> +			status = "disabled";
>  		};
>  
> -		compute_noc: interconnect@a0c0000 {
> -			compatible = "qcom,sm8350-compute-noc";
> -			reg = <0 0x0a0c0000 0 0xa180>;
> -			#interconnect-cells = <2>;
> -			qcom,bcm-voters = <&apps_bcm_voter>;
> +		ufs_mem_phy: phy@1d87000 {
> +			compatible = "qcom,sm8350-qmp-ufs-phy";
> +			reg = <0 0x01d87000 0 0x1c4>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			clock-names = "ref",
> +				      "ref_aux";
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
> +
> +			resets = <&ufs_mem_hc 0>;
> +			reset-names = "ufsphy";
> +			status = "disabled";
> +
> +			ufs_mem_phy_lanes: phy@1d87400 {
> +				reg = <0 0x01d87400 0 0x188>,
> +				      <0 0x01d87600 0 0x200>,
> +				      <0 0x01d87c00 0 0x200>,
> +				      <0 0x01d87800 0 0x188>,
> +				      <0 0x01d87a00 0 0x200>;
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +			};
>  		};
>  
>  		ipa: ipa@1e40000 {
> @@ -1700,6 +1765,13 @@ tcsr_mutex: hwlock@1f40000 {
>  			#hwlock-cells = <1>;
>  		};
>  
> +		lpass_ag_noc: interconnect@3c40000 {
> +			compatible = "qcom,sm8350-lpass-ag-noc";
> +			reg = <0 0x03c40000 0 0xf080>;
> +			#interconnect-cells = <2>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
>  		mpss: remoteproc@4080000 {
>  			compatible = "qcom,sm8350-mpss-pas";
>  			reg = <0x0 0x04080000 0x0 0x4040>;
> @@ -1742,6 +1814,74 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>  			};
>  		};
>  
> +		slpi: remoteproc@5c00000 {
> +			compatible = "qcom,sm8350-slpi-pas";
> +			reg = <0 0x05c00000 0 0x4000>;
> +
> +			interrupts-extended = <&pdc 9 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&smp2p_slpi_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_slpi_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_slpi_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_slpi_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready",
> +					  "handover", "stop-ack";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "xo";
> +
> +			power-domains = <&rpmhpd SM8350_LCX>,
> +					<&rpmhpd SM8350_LMX>;
> +			power-domain-names = "lcx", "lmx";
> +
> +			memory-region = <&pil_slpi_mem>;
> +
> +			qcom,qmp = <&aoss_qmp>;
> +
> +			qcom,smem-states = <&smp2p_slpi_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
> +							     IPCC_MPROC_SIGNAL_GLINK_QMP
> +							     IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc IPCC_CLIENT_SLPI
> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +				label = "slpi";
> +				qcom,remote-pid = <3>;
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "sdsp";
> +					qcom,non-secure-domain;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@1 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <1>;
> +						iommus = <&apps_smmu 0x0541 0x0>;
> +					};
> +
> +					compute-cb@2 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <2>;
> +						iommus = <&apps_smmu 0x0542 0x0>;
> +					};
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu 0x0543 0x0>;
> +						/* note: shared-cb = <4> in downstream */
> +					};
> +				};
> +			};
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sm8350-pdc", "qcom,pdc";
>  			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
> @@ -2012,153 +2152,6 @@ qup_i2c19_default: qup-i2c19-default-state {
>  			};
>  		};
>  
> -		rng: rng@10d3000 {
> -			compatible = "qcom,prng-ee";
> -			reg = <0 0x010d3000 0 0x1000>;
> -			clocks = <&rpmhcc RPMH_HWKM_CLK>;
> -			clock-names = "core";
> -		};
> -
> -		ufs_mem_hc: ufshc@1d84000 {
> -			compatible = "qcom,sm8350-ufshc", "qcom,ufshc",
> -				     "jedec,ufs-2.0";
> -			reg = <0 0x01d84000 0 0x3000>;
> -			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> -			phys = <&ufs_mem_phy_lanes>;
> -			phy-names = "ufsphy";
> -			lanes-per-direction = <2>;
> -			#reset-cells = <1>;
> -			resets = <&gcc GCC_UFS_PHY_BCR>;
> -			reset-names = "rst";
> -
> -			power-domains = <&gcc UFS_PHY_GDSC>;
> -
> -			iommus = <&apps_smmu 0xe0 0x0>;
> -
> -			clock-names =
> -				"core_clk",
> -				"bus_aggr_clk",
> -				"iface_clk",
> -				"core_clk_unipro",
> -				"ref_clk",
> -				"tx_lane0_sync_clk",
> -				"rx_lane0_sync_clk",
> -				"rx_lane1_sync_clk";
> -			clocks =
> -				<&gcc GCC_UFS_PHY_AXI_CLK>,
> -				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> -				<&gcc GCC_UFS_PHY_AHB_CLK>,
> -				<&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> -				<&rpmhcc RPMH_CXO_CLK>,
> -				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> -				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
> -				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
> -			freq-table-hz =
> -				<75000000 300000000>,
> -				<0 0>,
> -				<0 0>,
> -				<75000000 300000000>,
> -				<0 0>,
> -				<0 0>,
> -				<0 0>,
> -				<0 0>;
> -			status = "disabled";
> -		};
> -
> -		ufs_mem_phy: phy@1d87000 {
> -			compatible = "qcom,sm8350-qmp-ufs-phy";
> -			reg = <0 0x01d87000 0 0x1c4>;
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> -			clock-names = "ref",
> -				      "ref_aux";
> -			clocks = <&rpmhcc RPMH_CXO_CLK>,
> -				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
> -
> -			resets = <&ufs_mem_hc 0>;
> -			reset-names = "ufsphy";
> -			status = "disabled";
> -
> -			ufs_mem_phy_lanes: phy@1d87400 {
> -				reg = <0 0x01d87400 0 0x188>,
> -				      <0 0x01d87600 0 0x200>,
> -				      <0 0x01d87c00 0 0x200>,
> -				      <0 0x01d87800 0 0x188>,
> -				      <0 0x01d87a00 0 0x200>;
> -				#clock-cells = <1>;
> -				#phy-cells = <0>;
> -			};
> -		};
> -
> -		slpi: remoteproc@5c00000 {
> -			compatible = "qcom,sm8350-slpi-pas";
> -			reg = <0 0x05c00000 0 0x4000>;
> -
> -			interrupts-extended = <&pdc 9 IRQ_TYPE_LEVEL_HIGH>,
> -					      <&smp2p_slpi_in 0 IRQ_TYPE_EDGE_RISING>,
> -					      <&smp2p_slpi_in 1 IRQ_TYPE_EDGE_RISING>,
> -					      <&smp2p_slpi_in 2 IRQ_TYPE_EDGE_RISING>,
> -					      <&smp2p_slpi_in 3 IRQ_TYPE_EDGE_RISING>;
> -			interrupt-names = "wdog", "fatal", "ready",
> -					  "handover", "stop-ack";
> -
> -			clocks = <&rpmhcc RPMH_CXO_CLK>;
> -			clock-names = "xo";
> -
> -			power-domains = <&rpmhpd SM8350_LCX>,
> -					<&rpmhpd SM8350_LMX>;
> -			power-domain-names = "lcx", "lmx";
> -
> -			memory-region = <&pil_slpi_mem>;
> -
> -			qcom,qmp = <&aoss_qmp>;
> -
> -			qcom,smem-states = <&smp2p_slpi_out 0>;
> -			qcom,smem-state-names = "stop";
> -
> -			status = "disabled";
> -
> -			glink-edge {
> -				interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
> -							     IPCC_MPROC_SIGNAL_GLINK_QMP
> -							     IRQ_TYPE_EDGE_RISING>;
> -				mboxes = <&ipcc IPCC_CLIENT_SLPI
> -						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> -
> -				label = "slpi";
> -				qcom,remote-pid = <3>;
> -
> -				fastrpc {
> -					compatible = "qcom,fastrpc";
> -					qcom,glink-channels = "fastrpcglink-apps-dsp";
> -					label = "sdsp";
> -					qcom,non-secure-domain;
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> -
> -					compute-cb@1 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <1>;
> -						iommus = <&apps_smmu 0x0541 0x0>;
> -					};
> -
> -					compute-cb@2 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <2>;
> -						iommus = <&apps_smmu 0x0542 0x0>;
> -					};
> -
> -					compute-cb@3 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <3>;
> -						iommus = <&apps_smmu 0x0543 0x0>;
> -						/* note: shared-cb = <4> in downstream */
> -					};
> -				};
> -			};
> -		};
> -
>  		sdhc_2: mmc@8804000 {
>  			compatible = "qcom,sm8350-sdhci", "qcom,sdhci-msm-v5";
>  			reg = <0 0x08804000 0 0x1000>;
> @@ -2307,6 +2300,13 @@ system-cache-controller@9200000 {
>  			reg-names = "llcc_base", "llcc_broadcast_base";
>  		};
>  
> +		compute_noc: interconnect@a0c0000 {
> +			compatible = "qcom,sm8350-compute-noc";
> +			reg = <0 0x0a0c0000 0 0xa180>;
> +			#interconnect-cells = <2>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
>  		usb_1: usb@a6f8800 {
>  			compatible = "qcom,sm8350-dwc3", "qcom,dwc3";
>  			reg = <0 0x0a6f8800 0 0x400>;
