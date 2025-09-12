Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51AAB55491
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 18:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A51710EC9D;
	Fri, 12 Sep 2025 16:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoiM5oG0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2991010E13A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 16:21:27 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fDpw018545
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 16:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:reply-to:subject:to; s=qcppdkim1; bh=kAd2AobEGoTj1
 f+nMyz1tHZIyzQVsciZmCJNX4DyVy0=; b=IoiM5oG0+Zko1+E1XtCn1l2FKiokq
 DlUeP4FD/LlMSBOLjmxDxvPqfpGdB1SmSoN6/EAsoeeWXdkym0ifx7+pFEkR9zU6
 0uwmcbFJ6v+PXWYBM3cWvQGim2vWU1y+EDWMDJJs/k9kxhYCLItGwT84Wct5QO6q
 QiG0H0NCXkm9qqP+T519ihu+4iRzFaoxvR1m/pyA39X2kpN8wwZQnHH60/K6dR4O
 388LHIXvsEkeW4cQZipbZMr7dC2kCyxKUbp9fAy+Lg6rPPfxYSRx7YG6KCOHqbi/
 K16E2hUlSQz3Rlf44PA+40QkjCrxVWbTQxZtCo5D1/swv5jZQrecFDtCw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8am7xu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 16:21:26 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-322f0a39f0bso2658336fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 09:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757694085; x=1758298885;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kAd2AobEGoTj1f+nMyz1tHZIyzQVsciZmCJNX4DyVy0=;
 b=wCfJn2nR4Uqce5PCUKzyUhyHfZTRelszKerURris7ZPygWxBbHYwryE2cGAhkJFCXQ
 B9tGzRAgvjVJZYVEoztTyX+Stax/0LlcaNNe2/tN7BXXV5R/Ld7xbDSvYTlh7eaxjCjv
 O3JzbhzdojLFbPBXK68aSBLRYwmEbwk+HFWSS7MsXUUguczRUUQtz7T/rbN6XnDR92zd
 L3aGtgCDqKk8ZiZEK6+2iwDmDvn60fd+GFetpPd7/qeiiSa3MGsZ0L4BBwvmgGXzxjFc
 uvEuHmf7nBygkVmGEqsow43nEdX4KZp55v6UEWusvvZOtKfo3ZAeWM2wDYi4huJdYZxN
 Z3LQ==
X-Gm-Message-State: AOJu0YwDZDyGadWClLGNUBiOSWhDGztIwMjJewU6H8i45AxDFfS6KncL
 OQS6NGnSSfoxJTwj+Px+LEJugYQ8DLdIlzels6ucx47vEPI5VK4CQUuU/3wYd5uCtbuo9dlWYDQ
 jFU04tlOaAAuwBnC8Gz/egTAMmD/yZltP8hy4L1YB4ZoMs27EEUJLFbvC3hf6zIdoKw9eS6YPyS
 mrwrNM3fJa9epp4jMkSJ3QFgR2C4b6EHbYDo7WUVueoXwhvg==
X-Gm-Gg: ASbGncumv3cq2eNetwoyW99jfDREsjEkGZ0t3k7e8t8xWnblh69IOaBrs8ivBywtzYl
 HrDYhQ4v8tmErBGOzKzLbSTpU+pxgz4k1j6qMhsNx/T0Zba0LmmF8HC1LGgiH28tn35ZcRrqqpk
 0tJdPvpSnt/S0qiRWEQxI6YTRK9tjohI8NQ7vyg1t6rILjv1OF6RRg
X-Received: by 2002:a05:6870:f693:b0:31d:66fd:2983 with SMTP id
 586e51a60fabf-32e569bb891mr1835576fac.25.1757694085222; 
 Fri, 12 Sep 2025 09:21:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNFmFsDgJsjpefrAcKiNBhMzRjY8Zyxt/Go0KzQ8K0xqsyrvpi/0MsWxA8SzT7mgMW5HwZPiNJoN5KnvBjS/c=
X-Received: by 2002:a05:6870:f693:b0:31d:66fd:2983 with SMTP id
 586e51a60fabf-32e569bb891mr1835562fac.25.1757694084740; Fri, 12 Sep 2025
 09:21:24 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 09:21:13 -0700
X-Gm-Features: Ac12FXzVq27rLAW4kvOmMNB6X91LvJU70vbiLqbiA1FHOeLiTZ9BEAv82lUZ4EQ
Message-ID: <CACSVV01FgXN+fD6U1Hi6Tj4WCf=V-+NO8BXi+80iS4qOZwpaGg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2025-09-12 for v6.18
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <freedreno@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <linux-arm-msm@vger.kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c44886 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=e5mUnYsNAAAA:8 a=kE7DOtztN9XNP4Sh3kwA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 9GUz6StlB8evuO5H6ZEBMcq2Y1FnIj8H
X-Proofpoint-ORIG-GUID: 9GUz6StlB8evuO5H6ZEBMcq2Y1FnIj8H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX/6S1OSWvGYWF
 S5lJ6qRz9BmyPsq9RG8gvZ/A0plwfTmHHoVZHS9/uyRBF8+T/giBueYBwCDsBc7O1JeZvCUak5k
 vC8JbduQ7sh/Ey6VhRNTo3XJ/u4E/eRV9i1lJSDNM+Japb6F6AronRygt6ytnVMcgDJJxsfG0ef
 2BM+G098/g1dM9RkrBJ2YsQhqxxnmE7UlspoLZynWnoZMLu1S2YdcWcI22PZSBoYMI2uGe79twk
 e7YLJRG194rILxWiPlzPcDtqYe/zHz4o+g9NouesAsOhWNBra+pRdyDS0eFNW3CMp+O/V7IBrN/
 41nOsB8HBsPIa4SvOsIuj6fMVJEbs9Q4gCUs29ZLK7+Jnhiq/IasbAYBTER9IFiXyvPHLAhLhYH
 U1aQnog4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

Pull for v6.18, as described below.

The following changes since commit 3cf6147f2b51a569761e1ef010efbd891e3a3a15=
:

  soc: qcom: use no-UBWC config for MSM8956/76 (2025-08-25 14:01:26 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2025-09-12

for you to fetch changes up to b5bad77e1e3c7249e4c0c88f98477e1ee7669b63:

  drm/msm/registers: Sync GPU registers from mesa (2025-09-10 14:48:12 -070=
0)

----------------------------------------------------------------
Changes for v6.18

GPU and Core:
- in DT bindings describe clocks per GPU type
- GMU bandwidth voting for x1-85
- a663 speedbins
- a623 speedbins
- cleanup some remaining no-iommu leftovers after VM_BIND conversion
- fix GEM obj 32b size truncation
- add missing VM_BIND param validation
- various fixes
- IFPC for x1-85 and a750
- register xml and gen_header.py sync from mesa

Display:
- add missing bindings for display on SC8180X
- added DisplayPort MST bindings
- conversion from round_rate() to determine_rate()
- DSI PHY fixes, correcting programming glitches
- misc small fixes

----------------------------------------------------------------
Abhinav Kumar (4):
      dt-bindings: display/msm: qcom,x1e80100-mdss: correct DP addresses
      dt-bindings: display/msm: dp-controller: add X1E80100
      dt-bindings: display/msm: drop assigned-clock-parents for dp controll=
er
      dt-bindings: display/msm: expand to support MST

Akhil P Oommen (21):
      drm/msm/adreno: Add speedbins for A663 GPU
      drm/msm/adreno: Add speedbin data for A623 GPU
      drm/msm: Update GMU register xml
      drm/msm: a6xx: Fix gx_is_on check for a7x family
      drm/msm/a6xx: Poll additional DRV status
      drm/msm/a6xx: Fix PDC sleep sequence
      drm/msm: a6xx: Refactor a6xx_sptprac_enable()
      drm/msm: Add an ftrace for gpu register access
      drm/msm/adreno: Add fenced regwrite support
      drm/msm/a6xx: Set Keep-alive votes to block IFPC
      drm/msm/a6xx: Switch to GMU AO counter
      drm/msm/a6xx: Poll AHB fence status in GPU IRQ handler
      drm/msm: Add support for IFPC
      drm/msm/a6xx: Fix hangcheck for IFPC
      drm/msm/adreno: Disable IFPC when sysprof is active
      drm/msm/a6xx: Make crashstate capture IFPC safe
      drm/msm/a6xx: Enable IFPC on Adreno X1-85
      drm/msm/a6xx: Enable IFPC on A750 GPU
      drm/msm: Fix bootup splat with separate_gpu_drm modparam
      drm/msm/adreno: Add a modparam to skip GPU
      drm/msm/a6xx: Add a comment to acd_probe()

Antonino Maniscalco (1):
      drm/msm: make sure to not queue up recovery more than once

Barnab=C3=A1s Cz=C3=A9m=C3=A1n (1):
      dt-bindings: display/msm/gpu: describe A505 clocks

Brian Masney (9):
      drm/msm/dsi_phy_10nm: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_14nm: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_28nm_8960: convert from round_rate() to determine_rat=
e()
      drm/msm/dsi_phy_28nm: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_7nm: convert from round_rate() to determine_rate()
      drm/msm/hdmi_phy_8996: convert from round_rate() to determine_rate()
      drm/msm/hdmi_phy_8998: convert from round_rate() to determine_rate()
      drm/msm/disp/mdp4/mdp4_lvds_pll: convert from round_rate() to
determine_rate()
      drm/msm/hdmi_pll_8960: convert from round_rate() to determine_rate()

Christophe JAILLET (1):
      drm/msm/mdp4: Consistently use the "mdp4_" namespace

Colin Ian King (1):
      drm/msm: remove extraneous semicolon after a statement

Dmitry Baryshkov (14):
      dt-bindings: display/msm/gpu: account for 7xx GPUs in clocks conditio=
ns
      dt-bindings: display/msm/gpu: describe alwayson clock
      dt-bindings: display/msm/gpu: describe clocks for each Adreno GPU typ=
e
      dt-bindings: display/msm: dsi-controller-main: add SC8180X
      dt-bindings: display/msm: describe DPU on SC8180X
      dt-bindings: display/msm: describe MDSS on SC8180X
      drm/msm/dpu: use drmm_writeback_connector_init()
      dt-bindings: display/msm: dp-controller: allow eDP for SA8775P
      dt-bindings: display/msm: dp-controller: fix fallback for SM6350
      dt-bindings: display/msm: dp-controller: document DP on SM7150
      drm/msm/mdp4: stop supporting no-IOMMU configuration
      drm/msm: stop supporting no-IOMMU configuration
      drm/msm: don't return NULL from msm_iommu_new()
      drm/msm/mdp4: use msm_kms_init_vm() instead of duplicating it

Jessica Zhang (2):
      drm/msm/dpu: Filter modes based on adjusted mode clock
      drm/msm/dpu: Drop maxwidth from dpu_lm_sub_blks struct

Jie Zhang (1):
      dt-bindings: display/msm/gmu: Update Adreno 623 bindings

Jiri Slaby (SUSE) (1):
      drm/msm: use dev_fwnode()

Jun Nie (3):
      drm/msm: Do not validate SSPP when it is not ready
      drm/msm/dpu: polish log for resource allocation
      drm/msm/dpu: decide right side per last bit

Krzysztof Kozlowski (4):
      drm/msm/dsi/phy: Toggle back buffer resync after preparing PLL
      drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
      drm/msm/dsi/phy_7nm: Fix missing initial VCO rate
      drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared

Liao Yuanhong (1):
      drm/msm/mdp4: remove the use of dev_err_probe()

Neil Armstrong (1):
      drm/msm: adreno: a6xx: enable GMU bandwidth voting for x1e80100 GPU

Qianfeng Rong (1):
      drm/msm/dpu: fix incorrect type for ret

Rob Clark (9):
      drm/msm: Fix obj leak in VM_BIND error path
      drm/msm: Fix missing VM_BIND offset/range validation
      drm/msm: Fix 32b size truncation
      drm/msm: Drop unneeded NULL check
      drm/msm/registers: Remove license/etc from generated headers
      drm/msm/registers: Sync gen_header.py from mesa
      drm/msm/registers: Make TPL1_BICUBIC_WEIGHTS_TABLE an array
      drm/msm/registers: Generate _HI/LO builders for reg64
      drm/msm/registers: Sync GPU registers from mesa

Rob Herring (Arm) (1):
      drm/msm: Use of_reserved_mem_region_to_resource() for "memory-region"

 .../bindings/display/msm/dp-controller.yaml        | 146 ++++-
 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../devicetree/bindings/display/msm/gmu.yaml       |  34 +
 .../devicetree/bindings/display/msm/gpu.yaml       | 223 ++++++-
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  26 +-
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  10 +-
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     |   3 +-
 .../bindings/display/msm/qcom,sc8180x-dpu.yaml     | 103 +++
 .../bindings/display/msm/qcom,sc8180x-mdss.yaml    | 359 +++++++++++
 .../bindings/display/msm/qcom,sm7150-mdss.yaml     |  16 +-
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  10 +-
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  20 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  92 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 108 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |  14 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 242 +++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   3 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  10 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  34 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          |  44 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  13 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  21 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |  35 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h      |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  17 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   5 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  10 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  29 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |   2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c      |  47 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |  16 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  34 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         |  21 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c    |  32 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  95 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c           |  16 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c           |  16 +-
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c           |  12 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   1 +
 drivers/gpu/drm/msm/msm_drv.h                      |   2 +-
 drivers/gpu/drm/msm/msm_gem.c                      |  21 +-
 drivers/gpu/drm/msm/msm_gem.h                      |   6 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |   2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c                  |  31 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   2 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |   9 +
 drivers/gpu/drm/msm/msm_gpu_trace.h                |  12 +
 drivers/gpu/drm/msm/msm_iommu.c                    |   8 +-
 drivers/gpu/drm/msm/msm_kms.c                      |  14 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |   3 +-
 drivers/gpu/drm/msm/msm_submitqueue.c              |   4 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      | 718 ++++++++++++-----=
----
 .../drm/msm/registers/adreno/a6xx_descriptors.xml  |  40 --
 .../gpu/drm/msm/registers/adreno/a6xx_enums.xml    |  50 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |  11 +
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    | 179 ++---
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |  11 +-
 drivers/gpu/drm/msm/registers/gen_header.py        | 201 +++---
 67 files changed, 2340 insertions(+), 946 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml
