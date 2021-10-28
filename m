Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F65E43E8E8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 21:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B383B6E0AB;
	Thu, 28 Oct 2021 19:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F976E0AB
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 19:14:31 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z20so29279634edc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 12:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=5ojLsCpfNAlUcTskJp6rsZY21B6sY/VX+UQ6ok+M4/Q=;
 b=Ra89hbLYPBAFTl59WQ8ccGq+LL9M97zhqQu6o2fov1KDfv8VEcb+ua2UHXjlIJnpRK
 YXttec5TD3cyUBX6LA8nScRZpdUWWyZhO1QXcunwWy1naf5eP6o/IbBHQ1DMlRnLumJe
 kygzyPHwlCJY9E2qLD1rClCF/dpf1QBEMnwOTHoFd1WcDk34jF8j3j2293lI0qYeOydG
 6JvOFKYivsNPkGzXNJuLNSq4RjNiiNW3Io0fqyZmZ/T87XF68IrPmfkz91sIqAy6CCMV
 +brQKy5EebKwa5+ZT80g9pr0amUsFDY2OiZz7sX38zpU0jPL+NqhILL8VJx6Xrfbp7Ua
 VnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=5ojLsCpfNAlUcTskJp6rsZY21B6sY/VX+UQ6ok+M4/Q=;
 b=v8yd856lRF5WImET7zh68a9w7ZD7n7LWxOxiGqaMIh5M+rsQvyKZb3G5gg8CvwhugB
 s2RRfN41Cl2ugcYV3QWR331F1XCC67/QbqkHE8npqUxrsJk2qUI2uMMovMFEOw+YIORT
 mbtndlciO/DcUVaorRncJJdsIsc2fb75D7YuUciIBGdTau/GIYeXEQT4Mr2VcxBIiWdf
 tkUEqonfoZkj2niK8BmMV+eSSPmrv8s6OxXan2RWk8UO4XgOFY1xtG+Ht4rV1QNXONoK
 FqclskTm0nVwlN6tdt3aYsYJ3VK1KQO1fYfSOHrBrXmDasvZxppzulPXQvecrmfinnD6
 HDkw==
X-Gm-Message-State: AOAM533/MUzjvQfueI4l4N4rmOy3GGdqlYQhXhOLojWT0HDimuZYurEr
 i7tQ7sHh/cLHxOqA12Oc54vBVKV5mSZ7NOoJuiY=
X-Google-Smtp-Source: ABdhPJw4CjWJ8BjZkJLwt0AYD32zbQfBFtou0bzldpRHIyrs5wcDMJCuHN+jb8OQZvEJwjqTG8vixIcKZomTxJxoDl4=
X-Received: by 2002:a05:6402:26c1:: with SMTP id
 x1mr8544268edd.395.1635448470197; 
 Thu, 28 Oct 2021 12:14:30 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 29 Oct 2021 05:14:19 +1000
Message-ID: <CAPM=9tw2U8mu1H+yCg=eRvoWOJXu7FD81doH+qQhWt-yznRSbQ@mail.gmail.com>
Subject: [git pull] drm fixes for 5.15 final
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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

Quiet but not too quiet, I blame Halloween. The first set of amdgpu
fixes missed last week, hence why this has a few more of them, it's
mostly display fixes for new GPUs and some debugfs OOB stuff. The i915
patches have one to remove a tracepoint possible issue before it's a
real problem, the others around cflush and display are cc'ed to stable
as well. Otherwise it's just a few misc fixes.

Dave.

drm-fixes-2021-10-29:
drm fixes for 5.15 final

MAINTAINERS:
- change the paths

ttm:
- Fix fence leak in ttm_transfered_destroy.

core:
- add GPD Win3 rotation quirk

i915:
- Remove unconditional clflushes
- Fix oops on boot due to sync state on disabled DP encoders
- Revert backend specific data added to tracepoints
- Remove useless and incorrect memory frequency calculation

panel:
- Add quirk for Aya Neo 2021

seltest:
- Reset property count for each drm damage selftest so full run will
work correctly.

amdgpu:
- Fix two potential out of bounds writes in debugfs
- Fix revision handling for Yellow Carp
- Display fixes for Yellow Carp
- Display fixes for DCN 3.1
The following changes since commit 3906fe9bb7f1a2c8667ae54e967dc8690824f4ea=
:

  Linux 5.15-rc7 (2021-10-25 11:30:31 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-10-29

for you to fetch changes up to b112166a894db446f47a8c31781b037f28ac1721:

  MAINTAINERS: dri-devel is for all of drivers/gpu (2021-10-29 04:49:11 +10=
00)

----------------------------------------------------------------
drm fixes for 5.15 final

MAINTAINERS:
- change the paths

ttm:
- Fix fence leak in ttm_transfered_destroy.

core:
- add GPD Win3 rotation quirk

i915:
- Remove unconditional clflushes
- Fix oops on boot due to sync state on disabled DP encoders
- Revert backend specific data added to tracepoints
- Remove useless and incorrect memory frequence calculation

panel:
- Add quirk for Aya Neo 2021

seltest:
- Reset property count for each drm damage selftest so full run will
work correctly.

amdgpu:
- Fix two potential out of bounds writes in debugfs
- Fix revision handling for Yellow Carp
- Display fixes for Yellow Carp
- Display fixes for DCN 3.1

----------------------------------------------------------------
Aaron Liu (1):
      drm/amdgpu: support B0&B1 external revision id for yellow carp

Bryant Mairs (1):
      drm: panel-orientation-quirks: Add quirk for Aya Neo 2021

Christian K=C3=B6nig (1):
      drm/ttm: fix memleak in ttm_transfered_destroy

Daniel Vetter (2):
      drm/i915/selftests: Properly reset mock object propers for each test
      MAINTAINERS: dri-devel is for all of drivers/gpu

Dave Airlie (5):
      Merge tag 'amd-drm-fixes-5.15-2021-10-21' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'amd-drm-fixes-5.15-2021-10-27' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2021-10-26' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-misc-fixes-2021-10-28' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2021-10-28' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Eric Yang (1):
      drm/amd/display: increase Z9 latency to workaround underflow in Z9

Imre Deak (1):
      drm/i915/dp: Skip the HW readout of DPCD on disabled encoders

Jake Wang (1):
      drm/amd/display: Moved dccg init to after bios golden init

Joonas Lahtinen (1):
      drm/i915: Revert 'guc_id' from i915_request tracepoint

Jos=C3=A9 Roberto de Souza (1):
      drm/i915: Remove memory frequency calculation

Mario (1):
      drm: panel-orientation-quirks: Add quirk for GPD Win3

Michael Strauss (1):
      drm/amd/display: Fallback to clocks which meet requested voltage on D=
CN31

Nicholas Kazlauskas (3):
      drm/amd/display: Fix prefetch bandwidth calculation for DCN3.1
      drm/amd/display: Require immediate flip support for DCN3.1 planes
      drm/amd/display: Fix deadlock when falling back to v2 from v3

Nikola Cornij (2):
      drm/amd/display: Limit display scaling to up to true 4k for DCN 3.1
      drm/amd/display: Increase watermark latencies for DCN3.1

Patrik Jakobsson (1):
      drm/amdgpu: Fix even more out of bound writes from debugfs

Thelford Williams (1):
      drm/amdgpu: fix out of bounds write

Ville Syrj=C3=A4l=C3=A4 (2):
      drm/i915: Convert unconditional clflush to drm_clflush_virt_range()
      drm/i915: Catch yet another unconditioal clflush

 MAINTAINERS                                        |  3 +--
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  | 20 +++++++--------
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   | 29 +++++++++++++-----=
---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |  7 +++--
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  | 13 +++++++---
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |  6 ++---
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |  2 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |  6 ++---
 drivers/gpu/drm/drm_panel_orientation_quirks.c     | 12 +++++++++
 drivers/gpu/drm/i915/display/intel_dp.c            |  3 +++
 drivers/gpu/drm/i915/gt/intel_timeline.c           |  4 +--
 drivers/gpu/drm/i915/i915_reg.h                    |  8 ------
 drivers/gpu/drm/i915/i915_trace.h                  |  7 ++---
 drivers/gpu/drm/i915/intel_dram.c                  | 30 ++----------------=
----
 drivers/gpu/drm/selftests/test-drm_damage_helper.c |  1 +
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |  1 +
 17 files changed, 72 insertions(+), 82 deletions(-)
