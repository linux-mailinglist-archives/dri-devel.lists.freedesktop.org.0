Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D9A809B57
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 06:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF8710E9E6;
	Fri,  8 Dec 2023 05:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B6C10E9E3;
 Fri,  8 Dec 2023 05:07:10 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B84hBbE011864; Fri, 8 Dec 2023 05:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=qufTH3tvzRf/H9h1z2QwfvJTD84GSipvatU1W8BM0J8=;
 b=KxNqKvFRbxHB10JkoAR5zPtZGoE6pdwR/9RjMAeKYGM1+Tf0/Qik9j8wD8kbAH0gzevi
 ck6AOjWQxWh2JvBnvFlLbIqUGsPKabPXLfwRb6lv1JB2mQU1PR++W1Rvmx7zDElht967
 iwfEs6jv13/26p3a7rdy4t1xTifaxyn5a5LZVO6F5auLilPvI2vYFmXB6OKVqr/9ZzuK
 CLo48XNMX8DLB/jienQMgPuPE+UzkoCj5ENVMb4YYYRZZxtcDFQH9+tGqkEHehgREpvf
 mYnWbJ7PbLcpj0eecusxQ9QueOrNiM39hCtacgGitFy3RBHkrzl8BSIatFUv6WQ8/EnF hQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uu8p0b0b1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Dec 2023 05:07:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8577Af006838
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 8 Dec 2023 05:07:07 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 7 Dec 2023 21:07:06 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
Subject: [PATCH v2 05/16] drm/msm/dpu: add cdm blocks to sc7280 dpu_hw_catalog
Date: Thu, 7 Dec 2023 21:06:30 -0800
Message-ID: <20231208050641.32582-6-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BDrhApKgYejpcaE-3uzf3JPZODBCc6xT
X-Proofpoint-ORIG-GUID: BDrhApKgYejpcaE-3uzf3JPZODBCc6xT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080038
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
Cc: quic_jesszhan@quicinc.com, quic_parellan@quicinc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add CDM blocks to the sc7280 dpu_hw_catalog to support
YUV format output from writeback block.

changes in v2:
	- remove explicit zero assignment for features
	- move sc7280_cdm to dpu_hw_catalog from the sc7280
	  catalog file as its definition can be re-used

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c      | 10 ++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      | 13 +++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h         |  5 +++++
 4 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 209675de6742..19c2b7454796 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -248,6 +248,7 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
 	.mdss_ver = &sc7280_mdss_ver,
 	.caps = &sc7280_dpu_caps,
 	.mdp = &sc7280_mdp,
+	.cdm = &sc7280_cdm,
 	.ctl_count = ARRAY_SIZE(sc7280_ctl),
 	.ctl = sc7280_ctl,
 	.sspp_count = ARRAY_SIZE(sc7280_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index d52aae54bbd5..1be3156cde05 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -426,6 +426,16 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
 	.ctl = {.name = "ctl", .base = 0xF80, .len = 0x10},
 };
 
+/*************************************************************
+ * CDM sub block config
+ *************************************************************/
+static const struct dpu_cdm_cfg sc7280_cdm = {
+	.name = "cdm_0",
+	.id = CDM_0,
+	.len = 0x228,
+	.base = 0x79200,
+};
+
 /*************************************************************
  * VBIF sub blocks config
  *************************************************************/
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index e3c0d007481b..ba82ef4560a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -682,6 +682,17 @@ struct dpu_vbif_cfg {
 	u32 memtype[MAX_XIN_COUNT];
 };
 
+/**
+ * struct dpu_cdm_cfg - information of chroma down blocks
+ * @name               string name for debug purposes
+ * @id                 enum identifying this block
+ * @base               register offset of this block
+ * @features           bit mask identifying sub-blocks/features
+ */
+struct dpu_cdm_cfg {
+	DPU_HW_BLK_INFO;
+};
+
 /**
  * Define CDP use cases
  * @DPU_PERF_CDP_UDAGE_RT: real-time use cases
@@ -805,6 +816,8 @@ struct dpu_mdss_cfg {
 	u32 wb_count;
 	const struct dpu_wb_cfg *wb;
 
+	const struct dpu_cdm_cfg *cdm;
+
 	u32 ad_count;
 
 	u32 dspp_count;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index a6702b2bfc68..f319c8232ea5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -185,6 +185,11 @@ enum dpu_dsc {
 	DSC_MAX
 };
 
+enum dpu_cdm {
+	CDM_0 = 1,
+	CDM_MAX
+};
+
 enum dpu_pingpong {
 	PINGPONG_NONE,
 	PINGPONG_0,
-- 
2.40.1

