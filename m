Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1E4B82CDC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 05:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E2310E17A;
	Thu, 18 Sep 2025 03:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X3y7Y/dJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857EE10E02E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:16 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I2wchZ019524
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=le3hcgVXjn8geHN7AQBsWT
 xvYkhBX1Lcw++MHyY4VEk=; b=X3y7Y/dJmEZaNlp4uMoE94qP3P2nxCu4BepXJf
 jfFi5ZXwIn+PxTpvLMGPRR8ChVjwwRK89iHg7gk/nbqo2V7DyZnzzfxDIaMIwrR8
 Fi75ZKd/Wr3c6y18aHk68+dlqxa1dG8Ms/Jzw/sSHpmIFDC8Smeu+RCsZMAp+Edi
 9zsbGXrXjpqkU/33HRcuQh0CUpGVihxATJXdYuWGdTMQN8KQK3S3yt38VPXExaSL
 +GCg3M4QeBnT6/I+a19Yq/6AY8ajkWoKk4EScTshkYivX2pn2u8Dr9LOxQlR+Ug1
 aOFmf6/cFd9hW802oVa+Rol2o3x9L+1p7U6eTVCUhkpmH9Vg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy1vwbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b5e178be7eso14290951cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 20:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758167474; x=1758772274;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=le3hcgVXjn8geHN7AQBsWTxvYkhBX1Lcw++MHyY4VEk=;
 b=Nq+JdUFhAkCXqQUfyTkWnFwWl0i+XsdFf5oEtzoxRXEk0ah36vkuaghYaxisoHR22g
 8xebGBWiBIxUQ2GafFhQNpaQ3BG09u/jUX2TbI8z+Q+NgJK5Bku3UeMlfU0qWYTRTjEe
 TENiG0sIQDJG/XscGXHjPLCE5XbhE6lz/IRZNlsMeXxITbozvebwmTjDLJ+OgEyFrpMa
 TKCFFLh77OfoL6Sbuuf41uuPRSgv5m/UihuBl6Pq1q29H3plCavogyzeugyw9AHmSqtC
 nzwQjuQx/g2t68twD/wNM5Y3PQxUZF9NGZlgTKItJ3AfN1nj3vLxsBmX3vnGZ6tN8dsE
 ApGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR1az0dbZn4/ms2eqHDf8bkqqXNbt8SNulyFZ+wqeBW/VPWtQBlad+QTyMJIhB7p28eLX3Vxcd+Kc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+HT3s8qdDZ0QG97Jcx+GXw3HCIzfnCtruaPhaDjRRr0Vvp93H
 SKx3L8wCnBH+J3ou65xaVOVn4x42XlkEphaqhq74IEm+HvcJb9QNEf59QLWY4rHgu0l5v7z5aS+
 qET4RPsX4SgR31GQYbpNai6fSWl2LsN3/5l/LIsQI8mhR2dvkjda/l+BJGmLkkAt5MxlpwJk=
X-Gm-Gg: ASbGncslOyfuU69wsZabKRqwp+pK6YY2x+4/5oVSUq1UP0mAjXmlUV2IJdqfUy8C6GT
 YI4oesbLuy15sMpHL9KYvoJ+5JqToeB6uP6ee1LbzSppRCMuXbAmQsdBuuol9BaTQN8sZgQV+p8
 HQzXfuuflK36pr40jxbDxdS4bXOoXuiOYPJJ2rDVpDj2QHopgNk+ocH7RkggCK93/BgOJJ+07Dz
 lbSYme2SRaHn5KPXt4fhcRVjZJDI7cCxcii5MOegS8j9YjdLgQiFHA/8JA56SaK9j6E6WbavlMy
 kY7UxKuMMSkasnk3aHLYiGXubNaNttwyNFbmaWxzlex/jHySK0iNSpE9ODb2hyYVkwDyQiZUwDO
 ASAJyBDGq9yM4bMecqFvoivcOidQO1kGaSIGuZxSVKb4ziktkn4O9
X-Received: by 2002:a05:622a:410a:b0:4b7:aa31:3c54 with SMTP id
 d75a77b69052e-4ba6d819d77mr56422761cf.55.1758167474431; 
 Wed, 17 Sep 2025 20:51:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHk+JT0nmGXpYlGzcsiZnvebGGF+RyXL6mJsOObPCr7jEILfS/0AWa9sVdxR5sxI5O0qDmEZQ==
X-Received: by 2002:a05:622a:410a:b0:4b7:aa31:3c54 with SMTP id
 d75a77b69052e-4ba6d819d77mr56422661cf.55.1758167474005; 
 Wed, 17 Sep 2025 20:51:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-361aa38c4f7sm2799911fa.62.2025.09.17.20.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 20:51:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/5] drm/msm: rework the ties between KMS and GPU parts
 of the driver
Date: Thu, 18 Sep 2025 06:50:21 +0300
Message-Id: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH2By2gC/3XPwQrCMAyA4VeRnq0kaWs3T76HeNhqqgXn5jqHI
 nt3O0GUqZfAH8gHuYvIbeAoVrO7aLkPMdSnFGY+E+5QnPYswy61ICADGlFWsZL75iJjcwydJAv
 IOmcNHkS6aVr24fr0NtvUhxC7ur09+R7H7UtSE6lHCRJRkdflEpfOrusYF+dLcXR1VS3SECPY0
 xsx8IXQiFBOrizAm2L3B1EfCGZTRCUEOEfO2Fog9QfRb8SCmSI6Ib7UFpzO0lv4AxmG4QEbzZH
 1gAEAAA==
X-Change-ID: 20250411-msm-gpu-split-2701e49e40f0
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3268;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=N12mAH4AEAt7MmcqShE1P3CEHF675u7xLlRmXgGx5Xo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoy4GtJ5eB/xL4gUiMVxXXYJu5iL4TDfPX2/WvQ
 AE2GvhevTqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMuBrQAKCRCLPIo+Aiko
 1bGaCACrcfl54E/NPTAiqJJvaiIh87+3wEmrZe5uAs+zCxfSkb/1/O3vl7fIMGOxtOchxgYTAqi
 cNlwfhGmodkeo+b5qM/8DyUuYNje1wRgr4VF1LosjPB1sV4b4V6Hju7/mTqEWi6sImMBFvw9BlD
 ce7JM8BemdWIzrE5XQj/DSR4vFIyxU3nCTq54eOx5bz/uUgnm2jA9TxaSS8hBYyevK1Afifm3tO
 MdYoYTOUQ+HZdQ5hNk0qGui7mAGxKRDkdvddYmBm8AgYLvWSwDL/0nUg2iJWiXAM6SRI8NCZQV0
 J2WFGYHxG6s4TooNwqEc5jy2TQwwR2x4k/mFvVXYy/TEtp+h
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Y-5M92WVs8KcuXay-ir-lu_AfZTpIc3g
X-Proofpoint-ORIG-GUID: Y-5M92WVs8KcuXay-ir-lu_AfZTpIc3g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX8KUEFCQfD2uL
 GD/O+lB3oOXnyufgHsl0WNNYsD3sAcfdMpNlDdDhPObyUaqs0pQFASKVWoggP6AF7HvB6s6aygY
 iR079Utot64mDVUcDYW4InCJ1bu7bJfkyqqgNbjih7o8Za3wkm0KtmkfOAPTq/DVtyKLKcuKyW3
 wwCEAGmIERIPeaAhg8pLCN3vGG4cLZljcyi74BTZ+iskh/sZnEWeR5wfLsfp+RI9/OFWO0QxrrR
 vA/AHRgxI3yDjxHPVRxzdd2N3sQHIgAm01I/+kjdY9BUKIMErn3AbnovlPabcmcbuMxlu9QIJNc
 mYIDndpxDA0svlH4InMxYH9gkyykb95ocCZjEqYuqp1ZsPnrO6Pn0Vbrru65GiVQDEjLT2PPCNE
 5yYEDN9x
X-Authority-Analysis: v=2.4 cv=cf7SrmDM c=1 sm=1 tr=0 ts=68cb81b3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3aS5ecUQXdRO32CnfYUA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
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
Changes in v5:
- Rebased on msm-next, dropped applied patches, re-picked up no-GPU
  patch
- Rewored debugfs, GEM VM_BIND and ioctls code to reduce number of
  #ifdef's
- Link to v4: https://lore.kernel.org/r/20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com

Changes in v4:
- Rebased on msm-next(-robclark)
- Temporarily dropped the "no-GPU" patch, it will be reposted later
  (Rob)
- Link to v3: https://lore.kernel.org/r/20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com

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
Dmitry Baryshkov (5):
      drm/msm: correct separate_gpu_kms description
      drm/msm: split VM_BIND from the rest of GEM VMA code
      drm/msm: split away IOCTLs implementation
      drm/msm: split debugfs implementation
      drm/msm: make it possible to disable GPU support

 drivers/gpu/drm/msm/Kconfig           |   27 +-
 drivers/gpu/drm/msm/Makefile          |   21 +-
 drivers/gpu/drm/msm/msm_debugfs.c     |  420 ------------
 drivers/gpu/drm/msm/msm_debugfs.h     |   14 -
 drivers/gpu/drm/msm/msm_drv.c         |  645 +++---------------
 drivers/gpu/drm/msm/msm_drv.h         |   16 -
 drivers/gpu/drm/msm/msm_gem.h         |   10 +
 drivers/gpu/drm/msm/msm_gem_debugfs.c |   96 +++
 drivers/gpu/drm/msm/msm_gem_vm_bind.c | 1116 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_vma.c     | 1177 +--------------------------------
 drivers/gpu/drm/msm/msm_gem_vma.h     |  119 ++++
 drivers/gpu/drm/msm/msm_gpu.c         |   45 ++
 drivers/gpu/drm/msm/msm_gpu.h         |  111 +++-
 drivers/gpu/drm/msm/msm_gpu_debugfs.c |  213 ++++++
 drivers/gpu/drm/msm/msm_ioctl.c       |  484 ++++++++++++++
 drivers/gpu/drm/msm/msm_ioctl.h       |   37 ++
 drivers/gpu/drm/msm/msm_kms.h         |    8 +
 drivers/gpu/drm/msm/msm_kms_debugfs.c |  129 ++++
 drivers/gpu/drm/msm/msm_submitqueue.c |   12 +-
 19 files changed, 2463 insertions(+), 2237 deletions(-)
---
base-commit: 05af764719214d6568adb55c8749dec295228da8
change-id: 20250411-msm-gpu-split-2701e49e40f0

Best regards,
-- 
With best wishes
Dmitry

