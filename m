Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE6D83578B
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 20:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCF010E060;
	Sun, 21 Jan 2024 19:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4624F10E060;
 Sun, 21 Jan 2024 19:46:49 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a26f73732c5so258561366b.3; 
 Sun, 21 Jan 2024 11:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705866347; x=1706471147; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RSqr1Vk76fk8EOA0eDt1nJ6pOVxZRQ6awuBBes4l838=;
 b=e1BhRuB+/n19Omhrr1rIEdYnmFYxtgN0hY/p7Niwcdxvz4AeLC4KSo78gHiFwZYtwL
 h91bRYE4J2BU7KlglvLgn+7DF0fKRuZFREbfS8EODEWuHbz8vY79C8dwno8cvgD1ZKxj
 iE60wiPLsIo0poYMS3vPW5NUHfvT0PcUMFpJdNbS/lLnweB1QLPxFtlcg26lfG4lAs0s
 VOpQQYcRU1w+qfI+5xKE85sK63N1euPyLW5NmVjUfkmNsqgD668UvIyDDdNg51ObtF1d
 aMGgmEhujz37+eTIT0MMQgWHRy7jtgllC6ALLWOt3BsYJrYHAZTAqvyNWDTzDj8Nle+I
 J8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705866348; x=1706471148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RSqr1Vk76fk8EOA0eDt1nJ6pOVxZRQ6awuBBes4l838=;
 b=FN/T1EkfOecKGOXIctD66SrZlIRW22sphChnpW56EBg6WnO+PaJXMASJklBR9BuxWn
 8ZZHHyNIw24mM8g4MV3joierfkCKDpoIeAc+UtJRAZYMwYqSA17L9UCLr7xrTSlgFLGS
 /ZJtHtjOe943R0YS/4PbcaHbuRoMl+wgPrdoK2o7JZ81Gzy9NS2xDb10tSHurcMGdmqs
 9c+xPS1IHLAqtw9hSzDogvlMitrVv+j7b/jsRwpbkrshDwhymuQ4+xL0JcbF+Elp4H3P
 Di399A107bfGrUXcs09b26ikf9DuBDaFzVQFS/YzxFMVwdCnjnJf7brBMadA4XMqUGcj
 Pkfg==
X-Gm-Message-State: AOJu0YxzyDdbSkLCGDHopUqsStZFZjnWfzE2EK383WB1GLvHY6bgOGjz
 HVhqqqJdj5BxidUAKt6IIpqzbc0hSGYCpwtWUgbPi0f4L/k2SvdCCq/LYl3TnA8=
X-Google-Smtp-Source: AGHT+IGsCmZv1novA+/rF0kwFG7flhcKuCUpSzseVeBQ6O+PKFUlzXtm9pZWAynzdjUeKyHkgZsWqw==
X-Received: by 2002:a17:906:f24c:b0:a28:fc03:f199 with SMTP id
 gy12-20020a170906f24c00b00a28fc03f199mr1456478ejb.107.1705866347749; 
 Sun, 21 Jan 2024 11:45:47 -0800 (PST)
Received: from localhost.localdomain (byv51.neoplus.adsl.tpnet.pl.
 [83.30.41.51]) by smtp.gmail.com with ESMTPSA id
 k6-20020a170906128600b00a2b0b0fc80esm12547134ejb.193.2024.01.21.11.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jan 2024 11:45:47 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 6/8] arm64: dts: qcom: msm8976: Add Adreno GPU
Date: Sun, 21 Jan 2024 20:41:04 +0100
Message-Id: <20240121194221.13513-7-a39.skl@gmail.com>
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

Add Adreno GPU node.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 66 +++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index 2d71ce34f00e..765c90ac14cb 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -1068,6 +1068,72 @@ mdss_dsi1_phy: phy@1a96a00 {
 			};
 		};
 
+		adreno_gpu: gpu@1c00000 {
+			compatible = "qcom,adreno-510.0", "qcom,adreno";
+
+			reg = <0x01c00000 0x40000>;
+			reg-names = "kgsl_3d0_reg_memory";
+
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "kgsl_3d0_irq";
+
+			clock-names = "core",
+				      "iface",
+				      "mem",
+				      "mem_iface",
+				      "rbbmtimer",
+				      "alwayson";
+
+			clocks = <&gcc GCC_GFX3D_OXILI_CLK>,
+			    <&gcc GCC_GFX3D_OXILI_AHB_CLK>,
+			    <&gcc GCC_GFX3D_OXILI_GMEM_CLK>,
+			    <&gcc GCC_GFX3D_BIMC_CLK>,
+			    <&gcc GCC_GFX3D_OXILI_TIMER_CLK>,
+			    <&gcc GCC_GFX3D_OXILI_AON_CLK>;
+
+			power-domains = <&rpmpd MSM8976_VDDCX>;
+
+			iommus = <&gpu_iommu 0>;
+
+			status = "disabled";
+
+			operating-points-v2 = <&gpu_opp_table>;
+
+			gpu_opp_table: opp-table {
+				compatible  ="operating-points-v2";
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
+					opp-supported-hw = <0xff>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					opp-level = <RPM_SMD_LEVEL_SVS>;
+					opp-supported-hw = <0xff>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					opp-level = <RPM_SMD_LEVEL_NOM>;
+					opp-supported-hw = <0xff>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
+					opp-supported-hw = <0xff>;
+				};
+
+				opp-540000000 {
+					opp-hz = /bits/ 64 <540000000>;
+					opp-level = <RPM_SMD_LEVEL_TURBO>;
+					opp-supported-hw = <0xff>;
+				};
+			};
+		};
+
 		apps_iommu: iommu@1e20000 {
 			compatible = "qcom,msm8976-iommu", "qcom,msm-iommu-v2";
 			ranges  = <0 0x01e20000 0x20000>;
-- 
2.43.0

