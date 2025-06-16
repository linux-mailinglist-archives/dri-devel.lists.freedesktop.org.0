Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DE7ADB43C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 16:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF52210E341;
	Mon, 16 Jun 2025 14:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="noK6lW0J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D1E10E34C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 14:44:45 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8T9sC026180
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 14:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:message-id:mime-version:reply-to
 :subject:to; s=qcppdkim1; bh=OF+xq6A7Vha67Y6nxaav1VkwmNZVPUuwRDl
 u8Vsm1S0=; b=noK6lW0J5TctLLigmSZaskkWSpI3D1IpnexZQb3M0L/6J1D1JcS
 FRk39hw4bUkfZ1eZVUFLQOqrQqS8TczekM1fnrjDpiKskB0uIVspxSC9wIfJO/pr
 3VSjpGb6XJpcVr/sF1x8j/pbT3gtg7n5kG23CtWfT39Pk3CNtwh04Ww4meFpNw1Y
 EFhgN0Sj0q3maU9rYg8pCiiv5Rxbp82ZWIAimONy8sH3dTTLs/T996xQ4B1cq9E/
 lwpXqJF1peAYVtir93Y9Yk3H1zMYg2Qy1XJzc0JLXVXwIiRhKePeh8p9P1fya0Rq
 XvPVDCIHwHRMvCtQuaaG6XwXFZ1Y0+ZaIqA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f74wcb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 14:44:44 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-2e94cfbbbc1so865292fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 07:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750085084; x=1750689884;
 h=cc:to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OF+xq6A7Vha67Y6nxaav1VkwmNZVPUuwRDlu8Vsm1S0=;
 b=UsMBYVkP9ZXmvDz6wMe23XhBtIVMQbsWtAtBsEneHA3tW4s/fk8Kphrh4MIBJ7OtRO
 eWLD5t5qmiwBLAhpVk2/4aRjlaHRyOFs8VRnSVHDiH2eRFHRJD6jlaf69vbMb7sgF+6e
 iZCndpSWvGIt9smEe3swacDxe972ZeuXfaL5afdupwzGVf1fk+YVp1DC8P4bRMIi5vLq
 aydPv3MPuCIMC6rVi0IC2zLmG5c0JydiKIIvw9MwE8+h9TiHb3lI3LeMXSQbD0YoTVT4
 FRTzdS9MNxwMTzErp59NYhmRAaNIODwgvRGvATKBK4u29/XR16sQcQ0BdGQS6uOyuYEx
 nYmw==
X-Gm-Message-State: AOJu0YzJv6V7E9nnmcFnMRy/w5oIkA8AtGZJC1HC90xXWUJraKrd1Qxf
 as19m1ocpeq+hsJ9+pYJfg2EqF2qXZl4J1IZcoH1fSX0jNMhWoE9JqL9C+4dyZw98BG1tf2b3MI
 zXszERObWKPuckc1YA1PrGQ/je2SgeGjVGX3SKEdoYUH601pxSDD7OHTir3RpZvZe4k0Ee6YxcD
 s4asUO2ImMpai6u/3CjvXBlwyrP5wZbXUE+8ksdCjhnkYlAQ==
X-Gm-Gg: ASbGncuwHw6RoW+HF6xyaVAO3/+Q4Ickc1PNz+sMTAGH2N836zAxyJBOZChlgRx+yEL
 d00XPLlbxu94wUsiAzBqsMqK6oNuxjHWHOhnUZcF2zCq7Bw5DgY0oTdmmh16Z5kEdK34f0DRweK
 2PEVOLWHOpRErT6Z5iQh8u7nA0/A4SuSGZfTM=
X-Received: by 2002:a05:6870:1cc:b0:2e9:512:ee1a with SMTP id
 586e51a60fabf-2eaf0835465mr5709591fac.4.1750085083837; 
 Mon, 16 Jun 2025 07:44:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPyxd/ZCna+fivSUS1vT9j9EBiQJj04kCv6BQd+zEIl13TKyJNAt+sPYBirqLvu+a3UFqX+NCdq2I6N/FBSFg=
X-Received: by 2002:a05:6870:1cc:b0:2e9:512:ee1a with SMTP id
 586e51a60fabf-2eaf0835465mr5709578fac.4.1750085083424; Mon, 16 Jun 2025
 07:44:43 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 07:44:32 -0700
X-Gm-Features: AX0GCFvt5LG4Hp3T6ZAjQtUtoIr85DmoyodqDFDNkakh-GWvcoJA7D6CJENh8xI
Message-ID: <CACSVV03=OH74ip8O1xqb8RJWGyM4HFuUnWuR=p3zJR+-ko_AJA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2025-06-16 for v5.16-rc3
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <freedreno@lists.freedesktop.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA5MyBTYWx0ZWRfXzAcEM5QYH0DO
 3N/Ihsh8cKiNXkfF6P4Z51NrYS0xzUKFzag7Glc6K9DGrKssEfmFgFL9+8xYQTDAlFiMWlTsnJl
 V5vpu/Y4f3v3k2nSt735T/V7r21i3n3hoSAt7NDqGVISaWWTF9B4iHRCp/QakikSB8sqYNk6qbu
 ugB6pa5a8dJ/5Zat/ZzCCsV08EHfr1uxqOMA0zqLL6PpfCvGV7dbu7+kcPiH2cgLpEFfItHK1xE
 FWT1NA+CEFG4q8nOw6yhohZMh7bIObNP8i/XUwIt1D/iFInVgnjoCvDW4hoRewrbfOhFcyCpJ5O
 yvOS/KaHyg8fh3zmuAP2+lj6WclNIwFmO3JDHXz4akcGjCyUZhgoTVsh0WQhlTZoQpYNN8ZMzLF
 jI/1mfg/t4A0w0vUgcBbfseyZ8Y04dARsBNyiWh1r2efK6AIzbTWGPPbbrFxwEax9Bf4wzSf
X-Proofpoint-GUID: 2lQigGzeht0J7aOVSHNK_zo56otrnz8l
X-Proofpoint-ORIG-GUID: 2lQigGzeht0J7aOVSHNK_zo56otrnz8l
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=68502ddc cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=Y02TM-CbU_CDVPOd8LEA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160093
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Simona,

Fixes for v6.16-rc3, as described below.

The following changes since commit ee11d953fd230b4e1c28388913826ca832ae8444:

  MAINTAINERS: .mailmap: update Rob Clark's email address (2025-06-04
13:26:41 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2025-06-16

for you to fetch changes up to d3deabe4c619875714b9a844b1a3d9752dbae1dd:

  drm/msm: Fix inverted WARN_ON() logic (2025-06-14 08:10:44 -0700)

----------------------------------------------------------------
Fixes for v6.16-rc3

Display:
- Fixed DP output on SDM845
- Fixed 10nm DSI PLL init

GPU:
- SUBMIT ioctl error path leak fixes
- drm half of stall-on-fault fixes.  Note there is a soft dependency,
  to get correct mmu fault devcoredumps, on arm-smmu changes which
  are not in this branch, but have already been merged by Linus.  So
  by the time Linus merges this, everything should be peachy.
- a7xx: Missing CP_RESET_CONTEXT_STATE
- Skip GPU component bind if GPU is not in the device table.

----------------------------------------------------------------
Connor Abbott (5):
      drm/msm: Don't use a worker to capture fault devcoredump
      drm/msm: Delete resume_translation()
      drm/msm: Temporarily disable stall-on-fault after a page fault
      drm/msm: Fix CP_RESET_CONTEXT_STATE bitfield names
      drm/msm/a7xx: Call CP_RESET_CONTEXT_STATE

James A. MacInnes (2):
      drm/msm/dp: Disable wide bus support for SDM845
      drm/msm/disp: Correct porch timing for SDM845

Krzysztof Kozlowski (1):
      drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate

Rob Clark (6):
      drm/msm: Fix a fence leak in submit error path
      drm/msm: Fix another leak in the submit error path
      drm/msm: Rename add_components_mdp()
      drm/msm/adreno: Pass device_node to find_chipid()
      drm/msm/adreno: Check for recognized GPU before bind
      drm/msm: Fix inverted WARN_ON() logic

Ryan Eatmon (1):
      drivers: gpu: drm: msm: registers: improve reproducibility

 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c           |  5 --
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 18 ++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         | 39 ++++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            | 54 +++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  2 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 ++++--
 drivers/gpu/drm/msm/dp/dp_display.c                |  7 ++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |  7 +++
 drivers/gpu/drm/msm/msm_debugfs.c                  | 32 +++++++++++++
 drivers/gpu/drm/msm/msm_drv.c                      | 10 ++--
 drivers/gpu/drm/msm/msm_drv.h                      | 23 +++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c               | 17 ++++++-
 drivers/gpu/drm/msm/msm_gpu.c                      | 20 ++++----
 drivers/gpu/drm/msm/msm_gpu.h                      |  9 ++--
 drivers/gpu/drm/msm/msm_iommu.c                    | 12 ++---
 drivers/gpu/drm/msm/msm_mmu.h                      |  2 +-
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  3 +-
 drivers/gpu/drm/msm/registers/gen_header.py        |  8 ++--
 19 files changed, 217 insertions(+), 67 deletions(-)
