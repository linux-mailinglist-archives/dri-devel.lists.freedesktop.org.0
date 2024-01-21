Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DE6835779
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 20:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFC210E0EB;
	Sun, 21 Jan 2024 19:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1700210E0D0;
 Sun, 21 Jan 2024 19:45:55 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a28bd9ca247so270761066b.1; 
 Sun, 21 Jan 2024 11:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705866288; x=1706471088; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mnqLSrn4btQ3vonmmCBGbb+1ntxX94Jc7ylr8L0oA0c=;
 b=ekg8ea0uf6QoXyZEDY6V1D6IQknyI1ERqZZE70iiwd0t9kiSlPy7tPiF08XTY804p2
 Xi31XCRW2JHXlweT+SdsW86WCsz48QdC5GFL57F+NJnlEiFfb5m/riw9QnSR1r9i+qrp
 kzRGpIemSFw9Xt9ELeHG5ldL9Ka9Z5jwgQy4yJwHu7+9BTh9udyOoonpBT40wpYlViwv
 trU9oPvwj6Banw0154mZRx3bLRu07P/hZOyIvsISE3tjlDHCot4Ar14vM0tLX1qprb1J
 2KWzK8/9LRkzET1kanTOB9V+1Obp+CJLXHzHH0A+8ZWpO7k2TCZkRQ5vixXzaBQwceer
 TCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705866288; x=1706471088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mnqLSrn4btQ3vonmmCBGbb+1ntxX94Jc7ylr8L0oA0c=;
 b=wb0IXLD97vhKoS3r9sYzDL2qA2jxdRXjUcLmY23HF1HP9RejZzPM/H75+tne+sXbko
 yMz6n6zXkQVUFqtFqih4xzYGrw3bX50jYg6RTwp1ZBsi+cD6mK/ttFEHlUutnyggOwlE
 GE9h6RxAxLF7nHe5Q+DAVGFzbxSd7krJyiFYdnXFxX2Z2AJT50Z3uqIzbQtgDhb9ITWA
 yoj5qnxJ48Q1oZKPDLP8VQUxwlbKMWmssDvfo28fjXGxAvYphPaFqn7Xn60d2MZx6qHW
 GEeIzdUnoqMEQck46ug+SVzzMicWK92Dpe32Q7KvGEHww/HwXGksEtSfC4rERPu5YHie
 0yFA==
X-Gm-Message-State: AOJu0Yx2UegrOHzcfKKCmCWxQQGXjpTs8HHkX25aR7a91TBiOrFcDUzX
 VGIAhr9CL8bf2CbsE7P92bahLuu/682QYp5MxEmUP6p5abNUGDFe
X-Google-Smtp-Source: AGHT+IGEaNWjmJTqymB8KYil/cNyp5oM2ixT9tK89BS7eXP8SDPL2NmrSrd26a0kTLP5NWNXwHllow==
X-Received: by 2002:a17:906:844c:b0:a2c:ad93:2e79 with SMTP id
 e12-20020a170906844c00b00a2cad932e79mr1696389ejy.15.1705866288476; 
 Sun, 21 Jan 2024 11:44:48 -0800 (PST)
Received: from localhost.localdomain (byv51.neoplus.adsl.tpnet.pl.
 [83.30.41.51]) by smtp.gmail.com with ESMTPSA id
 k6-20020a170906128600b00a2b0b0fc80esm12547134ejb.193.2024.01.21.11.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jan 2024 11:44:48 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 1/8] arm64: dts: qcom: msm8976: Add IOMMU nodes
Date: Sun, 21 Jan 2024 20:40:59 +0100
Message-Id: <20240121194221.13513-2-a39.skl@gmail.com>
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

Add the nodes describing the apps and gpu iommu and its context banks
that are found on msm8976 SoCs.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 80 +++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index d2bb1ada361a..118174cfd4d3 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -808,6 +808,86 @@ tcsr: syscon@1937000 {
 			reg = <0x01937000 0x30000>;
 		};
 
+		apps_iommu: iommu@1e20000 {
+			compatible = "qcom,msm8976-iommu", "qcom,msm-iommu-v2";
+			ranges  = <0 0x01e20000 0x20000>;
+
+			clocks = <&gcc GCC_SMMU_CFG_CLK>,
+				 <&gcc GCC_APSS_TCU_CLK>;
+			clock-names = "iface", "bus";
+
+			qcom,iommu-secure-id = <17>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+
+			/* VFE */
+			iommu-ctx@15000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x15000 0x1000>;
+				qcom,ctx-asid = <20>;
+				interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* VENUS NS */
+			iommu-ctx@16000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x16000 0x1000>;
+				qcom,ctx-asid = <21>;
+				interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* MDP0 */
+			iommu-ctx@17000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x17000 0x1000>;
+				qcom,ctx-asid = <22>;
+				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpu_iommu: iommu@1f08000 {
+			compatible = "qcom,msm8976-iommu", "qcom,msm-iommu-v2";
+			ranges = <0 0x01f08000 0x8000>;
+
+			clocks = <&gcc GCC_SMMU_CFG_CLK>,
+				 <&gcc GCC_GFX3D_TCU_CLK>;
+			clock-names = "iface", "bus";
+
+			power-domains = <&gcc OXILI_GX_GDSC>;
+
+			qcom,iommu-secure-id = <18>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+
+			/* gfx3d user */
+			iommu-ctx@0 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x0 0x1000>;
+				qcom,ctx-asid = <0>;
+				interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* gfx3d secure */
+			iommu-ctx@1000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x1000 0x1000>;
+				qcom,ctx-asid = <2>;
+				interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* gfx3d priv */
+			iommu-ctx@2000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x2000 0x1000>;
+				qcom,ctx-asid = <1>;
+				interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		spmi_bus: spmi@200f000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x0200f000 0x1000>,
-- 
2.43.0

