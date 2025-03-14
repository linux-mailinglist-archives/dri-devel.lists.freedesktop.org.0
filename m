Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F11A60978
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 08:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AD310E1A0;
	Fri, 14 Mar 2025 07:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QAR0HHPZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF4010E1A0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 07:11:29 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-aaf900cc7fbso347769766b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 00:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741936287; x=1742541087; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FcxWgeBT29Hzcr2wTHpxcmqt2hkmYJcn5TysUSsXiZk=;
 b=QAR0HHPZETlRHEU+dYAKxrZm/4D2IokPIneH5SOPVwEAackalrtBzxgs3Sq/WJUt10
 AsTqcMuWexb4SXq75MLNmbbuBwHqGg0reQ7bOhK4yezF04n0Seu735/s9ngM9RCt8F9h
 3W9raKGByx3+3fhfrBAiJf/ww7Okx3+um4dBiVp/5syjpyxGBeK99hEF0FTqSpUeqnk4
 mrW2hw8wMVbTYrvionecGWpjluSIUx8M1LJcpBuAPCCTf73GhmPLiWTHne6JGweJ3mxY
 NRONSaqU2IY1Gan4SG+HyN7fvAWavXrO3RWXkLu/5vPytdJELgITil+kNGwUCnsdPsob
 8jXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741936287; x=1742541087;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FcxWgeBT29Hzcr2wTHpxcmqt2hkmYJcn5TysUSsXiZk=;
 b=RM40xWfA08qYbe/b/v/7O+3uy8KWnBq7ef73pV3VyRHXCQcbtFN1FNh+EIJ1uZgUTB
 DdpGNdvcCL0lioVmctRWmVpgeWUSBkM3x6rstn+eGmid6Im9G4JkQjI3jg6ge5tJZcdh
 d5nbY5bsXVvMOPcv9Wb1EsOWZDYhwfLUiOBXs1nOB/dhgkoY3yZz0FIJUd2QJOLL5GxW
 5yGBp6AQA1Tb/ClSLkUqQVpHe0KCbdLKerWDMx+FNcKcjV7ZxD4CRDr+6nrjXaQmFDMl
 X3AtKuKUX4qOQ/3gO+p8I1OPkZFiEyweahCq7Zb0FwHuc/Kx44E7Y/aR26EigghU49Y5
 lpmQ==
X-Gm-Message-State: AOJu0YwRUn6pWJxYAY95wh7EqYLtr5Vl/uRTW9Di8gWAGHXPKceRhB8u
 a6G5bbuAW73ucQ29H29XHUwTGcg9CgaOJolEwtmfCZPz2yKXFhunr0w+jNrTNmWVFYzZgN6ZREC
 gJq+nm8WNxNDkeRW8Gk7i7G3J25A=
X-Gm-Gg: ASbGncthwWy5VNfQVeaemoe3k5cKNSWcX+HgTLV1FvgcDu9E1lrtlGshJDkif8n4oOk
 VQy4tz0U0uP3gm1pG8T4qT4LL4OInnzrn0qkpCDJSzSSEP4T0TgXvlmrOnO2CNcyYuyhC2CnCRJ
 uhkj27oI9hLCEvV+hNWQallVak
X-Google-Smtp-Source: AGHT+IG3lY5hWLZzc16ljHigKpjOmO3jNH0WK5YKf2sclutnlRHi1cZqp5Fgy5zy7sMtopTMFUOUZNG2+8Y+cdYmPkA=
X-Received: by 2002:a17:907:7241:b0:ac1:e332:b1f5 with SMTP id
 a640c23a62f3a-ac330371508mr151302166b.37.1741936287039; Fri, 14 Mar 2025
 00:11:27 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 14 Mar 2025 17:11:16 +1000
X-Gm-Features: AQ5f1JpfP3TmFF1lLfHcd-9pOehlmSFSUNN5ec8WIpMFS18OAW1wdWLVoWLg888
Message-ID: <CAPM=9tynNkAv1s70kbsCVHj31sGTXL1AQ0Dv6n0kwr7kw1rhkA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.14-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Regular weekly fixes pull, the usual leaders in amdgpu/xe, a couple of
i915, and some scattered misc fixes.

Next week the gitlab.freedesktop.org infrastructure will be down for
migration, so I've no idea whether I will have any fixes for final, I
can send an MR via github if needed, but I'm not sure if the
downstreams will have anything to get to me, but if anything urgents
pops up we will make sure it gets there.

Dave.

drm-fixes-2025-03-14:
drm fixes for 6.14-rc7

panic:
- two clippy fixes

dp_mst
- locking fix

atomic:
- fix redundant DPMS calls

i915:
- Do cdclk post plane programming later
- Bump MMAP_GTT_VERSION: missing indication of partial mmaps support

xe:
- Release guc ids before cancelling work
- Fix new warnings around userptr
- Temporaritly disable D3Cold on BMG
- Retry and wait longer for GuC PC to start
- Remove redundant check in xe_vm_create_ioctl

amdgpu:
- GC 12.x DCC fix
- DC DCE 6.x fix
- Hibernation fix
- HPD fix
- Backlight fixes
- Color depth fix
- UAF fix in hdcp_work
- VCE 2.x fix
- GC 12.x PTE fix

amdkfd:
- Queue eviction fix

gma500:
- fix NULL pointer check
The following changes since commit 80e54e84911a923c40d7bee33a34c1b4be148d7a=
:

  Linux 6.14-rc6 (2025-03-09 13:45:25 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-03-14

for you to fetch changes up to d1d77326f585ccf1fb388e1bcc18a630e044577f:

  Merge tag 'drm-xe-fixes-2025-03-13' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-03-14 13:42:17 +1000)

----------------------------------------------------------------
drm fixes for 6.14-rc7

panic:
- two clippy fixes

dp_mst
- locking fix

atomic:
- fix redundant DPMS calls

i915:
- Do cdclk post plane programming later
- Bump MMAP_GTT_VERSION: missing indication of partial mmaps support

xe:
- Release guc ids before cancelling work
- Fix new warnings around userptr
- Temporaritly disable D3Cold on BMG
- Retry and wait longer for GuC PC to start
- Remove redundant check in xe_vm_create_ioctl

amdgpu:
- GC 12.x DCC fix
- DC DCE 6.x fix
- Hibernation fix
- HPD fix
- Backlight fixes
- Color depth fix
- UAF fix in hdcp_work
- VCE 2.x fix
- GC 12.x PTE fix

amdkfd:
- Queue eviction fix

gma500:
- fix NULL pointer check

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/vce2: fix ip block reference

Alex Hung (1):
      drm/amd/display: Assign normalized_pix_clk when color depth =3D 14

Aliaksei Urbanski (1):
      drm/amd/display: fix missing .is_two_pixels_per_container

Dave Airlie (4):
      Merge tag 'amd-drm-fixes-6.14-2025-03-12' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2025-03-13' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2025-03-13' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-03-13' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

David Rosca (1):
      drm/amdgpu/display: Allow DCC for video formats on GFX12

Imre Deak (1):
      drm/dp_mst: Fix locking when skipping CSN before topology probing

Ivan Abramov (1):
      drm/gma500: Add NULL check for pci_gfx_root in mid_get_vbt_data()

Jos=C3=A9 Roberto de Souza (1):
      drm/i915: Increase I915_PARAM_MMAP_GTT_VERSION version to
indicate support for partial mmaps

Leo Li (1):
      drm/amd/display: Disable unneeded hpd interrupts during dm_init

Mario Limonciello (4):
      drm/amd: Keep display off while going into S4
      drm/amd/display: fix default brightness
      drm/amd/display: Restore correct backlight brightness after a GPU res=
et
      drm/amd/display: Fix slab-use-after-free on hdcp_work

Miguel Ojeda (2):
      drm/panic: use `div_ceil` to clean Clippy warning
      drm/panic: fix overindented list items in documentation

Natalie Vock (1):
      drm/amdgpu: NULL-check BO's backing store when determining GFX12 PTE =
flags

Rodrigo Vivi (2):
      drm/xe/pm: Temporarily disable D3Cold on BMG
      drm/xe/guc_pc: Retry and wait longer for GuC PC start

Tejas Upadhyay (1):
      drm/xe: Release guc ids before cancelling work

Thomas Hellstr=C3=B6m (1):
      drm/xe/userptr: Fix an incorrect assert

Ville Syrj=C3=A4l=C3=A4 (2):
      drm/i915/cdclk: Do cdclk post plane programming later
      drm/atomic: Filter out redundant DPMS calls

Xin Wang (1):
      drm/xe: remove redundant check in xe_vm_create_ioctl()

Yifan Zha (1):
      drm/amd/amdkfd: Evict all queues even HWS remove queue failed

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 11 +++-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |  5 +-
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |  2 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  8 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 17 +++++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |  1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  | 64 +++++++++++++++---=
----
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  7 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  7 ++-
 .../amd/display/dc/dce60/dce60_timing_generator.c  |  1 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c      | 40 ++++++++------
 drivers/gpu/drm/drm_atomic_uapi.c                  |  4 ++
 drivers/gpu/drm/drm_connector.c                    |  4 ++
 drivers/gpu/drm/drm_panic_qr.rs                    | 16 +++---
 drivers/gpu/drm/gma500/mid_bios.c                  |  5 ++
 drivers/gpu/drm/i915/display/intel_display.c       |  5 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  5 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                     | 53 +++++++++++++-----
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  2 +-
 drivers/gpu/drm/xe/xe_hmm.c                        |  6 +-
 drivers/gpu/drm/xe/xe_pm.c                         | 13 ++++-
 drivers/gpu/drm/xe/xe_vm.c                         |  3 -
 22 files changed, 200 insertions(+), 79 deletions(-)
