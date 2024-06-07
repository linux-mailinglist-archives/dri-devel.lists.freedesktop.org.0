Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2D18FF9DF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 04:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C54410E284;
	Fri,  7 Jun 2024 02:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LVBGrqvl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C2710E284
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 02:06:03 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52b950aa47bso2408422e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2024 19:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717725961; x=1718330761; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QmdigPbiZh7u73WyQrLPcTJkkfoD9rCWbKcRqUVrOeI=;
 b=LVBGrqvlss1V+CYhqWl34M/+NXGSFTxoRba9sfwzTiedt1oFpw05+ZCa8EGHFFM5W5
 1dwWVjzYs8O4d8VDzzQzJTVCAguik9XLdV/A4TqyJ3tXi311PlfpAwfatFNdf0ODUkCj
 IgsO/JSEGlipBQ3+ypY7bZdJQEaO7Ff62nQ5r6BdY/gffzcNArIX5n4I4vax09zyRhbo
 mj2mK85yA72P+c1PnVtPJkjkA1bveJnFY6+vbnEKxKvDC0sNqojbus25aSI9HPFbtyWW
 NrS2kmpMReLn9l0c1zxrsZCU7ur6fQxJmEtmqxDzBtWBSi7vZbuFVi8WUhTe+ZQOLOQW
 G4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717725961; x=1718330761;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QmdigPbiZh7u73WyQrLPcTJkkfoD9rCWbKcRqUVrOeI=;
 b=E+lqr9DM4k5iBIvbIhxD8qyik6iF0Xr5LqyZVEvBiQPOWkbn+nsb3p0zGHJqAvRLhA
 UB+MjkfsSMMthQY3KupMKyjNwTM7Z62A/XQU+GqhswY3lIRCOByNXKpPqlmcuyZITfuy
 dAGcOk1O5cNlnOkmmN0qMW+uaWIjTAnYoRAlT7RJjIAOTmkSBlveqaqshS/f07ARdNP3
 giqqMAH1VMn+rJPUZ9eu9h/YD1hDxwjL0L47TnvOlv4Qyw9NO7YgMVa4FrFxeC6UmJPy
 iFMqrypP7ySRReg1Rvyc0UR9gT4A/MCnTj5mnLvK5AopLRwyCV8VUC3e/4lC28NrATLF
 oDDw==
X-Gm-Message-State: AOJu0YzF+BpIzi1JjRgBH1GXNeEuZm2HEWBJfA3BjC2TRo1IIJURupc5
 S36FGdxXzo8fyczVguE+qLfrcyLss0YD0MXMvIZovSZSn6UG9dbypO2qZxi48J5COt4B72IvzAA
 XOWpZfsB3vC7ZnSYqUzlYco6CPek=
X-Google-Smtp-Source: AGHT+IFQlGkIbJhF9IM0XawMYHjSy8OtNnb4ijLh5dvdjX1Odn7hgcWDHLCBTdhu8/9XzpTX36XSKzRXzES+6SGR3qY=
X-Received: by 2002:a05:6512:3e14:b0:52b:bb10:6c19 with SMTP id
 2adb3069b0e04-52bbb106d7cmr554972e87.23.1717725960650; Thu, 06 Jun 2024
 19:06:00 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 7 Jun 2024 12:05:49 +1000
Message-ID: <CAPM=9tyvjs75_Op_yXD=vD_ZLQwZRzio0=_oM=vGkeOkaGW=TA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.10-rc3
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

Hi Linus,

Weekly fixes, vmwgfx leads the way this week, with minor changes in xe
and amdgpu and a couple of other small fixes.

Seems quiet enough.

Dave.

drm-fixes-2024-06-07:
drm fixes for 6.10-rc3

xe:
- Update the LMTT when freeing VF GT config

amdgpu:
- Fix shutdown issues on some SMU 13.x platforms
- Silence some UBSAN flexible array warnings

panel:
- sitronix-st7789v: handle of_drm_get_panel_orientation
  failing error.

vmwgfx:
- filter modes greater than available graphics memory
- fix 3D vs STDU enable
- remove STDU logic from mode valid
- logging fix
- memcmp pointers fix
- remove unused struct
- screen target lifetime fix

komeda:
- unused struct removal
The following changes since commit c3f38fa61af77b49866b006939479069cd451173:

  Linux 6.10-rc2 (2024-06-02 15:44:56 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-06-07

for you to fetch changes up to eb55943aab89be99a26e34fc2175ebb3583a2778:

  Merge tag 'drm-misc-next-fixes-2024-06-07' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
(2024-06-07 08:40:58 +1000)

----------------------------------------------------------------
drm fixes for 6.10-rc3

xe:
- Update the LMTT when freeing VF GT config

amdgpu:
- Fix shutdown issues on some SMU 13.x platforms
- Silence some UBSAN flexible array warnings

panel:
- sitronix-st7789v: handle of_drm_get_panel_orientation
  failing error.

vmwgfx:
- filter modes greater than available graphics memory
- fix 3D vs STDU enable
- remove STDU logic from mode valid
- logging fix
- memcmp pointers fix
- remove unused struct
- screen target lifetime fix

komeda:
- unused struct removal

----------------------------------------------------------------
Chen Ni (1):
      drm/panel: sitronix-st7789v: Add check for of_drm_get_panel_orientation

Dave Airlie (4):
      Merge tag 'drm-xe-fixes-2024-06-04' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.10-2024-06-06' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2024-06-07' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-misc-next-fixes-2024-06-07' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

Dr. David Alan Gilbert (2):
      drm/komeda: remove unused struct 'gamma_curve_segment'
      drm/vmwgfx: remove unused struct 'vmw_stdu_dma'

Ian Forbes (6):
      drm/vmwgfx: Filter modes which exceed graphics memory
      drm/vmwgfx: 3D disabled should not effect STDU memory limits
      drm/vmwgfx: Remove STDU logic from generic mode_valid function
      drm/vmwgfx: Standardize use of kibibytes when logging
      drm/vmwgfx: Don't destroy Screen Target when CRTC is enabled but inactive
      drm/vmwgfx: Don't memcmp equivalent pointers

Mario Limonciello (1):
      drm/amd: Fix shutdown (again) on some SMU v13.0.4/11 platforms

Michal Wajdeczko (1):
      drm/xe/pf: Update the LMTT when freeing VF GT config

Tasos Sahanidis (1):
      drm/amdgpu/pptable: Fix UBSAN array-index-out-of-bounds

 drivers/gpu/drm/amd/include/pptable.h              | 91 ++++++++++++----------
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   | 20 ++---
 .../gpu/drm/arm/display/komeda/komeda_color_mgmt.c |  5 --
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c     |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                | 19 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |  3 -
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                | 28 +++----
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               | 60 ++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |  1 +
 10 files changed, 135 insertions(+), 100 deletions(-)
