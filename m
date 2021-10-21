Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA23436BC7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 22:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0576E491;
	Thu, 21 Oct 2021 20:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E646E4B6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 20:08:33 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z20so68634edc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 13:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=MDqUpbVsNviKYhdyjMdLAGXgGjoSgVSfH4fiu5hfdr4=;
 b=LFEUapAo6IwWyTdh+DKxPkDife2XnFI/gRQOEkR3vftOBsruU+ey/SO9G/JUkKVsvK
 N5Z3ANLcw27ePYAkePSlg6gtzHxN8fcEbhnBnX4Us50D38CfwUO3qavpWBtfFtgwR93Z
 lyjYRaqKRkl/FnvHGVHPMswB5zX2rdELj38Q7AkPxrgLalYD/OkwHR9AWshFbR3B8Bg3
 0SOrbOdjDcX0ss15WnHcKEqNAxEW/lE9LNk/eqkrQr6bpB4BdYA5lenBJBudwZoYm0VE
 JlD1bl7AhLMS0ff1UaLvreZFZuly5uEwk3oIcDLL/jsfYl7KA/OspiPBAlcScOkTjZWW
 kqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=MDqUpbVsNviKYhdyjMdLAGXgGjoSgVSfH4fiu5hfdr4=;
 b=g3xfffUpL+5MHt+dAca5htFXrYpvaOvEqx3eh82OiJRK0kD8uJ1ZrzciGWta1cm5c2
 kdZb/Fn1+xI0BhMwGKLDh/iMG3mY8tHfSWYfJ3b4saAOTFx3qKlZ3Wn2s5xfVT6ga7yV
 /frhi0rw6UAvLBnr6tfBjHd2w26PHBbEcw8j4+9Iqn9BDWmj/oX0sXn+gYA6fpUkSH7J
 Y8eUXvOcLmd1dhC2bgDmkKF7FRIs9xjzg0R1zBphY+uRPIrxFo8YTG/gRLyYE0z79Nv2
 Z8IsLDLOQJm5lvEucWcLAZRfDPBhUKcfv8La/tx66fuSm8dA7jPcNewM6pN+THdMm31c
 SVkQ==
X-Gm-Message-State: AOAM531d9d6JpgK5Z2lylW33JmlYByuDoJ2yG4AcNWbUFYYuwNcJqdjf
 p+5h1ZdNCQhpZ/mWUL9cn9eKWBO9NbwVpDZtqYN/RzIrw+6MJQ==
X-Google-Smtp-Source: ABdhPJxN7Nh1YekIv0OrV1MCQmSwGGTQnwRNlkKCDE0GB7Uaknrka26ZhPkZvVq+ODfvuGABfI47+8Ldj/hcWmyZIx8=
X-Received: by 2002:a05:6402:5c9:: with SMTP id
 n9mr10411503edx.90.1634846911658; 
 Thu, 21 Oct 2021 13:08:31 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 22 Oct 2021 06:08:20 +1000
Message-ID: <CAPM=9tzoEc2rNg9tObnmTnqhg_BEcKQiqgAgqAQOphJa1M760g@mail.gmail.com>
Subject: [git pull] drm fixes for 5.15-rc7
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

Nothing too crazy at the end of the cycle, the kmb modesetting fixes
are probably a bit large but it's not a major driver, and its fixing
monitor doesn't turn on type problems. Otherwise it's just a few minor
patches, one ast regression revert, an msm power stability fix.

Dave.

drm-fixes-2021-10-22:
drm fixes for v5.15-rc7

ast:
- fix regression with connector detect

msm:
- fix power stability issue

msxfb:
- fix crash on unload

panel:
- sync fix

kmb:
- modesetting fixes
The following changes since commit 519d81956ee277b4419c723adfb154603c2565ba:

  Linux 5.15-rc6 (2021-10-17 20:00:13 -1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-10-22

for you to fetch changes up to 595cb5e0b832a3e100cbbdefef797b0c27bf725a:

  Revert "drm/ast: Add detect function support" (2021-10-22 05:52:12 +1000)

----------------------------------------------------------------
drm fixes for v5.15-rc7

ast:
- fix regression with connector detect

msm:
- fix power stability issue

msxfb:
- fix crash on unload

panel:
- sync fix

kmb:
- modesetting fixes

----------------------------------------------------------------
Anitha Chrisanthus (4):
      drm/kmb: Work around for higher system clock
      drm/kmb: Limit supported mode to 1080p
      drm/kmb: Corrected typo in handle_lcd_irq
      drm/kmb: Enable ADV bridge after modeset

Dan Johansen (1):
      drm/panel: ilitek-ili9881c: Fix sync for Feixin K101-IM2BYL02 panel

Dave Airlie (2):
      Merge tag 'drm-msm-fixes-2021-10-18' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'drm-misc-fixes-2021-10-21-1' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Edmund Dea (2):
      drm/kmb: Remove clearing DPHY regs
      drm/kmb: Disable change of plane parameters

Kim Phillips (1):
      Revert "drm/ast: Add detect function support"

Marek Vasut (1):
      drm: mxsfb: Fix NULL pointer dereference crash on unload

Rob Clark (1):
      drm/msm/devfreq: Restrict idle clamping to a618 for now

 drivers/gpu/drm/ast/ast_mode.c                | 18 +----------
 drivers/gpu/drm/kmb/kmb_crtc.c                | 41 +++++++++++++++++++++++--
 drivers/gpu/drm/kmb/kmb_drv.c                 |  2 +-
 drivers/gpu/drm/kmb/kmb_drv.h                 | 10 ++++++-
 drivers/gpu/drm/kmb/kmb_dsi.c                 | 25 +++++++++-------
 drivers/gpu/drm/kmb/kmb_dsi.h                 |  2 +-
 drivers/gpu/drm/kmb/kmb_plane.c               | 43 ++++++++++++++++++++++++++-
 drivers/gpu/drm/kmb/kmb_plane.h               |  6 ++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  7 +++++
 drivers/gpu/drm/msm/msm_gpu.h                 |  4 +++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c         |  3 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  6 +++-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 12 ++++----
 13 files changed, 137 insertions(+), 42 deletions(-)
