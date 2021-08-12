Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8605E3EAC34
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 23:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BFB89533;
	Thu, 12 Aug 2021 21:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F378924C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 21:06:19 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id i6so11894979edu.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 14:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=I99Rm3vYyuXWO4M46J9nrtZRiop6Y5gP8n0n32WFEJY=;
 b=g84/X+3Aq2Q5Whxoqd+W/03kvJ3u2jtydYospvuvkI0F00AdUp0M/gHVfImEFcNKYx
 swztgH0LIh89NJ31qjxLtkLgXws5RfPdIjcJjusb16+k0yKk0td9BBYDE2PrF8ykifu8
 iba75DaER32iG3FW6HdJroSSJPE/KNBbyHakfjCXI/HsOGhGxJT/W6Z76q7IqI9Sgonj
 heTEd4xNwhzAX6R222byaBycwqmonFhkNhx5JW4O09ZQY2xe6HUk5R2WyJt1fNrOKX64
 B9Dy4Okwixzs9xVKSkK2jZmFIaEpDtj7Dd5531+CTd2L13A6u0xizayGhw7jCZawEt44
 znQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=I99Rm3vYyuXWO4M46J9nrtZRiop6Y5gP8n0n32WFEJY=;
 b=mwbZrG8vQJ+xDpCI3+aHA4FN95sYli9YsVsPeNsDWWocV0UhEOixb1WVF0xma/+Jia
 rV9wkXgY1KnWL2MZeF6c6+otIAh+I7Hu+Lbn3ydIganZWVb0lzCds0NXu5OGkGRPnxk1
 0Uyn3hYEwJbemQOh51eWuGg9z2sX3Eo0E/D6ErZa9TLvKa4W/P4SnZ724du684lb/nOZ
 rduYCgGwg4cNohlpwtMeuoJPiiJHhACqp4/Qakqmll6eU0D0mLCpC6aZm7EiOjvX1Q98
 9iM+ZyItyDdPlkAxAhbw7si5+mzwalMl2ZRGrkAxbBhBdn+XxTG0cU7lmk41DueFAY+K
 c7qw==
X-Gm-Message-State: AOAM53250mH7oiSkPWnytzL2EUehFZg/kQxYN/mMrS5CjFIua/iTPyGW
 R0Eptq+diYXeGifLI0+lTFskjAJC82Fe2AvUMBW7akf3fQ4=
X-Google-Smtp-Source: ABdhPJxyhLdLUUWFrxN4kPHRuaTpJrv+AMAak31w4gi/HUq6uKINsDqLqMeSykY4e+9HYr6omHHqeqoeBDWl1Wy5ntc=
X-Received: by 2002:a05:6402:44:: with SMTP id
 f4mr7953946edu.220.1628802378386; 
 Thu, 12 Aug 2021 14:06:18 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 13 Aug 2021 07:06:07 +1000
Message-ID: <CAPM=9txa94qbYbskxeTA=8YvkFE+0AMK8Mow+KYV_xkfCfQSzQ@mail.gmail.com>
Subject: [git pull] drm fixes for 5.14-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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

Hey Linus,

Another week, another set of pretty regular fixes, nothing really
stands out too much.

Dave.

drm-fixes-2021-08-13:
drm fixes for 5.14-rc6

amdgpu:
- Yellow carp update
- RAS EEPROM fixes
- BACO/BOCO fixes
- Fix a memory leak in an error path
- Freesync fix
- VCN harvesting fix
- Display fixes

i915:
- GVT fix for Windows VM hang.
- Display fix of 12 BPC bits for display 12 and newer.
- Don't try to access some media register for fused off domains.
- Fix kerneldoc build warnings.

mediatek:
- Fix dpi bridge bug.
- Fix cursor plane no update.

meson:
- Fix colors when booting with HDR
The following changes since commit 36a21d51725af2ce0700c6ebcb6b9594aac658a6:

  Linux 5.14-rc5 (2021-08-08 13:49:31 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-08-13

for you to fetch changes up to a1fa72683166b3c69511d5f2ffb37b9f49f48fea:

  Merge tag 'drm-misc-fixes-2021-08-12' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2021-08-13
06:37:40 +1000)

----------------------------------------------------------------
drm fixes for 5.14-rc6

amdgpu:
- Yellow carp update
- RAS EEPROM fixes
- BACO/BOCO fixes
- Fix a memory leak in an error path
- Freesync fix
- VCN harvesting fix
- Display fixes

i915:
- GVT fix for Windows VM hang.
- Display fix of 12 BPC bits for display 12 and newer.
- Don't try to access some media register for fused off domains.
- Fix kerneldoc build warnings.

mediatek:
- Fix dpi bridge bug.
- Fix cursor plane no update.

meson:
- Fix colors when booting with HDR

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: don't enable baco on boco platforms in runpm
      drm/amdgpu: handle VCN instances when harvesting (v2)

Ankit Nautiyal (1):
      drm/i915/display: Fix the 12 BPC bits for PIPE_MISC reg

Anson Jacob (1):
      drm/amd/display: use GFP_ATOMIC in amdgpu_dm_irq_schedule_work

Christian Hewitt (1):
      drm/meson: fix colour distortion from HDR set during vendor u-boot

Christophe JAILLET (1):
      drm/amd/pm: Fix a memory leak in an error handling path in
'vangogh_tables_init()'

Daniel Vetter (1):
      drm/doc/rfc: drop lmem uapi section

Dave Airlie (4):
      Merge tag 'mediatek-drm-fixes-5.14' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes
      Merge tag 'amd-drm-fixes-5.14-2021-08-11' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2021-08-12' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-misc-fixes-2021-08-12' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Eric Bernstein (1):
      drm/amd/display: Remove invalid assert for ODM + MPC case

Frank Wunderlich (1):
      drm/mediatek: dpi: Fix NULL dereference in mtk_dpi_bridge_atomic_check

Hsin-Yi Wang (1):
      drm/mediatek: mtk-dpi: Set out_fmt from config if not the last bridge

John Clements (1):
      drm/amdgpu: set RAS EEPROM address from VBIOS

Kenneth Feng (1):
      drm/amd/pm: bug fix for the runtime pm BACO

Matt Roper (1):
      drm/i915: Only access SFC_DONE when media domain is not fused off

Rodrigo Vivi (1):
      Merge tag 'gvt-fixes-2021-08-10' of
https://github.com/intel/gvt-linux into drm-intel-fixes

Solomon Chiu (1):
      drm/amdgpu: Add preferred mode in modeset when freesync video
mode's enabled.

Xiaomeng Hou (1):
      drm/amd/pm: update smu v13.0.1 firmware header

Zhenyu Wang (1):
      drm/i915/gvt: Fix cached atomics setting for Windows VM

jason-jh.lin (1):
      drm/mediatek: Fix cursor plane no update

 Documentation/gpu/rfc/i915_gem_lmem.rst            | 109 ---------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |  40 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h   |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  12 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   4 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   7 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   1 -
 drivers/gpu/drm/amd/include/atomfirmware.h         |   2 +-
 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1_pmfw.h      |   4 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  34 +++++--
 drivers/gpu/drm/i915/gvt/handlers.c                |   1 +
 drivers/gpu/drm/i915/gvt/mmio_context.c            |   2 +
 drivers/gpu/drm/i915/i915_gpu_error.c              |  19 +++-
 drivers/gpu/drm/i915/i915_reg.h                    |  16 ++-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |   6 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |   3 -
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |  60 +++++++-----
 drivers/gpu/drm/meson/meson_registers.h            |   5 +
 drivers/gpu/drm/meson/meson_viu.c                  |   7 +-
 23 files changed, 175 insertions(+), 167 deletions(-)
