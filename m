Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C5C6EFF04
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 03:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A3910E102;
	Thu, 27 Apr 2023 01:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6654A10E102
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 01:43:33 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-94ed7e49541so1226532566b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 18:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682559810; x=1685151810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TLWZrM6G4E8kyAJ3+hqX8NPwV4Y3xpLTC/w/EM11mYI=;
 b=PJQiXtBkhSZjq404pH2L5nHxMU/QJEmILV0rBc0uWQuEX/GZtcH58vHc7uzQbb+jpz
 fblEUhBhdAdu6zHxhPwKTwHHwuA3m4mkN3Xz1T7Wzhc/eu9Tzi3TtQ72Zlr5GRI8oXjw
 C438pR63pQr3HQMfR2MbA6GiI6gPYaaFoenbwMPSk7X8gRv0WX4vSEORCmnoDEubwAxz
 a41w5GB95N0ooQR/g+PiLDTkMicsmyxxM6ddmrtwJ0FGmD/oaOgElOjwEjuqF7QmyGFX
 Uc9vS50wwK/JaMnmgAvrdyv9V7vyy+mc5ngjAVhXG7uNRzVisVmM2crM0dN+62EuGzkr
 Nvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682559810; x=1685151810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TLWZrM6G4E8kyAJ3+hqX8NPwV4Y3xpLTC/w/EM11mYI=;
 b=Y/YwOnAchE2udrtfi1sT4tEItuwwt0aeMmoxGFNDBX3GyrXszvXp7mP3cYVvrFhrkm
 NA6TY0VqO+m3IdNDgfughHYb/ht45whSuYNmr0wnGr9J1lykItFHms6Ag/2A5um1Ionl
 Vba9FiCvfiCA2BfhnBqrtq/buLHI9nQ+hlROp2IWtfn6pmZSZBdIYuHU05owpbL6mrLX
 +1w7q6s+BLch/H0UvwTRHJFqwEUPzoNjcHAhdN7CdkRijEMw8HNfYhQFE59FWJtU14UA
 OCNxY+QA2IogzB5DVCJWK8n/y5oE6c2biSG5zPrcHyDQ7yoQv1waDJJxnr/drdNbFq0F
 ISHQ==
X-Gm-Message-State: AC+VfDzFOvOnyQxVLB81XiP5e0CdxTeWTPAgFk64Mp5Wd9k6F8PDtair
 iqgOR9WXAIE0ahBBSXQl/h1gPDpZmezNwofp7z4=
X-Google-Smtp-Source: ACHHUZ4DbuKsaZlJwyNtmw3hFB9SA23R5V7wmj7FOeBjSn9C9jyPXXToChmHTrrxjqwCTmipfDvYt7b42di4zffByGA=
X-Received: by 2002:a17:906:eec8:b0:953:8322:a99f with SMTP id
 wu8-20020a170906eec800b009538322a99fmr67601ejb.0.1682559809797; Wed, 26 Apr
 2023 18:43:29 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 27 Apr 2023 11:43:17 +1000
Message-ID: <CAPM=9tw2xUZQJkzmt5aj=F8erC3cv9aAB+KqTQgn7=B7D8haFA@mail.gmail.com>
Subject: [git pull] drm next fixes for 6.4-rc1
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

A bit out of routine fixes pull for rc1, there's a build breakage on
some platforms due to ttm, this has that fix + qaic uapi removal +
minor panel fixes.

Dave.
drm-next-2023-04-27:
drm-next fixes for 6.4-rc1

ttm:
- Fix TTM build on archs where PMD_SHIFT is not constant.

qaic:
- Revert uAPI from accel/qaic.

panel:
- Improve error handling in nt35950.
- Fix double unregister in otm8009a when removing the driver.
The following changes since commit 289af45508ca890585f329376d16e08f41f75bd5=
:

  Merge tag 'exynos-drm-next-for-v6.4-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next (2023-04-24 10:50:15 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2023-04-27

for you to fetch changes up to cf03e2956af307dc25e8c41fd4cffe44482a6ec1:

  Merge tag 'drm-misc-next-fixes-2023-04-26' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next (2023-04-27
11:29:34 +1000)

----------------------------------------------------------------
drm-next fixes for 6.4-rc1

ttm:
- Fix TTM build on archs where PMD_SHIFT is not constant.

qaic:
- Revert uAPI from accel/qaic.

panel:
- Improve error handling in nt35950.
- Fix double unregister in otm8009a when removing the driver.

----------------------------------------------------------------
Christian K=C3=B6nig (1):
      drm/ttm: revert "Reduce the number of used allocation orders for
TTM pages"

Dave Airlie (1):
      Merge tag 'drm-misc-next-fixes-2023-04-26' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next

James Cowgill (1):
      drm/panel: otm8009a: Set backlight parent to panel device

Jeffrey Hugo (1):
      Revert "accel/qaic: Add mhi_qaic_cntl"

Konrad Dybcio (2):
      drm/panel: novatek-nt35950: Improve error handling
      drm/panel: novatek-nt35950: Only unregister DSI1 if it exists

 drivers/accel/qaic/Makefile                      |   1 -
 drivers/accel/qaic/mhi_qaic_ctrl.c               | 569 -------------------=
----
 drivers/accel/qaic/mhi_qaic_ctrl.h               |  12 -
 drivers/accel/qaic/qaic_drv.c                    |  10 -
 drivers/gpu/drm/panel/panel-novatek-nt35950.c    |  10 +-
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c |   2 +-
 drivers/gpu/drm/ttm/ttm_pool.c                   |  30 +-
 7 files changed, 21 insertions(+), 613 deletions(-)
 delete mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.c
 delete mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.h
