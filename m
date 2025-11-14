Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05697C5F410
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 21:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D9610EB15;
	Fri, 14 Nov 2025 20:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G4vxkM7z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F04310EB15
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 20:36:30 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-8b1f2fbaed7so192430585a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 12:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763152589; x=1763757389; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LYbYV2TQljnVpusnXB6weICqsXKpV5RMO7m8pDL28pk=;
 b=G4vxkM7zshbLuqUmJAKvLy96JkbRDjZHs09ya+M8iuGad7Q+MGMg3zcG2IDdCh1oaE
 6FkPAl+bacn7e98vamPS3idDPp1JIRhWZPdaxIZbe5licJzCpO/s6ymOMqGksC7gQ9DT
 zX7ZfgCp1UUpI8TyOe9bOnbYCQhLcZg/vp7DVRH+ZfH0fvWE8xOww1B427CU1/T6zqtQ
 59SVNUYjdZsRbex+GfFJYXExWMzR08bW8OGTw3wqtGN5XjKjfUphrhTtCdPciz3N07In
 mabH2SNiomM1H65P9mSfLdfNepDgIlp5RgEDms/Y28RXPJF11uF9PIJ8m+sBm6aoTqh5
 UPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763152589; x=1763757389;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LYbYV2TQljnVpusnXB6weICqsXKpV5RMO7m8pDL28pk=;
 b=i+HWfRoKm6FCDPpwO+r/DHDG/45hBL4rHMKU4s5aX33gq2drM6JgU6sL8aN+4jaxY9
 ZXVKX2MwcXHYB1i2Iq/Dj4+qLYvtzEVOxEc5TtyPhoY0BrOtPup+Fo3yZk22hQMu1tZT
 kKFTjNMSodaJoRJraec9ILlqhutiZobD0sirbKRNC3ceClrRgjsBB88lY536Ct67RZP/
 qtmazyyWdobRF1mo2xVdqVdKOoljcU8wNMj4/Z/oSpFeaFmHfImskB/pyI03LvMBjrhF
 1W1Ix/CpXgO/5lyhcBtCmSHkj1rDNYRNmrbnZDXy/c5hWgu2x6oY85mI1ZKXxCSOlN9G
 wGeQ==
X-Gm-Message-State: AOJu0YyN1/zJGuzkrZ6bitatJdWrqJwHKnWcQRtdtV+v/pf3BA1igI8o
 t293gBsXLE9egpyS1Klsk36JrFPPzkVvOy+XOS6ZdDhAi+1kQ/8JcJlObhTrK3p2XaHKrlzdGVv
 QwX1HHhjNubR2U7uIEpYsJryD1X5YY4U=
X-Gm-Gg: ASbGncvbj1ITY6p1IjihJjsuQ0yFRWwELhzDbZIf6M7JfQr/5IxhzcFDXUwsCw2mYgV
 JAHVDrk6Z2mVFKzLZj6/G/5ur94zMIJb5DalLSCoRA1uqZSpSUQrZIM9HbaXMW1v4JLaPwIhHPa
 ScmfFHwAnf3SCKlYeIXsUikvMCvyXQ9lq0ajH9UD+oC+ygiSODWpLzIAO3uV60v+UMVfl/uR8kL
 +nCyu+O5CVjHLZSZPag0ckk6mzNFYNNAnqIrLit7DQCvICP6nmlGztnEFb4QI5IafpLZA==
X-Google-Smtp-Source: AGHT+IGFE8xklf3LEerR3JAh7YwLaE9DEqq3/MwYyF+YBQzoLjKJHLeljQGyNTqCaqVRn2iOc0y/jXCzTJ6dWG7lnT0=
X-Received: by 2002:a05:620a:4043:b0:8b2:57f8:4852 with SMTP id
 af79cd13be357-8b2c3183facmr617251885a.35.1763152589027; Fri, 14 Nov 2025
 12:36:29 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 15 Nov 2025 06:36:17 +1000
X-Gm-Features: AWmQ_blIhTxwGKKSKNdxSp1QcyPDK-m-B3zhzyyuZYtXWiPeZ5mrzRCwmYDmeBU
Message-ID: <CAPM=9tz0CT3EWFjMPXffj2_kqExJe+3GNrUgkCQ3ZFuOf_-_rQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.18-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi Linus,

Weekly fixes, amdgpu and vmwgfx making up the most of it, along with
panthor and i915/xe.
Seems about right for this time of development, nothing major outstanding.

Dave.

drm-fixes-2025-11-15:
drm fixes for 6.18-rc6

client:
- Fix description of module parameter

panthor:
- Flush writes before mapping buffers

vmwgfx:
- Improve command validation
- Improve ref counting
- Fix cursor-plane support

amdgpu:
- Disallow P2P DMA for GC 12 DCC surfaces
- ctx error handling fix
- UserQ fixes
- VRR fix
- ISP fix
- JPEG 5.0.1 fix

amdkfd:
- Save area check fix
- Fix GPU mappings for APU after prefetch

i915:
- Fix PSR's pipe to vblank conversion
- Disable Panel Replay on MST links

xe:
- New HW workarounds affecting PTL and WCL platforms
The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c:

  Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-11-15

for you to fetch changes up to 362a7d4fd5c473d43c498e68e13ff7acf8ca4ccf:

  Merge tag 'drm-xe-fixes-2025-11-13' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-11-14 17:51:17 +1000)

----------------------------------------------------------------
drm fixes for 6.18-rc6

client:
- Fix description of module parameter

panthor:
- Flush writes before mapping buffers

vmwgfx:
- Improve command validation
- Improve ref counting
- Fix cursor-plane support

amdgpu:
- Disallow P2P DMA for GC 12 DCC surfaces
- ctx error handling fix
- UserQ fixes
- VRR fix
- ISP fix
- JPEG 5.0.1 fix

amdkfd:
- Save area check fix
- Fix GPU mappings for APU after prefetch

i915:
- Fix PSR's pipe to vblank conversion
- Disable Panel Replay on MST links

xe:
- New HW workarounds affecting PTL and WCL platforms

----------------------------------------------------------------
Boris Brezillon (1):
      drm/panthor: Flush shmem writes before mapping buffers CPU-uncached

Dave Airlie (4):
      Merge tag 'amd-drm-fixes-6.18-2025-11-12' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2025-11-13' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2025-11-13' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-11-13' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Harish Kasiviswanathan (1):
      drm/amdkfd: Fix GPU mappings for APU after prefetch

Ian Forbes (3):
      drm/vmwgfx: Validate command header size against SVGA_CMD_MAX_DATASIZE
      drm/vmwgfx: Use kref in vmw_bo_dirty
      drm/vmwgfx: Restore Guest-Backed only cursor plane support

Imre Deak (1):
      drm/i915/dp_mst: Disable Panel Replay

Ivan Lipski (1):
      drm/amd/display: Allow VRR params change if unsynced with the stream

Jani Nikula (1):
      drm/i915/psr: fix pipe to vblank conversion

Jesse.Zhang (1):
      drm/amdgpu: fix lock warning in amdgpu_userq_fence_driver_process

Jonathan Kim (1):
      drm/amdkfd: relax checks for over allocation of save area

Nitin Gote (2):
      drm/xe/xe3: Add WA_14024681466 for Xe3_LPG
      drm/xe/xe3lpg: Extend Wa_15016589081 for xe3lpg

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: jump to the correct label on failure

Randy Dunlap (1):
      drm/client: fix MODULE_PARM_DESC string for "active"

Sathishkumar S (1):
      drm/amdgpu/jpeg: Add parse_cs for JPEG5_0_1

Sultan Alsawaf (1):
      drm/amd/amdgpu: Ensure isp_kernel_buffer_alloc() creates a new BO

Tangudu Tilak Tirumalesh (1):
      drm/xe/xe3: Extend wa_14023061436

Vitaly Prosyak (1):
      drm/amdgpu: disable peer-to-peer access for DCC-enabled GC12 VRAM surfaces

 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c                |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c            | 12 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c                |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c        |  5 +++--
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c               |  1 +
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c                 | 12 ++++++------
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c                   |  2 ++
 .../gpu/drm/amd/display/modules/freesync/freesync.c    | 11 +++++++++++
 drivers/gpu/drm/clients/drm_client_setup.c             |  4 ++--
 drivers/gpu/drm/i915/display/intel_psr.c               |  7 ++++++-
 drivers/gpu/drm/panthor/panthor_gem.c                  | 18 ++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c           | 16 +++++++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h           |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c                |  5 +++++
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c             | 12 +++++-------
 drivers/gpu/drm/xe/regs/xe_gt_regs.h                   |  1 +
 drivers/gpu/drm/xe/xe_wa.c                             | 11 +++++++++++
 17 files changed, 102 insertions(+), 20 deletions(-)
