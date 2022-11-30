Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0033F63E18B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 21:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1323A10E4D3;
	Wed, 30 Nov 2022 20:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3502410E4DD;
 Wed, 30 Nov 2022 20:10:23 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id c1so28626482lfi.7;
 Wed, 30 Nov 2022 12:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fl/3SGuHbTcYjE9iJ013a/3EaSM7R9xbs2RtmEvdhEQ=;
 b=d7+XlVBSwBY+ZiIBpLruH0rFJsWnlvo36ZFWMTYSz74Q6ZWLHCmxV15L37rHyB0Y7r
 V/yGQfdJYJQWTo1jyFhwxHtBGjPt5Ms/A2lA55kT7YbwtQMX8DHZ6bc1VkCbIaiHFge2
 jhq61wHyX9yirfvn0cPejhSXWVnjaYy/zCcf4mgGgetkK3ngZT7kvTMw9MRWLALsiEC4
 ovJ+zffrL2e67TsCR3+fwDojye+URTKg8dN32ZXx49kHi9TYHccT0uvgSykVpOpXkRwK
 8eBIJFBdyC2OYq1vgaLuhNjwUAOUEPaQwWhtF2NSEJlDh6+GdLv4o+1tqTS5T0xOWxIG
 0MPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fl/3SGuHbTcYjE9iJ013a/3EaSM7R9xbs2RtmEvdhEQ=;
 b=mmr9/zq/VKixlr4ruQglhPwjirwlcHhNjy/fwG17gJAucfrkwJBRpfNba+UoeUHYts
 +xHYKrlMDxwolQ6FtT1W+ezN7FaZLPVRjQa0Nc/7LweN9RLQIbEeDFBW2qafwb8byPPZ
 bkD964UTcK4p5pTooc1WA1aaLuVVk6YqYQU9jY32xgOj5uJaVfHhWOVM7zdFpSXLS8xs
 bA4yNoZUJjO/b/3at12W9Z+ttsp8grX6Hcq1QF6t/K7BLZ/5QmkBAtInhB/RapPYP33U
 acgaIlYSDv+mvW/Z70bnnpUfBqwPu+d5E2uCCqgdyvvlnrGmb6GaDw88R6fDMRxGbaXm
 KfIQ==
X-Gm-Message-State: ANoB5pnfBujHACsSxatR61ZjRDH5URR43w0oN0AuPR8UVC5tA9gK/+3O
 1v5d0lU51cmEMVgKqRt18qaKYLxOLKc=
X-Google-Smtp-Source: AA0mqf644QJvev56npSP4QlSbyhAGHSrmJ2DoQNntdwawNAV6VsuVJn1PqO1Jz566QtYo218WOTEPA==
X-Received: by 2002:a05:6512:21d:b0:4b5:d60:fd11 with SMTP id
 a29-20020a056512021d00b004b50d60fd11mr5935872lfo.124.1669839021394; 
 Wed, 30 Nov 2022 12:10:21 -0800 (PST)
Received: from localhost.localdomain (ccy110.neoplus.adsl.tpnet.pl.
 [83.30.148.110]) by smtp.gmail.com with ESMTPSA id
 a25-20020a056512201900b004b4e9580b1asm369754lfb.66.2022.11.30.12.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 12:10:21 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH v2 11/12] arm64: dts: qcom: sm6115: Add WCN node.
Date: Wed, 30 Nov 2022 21:09:49 +0100
Message-Id: <20221130200950.144618-12-a39.skl@gmail.com>
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

Add WCN node to allow using wifi module.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index e676b9d117e3..38b903592a57 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1305,6 +1305,28 @@ apps_smmu: iommu@c600000 {
 				     <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		wifi: wifi@c800000 {
+			compatible = "qcom,wcn3990-wifi";
+			reg = <0x0c800000 0x800000>;
+			reg-names = "membase";
+			memory-region = <&wlan_msa_mem>;
+			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&apps_smmu 0x1a0 0x1>;
+			qcom,msa-fixed-perm;
+			status = "disabled";
+		};
+
 		apcs_glb: mailbox@f111000 {
 			compatible = "qcom,sm6115-apcs-hmss-global";
 			reg = <0x0f111000 0x1000>;
-- 
2.25.1

