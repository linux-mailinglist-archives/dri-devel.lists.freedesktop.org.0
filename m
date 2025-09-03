Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1F8B41C36
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 12:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B0610E742;
	Wed,  3 Sep 2025 10:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/QqQPoo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D4F10E742
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 10:51:54 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583ACQUJ021319
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 10:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=F+ziFaz1rWekejWHwi36zb
 4EESMqmllljwggK91XpZk=; b=K/QqQPoo6L7LM1H6nl8lMTFZWvW6xzWSowgy/m
 NWbxamH9dcdq2ooC1kOE3oS09KoVnmSj/SpvlK7onzrWGGiLnwQ4h85yolOeP1p7
 wy38SLbirlYzY5+UlZaRsjuC9Epc59RncWQQQQi0xZ3ClL43tLqmx8Jsjvf8Yg0T
 oxaLOJksjUkQtdrAD53hawoCKsEYfFgjIAvPpQ9PfWd9Q019mMgYsy4ORy5Mg+oF
 6+IIYchejXUxxGDvbX+RjyR1r63WpWsL8pmWcDFZ/UIex893hMDN087UhGgboaPv
 bGRNooMxwvPLcG+PIr7YF/s492pa36Lb/Q4LPvnMjIeIQ7ZA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s3dx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 10:51:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-71fe8dd89c6so35652066d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 03:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756896713; x=1757501513;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F+ziFaz1rWekejWHwi36zb4EESMqmllljwggK91XpZk=;
 b=JrNg5fDFm4ZaNZbjJaWUfdFSkBT9vlm1w+BhrqoMUz+gFVLBKnmeksgJ5fARrrvABU
 FO05Hes8/wfbOdcHAMTXCB+R2LQt3zZ851H+LR0YYSOCiOPgNdZxB0zxdx+lTJfpg9i+
 WzLG3+QZHUHN4nMCJml6tWIXEChpxozGKiiJPFNZgL7Z/pgbmpZd1k/BWiT2POiZzUvG
 1g+L2m0wLkNYCaKbopXtQQXhsigWKPEn/MI6X+NhzipwCqkY40nf3TGo9VyYCQy7kk69
 0AsrudZ86YSV1hIY12afy4GluDtu4i/ubgM4RWUxt43k0v9d1j4Zr+Z2ig70TP1O9B6v
 8YJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjipYpB60m/FoahCmyDtDqMd1tuY0SdUMvCWe83/TUIdRwm08/cCX0ruKtLwSW6e56ZiZ72kTHvvA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy60IQL5x3YruTGbcNIegIanulNjbXzBvpRixYhoLdn7YsOdKHN
 ZZ12Z060eIKOgClK30hXGnD2W5wFKDrxRa8KstViWizDAv1Zctrg37liemsAPX1TLbEtgCd60pw
 GBKs3R3iUxHMCKFY8o0B2TXx/4SM3TN3i+AtpbJXEiCLBsyX+4v4g4RvlsJl1Hg6W5QZ48jc=
X-Gm-Gg: ASbGncsMMpVmOfoEpFmhIicjSBMk0X+FT+vKaPU8NkAtgqMuljqBbLNBQUB6PxKoKBN
 ythzwbA8cNJL4pXsnOHSpq+y+LOffTzU2vxy/4Yp3n4ryNbBlgADh2FHiMobqrgqDkvWXhCuLdo
 uEY8rVFYuBTegNu1A2YMQ+G+8dgmFA3Thn8VEYo+dU+aIoSshi9vws+EwClBPxNl1yfMh5XV7zq
 ocY/1TDVvnWqYg8QEgKgbVZctdQtK5g7Y/Vdepl5EZB0luU2L8FZxMIqc6OoZZVUFc1OoT9fOO3
 x9vL3ggxAckUW4CvY7pO8cWxu1/WdRGPGujrsANiPJpcM6iKT3VDtWR4WhFOOZOaXCA8staOVqU
 UAbmF0seZUOe/68p8DvlwrB3nwPOH8DCW/qIl4eZcvC8w5HFtvUnQ
X-Received: by 2002:ad4:5c64:0:b0:70d:f0ff:342d with SMTP id
 6a1803df08f44-70fac6f6f89mr193125576d6.14.1756896712962; 
 Wed, 03 Sep 2025 03:51:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+oE8bnboYguqZQN5BC61OgK8HvWDhBjVq/4qLeNHb+8IGeU7beHO5wd+DfDZC2hphZGhD1w==
X-Received: by 2002:ad4:5c64:0:b0:70d:f0ff:342d with SMTP id
 6a1803df08f44-70fac6f6f89mr193125256d6.14.1756896712477; 
 Wed, 03 Sep 2025 03:51:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f5032df6sm9373431fa.39.2025.09.03.03.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 03:51:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/4] drm/msm: drm_gpuvm leftovers
Date: Wed, 03 Sep 2025 13:51:48 +0300
Message-Id: <20250903-msm-no-iommu-v2-0-993016250104@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMQduGgC/3WMwQ6CMBBEf4Xs2SVtEaue/A/DodZVNrEtdoVoC
 P9u5e5lkjeTeTMIZSaBYzVDpomFUyxgNhX43sU7IV8Lg1GmVVbtMEjAmJBTCCN63RptnCLrPJT
 LkOnG71V37gr3LK+UP6t90r/2j2jSqPBAe2O3l0b5pjklkfo5uocve10CumVZvkY5GkyvAAAA
X-Change-ID: 20250706-msm-no-iommu-c15212a0e7ac
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1552;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MGkvf+l4O5VdeZJFhXd2WuETJysbLK+DKxuiTwq85l0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouB3GGf4Kjd/cIzyu2pmb5W+K/wasDzXjueuus
 0DbJBvZJhiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgdxgAKCRCLPIo+Aiko
 1Zf9B/4itJZUTUpMWZDvWYi472LehjoEDKy3UneWue7O5f7Zfm7RDZs5oxtf3Wj03s68j8NEQwa
 v9OUPdMfPoYgtAm6xBFequpK8wf2/245nwazaNap52oTK6VzEX+ZnPEw/35X0sxbtGT/NnRPS2L
 gOKsW97YLTzQXR0QfHuf7N3VAu7VZO8rGnrMI25+jl0EUayRrjqHyixPILRKma9KCWIrLXQH/bj
 5Ee8FO0fo7FznKRIhTQvvdV08/PldL8nSl9FMVQYnrq0EOvE7YYJt2GLX99OfHn+HbgpirXkTOL
 TS8CqbH811gqAirhiJz3gS+VL1imXzrRvFXHMpB6X0P71/NF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX8JO17exPh+MI
 eLvZRl3ArWFwTnIspwvowSs/Tf09mhj4w05Jl7nq2R4ReTApuUyIsEfTpbEdkse2BWPbtQJStkv
 AbI7C8MXPZwCf/WboZIUXEwUJiS9W+kiJ5c2QYqeSiw5NosbCVbhBFZQMmKfqq3W7UZKRegM1+U
 D6YpRQ6PBKJ8XSgu1UrtIwOWV9CTJ8+s/WQjuBmhmlCJ61vASSKjZosXO6gUq445B5tDw9tiaQ5
 MWpB6RSh0yVH8RL8jT2+IQ51NefUj2oY8X/ZVOXf0xeVVYQOzdSiOavpqrPB0LlWcCBjHI54lMo
 7MfRgQbcvtZrIDtil69IrO0V9kVS6SANmzy+hzZL0ShJ0urJ/XUDKuUywwIhYsPoKfMzjvjeyqT
 Id3fya18
X-Proofpoint-GUID: A9cqmYOw2Jy6pULEcuMn9CTmypncJGcy
X-Proofpoint-ORIG-GUID: A9cqmYOw2Jy6pULEcuMn9CTmypncJGcy
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b81dca cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fyJ_PAsbgmF_WMsuyW8A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
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

After switching to drm_gpuvm, the IOMMU becomes a requirement even for
KMS-only devices (e.g. allocating a buffer for DSI commands now also
requires the IOMMU / GPUVM). Disallow non-IOMMU configurations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Corrected error messages (Konrad)
- Changed msm_kms_init_vm() to take mdss_dev an argument (Rob)
- Made msm_iommu_new() / msm_iommu_disp_new() / msm_iommu_gpu_new() fail
  instead of returning NULL if there is no IOMMU
- Link to v1: https://lore.kernel.org/r/20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      drm/msm/mdp4: stop supporting no-IOMMU configuration
      drm/msm: stop supporting no-IOMMU configuration
      drm/msm: don't return NULL from msm_iommu_new()
      drm/msm/mdp4: use msm_kms_init_vm() instead of duplicating it

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    |  2 --
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  |  4 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 +++++----------------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.h            |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c          |  6 +++---
 drivers/gpu/drm/msm/msm_kms.c            | 14 ++++++--------
 8 files changed, 18 insertions(+), 41 deletions(-)
---
base-commit: 3cf6147f2b51a569761e1ef010efbd891e3a3a15
change-id: 20250706-msm-no-iommu-c15212a0e7ac

Best regards,
-- 
With best wishes
Dmitry

