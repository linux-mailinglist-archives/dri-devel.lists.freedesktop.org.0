Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E324C4EB4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 20:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F3310E7A1;
	Fri, 25 Feb 2022 19:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AE510E7A1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 19:25:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1645817143; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=cCBg/D6SOxICZ8bzSkUecbzVhRVyvFsZfNOMBfa81yQ=;
 b=mTiGzuIOxPdhY+Qag1XEKDzz1ui+OFB2LGuOzijPdYBheKTJZdU4sMf4BO1kCjRAihf6+Hn0
 UGbKKcYh0cdOolXgX6bvV1Jr4yjHFIaIApLrZ2X0MlPTXLn5KvXSqf8/CI31jjrjePaiCO3s
 AHAlJvhdifeYVxnt/TQL6LxAbpQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 62192c66e1c212bb9c4b449d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 25 Feb 2022 19:22:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1E5EFC4361B; Fri, 25 Feb 2022 19:22:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7CD9CC43638;
 Fri, 25 Feb 2022 19:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7CD9CC43638
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=quicinc.com
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 5/5] arm64: dts: qcom: sc7280: Support gpu speedbin
Date: Sat, 26 Feb 2022 00:51:32 +0530
Message-Id: <20220226005021.v2.5.I4c2cb95f06f0c37038c80cc1ad20563fdf0618e2@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645816893-22815-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1645816893-22815-1-git-send-email-quic_akhilpo@quicinc.com>
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
Cc: Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add speedbin fuse and additional OPPs for gpu to support sc7280 SKUs.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

(no changes since v1)

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 46 ++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 365a2e0..f8fc8b8 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -605,6 +605,11 @@
 			power-domains = <&rpmhpd SC7280_MX>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			gpu_speed_bin: gpu_speed_bin@1e9 {
+				reg = <0x1e9 0x2>;
+				bits = <5 8>;
+			};
 		};
 
 		sdhc_1: sdhci@7c4000 {
@@ -1762,6 +1767,9 @@
 			interconnect-names = "gfx-mem";
 			#cooling-cells = <2>;
 
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
+
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
@@ -1769,18 +1777,56 @@
 					opp-hz = /bits/ 64 <315000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 					opp-peak-kBps = <1804000>;
+					opp-supported-hw = <0x03>;
 				};
 
 				opp-450000000 {
 					opp-hz = /bits/ 64 <450000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
 					opp-peak-kBps = <4068000>;
+					opp-supported-hw = <0x03>;
 				};
 
 				opp-550000000 {
 					opp-hz = /bits/ 64 <550000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
 					opp-peak-kBps = <6832000>;
+					opp-supported-hw = <0x03>;
+				};
+
+				opp-608000000 {
+					opp-hz = /bits/ 64 <608000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <8368000>;
+					opp-supported-hw = <0x02>;
+				};
+
+				opp-700000000 {
+					opp-hz = /bits/ 64 <700000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <8532000>;
+					opp-supported-hw = <0x02>;
+				};
+
+				opp-812000000 {
+					opp-hz = /bits/ 64 <812000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <8532000>;
+					opp-supported-hw = <0x02>;
+				};
+
+				opp-840000000 {
+					opp-hz = /bits/ 64 <840000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <8532000>;
+					opp-supported-hw = <0x02>;
+				};
+
+				opp-900000000 {
+					opp-hz = /bits/ 64 <900000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <8532000>;
+					opp-supported-hw = <0x02>;
 				};
 			};
 		};
-- 
2.7.4

