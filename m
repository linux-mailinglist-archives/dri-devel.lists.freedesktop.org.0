Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B6D63E152
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 21:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F3A10E4E4;
	Wed, 30 Nov 2022 20:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BA610E4D7;
 Wed, 30 Nov 2022 20:10:18 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id x11so3099777ljh.7;
 Wed, 30 Nov 2022 12:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UeKUFuMBGeOpjtNWu+0ecey1vuODCAFUa80H0ilPD38=;
 b=m5Ymrb6lcOlQCFUPyS5dDFiWk7h0coEC1hEjEdmkCwdJNcaKdcG8E+ngDKWyXDm3jR
 y5C5dH8/GkOIPG12tjyl1Tk96HFLmLmoVOQjhQVBTHMb7i0MY/vJjLCN1y8mYIbjsKXF
 uZciS35mrj85YYytZiW4tnAS/pFj/vFUDYGAQI8MZhV6xtTnQESTp2d9dnIOHLk3/vDy
 dtfyIqbC56gZJVf18ARwejyPuN3kqr6r38CkH/+4K1yXqpcYBnDvXJwvQHs1auRYnAsF
 feY2fPm9uO3YsBlsuBDlF8sozflt0fJ6rs/+fmfb5s7Y9OgoU3DxPWjN2dSOX0PBCk7Z
 YWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UeKUFuMBGeOpjtNWu+0ecey1vuODCAFUa80H0ilPD38=;
 b=A/oxuqihd9bYGN1GnPVKvdR9rQnifvqzaiUVlRRDT4C6usTOdAES6fXaETz1z6mznq
 cfEX+0O2LrYudAf+1Ru7T/iX8tGM9SLh4KcHo2A1LbBOYagMc/S7POyITdSBXjDAzKvV
 G3G5Rr5a48wIAf+v30HJNWg38cNOdXxV0aTir0t4Lo/CHVZvxx2Z5lhN66Z5nne/85w2
 dW05LOMntVSTt7WY6hZajwd+Ph1ustsj4gghsJT7xPI3nw5S8aIUoByy9CXCWaoNBbWD
 4EyZLCcHiOFABVXHNbnSq2HuEAi4je5SAeAjqZldal7qU62FC+8puIsimVXwBxWAJcPU
 ghkw==
X-Gm-Message-State: ANoB5pl0GAcgBOS3qEwUHQDvsNo0vdoV9MLt/lCE3/sKVuTgs8eRyEGW
 M0OVLpPZZ1GZCg4en5EtDo4=
X-Google-Smtp-Source: AA0mqf7EL8CUTw6gdGplX8YzU89iQEAEQ3gnLjh5BmUir1uGwe/Ke0v01HN+zvn9r7ueoZc51+RHBQ==
X-Received: by 2002:a05:651c:503:b0:277:dba:2f65 with SMTP id
 o3-20020a05651c050300b002770dba2f65mr15966645ljp.201.1669839016715; 
 Wed, 30 Nov 2022 12:10:16 -0800 (PST)
Received: from localhost.localdomain (ccy110.neoplus.adsl.tpnet.pl.
 [83.30.148.110]) by smtp.gmail.com with ESMTPSA id
 a25-20020a056512201900b004b4e9580b1asm369754lfb.66.2022.11.30.12.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 12:10:16 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH v2 09/12] arm64: dts: qcom: sm6115: Add GPI DMA
Date: Wed, 30 Nov 2022 21:09:47 +0100
Message-Id: <20221130200950.144618-10-a39.skl@gmail.com>
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

Add GPI DMA node which will be wired to i2c/spi/uart.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index c476b5ecb62b..b30a5485671d 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -681,6 +681,26 @@ ufs_mem_phy_lanes: phy@4807400 {
 			};
 		};
 
+		gpi_dma0: dma-controller@4a00000 {
+			compatible = "qcom,sm6115-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x04a00000 0x60000>;
+			interrupts = <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels =  <10>;
+			dma-channel-mask = <0xf>;
+			iommus = <&apps_smmu 0xf6 0x0>;
+			#dma-cells = <3>;
+			status = "disabled";
+		};
+
 		usb_1: usb@4ef8800 {
 			compatible = "qcom,sm6115-dwc3", "qcom,dwc3";
 			reg = <0x04ef8800 0x400>;
-- 
2.25.1

