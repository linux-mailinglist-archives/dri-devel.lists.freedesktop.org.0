Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 690E61AE9C4
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 06:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BB089893;
	Sat, 18 Apr 2020 04:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DCB89893
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 04:24:45 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id a2so3155303ejx.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 21:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=KBazz/io4zB337FE32+j8O9LmbM2Ojdb+G1jwNFZHzc=;
 b=TIoULuR6pSS7qF+35ZooJKmh4zn0jJ0F0lmm72vtCaOAH9qI+I7DVatI+c2wyxBSL9
 aMVhdNaSkwrjuTOUj1Wm5r/qtU2yqUb5N483BLnVxodd1IYwfTJgEPkDnFCGIU1qSYqz
 KaChHwPnSE3WXcbmLkTlznL4PU9kpNxrhDxxIKf7PM7wYW1Qh1hi/xHrWYX7qJpmWO4f
 a+uykNAKtIM286GEh3SO/ofUxuzNp8GGOSoG9pV7gYARfpt0O4E7TxvQYBsmoZlLrhPH
 DTgh5CLWQZ4hTVgMGUz1KfFfVRNJMYVM8HEixCI37vge9CYgug2s+U96cMf6LJjUY7D3
 /VGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=KBazz/io4zB337FE32+j8O9LmbM2Ojdb+G1jwNFZHzc=;
 b=McuexJ9g4NWeb4VYVid4SdqbiceN8pYmaRoDP/EtXjauO5Fcup/GiWNux4IfVu69X7
 L6Cz/QYFmXw8bbx2GDC84A9XbtDdp4L1dlKSQstw2DdKNPztRjFP5uXl4cCXHxuWenYj
 5FGo8sL0NoJxzfPOQBTUCLek8XEglGIofAApwqsxLWO8vPocXoY1WhnbzBKXHjaDc8l1
 vGCZEjFIfNrodAXHOWzU3T2bBavvbUvmGoS3rdOtlDrSkaUG68RMi+5A7/WwqGg8rAuq
 iDO3cYOekaoW25kkqZee9gFLVaqNbibM8DiOhPWblmg+xljXqJFte52DghImvjyANO41
 azUQ==
X-Gm-Message-State: AGi0PuaKDM1YU8x33NKtDy46TTE1B8kSyeVYPOvWDJ/2BCeE0dceIBV5
 zpt04Af5AoXopMXd6tZFAaVLW9EUogvozvg60YY=
X-Google-Smtp-Source: APiQypIACnYxc28zp8rR2XbSkGCVW0GqITrKgvddjeZlAneug7hNzxQ4GFs0nvOmQYlWEe7K7QjQpIWhModM9oXNcjs=
X-Received: by 2002:a17:906:64b:: with SMTP id
 t11mr6229593ejb.336.1587183883952; 
 Fri, 17 Apr 2020 21:24:43 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 18 Apr 2020 14:24:32 +1000
Message-ID: <CAPM=9tyt1N=QTmsyBKYzMqYJLbNzrgrnNoqQrzn3735ePSCODQ@mail.gmail.com>
Subject: [git pull] drm fixes for 5.7-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Quiet enough for rc2, mostly amdgpu fixes, a couple of i915 fixes, and
one nouveau module firmware fix.

Regards,
Dave.

drm-fixes-2020-04-18:
drm fixes for 5.7-rc2

i915:
- Fix guest page access by using the brand new VFIO dma r/w interface (Yan)
- Fix for i915 perf read buffers (Ashutosh)

amdgpu:
- gfx10 fix
- SMU7 overclocking fix
- RAS fix
- GPU reset fix
- Fix a regression in a previous s/r fix
- Add a gfxoff quirk

nouveau:
- fix missing MODULE_FIRMWARE
The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-04-18

for you to fetch changes up to 4da858c086433cd012c0bb16b5921f6fafe3f803:

  Merge branch 'linux-5.7' of git://github.com/skeggsb/linux into
drm-fixes (2020-04-16 15:40:02 +1000)

----------------------------------------------------------------
drm fixes for 5.7-rc2

i915:
- Fix guest page access by using the brand new VFIO dma r/w interface (Yan)
- Fix for i915 perf read buffers (Ashutosh)

amdgpu:
- gfx10 fix
- SMU7 overclocking fix
- RAS fix
- GPU reset fix
- Fix a regression in a previous s/r fix
- Add a gfxoff quirk

nouveau:
- fix missing MODULE_FIRMWARE

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/gfx9: add gfxoff quirk

Ashutosh Dixit (1):
      drm/i915/perf: Do not clear pollin for small user read buffers

Ben Skeggs (1):
      drm/nouveau/sec2/gv100-: add missing MODULE_FIRMWARE()

Dave Airlie (3):
      Merge tag 'drm-intel-fixes-2020-04-15' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.7-2020-04-15' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes
      Merge branch 'linux-5.7' of git://github.com/skeggsb/linux into drm-fixes

Evan Quan (2):
      drm/amd/powerplay: unload mp1 for Arcturus RAS baco reset
      drm/amdgpu: fix wrong vram lost counter increment V2

Likun Gao (1):
      Revert "drm/amdgpu: change SH MEM alignment mode for gfx10"

Prike Liang (1):
      drm/amdgpu: fix the hw hang during perform system reboot and reset

Rodrigo Vivi (1):
      Merge tag 'gvt-fixes-2020-04-14' of
https://github.com/intel/gvt-linux into drm-intel-fixes

Sergei Lopatin (1):
      drm/amd/powerplay: force the trim of the mclk dpm_levels if OD is enabled

Yan Zhao (3):
      drm/i915/gvt: hold reference of VFIO group during opening of vgpu
      drm/i915/gvt: subsitute kvm_read/write_guest with vfio_dma_rw
      drm/i915/gvt: switch to user vfio_group_pin/upin_pages

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       | 22 +++++++-
 drivers/gpu/drm/amd/amdgpu/cik.c                 |  2 -
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c            |  2 +
 drivers/gpu/drm/amd/amdgpu/nv.c                  |  4 --
 drivers/gpu/drm/amd/amdgpu/soc15.c               |  4 --
 drivers/gpu/drm/amd/amdgpu/vi.c                  |  2 -
 drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c |  5 +-
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c        |  6 +++
 drivers/gpu/drm/i915/gvt/kvmgt.c                 | 46 ++++++++---------
 drivers/gpu/drm/i915/i915_perf.c                 | 65 ++++--------------------
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/gp108.c |  3 ++
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/tu102.c | 16 ++++++
 13 files changed, 85 insertions(+), 94 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
