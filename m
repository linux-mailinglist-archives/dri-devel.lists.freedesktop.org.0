Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D4063C9C1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 21:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489C210E3E4;
	Tue, 29 Nov 2022 20:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1ED610E3DB;
 Tue, 29 Nov 2022 20:47:13 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id bn5so18663843ljb.2;
 Tue, 29 Nov 2022 12:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5GXxM1nqK364oUTYPhJF7Ku7/EgOLFJ2UJoNxZjUleQ=;
 b=niQYxWYTJPw9C7zm4O9ipcOd/SO5f+jJbzwDo4IlXrpfGdkMqMzXcJv/5c7fZ014TS
 mIK7V+nArFCNTJ7d9vvk8N2bHa2IYACM/yaw+N9mUxefiFdXJRbjV9/1inrQ7zlfawn1
 Crj39XGSbxhdtU3B0RzKtha6L0FAgPGr/1UZ8w5A0NUsrWpck4JmxaS7iTvEzbYDvVVg
 wz9je561VEqOyUoS0yoWChsBrSezrM/0BB8p8a1h0qM9wnA7Baz1UAdbF6qJYHtxvf3e
 PE1y5SEKsiI3kIhUdLNeCNR1epDUL8DEb0/m/8b4v3v7Z+b/aLkemx9vkCrwsHiZ5X+P
 ejQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5GXxM1nqK364oUTYPhJF7Ku7/EgOLFJ2UJoNxZjUleQ=;
 b=LnS4UVNDZJ/O4IgGdMk6peU9/Rb+DrVeRiB7JrBp5RDAIl1X/475yPBKQiD1urQz0O
 uKTpVb0wy9DmaoVue05nuZmG9Z3bQwH/xa8dmhyRYTkRnLQz0P1m0kLuNjiqnP3kzSRA
 JED6C23y+dG24GiVDE0hSyFRuVu3VgCF4JYziYSIJMzFnvceErMRbGOuvVrHYHHrHUTd
 7joVDaUFTBeLqyU8qbvv2e01+WcbWpG9OdpE5wwp2T7215tGeF6aFPMMAXPJOSmeWMBU
 qIS6Nl6/Bbzo2Jn22qUjN2/k55eX/aIqmOwY1ywq+UgVab0+/fwCi5prgEZL8ziAs0Kp
 ZF/w==
X-Gm-Message-State: ANoB5pnzXB0r0PchlIYj3worZZN1eOf8MAM5SCxYNsgW9Ygz9R0f7VZA
 PJwjv1Mh/fdOYfue0bgXfvw=
X-Google-Smtp-Source: AA0mqf5Lj019HBIAtQJ5dyPFCPwQBaZl7B5P5RwE/byxr1ksM2umIp2b4SZY6y+eahc6/XvLOb3rHQ==
X-Received: by 2002:a2e:a4b4:0:b0:26c:5cf3:cc89 with SMTP id
 g20-20020a2ea4b4000000b0026c5cf3cc89mr19293471ljm.483.1669754832127; 
 Tue, 29 Nov 2022 12:47:12 -0800 (PST)
Received: from localhost.localdomain (ccy110.neoplus.adsl.tpnet.pl.
 [83.30.148.110]) by smtp.gmail.com with ESMTPSA id
 o11-20020ac24e8b000000b004ae24368195sm2325620lfr.233.2022.11.29.12.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 12:47:11 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 09/12] arm64: dts: qcom: sm6115: Add GPI DMA
Date: Tue, 29 Nov 2022 21:46:13 +0100
Message-Id: <20221129204616.47006-10-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221129204616.47006-1-a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
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
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index b459f1746a7f..e9de7aa1efdd 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -673,6 +673,26 @@ ufs_mem_phy_lanes: phy@4807400 {
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

