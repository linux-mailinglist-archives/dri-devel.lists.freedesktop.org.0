Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BA3ABAF6F
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 12:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CA210E17D;
	Sun, 18 May 2025 10:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBnZjxmW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD5B10E17D
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:26 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I7igNM013627
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=dygG9Oa2sBG+0KNu8dtwTW
 0rUBxsgf/WDp4kxnn2PEc=; b=iBnZjxmWb33dujTpgQWz2pa4msBoR+5Q5sz+VY
 LWL7CuN176Dd2I3kPi547zC8OoEoztQqojRLfS4FAEk2L4as6MK5g73fXnwCaZof
 EFhzA1PDaJ9cAIFtVbJsszpzx1du6L39T8EBY/9E+sUapMKelKwxDGo8/gATSf2E
 RzsSGUuLjRIiefScvFdMzX0VBptzQBBFF6qwyRdTRthSm7/WuH7on+wtIW9HgKJN
 uuwyPnJqzahb45W0M3EeqAnOJ2udftZ6zHxDTu/dDDpHiu7bv1giE0z2BglxyRKO
 L5+wRb6gxsCk+Ul8EFV4h0rPXtzkO6vYOhKsYnhyjQ07CyeA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjssv50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f8c8a36d8eso19582646d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 03:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747565725; x=1748170525;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dygG9Oa2sBG+0KNu8dtwTW0rUBxsgf/WDp4kxnn2PEc=;
 b=iHp0BtuU0+cDcwcKsZfopth4LaOIJZaPDkGXdPS8Q0EooYTlOldx98Z6eFUJifMhKm
 MEeGBvE6Drc+o/zExEr8VNsh3klGI5PuEbeNoLjxsZlW783cjcq7JormfLDQUClJjD4w
 Cn1PsJRUjCEQp3eM2gOacDDXSGlVuAf74PrmwJMi4NbY2CQ8pA4KbCF009whPCPGWFpv
 Hc5hTSkR9nvVddS9ixdCNNK9UHh5RSo1HwoGDRYVYUv3wXYftEIMxts8XG6rjUChE0jN
 msVEXIyCGnR+zqLiSBT9isqrRZ7IK36KlxH9VUYYIsJ7dNMOl40ikwc4IG3L6tDlZNuL
 x0Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr/DPtmiIIkXS63TdM/ORXFwYef2R/ErF0T3sztuNt21MI+HWLmvi4ydaJvdEHFoKXfykPOZz+wHg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvmMlkiVGSjR7Uk0CK266zReU3Qj9dlvGXn7aZn/t6gYc7Xtgy
 AgqZlNPfdQv3W8fyuSnbXznPdiVbIddCoRbtAVQAqOpuLQrNMGk1u23+K6KStOTrCeQcOFUdsX9
 vNSdT/c6euSTVykZE3owhmjyt2FjSnbldlz3BD0wpt2LMl5uwCTMJiyapUY/mHqtCSL71cq4=
X-Gm-Gg: ASbGncuE4o8S86bcgtwB8YomybLUfo1F7t0wNuOWbuFcHGTONMnBaS9iSZllfb9LvcN
 rceKNRuhyjRPFjdWQXxgHqVORrc3GNls5FczRpEvz9pPducFgMTHCKAR4SBkxRMFlwIxgrTfNUZ
 WAib7t9wKOczQTxGzZPpzw5UwJtcauA7YSULJBYYbcpxkVkla1qBYr5dcaQPiMMkJeRhg4oiopX
 e42ZBLubd0AnzOX3OBX3kqzefTQ5YdUwYcUBRgT7hOzkuWiTp5vbeqp0vwI0kstXkzxAuwkn/Hk
 gfmFYUL0MG5AupLveo9hB1M+tJi40+EyvKQ1Oitnh4ODDsExjKFUc+g3DKCZTCmfo89ynlxVhnd
 Hmw2GiQ2Lao3XZC+ILe55yQO/
X-Received: by 2002:ad4:5aa3:0:b0:6e8:f3af:ed59 with SMTP id
 6a1803df08f44-6f8b0881b41mr150111556d6.22.1747565724604; 
 Sun, 18 May 2025 03:55:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1waGEaJBOHUK/hXbXkrMHI3pyZOv6MMf2NSoKVTkW0bnd18eZ3+aO951TZ4oxQfBZX6BEjQ==
X-Received: by 2002:ad4:5aa3:0:b0:6e8:f3af:ed59 with SMTP id
 6a1803df08f44-6f8b0881b41mr150111226d6.22.1747565724202; 
 Sun, 18 May 2025 03:55:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 03:55:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/11] drm/msm: rework the ties between KMS and GPU
 parts of the driver
Date: Sun, 18 May 2025 13:55:18 +0300
Message-Id: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJa8KWgC/23MQQqDMBCF4atI1o1MYlTsqvcoXcQYNWCMzWhoE
 e/eKJRC283AP/C+laD2RiM5JyvxOhg0boyRnRKiejl2mpomNuHAcxCMUYuWdtNCcRrMTHkJTIt
 KC2iBxM3kdWseh3e9xe4Nzs4/Dz6w/fuWsi8pMAqUsYy3oi5YocqLQ0zvixyUszaNh+xg4B8kh
 x+E7wivuKoltLls/iDbtr0A1rWx0fYAAAA=
X-Change-ID: 20250411-msm-gpu-split-2701e49e40f0
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3517;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZMPdcJDb4Sai0ElGNUE8wg+TZJqFVZ/UEtHRRg56ccM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyZIHkrqMMH0USJE6kCasx6u1cWMm0W79nDq
 jl6dI9t7rKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mQAKCRCLPIo+Aiko
 1ZomB/9y036miSvgEAw9vHR7r7LrHb9fxll6SJ3eLtFTnNiffFNDOi2NN/AWOJHGVd8jeEZMWa+
 4OTSYknrf6+bWW4fLwXSLuiJa627h/P5K41g/PStC+sn+J3FsD/W2HEsj9/5dvPSwZPZmVEejwp
 2fhW+gphC3CTVNrr4jBYxAUxmLX6GmNQIXBbkJTRQYndpjoO0q+kEFHvdSjBEDKzVTd/xauPkGv
 eqSrsVv39o/fXKGVdQaxEHj27uyc1JSnXgAinziyHiEj081TYokrx58H2Z9nu3dK8yH7dPFX7cD
 hpgPbParfyHz2O45FcY6iUSjxq7ChCJhAMaRKtkVGWhy7jg6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: m7plNQr9ExJlaLqichNjznIZW33_8uC4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfXxnh6OED5jrgR
 ERHrUlN0vUBy/ZP6s0GU777M/dCH7mMzvmP9+ZdK5fDngF/mfav9bUIcLsM80i7vOdVFN/0a7ag
 lPcOZwT3/pQJ9MKr22pM5ywDoFLEv10M6yxmW3qnQou3khEYbPsqrJT3FdDDw3+CM5hPGQjwjAc
 +wvY1YcUvtXkV76iaWRu+DlIjvLm3RbaqppOBKXZ3+yFDFvEvD3nXeUGFdSMK+7NQI1TrNcz2XM
 J07eL2mvDBUqJBx3kSvMqQXP7aEC0CiflEcHpPiVSxqxdm516UDal6U6O6pujhyAr9AZBTmcKi0
 ik/dEmssfBUbpccPVAmFxN4TVCOkcaGbRWpbNMeq1jc+d06QIyI+d5wbFNRjIusGF6erqYelifc
 1E7dN8Cip2wDV2DWun4vcK/pFR8bJ/QbvSem8GgYH4FGhXwdzLES5QJD4/3mbABCitOSAoTd
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=6829bc9d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3aS5ecUQXdRO32CnfYUA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: m7plNQr9ExJlaLqichNjznIZW33_8uC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180104
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

Currently the KMS and GPU parts of the msm driver are pretty much
intertwined. It is impossible to register a KMS-only device and
registering a GPU-only DRM device requires modifying the DT.  Not to
mention that binding the GPU-only device creates an interim platform
devices, which complicates IOMMU setup.

Rework the driver:
- Make it possible to disable KMS parts (if MDP4, MDP5 and DPU drivers
  are disabled).
- Register GPU-only devices without an interim platform device.
- Add module param that makes msm driver register GPU and KMS devices
  separately.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Disabled SYNCOBJ / SYNCOBJ_TIMELINE for KMS-only driver (Rob Clark)
- Further refine Kconfig dependencies
- Link to v2: https://lore.kernel.org/r/20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com

Changes in v2:
- Got rid of mdp4_crtc.id and msm_drm_private.num_crtcs
- Moved msm_drm_private.wq and msm_drm_private.event_thread to struct
  msm_kms (Rob Clark)
- Moved HDMI / DSI / DP pointers to msm_kms (Abhinav)
- Link to v1: https://lore.kernel.org/r/20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com

---
Dmitry Baryshkov (11):
      drm/msm: move wq handling to KMS code
      drm/msm: move helper calls to msm_kms.c
      drm/msm/mdp4: get rid of mdp4_crtc.id
      drm/msm: get rid of msm_drm_private::num_crtcs
      drm/msm: move KMS driver data to msm_kms
      drm/msm: make it possible to disable KMS-related code.
      drm/msm: bail out late_init_minor() if it is not a GPU device
      drm/msm: rearrange symbol selection
      drm/msm: rework binding of Imageon GPUs
      drm/msm: enable separate binding of GPU and display devices
      drm/msm: make it possible to disable GPU support

 drivers/gpu/drm/msm/Kconfig                       |  59 ++++--
 drivers/gpu/drm/msm/Makefile                      |  31 +--
 drivers/gpu/drm/msm/adreno/adreno_device.c        |  39 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c          |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       |  13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |  35 ++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c         |   9 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c          |  13 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h          |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c         |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c          |  17 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c |  12 +-
 drivers/gpu/drm/msm/dp/dp_debug.c                 |   4 +
 drivers/gpu/drm/msm/dp/dp_display.c               |   6 +-
 drivers/gpu/drm/msm/dsi/dsi.c                     |   4 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                   |  13 +-
 drivers/gpu/drm/msm/msm_debugfs.c                 | 222 ++++++++++++----------
 drivers/gpu/drm/msm/msm_drv.c                     | 203 +++++++++++++-------
 drivers/gpu/drm/msm/msm_drv.h                     |  34 ++--
 drivers/gpu/drm/msm/msm_gpu.h                     |  71 ++++++-
 drivers/gpu/drm/msm/msm_kms.c                     |  41 +++-
 drivers/gpu/drm/msm/msm_kms.h                     |  46 +++++
 drivers/gpu/drm/msm/msm_submitqueue.c             |  12 +-
 23 files changed, 550 insertions(+), 342 deletions(-)
---
base-commit: 8f5264d302e803e7ef82a61f9632a0d2ef67413f
change-id: 20250411-msm-gpu-split-2701e49e40f0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

