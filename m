Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E33CDEFB3
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 21:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFEB2113837;
	Fri, 26 Dec 2025 20:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUomsBWz";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EAfEvuDu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386C9113462
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 20:31:30 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BQ8c7oK756033
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 20:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:message-id:mime-version:reply-to
 :subject:to; s=qcppdkim1; bh=4AWFGr6gKgFJOCoEJs5vWAtnJQDYSY770au
 cV1GG3lI=; b=jUomsBWz1a7lun/xLvJmSeJJ4Rs8Zs247O9AxmDh4CN+2wNWwJP
 Fq83H+9ZNZwYgN0tjuQzNY9Xv7EX/KUg4fRNAGeZPym2W4wWAZB+BWRDmeQufBBM
 MQu8F8/e4kA4I/YStRMwWxCyDZji5o2BO63FGHt6TSHfHgjMEyOhDemVDRh3wmp+
 RzxxIhGzkFwCvRpf398xNvuaOjPkmRFSF0s0h8jionEgYvR6TS/irYVZMsaMVH1N
 EjcCovMxDq4QiGxb8V/c4F0lPrFK7ejmZNzCMyfeecg5dbbyBjQlIilBnzf0UdpK
 auYFiFAE+X+YZek+JqfvGO1gZP3S2TgkCcA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8kbuvpm1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 20:31:29 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-459a2584256so3140671b6e.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 12:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766781089; x=1767385889;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4AWFGr6gKgFJOCoEJs5vWAtnJQDYSY770aucV1GG3lI=;
 b=EAfEvuDufXtEIKJt1x3XJ9shaRpLqA9oyJhZknK9fq/vrijMsd2iF7ANVQYOGTgi/E
 XyUG3E/BTI3NxRjGLi2sghZl1MtRycuL00lSOFyBMsV1o6R3YCcfJK5M6MKjZKxpiWbr
 rtium/n1XvFW9XxwyPzSmrBLB5MTQx/1S/nHg1v6iYXrnJ0f+Sfhj61c1KF8Xb0I1vdq
 iTRwAdTI1Qba+AB8cnPvflCpi0tP+nrX+MmEgPOXIWTABU9K9bqyxHHKOfe8tBpQ7qBm
 xnaG5hSu0CZWxBgAkigl/CDZ/EfdYRP9F6BWJMa8X14MH9je3oRZoIvo3SHdUUVrFZVm
 g10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766781089; x=1767385889;
 h=cc:to:subject:message-id:date:from:reply-to:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4AWFGr6gKgFJOCoEJs5vWAtnJQDYSY770aucV1GG3lI=;
 b=mX+qOFLXsEyUTOlDhNi9XV9k18MMAMdQ0uamHKJ41VDYgpIMpEd4HD2NMV5nMbI/0x
 FBQ0etgIh1F2ASQSITrYIv/AWTgS2IgT+iif4jwiM3exfJyKxZxoWOvZaj64VkIERTIp
 KJE5QCqrNkVRaYWBdfbvq2vv8IsETpd5E6PEr6lUsm5ZZI/nNcyyZs9z5TbTiCjLubH6
 9ZEizl9i9ClDXP0ot4CDKiHF8DUEdoMDweW5RuDGNssr198id+AIRVd2aI+SXXlVggXf
 qiLrr0wKThH/8vKgxs8tZ3lAsa3Mba5c1r9+2WgvnuQchH114CfACf75Pn3REgyNhDYd
 +wHQ==
X-Gm-Message-State: AOJu0Yx1+j/PU9Ah6yDdbJ+opaOD4feoibr7FZguMxzXKwEo6+LfIWwz
 p4sdsDld1Nec30OmhE7S7z24nc9CxPD3DaPP1Wsfm3ESHEZBLcx/MAe33lpQ04W3XZlsrKDX45F
 eXGFIWQ38QwuDO6chBSGXr0C7GHc4KEzGAYIrDvtjbas+j+S4ahDTGrVsdMH/YfVoWBdtDeGp44
 Lv7+mqYpOOh7LDwSEfUkF7iP43GEsSYg6Lx+bSlJG3pH3ZMQ==
X-Gm-Gg: AY/fxX6ZwAULSj4tfwG0q5mlw7O9N3YDPlzao7IGYe37aqmcFGuxGI7pz1Kt4ta4rQF
 WRzmnYPNEnnCF2XLEo3FtuaJsruwli9wCxBUZezrGceB0o7nhaIx1pqCBpjlt0djJRSf5z2jzdT
 XXFEzdlCrHqieAPBqX/fzYEZGJ7cDTI3cX8rYZh2y0bl1DzbOLW226HszaN+7GsiwF
X-Received: by 2002:a05:6808:19a6:b0:453:587c:8362 with SMTP id
 5614622812f47-457b1e54e1cmr11529676b6e.11.1766781088857; 
 Fri, 26 Dec 2025 12:31:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEt7xfrwX20cCFFg3FDxCd51j0HkcEkdYfmiFLcWeH07u/31Q+rg4EarGgy8D/a52+vYGqLVgLGTGZJ31p+XjE=
X-Received: by 2002:a05:6808:19a6:b0:453:587c:8362 with SMTP id
 5614622812f47-457b1e54e1cmr11529661b6e.11.1766781088366; Fri, 26 Dec 2025
 12:31:28 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 12:31:17 -0800
X-Gm-Features: AQt7F2rqIupn1E477TC3v5dx2uwAYIb5qZfLBCMyoyzxki1MVu_wt-kWfn9qFjA
Message-ID: <CACSVV01jcLLChsFtmqc4VDNoQ2ic2q+d86n3wdoSUdmW6xaSdQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2025-12-26 for v6.19-rc3
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <freedreno@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <linux-arm-msm@vger.kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE5MyBTYWx0ZWRfXzklQ53TDV3GS
 NKU9APgTbA1cU9oRihuEu4UQulsMy3D2OxaKngKgk6fVBJPhT30tbk50RCJ/VYRGOZC+cvDYdFj
 pIw4B27D3JXU+VS+mi+N/gE6ueqIYkfdxM8Dnvzc6x/Cx8c/VDhjIY9n+t3kXSGE1uAct4VotSu
 x5QRaJpQsCT+klsX1zS4sbxTv+I/GBmbAQFkG0E1yOFW7i8Sno81TkC5E5r5WjgFl/zOs2GFYin
 X35SjKJa1kAlsT2dK9btq34NTK/vDDyVwoPMJxgMJZpUJFCRTcusUTGQB5iKywsInvfRittY9NG
 fJnQngbKrCejHMtSH8kWLpJG3r3QtkkkK6RoaG6+snfKdpRpaXbRhF+v8PzyeZhslajwM2WU+Uv
 Zz8VmOAXTvB7wXhyrNEPvtvu/yZ2thLQug051psnkeaM8txu1AkhG2RLBqCoXCzwMDmaniUxQc+
 P0FlhiAv4YOhLqgFb5w==
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=694ef0a1 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8
 a=esN6lJarwAe2O1dyRFQA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: DFyCpPeh43EtLcggyzCnPBoWdHqEnVFC
X-Proofpoint-GUID: DFyCpPeh43EtLcggyzCnPBoWdHqEnVFC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512260193
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

Fixes for v6.19-rc3

The following changes since commit 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530:

  dt-bindings: display/msm/gmu: Add Adreno X2-85 GMU (2025-11-18 09:04:13 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2025-12-26

for you to fetch changes up to 66691e272e40c91305f1704695e0cb340cd162ff:

  drm/msm: Replace unsafe snprintf usage with scnprintf (2025-12-24
17:55:29 +0200)

----------------------------------------------------------------
Fixes for v6.19:

GPU:
- Fix crash on a7xx GPUs not supporting IFPC
- Fix perfcntr use with IFPC
- Concurrent binning fix

DPU:
- Fixed DSC and SSPP fetching issues
- Switched to scnprint instead of snprintf
- Added missing NULL checks in pingpong code

Also documentation fixes.

----------------------------------------------------------------
Abel Vesa (2):
      Revert "drm/msm/dpu: support plane splitting in quad-pipe case"
      Revert "drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case"

Alok Tiwari (1):
      drm/msm/a6xx: move preempt_prepare_postamble after error check

Anna Maniscalco (2):
      drm/msm: add PERFCTR_CNTL to ifpc_reglist
      drm/msm: Fix a7xx per pipe register programming

Evan Lambert (1):
      drm/msm: Replace unsafe snprintf usage with scnprintf

Neil Armstrong (1):
      drm/msm: adreno: fix deferencing ifpc_reglist when not declared

Nikolay Kuratov (1):
      drm/msm/dpu: Add missing NULL pointer check for pingpong interface

Randy Dunlap (19):
      drm/msm/disp: mdp_format: fix all kernel-doc warnings
      drm/msm/dp: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_cdm.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_ctl.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_cwb.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_dsc.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_dspp.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_intf.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_lm.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_merge3d.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_pingpong.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_sspp.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_top.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_vbif.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_wb.h: fix all kernel-doc warnings
      drm/msm: msm_fence.h: fix all kernel-doc warnings
      drm/msm: msm_gem_vma.c: fix all kernel-doc warnings
      drm/msm: msm_gpu.h: fix all kernel-doc warnings
      drm/msm: msm_iommu.c: fix all kernel-doc warnings

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  13 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  52 ++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  13 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  38 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  29 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h         |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  84 ++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h         |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h        |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  20 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |  23 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h     |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |  20 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  47 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |  21 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h        |  16 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 137 ++++++---------------
 drivers/gpu/drm/msm/disp/mdp_format.h              |   6 +-
 drivers/gpu/drm/msm/dp/dp_debug.h                  |   2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |   1 +
 drivers/gpu/drm/msm/dp/dp_link.h                   |   9 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   8 +-
 drivers/gpu/drm/msm/msm_fence.h                    |  36 +++---
 drivers/gpu/drm/msm/msm_gem_vma.c                  |   5 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |  68 +++-------
 drivers/gpu/drm/msm/msm_iommu.c                    |   4 +-
 drivers/gpu/drm/msm/msm_perf.c                     |  10 +-
 36 files changed, 347 insertions(+), 372 deletions(-)
