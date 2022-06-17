Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C559854F004
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 06:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14D110E3A7;
	Fri, 17 Jun 2022 04:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C9D10E3A7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 04:13:54 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id gl15so6445062ejb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 21:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=MjbVE20S3qu8gYoRUcT9DaTHPrRc+KU19/yYOvnNiNw=;
 b=jCHMvuN/ftN05EQta/ACsyjK5DBeZbWH7sqdlr5GgBZ4E68PuT3q6D9BIgy2C5xLiA
 Z5cHbbz0xLVuPuuK80hp5/Uy7yNtk3owcx31Kpyw+8wvs1o1AnFq/UzBeYvSzu8Lirfx
 JstvYW0pulf1imRJEVXQAlAwT5RooNnVNJucHV3LEQ7ZU0SYNhvJEfGuNcra7g+ar6fa
 Wo28f2s1/osmb0Towsnt0nmTnyeX3uAy5EkWw7qUEHr9STXeSIhUCWXwOnmdZAW1U4f/
 p3cpG4SeEwxC8hnp990ZczXKO1Vs7fv3SRpFrcVtAToL181MQlQCFY2vL+7x7KTSD5Z+
 rEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=MjbVE20S3qu8gYoRUcT9DaTHPrRc+KU19/yYOvnNiNw=;
 b=A0yxrozvW/1RYTywVf3i3pbm5NJiMpLICcBPbm9db1To/f3Z8rH03wrcn8ucF264ZS
 90zLPmKsURl/k91fym/D7dxh9HHI9cNXa7TW/Vgp2o2n3u7Q/VMwNrpnbfRjUx3g776L
 XKr6Lht0LEcykUuDU4rg7SuEZyt/kmySmO2k5rNptvlAlyqkWeEuWfNFbGpEjfyerw36
 4N9SOS94a8K4i5XTEsmr8LCfCFeb2f0iEgFVpEYSTlXOlgsZq7XtbWi0bdC3znGiUrI6
 YBG63qTHi7c7biwyn8pRUCdWd4sqSn5mPhWq1/OEjc9w2lDiBUUeAeQAlTic5yMb2+FC
 r/3Q==
X-Gm-Message-State: AJIora8MoKmxy1cdeAB72AcCCj6vAy4spvLtak3ZzR/DFsgiH7fbOxVW
 eGx4pMX1Eks4YKtIR7hq9wF5/oYzVStC25WHVsI=
X-Google-Smtp-Source: AGRyM1tK6PF/PK/vLjlN9Eud6B6YF77e91UMiWvQZYlQS+8pE3oEqsVt/e3BdltY/BtSHFuS5MlGqdb+aBQ/Dvq7aak=
X-Received: by 2002:a17:906:149:b0:712:502:bc62 with SMTP id
 9-20020a170906014900b007120502bc62mr7490981ejh.720.1655439233122; Thu, 16 Jun
 2022 21:13:53 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 17 Jun 2022 14:13:41 +1000
Message-ID: <CAPM=9twTA=AXfjj=eq558KLmE_TfmkoRsm6Sm5MUB0zCZ174Wg@mail.gmail.com>
Subject: [git pull] drm fixes for 5.19-rc3
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

Regular drm fixes for rc3. Nothing too serious, i915, amdgpu and
exynos all have a few small driver fixes, and two ttm fixes, and one
compiler warning.

Dave.

drm-fixes-2022-06-17:
drm fixes for 5.19-rc3

atomic:
- fix spurious compiler warning

ttm:
- add NULL ptr check in swapout code
- fix bulk move handling

i915:
- Fix page fault on error state read
- Fix memory leaks in per-gt sysfs
- Fix multiple fence handling
- Remove accidental static from a local variable

amdgpu:
- Fix regression in GTT size reporting
- OLED backlight fix

exynos:
- Check a null pointer instead of IS_ERR().
- Rework initialization code of Exynos MIC driver.
The following changes since commit b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3=
:

  Linux 5.19-rc2 (2022-06-12 16:11:37 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-06-17

for you to fetch changes up to 65cf7c02cfc7c36a3e86f3da5818dabc32c270ff:

  Merge tag 'exynos-drm-fixes-v5.19-rc3' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-fixes (2022-06-17 11:32:35 +1000)

----------------------------------------------------------------
drm fixes for 5.19-rc3

atomic:
- fix spurious compiler warning

ttm:
- add NULL ptr check in swapout code
- fix bulk move handling

i915:
- Fix page fault on error state read
- Fix memory leaks in per-gt sysfs
- Fix multiple fence handling
- Remove accidental static from a local variable

amdgpu:
- Fix regression in GTT size reporting
- OLED backlight fix

exynos:
- Check a null pointer instead of IS_ERR().
- Rework initialization code of Exynos MIC driver.

----------------------------------------------------------------
Alan Previn (1):
      drm/i915/reset: Fix error_state_read ptr + offset use

Ashutosh Dixit (1):
      drm/i915/gt: Fix memory leaks in per-gt sysfs

Christian K=C3=B6nig (2):
      drm/ttm: fix missing NULL check in ttm_device_swapout
      drm/ttm: fix bulk move handling v2

Dan Carpenter (1):
      drm/exynos: fix IS_ERR() vs NULL check in probe

Dave Airlie (4):
      Merge tag 'drm-misc-fixes-2022-06-16' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2022-06-16' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.19-2022-06-15' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'exynos-drm-fixes-v5.19-rc3' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-fixes

GONG, Ruiqi (1):
      drm/atomic: fix warning of unused variable

Jani Nikula (1):
      drm/i915/uc: remove accidental static from a local variable

Marek Szyprowski (1):
      drm/exynos: mic: Rework initialization

Michel D=C3=A4nzer (1):
      drm/amdgpu: Fix GTT size reporting in amdgpu_ioctl

Nirmoy Das (1):
      drm/i915: Individualize fences before adding to dma_resv obj

Roman Li (1):
      drm/amd/display: Cap OLED brightness per max frame-average luminance

 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c           |  2 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++--
 drivers/gpu/drm/exynos/exynos_drm_drv.c           |  6 +--
 drivers/gpu/drm/exynos/exynos_drm_mic.c           | 42 ++++++------------
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c    |  3 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c          | 29 ++++++-------
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h          |  6 +--
 drivers/gpu/drm/i915/gt/intel_gt_types.h          |  3 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c          |  2 +-
 drivers/gpu/drm/i915/i915_sysfs.c                 | 17 ++++++--
 drivers/gpu/drm/i915/i915_vma.c                   | 48 ++++++++++++-------=
--
 drivers/gpu/drm/ttm/ttm_bo.c                      | 22 ++++++----
 drivers/gpu/drm/ttm/ttm_device.c                  |  6 ++-
 drivers/gpu/drm/ttm/ttm_resource.c                | 52 ++++++++++++++++---=
----
 include/drm/drm_atomic.h                          |  1 +
 include/drm/ttm/ttm_resource.h                    |  8 ++--
 17 files changed, 141 insertions(+), 115 deletions(-)
