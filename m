Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31251466BA8
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 22:27:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFE56F448;
	Thu,  2 Dec 2021 21:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6736F448
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 21:27:16 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id t5so3607373edd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 13:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=D/nDffzm1vMPDEjNds0Hj5SZg6VwZzl34xLZ1SnbtI8=;
 b=Lhr8AqwShuf91luiUH6YUTNGqzm4hWwDH1MQvZRCqFHQ0CVv6VMUdOF0usax3EjhTf
 6YzTm+/LwQJfr3CrW1BXNbm9+F0Dl2uXNvAkBiV7aLacdcvoQyrqzjHpTPlkJ07m6eFN
 dByEX8hWSrbD7cP5TUgg5nuShuVEQTU2FlwUak9GabpxA9kasIGj56QnLXq1ufO3QIt7
 KJXk4lQOiwRYT8hOZZbU0r1eVbilY2EN7b/jiuGdzyOTNSUlq4Oy9XWfDAKTxL/4cSdS
 Qd3613QaW/iAzsfPsCr60eDslfdksTJx1lhEJannPcHVkaYw6ro+iZV5p6pOuRpA4/3r
 Y85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=D/nDffzm1vMPDEjNds0Hj5SZg6VwZzl34xLZ1SnbtI8=;
 b=Hpc5mV2IZ9EWFLv6oD9p/UooJ2kmdWXFLsVqy2sRoAsLZ5bH4li1r9QpGmNhWtvO/v
 RqvS224obvPAS/gcWswbxNcpJ1YljHsnQL+5q5OoxAx55EqFz1njjXUavaERmTFNpsva
 pKe/joPJjelN4FgW+eulcUIngy+qjTk8iVjRRwrZRrPsjo1XiX4ipmpWSKCYukqaaSfW
 DGGfrD4H+qxvGOzI7yoRJA/uxA0SFeHb47nuyDV9M68Qku0rkeLW8BcpHwO7BGxq+I5q
 gcL82J9YLiWvADrjjDstrBmw/84e/iB1gPZ0fvhXc3fEa/7uOt9yETwpbqfpFZh91zIb
 v1pg==
X-Gm-Message-State: AOAM530C9ygs5oLjwAN08dggNFeLBZHWOfsGlAWZrSSSa40zS3pRJF/U
 raC2tVpznrOsaIRi0NqcBOPjcgVhZOiGKv48I6w=
X-Google-Smtp-Source: ABdhPJxqWBY/o8VHx2u8BIRXFmtsx8dJ6i8WR5RZ1t+W+6JbUeeXbWuIG3owiVIS1GI5J6YXktFVyff/2vNIuaaJioQ=
X-Received: by 2002:a17:907:9495:: with SMTP id
 dm21mr18023670ejc.478.1638480435023; 
 Thu, 02 Dec 2021 13:27:15 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 3 Dec 2021 07:27:03 +1000
Message-ID: <CAPM=9tyOMZFPDYCmdu2xspoNcjbrEWfqYMGSLYBioLCRCKG6wA@mail.gmail.com>
Subject: [git pull] drm fixes for 5.16-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Bit of an uptick in patch count this week, though it's all relatively
small overall. I suspect msm has been queuing up a few fixes to skew
it here. Otherwise amdgpu has a scattered bunch of small fixes, and
then some vc4, i915. virtio-gpu changes an rc1 introduced uAPI
mistake, and makes it operate more like other drivers. This should be
fine as no userspace relies on the behaviour yet.

Dave.

drm-fixes-2021-12-03-1:
drm-fixes-2021-12-03:
drm fixes for 5.16-rc4

dma-buf:
- memory leak fix

msm:
- kasan found memory overwrite
- mmap flags
- fencing error bug
- ioctl NULL ptr
- uninit var
- devfreqless devices fix
- dsi lanes fix
- dp: avoid unpowered aux xfers

amdgpu:
- IP discovery based enumeration fixes
- vkms fixes
- DSC fixes for DP MST
- Audio fix for hotplug with tiled displays
- Misc display fixes
- DP tunneling fix
- DP fix
- Aldebaran fix

amdkfd:
- Locking fix
- Static checker fix
- Fix double free

i915:
- backlight regression
- Intel HDR backlight detection fix
- revert TGL workaround that caused hangs

virtio-gpu:
- switch back to drm_poll

vc4:
- memory leak
- error check fix
- HVS modesetting fixes
The following changes since commit d58071a8a76d779eedab38033ae4c821c30295a5=
:

  Linux 5.16-rc3 (2021-11-28 14:09:19 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-12-03-1

for you to fetch changes up to a687efed194bdc185fd7cb33920fe8b4e60ecb9e:

  Merge tag 'drm-intel-fixes-2021-12-02' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2021-12-03
05:59:31 +1000)

----------------------------------------------------------------
drm-fixes-2021-12-03:
drm fixes for 5.16-rc4

dma-buf:
- memory leak fix

msm:
- kasan found memory overwrite
- mmap flags
- fencing error bug
- ioctl NULL ptr
- uninit var
- devfreqless devices fix
- dsi lanes fix
- dp: avoid unpowered aux xfers

amdgpu:
- IP discovery based enumeration fixes
- vkms fixes
- DSC fixes for DP MST
- Audio fix for hotplug with tiled displays
- Misc display fixes
- DP tunneling fix
- DP fix
- Aldebaran fix

amdkfd:
- Locking fix
- Static checker fix
- Fix double free

i915:
- backlight regression
- Intel HDR backlight detection fix
- revert TGL workaround that caused hangs

virtio-gpu:
- switch back to drm_poll

vc4:
- memory leak
- error check fix
- HVS modesetting fixes

----------------------------------------------------------------
Akhil P Oommen (2):
      drm/msm: Fix null ptr access msm_ioctl_gem_submit()
      drm/msm/a6xx: Fix uinitialized use of gpu_scid

Arnd Bergmann (1):
      drm: msm: fix building without CONFIG_COMMON_CLK

Dave Airlie (4):
      Merge tag 'drm-msm-fixes-2021-11-28' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'amd-drm-fixes-5.16-2021-12-01' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2021-12-02' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2021-12-02' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Douglas Anderson (3):
      drm/msm/a6xx: Allocate enough space for GMU registers
      drm/msm: Fix mmap to include VM_IO and VM_DONTDUMP
      drm/msm/dp: Avoid unpowered AUX xfers that caused crashes

Flora Cui (2):
      drm/amdgpu: cancel the correct hrtimer on exit
      drm/amdgpu: check atomic flag to differeniate with legacy path

Guangming (1):
      dma-buf: system_heap: Use 'for_each_sgtable_sg' in pages free flow

Guchun Chen (1):
      drm/amdgpu: fix the missed handling for SDMA2 and SDMA3

Gurchetan Singh (2):
      drm/virtgpu api: define a dummy fence signaled event
      drm/virtio: use drm_poll(..) instead of virtio_gpu_poll(..)

Jane Jian (1):
      drm/amdgpu/sriov/vcn: add new vcn ip revision check case for
SIENNA_CICHLID

Jimmy Kizito (1):
      drm/amd/display: Add work around for tunneled MST.

Jos=C3=A9 Roberto de Souza (1):
      Revert "drm/i915: Implement Wa_1508744258"

Lijo Lazar (1):
      drm/amdgpu: Don't halt RLC on GFX suspend

Lyude Paul (2):
      drm/i915: Add support for panels with VESA backlights with PWM
enable/disable
      drm/i915/dp: Perform 30ms delay after source OUI write

Maxime Ripard (6):
      drm/vc4: kms: Wait for the commit before increasing our clock rate
      drm/vc4: kms: Fix return code check
      drm/vc4: kms: Add missing drm_crtc_commit_put
      drm/vc4: kms: Clear the HVS FIFO commit pointer once done
      drm/vc4: kms: Don't duplicate pending commit
      drm/vc4: kms: Fix previous HVS commit wait

Mustapha Ghaddar (1):
      drm/amd/display: Fix for the no Audio bug with Tiled Displays

Nicholas Kazlauskas (1):
      drm/amd/display: Allow DSC on supported MST branch devices

Perry Yuan (1):
      drm/amd/display: add connector type check for CRC source set

Philip Chen (1):
      drm/msm/dsi: set default num_data_lanes

Philip Yang (3):
      drm/amdkfd: set "r =3D 0" explicitly before goto
      drm/amdkfd: fix double free mem structure
      drm/amdkfd: process_info lock not needed for svm

Rob Clark (8):
      drm/msm/devfreq: Fix OPP refcnt leak
      drm/msm: Fix wait_fence submitqueue leak
      drm/msm: Restore error return on invalid fence
      drm/msm: Make a6xx_gpu_set_freq() static
      drm/msm: Demote debug message
      drm/msm/gpu: Fix idle_work time
      drm/msm/gpu: Fix check for devices without devfreq
      drm/msm: Do hw_init() before capturing GPU state

Shen, George (1):
      drm/amd/display: Clear DPCD lane settings after repeater training

shaoyunl (1):
      drm/amdgpu: adjust the kfd reset sequence in reset sriov function

 drivers/dma-buf/heaps/system_heap.c                |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  8 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 16 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |  4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  7 ++--
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 13 ++----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |  8 ++++
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 20 +++++++--
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      | 16 +++++++
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  | 24 ++++++-----
 drivers/gpu/drm/amd/display/dc/dc.h                |  3 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |  2 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  2 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |  3 ++
 drivers/gpu/drm/i915/display/intel_dp.c            | 11 +++++
 drivers/gpu/drm/i915/display/intel_dp.h            |  2 +
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  | 32 +++++++++++---
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  7 ----
 drivers/gpu/drm/msm/Kconfig                        |  2 +-
 drivers/gpu/drm/msm/Makefile                       |  6 +--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 20 ++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  4 +-
 drivers/gpu/drm/msm/dp/dp_aux.c                    | 17 ++++++++
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  2 +
 drivers/gpu/drm/msm/msm_debugfs.c                  |  1 +
 drivers/gpu/drm/msm/msm_drv.c                      | 49 ++++++++++++++----=
----
 drivers/gpu/drm/msm/msm_gem.c                      |  5 +--
 drivers/gpu/drm/msm/msm_gem_submit.c               |  2 +
 drivers/gpu/drm/msm/msm_gpu.h                      |  3 ++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              | 13 ++++--
 drivers/gpu/drm/vc4/vc4_kms.c                      | 40 ++++++++----------
 drivers/gpu/drm/virtio/virtgpu_drv.c               | 42 +-----------------=
-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |  1 -
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |  2 +-
 include/uapi/drm/virtgpu_drm.h                     |  7 ++++
 39 files changed, 244 insertions(+), 159 deletions(-)
