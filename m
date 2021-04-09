Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB71535A74F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 21:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCEB6E044;
	Fri,  9 Apr 2021 19:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5746A6E044
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 19:46:34 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id e14so10409782ejz.11
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 12:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=00DmRMd0Ppqlj6NPfhWteKHJG+0eTjZ5Lw0FbYcqZWg=;
 b=pkS00Iq/wQKviqbuLMLppilzSlzEv+HlJhPDmiQGmXLhAmWY7fWUlKUTxq95gNFJOA
 xFW8exg0NiMjw1Ijes/kkILItqOPu+tXfyFZq3ybDuX9Z/VPooGL6zdMuziFlsNKGzNF
 BpIuaNqOCv0/yNua9z/rDXFJeYk1Eh1Cf11G4ZjHuw63RBcAh46oDAuBJKBQICUPRzpM
 1f8asSLlRuU/pgaLWVyWiXhmgVDeok31NkJDwCpJhbzOApexd+MYJl1ExMNQ2mZwJgzd
 RRplEn7DplwyM5DW+zTey1KhDkrbcYRzRA/L+u5QUYDpK6NpXJSTMcM9PKjtGakdD6ie
 wR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=00DmRMd0Ppqlj6NPfhWteKHJG+0eTjZ5Lw0FbYcqZWg=;
 b=KyD+Y5QUkoNoFnLET99rBp2+PGfMYCGQ0IJzSO/zzW9kXWEfcuRfhEow5gTUSdEWLH
 UNcp0eBs1herVsqOkANCZZhJs1AW14nIBCGbs9alDk7yK4eMscFsNRIsX9JW0Qa2wPiO
 an1fcZRUUBCO8aFy5qoilM/lOsbGrBxIXPXppj5yEocl+Xss41VJIhn8bYOh6r/Vc8VC
 hTJBwScf6i1oUqVpzn3NSZzTEmDP+fcZXUqsyrhdKij7JAmSyGqbeMzr9AfuFCj/cfff
 NPfeA47v/gUwbImBEPY0zxaH8FZ60AglhNJhkPjE3/fiK665/W8d63XWOKczo3AHfitP
 84/g==
X-Gm-Message-State: AOAM5311ZxBrXHgqblew5iNvvWwx0uCtvZHuZkX+jT60706Y8c7vst58
 x0fdHNcUq/J4lLpjGeM2PpxvUkXDlssih3T4clI=
X-Google-Smtp-Source: ABdhPJw1QLWMZjdPXQ2gCQH271yG+cva4TDX/pYpqFbT7ICP3mLlVjj+P3dUxYswl1jiuS9nuJH2IAJK/Vm8NYqIScU=
X-Received: by 2002:a17:906:9b15:: with SMTP id
 eo21mr1621220ejc.237.1617997592848; 
 Fri, 09 Apr 2021 12:46:32 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 10 Apr 2021 05:46:21 +1000
Message-ID: <CAPM=9tzEK7pEZ54TMCMc0yLto5QhnBjGE0X6X6Ca+N9EAc+U=w@mail.gmail.com>
Subject: [git pull] drm fixes for 5.12-rc7
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

Hey Linus,

Was relatively quiet this week, but still a few pulls came in, pretty
much small fixes across the board, a couple of regression fixes in the
amdgpu/radeon code, msm has a few minor fixes across the board, a
panel regression fix also.

I'm out all next week, so Daniel will do any last minute fixes for the
final release, assuming things stick to schedule. I'll be back for the
merge window but might towards the end of the first week before I get
my MR lined up.

Dave.

drm-fixes-2021-04-10:
drm fixes for 5.12-rc7

amdgpu:
- DCN3 fix
- Fix CAC setting regression for TOPAZ
- Fix ttm regression

radeon:
- Fix ttm regression

msm:
- a5xx/a6xx timestamp fix
- microcode version check
- fail path fix
- block programming fix
- error removal fix.

i915:
- Fix invalid access to ACPI _DSM objects

xen:
- Fix use-after-free in xen.
- minor duplicate definition cleanup

vc4:
- Reduce fifo threshold on hvs4 to fix a fifo full error.
- minor redundant assignment cleanup

panel:
- Disable TE support for Droid4 and N950.
The following changes since commit e49d033bddf5b565044e2abe4241353959bc9120:

  Linux 5.12-rc6 (2021-04-04 14:15:36 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-04-10

for you to fetch changes up to bd119f471299c8692a00b2f5e9bba8e3b81c3466:

  Merge tag 'drm-intel-fixes-2021-04-09' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2021-04-10
05:18:35 +1000)

----------------------------------------------------------------
drm fixes for 5.12-rc7

amdgpu:
- DCN3 fix
- Fix CAC setting regression for TOPAZ
- Fix ttm regression

radeon:
- Fix ttm regression

msm:
- a5xx/a6xx timestamp fix
- microcode version check
- fail path fix
- block programming fix
- error removal fix.

i915:
- Fix invalid access to ACPI _DSM objects

xen:
- Fix use-after-free in xen.
- minor duplicate defintion cleanup

vc4:
- Reduce fifo threshold on hvs4 to fix a fifo full error.
- minor redunantant assignment cleanup

panel:
- Disable TE support for Droid4 and N950.

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/smu7: fix CAC setting on TOPAZ

Dave Airlie (4):
      Merge tag 'amd-drm-fixes-5.12-2021-04-08' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-msm-fixes-2021-04-02' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'drm-misc-fixes-2021-04-09' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2021-04-09' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Dmitry Baryshkov (1):
      drm/msm: a6xx: fix version check for the A650 SQE microcode

Dom Cobley (1):
      drm/vc4: crtc: Reduce PV fifo threshold on hvs4

John Stultz (1):
      drm/msm: Fix removal of valid error case when checking speed_bin

Kalyan Thota (1):
      drm/msm/disp/dpu1: program 3d_merge only if block is attached

Lv Yunlong (1):
      gpu/xen: Fix a use after free in xen_drm_drv_init

Maxime Ripard (1):
      drm/vc4: plane: Remove redundant assignment

Qingqing Zhuo (1):
      drm/amd/display: Add missing mask for DCN3

Rob Clark (1):
      drm/msm: Fix a5xx/a6xx timestamps

Sebastian Reichel (1):
      drm/panel: panel-dsi-cm: disable TE for now

Stephen Boyd (1):
      drm/msm: Set drvdata to NULL when msm_drm_init() fails

Takashi Iwai (1):
      drm/i915: Fix invalid access to ACPI _DSM objects

Wan Jiabing (1):
      drivers: gpu: drm: xen_drm_front_drm_info is declared twice

xinhui pan (2):
      drm/amdgpu: Fix size overflow
      drm/radeon: Fix size overflow

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h  |  1 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |  3 ++-
 drivers/gpu/drm/i915/display/intel_acpi.c          | 22 ++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 18 ++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  4 +++-
 drivers/gpu/drm/msm/msm_drv.c                      |  1 +
 drivers/gpu/drm/panel/panel-dsi-cm.c               | 12 +++++++++---
 drivers/gpu/drm/radeon/radeon_ttm.c                |  4 ++--
 drivers/gpu/drm/vc4/vc4_crtc.c                     | 17 +++++++++++++++++
 drivers/gpu/drm/vc4/vc4_plane.c                    |  1 -
 drivers/gpu/drm/xen/xen_drm_front.c                |  6 ++++--
 drivers/gpu/drm/xen/xen_drm_front_conn.h           |  1 -
 14 files changed, 74 insertions(+), 22 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
