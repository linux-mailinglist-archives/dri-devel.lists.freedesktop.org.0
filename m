Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B084B1D05
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 04:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE34810E198;
	Fri, 11 Feb 2022 03:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8858010E198
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 03:46:59 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id cf2so14334285edb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 19:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=2PDR0Kq1tgGYl1i+M60kVqLnWzkrDZ3u0a8heT5836A=;
 b=LwZS5W5twyYS7Chmw48x4drfA24BoHXN9Pis2uvWS56bHikZKo71A6uH9iu8mzWWTz
 fmv1cKxDb+PaHynBEf10o6leXSduLrJDuIToupnoyJwqgdVdvTCBB+uThE5Fylog3EpV
 D+ZGQAr21x24i1AR+mBo8cqCHTtfUYwsPFtLAXjTJtxqSsjaJvqeASHslSXrsRMm92N+
 uTQGr1cNs8HcXOUZtNcnUasBNTVSAyPvj6dOp42XW/nQp66UuK6y2wa8dlhHdf5u6x3P
 ghQxy6NvF6mToBgkmzaooOwAQUQDMIR7ARrEJXlOPGq9q1rJXlQh+TIY//Wr7ien50Q2
 7Scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=2PDR0Kq1tgGYl1i+M60kVqLnWzkrDZ3u0a8heT5836A=;
 b=tHARRhMNNLnnCpiMKoza7XcGSuoUK1fbvRz5ZU4bNvr0HzE9OjtyD5Usx/K9PYFjwo
 hrz0VWL2JNhNEoPVa97s/nPhKxZiEfpYZ4452JoPpFTH/nA+icrDpcDKv1RCDxphwRAr
 av5oN8uDxM4FrZWoEgQ2DE19bciJGaLaD0RQFGNk2IU7I0joOrRNi2wwWhOfYfdr80q3
 e4zMlRDFi2ewS7ZX72i/JHkEnmbjtb3kUoWxY6g0pDl0FVHOc4RGI7YdUWiCnQk9GlqW
 gtN1rNLUwNNLmWQCjtXmbNV59JdG5o+YFXbdnKynnHwTKjFqZNVknxUvLQKRbbGhNkrV
 3XUw==
X-Gm-Message-State: AOAM532DiYg1k1Voi5QswT6HXBTzV24xVM8t0lMRspDDz1bMC57EY3Us
 Mkgr6pSsYJq3bdIMmR3sN195VQU6DVblNP4zt1A=
X-Google-Smtp-Source: ABdhPJzCThQ1XtL3qWcXDJHA1BvAbOsOAmKl6gnLACotmwdU/hPp3KjtPDMcDRu0ZL6SZ7OU5/Om6MkFhnKkNDZr3zc=
X-Received: by 2002:a05:6402:1007:: with SMTP id
 c7mr11243500edu.424.1644551217894; 
 Thu, 10 Feb 2022 19:46:57 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 11 Feb 2022 13:46:47 +1000
Message-ID: <CAPM=9twGhyDpEsDEGQoYR2UXOp5xMAScivj8rWheh+q3ufzNjw@mail.gmail.com>
Subject: [git pull] drm fixes for 5.17-rc4
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

Regular fixes pull, mostly i915 and amd fixes, along with a
maintainers update for fbdev core. Otherwise just some build fixes and
vc4 HDMI fixes.

drm-fixes-2022-02-11:
drm fixes for 5.17-rc4

fbdev:
- MAINTAINERS: add Daniel as fbdev core module maintainer
- build warning fix
- implicit type cast fix

panel:
- simple: Fix assignments from panel_dpi_probe()

privacy-screen:
- fix docs warning

i915:
- non-x86 build fix
- ttm error propogation fix
- drrs on hsw/ivb disabled
- BIOS readout fixes
- missing stackdepot oops fix

amd:
- DCN 3.1 display fixes
- GC 10.3.1 harvest fix
- Page flip irq fix
- hwmon label fix
- DCN 2.0 display fix

rockchip:
- fix HDMI error cleanup
- fix RK3399 VOP register fields

vc4:
- HDMI fixes
- remove redundant code.
The following changes since commit dfd42facf1e4ada021b939b4e19c935dcdd55566=
:

  Linux 5.17-rc3 (2022-02-06 12:20:50 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-02-11

for you to fetch changes up to 95e875bdb1862db178bf24fb703387ec3aa3a34a:

  Merge tag 'amd-drm-fixes-5.17-2022-02-09' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2022-02-11
12:44:02 +1000)

----------------------------------------------------------------
drm fixes for 5.17-rc4

fbdev:
- MAINTAINERS: add Daniel as fbdev core module maintainer
- build warning fix
- implicit type cast fix

panel:
- simple: Fix assignments from panel_dpi_probe()

privacy-screen:
- fix docs warning

i915:
- non-x86 build fix
- ttm error propogation fix
- drrs on hsw/ivb disabled
- BIOS readout fixes
- missing stackdepot oops fix

amd:
- DCN 3.1 display fixes
- GC 10.3.1 harvest fix
- Page flip irq fix
- hwmon label fix
- DCN 2.0 display fix

rockchip:
- fix HDMI error cleanup
- fix RK3399 VOP register fields

vc4:
- HDMI fixes
- remove redundant code.

----------------------------------------------------------------
Aaron Liu (1):
      drm/amdgpu: add utcl2_harvest to gc 10.3.1

Alex Deucher (1):
      drm/amdgpu/display: change pipe policy for DCN 2.0

Brian Norris (1):
      drm/rockchip: vop: Correct RK3399 VOP register fields

Christoph Niedermaier (1):
      drm/panel: simple: Assign data from panel_dpi_probe() correctly

Daniel Vetter (1):
      MAINTAINERS: Add entry for fbdev core

Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2022-02-10' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2022-02-10' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.17-2022-02-09' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Dave Stevenson (3):
      drm/vc4: hdmi: Ensure we don't use 2711 HPD registers on Pi0-3
      drm/vc4: hdmi: Don't try disabling SCDC on Pi0-3.
      drm/vc4: hdmi: Allow DBLCLK modes even if horz timing is odd.

Dmytro Laktyushkin (1):
      drm/amd/display: fix yellow carp wm clamping

Hans de Goede (1):
      drm/privacy-screen: Fix sphinx warning

Helge Deller (1):
      fbcon: Avoid 'cap' set but not used warning

Lucas De Marchi (1):
      drm/i915: Fix header test for !CONFIG_X86

Mario Limonciello (1):
      display/amd: decrease message verbosity about watermarks table failur=
e

Maxime Ripard (1):
      drm/vc4: crtc: Fix redundant variable assignment

Roman Li (1):
      drm/amd/display: Cap pflip irqs per max otg number

Sascha Hauer (1):
      drm/rockchip: dw_hdmi: Do not leave clock enabled in error case

Thomas Hellstr=C3=B6m (1):
      drm/i915/ttm: Return some errors instead of trying memcpy move

Ville Syrj=C3=A4l=C3=A4 (5):
      drm/i915: Fix oops due to missing stack depot
      drm/i915: Disable DRRS on IVB/HSW port !=3D A
      drm/i915: Allow !join_mbus cases for adlp+ dbuf configuration
      drm/i915: Populate pipe dbuf slices more accurately during readout
      drm/i915: Workaround broken BIOS DBUF configuration on TGL/RKL

Yang Wang (1):
      drm/amd/pm: fix hwmon node of power1_label create issue

Yizhuo Zhai (1):
      fbdev: fbmem: Fix the implicit type casting

Zhan Liu (1):
      drm/amd/display: keep eDP Vdd on when eDP stream is already enabled

 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |   7 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   2 +-
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |   6 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   2 +
 drivers/gpu/drm/amd/display/dc/dc.h                |   1 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  24 +++-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |  61 ++++-----
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   3 +-
 drivers/gpu/drm/drm_privacy_screen.c               |   2 +-
 drivers/gpu/drm/i915/display/intel_display.c       |   1 +
 drivers/gpu/drm/i915/display/intel_drrs.c          |   8 ++
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |  14 +-
 drivers/gpu/drm/i915/i915_mm.h                     |   1 +
 drivers/gpu/drm/i915/intel_pm.c                    | 143 +++++++++++++++++=
----
 drivers/gpu/drm/i915/intel_pm.h                    |   1 +
 drivers/gpu/drm/i915/intel_runtime_pm.c            |   4 +-
 drivers/gpu/drm/panel/panel-simple.c               |   1 +
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |  14 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |   8 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |   1 -
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  29 +++--
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   3 +
 drivers/video/fbdev/core/fbcon.c                   |   7 +-
 drivers/video/fbdev/core/fbmem.c                   |   2 +
 26 files changed, 261 insertions(+), 92 deletions(-)
