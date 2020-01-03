Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDB112F4C6
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 07:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721826E18E;
	Fri,  3 Jan 2020 06:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53526E18E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 06:57:51 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id b15so31318465lfc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2020 22:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=cI5dJ5uXWY3xWZKUs3Uuw1PY+H/R9kRSLoYee4iD0CA=;
 b=UTv3levrXIbAc8/TmHr64J63WvrchvvnUspsP0fTM9g7Qt+9/1xcHCjL/M8000dkoa
 1aDaEDm6QZ+QTZv7v+lxCEPZCGIHJVJdNkAYGzAaq8cknzX62Vhum0QQsZFGdofPnrk2
 OPVbhN7IFqFgrYHkSc9lpVPo2Z4VUFAskr9jHgaO7TaFC/nZ8ErgGFA3Y4rDU1VdnO+P
 cBVlvluMAiDK2NyRlGbuePygzf2m1qm/SBivylaHgPu+jMNE/8NSUEjFQYIjrAaAspiV
 n+iIl6Ppns+Fvsccx1yy6yj+xDtd62yr+9s84EMLlOSZ1AHJ9DisEav1hLFz7q0W81sU
 JLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=cI5dJ5uXWY3xWZKUs3Uuw1PY+H/R9kRSLoYee4iD0CA=;
 b=Py3lO3wHWEqNeqMbygONqNh9oP3qZ7IbGWoDMs6R5VhWZ8rRGfAsHoJdjMOmPixfh1
 VPxijVIQz/PDAvEeroYVwCuf157ek4utKy+898aey27zGclMhYgUYRux9UmCS4f05Avn
 zOSSryORPM2+knPJfzq1Z2uI3bCjNMfS01ywT++EOLuQxqwNzuDyg8tWlVSeoZVO0ATO
 VL6sRI2tnRXnR/4XkSGNN4JYi0GLXXSifyFZSU/xfG5P6wJRMTx97Ovdrv9RBETUiQih
 PDnHqUFA6+V1VbrMq2fBLBg7xeLemsnAXM1a4rfopgpYJn4AZMfKNvetV/OOEkD/WGIf
 bM0w==
X-Gm-Message-State: APjAAAXhbtA5twgFzssk2KRaCqDpK1ZxPFt+T+Wgr6wfJKK2yU3ZoqPT
 j6iu5JdOGHcwhbOeDrOYhLL0F4/9tcq8vEXNd0Q=
X-Google-Smtp-Source: APXvYqzjCIUYUsR5o17WTHsEmmfTw5WkUqsWP/dnDkeb7hw35ENaG7dNVEir1uySAHb8khcwPQWO15buVSi1oNXU51E=
X-Received: by 2002:ac2:5975:: with SMTP id h21mr48175706lfp.165.1578034669925; 
 Thu, 02 Jan 2020 22:57:49 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 3 Jan 2020 16:57:38 +1000
Message-ID: <CAPM=9twLL0KL7zS4hwH=TgcuwVqJCpvUB276+GzkhQaa_B2vHg@mail.gmail.com>
Subject: [git pull] drm fixes for 5.5-rc5
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

New Years fixes! Mostly amdgpu with a light smattering of arm
graphics, and two AGP warning fixes.

Quiet as expected, hopefully we don't get a post holiday rush.

Dave.

drm-fixes-2020-01-03:
drm fixes for 5.5-rc5

agp:
- two unused variable removed

amdgpu:
- ATPX regression fix
- SMU metrics table locking fixes
- gfxoff fix for raven
- RLC firmware loading stability fix

mediatek:
- external display fix
- dsi timing fix

sun4i:
- Fix double-free in connector/encoder cleanup (Stefan)

maildp:
- Make vtable static (Ben)
The following changes since commit fd6988496e79a6a4bdb514a4655d2920209eb85d:

  Linux 5.5-rc4 (2019-12-29 15:29:16 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-01-03

for you to fetch changes up to a6204fc7b83cbe3398f61cf1742b09f66f0ae220:

  agp: remove unused variable arqsz in agp_3_5_enable() (2020-01-03
16:08:05 +1000)

----------------------------------------------------------------
drm fixes for 5.5-rc5

agp:
- two unused variable removed

amdgpu:
- ATPX regression fix
- SMU metrics table locking fixes
- gfxoff fix for raven
- RLC firmware loading stability fix

mediatek:
- external display fix
- dsi timing fix

sun4i:
- Fix double-free in connector/encoder cleanup (Stefan)

maildp:
- Make vtable static (Ben)

----------------------------------------------------------------
Alex Deucher (5):
      Revert "drm/amdgpu: simplify ATPX detection"
      drm/amdgpu/smu: add metrics table lock
      drm/amdgpu/smu: add metrics table lock for arcturus (v2)
      drm/amdgpu/smu: add metrics table lock for navi (v2)
      drm/amdgpu/smu: add metrics table lock for vega20 (v2)

Ben Dooks (Codethink) (1):
      drm/arm/mali: make malidp_mw_connector_helper_funcs static

Dave Airlie (3):
      Merge tag 'mediatek-drm-fixes-5.5' of
https://github.com/ckhu-mediatek/linux.git-tags into drm-fixes
      Merge tag 'drm-misc-fixes-2019-12-31' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'amd-drm-fixes-5.5-2020-01-01' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes

Evan Quan (1):
      drm/amdgpu: correct RLC firmwares loading sequence

Jitao Shi (1):
      drm/mediatek: reduce the hbp and hfp for phy timing

Pi-Hsun Shih (1):
      drm/mediatek: Check return value of mtk_drm_ddp_comp_for_plane.

Stefan Mavrodiev (1):
      drm/sun4i: hdmi: Remove duplicate cleanup calls

Yongqiang Niu (1):
      drm/mediatek: Fix can't get component for external display plane.

Yunfeng Ye (2):
      agp: remove unused variable mcapndx
      agp: remove unused variable arqsz in agp_3_5_enable()

changzhu (1):
      drm/amdgpu: enable gfxoff for raven1 refresh

 drivers/char/agp/isoch.c                         |  9 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c | 12 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h        |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c            | 15 ++----
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c       |  1 +
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c     |  3 ++
 drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h   |  1 +
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c       |  3 ++
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c       |  3 ++
 drivers/gpu/drm/arm/malidp_mw.c                  |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c          | 18 ++++---
 drivers/gpu/drm/mediatek/mtk_dsi.c               | 67 ++++++++++++++----------
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c           |  2 -
 14 files changed, 80 insertions(+), 60 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
