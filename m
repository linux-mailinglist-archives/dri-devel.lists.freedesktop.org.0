Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CD8A0688E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 23:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA4C10ECA0;
	Wed,  8 Jan 2025 22:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="k4BK9X8m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7466110EC9E;
 Wed,  8 Jan 2025 22:43:15 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508Ih0L4008331;
 Wed, 8 Jan 2025 22:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ngjlq6XMiYe36MvN4diWa1xHuSQJP9M/mpn9cKbmBWc=; b=k4BK9X8mLVJdUv18
 HLydOBoHSw0ebAoxK+/zCJhRNlAXX0zHCwyBfneS983d5uvPKvamjIlpsskZ3wH1
 6lRiEghj6ivqLLFIW2u1MOn3wUVzO2StXwJHMF2aCslrUDPg0888hIQdPIv78XKO
 SwXnjtKSNayNag79mD4OhchdVAVd4Kl2pogU7LMLPfa6XI36yu1PgaKP2d0WZbyo
 Khp8c0Svs2An6DpcpdFUPxggCvWCufI890a4OyzsQjNjPanllEZ8l3+ki1zi5VCq
 QzAMg7rEQYt63pA1odygb9Zs2+sIvtRVuX9fUOaBIuSBF1UFRTG1EWL1Dkbo5A5E
 XMsPMA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441xvnrfrg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jan 2025 22:43:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508MhAYh031469
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Jan 2025 22:43:10 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 14:43:05 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Thu, 9 Jan 2025 04:12:39 +0530
Subject: [PATCH RFC 2/4] dt-bindings: power: qcom,rpmpd: add Turbo L5
 corner
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-x1e-speedbin-b4-v1-2-009e812b7f2a@quicinc.com>
References: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
In-Reply-To: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736376174; l=814;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=MVGmzpqNDpSBUrycPTIpKKCykWrSDGJIT8p/a/z9ckE=;
 b=HHtWlFZMjLVxzdrUeURR4dTtiaxKsxVAf4Pap7cBx47TovmMA21laNYbb65hOHH4n8ozOW01h
 VXX7MjALbEWDePVnwaqTA8v1blN3yalp3k8UxGLBgLajHv6LTHTTCO8
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Yk4d-q1-PXyO2QtbG5o92cNE0Qvh612n
X-Proofpoint-ORIG-GUID: Yk4d-q1-PXyO2QtbG5o92cNE0Qvh612n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=788 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080186
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

Update the RPMH level definitions to include TURBO_L5 corner.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 include/dt-bindings/power/qcom-rpmpd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index df599bf462207267a412eac8e01634189a696a59..5bc4735fb3e6e06ec62a352e2d40503b01084fd8 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -240,6 +240,7 @@
 #define RPMH_REGULATOR_LEVEL_TURBO_L2		432
 #define RPMH_REGULATOR_LEVEL_TURBO_L3		448
 #define RPMH_REGULATOR_LEVEL_TURBO_L4		452
+#define RPMH_REGULATOR_LEVEL_TURBO_L5		456
 #define RPMH_REGULATOR_LEVEL_SUPER_TURBO 	464
 #define RPMH_REGULATOR_LEVEL_SUPER_TURBO_NO_CPR	480
 

-- 
2.45.2

