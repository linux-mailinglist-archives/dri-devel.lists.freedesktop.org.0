Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7715B032D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 13:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CC610E5CA;
	Wed,  7 Sep 2022 11:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319CB10E5C9;
 Wed,  7 Sep 2022 11:36:42 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2878lxlr002379;
 Wed, 7 Sep 2022 11:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc : subject : date : message-id; s=qcppdkim1;
 bh=+J2q28663HnekhnqpbxMxmUltK8XR8Y64XsYPBktWAE=;
 b=nA0pS6lJmrE2J3C8/BuihqFFQhix+ZjthMpSdJJnRDg+BwK2ZeLANDJ8noi4eVG1TtBo
 5CkZDTbnNZ3VXTFd0+of5LUFAdL5m/TN+sqH4pvL0Mhhh2z42V1GA7Goi1Qb4DZQFXv1
 woUkTkulyB/Rx1NvRy5ZibRG+9hX0FXNeYtiPo2M1Cecq5LU2uX+F7qKqaFjZFkPMtwi
 vJJAT1oIqChK3L1o6VE0sy57eFfpiwSmSRfhdKU0XZmZcxKHi08mCIsJO0jBfbF9iHSC
 /NojEfopuhjJG5S9Os6yd5XolEE6w2F1pO7AO7Mf13pt9NYt4k+EEeBBTOSTtM+9TMXR PQ== 
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jeqfwgjbj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 11:36:37 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 287BaXbF032259; 
 Wed, 7 Sep 2022 11:36:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3jc00kxt4u-1;
 Wed, 07 Sep 2022 11:36:33 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 287BaX6K032254;
 Wed, 7 Sep 2022 11:36:33 GMT
Received: from rajeevny-linux.qualcomm.com (RAJEEVNY-LINUX.qualcomm.com
 [10.204.66.121])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 287BaWLu032253;
 Wed, 07 Sep 2022 11:36:33 +0000
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id 1DAF020F8B; Wed,  7 Sep 2022 17:06:32 +0530 (IST)
From: Rajeev Nandan <quic_rajeevny@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v1] arm64: dts: qcom: sc7280: assign DSI clock source parents
Date: Wed,  7 Sep 2022 17:05:53 +0530
Message-Id: <1662550553-28933-1-git-send-email-quic_rajeevny@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: XZbuI_TuHvG35CCqqA2BUiBDCfv4OYN4
X-Proofpoint-GUID: XZbuI_TuHvG35CCqqA2BUiBDCfv4OYN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_06,2022-09-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=926
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1011 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209070044
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
Cc: quic_kalyant@quicinc.com, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 andersson@kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, robh+dt@kernel.org,
 agross@kernel.org, dmitry.baryshkov@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

This change is needed after the refactor done by the patch [2] 
(drm/msm/dsi: stop setting clock parents manually) of series [1],
to fix the DSI pixel clock set rate error:
  dsi_link_clk_set_rate_6g: Failed to set rate pixel clk, -22
  msm_dsi_host_power_on: failed to enable link clocks. ret=-22

[1] https://github.com/torvalds/linux/commit/9b077c1581cf57206f5f7788ea569e8fae0719a7
[2] https://lore.kernel.org/all/20210709210729.953114-1-dmitry.baryshkov@linaro.org/

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 50c3d79..a80aa64 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3650,6 +3650,9 @@
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi_phy 0>, <&mdss_dsi_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SC7280_CX>;
 
-- 
2.7.4

