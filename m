Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F5548EF2B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 18:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CBE10E35B;
	Fri, 14 Jan 2022 17:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA7910E35B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 17:21:39 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so8568492wmk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 09:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:mime-version
 :content-disposition:content-transfer-encoding;
 bh=kjv33ksC1LaBz+eH4uHJ9BtWCyCSppHcW6B69JImuKA=;
 b=ST/d+6P668Hv4OqjKK5pY8njVz23qPGkyZE127Tzj6ByzPDfKDQRCg6+42fQe2uNKP
 GpuZn20BBG6kCzbPj5rKpSBSflyyKNajOjGSCsTYi/8VgAHfYYPNrHJrSJzJyOjYppj0
 AwpRq0GRy8kO1hJRL1wTgIqZW/kCoUMGLBLTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:mime-version:content-disposition
 :content-transfer-encoding;
 bh=kjv33ksC1LaBz+eH4uHJ9BtWCyCSppHcW6B69JImuKA=;
 b=JpLRPM1zdF4APhq+/aUUYJ4Z2vjykuqLxSS6ubDrFuo/Oq6bM+pQvBV5rd84WHrA64
 c8mel8K8z+raMmHA6KIEBifT8dIEazFk5M0dBiIeeCl/uPi2aNT6M2qm1oC5MFlmWjR9
 puliMisDr1JvpGZw3vXbi6Ki0+fpCAuSLKZcp1Gtrtq1AvOXrf2ZvFZsCImrxB7bhfRk
 xyB8ZEdlzF8zW/o91jxX5GG7hZ/1o6L5p2z+igGH9orQpEhzXSR/KCCYxBfktZRG5THl
 eb7UhOINmASQpUwo9YBh3UYDQLemZ17EKwLW6oEtAYYYbBjlJFntjShKJQ1EW/zr0ZeN
 OFQw==
X-Gm-Message-State: AOAM5301FLGp0w5+8aPUodxD9Oiht2LEPchV6CU1JLoY527PO/CqLbPh
 W9G2c8k7WYeiepJWgBtDURUv9NsNj07z3w==
X-Google-Smtp-Source: ABdhPJy1P3cAo5JR4n6d2JHOwxnu6kymjDB5wqYjx+p6jJ9q2v9a08ja+dDtS8sieKnqVCvoYKzeGg==
X-Received: by 2002:a1c:980d:: with SMTP id a13mr16690053wme.194.1642180897994; 
 Fri, 14 Jan 2022 09:21:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c11sm12703740wmq.48.2022.01.14.09.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 09:21:37 -0800 (PST)
Date: Fri, 14 Jan 2022 18:20:41 +0100
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] drm-next (merge window fixes really)
Message-ID: <YeGw6f4mhBZd0ZHg@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dim-tools@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: dim-tools@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

drm-next-2022-01-14:
drm fixes for 5.17-rc1:

drivers fixes:
- i915 fixes for ttm backend + one pm wakelock fix
- amdgpu fixes, fairly big pile of small things all over. Note this
  doesn't yet containe the fixed version of the otg sync patch that
  blew up
- small driver fixes: meson, sun4i, vga16fb probe fix

drm core fixes:
- cma-buf heap locking
- ttm compilation
- self refresh helper state check
- wrong error message in atomic helpers
- mipi-dbi buffer mapping

Note there's some conflicts:
- One of the pulls was based on previous release, so I had to redo your
  merge (since I really didn't want to roll forward to a random point in
  the merge window). I tried to pick your exact solution to prevent
  further merge conflict lolz.

- amgpu has some conflicts, you should be fine by just going with the
  version in this pull. Alex tested that what I have in our shared
  rerere/integration tree, if you want to fetch that:

	git://anongit.freedesktop.org/drm/drm-tip drm-tip

I also wasted some time chasing a arm32 bad udelay compile issue until I
realized it's not a regression in this set but been there already, hence
why this pull is a bit late. Alex is looking into that one.

Next week's drm pull is back to Dave.

Cheers, Daniel

The following changes since commit cb6846fbb83b574c85c2a80211b402a6347b60b1:

  Merge tag 'amd-drm-next-5.17-2021-12-30' of ssh://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-12-31 10:59:17 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-01-14

for you to fetch changes up to 4efdddbce7c1329f00c458e85dcaf105aebdc0ed:

  Merge tag 'amd-drm-next-5.17-2022-01-12' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-01-14 15:42:28 +0100)

----------------------------------------------------------------
drm fixes for 5.17-rc1:

drivers fixes:
- i915 fixes for ttm backend + one pm wakelock fix
- amdgpu fixes, fairly big pile of small things all over. Note this
  doesn't yet containe the fixed version of the otg sync patch that
  blew up
- small driver fixes: meson, sun4i, vga16fb probe fix

drm core fixes:
- cma-buf heap locking
- ttm compilation
- self refresh helper state check
- wrong error message in atomic helpers
- mipi-dbi buffer mapping

----------------------------------------------------------------
Alexander Stein (2):
      dt-bindings: display: meson-vpu: Add missing amlogic,canvas property
      dt-bindings: display: meson-dw-hdmi: add missing sound-name-prefix property

Charlene Liu (1):
      drm/amd/display: Add check for forced_clocks debug option

Claudio Suarez (1):
      drm: fix error found in some cases after the patch d1af5cd86997

Daniel Vetter (5):
      Merge tag 'drm-intel-next-fixes-2022-01-13' of git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-fixes-2022-01-13' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-misc-fixes-2022-01-14' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-misc-next-fixes-2022-01-14' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-next-5.17-2022-01-12' of https://gitlab.freedesktop.org/agd5f/linux into drm-next

Evan Quan (1):
      drm/amd/pm: keep the BACO feature enabled for suspend

Felix Kuehling (3):
      drm/amdkfd: Use prange->list head for insert_list
      drm/amdkfd: Use prange->update_list head for remove_list
      drm/amdkfd: Fix DQM asserts on Hawaii

Greg Kroah-Hartman (2):
      drm/amdgpu: use default_groups in kobj_type
      drm/amdkfd: use default_groups in kobj_type

Guchun Chen (1):
      drm/amdgpu: use spin_lock_irqsave to avoid deadlock by local interrupt

Harry Wentland (1):
      drm/amdgpu: Use correct VIEWPORT_DIMENSION for DCN2

James Yao (1):
      drm/amdgpu: add dummy event6 for vega10

Javier Martinez Canillas (1):
      video: vga16fb: Only probe for EGA and VGA 16 color graphic cards

Jiasheng Jiang (1):
      drm/amdkfd: Check for null pointer after calling kmemdup

Jiawei Gu (1):
      drm/amdgpu: Clear garbage data in err_data before usage

Johannes Berg (1):
      drm/ttm: fix compilation on ARCH=um

José Expósito (1):
      drm/amd/display: invalid parameter check in dmub_hpd_callback

Juston Li (1):
      drm/i915/pxp: Hold RPM wakelock during PXP unbind

Kent Russell (1):
      drm/amdkfd: Fix ASIC name typos

Leslie Shi (1):
      drm/amdgpu: Unmap MMIO mappings when device is not unplugged

Liu Ying (1):
      drm/atomic: Check new_crtc_state->active to determine if CRTC needs disable in self refresh mode

Lukas Bulwahn (1):
      drm/amdkfd: make SPDX License expression more sound

Mario Limonciello (4):
      drm/amdgpu: explicitly check for s0ix when evicting resources
      drm/amdgpu: don't set s3 and s0ix at the same time
      drm/amd/display: explicitly set is_dsc_supported to false before use
      drm/amd/display: reset dcn31 SMU mailbox on failures

Matthew Auld (4):
      drm/i915: don't call free_mmap_offset when purging
      drm/i915/ttm: only fault WILLNEED objects
      drm/i915/ttm: add unmap_virtual callback
      drm/i915/ttm: ensure we unmap when purging

Miaoqian Lin (1):
      drm/sun4i: dw-hdmi: Fix missing put_device() call in sun8i_hdmi_phy_get

Mikita Lipski (1):
      drm/amd/display: introduce mpo detection flags

Nicholas Kazlauskas (2):
      drm/amd/display: Don't reinitialize DMCUB on s0ix resume
      drm/amd/display: Add version check before using DP alt query interface

Nirmoy Das (4):
      drm/amdgpu: do not pass ttm_resource_manager to gtt_mgr
      drm/amdkfd: remove unused function
      drm/amdgpu: do not pass ttm_resource_manager to vram_mgr
      drm/amdgpu: recover gart table at resume

Peng Ju Zhou (1):
      drm/amdgpu: Enable second VCN for certain Navy Flounder.

Prike Liang (1):
      drm/amdgpu: not return error on the init_apu_flags

Rajneesh Bhardwaj (1):
      Revert "drm/amdgpu: Don't inherit GEM object VMAs in child process"

Tao Zhou (1):
      drm/amd/pm: only send GmiPwrDnControl msg on master die (v3)

Thomas Zimmermann (1):
      drm/mipi-dbi: Fix source-buffer address in mipi_dbi_buf_copy

Tom St Denis (1):
      drm/amd/amdgpu: Add pcie indirect support to amdgpu_mm_wreg_mmio_rlc()

Weizhao Ouyang (1):
      dma-buf: cma_heap: Fix mutex locking section

Wenjing Liu (1):
      drm/amd/display: unhard code link to phy idx mapping in dc link and clean up

Yi-Ling Chen (1):
      drm/amd/display: Fix underflow for fused display pipes case

yipechai (1):
      drm/amdkfd: enable sdma ecc interrupt event can be handled by event_interrupt_wq_v9

 .../bindings/display/amlogic,meson-dw-hdmi.yaml    |   5 +
 .../bindings/display/amlogic,meson-vpu.yaml        |   6 +
 drivers/dma-buf/heaps/cma_heap.c                   |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   7 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  36 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |  84 +-----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |  17 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  12 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  11 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  40 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  17 ++-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |  11 ++
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h              |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   6 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  23 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |   4 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  44 ++++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   2 +
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |   6 +
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      | 145 +++++++++------------
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  33 +++++
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   7 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  | 114 +++++++++++++---
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dm_cp_psp.h         |   4 +-
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   1 +
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  16 ++-
 drivers/gpu/drm/ast/ast_mode.c                     |   5 +-
 drivers/gpu/drm/drm_atomic_helper.c                |  14 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   8 +-
 drivers/gpu/drm/drm_mipi_dbi.c                     |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   1 -
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |  27 +++-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  18 +--
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |   5 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  48 ++++---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c             |   4 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |   2 +-
 drivers/gpu/drm/ttm/ttm_module.c                   |   4 +-
 drivers/video/fbdev/vga16fb.c                      |  24 ++++
 include/uapi/linux/kfd_sysfs.h                     |   2 +-
 65 files changed, 555 insertions(+), 382 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
