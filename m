Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 085C263C9D6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 21:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E0A10E393;
	Tue, 29 Nov 2022 20:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F93F10E3D9;
 Tue, 29 Nov 2022 20:47:19 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id a19so2898933ljk.0;
 Tue, 29 Nov 2022 12:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JM8qWhjtmVz4g8QiVLIg+Ipe0Ovs4/S9ZpUrITzygDw=;
 b=VTmPTjA0nBXjP2iGsAL/CDBkR2uVwYlxV0pZUds5sisiYqyFAWRgkaG9Hkx6pEEx9z
 sZwRG+4s4bcSz6txpufg+3mDQnt3GvuP+GrQsWt8jD6qNqa9QcSWDmrDCv961I+rUqay
 gODis7/X4F7oCOgDWpUHP0l1BbO/A0zt/mS3EqkNDjiQkexgZXAjL36U8etUSKDHyqy/
 eTQxxIvW1PWHXVPUzriUPgdiuchrtMk3ML1JrsxkQsGYcdYcy3hydV6T7Tlosmaj4MZO
 QjHa7pyf86rR5EW49I8pAxreREUgmZ+k0JFeotLL72ZjJATJWuiOey/dgzisQh4dpoTM
 UYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JM8qWhjtmVz4g8QiVLIg+Ipe0Ovs4/S9ZpUrITzygDw=;
 b=sCNbnHapGFRXbqbtV/7tcSKCeomhgYFs7FXrci5P77Tae0Gcs1JyZHVy6L4gNWHbAD
 rLFb9os7SCz54C6wArV3v8ppkxrJd8sFzUosUVRGJ2da38vh5zqcMHQWR/jO9eZWc2cu
 ZC3M+XdEfSzZKOmaMKnuzex5f/pEfLO7FYvJ7twlboaLkSkwBFEK6/b5m86gvep+j2+i
 G9bod77zEjdzi1owJdbBUjIUBHWWc24n49x2xJLJtCzEkM+N2rLJgZMUzak1GvHwIUhK
 lMy3FHsBdvZlRPI2MYqxbEsmvtPtL30r0u+bDu2VK4wmT9nrCkvGvNGIC8ONG+I8XfoU
 yweQ==
X-Gm-Message-State: ANoB5plUcmXMVQMmFT1S/54rlWbraJ32qJEPP2KSmPQP2E099KEQ1GEk
 6rZaexLr69sTM4/zrzRcjn8=
X-Google-Smtp-Source: AA0mqf5SpcOjRARzwp1NkQxL/CovjoQTjDAIOA8/0GZqKninqGw0BWnE0/HvuzYtIY6HU70h3/QAYA==
X-Received: by 2002:a05:651c:160b:b0:276:4462:2d20 with SMTP id
 f11-20020a05651c160b00b0027644622d20mr11957815ljq.19.1669754837049; 
 Tue, 29 Nov 2022 12:47:17 -0800 (PST)
Received: from localhost.localdomain (ccy110.neoplus.adsl.tpnet.pl.
 [83.30.148.110]) by smtp.gmail.com with ESMTPSA id
 o11-20020ac24e8b000000b004ae24368195sm2325620lfr.233.2022.11.29.12.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 12:47:16 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 11/12] arm64: dts: qcom: sm6115: Add WCN node.
Date: Tue, 29 Nov 2022 21:46:15 +0100
Message-Id: <20221129204616.47006-12-a39.skl@gmail.com>
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

Add WCN node to allow using wifi module.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index d14a4595be8a..36d1cff23d10 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1294,6 +1294,28 @@ apps_smmu: iommu@c600000 {
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

