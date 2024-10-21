Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5779A923D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 23:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6575C10E5AE;
	Mon, 21 Oct 2024 21:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="FhNqj20G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8314B10E5AF;
 Mon, 21 Oct 2024 21:46:56 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LJ4XU5001068;
 Mon, 21 Oct 2024 21:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 i+7pe0Etglq+m7T6Gth0ydJMqi2ONqoXWMPn9BEw0xk=; b=FhNqj20GHVbOi8Ec
 z37NNb9eaBQSjjp3jOoCHlSyUXpDccghrJWFj9hGrXXDEPw7erGGeyoeBeKnO0bE
 v9rUSURpEQOFnNZqWtSJmRjibNg+qrpgtX5DVcjRv8lH9Mr/AEqLXhKV5qJycdA5
 JAeAl2PEkkh6jQh0nfIcMWjvmId6BzKn48Rni71mRqxnVv2Fux9LU45se7lTHT0F
 /4MOVQnXXKZb5csRhdtwZBc6zCckSbsB/oCZgjH0siSZ776RAQ9CPbgBt2yT5M2u
 13nQbXCLxKk3opwHMmniQSCd9qZYzP56GuDGsNRUffwj9JyabMtKwPF2T2qvl4sj
 qrVqkw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dmj122gt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2024 21:46:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LLknVf027547
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2024 21:46:49 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 14:46:43 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Tue, 22 Oct 2024 03:16:04 +0530
Subject: [PATCH v2 2/4] dt-bindings: display/msm/gmu: Add Adreno 663 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241022-a663-gpu-support-v2-2-38da38234697@quicinc.com>
References: <20241022-a663-gpu-support-v2-0-38da38234697@quicinc.com>
In-Reply-To: <20241022-a663-gpu-support-v2-0-38da38234697@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Puranam V G Tejaswi
 <quic_pvgtejas@quicinc.com>, Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729547190; l=853;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=5ty9yWB04krSKP6oXUH4fF0IPi/sf1FWkqRzOOo+nNo=;
 b=cxt+BsccR0s2Zw527V7TeTDxCV69cKVoqQp7tOUg7JZITmweJOjWY9aw3kKKX7RfEayb7Jvz0
 3uTUNny9owuAvCOmpBzo6V4efwaDueZePsPP4dsUIyLwJBsVm2cfDnH
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: y0WTXpwukYtZ6oAl1iBviPlP_GagWLXd
X-Proofpoint-ORIG-GUID: y0WTXpwukYtZ6oAl1iBviPlP_GagWLXd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210155
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

From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>

Document Adreno 663 GMU in the dt-binding specification.

Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index b1bd372996d5..ab884e236429 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -125,6 +125,7 @@ allOf:
             enum:
               - qcom,adreno-gmu-635.0
               - qcom,adreno-gmu-660.1
+              - qcom,adreno-gmu-663.0
     then:
       properties:
         reg:

-- 
2.45.2

