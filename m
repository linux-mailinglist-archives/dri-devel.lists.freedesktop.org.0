Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6292E80002E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 01:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD9910E786;
	Fri,  1 Dec 2023 00:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F77510E786;
 Fri,  1 Dec 2023 00:26:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B10EbUt010867; Fri, 1 Dec 2023 00:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : to : cc; s=qcppdkim1;
 bh=TQuxclhsoOWYraeK4LJ7qRxMrWht+5yhos2PlOPoVCo=;
 b=f/+PGGhXOocTG7pb0ukhiAuBe2fui5Cerv6Bs9WfHX2rpHHh4bpKfe8NUbzs2yPrkDGd
 tvYQt+EmSv0OFfSO9EsxGXrY08B5KdvusP9p0fqKaqzHHAfEx1z78XgzSZpxUKxkXK15
 ao2IoaacSNBVeLR54TwLuUfRqJI5gmyMU6WYBN9/t7viZaJLA+fgOqkLBFKcgyrPlviQ
 PBJfQQjwJZkem1II9gSjh2wPM9oxAFkD1h/BabLg7ZfZ83Cso3DUnCv69ztGAyNnceZr
 G8GFzc8+x8A1GllnVfS8K89tWNU90IWGlCGIZYVeZkrokgZHzpk3H+a5b64ChDrgmWKv ew== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upvm1scpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 00:26:43 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B10QgLV028277
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Dec 2023 00:26:42 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 30 Nov
 2023 16:26:41 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
Date: Thu, 30 Nov 2023 16:26:41 -0800
Subject: [PATCH] drm/msm/adreno: Fix A680 chip id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231130-adreno-a680-1-v1-1-a0798a23e557@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEAoaWUC/x2NQQrCQAwAv1JyNrDp0q36FfGQbaMNlFSyKELp3
 w0eZ2CYHZq4SoNrt4PLR5tuFkCnDqaF7SmoczD0qc9EOSHPLrYhl3NCwpIvI4085DoUiKZyE6z
 ONi1R2XtdQ75cHvr9T2734/gBGR1M23QAAAA=
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701390401; l=1159;
 i=quic_bjorande@quicinc.com; s=20230915; h=from:subject:message-id;
 bh=Ja1nxq0hj6FnxHX279dpWz5r3a+reUUr6ffAMBMBdsc=;
 b=q0pd9tZbmAFXcSrHIXJKREYCS+lPtnyBrJlTiUrG5r1qRt5QK+QjDN+sqZx1NN72GLl4EgJ5AUNF
 DFYEah9uANkKgtNz+yoZoyxNJ0hxB1dWr1oORIJrvgb26sZQpPMo
X-Developer-Key: i=quic_bjorande@quicinc.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: aRi7IJvwBUy6oE7h2Ph_gYR-Rakz4oD-
X-Proofpoint-GUID: aRi7IJvwBUy6oE7h2Ph_gYR-Rakz4oD-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 adultscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010000
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
Cc: Rob Clark <robdclark@chromium.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only A680 referenced from DeviceTree is patch level 1, which since
commit '90b593ce1c9e ("drm/msm/adreno: Switch to chip-id for identifying
GPU")' isn't a known chip id.

Correct the chip id to allow the A680 to be recognized again.

Fixes: 90b593ce1c9e ("drm/msm/adreno: Switch to chip-id for identifying GPU")
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index f62ab5257e66..2ce7d7b1690d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -464,7 +464,7 @@ static const struct adreno_info gpulist[] = {
 			{ 190, 1 },
 		),
 	}, {
-		.chip_ids = ADRENO_CHIP_IDS(0x06080000),
+		.chip_ids = ADRENO_CHIP_IDS(0x06080001),
 		.family = ADRENO_6XX_GEN2,
 		.revn = 680,
 		.fw = {

---
base-commit: 3cd3fe06ff81cfb3a969acb12a56796cff5af23d
change-id: 20231130-adreno-a680-1-639717a53b56

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>

