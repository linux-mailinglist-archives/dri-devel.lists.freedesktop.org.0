Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74A4B37043
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 18:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CCF10E6A6;
	Tue, 26 Aug 2025 16:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBDkVS9/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2269010E0DA
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 16:29:33 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QCF2cP025091
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 16:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:reply-to:subject:to; s=qcppdkim1; bh=Tscxk8lnA09Aw
 TJLl9Pq/EJ+dx1JKgEznU64KBSUuEA=; b=RBDkVS9/IB7/uxFNLqncOQUDSexlD
 eT3nY+9FMXW8mWFEAg93FKfcwKN78om+tt13IRBQRCHYpwb/oYxpHw4KQn44GKTw
 Nl57Zqez5aq7/m6zm/xSKt98x7l5x1MD3iHRgrtwlf96hhJWLcWphWhG2EkalpxK
 6zw7C9id6mFgM2JyfHhBADLwYSwHvOuhOncC6CCD+oSQfRMwLvp/kvFr7yqYFV6K
 yduBazbP2KxdmvsM1/A1gt7VvKTRkjatza543omvsK37aLDCxJ7Pk2qNRt+jw2sd
 nk5S3mirq0jphbNL/hoSdU5RD4d7ecaxLkw0mzDYCPy2eIIVtaztpr6zw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um9qbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 16:29:32 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-435de6f2a16so1918387b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 09:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756225771; x=1756830571;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tscxk8lnA09AwTJLl9Pq/EJ+dx1JKgEznU64KBSUuEA=;
 b=d4y/p1bj38opl0j7WwPS23kMi/Ha6R/6IW/ji/gHs+YuKqSmk7A14TLvIY7i6Qlb7N
 a1Z5kedojt4Cb0Ei8GVnjUUTO72HSvgUZKVy1BxqfOuV4SEawjzF4y68rUoazxnMqoI3
 M30eU66RDqczntaOv8jDC/a91hoNafc5E6Meqkk60DNoo3BGnFGxAKPqo6iTLf6YpNZF
 8bJBYWxH3DGajBpMbe/9REEgvJ2h2VGgv1ujVfOoGplEUImJy+wrjCNYoSrXEfHI+G37
 ZQHvNUztNxmy5xJ5hyitqkyXMIppj1nsrJaLtb7WWOzL7mZyik3TRAsrp002rJn8xtQ9
 QWBA==
X-Gm-Message-State: AOJu0YzZMPlbIT4bqYy6Toot+Oej8n7QYOGGBcHuKn6oj3kksuhqaFLQ
 SeIRcE+gjpUQsfLk67zaafoEGattTktOz/TOUthaoyeWISx3Jn++kHxGUq6NBJSVDEBAp4v+0aO
 Px2yzLIINXSucr0CuHRmr1gtJoAR8yYTThcHs3oBv71kbQR3/DH/t1zCuZQw1yxIMVkq4lcdUBY
 oqR1RWZmEwS2utlrFat8Kw9tERKRI8zvXbIJ2Tyy0SHj+prQ==
X-Gm-Gg: ASbGncu1eNHBTxewsN9DVDwjaJfq0jGxQHEmJUtNlXBy7xcP1mijXKffvSiz8h5IE+m
 xLXHykAku5lRna6eF68aCYRvVNqzrJ4QK0xkpZxpn5C7ju/A+osxNF4Kf3xN0yDhJvjbFySJLsv
 jpUpp4Ir4aQGACTbEaw6TJVXx0eWDqnbEV1+d4uwxy9mfMiEDk/XxU
X-Received: by 2002:a05:6808:23d2:b0:437:761b:961d with SMTP id
 5614622812f47-4378537407amr8347891b6e.44.1756225771389; 
 Tue, 26 Aug 2025 09:29:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDSLcrGe9xj0YCnQ9UzxwRoOzPFqv44GvrHidL3Q3zNYyfxHnl+RlB9NftBJjb1WMFmYiTyMfoqSggWXktKCA=
X-Received: by 2002:a05:6808:23d2:b0:437:761b:961d with SMTP id
 5614622812f47-4378537407amr8347868b6e.44.1756225770863; Tue, 26 Aug 2025
 09:29:30 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 09:29:18 -0700
X-Gm-Features: Ac12FXwFhQA5Ic16p1I53DRT2lsUPtvc6jq5BH8o7osm_vNSb7-qXftHxP2nqCQ
Message-ID: <CACSVV02+u1VW1dzuz6JWwVEfpgTj6Y-JXMH+vX43KsKTVsW+Yg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2025-08-26 for v6.17-rc4
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <freedreno@lists.freedesktop.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>, bjorn.andersson@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ade0ec cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=e5mUnYsNAAAA:8 a=g1uuwZcmdHHBDmomJxkA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX/OiAfR5cGnBm
 l0CYjUL91cgH2VIkv+7xIlenqwNZw10eTbY5a9Lyftcxfwcyv2Ml3qT5FYgZDBB8ZcvvwvxqBsi
 etepsnhcl+78Yg+OGD41gxMpH2TbSNidz0uUN2p2BzeO0xYNRw40e8L6oQBY10qRfOs70u5nY6J
 MA2uqCktMrAi/CK4VwU51ks3Oxogu7EHYGUR4j6TaAfSvYpZPWNiJ0l36zgF3pnbWhY5hizDkFb
 6LprdeOBWazliC8cHnWkJ+el5akzwlkWnYjxNak3dhRyAnpCFxOxeP5hJA8Xi8iLYKPF/YWjoTH
 MjEKTFjCeoWewIOu25ojo+LVHEvAH/ocxML/eRNtF/yJ9vCRwkWyP4DyPpJPT66tU1g26gVPFRc
 S4LF7RBN
X-Proofpoint-GUID: V-e7kyu3xtbUd3ezTsseSsrlK6eIbOPo
X-Proofpoint-ORIG-GUID: V-e7kyu3xtbUd3ezTsseSsrlK6eIbOPo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
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

Fixes for v6.17-rc4.  A bit later than intended, due to gitlab ci
breakage.  (Not completely solved, but I eventually realized I could
workaround it by creating the MR in the main drm/msm tree rather than
my fork.)

Has some soc/qcom/ubwc fixes ack'd by Bjorn to address fallout of
migration to centralized UBWC config provider.

The following changes since commit 8290d37ad2b087bbcfe65fa5bcaf260e184b250a=
:

  drm/msm: Small function param doc fix (2025-07-05 09:59:12 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2025-08-26

for you to fetch changes up to 3cf6147f2b51a569761e1ef010efbd891e3a3a15:

  soc: qcom: use no-UBWC config for MSM8956/76 (2025-08-25 14:01:26 -0700)

----------------------------------------------------------------
Fixes for v6.17-rc4

Core/GPU:
- fix comment doc warning in gpuvm
- fix build with KMS disabled
- fix pgtable setup/teardown race
- global fault counter fix
- various error path fixes
- GPU devcoredump snapshot fixes
- handle in-place VM_BIND remaps to solve turnip vm update race
- skip re-emitting IBs for unusable VMs
- Don't use %pK through printk
- moved display snapshot init earlier, fixing a crash

DPU:
- Fixed crash in virtual plane checking code
- Fixed mode comparison in virtual plane checking code

DSI:
- Adjusted width of resulution-related registers
- Fixed locking issue on 14nm PLLs

UBWC (per Bjorn's ack)
- Added UBWC configuration for several missing platforms (fixing
  regression)

----------------------------------------------------------------
Antonino Maniscalco (1):
      drm/msm: skip re-emitting IBs for unusable VMs

Ayushi Makhija (1):
      drm/msm: update the high bitfield of certain DSI registers

Bagas Sanjaya (1):
      drm/gpuvm: Wrap drm_gpuvm_sm_map_exec_lock() expected usage in
literal code block

Chenyuan Yang (1):
      drm/msm/dpu: Add a null ptr check for dpu_encoder_needs_modeset

Colin Ian King (1):
      drm/msm: Fix dereference of pointer minor before null check

Dmitry Baryshkov (8):
      drm/msm/kms: move snapshot init earlier in KMS init
      drm/msm/dpu: correct dpu_plane_virtual_atomic_check()
      soc: qcom: ubwc: provide no-UBWC configuration
      dt-bindings: display/msm: qcom,mdp5: drop lut clock
      soc: qcom: ubwc: use no-uwbc config for MSM8917
      soc: qcom: ubwc: add more missing platforms
      soc: qcom: add configuration for MSM8929
      soc: qcom: use no-UBWC config for MSM8956/76

Loic Poulain (1):
      drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue

Luca Weiss (1):
      soc: qcom: ubwc: Add missing UBWC config for SM7225

Ma=C3=ADra Canal (1):
      drm/msm: Update global fault counter when faulty process has already =
ended

Nathan Chancellor (1):
      drm/msm/dpu: Initialize crtc_state to NULL in
dpu_plane_virtual_atomic_check()

Rob Clark (15):
      drm/msm: Fix build with KMS disabled
      drm/msm: Fix pagetables setup/teardown serialization
      drm/msm: Fix refcnt underflow in error path
      drm/msm: Fix submit error path cleanup
      drm/msm: Defer fd_install in SUBMIT ioctl
      drm/msm: Defer fd_install in VM_BIND ioctl
      drm/msm: Add missing "location"s to devcoredump
      drm/msm: Fix section names and sizes
      drm/msm: Fix order of selector programming in cluster snapshot
      drm/msm: Constify snapshot tables
      drm/msm: Fix a7xx debugbus read
      drm/msm: Fix debugbus snapshot
      drm/msm: Fix a7xx TPL1 cluster snapshot
      drm/msm: Fix a few comments
      drm/msm: Handle in-place remaps

Sasha Levin (1):
      drm/msm: Fix objtool warning in submit_lock_objects()

Thomas Wei=C3=9Fschuh (1):
      drm/msm: Don't use %pK through printk

 .../devicetree/bindings/display/msm/qcom,mdp5.yaml |  1 -
 drivers/gpu/drm/drm_gpuvm.c                        |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        | 47 +++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        | 38 ++++++------
 .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  | 19 ++++--
 .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  | 10 +--
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  | 34 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  4 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              | 59 ++++++------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |  1 -
 drivers/gpu/drm/msm/msm_debugfs.c                  | 11 ++--
 drivers/gpu/drm/msm/msm_gem.c                      | 13 +++-
 drivers/gpu/drm/msm/msm_gem.h                      |  2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               | 72 ++++++++++++------=
----
 drivers/gpu/drm/msm/msm_gem_vma.c                  | 60 +++++++++++++-----
 drivers/gpu/drm/msm/msm_gpu.c                      | 20 ++++--
 drivers/gpu/drm/msm/msm_iommu.c                    | 16 +++--
 drivers/gpu/drm/msm/msm_kms.c                      | 10 +--
 drivers/gpu/drm/msm/msm_mdss.c                     |  2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      | 14 ++++-
 drivers/gpu/drm/msm/registers/display/dsi.xml      | 28 ++++-----
 drivers/soc/qcom/ubwc_config.c                     | 23 ++++++-
 26 files changed, 301 insertions(+), 197 deletions(-)
