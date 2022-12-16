Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1770A64F36F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 22:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246AB10E64B;
	Fri, 16 Dec 2022 21:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F64610E63B;
 Fri, 16 Dec 2022 21:45:20 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BGLF5vv000316; Fri, 16 Dec 2022 21:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=3mpWnZHcLxtFObb6ANYSgR5qTraxgu8d0FEDD5nCM54=;
 b=p4dJsCz8KrqmgS0B84m4QfbPbM28Ybx6jMMYWZ9tRa9HggASbRV3LwBiejizzgDg9upS
 858tIlzXPvDmZ4IzUHunGogTYwsbuYPLyzygo9LF2NsIug5TP8ChtNQdHLFuVbxV8Zdb
 hKYlkUrXop8/RucWHo0gUUFNA3SqFMrQ5nHhwX0Ul1Pu/zp52zp71jkCnXkvZxkoa0D/
 QB/QJVaSXTqpBlXI+st+8wo+S+cBkFb7oYWAMak/Bm6WpxI+XUHjHN270QxysdsL8DXg
 CF3PTVAI5Ei3gfp1ErnfiG+icXOn3kgWVEmHqlttUGyZXTqhD+gBqmWCPPerW7u8jXyp 5w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mgufm10yj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 21:45:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BGLjDwL027919
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 21:45:14 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 16 Dec 2022 13:45:13 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>,
 <konrad.dybcio@somainline.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
 <airlied@gmail.com>
Subject: [PATCH v15 1/5] arm64: dts: qcom: add data-lanes and link-freuencies
 into dp_out endpoint
Date: Fri, 16 Dec 2022 13:44:58 -0800
Message-ID: <1671227102-21717-2-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1671227102-21717-1-git-send-email-quic_khsieh@quicinc.com>
References: <1671227102-21717-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: LrBmdwtfkQJ9NTRxpLEu_pJWvK48B9Tt
X-Proofpoint-GUID: LrBmdwtfkQJ9NTRxpLEu_pJWvK48B9Tt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_14,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212160193
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move data-lanes property from mdss_dp node to dp_out endpoint. Also
add link-frequencies property into dp_out endpoint as well. The last
frequency specified at link-frequencies will be the max link rate
supported by DP.

Changes in v5:
-- revert changes at sc7180.dtsi and sc7280.dtsi
-- add &dp_out to sc7180-trogdor.dtsi and sc7280-herobrine.dtsi

Changes in v6:
-- add data-lanes and link-frequencies to yaml

Changes in v7:
-- change 160000000 to 1620000000
-- separate yaml to different patch

Changes in v8:
-- correct Bjorn mail address to kernel.org

Changes in v9:
-- use symbol rate (hz) for link-frequencies at dp_out at sc7180_trogdor.dtsi

Changes in v13:
-- delete an extra space at data-lanes

Changes in v15:
-- replace space with tab at sc7180-trogdor.dtsi

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 4 ++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index eae22e6..ad98a87 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -814,7 +814,11 @@ hp_i2c: &i2c9 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&dp_hot_plug_det>;
+};
+
+&dp_out {
 	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
 };
 
 &pm6150_adc {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index c11e371..3f363f8 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -442,7 +442,11 @@ ap_i2c_tpm: &i2c14 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&dp_hot_plug_det>;
+};
+
+&dp_out {
 	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
 &mdss_mdp {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

