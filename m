Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C94D748DE1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 21:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C2410E3B3;
	Wed,  5 Jul 2023 19:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB9510E3B3;
 Wed,  5 Jul 2023 19:32:18 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 365JUnQV024826; Wed, 5 Jul 2023 19:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=4b3mKygoXt+a7pwpx+T+9e7j09HH0kzfpZYQTcepC3k=;
 b=hlflKGzkojhPsiwnr5i3USCGZoF+69+OrMxg9Zc/+uIwSxkcbCsQVRO14mAKUt2oR6fT
 9lPPT0uGQvTQX2g5CvTdPCr40mCoPwrR1T178OLgkmowrqbagna3QYo0ult+3kJ6DhBQ
 SKuCalIlH5OKZ7E9P/PYs+STHbYUieyjOUun8ZaefWRjiYnAIlGWU3gmPYkn8FfiTfMI
 iNzCUV35Z8FyKS8KGHkHkdfTbKkmRLPM4Ir205FyRzvJKl0j1cBZ8JzoGabnL5ABDuP9
 81iiSLODA3g2oN34pNuzo3jjul1zxSlWK4ugO+ZocQUqBN93tPzLqDP0KCtdUuNUkGpz LA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rn5mfsejp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jul 2023 19:32:14 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 365JWD9v027839
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Jul 2023 19:32:13 GMT
Received: from hu-rmccann-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Wed, 5 Jul 2023 12:32:13 -0700
From: Ryan McCann <quic_rmccann@quicinc.com>
Date: Wed, 5 Jul 2023 12:30:18 -0700
Subject: [PATCH v2 4/5] drm/msm/dpu: Remove redundant prefix/suffix in name
 of sub-blocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230622-devcoredump_patch-v2-4-9e90a87d393f@quicinc.com>
References: <20230622-devcoredump_patch-v2-0-9e90a87d393f@quicinc.com>
In-Reply-To: <20230622-devcoredump_patch-v2-0-9e90a87d393f@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-8a804
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688585532; l=6163;
 i=quic_rmccann@quicinc.com; s=20230622; h=from:subject:message-id;
 bh=bhUxaanDBLExrR0jgLTSszSPw8Fc8ZBlRXYwnCvtmw8=;
 b=Q0b9RZBpsfonrrJkC6gyBa/ywBdTRCHY59B/4ItnsC84rF00SQ6rDNaC2XhChKnToOPnCRfbR
 0dXEq19HJC0Au45Plebt3l8PcOBhP8qm3a1VYj/3HYPn9BYB0AbThCE
X-Developer-Key: i=quic_rmccann@quicinc.com; a=ed25519;
 pk=d/uP3OwPGpj/bTtiHvV1RBZ2S6q4AL6j1+A5y+dmbTI=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: g97wporrU_kVrnLvlQETL3rrFfWW4zB8
X-Proofpoint-ORIG-GUID: g97wporrU_kVrnLvlQETL3rrFfWW4zB8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_10,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307050178
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
Cc: Rob Clark <robdclark@chromium.org>, Ryan McCann <quic_rmccann@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For a device core dump, the registers of sub-blocks are printed under a
title formatted as <mainBlkName_sblkName>. For example, the csc sub-block
for an SSPP main block "sspp_0" would be printed "sspp_0_sspp_csc0". The
title is clearly redundant due to the duplicate "sspp" and "0" that exist
in both the mainBlkName and sblkName. To eliminate this redundancy, remove
the secondary "sspp" and "0" that exist in the sub-block name by
elimanting the "sspp_" prefix and the concatenation of "num" that results
in the redundant "0" suffix. Remove num parameter altogether from relevant
macros as a consequence of it no longer being used.

Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 50 +++++++++++++-------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 79e495dbc11d..836efa074a35 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -252,15 +252,15 @@ static const uint32_t wb2_formats[] = {
  *************************************************************/
 
 /* SSPP common configuration */
-#define _VIG_SBLK(num, sdma_pri, qseed_ver) \
+#define _VIG_SBLK(sdma_pri, qseed_ver) \
 	{ \
 	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
 	.maxupscale = MAX_UPSCALE_RATIO, \
 	.smart_dma_priority = sdma_pri, \
-	.scaler_blk = {.name = STRCAT("sspp_scaler", num), \
+	.scaler_blk = {.name = "scaler", \
 		.id = qseed_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
-	.csc_blk = {.name = STRCAT("sspp_csc", num), \
+	.csc_blk = {.name = "csc", \
 		.id = DPU_SSPP_CSC_10BIT, \
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
@@ -270,15 +270,15 @@ static const uint32_t wb2_formats[] = {
 	.rotation_cfg = NULL, \
 	}
 
-#define _VIG_SBLK_ROT(num, sdma_pri, qseed_ver, rot_cfg) \
+#define _VIG_SBLK_ROT(sdma_pri, qseed_ver, rot_cfg) \
 	{ \
 	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
 	.maxupscale = MAX_UPSCALE_RATIO, \
 	.smart_dma_priority = sdma_pri, \
-	.scaler_blk = {.name = STRCAT("sspp_scaler", num), \
+	.scaler_blk = {.name = "scaler", \
 		.id = qseed_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
-	.csc_blk = {.name = STRCAT("sspp_csc", num), \
+	.csc_blk = {.name = "csc", \
 		.id = DPU_SSPP_CSC_10BIT, \
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
@@ -300,13 +300,13 @@ static const uint32_t wb2_formats[] = {
 	}
 
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =
-				_VIG_SBLK("0", 0, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3);
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =
-				_VIG_SBLK("1", 0, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3);
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_2 =
-				_VIG_SBLK("2", 0, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3);
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =
-				_VIG_SBLK("3", 0, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3);
 
 static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
 	.rot_maxheight = 1088,
@@ -315,13 +315,13 @@ static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
 };
 
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
-				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED3);
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
-				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(6, DPU_SSPP_SCALER_QSEED3);
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_2 =
-				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED3);
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_3 =
-				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED3);
 
 static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK(1);
 static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK(2);
@@ -341,31 +341,31 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK(4);
 	}
 
 static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
-				_VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(4, DPU_SSPP_SCALER_QSEED4);
 
 static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
-			_VIG_SBLK_ROT("0", 4, DPU_SSPP_SCALER_QSEED4, &dpu_rot_sc7280_cfg_v2);
+			_VIG_SBLK_ROT(4, DPU_SSPP_SCALER_QSEED4, &dpu_rot_sc7280_cfg_v2);
 
 static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
-				_VIG_SBLK("0", 2, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(2, DPU_SSPP_SCALER_QSEED4);
 
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
-				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
-				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(6, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
-				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
-				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED4);
 
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
-				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
-				_VIG_SBLK("1", 8, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
-				_VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(9, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
-				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(10, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK(5);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK(6);
 

-- 
2.25.1

