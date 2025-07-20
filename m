Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1901FB0B5CD
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 14:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9684910E094;
	Sun, 20 Jul 2025 12:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYwh4Us7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF4C10E09A
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:16:51 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KAbADe020807
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=BRz9CJxIoiVkkfsVZqEaKY
 nvwgqhcwu3BeWnZwXeIbQ=; b=VYwh4Us7Ib85j5BDn63GK+QC83fFkGWMHBODFr
 fH5fX2Q0KzX6f2S/dizemfTw+vC6DY66WulV989dQJJvUqRNuNQ4se76Gsom2Sk6
 Wy8HKPP0b7azT5lDubg+Z1HMG0i8Tg2Vjbv5zDl62WtjQlcqhFj52wv6A3TaqmyW
 RkGsZVaNuIyHfZvu52CH04E5ee8dTdHDd1AhyH/putmzxL/bPDLa0PfmuejQal+P
 XcPgjHIw1VB9o76hBA/nqObeqy/hF3Oha6XaDkvhHsfyZRpxUanSYi4pQsArTnQM
 wXDlKLLQ8BJs1z8F2ahGQUavNFpm2MnG0llNpJRAapKlHH/Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v25h2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:16:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-748fd21468cso3236998b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 05:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013810; x=1753618610;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BRz9CJxIoiVkkfsVZqEaKYnvwgqhcwu3BeWnZwXeIbQ=;
 b=fu7/V0YxDfLom0xbSbf+lZkMxWqhtnZYvMqIaBwQnZ7iRzbVT7cNc0NFaUgGXVAOKL
 ytxCeNwyfSdIdd7tZIauklSTbMl6Pcsb4O+GlLtTDZFQMW4QYYMvoAjbVjCAlmMxirKx
 9i37pOVTtH85IBNXldl4fH6AUt1RBpgooDacX9+XMXekt649oiJtlMHM1Dn1auByz/Gm
 LydRS4D0fNyCsSUCKqkj9/U7EsADMF452/m3BCjH452jvWm68bVF14ts942CVEe2hm5u
 XfKqsCyqZwlpkJa3XoF8h64KpFctJhbm9ZJC5HfGFEeJwDw4w9v9YPlPEuQgzwIIWMkt
 zjzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgqxYzOFvKSZc3LH0GtT2RuCwDcI5AMlEoUpQ18sJyhzs+eDwzch9S/xv4qDglLI4zmd/vHNckbVo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOe9B2dWsF2ydeCQ7SUquRpc0VdHb6ea5XIAFZlO24A2Igo7GK
 l6REE2ieupiSps/t2xosA2sFT+Vk6q04KPtG+VbTP5FD1SVAaQUfuzB5Sg5Q8nlZhLfsOXGzYOg
 zRdWMybM+Mgp16rrg1RblyLuFEC+2Mbfqh85L5/FcR8TdCpEQSBqx96eDHvAStSSwGbPnWw8=
X-Gm-Gg: ASbGncupCJobpNNhfoh9+tB/jHi1lQi2UWZCNurWskhVJbFeeDLyDxPLaUss7sED+ut
 VgDF6UBEa9NJwMdNghr7gao73TcKoit5ce+bSC1DUUvntTdnMMRuYT0iu98HQr/PBlG0R+PXcsG
 cwhI4KZXLXLCfqHnuZmc2hi7UiOAcyDZ9l/06BuGjWXu3Ta+IyeuxSA4N3n0P9BI+G1td8HnN/q
 AgTmAW+CZpm1MDIQ+sladU41WQtZd1Sksgdu5FJrY3E6Uk1IYaF+nwj9pgMISbfyDcK8l5skAsx
 MMVchVIHGCncZ4r2AR7CwUvG0wKH4xB8QX5+rlWZS7UqxyU04xJkwFANvE/dWXRg
X-Received: by 2002:a05:6a00:3e0a:b0:742:aecc:c46b with SMTP id
 d2e1a72fcca58-756e99fc423mr22709772b3a.15.1753013810115; 
 Sun, 20 Jul 2025 05:16:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3WQE6VxrcFzUyVHmjvH0Xv5hyM5tVlmf+2X2yTpgqZpQXqs1GYjTUCMAjIgH0EvUJaGNagw==
X-Received: by 2002:a05:6a00:3e0a:b0:742:aecc:c46b with SMTP id
 d2e1a72fcca58-756e99fc423mr22709737b3a.15.1753013809577; 
 Sun, 20 Jul 2025 05:16:49 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:16:49 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 00/17] drm/msm: Support for Inter Frame Power Collapse
 (IFPC) feature
Date: Sun, 20 Jul 2025 17:46:01 +0530
Message-Id: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAALefGgC/yXMQQ6CMBCF4as0s7aGtlgNVyEsaB10FtA6U4gJ4
 e42svxf8r4dBJlQoFM7MG4klJYa5qIgvsflhZqetcE2tjXWeE1TjlrWnBMX7cKjMf4e3M1ZqJf
 MONH3z/XD2YyftarlHCGMgjqmeabSqc1fq8ixheE4fr10bSiLAAAA
X-Change-ID: 20241216-ifpc-support-3b80167b3532
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=3475;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=6N5DisMgqH4uXAYM8uU6vWHlCUFyS+1n+wdiyhygzmo=;
 b=kRgDa+BqEIipkBf58lQ1Dd4n/f/NyyTp16tEOWBOPKbXKvSR/UnLPJgy27i/Or6gVCKfR+qeO
 Gze2zfEDKolCFYsATLkHgb0pS3r27Rvy36i70J6jC0C4Ql1hV1X+BA5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 1REmLNA7A8pUsATv867tEbwYK5OCtiPE
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687cde33 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=tVI0ZWmoAAAA:8 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8 a=sLhxGqmu1eV7p1u-_mQA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=-BPWgnxRz2uhmvdm1NTO:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExNyBTYWx0ZWRfX1v8zZ8Q+Dk/b
 IpiEDW+ULM9psfNyo7U4iOla0siwYleJIcne44Hs1APxJ2OL0AM2vmFKEIB3rgraJk4+jvqiwyp
 adlMrXpSITi91vUxVS/roahjHXiNk4LTmb7ik6u1fYnMaXcyDQFxLI2q1zg/Q3JcZRzKR5SZNSP
 P6nVkn/jxQ5BTM114alX3bfwr2M4v25MgJcjglt2szP4m9RDA8XROA16vUMzCOSgevDv5obTFjV
 3WA/xirQLwH7Ij1cqAW200rCb6x5wkgx9aPdSVH2hpMCctlEtL839LbjaJ4rTD/v4SpUnousHFH
 VXSgcVUY+jwLauATFjNk056a+rN/mudwlajVOCLkr1zJdHsvUQPQ43Tb7cYP8QrvhdVNQWAu7r8
 BUOedSnrRU5uNWj3W483vXMwHANoBCwDW768VphxAPifx7/syHdi66FiazwC16RREEsnIB+V
X-Proofpoint-ORIG-GUID: 1REmLNA7A8pUsATv867tEbwYK5OCtiPE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200117
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

This patch series introduces the IFPC feature to the DRM-MSM driver for
Adreno GPUs. IFPC enables GMU to quickly transition GPU into a low power
state when idle and quickly resume gpu to active state upon workload
submission, hence the name 'Inter Frame Power Collapse'. Since the KMD is
unaware of these transitions, it must perform a handshake with the
hardware (eg: fenced_write, OOB signaling etc) before accessing registers
in the GX power domain.

Initial patches address a few existing issues that were not exposed in the
absence of IFPC. With IFPC, msm_devfreq_idle becomes redundant and
therefore it is disabled for GPUs that support this feature. Additionally,
the DCVS tunings have been relaxed for GPUs with IFPC support to further
improve power savings.

This series also adds the necessary restore register list for X1-85 GPU
and enables IFPC support for it.

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Akhil P Oommen (17):
      drm/msm: Update GMU register xml
      drm/msm: a6xx: Refactor a6xx_sptprac_enable()
      drm/msm: a6xx: Fix gx_is_on check for a7x family
      drm/msm/a6xx: Poll additional DRV status
      drm/msm/a6xx: Fix PDC sleep sequence
      drm/msm: Add an ftrace for gpu register access
      drm/msm/adreno: Add fenced regwrite support
      drm/msm/a6xx: Set Keep-alive votes to block IFPC
      drm/msm/a6xx: Switch to GMU AO counter
      drm/msm/a6xx: Poll AHB fence status in GPU IRQ handler
      drm/msm: Add support for IFPC
      drm/msm: Skip devfreq IDLE when possible
      drm/msm/a6xx: Fix hangcheck for IFPC
      drm/msm/adreno: Disable IFPC when sysprof is active
      drm/msm/a6xx: Make crashstate capture IFPC safe
      drm/msm/a6xx: Enable IFPC on Adreno X1-85
      drm/msm/adreno: Relax devfreq tunings

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c         |  67 ++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 107 ++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |  11 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 203 ++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h             |   3 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c       |  10 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c             |  33 +++-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c         |  40 +++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h           |   1 +
 drivers/gpu/drm/msm/msm_gpu.h                     |   9 +
 drivers/gpu/drm/msm/msm_gpu_devfreq.c             |  13 ++
 drivers/gpu/drm/msm/msm_gpu_trace.h               |  12 ++
 drivers/gpu/drm/msm/msm_submitqueue.c             |   4 +
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  11 ++
 14 files changed, 449 insertions(+), 75 deletions(-)
---
base-commit: 88bf743cabe5793d24f831ef8240a0bf90e5fd44
change-id: 20241216-ifpc-support-3b80167b3532

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

