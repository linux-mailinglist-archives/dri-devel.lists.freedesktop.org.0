Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B1DC41CBB
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 23:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4EB10EB7E;
	Fri,  7 Nov 2025 22:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FaGI4Hj0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018F810EB83
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 22:08:51 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-8909f01bd00so123559185a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 14:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762553331; x=1763158131; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=01pzKBDiqVli+bpe2zFIkuZQy1Np00Dk6ZGYQl/DblI=;
 b=FaGI4Hj09B4O/iTw5oVZJr2j4+FUhTkIQ1ZUfdjQ60NrlA6oAf9Y4KKia4OGvq0FBc
 5UglIVIZlZYi5XJldYwCBk8AYEehy5DyIugHTWRptPw24QTcB4kdtbcl4Iy6sBSbcyfd
 maAW5bCUsI4p/w/8m6bq4gFPJbgpXvMqemvAArtucpuFJSwKxy0J4d5SLRq93WLeLI94
 ay68dnMmzRt6a/qQPDxuGG8VVXHXbckCFMQ/MDJXsfvWGTutOUd7eydQp1DEDMmgC+nQ
 KwfINhB3fWOwnvoAiCoCkGR5ZPwdiN1QdfHEGKaOJtWMKUEO/ws4g7GHyKyb5LQC2mOF
 9zrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762553331; x=1763158131;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=01pzKBDiqVli+bpe2zFIkuZQy1Np00Dk6ZGYQl/DblI=;
 b=moreKHXEy0NWkrXBf7MStjb2I6FU68n+E2M2DHgIyxUYM4mEAm0niaP00HYE7/h9Ia
 PwE+ym28ToN7BqfujN5GAIuqsZOqkuIWzjC6JwqI6nTYwZ19RJ6Bz2G8ClxwZx+1ZjL/
 DslFOj5fMGv5i8pCvEAMEGVhd/Kq0mawfhFC9oqQAgDuI+wQ7B/JXapy7e3M4jy/52A9
 qyHjq31JRcfo+dyC1i+PzpmbIzVLLIckyM9MZDRjsZjUzGSAqMRyN0NuuB/zRUCB7+jS
 QG6YmjWMvS66SrzRuON0pchOwiREIpg9LCe49SqGAISl+ZgoDBYd7abO5JEk52nXbbOa
 ElhA==
X-Gm-Message-State: AOJu0Yw34ID05UuAQyQCYNEJtzkElpBg+r3jJsC00Iammof/ApYxOEWK
 a8wfsoPpoSyl4Zp3hd38KWdopBGA5/hXuqeAluz5wZh1byzlqKJbHJXSW+C/JmS9k5Tc7SnVVsx
 Yl20NZcFyVAv3CFrbu6IYI0z/iAqFbWc=
X-Gm-Gg: ASbGncswv1VKjGBzsw58wktVzE6cBkXAv70lNxeUxysxgZ0WXf0vWWDeRzX7eP6mS1A
 rkNvb5E8GW6NbQNJdXrFAGSZzsC9u2dMWH48t/Or1Z3qZAOaRzqeBI19IbtdPTlGn1siISKMbjL
 tieSN7/MNvmLqSB4JTs58bYwAQt4Q4Z1koCvFKnXlWxjN1FAcXvggUd47uwOs5nmnSDVmg7etcU
 Z3MZ1gNLsxW51RqeyfS0u2Nc39Tl8S7Z21y7Z8JFIMpAqNtHMcs4EzNx2I=
X-Google-Smtp-Source: AGHT+IEzYzQmeeVeXDG23zQ8MrHHuuq9MmLbSEPhthEbo253f2i4Kiwi3LynISbfiO+JjVeQ9BYuT079AAcp4oQ90jg=
X-Received: by 2002:a05:620a:294d:b0:8b2:2800:d646 with SMTP id
 af79cd13be357-8b257f87105mr115152485a.88.1762553330861; Fri, 07 Nov 2025
 14:08:50 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 8 Nov 2025 08:08:39 +1000
X-Gm-Features: AWmQ_bl4fJKuoszi5FUAbI1Tcjc2zge1wQUwnNCNCt8rT_VZHdC889N-xr6DgjA
Message-ID: <CAPM=9tx60Q0o7v1hK-GJ_iKs7J0dVgQENM44T=gM_KWZXoA4YA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.18-rc5
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Back from travel, thanks to Simona for handling things. regular fixes,
seems about the right size, but spread out a bit.

amdgpu has the usual range of fixes, xe has a few fixes, and nouveau
has a couple of fixes, one for blackwell modifiers on 8/16 bit
surfaces.

Otherwise a few small fixes for mediatek, sched, imagination and pixpaper.

Dave.

drm-fixes-2025-11-08:
drm fixes for 6.18-rc5

sched:
- Fix deadlock

amdgpu:
- Reset fixes
- Misc fixes
- Panel scaling fixes
- HDMI fix
- S0ix fixes
- Hibernation fix
- Secure display fix
- Suspend fix
- MST fix

amdkfd:
- Process cleanup fix

xe:
- Fix missing  synchronization on unbind
- Fix device shutdown when doing FLR
- Fix user fence signaling order

i915:
- Avoid lock inversion when pinning to GGTT on CHV/BXT+VTD
- Fix conversion between clock ticks and nanoseconds

mediatek:
- Disable AFBC support on Mediatek DRM driver
- Add pm_runtime support for GCE power control

imagination:
- kconfig: Fix dependencies

nouveau:
- Set DMA mask earlier
- Advertize correct modifiers for GB20x

pixpaper:
- kconfig: Fix dependencies
The following changes since commit 6146a0f1dfae5d37442a9ddcba012add260bceb0=
:

  Linux 6.18-rc4 (2025-11-02 11:28:02 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-11-08

for you to fetch changes up to d439acbbfb9a982f152c5f806b4592431a80c4fd:

  Merge tag 'drm-xe-fixes-2025-11-07' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-11-08 07:39:54 +1000)

----------------------------------------------------------------
drm fixes for 6.18-rc5

sched:
- Fix deadlock

amdgpu:
- Reset fixes
- Misc fixes
- Panel scaling fixes
- HDMI fix
- S0ix fixes
- Hibernation fix
- Secure display fix
- Suspend fix
- MST fix

amdkfd:
- Process cleanup fix

xe:
- Fix missing  synchronization on unbind
- Fix device shutdown when doing FLR
- Fix user fence signaling order

i915:
- Avoid lock inversion when pinning to GGTT on CHV/BXT+VTD
- Fix conversion between clock ticks and nanoseconds

mediatek:
- Disable AFBC support on Mediatek DRM driver
- Add pm_runtime support for GCE power control

imagination:
- kconfig: Fix dependencies

nouveau:
- Set DMA mask earlier
- Advertize correct modifiers for GB20x

pixpaper:
- kconfig: Fix dependencies

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: set default gfx reset masks for gfx6-8
      drm/amdgpu: Drop PMFW RLC notifier from amdgpu_device_suspend()
      drm/amdgpu/smu: Handle S0ix for vangogh

Alex Hung (1):
      drm/amd/display: Fix black screen with HDMI outputs

Ariel D'Alessandro (1):
      drm/mediatek: Disable AFBC support on Mediatek DRM driver

Balasubramani Vivekanandan (1):
      drm/xe/guc: Synchronize Dead CT worker with unbind

Dave Airlie (5):
      Merge tag 'drm-misc-fixes-2025-11-06' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2025-11-06' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.18-2025-11-06' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'mediatek-drm-fixes-20251105' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes
      Merge tag 'drm-xe-fixes-2025-11-07' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

James Jones (2):
      drm: define NVIDIA DRM format modifiers for GB20x
      drm/nouveau: Advertise correct modifiers on GB20x

Janusz Krzysztofik (1):
      drm/i915: Avoid lock inversion when pinning to GGTT on CHV/BXT+VTD

Jason-JH Lin (1):
      drm/mediatek: Add pm_runtime support for GCE power control

Jouni H=C3=B6gander (1):
      drm/xe: Do clean shutdown also when using flr

LiangCheng Wang (1):
      drm/tiny: pixpaper: add explicit dependency on MMU

Lijo Lazar (1):
      drm/amdgpu: Fix wait after reset sequence in S3

Mario Limonciello (1):
      drm/amd: Fix suspend failure with secure display TA

Mario Limonciello (AMD) (1):
      drm/amd/display: Don't stretch non-native images by default in eDP

Matt Coster (1):
      drm/imagination: Optionally depend on POWER_SEQUENCING

Matthew Brost (1):
      drm/xe: Enforce correct user fence signaling order using

Philip Yang (1):
      drm/amdkfd: Don't clear PT after process killed

Pierre-Eric Pelloux-Prayer (1):
      drm/sched: Fix deadlock in drm_sched_entity_kill_jobs_cb

Rong Zhang (1):
      drm/amd/display: Fix NULL deref in debugfs odm_combine_segments

Samuel Zhang (1):
      drm/amdgpu: fix gpu page fault after hibernation on PF passthrough

Tejas Upadhyay (1):
      drm/xe: Move declarations under conditional branch

Timur Tabi (1):
      drm/nouveau: set DMA mask before creating the flush page

Umesh Nerlige Ramappa (1):
      drm/i915: Fix conversion between clock ticks and nanoseconds

Wayne Lin (1):
      drm/amd/display: Enable mst when it's detected but yet to be initiali=
zed

Yang Wang (1):
      drm/amd/pm: fix missing device_attr cleanup in amdgpu_pm_sysfs_init()

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  4 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  4 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  9 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  5 ++-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |  3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |  5 +++
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |  5 +++
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |  5 +++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  4 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             | 26 ++++++++++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 12 +++++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  3 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |  1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                | 18 ---------
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  4 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |  2 -
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  6 +++
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  3 ++
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |  4 +-
 drivers/gpu/drm/i915/i915_vma.c                    | 16 +++++++-
 drivers/gpu/drm/imagination/Kconfig                |  1 +
 drivers/gpu/drm/mediatek/mtk_crtc.c                |  7 ++++
 drivers/gpu/drm/mediatek/mtk_plane.c               | 24 +-----------
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |  4 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.h            |  1 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            | 24 +++++++++++-
 drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c        | 33 ++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c   | 24 ++++++------
 drivers/gpu/drm/scheduler/sched_entity.c           | 34 ++++++++--------
 drivers/gpu/drm/tiny/Kconfig                       |  1 +
 drivers/gpu/drm/xe/xe_device.c                     | 14 +++----
 drivers/gpu/drm/xe/xe_exec.c                       |  3 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 | 14 +++++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |  7 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c                     |  3 ++
 drivers/gpu/drm/xe/xe_oa.c                         | 45 ++++++++++++++----=
----
 drivers/gpu/drm/xe/xe_oa_types.h                   |  8 ++++
 drivers/gpu/drm/xe/xe_sync.c                       | 17 +++++++-
 drivers/gpu/drm/xe/xe_sync.h                       |  3 ++
 drivers/gpu/drm/xe/xe_sync_types.h                 |  3 ++
 drivers/gpu/drm/xe/xe_vm.c                         |  4 ++
 include/uapi/drm/drm_fourcc.h                      | 23 +++++++----
 42 files changed, 311 insertions(+), 125 deletions(-)
