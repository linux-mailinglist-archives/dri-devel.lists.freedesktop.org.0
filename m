Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A45AB79E6
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 01:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A9610E04D;
	Wed, 14 May 2025 23:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NcQRFwfZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A85B10E034
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 23:52:43 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ENQl76024946
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 23:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=U9dXNTM0otXMtb+tXARZV5
 SVU4gth+EmAxcvRX+fMqk=; b=NcQRFwfZN9CA2RN5DDGL1fCCVQMgG2loJeAss2
 NDTyQsixhCw0dE4qn4at6blyETjMDPBsUyn94rhRlbwmZs0CYPqikgK/ygimGsXW
 xQUZEH+z8mU6YIOGp/BvAvY1jMtVfVZqUB67e6WOYxA3Ir506cmwoeu52YYx6H9c
 hqicBOG7OPYT+1m92BSc2DNHCa8zHFVTEAlVanZ2h5egaNpNxvcLq2OEBJ2yebHL
 SCz7mQAB53ipvO7OVs/tf5SQyfdZ19GEBw6Jl+FQvhsVHyeMY/rqRc+0fmT0vPOG
 pGoc/x9Rjh2NC1bwoK1/CdT2k4ikJeSaM43Grcb37NeM2TTg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpccxd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 23:52:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-22e7343c777so2127095ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 16:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747266762; x=1747871562;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U9dXNTM0otXMtb+tXARZV5SVU4gth+EmAxcvRX+fMqk=;
 b=QIuOHB3XUs6fgBzYp4IEOFNzJeeYmS5HcT+1r4Btki3lkSS8FmOaWYwd6M4WgERt6D
 HlqKZrehbXnEf7ynWgrAGvv5uExHkjQKubpPFHfr/QRHFd1sO7UHuZLxZooZbHAY5Sdd
 /73z2R2duHaTNxqfNdlhzkbdcaU0+/1Ke9Lpvem7arifaZrw+8Jsn0SL05TWNO0dVvgy
 CD7UlrJlACApwiwXoq3Uv3fdF5+zP0D7ravZHbmte96UqsmzEn0gHEK4M3w+ZykvBToj
 uSW3aMBe/COsrV86ppe9KovO3Q3PsL0S0FoHS1YUGHJdxmH9v3Q8lDwy4lHxSp1Y1EDP
 OCLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY62bMGGyiIGhq5m1IWgd8S/8aMBsZZSPkfAdThjd0aAoVlFkFqJfk5FSpa+6cTjNtSKPzSCE9Tbw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziMKaPml1qN9PgojRHplLk4H2TNwe6MS5VkLPVDMEczH6vIn33
 c0523Cjzpt6B/YuJTD3B7M+I334Z1/0AIsDoF1nUnOp7BMN2Ka6dankwjqLQhvMFI7909ln9Zur
 JqMZgwQKmAdRANHvlJrvu1g3xjQoPkQ8gE94IpdbWIqG/sZG9TCJJHSgcijQ9js7SY98=
X-Gm-Gg: ASbGncsdZeFsW5J5dXsq5uKG27PqIiMoT06jSzL6Kofry4U6q53xdZUxkUuWRCq8ec5
 oedejQrO1hmjPQr9FjdTdNhkqvlpzZX/cw9MTRMeTr4Q0JGtT2mWQ8AOt2QLdtRbcopWg8jFV8l
 F+/sk9+wn49nkbeS8gHiY+hxLLPRXpDFxjMNonK0srvjt7DSCeybVCdZ+tQG1FmwX7xt7hSAH30
 ITJ790TDhZlJSY+dTG70rd6frz9fnF98cC37WEFCp6Jf5YOtnP5AUC41yWXbE1Ieyn84SlpQsY/
 Ekm7dTXxSJ2nK5pG779bEsbtWv3IdhS85XNHUeNW0kPO+S4iRWjeRpd7GW4LcZ3eqycUA6uI
X-Received: by 2002:a17:903:3ba3:b0:223:3396:15e8 with SMTP id
 d9443c01a7336-2319810114emr80995015ad.22.1747266761804; 
 Wed, 14 May 2025 16:52:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9Q11Bf0x1w3OdQv8Gq4HJtYawO2uCX+U0G/Tc6UvUo7gpok19dbvktUtFd8Z0CtlQnSADsA==
X-Received: by 2002:a17:903:3ba3:b0:223:3396:15e8 with SMTP id
 d9443c01a7336-2319810114emr80994675ad.22.1747266761421; 
 Wed, 14 May 2025 16:52:41 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc8271aebsm104468735ad.107.2025.05.14.16.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 16:52:41 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: [PATCH 0/5] drm/msm/dpu: Drop max_mixer_width and MAX_HDISPLAY_SPLIT
Date: Wed, 14 May 2025 16:52:28 -0700
Message-Id: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALwsJWgC/xWMSQqAMAwAvyI5G6hVcfmKeKgxag4upKKC9O/W4
 zDMvOBZhT20yQvKl3jZtwhZmgAtbpsZZYwM1tjSFCbD1T24ysOKt4zngg3lZCwVNQ0VxOpQnqL
 +j10fwgf06RvzYQAAAA==
X-Change-ID: 20250401-max-mixer-width-9c3c02c48cb7
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747266760; l=2865;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=sZUuOX2H5sa9Q5kPSygy9aJ3DncWNwsb4nZIr1PWjis=;
 b=2fS6E10p0+LUPEXfVUGN1EiKyx+7j+1YYXZmTcrfjwLs3yXOx0XYFA0FP7+b444XrmN0u80zg
 dX1gqwXcCIyAy5RdHn+91gwbPRhUbL6nNW3xP1GaSQ/v7obPx3VJ5Cw
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: W19R3mu3FJe4zfGk7GOQbZJgmgyaGwf1
X-Proofpoint-ORIG-GUID: W19R3mu3FJe4zfGk7GOQbZJgmgyaGwf1
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=68252cca cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=qDZEy-X_bfy3rWNFqZ0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIyMiBTYWx0ZWRfXwtfBHxr65x/q
 ik2pv4nnQtFU4hp5Ep1s8g6GJMqE4/Rm50SVRYQPjI6ETwoVVdQjkPXg1zUl+iAGSaxQGHjUDNs
 bHui205bLPTnfwQjdo4R3jLMxn7MDj6m8NCusCTpk3rv60PMfQYnS855rReMgaYKfpVuiagQWPB
 YHiVcmBEjZO+vxBGm7OqPETqar3RWKFz5C9TyIR+++ZiPymh35hyvnwHmvfaUEAcD1IhOuLt9iS
 mZ19y8SSZX11ge6QsKC+JxcASwXrnloTtEy/AnIE2kJzxpxl8TS1hzYSQseO7ybbKKE7kyOJyqT
 HhcI4XqJbIv12YB9WA+jVnWCLo6zTQxbEolPC2dxqHMCsEq474GLRFsyrrz/bvFzdA2b19SCPVl
 4pemDpJLroAvrh4FcgLzzrBMwzOWfn5mSrbhSsa/DwUjRq4vhIB+a8w1hj8egx1T7KkJRzVw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=947 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140222
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

Currently, the DPU driver bases LM reservation off of the maximum
supported width for the layer mixer and an arbitrary MAX_HDISPLAY_SPLIT.
However, these limits are not hardware limits meaning that a single LM
can support higher resolutions.

Switch to basing LM reservation off of PINGPONG and DSC encoder hardware
limits.

---
Jessica Zhang (5):
      drm/msm/dpu: Drop maxwidth from dpu_lm_sub_blks struct
      drm/msm/dpu: Add max pingpong and dsc width to HW catalog
      drm/msm/dpu: Check mode against PINGPONG or DSC max width
      drm/msm/dpu: Filter writeback modes using writeback maxlinewidth
      drm/msm/dpu: Remove max_mixer_width from catalog

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    | 12 +++++-
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |  2 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  5 ++-
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  5 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  5 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  5 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  7 +++-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  7 +++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  5 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  7 +++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  8 +++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  6 ++-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  8 +++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 10 ++++-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 10 ++++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 10 ++++-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 10 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 46 ++++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  4 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     | 13 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  9 +----
 31 files changed, 173 insertions(+), 49 deletions(-)
---
base-commit: 888f15dae780db7cea6ab1a3355151e4292038bf
change-id: 20250401-max-mixer-width-9c3c02c48cb7

Best regards,
-- 
Jessica Zhang <jessica.zhang@oss.qualcomm.com>

