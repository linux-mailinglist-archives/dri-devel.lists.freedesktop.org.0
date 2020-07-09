Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95962219EAB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 13:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6062B6E418;
	Thu,  9 Jul 2020 11:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B366E418
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 11:05:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594292709; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ggRFkfl9YyLD7mY4oeLkJ+x3v/aJ3gbpkHLIEFZvpb4=;
 b=JfcSeetIGkeQxn0rMdi69ouytBOe8+Jj3r1HcponHmSBuPgd8JXGEXc/JFrPgonEXC/QnMBL
 9Su+NDnq7FZuN0bdugLFB32hF2yR7ZpXM6c9NMG1BzJAtypG/eybVTuULSMb/4GIBu5+9Y/q
 /1GSWEsXKU1ZXS631YAuKeH1YFo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-west-2.postgun.com with SMTP id
 5f06f9e50082b27848494cea (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 11:05:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 230AFC43395; Thu,  9 Jul 2020 11:05:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rnayak)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8164CC433CB;
 Thu,  9 Jul 2020 11:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8164CC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rnayak@codeaurora.org
From: Rajendra Nayak <rnayak@codeaurora.org>
To: robdclark@gmail.com, sean@poorly.run, agross@kernel.org,
 bjorn.andersson@linaro.org
Subject: [PATCH v3 3/4] arm64: dts: sdm845: Add DSI and MDP OPP tables and
 power-domains
Date: Thu,  9 Jul 2020 16:34:33 +0530
Message-Id: <1594292674-15632-4-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594292674-15632-1-git-send-email-rnayak@codeaurora.org>
References: <1594292674-15632-1-git-send-email-rnayak@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mka@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the OPP tables for DSI and MDP based on the perf state/clk
requirements, and add the power-domains property to specify the
scalable power domain.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 59 ++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index fee50d9..3efdd70 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3296,6 +3296,35 @@
 			#power-domain-cells = <1>;
 		};
 
+		dsi_opp_table: dsi-opp-table {
+			compatible = "operating-points-v2";
+
+			opp-19200000 {
+				opp-hz = /bits/ 64 <19200000>;
+				required-opps = <&rpmhpd_opp_min_svs>;
+			};
+
+			opp-180000000 {
+				opp-hz = /bits/ 64 <180000000>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+			};
+
+			opp-275000000 {
+				opp-hz = /bits/ 64 <275000000>;
+				required-opps = <&rpmhpd_opp_svs>;
+			};
+
+			opp-328580000 {
+				opp-hz = /bits/ 64 <328580000>;
+				required-opps = <&rpmhpd_opp_svs_l1>;
+			};
+
+			opp-358000000 {
+				opp-hz = /bits/ 64 <358000000>;
+				required-opps = <&rpmhpd_opp_nom>;
+			};
+		};
+
 		mdss: mdss@ae00000 {
 			compatible = "qcom,sdm845-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
@@ -3340,6 +3369,8 @@
 						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
 				assigned-clock-rates = <300000000>,
 						       <19200000>;
+				operating-points-v2 = <&mdp_opp_table>;
+				power-domains = <&rpmhpd SDM845_CX>;
 
 				interrupt-parent = <&mdss>;
 				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
@@ -3364,6 +3395,30 @@
 						};
 					};
 				};
+
+				mdp_opp_table: mdp-opp-table {
+					compatible = "operating-points-v2";
+
+					opp-19200000 {
+						opp-hz = /bits/ 64 <19200000>;
+						required-opps = <&rpmhpd_opp_min_svs>;
+					};
+
+					opp-171428571 {
+						opp-hz = /bits/ 64 <171428571>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-344000000 {
+						opp-hz = /bits/ 64 <344000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-430000000 {
+						opp-hz = /bits/ 64 <430000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
 			};
 
 			dsi0: dsi@ae94000 {
@@ -3386,6 +3441,8 @@
 					      "core",
 					      "iface",
 					      "bus";
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmhpd SDM845_CX>;
 
 				phys = <&dsi0_phy>;
 				phy-names = "dsi";
@@ -3450,6 +3507,8 @@
 					      "core",
 					      "iface",
 					      "bus";
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmhpd SDM845_CX>;
 
 				phys = <&dsi1_phy>;
 				phy-names = "dsi";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
