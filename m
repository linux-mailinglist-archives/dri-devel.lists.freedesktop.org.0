Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDB9A9D60B
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 01:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456FF10E00D;
	Fri, 25 Apr 2025 23:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y0H9hiDN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EB510E00D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 23:12:24 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-ac3fcf5ab0dso440086266b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 16:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745622743; x=1746227543; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tmqGkrT8pKgcGDCBKcXPdyFIvAScDuIz/sDPPptlagc=;
 b=Y0H9hiDNl0ywNkx8lilZLb8P+NeCYc+kyScwg68mkyvPqoNjZetduSttRUMD++8fm6
 KqEVajOt8iVmBGg7KscTYNhEIKyYNDY/HeWoGI5Cuff8P+3gUkrU/wV3Tz3kK07C8tU8
 ziOqKlvZMxpObq6HhlNRjT5YFS6ArtABDDeJ3Gr7ybPkKsaxyq9pKeG6ysYpU/PhfuQ7
 7tsAzJxP/uiXAME7eByrB8BDEFQ6+qxwGRSwkDIznEfNntt/EQrTZUDrHskSi/GMyRda
 tR6DsYHaDDbA3EZtPD+HxsWRLNoa1oYkwbVlcZg2QUFF2mVwrpgoK7zkQd4VKG6g2cNo
 eMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745622743; x=1746227543;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tmqGkrT8pKgcGDCBKcXPdyFIvAScDuIz/sDPPptlagc=;
 b=ETPfuexGvqEDgZ2DwS8wSV7Po2vlu6/pn5UVGhcnUlzUydVjDpe0A0JNUWsxg/kRCE
 rtDMkouguIVwGbZ9oXwrBtv+aH3NwGtNEKxxHYud8y+qp+bGSiWkwe5xBShW4QKreIjy
 GKrecfAtkKwRojKW4Y1hyWbx1mMwzeTjBIkaSUM7sRMtQpQs8vDZGIy6svabOXQjf+7l
 KPwApiqtAWHeJPApB+XVfBXRKbzOnALw1aZAenTEimpyUjnU1Aj+R0/kd7Ix9qJndhEH
 WJyripnnQpy5ZyIpUaGY251elY/lZYB0sHtEJY91ogNok4tmWEZ5fPEvXenOROGIY966
 m2Nw==
X-Gm-Message-State: AOJu0YyzpdjU0xP47GsPHdv4ShPgv7iB+aeNBxqFlcMVA1TI48EpGpwp
 j2BN/NDieUyoX1AzVW6hs0JmmJ16F0dGo9B3dFgpDW+uylFIaU7VHqg+E1NrZ7rxPkglWa7PPzP
 FLYeoprQWxtJ5xoN1KLejiWP6qoT59RkQ
X-Gm-Gg: ASbGncuGuwgdGeNVgGcefAsk2t+nA6iQDUrae3UJ7kJc9kVQ9MBVzPyrzLP2gD305TD
 gTdZmvmjgZn27HgEzsiAesqr863466cAgiwQhW/nrAqKun8GzxdXZmSLGa0o9/oRU5DyqmPpDvo
 wk0rAle7b65TS8WDTObtVf
X-Google-Smtp-Source: AGHT+IFbYQ+2iFR7S/u7nsYXV11sOemyomei8G6gARGgyO0bDnQjksxdk7K85FYgv6vPimpeu2QI16jyGjeNrP3Ew9c=
X-Received: by 2002:a17:907:3f17:b0:acb:58f5:4529 with SMTP id
 a640c23a62f3a-ace71394307mr313873366b.45.1745622742560; Fri, 25 Apr 2025
 16:12:22 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 26 Apr 2025 09:12:11 +1000
X-Gm-Features: ATxdqUFSwwc7uu860_jUpvTlumw25sQQBYyeK2MYs5a6E0i_lkdE8bixFaKtgIM
Message-ID: <CAPM=9twNOWYCQ6vXZqUAu8G=oxGrKUvcTYz-SL6Jc=4+8ivVew@mail.gmail.com>
Subject: [git pull] drm fixes for 6.15-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
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

Weekly drm fixes, mostly amdgpu, with some exynos cleanups and a
couple of minor fixes, seems a bit quiet, but probably some lag from
Easter holidays.

Dave.

drm-fixes-2025-04-26:
drm fixes for 6.15-rc4

amdgpu:
- P2P DMA fixes
- Display reset fixes
- DCN 3.5 fixes
- ACPI EDID fix
- LTTPR fix
- mode_valid() fix

exynos:
- fix spelling error
- remove redundant error handling in exynos_drm_vidi.c module.
- marks struct decon_data as const in the exynos7_drm_decon driver
since it is only read.
- Remove unnecessary checking in exynos_drm_drv.c module

meson:
- Fix VCLK calculation

panel:
- jd9365a: Fix reset polarity
The following changes since commit 9c32cda43eb78f78c73aee4aa344b777714e259b:

  Linux 6.15-rc3 (2025-04-20 13:43:47 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-04-26

for you to fetch changes up to 250130d2daaa0a828bafbd6ad58479a645029e82:

  Merge tag 'amd-drm-fixes-6.15-2025-04-23' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2025-04-26
08:12:41 +1000)

----------------------------------------------------------------
drm fixes for 6.15-rc4

amdgpu:
- P2P DMA fixes
- Display reset fixes
- DCN 3.5 fixes
- ACPI EDID fix
- LTTPR fix
- mode_valid() fix

exynos:
- fix spelling error
- remove redundant error handling in exynos_drm_vidi.c module.
- marks struct decon_data as const in the exynos7_drm_decon driver
since it is only read.
- Remove unnecessary checking in exynos_drm_drv.c module

meson:
- Fix VCLK calculation

panel:
- jd9365a: Fix reset polarity

----------------------------------------------------------------
Anindya Sundar Gayen (1):
      drm/exynos: fixed a spelling error

Christian Hewitt (1):
      Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"

Colin Ian King (1):
      drm/exynos: Fix spelling mistake "enqueu" -> "enqueue"

Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2025-04-22' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'exynos-drm-fixes-for-v6.15-rc4' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-fixes
      Merge tag 'amd-drm-fixes-6.15-2025-04-23' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Felix Kuehling (3):
      drm/amdgpu: Use allowed_domains for pinning dmabufs
      drm/amdgpu: Don't pin VRAM without DMABUF_MOVE_NOTIFY
      drm/amdgpu: Allow P2P access through XGMI

George Shen (1):
      drm/amd/display: Use 16ms AUX read interval for LTTPR with old sinks

Gergo Koteles (1):
      drm/amd/display: do not copy invalid CRTC timing info

Guoqing Jiang (1):
      drm/exynos: Remove unnecessary checking

Hugo Villeneuve (1):
      drm: panel: jd9365da: fix reset signal polarity in unprepare

Krzysztof Kozlowski (1):
      drm/exynos: exynos7_drm_decon: Consstify struct decon_data

Leo Li (1):
      drm/amd/display: Default IPS to RCG_IN_ACTIVE_IPS2_IN_OFF

Mario Limonciello (1):
      drm/amd/display: Fix ACPI edid parsing on some Lenovo systems

Martin Blumenstingl (1):
      drm/meson: use unsigned long long / Hz for frequency types

Nicholas Susanto (1):
      drm/amd/display: Enable urgent latency adjustment on DCN35

Roman Li (2):
      drm/amd/display: Fix gpu reset in multidisplay config
      drm/amd/display: Force full update in gpu reset

Wentao Liang (1):
      drm/exynos/vidi: Remove redundant error handling in vidi_get_modes()

 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  52 +++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  41 ++---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |   4 +-
 .../dc/link/protocols/link_dp_training_8b_10b.c    |  54 ++++--
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   3 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c           |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |   3 -
 drivers/gpu/drm/meson/meson_drv.c                  |   2 +-
 drivers/gpu/drm/meson/meson_drv.h                  |   2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |  29 +--
 drivers/gpu/drm/meson/meson_vclk.c                 | 195 +++++++++++----------
 drivers/gpu/drm/meson/meson_vclk.h                 |  13 +-
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   |   4 +-
 16 files changed, 229 insertions(+), 183 deletions(-)
