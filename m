Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4E8AFA1DC
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 22:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1328110E0E6;
	Sat,  5 Jul 2025 20:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPt3dgtb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6534110E08D
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 20:44:54 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565KLiNG031138
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 20:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:message-id:mime-version:subject:to; s=
 qcppdkim1; bh=NVOMEBk9XETb8VCTkaF1XJ1ok9rGNFO+jaoA2rVFvDI=; b=mP
 t3dgtbaWpGOdaECM172JKfBmJI9SQx+62pqlTMDLXn2rCg4NWFQUb/4NMDaaIury
 d6XdD37nYMd/PkjX8NpEDk0cun4nz26YXFAjX0uVw+LzoX58z8j+cHZro3fzS2NV
 XGmJt/e10JfaSdZk9IIN2stCwHNNqLdq06SgtBZeJBRVdYdamA6BE0LyLWoQtC7m
 ZDBvumX9QvIj/ucvqkmK0XqjgbGpwmGCoNdISA/xqJ8EGNAtq7qctIpwHpXQ0MYX
 CNIopdTdz+5Io+N+lF4qyYOKfvt2Hcm+aQGCzLK2OBQZ8d0MNV3PIADU1IZbUcUz
 1uGaLAT/t5y4Qdx4VWZg==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrk23kh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 20:44:53 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-2da802bd11eso916981fac.0
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 13:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751748292; x=1752353092;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NVOMEBk9XETb8VCTkaF1XJ1ok9rGNFO+jaoA2rVFvDI=;
 b=eJJ5jzfKQhgbeZTm1lyaNGY4Z3VyFauYbHMcUC7Ngd4PNfu8ZkyvKwkKFvASnSm2Hs
 MaWYp8flOFSBlUmFmK7OEGL4imkwvRwput4ukCvzzRGJ2OUKKbwTGksOjKbd4GpjwkZV
 x85fIIIhVub8WaL/avSz69+a/omaUFpZxajhpyzm+MhKBnxxPNAw4msM5pIRqaePruAx
 zI4VPITOkggKlMVXyun7Mfs1FJeyWuR4oGZZYU0DfqJobN9/KY4LG9TCeo7Xt7EX64HB
 S6DO9sBHEY+kuojojt2F3yT335QW+rEwzK8xsKZy+51KGWrTq2Y9if2d12PnUTapOS+J
 XIBg==
X-Gm-Message-State: AOJu0YwPj9cXokX3XEnjEaQ2eJCRKss8dCAZlZG6k9OXPXeiiVvbTeAS
 osXW+tmQ93Ce7MVR/PW8BTGzzVHoyM5D7bovHpwZH93awpsX5KNlST0RL1ZtjFgiL1dph4Xmxjf
 K0a/BplhZj3LGiTLzas0X8ml5piirzc/NCMYb7LzycOX/zcjzzKXy9yadieiwD412J/PJb7Y3tt
 Qce3OMoZpPXj2eXFuaG7HAAbZQY37X3mZEPKkc9CSkowd3Fg==
X-Gm-Gg: ASbGncvLso/h6H5Z+lO7R5RId4kuyJDZqdHFGRFv1Ph2ztL8p6bjVZymy3IVyvid0tP
 T4plnuXBdORFa2rqqf2gR6m+PfYZsUEzTciOPETnnXZ0TNAe0vcO8yKK/FcWxB+aH/WcmmDIjx7
 O2c4Jnc2D7xfVYYQ3iyInhnzz7yU8GEIZZm2U=
X-Received: by 2002:a05:6808:1895:b0:401:e98b:ee41 with SMTP id
 5614622812f47-40d2d5225e3mr2572655b6e.21.1751748292045; 
 Sat, 05 Jul 2025 13:44:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNuVCZQzVXO4jcbnNnGpDh9AzHxCuaflkcRU1G9PX6aCasDkDyx4Wuc8GgemmJ2NHZJ9KFWzPkCiv541Dr4Q0=
X-Received: by 2002:a05:6808:1895:b0:401:e98b:ee41 with SMTP id
 5614622812f47-40d2d5225e3mr2572638b6e.21.1751748291482; Sat, 05 Jul 2025
 13:44:51 -0700 (PDT)
MIME-Version: 1.0
From: Robin Clark <robin.clark@oss.qualcomm.com>
Date: Sat, 5 Jul 2025 13:44:40 -0700
X-Gm-Features: Ac12FXw2yIXtaB5dcij5_lXphrWSUPOzGla1_eOe-hpI6NnOtkDXI49vgrNQj7I
Message-ID: <CACSVV0217R+kpoWQJeuYGHf6q_4aFyEJuKa=dZZKOnLQzFwppg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2025-07-05 for v6.17
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <freedreno@lists.freedesktop.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: YrbAlggWUX84APWGPg5V6NnGi97rfy0L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEzNyBTYWx0ZWRfX3uP4Um4REF8n
 4/62JGNlOlS8IUXLh+x73drnl1nooxPSMBqqHjU6EXZpD/7EZsfSpejw3JY2UtbQgOLMXNoZV5f
 z2Cu9cnTETK5rYRmEl0sGb4EhpwTnHqtwFJ6F2G2ZeoLYJSZVZDvctrdazbq8eIQSN1XLZTHtyT
 q0quMd8NJhs1bVnvBmsYBzR1l6JSu988cP9YSAN9DTA5hsgaFT+RHN+kriDRYVb29xQKxZtLt+y
 NawYF9nXdOfoL4MdpR3UCtZyWtCxhqVAcilDm0LJXS9oYF0ASernAinRzvjm5+l2fhDpTjl3WNF
 Gl59sCAc/Ew3CtJshSMJX4uflloqE1+ITIj9y41eZmxiDvmm6YK9UxQsldK1ZFxZabivQ+Tq3va
 bBeHnZtbWS0ySBVQuo6ZaR1kf8Q9Fb76i5Da/E6M6eFQbU14ZXXy9vkHD/bKoVQk/Jmnuwtg
X-Proofpoint-GUID: YrbAlggWUX84APWGPg5V6NnGi97rfy0L
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=68698ec5 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=e5mUnYsNAAAA:8 a=Rf3lO9QfSqFDG8CatJQA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050137
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

Hi Dave, Simona,

Pull for v6.17 as described below.  A bit larger this time, bringing
in VM_BIND support, x1-45 support, x1-85 speedbin support, and sm8750
kms support.

The following changes since commit f41830c57bb8e70e283b9db251c95f1270a8279d:

  Merge tag 'drm-misc-next-2025-06-26' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
(2025-06-27 09:58:05 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2025-07-05

for you to fetch changes up to 8290d37ad2b087bbcfe65fa5bcaf260e184b250a:

  drm/msm: Small function param doc fix (2025-07-05 09:59:12 -0700)

----------------------------------------------------------------
Updates for v6.17

CI:
- uprev mesa and ci-templates
- use shallow clone to speed up build jobs
- remove sdm845/cheza jobs.  These runners are no more (RIP
  dear chezas)
- fix runner tag for i915 cml runners
- uprev igt to pull in msm test fixes

Core:
- VM_BIND support!
- single source of truth for UBWC configuration.  Adds a global soc
  driver for UBWC config which is used from display and GPU.  (And
  later vidc/camera/etc)
- Decouple ties between GPU and KMS, adding a `separate_gpu_kms`
  modparam to allow the GPU and KMS to bind to separate DRM devices.
  This should better deal with more exotic SoC configurations where
  the number of GPUs is different from number of DPUs.  The default
  behavior is to still come up as a single unified DRM device to
  avoid surprising userspace.

DP:
- major rework of the I/O accessors

DPU:
- use version checks instead of feature bits
- SM8750 support
- set min_prefill_lines for SC8180X

DSI:
- SM8750 support

GPU:
- speedbin support for X1-85
- X1-45 support

MDSS:
- SM8750 support

----------------------------------------------------------------
Akhil P Oommen (4):
      drm/msm/adreno: Add speedbin support for X1-85
      dt-bindings: power: qcom,rpmpd: add Turbo L5 corner
      dt-bindings: opp: adreno: Update regex of OPP entry
      drm/msm/adreno: Add Adreno X1-45 support

Connor Abbott (5):
      drm/msm: Don't use a worker to capture fault devcoredump
      drm/msm: Delete resume_translation()
      drm/msm: Temporarily disable stall-on-fault after a page fault
      drm/msm: Fix CP_RESET_CONTEXT_STATE bitfield names
      drm/msm/a7xx: Call CP_RESET_CONTEXT_STATE

Dmitry Baryshkov (51):
      drm/msm/dpu: stop passing mdss_ver to setup_timing_gen()
      drm/msm/dpu: drop INTF_SC7280_MASK
      drm/msm/dpu: inline _setup_ctl_ops()
      drm/msm/dpu: inline _setup_dsc_ops()
      drm/msm/dpu: inline _setup_dspp_ops()
      drm/msm/dpu: inline _setup_mixer_ops()
      drm/msm/dpu: remove DSPP_SC7180_MASK
      drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4
      drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
      drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
      drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
      drm/msm/dpu: get rid of DPU_CTL_VM_CFG
      drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
      drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
      drm/msm/dpu: get rid of DPU_INTF_INPUT_CTRL
      drm/msm/dpu: get rid of DPU_PINGPONG_DSC
      drm/msm/dpu: get rid of DPU_PINGPONG_DITHER
      drm/msm/dpu: get rid of DPU_MDP_VSYNC_SEL
      drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
      drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
      drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
      drm/msm/dpu: get rid of DPU_DIM_LAYER
      drm/msm/dpu: get rid of DPU_DSC_HW_REV_1_2
      drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
      drm/msm/dpu: get rid of DPU_WB_INPUT_CTRL
      drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
      drm/msm/dpu: drop unused MDP TOP features
      drm/msm/dpu: drop ununused PINGPONG features
      drm/msm/dpu: drop ununused MIXER features
      drm/msm/dpu: move features out of the DPU_HW_BLK_INFO
      drm/msm/dp: split MMSS_DP_DSC_DTO register write to a separate function
      drm/msm/dp: read hw revision only once
      drm/msm/dp: pull I/O data out of msm_dp_catalog_private()
      drm/msm/dp: move I/O functions to global header
      drm/msm/dp: move/inline AUX register functions
      drm/msm/dp: move/inline panel related functions
      drm/msm/dp: move/inline audio related functions
      drm/msm/dp: move/inline ctrl register functions
      drm/msm/dp: move more AUX functions to dp_aux.c
      drm/msm/dp: move interrupt handling to dp_ctrl
      drm/msm/dp: drop the msm_dp_catalog module
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

James A. MacInnes (2):
      drm/msm/dp: Disable wide bus support for SDM845
      drm/msm/disp: Correct porch timing for SDM845

Konrad Dybcio (15):
      drm/msm/dpu: Fill in min_prefill_lines for SC8180X
      soc: qcom: Add UBWC config provider
      drm/msm: Offset MDSS HBB value by 13
      drm/msm: Use the central UBWC config database
      drm/msm/a6xx: Get a handle to the common UBWC config
      drm/msm/a6xx: Resolve the meaning of AMSBC
      drm/msm/a6xx: Simplify uavflagprd_inv detection
      drm/msm/a6xx: Resolve the meaning of UBWC_MODE
      drm/msm/a6xx: Replace '2' with BIT(1) in level2_swizzling_dis calc
      drm/msm/a6xx: Resolve the meaning of rgb565_predicator
      drm/msm/a6xx: Simplify min_acc_len calculation
      soc: qcom: ubwc: Fix SM6125's ubwc_swizzle value
      soc: qcom: ubwc: Add #defines for UBWC swizzle bits
      soc: qcom: ubwc: Fill in UBWC swizzle cfg for platforms that lack one
      drm/msm/adreno: Switch to the common UBWC config struct

Krzysztof Kozlowski (14):
      drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate
      dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
      dt-bindings: display/msm: dsi-controller-main: Add SM8750
      dt-bindings: display/msm: dp-controller: Add SM8750
      dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
      dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750
      drm/msm/dsi/phy: Add support for SM8750
      drm/msm/dsi: Add support for SM8750
      drm/msm/dpu: Add support for SM8750
      drm/msm/dpu: Consistently use u32 instead of uint32_t
      drm/msm/dpu: Implement 10-bit color alpha for v12.0 DPU
      drm/msm/dpu: Implement CTL_PIPE_ACTIVE for v12.0 DPU
      drm/msm/dpu: Implement LM crossbar for v12.0 DPU
      drm/msm/mdss: Add support for SM8750

Randy Dunlap (1):
      drm/msm/dp: add linux/io.h header to fix build errors

Rob Clark (55):
      drm/msm: Fix a fence leak in submit error path
      drm/msm: Fix another leak in the submit error path
      drm/msm: Rename add_components_mdp()
      drm/msm/adreno: Pass device_node to find_chipid()
      drm/msm/adreno: Check for recognized GPU before bind
      drm/msm: Fix inverted WARN_ON() logic
      Merge remote-tracking branch 'drm/drm-next' into msm-next
      drm/ci: Remove sdm845/cheza jobs
      drm/ci: Uprev igt
      drm/gpuvm: Fix doc comments
      drm/gpuvm: Add locking helpers
      drm/gem: Add ww_acquire_ctx support to drm_gem_lru_scan()
      drm/msm: Rename msm_file_private -> msm_context
      drm/msm: Improve msm_context comments
      drm/msm: Rename msm_gem_address_space -> msm_gem_vm
      drm/msm: Remove vram carveout support
      drm/msm: Collapse vma allocation and initialization
      drm/msm: Collapse vma close and delete
      drm/msm: Don't close VMAs on purge
      drm/msm: Stop passing vm to msm_framebuffer
      drm/msm: Refcount framebuffer pins
      drm/msm: drm_gpuvm conversion
      drm/msm: Convert vm locking
      drm/msm: Use drm_gpuvm types more
      drm/msm: Split out helper to get iommu prot flags
      drm/msm: Add mmu support for non-zero offset
      drm/msm: Add PRR support
      drm/msm: Rename msm_gem_vma_purge() -> _unmap()
      drm/msm: Drop queued submits on lastclose()
      drm/msm: Lazily create context VM
      drm/msm: Add opt-in for VM_BIND
      drm/msm: Mark VM as unusable on GPU hangs
      drm/msm: Add _NO_SHARE flag
      drm/msm: Crashdump prep for sparse mappings
      drm/msm: rd dumping prep for sparse mappings
      drm/msm: Crashdump support for sparse
      drm/msm: rd dumping support for sparse
      drm/msm: Extract out syncobj helpers
      drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
      drm/msm: Add VM_BIND submitqueue
      drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
      drm/msm: Support pgtable preallocation
      drm/msm: Split out map/unmap ops
      drm/msm: Add VM_BIND ioctl
      drm/msm: Add VM logging for VM_BIND updates
      drm/msm: Add VMA unmap reason
      drm/msm: Add mmu prealloc tracepoint
      drm/msm: use trylock for debugfs
      drm/msm: Bump UAPI version
      drm/msm: Defer VMA unmap for fb unpins
      drm/msm: Add VM_BIND throttling
      drm/msm: Update register xml
      drm/msm: Clean up split driver features
      drm/msm: Take the ioctls away from the KMS-only driver
      drm/msm: Small function param doc fix

Ryan Eatmon (1):
      drivers: gpu: drm: msm: registers: improve reproducibility

Vignesh Raman (3):
      drm/ci: python-artifacts: use shallow clone
      drm/ci: uprev mesa and ci-templates
      drm/ci: i915: cml: Fix the runner tag

Yuan Chen (1):
      drm/msm: Add error handling for krealloc in metadata setup

 .../bindings/display/msm/dp-controller.yaml        |    4 +
 .../bindings/display/msm/dsi-controller-main.yaml  |   54 +-
 .../bindings/display/msm/dsi-phy-7nm.yaml          |    1 +
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |    1 +
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  470 +++
 .../bindings/opp/opp-v2-qcom-adreno.yaml           |    2 +-
 drivers/gpu/drm/ci/build-igt.sh                    |    2 +-
 drivers/gpu/drm/ci/build.sh                        |   17 +-
 drivers/gpu/drm/ci/build.yml                       |   10 +-
 drivers/gpu/drm/ci/container.yml                   |   30 +-
 drivers/gpu/drm/ci/gitlab-ci.yml                   |   52 +-
 drivers/gpu/drm/ci/igt_runner.sh                   |    1 +
 drivers/gpu/drm/ci/image-tags.yml                  |   20 +-
 drivers/gpu/drm/ci/lava-submit.sh                  |    6 +-
 drivers/gpu/drm/ci/test.yml                        |   47 +-
 .../xfails/msm-sc7180-trogdor-kingoftown-skips.txt |    5 +
 .../msm-sc7180-trogdor-lazor-limozeen-skips.txt    |    5 +
 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt     |   29 -
 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt    |  139 -
 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt     |  350 --
 drivers/gpu/drm/drm_gem.c                          |   14 +-
 drivers/gpu/drm/drm_gpuvm.c                        |  132 +-
 drivers/gpu/drm/msm/Kconfig                        |   36 +-
 drivers/gpu/drm/msm/Makefile                       |   26 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   25 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c           |   10 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   17 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   17 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c          |    4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   44 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c            |    2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c          |   10 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   48 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   32 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |    2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  205 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |    4 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |    8 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |    2 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          |   12 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   82 +-
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  |    4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  154 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   69 +-
 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |   49 +-
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    |  494 +++
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |    2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |    2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |    2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |    7 -
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |    7 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |    7 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |    4 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |   17 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |   11 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |   39 +-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |   44 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |   29 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |   19 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |   16 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |   38 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |   14 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |    5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |   16 +-
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |    5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |    6 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |   40 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   22 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |   46 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |   43 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |   49 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |   43 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   |   43 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |   48 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   61 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   22 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |    3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   19 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |   20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |    3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   71 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  103 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  145 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   21 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |   21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |    3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     |    5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |   10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |    5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  224 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |    5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |    6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |   11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   65 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   25 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |    2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |    2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |   15 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |   41 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |    2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |   18 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |    6 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   36 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |   18 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  |   12 +-
 drivers/gpu/drm/msm/dp/dp_audio.c                  |  130 +-
 drivers/gpu/drm/msm/dp/dp_audio.h                  |    7 +-
 drivers/gpu/drm/msm/dp/dp_aux.c                    |  216 +-
 drivers/gpu/drm/msm/dp/dp_aux.h                    |   15 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                | 1298 -------
 drivers/gpu/drm/msm/dp/dp_catalog.h                |  113 -
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  607 +++-
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   19 +-
 drivers/gpu/drm/msm/dp/dp_debug.c                  |    5 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |  163 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |    1 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  258 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   13 +-
 drivers/gpu/drm/msm/dp/dp_reg.h                    |   19 +
 drivers/gpu/drm/msm/dsi/dsi.c                      |    4 +-
 drivers/gpu/drm/msm/dsi/dsi.h                      |    2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   14 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |    1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |   75 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |    2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |    1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |    7 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |   79 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |    9 +-
 drivers/gpu/drm/msm/msm_debugfs.c                  |  129 +-
 drivers/gpu/drm/msm/msm_drv.c                      |  381 +--
 drivers/gpu/drm/msm/msm_drv.h                      |   84 +-
 drivers/gpu/drm/msm/msm_fb.c                       |   33 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    |    2 +-
 drivers/gpu/drm/msm/msm_gem.c                      |  536 ++-
 drivers/gpu/drm/msm/msm_gem.h                      |  296 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |   65 +
 drivers/gpu/drm/msm/msm_gem_shrinker.c             |  104 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |  327 +-
 drivers/gpu/drm/msm/msm_gem_vma.c                  | 1514 ++++++++-
 drivers/gpu/drm/msm/msm_gpu.c                      |  228 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |  153 +-
 drivers/gpu/drm/msm/msm_gpu_trace.h                |   14 +
 drivers/gpu/drm/msm/msm_iommu.c                    |  314 +-
 drivers/gpu/drm/msm/msm_kms.c                      |   59 +-
 drivers/gpu/drm/msm/msm_kms.h                      |   48 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |  331 +-
 drivers/gpu/drm/msm/msm_mdss.h                     |   28 -
 drivers/gpu/drm/msm/msm_mmu.h                      |   40 +-
 drivers/gpu/drm/msm/msm_rd.c                       |   62 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c               |   10 +-
 drivers/gpu/drm/msm/msm_submitqueue.c              |   96 +-
 drivers/gpu/drm/msm/msm_syncobj.c                  |  172 +
 drivers/gpu/drm/msm/msm_syncobj.h                  |   37 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      | 3582 ++++----------------
 .../drm/msm/registers/adreno/a6xx_descriptors.xml  |  198 ++
 .../gpu/drm/msm/registers/adreno/a6xx_enums.xml    |  383 +++
 .../drm/msm/registers/adreno/a6xx_perfcntrs.xml    |  600 ++++
 .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |  223 ++
 .../drm/msm/registers/adreno/a7xx_perfcntrs.xml    | 1030 ++++++
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  305 +-
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |   14 +
 drivers/gpu/drm/msm/registers/gen_header.py        |    8 +-
 drivers/soc/qcom/Kconfig                           |    8 +
 drivers/soc/qcom/Makefile                          |    1 +
 drivers/soc/qcom/ubwc_config.c                     |  282 ++
 include/drm/drm_gem.h                              |   10 +-
 include/drm/drm_gpuvm.h                            |    8 +
 include/dt-bindings/power/qcom-rpmpd.h             |    1 +
 include/linux/soc/qcom/ubwc.h                      |   75 +
 include/uapi/drm/msm_drm.h                         |  149 +-
 179 files changed, 11379 insertions(+), 8072 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.h
 delete mode 100644 drivers/gpu/drm/msm/msm_mdss.h
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.c
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.h
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_descriptors.xml
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_enums.xml
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.xml
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_enums.xml
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.xml
 create mode 100644 drivers/soc/qcom/ubwc_config.c
 create mode 100644 include/linux/soc/qcom/ubwc.h
