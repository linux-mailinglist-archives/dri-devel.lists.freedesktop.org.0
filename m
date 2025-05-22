Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82331AC13FB
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4145310E918;
	Thu, 22 May 2025 19:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhpLG+sq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCFB10E8C3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:13 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MI4tYh014544
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 520oFGgAVIHzUGYZ4vVIsy4Q9fI3b2Y3ZlgCsgK2yUc=; b=KhpLG+sqWiXdcRLC
 BWyw2duimxDxkvLngJpTkpPY/00G1Wg9QUTYOT4JgSn8PuRUl8i0VwbnBVX0Abeu
 95MCov5VQ2xoH997/J/6O4Y+ZK+X27769+ZYtwFZ3SRA2IAQgAtz38TIwFRLfIMK
 pcfKyxThBe/cpR6h8vGrE88eAyYNhVQuBaYm5IJmMCEYT3fJMiF3uZ2Zyjj0/0K9
 4eMPckThdV0Nbc/l1o4tLlkY/Fa34+ci7Uc8dM2gZBJHwVO6nYp8DYO/tBdTwMIa
 K3zP3LnByqwPNpN9nJytwAbZesjgGc/B5CS9JeMsALr0ftkQToaxNIPlFzxIPV7U
 TRAPCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c264dp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c54a6b0c70so751354185a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940643; x=1748545443;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=520oFGgAVIHzUGYZ4vVIsy4Q9fI3b2Y3ZlgCsgK2yUc=;
 b=APRZWfBLlZOK+QH9mQp3lgBZIFo5IvvqYa3z3kFE64v0FUa1FrkbEmNdKlkasp76s/
 maNOXAUiUHfgPbRdCGKiKMqe1QOG9IBwbnIRs27lhayE3Ozva2H7mOgqS5MdsiavL1pf
 hRjWXpgc8nsc4duJWwuzFhISgQZVH7xJw33X2Cv815FE/gU+WXJs/pXm9XMcXOnH0L8C
 xZoEi0FgjX4z7/aFaSUe8ci0FsAG+LodlpP8ItU1cpEacqHlrIdo5pLimoBt7tcZkMMl
 +BkFQzlUFutI3i/kZg5XBQiZ2SMxjs73p1hcf249ZeRWau+WJB4Zt8aSjAgIl2knlLdb
 YeOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJdCIQkj52wCoHOu24rH1HEfe5CTl2pz3Qi8IOu3UonheQbqA/TCC8haN2xmrGIg7UOXo720qKx/Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtbyVQ/40rmlgoAm3pVj+qAe5dinlDNnMZgKDYVp1D0/8WD0wN
 kmTel1qtRWPNj0j9SC0BSWzc2bOvF82FPa/i3WC8GdC9irCQ6qzsbZaLLlJbZlKARYqs1xh18Zy
 DUoSMJGQ3xIFi725VuUOJh73bsscoEHpMtQ9+xkCeJCXSm6qr6tH2PtIpY5WSKe4t+Wc4jn8=
X-Gm-Gg: ASbGncujHI0ho0//7iyZCBDuAkpKEdbGm3k+EeZ3FuoQrLrdS8w2mOBlFP5nd3K4G12
 MvzfumUK1WGWMufsnkWxQLIeoydcfAnE0BPsFpPHMi1TkKK5kwvps38OWPRDzfCECaKhCguQz/6
 kpRlkghnpQc1+VMCmoWFC4sfx3fHJVl2IHIIcXzSh4bM25nypljyBowEMWG+zBBssZjtbM208JR
 a13lIoXN+dcXqzLzc7mX9Qd95P89bq9qQr41cJMKc89iK5J3FGxb1e9N3kMgUEDH110dYrkbF/u
 ci/UPdQZ41LU36mNFzKL5/A6NuWIo0LcpXzkX5JsOmEu7QZYSeTsSBqZKQxtd+GyoHZv9G50Scj
 q9a5uKv8tejBhCev0SbfpcSM/
X-Received: by 2002:a05:620a:25c6:b0:7ca:df2c:e112 with SMTP id
 af79cd13be357-7cee326c929mr6911685a.45.1747940642881; 
 Thu, 22 May 2025 12:04:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzxquIY8HhNhqWCNPDmBe+j5FWdsACOdAapT72f/I0iKVGXenxbZCexTv1LjK3ndZUkz5kFw==
X-Received: by 2002:a05:620a:25c6:b0:7ca:df2c:e112 with SMTP id
 af79cd13be357-7cee326c929mr6906585a.45.1747940642445; 
 Thu, 22 May 2025 12:04:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:03:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:30 +0300
Subject: [PATCH v5 11/30] drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-11-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2781;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=R2pfqwbiufRy26Qr61RXns309s3JHy9UAH0Tqdyv7QE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T95UgV39T4ep2h1SCm0PcapDyxtsT11KWVj
 05MDktyaQCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/QAKCRCLPIo+Aiko
 1cgdCACccb8v+ZZmGPkgp6/u9+Y0q/lteJhu/gtu0N1swCzsf6TSIejBwxhN3hXB0QniQYc01ii
 olrJpEPhQMDysiBdkPLX4+xicK3NOFy5Fgw+HGLgxKfN4/4dYS6/OWqYcfBC5d0N/fGZ9mtqlBF
 CztSUKRQLC3wh7bkEjiPAcQwPn6N5Pcne2BobCrW7haNU4Fm3I2UMyoJ6l+N3gmED/NcyvjDQxj
 +mTdZnPle9yLLA9OII/QQGYyQ+rFKIZtNRxjs82zYbw0xFY5Yvkahq/OHH4M8ILYzdWcMMd6GTI
 zSCNJoTeh3AGRv5yiP/Q5A6tuXgQahGdG6LbOsOoAjpugz3O
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX3KheufxOtLnl
 y5Zpl7voEVkK8clpFwlsDLK7/Q9zic9xZLLwlbMbrnHcj51o+XCpMbBfTixe2LcPgKTarFviBoY
 tUxFz18+g4WfhS18F9eOFmZeRu7KnCujxtJA/60svFHm8tbkXCc1zAezwK0iQeXOEOH0ARyvOi5
 qOCuYZGYKA4OGAuo8rnYeOE024rNH4dmzZQdIoI8bCHKa7EScvNVHVUY09lApdL/v/Wlp3doAtp
 XokKMXFBUjdC27onSPV4cG9QtiuPyKs/7SchDL5UAFXmmxdexk2GfeDc8zXJyorXGNfuZbJ97dQ
 0iZAwVcGdfO+gVTYI/MG0q5/KNIvi5acWDz6bN2YbeuqP7tG8ypUbqq73ZxN4Kucu7IxSaoLImN
 UGcoSqJ2dCzERhgpUC++13fKHvsmVAHP9xlFHCXEg4i5daLeMZiD7gaLQzBXMvHDcrovkk0o
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682f752c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Yf7QHpgQJbPwferW474A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Lr8lO9nOVgIxl6QsrA4mK0r5O3EFjp5H
X-Proofpoint-GUID: Lr8lO9nOVgIxl6QsrA4mK0r5O3EFjp5H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_DSPP_SUB_BLOCK_FLUSH feature bit with the core_major_ver >= 7
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6fed2cce082c476c1f7f8ee683f2a6f3eeaa5231..19a859e2a1f80c2321789af4ec7c5e299f0fb873 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -105,8 +105,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_VM_CFG) | \
-	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	(BIT(DPU_CTL_VM_CFG))
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 82f04de6300eca7d05ece3ac880c26f3a56505b9..1e5fc1d5873975189a1759212b8a6c6078de22f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -133,13 +133,11 @@ enum {
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
- * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
 	DPU_CTL_VM_CFG,
-	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 772df53bfc4fcc2ff976f66ef7339be1ae3da8f4..edb82c81b0a449b1a7273fc258961b9447be8d9d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -804,7 +804,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
-	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;

-- 
2.39.5

