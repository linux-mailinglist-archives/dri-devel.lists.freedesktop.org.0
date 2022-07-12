Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6B3570F89
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 03:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EC693014;
	Tue, 12 Jul 2022 01:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086F193014
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 01:32:45 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id b11so11726352eju.10
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 18:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=sKmlJNbOCxxGu2qoEpBgoFbduYBXC63XtKF5C6TRjl4=;
 b=NyKa32/ZEaCGrRikTeghU9YrYFt7yToYrMdISiP/VYrKCVmwHMdSqH7HuqAuI/2dz/
 2K7XfDGwwVnOMR/zv8TwExlwddpTDupWPw10vDpmRJiSMtdISF0hDpvW3385pgEBj2vQ
 7Awb7iPaIkXg5ct35tLHRcL6NeB5sD75obZyHdi3ilAYxZA09wtt0NSgkuJX33TnIemH
 Y8bufO5ezLAYzTaFNFGmIO3XrxZGTifDUNLX27QtuY7/qWbgfTdMr5TGFb5ZdsrhB0Rn
 T6KjJzg0BnuLTU60j0IW8xF0vLqjW/PBGwnxx9yAjDyhqypOc3IB6+2hYAoGtbNKsal3
 ambg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=sKmlJNbOCxxGu2qoEpBgoFbduYBXC63XtKF5C6TRjl4=;
 b=L51bbCJ80Hs8hfJ8pA+UpvxXvPnYGJnTEs+S6aLyt540P+PaHsgagwkQkfYgpzi/oo
 I+QrJc8K4M9nz3OeAczIhHDPcevZWNjoQzJ+sPFbnj4o0Tal7/deNcb8M6OHaFtyBmeX
 t92kcL4YpbSPSycQKzKmPHM0jhRtukngPgdZ286tDdEJrg/vOH52UiHLq0KmB1HZhMNE
 LZtwQaJiYxcdGxjDfmnn3NRTBgGejPcLF/9T9XdWplhPco9mc1A7h/oE6IikwgZAMJsu
 f0BdFJ/lF1Yonoafx3Cd7OydBf8dq6QRUpcHGXnAwEfpKC+/+R3CpDk+C+6cXGmObYkS
 q1zg==
X-Gm-Message-State: AJIora/ytmyAjCBIbF96qnt//bsjp7cdPThgRMXVyEKutYJU3yXJS8K+
 4YCY+dBRc1KuzurvEe4RAQ7jjT5H95rWBv4BidzgdMcTet4=
X-Google-Smtp-Source: AGRyM1vzvH3Y7oBxzCV9ARzK4CnIUVERGfxjpQPtCysIILmYPTc7fbrhvhWhCj73MmPCtxSeHf//ydZySTDY1JSCsjE=
X-Received: by 2002:a17:906:149:b0:712:502:bc62 with SMTP id
 9-20020a170906014900b007120502bc62mr21783814ejh.720.1657589562490; Mon, 11
 Jul 2022 18:32:42 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 12 Jul 2022 11:32:31 +1000
Message-ID: <CAPM=9tyJzO0bwtopJsfkZ6FRjkk9EghPzhBOQ-_9qQAALvOq+A@mail.gmail.com>
Subject: [git pull] drm fixes for 5.19-rc7 (late rc6)
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

Hey Linus,

back from holidays, delayed by a day due to airline craziness, I see
you picked up one of the fbdev fixes, this is the other stuff that was
queued up last week.

I just noticed I got the rc? in the signed tag wrong, I've fixed them
in this email, but not sure if you care.

A bit of a scattering of fixes, 3 for i915, one amdgpu, and a couple
of panfrost, rockchip, panel and bridge ones.

If I have anything else at the end of the week I'll send a regular pull req=
.

Dave.


drm-fixes-2022-07-12:
drm fixes for 5.19-rc7 (well rc6 but late).

amdgpu:
- Hibernation fix

dma-buf:
- fix use after free of fence

i915:
- Fix a possible refcount leak in DP MST connector (Hangyu)
- Fix on loading guc on ADL-N (Daniele)
- Fix vm use-after-free in vma destruction (Thomas)

bridge:
- fsl-ldb : 3 LVDS modesetting fixes

rockchip:
- iommu domain fix

panfrost:
- fix memory corruption
- error path fix

panel:
- orientation quirk fix for Yoga tablet 2

ssd130x:
- fix pre-charge period setting
The following changes since commit 32346491ddf24599decca06190ebca03ff9de7f8=
:

  Linux 5.19-rc6 (2022-07-10 14:40:51 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-07-12

for you to fetch changes up to 3590b44b9434af1b9c81c3f40189087ed4fe3635:

  Merge tag 'drm-misc-fixes-2022-07-07-1' of
ssh://git.freedesktop.org/git/drm/drm-misc into drm-fixes (2022-07-12
10:44:40 +1000)

----------------------------------------------------------------
drm fixes for 5.19-rc7 (well rc6 but late).

amdgpu:
- Hibernation fix

dma-buf:
- fix use after free of fence

i915:
- Fix a possible refcount leak in DP MST connector (Hangyu)
- Fix on loading guc on ADL-N (Daniele)
- Fix vm use-after-free in vma destruction (Thomas)

bridge:
- fsl-ldb : 3 LVDS modesetting fixes

rockchip:
- iommu domain fix

panfrost:
- fix memory corruption
- error path fix

panel:
- orientation quirk fix for Yoga tablet 2

ssd130x:
- fix pre-charge period setting

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: keep fbdev buffers pinned during suspend
      drm/amdgpu/display: disable prefer_shadow for generic fb helpers

Daniele Ceraolo Spurio (1):
      drm/i915/guc: ADL-N should use the same GuC FW as ADL-S

Dave Airlie (3):
      Merge tag 'amd-drm-fixes-5.19-2022-07-06' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2022-07-07' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-misc-fixes-2022-07-07-1' of
ssh://git.freedesktop.org/git/drm/drm-misc into drm-fixes

Dmitry Osipenko (2):
      drm/panfrost: Put mapping instead of shmem obj on
panfrost_mmu_map_fault_addr() error
      drm/panfrost: Fix shrinker list corruption by madvise IOCTL

Ezequiel Garcia (1):
      drm/ssd130x: Fix pre-charge period setting

Hangyu Hua (1):
      drm/i915: fix a possible refcount leak in intel_dp_add_mst_connector(=
)

Hans de Goede (1):
      drm: panel-orientation-quirks: Add quirk for the Lenovo Yoga Tablet 2=
 830

Liu Ying (3):
      drm/bridge: fsl-ldb: Fix mode clock rate validation
      drm/bridge: fsl-ldb: Enable split mode for LVDS dual link
      drm/bridge: fsl-ldb: Drop DE signal polarity inversion

Steven Price (1):
      drm/rockchip: Detach from ARM DMA domain in attach_device

Thomas Hellstr=C3=B6m (1):
      drm/i915: Fix vm use-after-free in vma destruction

Thomas Zimmermann (1):
      drm/aperture: Run fbdev removal before internal helpers

xinhui pan (1):
      dma-buf: Fix one use-after-free of fence

 drivers/dma-buf/dma-resv.c                        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       | 25 +++++++++++++++++++=
----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c          |  3 ++-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            |  3 ++-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            |  3 ++-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             |  3 ++-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             |  3 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 ++-
 drivers/gpu/drm/bridge/fsl-ldb.c                  | 21 ++-----------------
 drivers/gpu/drm/drm_panel_orientation_quirks.c    | 15 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c       |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c          |  9 ++++++++
 drivers/gpu/drm/i915/i915_vma.c                   | 12 +++++++----
 drivers/gpu/drm/panfrost/panfrost_drv.c           |  4 ++--
 drivers/gpu/drm/panfrost/panfrost_mmu.c           |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c       | 17 +++++++++++++++
 drivers/gpu/drm/solomon/ssd130x.c                 |  2 +-
 17 files changed, 90 insertions(+), 38 deletions(-)
