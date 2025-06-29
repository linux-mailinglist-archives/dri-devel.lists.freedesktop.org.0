Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 724B9AED045
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E9D10E0DD;
	Sun, 29 Jun 2025 20:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nz4j9fx/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F38D10E0CA
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:15:49 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TFHZIi017027
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=UKy+/4DqHxMfzHA5JdzyoIJf/leW4BZrrND
 X5QxgVxM=; b=nz4j9fx/Y/RSrJmFN3QPwED5QCrXOm8783bodYkrCPUwuHAxE6U
 wMcI8Buy9f5L8pBnwh/j5SEiqcEfoXDDNKX4Saz1PuTurPwBFTixpDYAtthNPjVR
 cMrknHle1YqnIkJ/zdE8PUNYHBrvexH+fW/3rhZ0f5BxLUFofKnPeMMD8BsI2f8N
 xfHcoOKO/egf68yKnG9pw/FtK4D6KjNPsTYZwbTC/AANjW9VZTiDP24Bxj8tcysp
 uMb0Mv68pIotcbqbAlUxZAF3np2kEveXlX7gH1QdKueAZW6OAcgWUewinaO9al7Q
 w0JgY6Hs2KqP5kvop72b8gl51VP1FUlHPmg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvjpm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:15:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-748e1e474f8so2700164b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228148; x=1751832948;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UKy+/4DqHxMfzHA5JdzyoIJf/leW4BZrrNDX5QxgVxM=;
 b=PHSfCBXPnVtsodbka0LBDixRppbMW2zuZA7JQTfFKWA3po1UA7lHG1HHAtEAWPH8F5
 f1BQU3ZE9pqZ5JNuOSydxLlis+mBAoJBNynXloHZZjaxsH0tF6E4SPIFQIGBWElM7Luq
 vGtIrbMz1oWAQtRlAou7IrjrDOiCSdH+VJ69LV5GyPUdXSio7SHBCu/tXYF8Rs2A+1HC
 uI26Rhoo185/shOlPNlAxctYNoRUfdM5SiHagtR3OdRrekeYxUEobmPuOIqjtNbf3AKM
 OnBpquLr4QZHaRj6ufkfLJ/geutgHeeucFddPuDTnmkulK42pFxu/1fcLya0gob0AZ2s
 Y9ag==
X-Gm-Message-State: AOJu0YzRIdvB2bLVx1J9NTbgHxNEMkN5EdA+cT4gTPU9+W1Y6v+prVDE
 26YIYBRjhAOkmLmqkxzuh2HS0iw9eKb1tScb0nf8/D5WPNRxrNQUu6Pm69vOfaC67ayIcZQGR5N
 9hVgpZXoxVXt2Zs1gIL59JgOTh4t7AqQelGkku00X/7UzVOCTJcj2ma5RvNRLnF9D3yDJdyfPFg
 PF1U4=
X-Gm-Gg: ASbGncu+k0RAGb9UG2uknN9NuD1Xt68BZwoBE9okz4M4FGBUM4SHgpiGlgohVgnSyn7
 4GHiL5jDqVUvVXiQtRK6O9irq6Ua1oBFWHt/j8erEvVG/islUp2ouUSFP1rIj7sxipvF28B4vtA
 wev5eJeS0y0CJmb8D4y2sPFzFEDaweCgSEbWSfOedOBxZY6RIM18HuNjAizzuomRH3agJxCaYlS
 Gryv2EjYBt4lTc1ZvWrgtUc7b/uaIPalCbXPp2fqAbgvSmYSvEE4yx+R2Vqurwk8xLOU3qePZhp
 FN7yhY9CKUHIJkHgtPe1w5L+rocoN22jzg==
X-Received: by 2002:a05:6a00:2409:b0:748:eedb:902a with SMTP id
 d2e1a72fcca58-74af702a36fmr14364084b3a.17.1751228147542; 
 Sun, 29 Jun 2025 13:15:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXXNnZecKoPPYVRMCoHyQ/vx5IeHoF7xrH5dxJ0FWSSQDHRJdxrZ6S8ueB1z9L5IRNIEMCbg==
X-Received: by 2002:a05:6a00:2409:b0:748:eedb:902a with SMTP id
 d2e1a72fcca58-74af702a36fmr14364038b3a.17.1751228147017; 
 Sun, 29 Jun 2025 13:15:47 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af57ef4dbsm7267926b3a.160.2025.06.29.13.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:15:46 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Eugene Lepshy <fekz115@gmail.com>, Haoxiang Li <haoxiang_li2024@163.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Jun Nie <jun.nie@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 linux-kernel@vger.kernel.org (open list),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v9 00/42] drm/msm: sparse / "VM_BIND" support
Date: Sun, 29 Jun 2025 13:12:43 -0700
Message-ID: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lBYAJDoP0ZA_o3HZb50T6qVQ5wY79E67
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68619ef4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=zBYVM8QCAAAA:8 a=Kgy_UhXEN60RKTLpf-gA:9 a=eVM1_HBmYRkA:10 a=YgSuLXRpIuYA:10
 a=te1wHPZ5H10A:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=ArXkYGXkE6hBHcUMFODu:22
X-Proofpoint-ORIG-GUID: lBYAJDoP0ZA_o3HZb50T6qVQ5wY79E67
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX1hYJHeByampZ
 sy3xSzwqoxLI+QrtCo/+bjHT9Bh4jcCdz6drcvsva3HJkQV3jJstu1wz/ZRyIO7UhD43Y9xg0sf
 oSZq5ud+45N7g7X7PKUq5PXx3Gat4U+XipfFwJPe5Ki6vmhDQ6Kf3qDlVG1qtK2aS4LuM2Rkodo
 Azc9AZ7dm7ti5RzpE/4TbptBUvnwH+rujml1qXXMDOkJpeLvgDjV02cgLu/2sKLhd4sPJJscWye
 QzY0RKlwJ6yLu+PedvZ4HgGX0Lj6lIuJAUU9qIwIWPaytj/2qarwWBcjyLRWbI6gi16Ry8lJVAW
 Gjgb2tJVZRkWG+31Jxa3idG60Sq+KG1vmwFWKCnjGFT+kewbFkpEXoAq6/5g44V1/x06zqXYseV
 r44anNuhCVMj0+OER/5u3aw+eqp9uAdK07c9+usBYq0XRlPoDJ+SabkSVxfdydD05DoBQWhk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172
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

      Conversion to DRM GPU VA Manager[1], and adding support for Vulkan Sparse
Memory[2] in the form of:

1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP_MAP/
   MAP_NULL/UNMAP commands

2. A new VM_BIND ioctl to allow submitting batches of one or more
   MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue

I did not implement support for synchronous VM_BIND commands.  Since
userspace could just immediately wait for the `SUBMIT` to complete, I don't
think we need this extra complexity in the kernel.  Synchronous/immediate
VM_BIND operations could be implemented with a 2nd VM_BIND submitqueue.

The corresponding mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32533

Changes in v9:
- Rework VM_BIND throttling to not use gpu-sched's waitqueue
- Link to v8: https://lore.kernel.org/all/20250629140537.30850-1-robin.clark@oss.qualcomm.com/

Changes in v8:
- Just a rebase and collecting tags
- Link to v7: https://lore.kernel.org/all/20250625184918.124608-1-robin.clark@oss.qualcomm.com/

Changes in v7:
- Rebase on, and use, gpuvm locking helpers[4], included in this
  series.
- Various small fixes
- Link to v6: https://lore.kernel.org/all/20250605183111.163594-1-robin.clark@oss.qualcomm.com/

Changes in v6:
- Drop io-pgtable-arm patch as it has already been picked up in the
  iommu tree.
- Rework to drop gpuvm changes.  To mitigate the limitation of gpuvm
  when it comes to lazy unmap (and to avoid ~5ms of unmap per pageflip!)
  a vma_ref refcount is added.  This refcount is incremented when a BO
  is pinned for scanout, and for userspace handles and dma-bufs.  The
  VMA is torn down when this count drops to zero, breaking the reference
  loop between the VM_BO and BO.  But as long as a pin or userspace
  handle is keeping a reference to the BO live, we allow the harmless
  reference loop to live.  (This is only for kernel managed VMs, which
  includes the kms VM.)  If no userspace process has some sort of
  handle to the BO, it is unlikely to be reused again.  (The exception
  is GET_FB, but in that case the vma_ref >= 1 due to pin for scan-
  out.)
- Drop gpu sched changes for throttling and move this into the driver.
  We can re-visit a more generic solution when some other driver
  realizes they need the same thing.
- Link to v5: https://lore.kernel.org/all/20250519175348.11924-1-robdclark@gmail.com/

Changes in v5:
- Improved drm/sched enqueue_credit comments, and better define the
  return from drm_sched_entity_push_job()
- Improve DRM_GPUVM_VA_WEAK_REF comments, and additional WARN_ON()s to
  make it clear that some of the gpuvm functionality is not available
  in this mode.
- Link to v4: https://lore.kernel.org/all/20250514175527.42488-1-robdclark@gmail.com/

Changes in v4:
- Various locking/etc fixes
- Optimize the pgtable preallocation.  If userspace sorts the VM_BIND ops
  then the kernel detects ops that fall into the same 2MB last level PTD
  to avoid duplicate page preallocation.
- Add way to throttle pushing jobs to the scheduler, to cap the amount of
  potentially temporary prealloc'd pgtable pages.
- Add vm_log to devcoredump for debugging.  If the vm_log_shift module
  param is set, keep a log of the last 1<<vm_log_shift VM updates for
  easier debugging of faults/crashes.
- Link to v3: https://lore.kernel.org/all/20250428205619.227835-1-robdclark@gmail.com/

Changes in v3:
- Switched to seperate VM_BIND ioctl.  This makes the UABI a bit
  cleaner, but OTOH the userspace code was cleaner when the end result
  of either type of VkQueue lead to the same ioctl.  So I'm a bit on
  the fence.
- Switched to doing the gpuvm bookkeeping synchronously, and only
  deferring the pgtable updates.  This avoids needing to hold any resv
  locks in the fence signaling path, resolving the last shrinker related
  lockdep complaints.  OTOH it means userspace can trigger invalid
  pgtable updates with multiple VM_BIND queues.  In this case, we ensure
  that unmaps happen completely (to prevent userspace from using this to
  access free'd pages), mark the context as unusable, and move on with
  life.
- Link to v2: https://lore.kernel.org/all/20250319145425.51935-1-robdclark@gmail.com/

Changes in v2:
- Dropped Bibek Kumar Patro's arm-smmu patches[3], which have since been
  merged.
- Pre-allocate all the things, and drop HACK patch which disabled shrinker.
  This includes ensuring that vm_bo objects are allocated up front, pre-
  allocating VMA objects, and pre-allocating pages used for pgtable updates.
  The latter utilizes io_pgtable_cfg callbacks for pgtable alloc/free, that
  were initially added for panthor.
- Add back support for BO dumping for devcoredump.
- Link to v1 (RFC): https://lore.kernel.org/dri-devel/20241207161651.410556-1-robdclark@gmail.com/T/#t

[1] https://www.kernel.org/doc/html/next/gpu/drm-mm.html#drm-gpuvm
[2] https://docs.vulkan.org/spec/latest/chapters/sparsemem.html
[3] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=909700
[4] https://lore.kernel.org/all/20250620154537.89514-1-robin.clark@oss.qualcomm.com/

Rob Clark (42):
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

 drivers/gpu/drm/drm_gem.c                     |   14 +-
 drivers/gpu/drm/drm_gpuvm.c                   |  132 +-
 drivers/gpu/drm/msm/Kconfig                   |    1 +
 drivers/gpu/drm/msm/Makefile                  |    1 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |   25 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c      |    5 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |   17 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |   17 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |    4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   22 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c       |    2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c     |   10 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   32 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h         |    2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   49 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |    6 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |   10 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |    4 -
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |   98 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   23 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |   20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |    3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |    2 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |    6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |   28 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |   18 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |    4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |   19 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |   18 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |   14 +-
 drivers/gpu/drm/msm/msm_drv.c                 |  185 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   30 +-
 drivers/gpu/drm/msm/msm_fb.c                  |   33 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |    2 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  536 +++---
 drivers/gpu/drm/msm/msm_gem.h                 |  296 +++-
 drivers/gpu/drm/msm/msm_gem_prime.c           |   65 +
 drivers/gpu/drm/msm/msm_gem_shrinker.c        |  104 +-
 drivers/gpu/drm/msm/msm_gem_submit.c          |  300 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c             | 1513 ++++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.c                 |  208 ++-
 drivers/gpu/drm/msm/msm_gpu.h                 |  144 +-
 drivers/gpu/drm/msm/msm_gpu_trace.h           |   14 +
 drivers/gpu/drm/msm/msm_iommu.c               |  302 +++-
 drivers/gpu/drm/msm/msm_kms.c                 |   18 +-
 drivers/gpu/drm/msm/msm_kms.h                 |    2 +-
 drivers/gpu/drm/msm/msm_mmu.h                 |   38 +-
 drivers/gpu/drm/msm/msm_rd.c                  |   62 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c          |   10 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |   96 +-
 drivers/gpu/drm/msm/msm_syncobj.c             |  172 ++
 drivers/gpu/drm/msm/msm_syncobj.h             |   37 +
 include/drm/drm_gem.h                         |   10 +-
 include/drm/drm_gpuvm.h                       |    8 +
 include/uapi/drm/msm_drm.h                    |  149 +-
 58 files changed, 3731 insertions(+), 1260 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.c
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.h

-- 
2.50.0

