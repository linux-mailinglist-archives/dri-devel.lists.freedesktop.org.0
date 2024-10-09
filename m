Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADFC996E0F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 16:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1450E10E755;
	Wed,  9 Oct 2024 14:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Ns0Um4kN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8706E10E755;
 Wed,  9 Oct 2024 14:34:30 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499A4g9Y018408;
 Wed, 9 Oct 2024 14:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cXMYXoRqxxbUxxntgHhYjmOnELZxflAgQn0ucIuLG/A=; b=Ns0Um4kNno/Sl18y
 xQfNl9Xy6dxZkc2u4HxbBCWAKUvDgpVBVKBUBTvIk1R4R6aB7+SMOUf6CBU5tPk+
 CLeKfHq3bemABObQE1RnOwOERJFRpLCldx/uwTdJG1JNqs3Ie8eOpsNka0KcNNPN
 IXfXvAsd2dhWBYzLyF/v1KNvmUJQGZCWzqfB0+SIwxrPW8DIEh61mlnCY6FUGgc1
 r1cDO57SppIspIilbWKc4C006A92Ig9Tv7Uhtwj1pzZAOI3UQrBjP4m2Lc6JlKMi
 Stfp0X+IF1vfMZAqvmEm2RBCJ+TmBpc3fONY9j+l98HLJm3CJkPACcmLWnnZF+V+
 7ZVycQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425c8qtnas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Oct 2024 14:34:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 499EYNux018626
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 9 Oct 2024 14:34:23 GMT
Received: from hu-mahap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 07:34:17 -0700
From: Mahadevan <quic_mahap@quicinc.com>
Date: Wed, 9 Oct 2024 20:02:02 +0530
Subject: [PATCH v4 2/5] dt-bindings: display/msm: Document the DPU for SA8775P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241009-patchv3_1-v4-2-cd683a9ca554@quicinc.com>
References: <20241009-patchv3_1-v4-0-cd683a9ca554@quicinc.com>
In-Reply-To: <20241009-patchv3_1-v4-0-cd683a9ca554@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mahadevan <quic_mahap@quicinc.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Kalyan Thota <quic_kalyant@quicinc.com>,
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728484443; l=816;
 i=quic_mahap@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=vzTHbLrxrlJ7ao3FVTJJ6R3Ei7cWFCwzGyhEd8SBJcU=;
 b=Q0xvxQ7h4PXNh6KRJzFcrr/63CBZivGh3sv8oxQQTOshhmSXBaa14dry0uxrZgxjwiVpcm46s
 F+4HiCVuTVSDe/ga29K1UYGFT8IYQWH0cewNJSembaoiflvjerN8PBK
X-Developer-Key: i=quic_mahap@quicinc.com; a=ed25519;
 pk=Xc9CA438o9mZKp4uZ8vZMclALnJ8XtlKn/n3Y42mMBI=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jERfuxDj4nxEgk7r-yCeCBgAb4ACXOj4
X-Proofpoint-ORIG-GUID: jERfuxDj4nxEgk7r-yCeCBgAb4ACXOj4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410090089
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

Document the DPU for Qualcomm SA8775P platform.

Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index c4087cc5abbdd44885a6755e1facda767a16f35d..01cf79bd754b491349c52c5aef49ba06e835d0bf 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -14,6 +14,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
       - qcom,x1e80100-dpu
 

-- 
2.34.1

