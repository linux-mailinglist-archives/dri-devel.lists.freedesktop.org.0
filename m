Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F061E4DD3BC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 04:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEF910E15F;
	Fri, 18 Mar 2022 03:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D429F10E15F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 03:50:28 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ja24so9251456ejc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 20:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=iq+O3k/FfZ9UjG3SjmgeqRh1gwUPMU+eljMxxt7oEZc=;
 b=lg/VIzE4D9ivFVJ6/5/ProrD5xm9TSTHCbetBabNFK2ZUxvKluPViuE7YIolFCu+cU
 53CnC+s5nvqJJY1bqJPMYjP5qwb7mMHqs5CwKWyJFVTjVbLCEOuxuHGpiiG+9y8hAqW+
 +O+h3D71vvf5RfC0XyuSRrx504uHYHMLJJnwEd0SmYOik8SCTHRSAdsL2/zdhTviZ7GN
 PzxOZO+jEWRx7pYTOyhWTuIuDIYgi4XbKyzopF5Dj6kqO2Alh3vfqgJzAgZGpZkO37rS
 67zOWOUgZCjNxBPuzb7dBjwjqCRUEQrFBB6DFLum8EgP47Ox8R3HEujO0wAmAZbH0vt6
 q+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=iq+O3k/FfZ9UjG3SjmgeqRh1gwUPMU+eljMxxt7oEZc=;
 b=XKBed8nXBFmS+bN6KO904rEXTaHk46vSNsHd1hagik/pAc1WS2WrySihQI/iNh3X5E
 F8qIKH25MRsCdkJfc1b4h1/z2cDorgkAR6JijdtcVHOYgDRqy4EgB9Tz6pIEooVVTBvn
 MlOmYLWU/2dEn+thVbExM5SNlmQCiKZMFH+nrM68zhaxyRNkhQPBMpoZXFFOYV4hemrS
 sNhPIGYBljs1PrQCVJ1H4BM0jmdXFwpGYjiDD5hV9VfsX9FLLY5KCtPFxPviNboOQgJt
 QYNZgNbIKh6RcBfhicAN7ftNu9Q69h4uotztRVznAARUVAgwFq/C2I/sboJSANp+vi3Z
 k10g==
X-Gm-Message-State: AOAM533+UmxnP5MqDbe4QEjptMIE7GUnl9ZgLk7q2W+7cPXmyrvjQsrs
 NKp49Uvuw+HxsHzadz0iWP99QlFW7veFF8XPkrw=
X-Google-Smtp-Source: ABdhPJyzSsgDLUKXejs58647B/wPIb1icHFEKcguhtQ/C8QSl1mJIvEUuxp4YgtZNOQIEiLWhBuMmf7FAshGWQc9/68=
X-Received: by 2002:a17:906:3109:b0:6cc:7a1:8db0 with SMTP id
 9-20020a170906310900b006cc07a18db0mr7303848ejx.266.1647575427207; Thu, 17 Mar
 2022 20:50:27 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 18 Mar 2022 13:50:16 +1000
Message-ID: <CAPM=9twzN9ybw1N=n6JWNQgUd9UNXBxis+PguKagt8DSbW=y6Q@mail.gmail.com>
Subject: [git pull] drm fixes for 5.17-final
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

A few minor changes to finish things off, one mgag200 regression, imx
fix and couple of panel changes.

Regards,
Dave.

drm-fixes-2022-03-18:
drm fixes for 5.17-rc9/final

imx:
- Don't test bus flags in atomic check

mgag200:
- Fix PLL setup on some models

panel:
- Fix bpp settings on Innolux G070Y2-L01
- Fix DRM_PANEL_EDP Kconfig dependencies
The following changes since commit 09688c0166e76ce2fb85e86b9d99be8b0084cdf9:

  Linux 5.17-rc8 (2022-03-13 13:23:37 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-03-18

for you to fetch changes up to ca5a5761ac542691a6b3520b6c5c047cf63b4b8d:

  Merge tag 'drm-misc-fixes-2022-03-17' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2022-03-18
13:32:54 +1000)

----------------------------------------------------------------
drm fixes for 5.17-rc9/final

imx:
- Don't test bus flags in atomic check

mgag200:
- Fix PLL setup on some models

panel:
- Fix bpp settings on Innolux G070Y2-L01
- Fix DRM_PANEL_EDP Kconfig dependencies

----------------------------------------------------------------
Christoph Niedermaier (1):
      drm/imx: parallel-display: Remove bus flags check in
imx_pd_bridge_atomic_check()

Dave Airlie (1):
      Merge tag 'drm-misc-fixes-2022-03-17' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Jocelyn Falempe (1):
      drm/mgag200: Fix PLL setup for g200wb and g200ew

Marek Vasut (1):
      drm/panel: simple: Fix Innolux G070Y2-L01 BPP settings

Thomas Zimmermann (2):
      Merge drm/drm-fixes into drm-misc-fixes
      drm: Don't make DRM_PANEL_BRIDGE dependent on DRM_KMS_HELPERS

 drivers/gpu/drm/bridge/Kconfig         | 2 +-
 drivers/gpu/drm/imx/parallel-display.c | 8 --------
 drivers/gpu/drm/mgag200/mgag200_pll.c  | 6 +++---
 drivers/gpu/drm/panel/Kconfig          | 1 +
 drivers/gpu/drm/panel/panel-simple.c   | 2 +-
 5 files changed, 6 insertions(+), 13 deletions(-)
