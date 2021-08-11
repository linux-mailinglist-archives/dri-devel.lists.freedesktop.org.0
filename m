Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEF03E9370
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 16:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647656E141;
	Wed, 11 Aug 2021 14:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4C76E13C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 14:19:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628691549; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=lLO4eFNHdUCV1ee4Fqm1c0UbZaPJfKpMDZtjZ/5Hlzo=;
 b=NeX7cp/lpESI5N881u2tYu3VcrbfW+tC2SpJ07Dbw9FeVm799f8Q7+odkavFT3jkJTc+2ZPy
 /RhSckuDwFrJtmfM1nCx+2ajkupZDdcyKIyQycIJ+xhatKOhBUgLby/O/OFv1JfVBTpwGVrl
 XBxXGF59A2K3YZEZLOygjkYYgXs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6113dc4e454b7a558fc9fbb9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Aug 2021 14:18:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6D50CC433F1; Wed, 11 Aug 2021 14:18:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8582CC433F1;
 Wed, 11 Aug 2021 14:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8582CC433F1
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
Cc: Rob Clark <robdclark@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>, Matthias Kaehlcke <mka@chromium.org>,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] arm64: dts: qcom: sc7280: Add gpu thermal zone cooling
 support
Date: Wed, 11 Aug 2021 19:48:36 +0530
Message-Id: <20210811194758.v4.2.Iea8318d85a23f0167fd523ea85df5630147649f9@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628691516-33624-1-git-send-email-akhilpo@codeaurora.org>
References: <1628691516-33624-1-git-send-email-akhilpo@codeaurora.org>
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
index b9006d8..cd2bbf0 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -592,7 +592,7 @@
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
-		gpu@3d00000 {
+		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-635.0", "qcom,adreno";
 			#stream-id-cells = <16>;
 			reg = <0 0x03d00000 0 0x40000>,
@@ -607,6 +607,7 @@
 			qcom,gmu = <&gmu>;
 			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
 			interconnect-names = "gfx-mem";
+			#cooling-cells = <2>;
 
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
@@ -2523,16 +2524,16 @@
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
@@ -2541,19 +2542,26 @@
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
@@ -2562,6 +2570,13 @@
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

