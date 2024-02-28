Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F5386B884
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 20:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7835D10E287;
	Wed, 28 Feb 2024 19:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="RIvtqqoL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3242810E287;
 Wed, 28 Feb 2024 19:47:52 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41SId338018907; Wed, 28 Feb 2024 19:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=qcppdkim1; bh=whxourV
 MeBw3kwOIKUI1wmUPTkxnfJ/I0Aau54gzUIc=; b=RIvtqqoLpqeWQ4wWovKxKad
 OyKMqSudYScHDDXSuxLHL/FZ5fsCpljz2DW5ss68mN7M0H2qN/iUpe6obLF/yMyF
 RVIUQCfgED65tu3lifQmzi0R+9KI/f3h1fRK10EKOoU2z3M6HeHOqVxBXx4bMdMX
 GFdDGa7scfOp979GyEtEzmOafdO7PCIDS1HYCdyvlO7ZHzBhagQKzqJURdQi3d9p
 3K6ulTJwGPCqlL5gPRWGjj5XJ2HMAxjQj7j/W8F9JnxjiYp458wTLEilyNFWv0uV
 JNmB0E8nG43n4LKiZ+peDUt4rKF/vXuShaFfecTfNcE77PEo0D6h01VxIdcqgYw=
 =
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wja0eg66j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Feb 2024 19:47:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41SJlkRa022143
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Feb 2024 19:47:46 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 28 Feb 2024 11:47:46 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <quic_parellan@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] drm/msm/dpu: drop unused dpu_kms from interface
 initialization
Date: Wed, 28 Feb 2024 11:47:29 -0800
Message-ID: <20240228194730.619204-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: u1ew2RsuXItpJHf9_6JmdetIjdjS_gRq
X-Proofpoint-ORIG-GUID: u1ew2RsuXItpJHf9_6JmdetIjdjS_gRq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_08,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402280155
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

dpu_kms seems unused while initializing DSI, HDMI and DP through
their respective _dpu_kms_initialize_* functions.

Hence lets drop the parameter altogether.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 2af62d8fa9a7..ab924ac78c9b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -494,8 +494,7 @@ static void dpu_kms_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
 }
 
 static int _dpu_kms_initialize_dsi(struct drm_device *dev,
-				    struct msm_drm_private *priv,
-				    struct dpu_kms *dpu_kms)
+				   struct msm_drm_private *priv)
 {
 	struct drm_encoder *encoder = NULL;
 	struct msm_display_info info;
@@ -558,8 +557,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 }
 
 static int _dpu_kms_initialize_displayport(struct drm_device *dev,
-					    struct msm_drm_private *priv,
-					    struct dpu_kms *dpu_kms)
+					   struct msm_drm_private *priv)
 {
 	struct drm_encoder *encoder = NULL;
 	struct msm_display_info info;
@@ -592,8 +590,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 }
 
 static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
-				    struct msm_drm_private *priv,
-				    struct dpu_kms *dpu_kms)
+				    struct msm_drm_private *priv)
 {
 	struct drm_encoder *encoder = NULL;
 	struct msm_display_info info;
@@ -671,19 +668,19 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
 	int rc = 0;
 	int i;
 
-	rc = _dpu_kms_initialize_dsi(dev, priv, dpu_kms);
+	rc = _dpu_kms_initialize_dsi(dev, priv);
 	if (rc) {
 		DPU_ERROR("initialize_dsi failed, rc = %d\n", rc);
 		return rc;
 	}
 
-	rc = _dpu_kms_initialize_displayport(dev, priv, dpu_kms);
+	rc = _dpu_kms_initialize_displayport(dev, priv);
 	if (rc) {
 		DPU_ERROR("initialize_DP failed, rc = %d\n", rc);
 		return rc;
 	}
 
-	rc = _dpu_kms_initialize_hdmi(dev, priv, dpu_kms);
+	rc = _dpu_kms_initialize_hdmi(dev, priv);
 	if (rc) {
 		DPU_ERROR("initialize HDMI failed, rc = %d\n", rc);
 		return rc;
-- 
2.34.1

