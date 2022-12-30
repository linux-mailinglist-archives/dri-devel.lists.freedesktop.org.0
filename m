Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365956599E3
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 16:36:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB25110E445;
	Fri, 30 Dec 2022 15:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FE210E441
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 15:36:16 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso15425306wmb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 07:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iL37qARH6P3MRzSOtk5quICTwOJji4rF0ACykgztECQ=;
 b=FOyP5pMDNuXZ6ELt3Q9R7WvQPtfeQcYvV2nKTw2TPRHBq+kFPQzHVTKU29SxlZniNP
 WybjW/1AttZDKLJ6lpGNNBRdN/8CGO/WTPAWHvUvQl25TelMgVZ1oLqihX7ATUOxDqM1
 i6PyXNybeYBZzbCcRBBpXYkZm9enfUhoYDmC4bEWYZ1mw77d1CFJDFweHirRXLzrSCfs
 RTeCLCfpU2kUt00hvg+7lXxf3HvLC8BmP80D4G+jx5uwd7jYPYU+SiPPhhI9IELvdZjG
 DHwBGBBRDyfwKNqDibr4VDQEC251T4qKqwPAi3ufJhaQCZSNw085zlTznmvqOn2/hN4Y
 2iBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iL37qARH6P3MRzSOtk5quICTwOJji4rF0ACykgztECQ=;
 b=SbS5/17tWewCEp//V33Er2yGfqcVCWrWPfCpXnCKZ7bBOPwzzkC2tXw/4AdqUSCOSC
 pnj5EbxIGcfQnCMhdr527g46bF7zD5jTmJebA8CwQQ75IrSXFN392NIcLJs64LbJkHO0
 GtgvLi8gi+Zzoo4r+jei40egLsbM3MIT8DYxDQOHBVeP/D6uMIPiXfjzcH3adq5EQjBl
 f1aCvZBrjZi1AdRi0du8xZVfJwiYrRGkZI3HbCwtChN2xm1itjseYcoQulcqQnXMr1Bz
 RVHeYg980l2PX5rQxu2s83AI3Hni+y6OznNhhHxoQZkmBlWAj4pNF2dkCHKJ63fA6y1r
 ay2w==
X-Gm-Message-State: AFqh2krlMAb0BX1hGV6xUkCPuDu6rm2PLNCv7dhvCrk/k3/wxZYKffph
 GNfFbVhT2HQUugaHXuvo190cTA==
X-Google-Smtp-Source: AMrXdXvFZ1LAfH4+8KcjsP9ZLf8dXq2/NDo2oQAUwgfrrWEQE+9EQlZtPmNHkv4/WhQjyWm9jhFvIw==
X-Received: by 2002:a05:600c:4d20:b0:3d3:5737:3afb with SMTP id
 u32-20020a05600c4d2000b003d357373afbmr23313629wmp.41.1672414575302; 
 Fri, 30 Dec 2022 07:36:15 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 l42-20020a05600c1d2a00b003cfbbd54178sm49857993wms.2.2022.12.30.07.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 07:36:14 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_jesszhan@quicinc.com, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 vkoul@kernel.org, a39.skl@gmail.com, quic_khsieh@quicinc.com,
 quic_vpolimer@quicinc.com, swboyd@chromium.org, dianders@chromium.org,
 liushixin2@huawei.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org
Subject: [PATCH v4 08/11] arm64: dts: qcom: sm8350: Use 2 interconnect cells
Date: Fri, 30 Dec 2022 16:35:51 +0100
Message-Id: <20221230153554.105856-9-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230153554.105856-1-robert.foss@linaro.org>
References: <20221230153554.105856-1-robert.foss@linaro.org>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use two interconnect cells in order to optionally
support a path tag.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 770ea105a565..bdefbbb2e38f 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1543,56 +1543,56 @@ apps_smmu: iommu@15000000 {
 		config_noc: interconnect@1500000 {
 			compatible = "qcom,sm8350-config-noc";
 			reg = <0 0x01500000 0 0xa580>;
-			#interconnect-cells = <1>;
+			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		mc_virt: interconnect@1580000 {
 			compatible = "qcom,sm8350-mc-virt";
 			reg = <0 0x01580000 0 0x1000>;
-			#interconnect-cells = <1>;
+			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		system_noc: interconnect@1680000 {
 			compatible = "qcom,sm8350-system-noc";
 			reg = <0 0x01680000 0 0x1c200>;
-			#interconnect-cells = <1>;
+			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		aggre1_noc: interconnect@16e0000 {
 			compatible = "qcom,sm8350-aggre1-noc";
 			reg = <0 0x016e0000 0 0x1f180>;
-			#interconnect-cells = <1>;
+			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		aggre2_noc: interconnect@1700000 {
 			compatible = "qcom,sm8350-aggre2-noc";
 			reg = <0 0x01700000 0 0x33000>;
-			#interconnect-cells = <1>;
+			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		mmss_noc: interconnect@1740000 {
 			compatible = "qcom,sm8350-mmss-noc";
 			reg = <0 0x01740000 0 0x1f080>;
-			#interconnect-cells = <1>;
+			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		lpass_ag_noc: interconnect@3c40000 {
 			compatible = "qcom,sm8350-lpass-ag-noc";
 			reg = <0 0x03c40000 0 0xf080>;
-			#interconnect-cells = <1>;
+			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		compute_noc: interconnect@a0c0000{
 			compatible = "qcom,sm8350-compute-noc";
 			reg = <0 0x0a0c0000 0 0xa180>;
-			#interconnect-cells = <1>;
+			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
@@ -1620,8 +1620,8 @@ ipa: ipa@1e40000 {
 			clocks = <&rpmhcc RPMH_IPA_CLK>;
 			clock-names = "core";
 
-			interconnects = <&aggre2_noc MASTER_IPA &mc_virt SLAVE_EBI1>,
-					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_IPA_CFG>;
+			interconnects = <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_IPA_CFG 0>;
 			interconnect-names = "memory",
 					     "config";
 
@@ -1661,7 +1661,7 @@ mpss: remoteproc@4080000 {
 					<&rpmhpd SM8350_MSS>;
 			power-domain-names = "cx", "mss";
 
-			interconnects = <&mc_virt MASTER_LLCC &mc_virt SLAVE_EBI1>;
+			interconnects = <&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>;
 
 			memory-region = <&pil_modem_mem>;
 
@@ -2238,7 +2238,7 @@ cdsp: remoteproc@98900000 {
 					<&rpmhpd SM8350_MXC>;
 			power-domain-names = "cx", "mxc";
 
-			interconnects = <&compute_noc MASTER_CDSP_PROC &mc_virt SLAVE_EBI1>;
+			interconnects = <&compute_noc MASTER_CDSP_PROC 0 &mc_virt SLAVE_EBI1 0>;
 
 			memory-region = <&pil_cdsp_mem>;
 
@@ -2420,14 +2420,14 @@ usb_2_ssphy: phy@88ebe00 {
 		dc_noc: interconnect@90c0000 {
 			compatible = "qcom,sm8350-dc-noc";
 			reg = <0 0x090c0000 0 0x4200>;
-			#interconnect-cells = <1>;
+			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		gem_noc: interconnect@9100000 {
 			compatible = "qcom,sm8350-gem-noc";
 			reg = <0 0x09100000 0 0xb4000>;
-			#interconnect-cells = <1>;
+			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
-- 
2.34.1

