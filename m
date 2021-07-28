Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8093D8D3C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 13:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1C16E9D4;
	Wed, 28 Jul 2021 11:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393A76E9E8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 11:54:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627473271; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=/WsVFgU8nSk4cXI3eg+ED7P3oZTzr/iTpTi+SjxaHFg=;
 b=Tz8HW3tOmflp99ipQYCaJMlcx5M78/pSPGdl7aAiyp5e+4Y42SDqaULXodPaya/JeSTkcgVK
 dPK8nHFe3RUvwzx5bqrAGOTcCMGJ/LxaC1la2NsXz+PDIfOMDk8R7eh3PV87O0neWqFJDYAq
 YE8EUv//oEuo3wO5jRWOCNi+sSI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6101456a17c2b4047d3a9a7b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Jul 2021 11:54:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2E2ABC433F1; Wed, 28 Jul 2021 11:54:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6DF75C4338A;
 Wed, 28 Jul 2021 11:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6DF75C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>, 
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
Subject: [PATCH v3 2/2] arm64: dts: qcom: sc7280: Add gpu thermal zone cooling
 support
Date: Wed, 28 Jul 2021 17:24:02 +0530
Message-Id: <20210728172330.v3.2.Iea8318d85a23f0167fd523ea85df5630147649f9@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627473242-35926-1-git-send-email-akhilpo@codeaurora.org>
References: <1627473242-35926-1-git-send-email-akhilpo@codeaurora.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Andy Gross <agross@kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>

Add cooling-cells property and the cooling maps for the gpu thermal
zones to support GPU thermal cooling.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---

(no changes since v1)

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index c88f366..45a96d1 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -593,7 +593,7 @@
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
-		gpu@3d00000 {
+		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-635.0", "qcom,adreno";
 			#stream-id-cells = <16>;
 			reg = <0 0x03d00000 0 0x40000>,
@@ -608,6 +608,7 @@
 			qcom,gmu = <&gmu>;
 			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
 			interconnect-names = "gfx-mem";
+			#cooling-cells = <2>;
 
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
@@ -2524,16 +2525,16 @@
 		};
 
 		gpuss0-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <100>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 1>;
 
 			trips {
 				gpuss0_alert0: trip-point0 {
-					temperature = <90000>;
+					temperature = <95000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss0_crit: gpuss0-crit {
@@ -2542,19 +2543,26 @@
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss1-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <100>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 2>;
 
 			trips {
 				gpuss1_alert0: trip-point0 {
-					temperature = <90000>;
+					temperature = <95000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss1_crit: gpuss1-crit {
@@ -2563,6 +2571,13 @@
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nspss0-thermal {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

