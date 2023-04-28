Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFD66F20EE
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 00:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C2310E172;
	Fri, 28 Apr 2023 22:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A542610E161;
 Fri, 28 Apr 2023 22:37:27 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33SLZsAV015460; Fri, 28 Apr 2023 22:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=3p15NS1SsiDVfgUqOOa3xRyCx2Wbmd2gK9pcK2qHbsg=;
 b=Svs+OgFgIc96V0XQrCIVPJcTP0pyFBMwSeXsBaxLOycnskdvs3dumOrZd70Mp4dNZwfV
 O/Jo4Z3Do9QRF2TGKunyt81BHhxTex8kt5OtgPgPxsaSkKrG4aJhp0EcjeG0W7AbzCsQ
 buxylIwA9EVecYXpNWvlqSJ60nF5uWOBWvyTDZTmlHAFJdV6AM9FerKciZMSvmtI/oy2
 IsPax7pGWxcAOqu+BZZ4AF9LwIWwi7/yPXQz9vY52JOsb2ZlArk7fpJznnGpGYtLPq0s
 8wp96VtZs3VAkLMnnLCYNhTyJdi9Symu40YUbowsgUDD3bfDo+ADO9BKfL0jpjMlFG+4 EA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q89kste0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 22:37:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33SMbNLP031363
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 22:37:23 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 28 Apr 2023 15:37:23 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 3/4] drm/msm/dpu: remove GC and IGC related code from dpu
 catalog
Date: Fri, 28 Apr 2023 15:36:45 -0700
Message-ID: <20230428223646.23595-3-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230428223646.23595-1-quic_abhinavk@quicinc.com>
References: <20230428223646.23595-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Q7HKJ9e0Kqv60DGn0d8DsYJbCo_QCWgl
X-Proofpoint-ORIG-GUID: Q7HKJ9e0Kqv60DGn0d8DsYJbCo_QCWgl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_08,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280188
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
Cc: quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Gamma Correction (GC) and Inverse Gamma Correction(IGC) is
currently unused. In addition dpu_dspp_sub_blks didn't even have an igc
member describing the block.

Drop related code from the dpu hardware catalog otherwise this becomes a
burden to carry across chipsets in the catalog.

changes in v3:
	- drop IGC related code from dpu_hw_catalog too
	- update commit text accordingly

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 10 ----------
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 5d994bce696f..791a6fc8bdbf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -91,7 +91,7 @@
 
 #define MERGE_3D_SM8150_MASK (0)
 
-#define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC) | BIT(DPU_DSPP_GC)
+#define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC)
 
 #define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
 
@@ -449,8 +449,6 @@ static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
 static const struct dpu_dspp_sub_blks msm8998_dspp_sblk = {
 	.pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
 		.len = 0x90, .version = 0x10007},
-	.gc = { .id = DPU_DSPP_GC, .base = 0x17c0,
-		.len = 0x90, .version = 0x10007},
 };
 
 static const struct dpu_dspp_sub_blks sc7180_dspp_sblk = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 71584cd56fd7..1230739e37d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -127,13 +127,9 @@ enum {
 /**
  * DSPP sub-blocks
  * @DPU_DSPP_PCC             Panel color correction block
- * @DPU_DSPP_GC              Gamma correction block
- * @DPU_DSPP_IGC             Inverse gamma correction block
  */
 enum {
 	DPU_DSPP_PCC = 0x1,
-	DPU_DSPP_GC,
-	DPU_DSPP_IGC,
 	DPU_DSPP_MAX
 };
 
@@ -398,7 +394,6 @@ struct dpu_caps {
  * @hsic:
  * @memcolor:
  * @pcc_blk:
- * @igc_blk:
  * @format_list: Pointer to list of supported formats
  * @num_formats: Number of supported formats
  * @virt_format_list: Pointer to list of supported formats for virtual planes
@@ -419,7 +414,6 @@ struct dpu_sspp_sub_blks {
 	struct dpu_pp_blk hsic_blk;
 	struct dpu_pp_blk memcolor_blk;
 	struct dpu_pp_blk pcc_blk;
-	struct dpu_pp_blk igc_blk;
 
 	const u32 *format_list;
 	u32 num_formats;
@@ -433,22 +427,18 @@ struct dpu_sspp_sub_blks {
  * @maxwidth:               Max pixel width supported by this mixer
  * @maxblendstages:         Max number of blend-stages supported
  * @blendstage_base:        Blend-stage register base offset
- * @gc: gamma correction block
  */
 struct dpu_lm_sub_blks {
 	u32 maxwidth;
 	u32 maxblendstages;
 	u32 blendstage_base[MAX_BLOCKS];
-	struct dpu_pp_blk gc;
 };
 
 /**
  * struct dpu_dspp_sub_blks: Information of DSPP block
- * @gc : gamma correction block
  * @pcc: pixel color correction block
  */
 struct dpu_dspp_sub_blks {
-	struct dpu_pp_blk gc;
 	struct dpu_pp_blk pcc;
 };
 
-- 
2.40.1

