Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FC4658B64
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 11:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C5010E25B;
	Thu, 29 Dec 2022 10:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D6510E258
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 10:05:18 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id j17so17387982lfr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 02:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vi6tcI8bHyA9S/bOSi1wpPh2ZLAvYqA78JsW9WBoa6M=;
 b=yTs5cP+DHZp/DBZjAkLQVtKuJOpND9KFE9C1Q7WRQkf9GzjnZzBcs33yzkhe5bPBAS
 Pkr6LODyxkEoW92e0XvZr1E8XjXrv3QlHoV43axXxQjpSw3ot64cAEvV3RmWuKFQf+0G
 Y7AvCUxloWX44apGMGZMIg+5lZtPpG62BzAPxsX5ged+TSI8X5hhfZDGEB2f1wtVm6X2
 Bc0/95UaLoZQtnMtKrUQQo0CD95VdnKmZ2LXeg9nWNOc7KpXWHYF0zoa68MKKKE+5NRD
 jRGiTkhnHndR9sxTznNi39skuJVUGSsuBofbcwmdffzRvQTA+Gm+QHt0o19pZGMS2n5z
 enjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vi6tcI8bHyA9S/bOSi1wpPh2ZLAvYqA78JsW9WBoa6M=;
 b=LYgPiWKU5M6Ns4FkRAIocIkZXXxuwapizv/xHxLp3FdLyluoccP2WBpYPGgYOWh+YE
 dygNmDRgcG+nuh7aywOieSYQcjfJUn3O4jzHPE6qlkTGpDqjSHQ7GcnRehHWZPti+8KY
 d7iKFCOsT3z2CanZPNWThBpW69h4BHB8WYsmQOVgk5DmYzGMHBYQGLo+qfSwaGWbPTQY
 GPKj4/Oca9NEk11T4WnLAiMYH75BlyJenQ0H52ZMNTBHFWfyzZAxvPZrwRj2O7Z3bSnw
 UrgVyYwev4vH7XnhS2capXQywiZ2IXj428a3613d/sXmvjCswuR6SZc8O7X2DXwF9MVi
 UUKA==
X-Gm-Message-State: AFqh2kpopZCL9X0NdI33bdAjQ4ipXkBLGz2yl5MEkJ2qGmLW2ndb0Ule
 OMuai3AbllaA/qqYCFO8UtOBQg==
X-Google-Smtp-Source: AMrXdXuNTAP7gHozY4pQ3hHtDlF5oK3rbEgOcGNXc7qqJxgpYxvJVPdcIYzICa4Bpl87HcNBnNwFbw==
X-Received: by 2002:a05:6512:2394:b0:4b5:987c:de3e with SMTP id
 c20-20020a056512239400b004b5987cde3emr12138705lfv.69.1672308317047; 
 Thu, 29 Dec 2022 02:05:17 -0800 (PST)
Received: from localhost.localdomain (abyl184.neoplus.adsl.tpnet.pl.
 [83.9.31.184]) by smtp.gmail.com with ESMTPSA id
 x2-20020a0565123f8200b004b590b0c084sm2959896lfa.3.2022.12.29.02.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 02:05:16 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm8150: Add DISPCC node
Date: Thu, 29 Dec 2022 11:05:09 +0100
Message-Id: <20221229100511.979972-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229100511.979972-1-konrad.dybcio@linaro.org>
References: <20221229100511.979972-1-konrad.dybcio@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Years after the SoC support has been added, it's high time for it to
get dispcc going. Add the node to ensure that.

Tested-by: Marijn Suijten <marijn.suijten@somainline.org> # Xperia 5
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:
- Pick up tags
- Remove required-opps
- Move power-domains up
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index a0c57fb798d3..c7935f7a2926 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3579,6 +3579,29 @@ camnoc_virt: interconnect@ac00000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm8150-dispcc";
+			reg = <0 0x0af00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "bi_tcxo",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "dp_phy_pll_link_clk",
+				      "dp_phy_pll_vco_div_clk";
+			power-domains = <&rpmhpd SM8150_MMCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8150-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x400>;
-- 
2.39.0

