Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DE063C9D7
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 21:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3EB10E09D;
	Tue, 29 Nov 2022 20:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB68C10E3D3;
 Tue, 29 Nov 2022 20:47:19 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id be13so23903945lfb.4;
 Tue, 29 Nov 2022 12:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8OJbaeSPcoUQhtrSfuzPP+5Xvz9tDw3fpybywrDiLB8=;
 b=isX5XESaqTPO6t/rIUbSKYmN1N1Dj6iJFY4zi9Q4/cAMTUMA+sX9eL/49g1tvW5Zny
 rAca4oqEK+DqAek0wERHVCLD3nTdFRwhJ7CscGnoZnKgDpL0RV96PvAfAIqLnEPejxoM
 Yz70Hahxo6+2JtIbjtQI/tF+uwgYYQfI7G2PF6wHqtAGplmUp3c3i2383B0fjGEYhPQG
 3i0FCQ/bMG/t3hW1gfm48IPo7p7q53Y1WNf7Vm9jVHFQjcZs6NNLl1/yY25IilHBTgYW
 bXwk4v9GIAhdmaByNwQsi2txZf/Fko0Vc+SJq7Zc3vPhfnL5cdFq+b5qiZmrl5oAnlB7
 7f8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8OJbaeSPcoUQhtrSfuzPP+5Xvz9tDw3fpybywrDiLB8=;
 b=v+RQYZVOf8JgIqW5+XMpTNOWp/BAGF6XwDFLHyC74C3IKPwETGHpoHUZc5Jdc8plte
 N52S1VdXIZLVOFDImszpjqal9tgO0hm0SskA3yPCA4TFhQyIU2xC32MYR9zPfBzsvUVz
 4Kcc/FR3vja5JYa6ohTKDQha3p6jsxcZwrSb73Pe9Zl3DoEjiGnlsy3NYSeLFFZYVI8f
 GTvu8KjQSayICcqBT1ybgYrJ+7Rxrez0t9MnViiiADKcJKLVLtl8WOtFVCzMMN9zU5VV
 TKWdHKwwSHRUwjE4TRi7IzA+R2KNf/uG5jvVd/NEr5+vLY1yj4dGSvCszaaYafrdjbpo
 LgQQ==
X-Gm-Message-State: ANoB5pkv8QCjjJqdhLUIuBCDm9WKvEwkawd8JBkxXld3NsdaGg2cZylr
 dNDgkSbzGut4y+vkGz0mRxk=
X-Google-Smtp-Source: AA0mqf54SpyD4y7QdMfh7uhy0hQf6/Lwg3RHDJI54U1OkTsCBQXvOVa2dmVDRScLyX0IIVI4Pm8Ing==
X-Received: by 2002:ac2:5f9b:0:b0:4a2:5163:f61b with SMTP id
 r27-20020ac25f9b000000b004a25163f61bmr19237522lfe.177.1669754839327; 
 Tue, 29 Nov 2022 12:47:19 -0800 (PST)
Received: from localhost.localdomain (ccy110.neoplus.adsl.tpnet.pl.
 [83.30.148.110]) by smtp.gmail.com with ESMTPSA id
 o11-20020ac24e8b000000b004ae24368195sm2325620lfr.233.2022.11.29.12.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 12:47:18 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 12/12] arm64: dts: qcom: sm6115: Fallback smmu to qcom generic
 compatible
Date: Tue, 29 Nov 2022 21:46:16 +0100
Message-Id: <20221129204616.47006-13-a39.skl@gmail.com>
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

Change fallback to qcom generic compatible
in order to prevent reboot during SMMU initialization.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 36d1cff23d10..b00d74055eb1 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1222,7 +1222,7 @@ dispcc: clock-controller@5f00000 {
 		};
 
 		apps_smmu: iommu@c600000 {
-			compatible = "qcom,sm6115-smmu-500", "arm,mmu-500";
+			compatible = "qcom,sm6115-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0c600000 0x80000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <1>;
-- 
2.25.1

