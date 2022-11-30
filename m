Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B5F63E14C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 21:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D666110E4E2;
	Wed, 30 Nov 2022 20:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D01F10E4DA;
 Wed, 30 Nov 2022 20:10:16 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id r8so22173476ljn.8;
 Wed, 30 Nov 2022 12:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l55ZSpBSaEScUKVcaRYy5noOFCbwMf6AS4fim9mYDzU=;
 b=hX9Qc/69PdTYELzcvIONcTmgLCM1MCfDI8JC5rXsA12fgwJi8rJ/GgV8Anv3/iwMjO
 CGp8W8/Fg4RGFOwA1y3NTdq7sxLks1VQhAWeg737e2KRB6981vduvpwKAn8LcTkB37pr
 0U2W9/gdvRbJwdpjW9b+mcMLT0tT+l6A/tqVo4IDV56QRMVvqgiUO6tpqaTrhpkvRQzE
 BzfFQJ+3xj3fs1h2dwDDofVpmfCRp21MnTxKRFnGcqcawvbdXLHuOWDaWRlC1c4Gk1Mx
 6Vm51bA4Kdr7ORaVUtBAKaegltoZeApXfmTnrHDnOpn9CWLp4PV/2fUQOtniDo454NhW
 qxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l55ZSpBSaEScUKVcaRYy5noOFCbwMf6AS4fim9mYDzU=;
 b=UigdDgrmmMttMALa+7uy5nDtx4rA2Jp4p1vz5cCNQ/MqYQBUaID5JDCxImv/gdcnTp
 6iJkjgJLqa4Dwpg5dtzyvBoEJ69n5pouXlGIDBSqRtMiC8/iGYrrObe9tvMCUXDxENry
 ZbI+ipK8FEcVFMj//ZASLl5bcAEY66NIIExd2LSa8tuNTu9h4Uj7XIeF12RzSa5HJft8
 /o/VimK/59CHvS0BjVFngQQNcBUdjkZXMxN0jlmifV1fYr/8KSz3/APetzjsuxch745M
 zGFWzy/ezNwy3zXZXVBnME1xqDUEP3w2cquQJh632AmDkLaO64bKwVvcQZLPdjJy9Mvd
 4OYw==
X-Gm-Message-State: ANoB5pnbQebCtjRvauhRgBvqr0FjFBxZMwEEH2bfEfnq4R0/iyE83MRJ
 B3loiq7X0n2vEvjVd7Z8WoM=
X-Google-Smtp-Source: AA0mqf4N1MjwsUqz/qkPXY6Rb3zUqkrXqdkjaerUFav9rNOyY5/vWSnsxuY0T/WDHWeX58U2Kr+D0w==
X-Received: by 2002:a05:651c:1590:b0:279:dfe:897a with SMTP id
 h16-20020a05651c159000b002790dfe897amr21130009ljq.365.1669839014480; 
 Wed, 30 Nov 2022 12:10:14 -0800 (PST)
Received: from localhost.localdomain (ccy110.neoplus.adsl.tpnet.pl.
 [83.30.148.110]) by smtp.gmail.com with ESMTPSA id
 a25-20020a056512201900b004b4e9580b1asm369754lfb.66.2022.11.30.12.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 12:10:14 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH v2 08/12] arm64: dts: qcom: sm6115: Add mdss/dpu node
Date: Wed, 30 Nov 2022 21:09:46 +0100
Message-Id: <20221130200950.144618-9-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130200950.144618-1-a39.skl@gmail.com>
References: <20221130200950.144618-1-a39.skl@gmail.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Thara Gopinath <thara.gopinath@gmail.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add mdss and dpu node to enable display support on SM6115.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 183 +++++++++++++++++++++++++++
 1 file changed, 183 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 6e0699649257..c476b5ecb62b 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -726,6 +726,189 @@ usb_1_dwc3: usb@4e00000 {
 			};
 		};
 
+		mdss: display-subsystem@5e00000 {
+			compatible = "qcom,sm6115-mdss";
+			reg = <0x05e00000 0x1000>;
+			reg-names = "mdss";
+
+			power-domains = <&dispcc MDSS_GDSC>;
+
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			iommus = <&apps_smmu 0x420 0x2>,
+				 <&apps_smmu 0x421 0x0>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			status = "disabled";
+
+			mdp: display-controller@5e01000 {
+				compatible = "qcom,sm6115-dpu";
+				reg = <0x05e01000 0x8f000>,
+				      <0x05eb0000 0x2008>;
+				reg-names = "mdp", "vbif";
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc DISP_CC_MDSS_ROT_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "bus",
+					      "iface",
+					      "core",
+					      "lut",
+					      "rot",
+					      "vsync";
+
+				operating-points-v2 = <&mdp_opp_table>;
+				power-domains = <&rpmpd SM6115_VDDCX>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&dsi0_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-19200000 {
+						opp-hz = /bits/ 64 <19200000>;
+						required-opps = <&rpmpd_opp_min_svs>;
+					};
+
+					opp-192000000 {
+						opp-hz = /bits/ 64 <192000000>;
+						required-opps = <&rpmpd_opp_low_svs>;
+					};
+
+					opp-256000000 {
+						opp-hz = /bits/ 64 <256000000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+
+					opp-307200000 {
+						opp-hz = /bits/ 64 <307200000>;
+						required-opps = <&rpmpd_opp_svs_plus>;
+					};
+
+					opp-384000000 {
+						opp-hz = /bits/ 64 <384000000>;
+						required-opps = <&rpmpd_opp_nom>;
+					};
+				};
+			};
+
+			dsi0: dsi@5e94000 {
+				compatible = "qcom,dsi-ctrl-6g-qcm2290";
+				reg = <0x05e94000 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmpd SM6115_VDDCX>;
+				phys = <&dsi0_phy>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dsi0_out: endpoint {
+						};
+					};
+				};
+
+				dsi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-19200000 {
+						opp-hz = /bits/ 64 <19200000>;
+						required-opps = <&rpmpd_opp_min_svs>;
+					};
+
+					opp-164000000 {
+						opp-hz = /bits/ 64 <164000000>;
+						required-opps = <&rpmpd_opp_low_svs>;
+					};
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+				};
+			};
+
+			dsi0_phy: phy@5e94400 {
+				compatible = "qcom,dsi-phy-14nm-2290";
+				reg = <0x05e94400 0x100>,
+				      <0x05e94500 0x300>,
+				      <0x05e94800 0x188>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,sm6115-dispcc";
 			reg = <0x05f00000 0x20000>;
-- 
2.25.1

