Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F61690A7E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 14:39:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A4610EADF;
	Thu,  9 Feb 2023 13:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B46010EAD9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 13:38:47 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id dr8so6330272ejc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 05:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YljtxkR1D7xMFfj1TzadM8vvYOKjVAiY1+9sodR8ElM=;
 b=AqRZqhmTFSwkoIoVnGK/oNGtw4aXDG087hmIFTn/dA+dHbwcHkUS0O7cBka/uN80l/
 zB3464E0FsS3cOHqQUV1S+or5iMgPS2C2iSqBUntJJgp1zcGeep8C19LkYm8hxYryz8X
 DqsSjO6BbYyo6KBvHNi1hjgUB+sj+SWY9bXVVMvrU1ppQemBXQHtVim7OgpqdAVUolCU
 ZuodTgmNjkKWH3PfsKF6Z85rnHvwoXxsFYs8Xv17nAc3gJNnLYV0VpRUYzGUmcYxei62
 yooyf5Z7EX1khS5AK9vqQv7fGE4BSYkssJpR1+amPTgkL4JYONMMfK3nkw0r149S4WbM
 36Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YljtxkR1D7xMFfj1TzadM8vvYOKjVAiY1+9sodR8ElM=;
 b=oDWVqoc8UK9l05/TNerWoLPK5l839/AnUgTPoFaQS6kzAIPDLBjDBF2xW4Y0JXRqvz
 qyzxJ9K+yxYqiTyCop8XeATwe4m7I0/ddlo1s+0TfWCYTonDuVWthjNs4sR5YTMe38+t
 J88YfpzWz7xFHbPfiSxAXVbJbrDWxksz2TJZ0lYkxM11hXDQ8LHEj5eiw/3D+4x5SP/1
 Qy11QMbQKazA264SXYQYaK+6Kg3Wk8KJ78OEV59yM9oyGVOZILe4Yz93hXiGxAtCKkuZ
 1n/CzvEGzJjP5aMeiAUt07GEQSjLZiMcf1Q9aDM8Flt7WglPJxTAsboj58WJHh3UgXFr
 3UDw==
X-Gm-Message-State: AO0yUKUU19Iwv1rwRHT7UO0aPZ5N4Y7WI4nEXK7mUT4JtqUBkeLJZwJf
 Iqb1ma9PiOg1Ia7CUfQcfCnidA==
X-Google-Smtp-Source: AK7set9KUyormCH5pUqgfnzqH3RGYeAJ2/bSXFD1lUhLLzSer9NhH/vwH3maei3d+NWDXJkr6k+vzw==
X-Received: by 2002:a17:906:70d3:b0:87b:1be:a8c2 with SMTP id
 g19-20020a17090670d300b0087b01bea8c2mr11717748ejk.73.1675949925388; 
 Thu, 09 Feb 2023 05:38:45 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 cd17-20020a170906b35100b0088f8ee84b76sm885553ejb.105.2023.02.09.05.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 05:38:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 3/6] arm64: dts: qcom: sm8350: move more nodes to correct
 place
Date: Thu,  9 Feb 2023 15:38:36 +0200
Message-Id: <20230209133839.762631-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Continue ordering DT nodes by their address. Move RNG, UFS, system NoC
and SLPI nodes to the proper position.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 314 +++++++++++++--------------
 1 file changed, 157 insertions(+), 157 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index b85bd8fd28c0..8bf38d350521 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1421,6 +1421,13 @@ spi13: spi@a94000 {
 			};
 		};
 
+		rng: rng@10d3000 {
+			compatible = "qcom,prng-ee";
+			reg = <0 0x010d3000 0 0x1000>;
+			clocks = <&rpmhcc RPMH_HWKM_CLK>;
+			clock-names = "core";
+		};
+
 		config_noc: interconnect@1500000 {
 			compatible = "qcom,sm8350-config-noc";
 			reg = <0 0x01500000 0 0xa580>;
@@ -1641,18 +1648,76 @@ pcie1_phy: phy@1c0f000 {
 			status = "disabled";
 		};
 
-		lpass_ag_noc: interconnect@3c40000 {
-			compatible = "qcom,sm8350-lpass-ag-noc";
-			reg = <0 0x03c40000 0 0xf080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
+		ufs_mem_hc: ufshc@1d84000 {
+			compatible = "qcom,sm8350-ufshc", "qcom,ufshc",
+				     "jedec,ufs-2.0";
+			reg = <0 0x01d84000 0 0x3000>;
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&ufs_mem_phy_lanes>;
+			phy-names = "ufsphy";
+			lanes-per-direction = <2>;
+			#reset-cells = <1>;
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
+
+			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			iommus = <&apps_smmu 0xe0 0x0>;
+
+			clock-names =
+				"core_clk",
+				"bus_aggr_clk",
+				"iface_clk",
+				"core_clk_unipro",
+				"ref_clk",
+				"tx_lane0_sync_clk",
+				"rx_lane0_sync_clk",
+				"rx_lane1_sync_clk";
+			clocks =
+				<&gcc GCC_UFS_PHY_AXI_CLK>,
+				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				<&gcc GCC_UFS_PHY_AHB_CLK>,
+				<&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+				<&rpmhcc RPMH_CXO_CLK>,
+				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+			freq-table-hz =
+				<75000000 300000000>,
+				<0 0>,
+				<0 0>,
+				<75000000 300000000>,
+				<0 0>,
+				<0 0>,
+				<0 0>,
+				<0 0>;
+			status = "disabled";
 		};
 
-		compute_noc: interconnect@a0c0000 {
-			compatible = "qcom,sm8350-compute-noc";
-			reg = <0 0x0a0c0000 0 0xa180>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
+		ufs_mem_phy: phy@1d87000 {
+			compatible = "qcom,sm8350-qmp-ufs-phy";
+			reg = <0 0x01d87000 0 0x1c4>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clock-names = "ref",
+				      "ref_aux";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
+			status = "disabled";
+
+			ufs_mem_phy_lanes: phy@1d87400 {
+				reg = <0 0x01d87400 0 0x188>,
+				      <0 0x01d87600 0 0x200>,
+				      <0 0x01d87c00 0 0x200>,
+				      <0 0x01d87800 0 0x188>,
+				      <0 0x01d87a00 0 0x200>;
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+			};
 		};
 
 		ipa: ipa@1e40000 {
@@ -1700,6 +1765,13 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		lpass_ag_noc: interconnect@3c40000 {
+			compatible = "qcom,sm8350-lpass-ag-noc";
+			reg = <0 0x03c40000 0 0xf080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		mpss: remoteproc@4080000 {
 			compatible = "qcom,sm8350-mpss-pas";
 			reg = <0x0 0x04080000 0x0 0x4040>;
@@ -1742,6 +1814,74 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			};
 		};
 
+		slpi: remoteproc@5c00000 {
+			compatible = "qcom,sm8350-slpi-pas";
+			reg = <0 0x05c00000 0 0x4000>;
+
+			interrupts-extended = <&pdc 9 IRQ_TYPE_LEVEL_HIGH>,
+					      <&smp2p_slpi_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_slpi_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_slpi_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_slpi_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SM8350_LCX>,
+					<&rpmhpd SM8350_LMX>;
+			power-domain-names = "lcx", "lmx";
+
+			memory-region = <&pil_slpi_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_slpi_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_SLPI
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "slpi";
+				qcom,remote-pid = <3>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "sdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0541 0x0>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0542 0x0>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0543 0x0>;
+						/* note: shared-cb = <4> in downstream */
+					};
+				};
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8350-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
@@ -2012,153 +2152,6 @@ qup_i2c19_default: qup-i2c19-default-state {
 			};
 		};
 
-		rng: rng@10d3000 {
-			compatible = "qcom,prng-ee";
-			reg = <0 0x010d3000 0 0x1000>;
-			clocks = <&rpmhcc RPMH_HWKM_CLK>;
-			clock-names = "core";
-		};
-
-		ufs_mem_hc: ufshc@1d84000 {
-			compatible = "qcom,sm8350-ufshc", "qcom,ufshc",
-				     "jedec,ufs-2.0";
-			reg = <0 0x01d84000 0 0x3000>;
-			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
-			phy-names = "ufsphy";
-			lanes-per-direction = <2>;
-			#reset-cells = <1>;
-			resets = <&gcc GCC_UFS_PHY_BCR>;
-			reset-names = "rst";
-
-			power-domains = <&gcc UFS_PHY_GDSC>;
-
-			iommus = <&apps_smmu 0xe0 0x0>;
-
-			clock-names =
-				"core_clk",
-				"bus_aggr_clk",
-				"iface_clk",
-				"core_clk_unipro",
-				"ref_clk",
-				"tx_lane0_sync_clk",
-				"rx_lane0_sync_clk",
-				"rx_lane1_sync_clk";
-			clocks =
-				<&gcc GCC_UFS_PHY_AXI_CLK>,
-				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
-				<&gcc GCC_UFS_PHY_AHB_CLK>,
-				<&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
-				<&rpmhcc RPMH_CXO_CLK>,
-				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
-				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
-				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
-			freq-table-hz =
-				<75000000 300000000>,
-				<0 0>,
-				<0 0>,
-				<75000000 300000000>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<0 0>;
-			status = "disabled";
-		};
-
-		ufs_mem_phy: phy@1d87000 {
-			compatible = "qcom,sm8350-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x1c4>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-			clock-names = "ref",
-				      "ref_aux";
-			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
-
-			resets = <&ufs_mem_hc 0>;
-			reset-names = "ufsphy";
-			status = "disabled";
-
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x188>,
-				      <0 0x01d87600 0 0x200>,
-				      <0 0x01d87c00 0 0x200>,
-				      <0 0x01d87800 0 0x188>,
-				      <0 0x01d87a00 0 0x200>;
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-			};
-		};
-
-		slpi: remoteproc@5c00000 {
-			compatible = "qcom,sm8350-slpi-pas";
-			reg = <0 0x05c00000 0 0x4000>;
-
-			interrupts-extended = <&pdc 9 IRQ_TYPE_LEVEL_HIGH>,
-					      <&smp2p_slpi_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_slpi_in 1 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_slpi_in 2 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_slpi_in 3 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "wdog", "fatal", "ready",
-					  "handover", "stop-ack";
-
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
-
-			power-domains = <&rpmhpd SM8350_LCX>,
-					<&rpmhpd SM8350_LMX>;
-			power-domain-names = "lcx", "lmx";
-
-			memory-region = <&pil_slpi_mem>;
-
-			qcom,qmp = <&aoss_qmp>;
-
-			qcom,smem-states = <&smp2p_slpi_out 0>;
-			qcom,smem-state-names = "stop";
-
-			status = "disabled";
-
-			glink-edge {
-				interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
-							     IPCC_MPROC_SIGNAL_GLINK_QMP
-							     IRQ_TYPE_EDGE_RISING>;
-				mboxes = <&ipcc IPCC_CLIENT_SLPI
-						IPCC_MPROC_SIGNAL_GLINK_QMP>;
-
-				label = "slpi";
-				qcom,remote-pid = <3>;
-
-				fastrpc {
-					compatible = "qcom,fastrpc";
-					qcom,glink-channels = "fastrpcglink-apps-dsp";
-					label = "sdsp";
-					qcom,non-secure-domain;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					compute-cb@1 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <1>;
-						iommus = <&apps_smmu 0x0541 0x0>;
-					};
-
-					compute-cb@2 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <2>;
-						iommus = <&apps_smmu 0x0542 0x0>;
-					};
-
-					compute-cb@3 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <3>;
-						iommus = <&apps_smmu 0x0543 0x0>;
-						/* note: shared-cb = <4> in downstream */
-					};
-				};
-			};
-		};
-
 		sdhc_2: mmc@8804000 {
 			compatible = "qcom,sm8350-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0 0x08804000 0 0x1000>;
@@ -2307,6 +2300,13 @@ system-cache-controller@9200000 {
 			reg-names = "llcc_base", "llcc_broadcast_base";
 		};
 
+		compute_noc: interconnect@a0c0000 {
+			compatible = "qcom,sm8350-compute-noc";
+			reg = <0 0x0a0c0000 0 0xa180>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		usb_1: usb@a6f8800 {
 			compatible = "qcom,sm8350-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;
-- 
2.39.1

