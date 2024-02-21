Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093EB85ECB8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 00:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B72410E83E;
	Wed, 21 Feb 2024 23:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VEzI++Ye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FABB10E833;
 Wed, 21 Feb 2024 23:19:24 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41LNDTvZ007892; Wed, 21 Feb 2024 23:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=qcppdkim1; bh=2eizBs5dTICQFJ0kC5xhcBbiR4T++o8D+9i8vz7rPFY
 =; b=VEzI++Ye0Nqm3HFisHs9xKCsKQIhN25YvcdhbRo5IHWuX2lqKJzhCBhQKH8
 IXcTaXAYExDhW0Zw1B7kJilfnHnX++s1RGpxNMIcKdvGW/f/lqQcERDwdp89/Qqo
 eqT8KDHYlJ6IqHU4Atp5CtzivsWmEOzdUONT+nLPLzRvC/CELtPTRHBnU2rfYClC
 keVlrpnLoBUtcc+8a1sZdWD7iJI/uVR0FaDtcwr3iOBV3MD/WRaCbzApVH9IYgCM
 aAqOVlwII5ahod4hrdwznmbgvmG1dszT+B79ji4890VmPTyZU38bfQgqOHmh3lXo
 zEjF2GBXfb5KnkgolYHjjqe5nvA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wdsk4r3wf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Feb 2024 23:19:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41LNJF9C000680
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Feb 2024 23:19:16 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 15:19:16 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
Date: Wed, 21 Feb 2024 15:19:17 -0800
Subject: [PATCH 9/9] arm64: defconfig: Enable sc7280 display and gpu clock
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240221-rb3gen2-dp-connector-v1-9-dc0964ef7d96@quicinc.com>
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <cros-qcom-dts-watchers@chromium.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708557553; l=895;
 i=quic_bjorande@quicinc.com; s=20230915; h=from:subject:message-id;
 bh=56OqWybgCs19IkJ49voa+SmQ1q+KscDPvV6PyQOgUok=;
 b=J0P7RXfRDdo80b72LRdW9NBMjo9hh0HBgwaVR/ijIItqtBKAwGfuSeTUcHO2SgDZmxcia/V7V
 w/QyYh9VpTXBku9O6p8iCQLN0uVpDFjLKrhr1kjd3OMumT1zsDAJTTe
X-Developer-Key: i=quic_bjorande@quicinc.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: O8mQ62PEYRrxUb8ZfR3nLXDfJeB0XOgw
X-Proofpoint-GUID: O8mQ62PEYRrxUb8ZfR3nLXDfJeB0XOgw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-21_09,2024-02-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=952 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402210184
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

Enable the SC7280 display and gpu clock controllers to enable display
support on the QCS6490 RB3gen2.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b8adb28185ad..193d504041dd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1283,6 +1283,7 @@ CONFIG_QCM_DISPCC_2290=m
 CONFIG_QCS_GCC_404=y
 CONFIG_QDU_GCC_1000=y
 CONFIG_SC_CAMCC_8280XP=m
+CONFIG_SC_DISPCC_7280=m
 CONFIG_SC_DISPCC_8280XP=m
 CONFIG_SA_GCC_8775P=y
 CONFIG_SA_GPUCC_8775P=m
@@ -1290,6 +1291,7 @@ CONFIG_SC_GCC_7180=y
 CONFIG_SC_GCC_7280=y
 CONFIG_SC_GCC_8180X=y
 CONFIG_SC_GCC_8280XP=y
+CONFIG_SC_GPUCC_7280=m
 CONFIG_SC_GPUCC_8280XP=m
 CONFIG_SC_LPASSCC_8280XP=m
 CONFIG_SDM_CAMCC_845=m

-- 
2.25.1

