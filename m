Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9979DA3AA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 09:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5564310E202;
	Wed, 27 Nov 2024 08:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LLkIrEzc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FACC10E202;
 Wed, 27 Nov 2024 08:18:32 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQKKsWx005586;
 Wed, 27 Nov 2024 08:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Ph9WzAT5VPyHBr+N+DaRCN
 iE6BuMM4FA6H06qUwjGuM=; b=LLkIrEzc+pFLenin84SGmUbCmFlNrZIBhLCAvt
 elvUQSYf2YlBzwOSTIC70p2pK85scyW2LqjAHtraiyZN0mpOhcKYKm3CEqqPzTxe
 NI+cKd3MBnEvbAnCRiZiEk42bjKY5R833wNyLLNMD3P0ZHMQDsWUvdJn33aTqJP/
 hJn5Cnf1uIQ8Tf2+FPbFm8oRZES2RkUyLRBIxuWrayGFBc7CW9lFbx/T9FUEvQO/
 ZISOGWiAJTEquT7mUzMJoO0Xaa0eG90S1IoT4W58rfPLPiZjAIgVV8orEBz/hyDb
 LTMfLXPpr+PgwdNGO2Hjm9ZuT6tHIp7TJTmQMizbLpOhkxjg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435cmqu3ha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2024 08:18:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR8IKqm027022
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2024 08:18:20 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 27 Nov 2024 00:18:14 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Subject: [PATCH 0/4] Add support for DisplayPort on QCS8300 platform
Date: Wed, 27 Nov 2024 16:15:47 +0800
Message-ID: <20241127-qcs8300_dp-v1-0-0d30065c8c58@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADvVRmcC/yWMywrDIBAAfyXsuYJurNb8SglFN2vrIS9NSyHk3
 yvNcQZmdiicExfomh0yf1JJ81RBXRqgl5+eLNJQGVCiVgqtWKncWikfwyLQIl2dotazhxosmWP
 6/mf3/uTM67s+t1NC8IUFzeOYtk4rTc6SMyYYx9ob9ja06KyMXlWJ0QXHUUJ/HD/XLDqRpwAAA
 A==
X-Change-ID: 20241127-qcs8300_dp-272c591c3aea
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>, Ritesh Kumar
 <quic_riteshk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732695489; l=958;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=ew1UmMOSJFbPd+Z9F/oJ0gHPRju0DdcIiFRlePEPKLM=;
 b=TXxfDlnX1UrMal5HDvl5bJKLCNqLe6+SsyVYzbXWAtggcYGj1Puz3W8pIY94crGzrZgoWOra0
 J37+MVNlz/iDvvQGZt9ND/xh8qu7QQ+PPfrPvP7B4y8a1Z+8IQJv752
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: DkJehipS5AnHEuFrkAvNEC4WtfwjsZ0O
X-Proofpoint-ORIG-GUID: DkJehipS5AnHEuFrkAvNEC4WtfwjsZ0O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=791
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411270068
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

This series adds support for the DisplayPort controller
and eDP PHY v5 found on the Qualcomm QCS8300 platform.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
Yongxing Mou (4):
      dt-bindings: phy: Add eDP PHY compatible for qcs8300
      phy: qcom: edp: Add support for eDP PHY on QCS8300
      dt-bindings: display: msm: dp-controller: document QCS8300 compatible
      drm/msm/dp: Add DisplayPort controller for QCS8300

 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml          | 1 +
 drivers/gpu/drm/msm/dp/dp_display.c                              | 6 ++++++
 drivers/phy/qualcomm/phy-qcom-edp.c                              | 8 ++++++++
 4 files changed, 16 insertions(+)
---
base-commit: 414c97c966b69e4a6ea7b32970fa166b2f9b9ef0
change-id: 20241127-qcs8300_dp-272c591c3aea

Best regards,
-- 
Yongxing Mou <quic_yongmou@quicinc.com>

