Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB73660A0D
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 00:05:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A8910E174;
	Fri,  6 Jan 2023 23:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C9310E174
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 23:05:06 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id r2so2625913wrv.7
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 15:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:content-disposition:mime-version
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zqz2c15YdsTf/vosYEGg1J/pQE1F5HJIRHSLzaSGoc8=;
 b=cG19kKeLS6D/bEFR2TVrMijwS5ZzsGsmowfl9d3IKI43XJWEC2nx3nzMge9uQ71cYe
 rsG650r2MbMfOogivN7O3CgQGiqBNDznV5jK2PuHR4y6LtAbGryHySPY9BMo7kBokemq
 r3Far+DoCkSEbOT79eEWsqDacXZ5U/AJct/zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-disposition:mime-version
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zqz2c15YdsTf/vosYEGg1J/pQE1F5HJIRHSLzaSGoc8=;
 b=3I4Jr5cuDzu1H0iwyzt56CarCL6cuvP2QYwtQEyXv5tBI4viCBe1G/9TYtw8Ztu3Gc
 VfQyZ1rHhnVCebKdTJrk2hXfE1Xo5fJgpIMEkuFU18l/G022Ao67evAgrJn0OJTxZCwl
 qUjw7Znvvt87zUMoJOBqqHJfVLhyeVxKdDqdb2GC4biFD7FO6YKrv0C3YzH6V0QWR4Z0
 TkIiLYi1iKtPcMxZ5/8I0WVY6tNEmz57UcLihHx1jN+H+3p2AEUaHAy1ezGaJ1Tdc8+a
 YfeQsWcchnQfmiWrI0qa/uUfYG4XDTF8Cx1HOkBus6UjfWV2TldQE8ZzfSvy03JfwuNL
 uIvQ==
X-Gm-Message-State: AFqh2ko8yoUM1G1sZ+fap5Z7iENwY/qQBt9cOuIJgDM3VIi4r+UCuOON
 RdpEF8oOEO1Zlfq6PrTLNfb7Pg==
X-Google-Smtp-Source: AMrXdXtGE2LfYknIL3jkyctQbCkBvch/sStXCgCbWfCvJUq3Us6jXKqGoqm8Feslig4AY32+2VoFNQ==
X-Received: by 2002:adf:e690:0:b0:2b3:f6f:293b with SMTP id
 r16-20020adfe690000000b002b30f6f293bmr5305633wrm.47.1673046304852; 
 Fri, 06 Jan 2023 15:05:04 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a5d4682000000b0028d66c43101sm2299161wrq.29.2023.01.06.15.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 15:05:04 -0800 (PST)
Date: Sat, 7 Jan 2023 00:05:01 +0100
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] drm-fixes
Message-ID: <Y7ipHUfN00F3abQf@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Dave Airlie <airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus

Still not much, but more than last week. Dave should be back next week
from the beaching.

drm-fixes-2023-01-06:
drm-fixes for 6.2-rc3

drivers:
- i915-gvt fixes
- amdgpu/kfd fixes
- panfrost bo refcounting fix
- meson afbc corruption fix
- imx plane width fix

core:
- drm/sched fixes
- drm/mm kunit test fix
- dma-buf export error handling fixes

Cheers, Daniel

The following changes since commit 88603b6dc419445847923fcb7fe5080067a30f98:

  Linux 6.2-rc2 (2023-01-01 13:53:16 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-01-06

for you to fetch changes up to 5193326c4c5a656c733b6d2c6537e3f36319bcac:

  Merge tag 'drm-intel-fixes-2023-01-05' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2023-01-06 10:16:49 +0100)

----------------------------------------------------------------
drm-fixes for 6.2-rc3

drivers:
- i915-gvt fixes
- amdgpu/kfd fixes
- panfrost bo refcounting fix
- meson afbc corruption fix
- imx plane width fix

core:
- drm/sched fixes
- drm/mm kunit test fix
- dma-buf export error handling fixes

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/tests: reduce drm_mm_test stack usage

Carlo Caione (1):
      drm/meson: Reduce the FIFO lines held when AFBC is not used

Christian König (1):
      dma-buf: fix dma_buf_export init order v2

Dan Carpenter (1):
      drm/i915: unpin on error in intel_vgpu_shadow_mm_pin()

Daniel Vetter (4):
      Merge tag 'drm-misc-next-fixes-2023-01-03' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-misc-fixes-2023-01-05' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'amd-drm-fixes-6.2-2023-01-04' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2023-01-05' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Dmitry Osipenko (2):
      drm/scheduler: Fix lockup in drm_sched_entity_kill()
      drm/scheduler: Fix lockup in drm_sched_entity_kill()

Ma Jun (1):
      drm/plane-helper: Add the missing declaration of drm_atomic_state

Maxime Ripard (1):
      Merge drm/drm-fixes into drm-misc-fixes

Michel Dänzer (1):
      Revert "drm/amd/display: Enable Freesync Video Mode by default"

Mukul Joshi (1):
      drm/amdkfd: Fix kernel warning during topology setup

Philipp Zabel (1):
      drm/imx: ipuv3-plane: Fix overlay plane width

Rodrigo Vivi (1):
      Merge tag 'gvt-fixes-2023-01-05' of https://github.com/intel/gvt-linux into drm-intel-fixes

Samson Tam (1):
      drm/amd/display: Uninitialized variables causing 4k60 UCLK to stay at DPM1 and not DPM0

Steven Price (1):
      drm/panfrost: Fix GEM handle creation ref-counting

Xiu Jianfeng (1):
      drm/virtio: Fix memory leak in virtio_gpu_object_create()

Zheng Wang (1):
      drm/i915/gvt: fix double free bug in split_2MB_gtt_entry

Zhenyu Wang (2):
      drm/i915/gvt: fix gvt debugfs destroy
      drm/i915/gvt: fix vgpu debugfs clean in remove

Zhi Wang (1):
      drm/i915/gvt: use atomic operations to change the vGPU status

 drivers/dma-buf/dma-buf-sysfs-stats.c              |  7 +-
 drivers/dma-buf/dma-buf-sysfs-stats.h              |  4 +-
 drivers/dma-buf/dma-buf.c                          | 82 ++++++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 27 +++++++
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 12 ++--
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |  6 +-
 drivers/gpu/drm/i915/gvt/debugfs.c                 | 36 ++++++++--
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |  3 +-
 drivers/gpu/drm/i915/gvt/gtt.c                     | 21 ++++--
 drivers/gpu/drm/i915/gvt/gvt.h                     | 15 ++--
 drivers/gpu/drm/i915/gvt/interrupt.c               |  2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   | 35 ++++-----
 drivers/gpu/drm/i915/gvt/scheduler.c               |  4 +-
 drivers/gpu/drm/i915/gvt/vgpu.c                    | 12 ++--
 drivers/gpu/drm/imx/ipuv3-plane.c                  | 14 ++--
 drivers/gpu/drm/meson/meson_viu.c                  |  5 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            | 27 ++++---
 drivers/gpu/drm/panfrost/panfrost_gem.c            | 16 +----
 drivers/gpu/drm/panfrost/panfrost_gem.h            |  5 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c             |  4 +-
 drivers/gpu/drm/tests/Makefile                     |  2 +
 drivers/gpu/drm/tests/drm_mm_test.c                |  6 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |  6 +-
 include/drm/drm_plane_helper.h                     |  1 +
 27 files changed, 204 insertions(+), 153 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
