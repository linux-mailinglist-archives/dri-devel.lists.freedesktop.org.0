Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE5627F94D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 08:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E13E6E134;
	Thu,  1 Oct 2020 06:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727C86E134
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 06:10:35 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id qp15so5330079ejb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 23:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=jbnyjE/AX8v5NK7McM5EMdYujaOTMVhXCvWjXTugsV0=;
 b=SvnLqHLCcb7P9dp8E9hxoz1SZX58Ash9xa9eorxUta1zThnWr76YnSj0hBjuqKzfYD
 UzpMmLiQ+J2JyGOTDTzZ336tF66umuqnb44mV0aznbpJzaJaz4pcOvxlEWO2/ZgaLji7
 upUHEh4hv76I4+a7RZadMc2Hh22e4EMzh4Y2dzWgMuM004iHWueNVabZAtCfkKUDjwfp
 bf3ORHXgr1dsr2HQc5p8EU0J5EmOQJ3Ng4AKp0YoUmkM9I3shuKBYefLfSgAEChNiLJp
 a46KDpGLFl/70DzDopzg4OivdycgI746MK/aEF09Ywpft7y5z+t6S5gFZy0eZ7zX+TQy
 G5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=jbnyjE/AX8v5NK7McM5EMdYujaOTMVhXCvWjXTugsV0=;
 b=ApkuiIvjtiEoSLx9WK/61sSshdTe1xtfLicFP6ZQnXouJyJerFKjFTHRfEAPSr4VNV
 LvKjYuu85tFReg25pK74zUuwvR1MruBVSvkMtxy2WEiWcDr8yO4JP+ctzuyua3eqa1KC
 jmL7nbBBqgUMBDjX2popcxxAeN7JDenNRo3KWLPh0vHXim0Vm2e/+qyLms/gOf2Nk2vF
 DtcO0djtbiVKvPEPFlKc8N6WU9Zub+kH+LelLMX63R6QlffYJVjPKs6HjG2qK9yWxQX0
 9C5bE9w5RDdLKcCtBDFuK37x4hGAYAqW7n6XlOc+LJKVixGwtFSZQ4tUQuuewMi8gfNj
 h3vw==
X-Gm-Message-State: AOAM533FaTsabEsBBqLCbbJysrmnZgkhrTwJSyzS6vXTW/8BfQIswjpc
 QkbTXiRCVZNQDoBMwwE6CJyLX5qAiNoKQJ1zWlA=
X-Google-Smtp-Source: ABdhPJx5ZPnGimrx4CYU7hNFQsc9cNWp7vY2oYg3MErIcXroIUebbl2iOqyyjXQzoAh3Kbs4U+Yl4dNgP1pikiYnir8=
X-Received: by 2002:a17:906:fb8c:: with SMTP id
 lr12mr6753781ejb.9.1601532633857; 
 Wed, 30 Sep 2020 23:10:33 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 1 Oct 2020 16:10:22 +1000
Message-ID: <CAPM=9txPMxjzQTiZiWeMCs_LDoYGid_d3F6W5HdBr8UB=tjvug@mail.gmail.com>
Subject: [git pull] drm amdgpu + vmwgfx fixes for 5.9-rc8
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

Just dequeuing these a bit early as the AMD ones are bit larger than
I'd prefer, but Alex missed last week so it's a double set of fixes.
The larger ones are just register header fixes for the new chips that
were just introduced in rc1 along with some new PCI IDs for new hw.
Otherwise it is usual fixes.

The vmwgfx fix was due to some testing I was doing and found we
weren't booting properly, vmware had the fix internally so hurried it
out to me.

I'm off tomorrow and Monday but I'll be around in case there are any
major issues with this, or if I get set of intel or misc fixes come
in.

Dave.

drm-fixes-2020-10-01-1:
drm amd/vmwgfx fixes for 5.9-rc8

vmwgfx:
- fix a regression due to TTM refactor

amdgpu:
- Fix potential double free in userptr handling
- Sienna Cichlid and Navy Flounder updates
- Add Sienna Cichlid PCI IDs
- Drop experimental flag for navi12
- Raven fixes
- Renoir fixes
- HDCP fix
- DCN3 fix for clang and older versions of gcc
- Fix a runtime pm refcount issue
The following changes since commit a1b8638ba1320e6684aa98233c15255eb803fac7:

  Linux 5.9-rc7 (2020-09-27 14:38:10 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-10-01-1

for you to fetch changes up to 132d7c8abeaa6b10ed5f47330b0f06c6dd220a43:

  Merge tag 'amd-drm-fixes-5.9-2020-09-30' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes (2020-10-01
15:25:33 +1000)

----------------------------------------------------------------
drm amd/vmwgfx fixes for 5.9-rc8

vmwgfx:
- fix a regression due to TTM refactor

amdgpu:
- Fix potential double free in userptr handling
- Sienna Cichlid and Navy Flounder udpates
- Add Sienna Cichlid PCI IDs
- Drop experimental flag for navi12
- Raven fixes
- Renoir fixes
- HDCP fix
- DCN3 fix for clang and older versions of gcc
- Fix a runtime pm refcount issue

----------------------------------------------------------------
Alex Deucher (6):
      drm/amdgpu: add the GC 10.3 VRS registers
      drm/amdgpu: add VCN 3.0 AV1 registers
      drm/amdgpu: use the AV1 defines for VCN 3.0
      drm/amdgpu: remove experimental flag from navi12
      drm/amdgpu/display: fix CFLAGS setup for DCN30
      drm/amdgpu/swsmu/smu12: fix force clock handling for mclk

Dave Airlie (2):
      Merge branch 'vmwgfx-fixes-5.9' of
git://people.freedesktop.org/~sroland/linux into drm-fixes
      Merge tag 'amd-drm-fixes-5.9-2020-09-30' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes

Dirk Gouders (1):
      drm/amd/display: remove duplicate call to rn_vbios_smu_get_smu_version()

Evan Quan (1):
      drm/amd/pm: setup APU dpm clock table in SMU HW initialization

Flora Cui (1):
      drm/amd/display: fix return value check for hdcp_work

Jean Delvare (1):
      drm/amdgpu: restore proper ref count in amdgpu_display_crtc_set_config

Jiansong Chen (2):
      drm/amdgpu: remove gpu_info fw support for sienna_cichlid etc.
      drm/amdgpu: disable gfxoff temporarily for navy_flounder

Likun Gao (1):
      drm/amdgpu: add device ID for sienna_cichlid (v2)

Philip Yang (1):
      drm/amdgpu: prevent double kfree ttm->sg

Sudheesh Mavila (1):
      drm/amd/pm: Removed fixed clock in auto mode DPM

Zack Rusin (1):
      drm/vmwgfx: Fix error handling in get_node

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 10 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 12 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  3 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              | 16 +++----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |  2 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |  1 -
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      | 18 +++++++-
 .../amd/include/asic_reg/gc/gc_10_3_0_default.h    |  2 +
 .../drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h |  4 ++
 .../amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h    | 50 ++++++++++++++++++++++
 .../amd/include/asic_reg/vcn/vcn_3_0_0_sh_mask.h   | 34 +++++++++++++++
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c         | 22 +++++-----
 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c  | 10 +++--
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c         |  8 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c                |  2 +-
 18 files changed, 156 insertions(+), 43 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
