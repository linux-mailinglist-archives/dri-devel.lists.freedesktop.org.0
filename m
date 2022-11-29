Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E884863C9C0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 21:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130C210E3E1;
	Tue, 29 Nov 2022 20:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6905910E388;
 Tue, 29 Nov 2022 20:47:09 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id r12so23939871lfp.1;
 Tue, 29 Nov 2022 12:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+igg1gFuxyIK8r4AnuQnEHqMeR4rDkdTFliuJlyj0JM=;
 b=lRwYr9F0Zw7I3YQ0P9z9pp1EX9rne1nUteWkaBxGAC87U1MVYlEKocHFExnO83ZiIX
 n9PmIULoYTL6zFHiWYRJLhbOt9ZRxPmu1wQqA9Y02l1GMZkHV1SV/k3rMeL06ipx//+l
 LydoEVTbtDB4vui/RdCx+G+EaBysE2VMUGAVzcW+k92swDZwYHU4DwCSeFspBxX3L5Ns
 TPTCRW842OTLdpUncNgKezqpZOsdDK6XqOZLs6IZpJUDbQTcytlFFocihSTgnlDvOhhP
 lnKwMk/5+gbFuw1t35naeNeR3m/q/Lrf/hVRFxGUMR/qzVsRvYsxjRoAuWC90r1q1MRX
 JbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+igg1gFuxyIK8r4AnuQnEHqMeR4rDkdTFliuJlyj0JM=;
 b=wH21KbShxAIgvN57GBScMoo/xLLUOxSsHfjmEcTnXtSoBDmnu88ZDuXr767fwVy50I
 lmM5x35eviv7O5vcbSrMFwuhY8+HQtI3Zon+PgE6IDNL0YjZKeRo5BertXoSkGBw6PY/
 kTwLazAgBOcEs0WlwJnte3ATBLoiNoOcIFVFAukyYnE9pmHIpnPN3JFxWqiEL1nAyBZj
 hcPnMQvqQitzlMGV4c91k85Ik7c65aUmGgAHI/dwhBgjxc2suANLqXqkizsEJ7poktCn
 RCwMLIIuRbPhI0dcIwh4ExnMjrUF13XdJKBPbYADcp9h48Y9A0YFcUBwA1rXkS4fFfLN
 zp6A==
X-Gm-Message-State: ANoB5pkgSkp6I5aU/fl+vHo4bianSZhfdoGglLjKB3bxk+b6nsvyZEyF
 mF4MAoKegqGAFScpyalNPBI=
X-Google-Smtp-Source: AA0mqf5qYiLSLg45KeZgp/qeZDddSwrnn3Urj3rngk0Idy5+JbkuX+KEXzDkZD0uvEVUUBOMSQxyHQ==
X-Received: by 2002:ac2:5f6d:0:b0:4b4:f9df:c6a4 with SMTP id
 c13-20020ac25f6d000000b004b4f9dfc6a4mr8544566lfc.19.1669754827578; 
 Tue, 29 Nov 2022 12:47:07 -0800 (PST)
Received: from localhost.localdomain (ccy110.neoplus.adsl.tpnet.pl.
 [83.30.148.110]) by smtp.gmail.com with ESMTPSA id
 o11-20020ac24e8b000000b004ae24368195sm2325620lfr.233.2022.11.29.12.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 12:47:07 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 07/12] arm64: dts: qcom: sm6115: Add dispcc node
Date: Tue, 29 Nov 2022 21:46:11 +0100
Message-Id: <20221129204616.47006-8-a39.skl@gmail.com>
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

Add display clock controller to allow controlling display related clocks.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 6d14bbcda9d3..ea0e0b3c5d84 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,gcc-sm6115.h>
+#include <dt-bindings/clock/qcom,sm6115-dispcc.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -717,6 +718,19 @@ usb_1_dwc3: usb@4e00000 {
 			};
 		};
 
+		dispcc: clock-controller@5f00000 {
+			compatible = "qcom,sm6115-dispcc";
+			reg = <0x05f00000 0x20000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&sleep_clk>,
+				 <&dsi0_phy 0>,
+				 <&dsi0_phy 1>,
+				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		apps_smmu: iommu@c600000 {
 			compatible = "qcom,sm6115-smmu-500", "arm,mmu-500";
 			reg = <0x0c600000 0x80000>;
-- 
2.25.1

