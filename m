Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DA883578E
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 20:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A9410E2B6;
	Sun, 21 Jan 2024 19:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2FA10E2B5;
 Sun, 21 Jan 2024 19:46:26 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-40eae9b1fe3so898665e9.2; 
 Sun, 21 Jan 2024 11:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705866324; x=1706471124; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qry+IoFMR9xixm+CmJmEcM3m/KbtxBNh2E+r7IudFD4=;
 b=h072NGQP3P0cj9LWY1hmf0Bqnu3WN7WTn5x0GRlPFYcCYKLxRlDVy0x42xlkcsi1Dr
 vtIiq+hMoZZ5fazuNPmLLGiQ1z5E/XHPObhopAssGoRFcrBPMpyPyDb79xJUjTGxtaVF
 O+uBx/qryOp58Ph4YCZwrtFCwsuboMGJvCRpwcbdGPfZVA+XXUHShSWKwnc6lyzuZHp5
 WmxteNPhYdrS4xHvnXEcZ1Dcy8JqW1omvVIacoOfVy5O26UHCZWxjH4FyoIKSwJhGsM8
 lR0Z5GA4/8+qkQsV3g26Qrrbu+3KEIxAwrwFPdPmhu4cPA8N+6KdKNcD0szwqlnIkM64
 8yQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705866324; x=1706471124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qry+IoFMR9xixm+CmJmEcM3m/KbtxBNh2E+r7IudFD4=;
 b=Vn/2eANm7+fE6kOxJZMTBbSxn2u/7SBI0dI9uW/BVy5Q6WYGj009nUsA9DzAtA4Gu+
 5rchYKYy/p1m/K+vJq0Q8iLAVN1YqxrIQx65GTOnBTpV7AcgyA4My80x2B/9EGGX5OZd
 jWj+UGmyWIvgG5TvA1hymRS1GGvKywFa6scgig+t35sfUppnugqCmJoFlbRNUfdx7AGt
 KJANeqW/KzfGAjoDHfGX7MQQre9YlSZ5yTdXohgP1YhClBzXzIZJYplLUb+bcfEaLthA
 BHQUvXscn5ZQru0SSFTcRiamPzYS1Titxrcbm61sTGnD666wd36SukI+Xdkf5VOyKzMb
 m+XQ==
X-Gm-Message-State: AOJu0YzrlX/TsSAecTNiFgl+mzeSE3ktRts8mNjNuXZDrhs4XsMVDMLH
 xKr8Uc7zRu73oyzg39H1higFdGqm/cYRvliKiv1OVGM/HivOhPeFs3MxCC3oyE4=
X-Google-Smtp-Source: AGHT+IFZxVchAXAfLQIn8QiWKiuD4HWs4BPKHmCzu518ih7OsipVFzZjmc88iWQgOy+6/7RuKKdgYw==
X-Received: by 2002:a05:600c:3513:b0:40e:4672:5227 with SMTP id
 h19-20020a05600c351300b0040e46725227mr1931625wmq.96.1705866324560; 
 Sun, 21 Jan 2024 11:45:24 -0800 (PST)
Received: from localhost.localdomain (byv51.neoplus.adsl.tpnet.pl.
 [83.30.41.51]) by smtp.gmail.com with ESMTPSA id
 k6-20020a170906128600b00a2b0b0fc80esm12547134ejb.193.2024.01.21.11.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jan 2024 11:45:24 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 4/8] arm64: dts: qcom: msm8976: Add MDSS nodes
Date: Sun, 21 Jan 2024 20:41:02 +0100
Message-Id: <20240121194221.13513-5-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240121194221.13513-1-a39.skl@gmail.com>
References: <20240121194221.13513-1-a39.skl@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Andy Gross <agross@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add MDSS nodes to support displays on MSM8976 SoC.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 268 +++++++++++++++++++++++++-
 1 file changed, 264 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index 118174cfd4d3..2d71ce34f00e 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -785,10 +785,10 @@ gcc: clock-controller@1800000 {
 
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>;
+				 <&mdss_dsi0_phy 1>,
+				 <&mdss_dsi0_phy 0>,
+				 <&mdss_dsi1_phy 1>,
+				 <&mdss_dsi1_phy 0>;
 			clock-names = "xo",
 				      "xo_a",
 				      "dsi0pll",
@@ -808,6 +808,266 @@ tcsr: syscon@1937000 {
 			reg = <0x01937000 0x30000>;
 		};
 
+		mdss: display-subsystem@1a00000 {
+			compatible = "qcom,mdss";
+
+			reg = <0x01a00000 0x1000>,
+			      <0x01ab0000 0x3000>;
+			reg-names = "mdss_phys", "vbif_phys";
+
+			power-domains = <&gcc MDSS_GDSC>;
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			clocks = <&gcc GCC_MDSS_AHB_CLK>,
+				 <&gcc GCC_MDSS_AXI_CLK>,
+				 <&gcc GCC_MDSS_VSYNC_CLK>,
+				  <&gcc GCC_MDSS_MDP_CLK>;
+			clock-names = "iface",
+				      "bus",
+				      "vsync",
+				      "core";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			status = "disabled";
+
+			mdss_mdp: display-controller@1a01000 {
+				compatible = "qcom,msm8976-mdp5", "qcom,mdp5";
+				reg = <0x01a01000 0x89000>;
+				reg-names = "mdp_phys";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_VSYNC_CLK>,
+					 <&gcc GCC_MDP_TBU_CLK>,
+					 <&gcc GCC_MDP_RT_TBU_CLK>;
+				clock-names = "iface",
+					      "bus",
+					      "core",
+					      "vsync",
+					      "tbu",
+					      "tbu_rt";
+
+				operating-points-v2 = <&mdp_opp_table>;
+				power-domains = <&gcc MDSS_GDSC>;
+
+				iommus = <&apps_iommu 22>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_mdp5_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_mdp5_intf2_out: endpoint {
+							remote-endpoint = <&mdss_dsi1_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-177780000 {
+						opp-hz = /bits/ 64 <177780000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmpd_opp_svs_plus>;
+					};
+
+					opp-320000000 {
+						opp-hz = /bits/ 64 <320000000>;
+						required-opps = <&rpmpd_opp_nom>;
+					};
+					opp-360000000 {
+						opp-hz = /bits/ 64 <360000000>;
+						required-opps = <&rpmpd_opp_turbo>;
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@1a94000 {
+				compatible = "qcom,msm8976-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x01a94000 0x25c>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				clocks = <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_BYTE0_CLK>,
+					 <&gcc GCC_MDSS_PCLK0_CLK>,
+					 <&gcc GCC_MDSS_ESC0_CLK>;
+				clock-names = "mdp_core",
+					      "iface",
+					      "bus",
+					      "byte",
+					      "pixel",
+					      "core";
+
+				assigned-clocks = <&gcc GCC_MDSS_BYTE0_CLK_SRC>,
+						  <&gcc GCC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy 0>,
+							 <&mdss_dsi0_phy 1>;
+
+				phys = <&mdss_dsi0_phy>;
+
+				operating-points-v2 = <&dsi0_opp_table>;
+				power-domains = <&gcc MDSS_GDSC>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&mdss_mdp5_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+
+				dsi0_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-125000000 {
+						opp-hz = /bits/ 64 <125000000>;
+						required-opps = <&rpmpd_opp_svs>;
+
+					};
+
+					opp-161250000 {
+						opp-hz = /bits/ 64 <161250000>;
+						required-opps = <&rpmpd_opp_svs_plus>;
+					};
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss_dsi1: dsi@1a96000 {
+				compatible = "qcom,msm8976-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x01a96000 0x300>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <5>;
+
+				clocks = <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_BYTE1_CLK>,
+					 <&gcc GCC_MDSS_PCLK1_CLK>,
+					 <&gcc GCC_MDSS_ESC1_CLK>;
+				clock-names = "mdp_core",
+					      "iface",
+					      "bus",
+					      "byte",
+					      "pixel",
+					      "core";
+
+				assigned-clocks = <&gcc GCC_MDSS_BYTE1_CLK_SRC>,
+						  <&gcc GCC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi1_phy 0>,
+							 <&mdss_dsi1_phy 1>;
+
+				phys = <&mdss_dsi1_phy>;
+
+				power-domains = <&gcc MDSS_GDSC>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dsi1_in: endpoint {
+							remote-endpoint = <&mdss_mdp5_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@1a94a00 {
+				compatible = "qcom,dsi-phy-28nm-hpm-fam-b";
+				reg = <0x01a94a00 0xd4>,
+				      <0x01a94400 0x280>,
+				      <0x01a94b80 0x30>;
+				reg-names = "dsi_pll",
+					    "dsi_phy",
+					    "dsi_phy_regulator";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
+			mdss_dsi1_phy: phy@1a96a00 {
+				compatible = "qcom,dsi-phy-28nm-hpm-fam-b";
+				reg = <0x01a96a00 0xd4>,
+				      <0x01a96400 0x280>,
+				      <0x01a96b80 0x30>;
+				reg-names = "dsi_pll",
+					    "dsi_phy",
+					    "dsi_phy_regulator";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+		};
+
 		apps_iommu: iommu@1e20000 {
 			compatible = "qcom,msm8976-iommu", "qcom,msm-iommu-v2";
 			ranges  = <0 0x01e20000 0x20000>;
-- 
2.43.0

