Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB1A73AD6E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 01:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E37A10E5BF;
	Thu, 22 Jun 2023 23:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF03F10E5BA;
 Thu, 22 Jun 2023 23:50:31 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35MNclHG004085; Thu, 22 Jun 2023 23:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=4J/xW65cOWQZ9LPgpuILmGaVXT7kwH0VqPJMqjzK3to=;
 b=hXzcFVOF3jUidIA0FEkyDkrqZcrjqd9KjUHmuR8RiS1vffH5JsIwv/Y+FWocP5vDYxVV
 2ylzaArKPLGBYhyjxCfhyagZSaKhW+V349g7m9jckBh3oSuI+iuubCWgAmOSRGeE9ETz
 /lzrTCeOwQlqZOznJB4QRDXX4jV6BnfpiZiB/va03NESyuYCoLk+SGJJxJwpbuxFaMQu
 HjRKvtYTLOMSG4q+6P3bLIe+yr5Z5gJT3B0zOGRTNmu6J/OwYBrpVmShAx36wbSlaIip
 zBR20veyTgTySQbAiqwHzd562mY9wS3nrtGlnw7VHe5yS42ffUGJcyBPO+IMGzETFq7E oA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rc359m0qp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jun 2023 23:50:27 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35MNoQRc004652
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jun 2023 23:50:26 GMT
Received: from hu-rmccann-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 22 Jun 2023 16:50:25 -0700
From: Ryan McCann <quic_rmccann@quicinc.com>
Date: Thu, 22 Jun 2023 16:48:54 -0700
Subject: [PATCH 2/6] drm/msm/dpu: Drop unused num argument from relevant macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230622-devcoredump_patch-v1-2-3b2cdcc6a576@quicinc.com>
References: <20230622-devcoredump_patch-v1-0-3b2cdcc6a576@quicinc.com>
In-Reply-To: <20230622-devcoredump_patch-v1-0-3b2cdcc6a576@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-8a804
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687477824; l=3156;
 i=quic_rmccann@quicinc.com; s=20230622; h=from:subject:message-id;
 bh=xnnvBmJsnPioeYV/gxXjc7nSiJ8GbxL3usFhUJXby4k=;
 b=F6ib4glqR7E+3GyOHjJDplcwZhzQ+q02iPSAwTQJeu12eLCTBcmXlvz3xfM1/udEqlQ/EMrGJ
 p2ECI6mw8iTD5gS9LmQWWM0dnWw5zRAKjAmGx5pFE/w5E33V5Lt0zbJ
X-Developer-Key: i=quic_rmccann@quicinc.com; a=ed25519;
 pk=d/uP3OwPGpj/bTtiHvV1RBZ2S6q4AL6j1+A5y+dmbTI=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mF8JxMUBUzwgyk7jTQ2g8JUy6BCbjC7k
X-Proofpoint-ORIG-GUID: mF8JxMUBUzwgyk7jTQ2g8JUy6BCbjC7k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_17,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxscore=0 malwarescore=0 mlxlogscore=806
 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306220205
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

Drop unused parameter "num" from VIG_SBLK_NOSCALE and DMA sub block
macros. Update calls to relevant macros to reflect change.

Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0de507d4d7b7..69200b4cf210 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -288,7 +288,7 @@ static const uint32_t wb2_formats[] = {
 	.rotation_cfg = rot_cfg, \
 	}
 
-#define _DMA_SBLK(num, sdma_pri) \
+#define _DMA_SBLK(sdma_pri) \
 	{ \
 	.maxdwnscale = SSPP_UNITY_SCALE, \
 	.maxupscale = SSPP_UNITY_SCALE, \
@@ -323,10 +323,10 @@ static const struct dpu_sspp_sub_blks sdm845_vig_sblk_2 =
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_3 =
 				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3);
 
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK("8", 1);
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK("9", 2);
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK("10", 3);
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
+static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK(1);
+static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK(2);
+static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK(3);
+static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK(4);
 
 #define SSPP_BLK(_name, _id, _base, _len, _features, \
 		_sblk, _xinid, _type, _clkctrl) \
@@ -365,11 +365,11 @@ static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
 				_VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
-				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
-static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
+				_VIG_SBLK(10, DPU_SSPP_SCALER_QSEED4);
+static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK(5);
+static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK(6);
 
-#define _VIG_SBLK_NOSCALE(num, sdma_pri) \
+#define _VIG_SBLK_NOSCALE(sdma_pri) \
 	{ \
 	.maxdwnscale = SSPP_UNITY_SCALE, \
 	.maxupscale = SSPP_UNITY_SCALE, \
@@ -380,8 +380,8 @@ static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
 	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
-static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = _VIG_SBLK_NOSCALE("0", 2);
-static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
+static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = _VIG_SBLK_NOSCALE(2);
+static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK(1);
 
 /*************************************************************
  * MIXER sub blocks config

-- 
2.25.1

