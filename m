Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E190BA9D23B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 21:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC2B10E9BF;
	Fri, 25 Apr 2025 19:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6HDHb//";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF2410E9BE
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:20 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK27e004881
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 a9pjFcwbQ6d4uQNGXNPU6ossuRXldL+ieO315jgWQ6M=; b=p6HDHb//EDvbSBVq
 I/hqYpHGoi4XV16zcHF0dkOf8oBmrCR8aY4cuFu2lLzAxlTEwhR6JxKDmafxmyuU
 EhamlzLPBOxGa6/jVkUL3bTFUtL33R9CeeaEHF+jvw/uHLh2xkLoUEZiukONUNtx
 Vh4LOyPtY7mVIYaKCUZ2wEliV++DrgKRqcM10EJOAmdNvLtm20S57x4YtePIFAcq
 e9+/FzOhPMRuHZoSqvImQIgRo27qf7mMqTlDkoG5rrYes0X7AFv553+Ll/FqeGN5
 2rCLWjoe4UZ15QDsFKMy20Q16cFjAlw2+f/iMwQE3916qHWTMSgCAGkTcWLPtPgZ
 WSS6RA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0a5ug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f2b3e4c176so55819976d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 12:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745610559; x=1746215359;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a9pjFcwbQ6d4uQNGXNPU6ossuRXldL+ieO315jgWQ6M=;
 b=WgBcHwzoQ7L9iGkTCBDyB5If0uJGw9//HNPAiccClE833X/3ut9mZAjMud+fmLJqdi
 8lzpyWYTmFJG6yMSKMlnGhLKjXnQI5sXyD3kZbGkDXGc2eZbG47AEeewGBil8bY8+RUW
 ZKkm2Ou287XxgM2wtB1YynriXwv7xRlYS2Ozlh8hFQ+bxJ+U7ZnhcFrQ+HJBFyuIFERs
 k1wDbSmW6x7/KE9yFW9BJQs/HHGEGSFM0Ule+5gaG3KxD+A57N16d3A6zWnJzsrW3Vx2
 5jM1xR7xcxE2+QFBR8/rIOJvx40gF2PPAyBQefKJ2HnhSvOcOKs1HbZcmwXbQ74nfAo6
 7/jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF6deWgFEPeyYNGcsHJAsFLaR89D63J0o6yuWoRU/nU8mBZ6EcGBwdVf0pRtNY4mSb8kyXLzkKe+s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybUX5Xrzzrudo9dA6nXMnkqam9sFOmL3nD1W9ktL7Ev8clgw0R
 rMRIZD6FJRmioHfqqK2Rj2EI0+iHX2tAFTDYCjc2ivqPBQCB5Mfex54TrtST6XRnxn7yGGaImaw
 QkrpcJSpXb+4ruqSzgTvOg92ZR3DEkPdfxkc4AUKwedjVb8BnqBrLOy3MOKcP9MxOLnI=
X-Gm-Gg: ASbGncvDlgqs5h/lB7g9VL9JqqW4izQxxl6A21aSO9B7nJ5FvT8Oftln+11EcZ0YVUy
 znv3nKz4/Y5k3ccg8yFO8IFF0zxihusugAQCt4p94uP5F1sSyenFHXfYm6MsQF7hBRn5Q3uiZVp
 t9FcRR5L7thxhRSL9DZkOrt4INODz2QVImKAsJasrsyte+AX2FOxeqIfp2buH5+2t1ma8UEUUzm
 Aw78DSByPfU8nc0jBbC6T5/1MgiUZ1+4zjRuLYoFC11lHSOlWfhW3cauQLZg3pTh+Cg1UKAtrAY
 mAj3qq1/CWy7LRy/U0jKWYEneumu4cXxRf55NuTV2jg7SibMS6AXykpxd0pN3hBCfC86p/KgPkL
 r+sjDEHSTfqRi7qUq5EQ7ehG3
X-Received: by 2002:a05:6214:29ca:b0:6f0:e2e1:50b4 with SMTP id
 6a1803df08f44-6f4cba51be4mr69387696d6.35.1745610559117; 
 Fri, 25 Apr 2025 12:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqo8lIulG0dOvKsgER6OtZ+TgO9vrJCPId0DQSeGksp2OqiP+WfRkkD63nepXAm0dyxJWWzQ==
X-Received: by 2002:a05:6214:29ca:b0:6f0:e2e1:50b4 with SMTP id
 6a1803df08f44-6f4cba51be4mr69387276d6.35.1745610558751; 
 Fri, 25 Apr 2025 12:49:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb258b7sm725313e87.22.2025.04.25.12.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 12:49:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:49:11 +0300
Subject: [PATCH v2 4/5] drm/msm/dpu: enable SmartDMA on SM8550
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dpu-rework-vig-masks-v2-4-c71900687d08@oss.qualcomm.com>
References: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
In-Reply-To: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3076;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FNmRnyT3eow0gzV4hp6sl5gj/DZ/zTj42D8dGvvjRGA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC+c2Hv1ovnVDqdxrC5BedSPh5Ro8hHW5+EDoF
 6IEpQ/48xqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvnNgAKCRCLPIo+Aiko
 1fJLB/9hTRaveuHQ+zTcJi8Ao6BwDCfle6A5QscWvAbkGLF/ddC9p3z0TCVyo6Y0IebU3Arkw5Y
 r+nBzqOPYjEsUzy4k17EESJhUKzSzv/cIStLZbD7NYtR8K/DJJ6DmMWql+aFY4mx6UWGtAYNHik
 rjojGqOrdI047199IGbvXrUBTwO8/jYq5+Nzk+f3rYcTD5S8mM7OojGoL7H1gDjBKY28/yZD7XH
 D7pf7G9/KyALtVxQ9uCNAiNlW5yJ7eJbR167DseFYlYuu+mzZFeYjiegdLRgqq8Xzd/s9GA0r1J
 u7EU7QPzjbch3uZocnb94uXstPIiWfhvs9h6hg6Aj1OCfETp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX5TurzxsJzW3W
 iAeilNCMgWMYyBpFPRVac44Geu1b1vEtEB5VNCe3bdTdI9UeGvBvo5Rx4trVtCHgD+1TBzbt93I
 4j0qacRr5b4PBCQFacSaS6aZ2+nAVjUAb9c6VtVEGaO6COv7kng0Y8A0vFzy00XSxkh84QmYHV4
 7GZY6JX1AHev92FeLa26HkCWBB2z4aPrd3u/sfFAL7QmQFHtVTs05+sUGK4haouAw1P7RFQRlkV
 s6hVjQNZK1mBJYMKRyZzVR4koczQFjg2yoepeH5zML38387GNI2d8IarJj+NnafOjyuZfPltqFU
 YqSW8rxJdp8hy2ThQNodryEpYvVlI9tE5Sb2EHEP5YQEDUACW0Lmltqe0gD7k8U9cOboNOasHuv
 vamgMxu3hpnK4g9SUhIeSqX65LF0t+GUXJAtChwHHRBu/l/+zQw+bsz+STSPnbGNoz2wKTJx
X-Proofpoint-GUID: qKzckLUAwB5ErFi2ovo1ue_jq9khuDd4
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680be73f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=kVj8X6nmCGut3nRlWRwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: qKzckLUAwB5ErFi2ovo1ue_jq9khuDd4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=891 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141
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

In order to support more versatile configuration of the display pipes on
SM8550, enable SmartDMA for this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 24f988465bf6ba8e3d3d2691534f0981f222fa27..1a156d2b714ffa6c16b2ae331704c1274dc0bbfa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -66,70 +66,70 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x344,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x344,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x344,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x344,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x344,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x344,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x344,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x344,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_12", .id = SSPP_DMA4,
 		.base = 0x2c000, .len = 0x344,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 14,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_13", .id = SSPP_DMA5,
 		.base = 0x2e000, .len = 0x344,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 15,
 		.type = SSPP_TYPE_DMA,

-- 
2.39.5

