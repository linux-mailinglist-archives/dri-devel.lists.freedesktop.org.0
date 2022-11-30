Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1694963E153
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 21:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6123A10E4D1;
	Wed, 30 Nov 2022 20:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95C110E4D6;
 Wed, 30 Nov 2022 20:10:13 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id r12so28691097lfp.1;
 Wed, 30 Nov 2022 12:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zjbRY6rd8FaKbUdJMDib6L2zePb+2secFfDnOJ1OhMQ=;
 b=S4NlJLu7Kc9c1YCCJnXGzDLUk8ADPQ7gJI0e+sUd5s/GpkA4GU8G8zBkoCQJdC8CcB
 znLbthkwC3cvPZnxlLpp5RNnjZyFQUGt3sjFp0cAk4Nqzl/rmsyoMMqHOBSS1QPMPdCg
 nS75VrVtlgjEelMpiaqnoFWuuJ4pk7hvqApAWKMGGitCA+C8bIWkUSUU9euw+BnbeNoW
 0WH0J73uRi2vXutY6mP3n3AaSHqf8pT5qSYQBVCStPbfSBu0kbU+KGhS/j85zCO12rF0
 Zzb+BxwmgymHXewGBq6Q0WtaCjXtlOJOmnk9kL+9KZ0NSIfD2pNqyvuQUJyv1MaJxWB9
 okXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zjbRY6rd8FaKbUdJMDib6L2zePb+2secFfDnOJ1OhMQ=;
 b=wsmDumL/T7lm1kybJK77sl8KmyAQVr7pA0iwcmgRuoH5NoytMZPZQiYPUd8dNHNFO4
 W86MqCKg0Fu3fInurNYmpOJKJt23G7F8kS9lFoWuwebfgPlGeJzJ/6vabanytVFlxdV9
 dWGGWxLXbOQ/osx0bz0QrZJug2/+6CD01YRgiO8/RdJGwa2UCRp2kt8OlGyIhaTITI2e
 jXXtdz0KfjE6ZUmJO6h8IT5PM7iyResrfUmeIBByAUgy2jSUiXw1Ixxx2GY5rMfSO1l9
 CC1LqmtlHmK9lzJtrAi49XKFtJccQgEVdUiAKSgocw5s14ApWsDN6Gpa8DyZfsAt/0EF
 Mkbw==
X-Gm-Message-State: ANoB5pkfmJiuSiPD1WPSPoBstQaqTdAuRtAsaVOZMV7Fxp2hKS0fGg7b
 8KEt2/WKIQ/849NEBQfRpok=
X-Google-Smtp-Source: AA0mqf4hBWIwa003WRRjczVmDE8qipVYmT9vidiXCDSEA3HNQpZvd20CNtMqv/6//p7atKR85IyFTw==
X-Received: by 2002:a19:4f14:0:b0:4b4:b20c:4b7 with SMTP id
 d20-20020a194f14000000b004b4b20c04b7mr15386197lfb.201.1669839012126; 
 Wed, 30 Nov 2022 12:10:12 -0800 (PST)
Received: from localhost.localdomain (ccy110.neoplus.adsl.tpnet.pl.
 [83.30.148.110]) by smtp.gmail.com with ESMTPSA id
 a25-20020a056512201900b004b4e9580b1asm369754lfb.66.2022.11.30.12.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 12:10:11 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH v2 07/12] arm64: dts: qcom: sm6115: Add dispcc node
Date: Wed, 30 Nov 2022 21:09:45 +0100
Message-Id: <20221130200950.144618-8-a39.skl@gmail.com>
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

Add display clock controller to allow controlling display related clocks.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index d0928f19965f..6e0699649257 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,gcc-sm6115.h>
+#include <dt-bindings/clock/qcom,sm6115-dispcc.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -725,6 +726,19 @@ usb_1_dwc3: usb@4e00000 {
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

