Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3129A002A3
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 03:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30CB10E7E2;
	Fri,  3 Jan 2025 02:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iEUYOJbu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B662910E7E2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 02:11:07 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso2204438066b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2025 18:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735870206; x=1736475006; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zJ/N2VX1vBUJM1Gag1g1pBEpr9js0NKOj3fOYZWnWmE=;
 b=iEUYOJbuxnXSTod2O8LmBrEhYu6cEjAErImBnpEgcBLnIAjfeqL5TGpgRDOseYJGqp
 N5UttxFbEdbcoADFTfSm2Gl8XGzITKK5VRAtOWgol+7Hr+Kow++SBJZrxINVKJushBdq
 yrXorVDwZy96md/25btgxt4Sfyv0PndPVNz/6uGeCSLcD+wVKr0dwZM+mbBKcsYwRSRb
 IjVJVt8fgwpMuAHsBrBwdCfj7dlZGvHbS1az0+Wg6TRzbpbe1sTDpvVJUOmyleLfWzdc
 i9yWsbGLSI5hnRgYHxjQWJi0U6qe//I4rwNFXez2LdUKhfBa9SSUHLJZ0k9N50aV1y1J
 DF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735870206; x=1736475006;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zJ/N2VX1vBUJM1Gag1g1pBEpr9js0NKOj3fOYZWnWmE=;
 b=n6cbn0Zldy3k8SoY1oB2j4QiGx3CnjSGaAue0+xzDjAnr2s0KEIaQwNDAv3ue+bAC0
 jSCwar+gU/ySSquJ/k59j+jxWuTNSBq4HbPSL5akhYk8CzDwZwQlt9HMPF+gSB9CkJbc
 u3PErlzzKo0cmuna3AghhVCBfk0CAIagj8R7ajhfT8xzroK7vOqadWIBiTULo4YimZkc
 1/LHv5036tyi5cW+mZ4NTRl2qIPP+jI1YWsmiPzLDsAsRm3xw+yxCA38PO5DbY8ODmeH
 CjY8Ho/H7zNp6bySf1jLVrwZ3MGgEvsZk0hvT/QRG++qYAd44I5HUfBdGM4DpbWG6FMJ
 L+IA==
X-Gm-Message-State: AOJu0YxM4uhBcYeiU9PnZXbdWtfBDifAzoDWMnccY23zg9+iWXARNF6r
 cVYtsjy2qusgku6gJn2N/k8OX6EX7HBVd1SWEgKz4sRpG/RdLmJtj0plXAW+ZLCRtBET1t8STbc
 47ZSrGk/aZwrAgmqHDP0aEFoRTyTZNP6y
X-Gm-Gg: ASbGncs02mRCLxr2lft4w7W2Yis1IAi0sYwaKW3bltujZ0ISm3qcUJoata2gZ+rhY30
 HxUYJjK0izlany5aRGVisZPJ+psdMLYrNs5Wa
X-Google-Smtp-Source: AGHT+IERscxui+6Gz92mI96CladkHiaNK2JDxuhPuWzZQEnDQRsSRavfj9WcZ5mcj7wV1oubcZRQl969oDJtfsjcxEw=
X-Received: by 2002:a17:907:1c0b:b0:aa6:7933:8b31 with SMTP id
 a640c23a62f3a-aac3352cef9mr4095532766b.46.1735870205951; Thu, 02 Jan 2025
 18:10:05 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 3 Jan 2025 12:09:54 +1000
Message-ID: <CAPM=9txCCxGcVViTTntsp+9tp-gBLTh3znhVJgc+DD9hsz+bGQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.13-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
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

Happy New Year, It was fairly quiet for holidays period, certainly
nothing that worth getting off the couch before I needed to, this is
for the past two weeks, i915, xe and some adv7511, I expect we will
see some amdgpu etc happening next week, but otherwise all quiet.

Regards,
Dave.

drm-fixes-2025-01-03:
drm fixes for 6.13-rc6

i915:
- Fix C10 pll programming sequence [cx0_phy]
- Fix power gate sequence. [dg1]

xe:
- uapi: Revert some devcoredump file format changes
  breaking a mesa debug tool
- Fixes around waits when moving to system
- Fix a typo when checking for LMEM provisioning
- Fix a fault on fd close after unbind
- A couple of OA fixes squashed for stable backporting

adv7511:
- fix UAF
- drop single lane support
- audio infoframe fix
The following changes since commit fc033cf25e612e840e545f8d5ad2edd6ba613ed5:

  Linux 6.13-rc5 (2024-12-29 13:15:45 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-01-03

for you to fetch changes up to 273b3eb600713a5e71c64b8b403b355dc580f167:

  Merge tag 'drm-xe-fixes-2025-01-02' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-01-03 10:57:31 +1000)

----------------------------------------------------------------
drm fixes for 6.13-rc6

i915:
- Fix C10 pll programming sequence [cx0_phy]
- Fix power gate sequence. [dg1]

xe:
- uapi: Revert some devcoredump file format changes
  breaking a mesa debug tool
- Fixes around waits when moving to system
- Fix a typo when checking for LMEM provisioning
- Fix a fault on fd close after unbind
- A couple of OA fixes squashed for stable backporting

adv7511:
- fix UAF
- drop single lane support
- audio infoframe fix

----------------------------------------------------------------
Biju Das (3):
      drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
      dt-bindings: display: adi,adv7533: Drop single lane support
      drm: adv7511: Drop dsi single lane support

Dave Airlie (4):
      Merge tag 'drm-xe-fixes-2024-12-23' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2024-12-25' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2025-01-02' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-01-02' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

John Harrison (1):
      drm/xe: Revert some changes that break a mesa debug tool

Lucas De Marchi (1):
      drm/xe: Fix fault on fd close after unbind

Michal Wajdeczko (1):
      drm/xe/pf: Use correct function to check LMEM provisioning

Nirmoy Das (2):
      drm/xe: Use non-interruptible wait when moving BO to system
      drm/xe: Wait for migration job before unmapping pages

Rodrigo Vivi (1):
      drm/i915/dg1: Fix power gate sequence.

Stefan Ekenberg (1):
      drm/bridge: adv7511_audio: Update Audio InfoFrame properly

Suraj Kandpal (1):
      drm/i915/cx0_phy: Fix C10 pll programming sequence

Umesh Nerlige Ramappa (1):
      xe/oa: Fix query mode of operation for OAR/OAC

 .../bindings/display/bridge/adi,adv7533.yaml       |   2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |  14 ++-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  10 +-
 drivers/gpu/drm/bridge/adv7511/adv7533.c           |   4 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  12 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |   2 +-
 drivers/gpu/drm/xe/xe_bo.c                         |  12 +-
 drivers/gpu/drm/xe/xe_devcoredump.c                |  15 ++-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |   9 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |   2 +-
 drivers/gpu/drm/xe/xe_oa.c                         | 134 +++++++--------------
 drivers/gpu/drm/xe/xe_ring_ops.c                   |   5 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h            |   2 +
 13 files changed, 112 insertions(+), 111 deletions(-)
