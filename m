Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 825FD198DB8
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 09:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4F76E5B4;
	Tue, 31 Mar 2020 07:56:50 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83426E5AB
 for <dri-devel@freedesktop.org>; Tue, 31 Mar 2020 07:56:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585641409; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=jgvxUaNnnaWHqq0izF2zyxOsOupTAxhxGBrh7lVSzvQ=;
 b=vs5IPUQtGBDXhxpDgikFt2kmT+03lkG2BkrOfHI9o3B/ZZe0Q7zlqaH2cj3K7OSxLfmNRXI+
 MrkR85Y9QBa1YrxW0zJANWLl3hFMVbmhEEmmugtM7VUOygwEv5s2OesXZNJBfoiji332blxW
 EFKgOTguMa8M5VuclU/hw8BI+uc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e82f7b9.7f95b0339b90-smtp-out-n04;
 Tue, 31 Mar 2020 07:56:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B3949C44792; Tue, 31 Mar 2020 07:56:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5862FC4478C;
 Tue, 31 Mar 2020 07:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5862FC4478C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: qcom: sc7180: Add GPU DDR BW opp table
Date: Tue, 31 Mar 2020 13:25:50 +0530
Message-Id: <1585641353-23229-3-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
References: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
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
Cc: saravanak@google.com, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, linux-kernel@vger.kernel.org,
 mka@chromium.org, sibis@codeaurora.org, viresh.kumar@linaro.org,
 dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds a new opp table listing the GPU DDR bandwidth opps. Also
adds a required_opp binding to the GPUs main OPP table which holds a
phandle to a bandwidth opp in the new table. This enables linking the
GPU power level opp to the DDR bandwidth opp and helps with scaling
DDR along with GPU frequency.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 50 +++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 51630dd..74b023b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1715,7 +1715,8 @@
 			reg-names = "kgsl_3d0_reg_memory", "cx_mem", "cx_dbgc";
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
 			iommus = <&adreno_smmu 0>;
-			operating-points-v2 = <&gpu_opp_table>;
+			operating-points-v2 = <&gpu_opp_table>,
+						<&gpu_ddr_bw_opp_table>;
 			qcom,gmu = <&gmu>;

 			interconnects = <&gem_noc MASTER_GFX3D &mc_virt SLAVE_EBI1>;
@@ -1726,40 +1727,87 @@
 				opp-800000000 {
 					opp-hz = /bits/ 64 <800000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					required-opps = <&gpu_ddr_bw_opp9>;
 				};

 				opp-650000000 {
 					opp-hz = /bits/ 64 <650000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					required-opps = <&gpu_ddr_bw_opp8>;
 				};

 				opp-565000000 {
 					opp-hz = /bits/ 64 <565000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					required-opps = <&gpu_ddr_bw_opp6>;
 				};

 				opp-430000000 {
 					opp-hz = /bits/ 64 <430000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					required-opps = <&gpu_ddr_bw_opp6>;
 				};

 				opp-355000000 {
 					opp-hz = /bits/ 64 <355000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					required-opps = <&gpu_ddr_bw_opp4>;
 				};

 				opp-267000000 {
 					opp-hz = /bits/ 64 <267000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					required-opps = <&gpu_ddr_bw_opp4>;
 				};

 				opp-180000000 {
 					opp-hz = /bits/ 64 <180000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					required-opps = <&gpu_ddr_bw_opp2>;
 				};
 			};
 		};

+		gpu_ddr_bw_opp_table: gpu-ddr-bw-opp-table {
+			compatible = "operating-points-v2";
+
+			gpu_ddr_bw_opp1: opp-300000000  {
+				opp-peak-kBps =/bits/ 32 <1200000>;
+			};
+
+			gpu_ddr_bw_opp2: opp-451000000  {
+				opp-peak-kBps =/bits/ 32 <1804000>;
+			};
+
+			gpu_ddr_bw_opp3: opp-547000000  {
+				opp-peak-kBps =/bits/ 32 <2188000>;
+			};
+
+			gpu_ddr_bw_opp4: opp-768000000  {
+				opp-peak-kBps =/bits/ 32 <3072000>;
+			};
+
+			gpu_ddr_bw_opp5: opp-1017000000  {
+				opp-peak-kBps =/bits/ 32 <4068000>;
+			};
+
+			gpu_ddr_bw_opp6: opp-1353000000  {
+				opp-peak-kBps =/bits/ 32 <5412000>;
+			};
+
+			gpu_ddr_bw_opp7: opp-1555000000  {
+				opp-peak-kBps =/bits/ 32 <6220000>;
+			};
+
+			gpu_ddr_bw_opp8: opp-1804000000  {
+				opp-peak-kBps =/bits/ 32 <7216000>;
+			};
+
+			gpu_ddr_bw_opp9: opp-2133000000  {
+				opp-peak-kBps =/bits/ 32 <8532000>;
+			};
+		};
+
 		adreno_smmu: iommu@5040000 {
 			compatible = "qcom,sc7180-smmu-v2", "qcom,smmu-v2";
 			reg = <0 0x05040000 0 0x10000>;
--
2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
