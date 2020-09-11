Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4B4265A65
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 09:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B971B6E356;
	Fri, 11 Sep 2020 07:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4A66E359
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 07:20:28 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id q13so12388025ejo.9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 00:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=YFeXjg7bqtTOYH49LIXUF1fo0jTBbkbgWiE0BAtXQYM=;
 b=olkRWEm+WkS5GkVvHd2wfMIUqeYzYCZEhMDvsVxvkL+iSN6OtLdTXjcP1+Zeu+VopI
 nyiKZEt75J3tgl2EDVHz4ypb72b4LB/r0PiEqr06K7QuWFHx6hwbIodp2uU4B6wHAhyn
 VcdXlw3SDgWyJ+ukCqgQblphQ2UXgoa5yDt7E1mLOzqapI8Ha+VWmjqOqW800PkXdY1s
 FT0UKWiorqK1mlKQQL2utMCAQozPPfU5ud0gdNC8OcmvwuND7/IEkGuRbDLGEOMWH5yq
 1xl8hhCnmBrTTKZ9guGPoZ67hmZcXpXjFJFYptCgiCTkoEdB2kj48bv6S4apuMp6d+U8
 FxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=YFeXjg7bqtTOYH49LIXUF1fo0jTBbkbgWiE0BAtXQYM=;
 b=V18BZ9sqMtZl4vIgm2mx0a8jFtzTeVslJ/IcSf/0qOvU/NnMKqurstuxx30STfeHTO
 JrKcpOvH2TOnw7yUZtX2rBUmPUfBjShpwXUUZ8eeZbzS7PSh8AuiKrOXb5GFtJc9Y8wi
 uEuQ/NNyQLzOjVR/a7FnJF3+wlmRD2S4+/3GPyhSWU9UuDKQuZSuqyeGIedNU0WCoRK0
 DKNiVC3krzXPtgQku8+0OAWr9ovveARjO/zI9omBOb0ax8c5Og2I+SBVIr10VsSex+FK
 /Nk26DTJmcWKXUJGi8Kz6HYe6lbi2ySy49bQRZ6EOGqDxCWYbngu7Q23j5mKctq1oLN/
 ZvsA==
X-Gm-Message-State: AOAM530dy0TQybFDskQ0+hJRosGSw59Xeh87msOZSPIN0cNcPVbmfUPx
 thZzIsuD5D2BWC2lsNbCDOgwzWDSi/ICsJqD954=
X-Google-Smtp-Source: ABdhPJw5ZsirWV0c7OfUpQwJtF/NnjigCb9xkes2Un4J5HwOVhwQLdiF2NkaO5xLFDOkwqy7/91kNkfVF/LyQOXoKYI=
X-Received: by 2002:a17:906:fb8c:: with SMTP id
 lr12mr799162ejb.9.1599808827116; 
 Fri, 11 Sep 2020 00:20:27 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 11 Sep 2020 17:20:15 +1000
Message-ID: <CAPM=9txiwAocSprg6zCMF7ajJm-aY7wX=NY47+ZhVdKLfVZi+A@mail.gmail.com>
Subject: [git pull] drm fixes for 5.9-rc5
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

Regular fixes, not much a major amount. One thing though is Laurent
fixed some Kconfig issues, and I'm carrying the rapidio kconfig change
so the drm one for xlnx driver works. He hadn't got a response from
rapidio maintainers.

Otherwise, virtio, sun4i, tve200, ingenic have some fixes, one audio
fix for i915 and a core docs fix.

DAve.


drm-fixes-2020-09-11:
drm fixes for 5.9-rc5

rapidio/xlnx kconfig fix.

core:
- Documentation fix.

i915:
- audio regression fix

virtio:
- Fix double free in virtio.
- Fix virtio unblank.
- Remove output->enabled from virtio, as it should use crtc_state.

sun4i:
- Add missing put_device in sun4i, and other fixes.
- Handle sun4i alpha on lowest plane correctly.

tv200:
- Fix tve200 enable/disable.

ingenic
- Small ingenic fixes.
The following changes since commit 20561da3a2e1e0e827ef5510cb0f74bcfd377e41:

  Revert "drm/i915/gem: Delete unused code" (2020-09-08 15:45:27 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-09-11

for you to fetch changes up to 7f7a47952c0f981f9c9a6409c8cf8d025d55af64:

  Merge tag 'drm-misc-fixes-2020-09-09' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2020-09-11
09:49:23 +1000)

----------------------------------------------------------------
drm fixes for 5.9-rc5

rapidio/xlnx kconfig fix.

core:
- Documentation fix.

i915:
- audio regression fix

virtio:
- Fix double free in virtio.
- Fix virtio unblank.
- Remove output->enabled from virtio, as it should use crtc_state.

sun4i:
- Add missing put_device in sun4i, and other fixes.
- Handle sun4i alpha on lowest plane correctly.

tv200:
- Fix tve200 enable/disable.

ingenic
- Small ingenic fixes.

----------------------------------------------------------------
Dave Airlie (3):
      Merge tag 'drm-xlnx-dpsub-fixes-20200905' of
git://linuxtv.org/pinchartl/media into drm-fixes
      Merge tag 'drm-intel-fixes-2020-09-10' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-misc-fixes-2020-09-09' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Gerd Hoffmann (2):
      drm/virtio: fix unblank
      drm/virtio: drop virtio_gpu_output->enabled

Gurchetan Singh (1):
      drm/virtio: Revert "drm/virtio: Call the right shmem helpers"

Jernej Skrabec (1):
      drm/sun4i: Fix DE2 YVU handling

Kai Vehmanen (1):
      drm/i915: fix regression leading to display audio probe failure on GLK

Krzysztof Kozlowski (2):
      dma-buf: Fix kerneldoc of dma_buf_set_name()
      dma-buf: fence-chain: Document missing dma_fence_chain_init()
parameter in kerneldoc

Laurent Pinchart (2):
      rapidio: Replace 'select' DMAENGINES 'with depends on'
      drm: xlnx: dpsub: Fix DMADEVICES Kconfig dependency

Linus Walleij (1):
      drm/tve200: Stabilize enable/disable

Maxime Ripard (2):
      drm/sun4i: backend: Support alpha property on lowest plane
      drm/sun4i: backend: Disable alpha on the lowest plane on the A20

Ondrej Jirman (1):
      drm/sun4i: Fix dsi dcs long write function

Paul Cercueil (2):
      drm/ingenic: Fix leak of device_node pointer
      drm/ingenic: Fix driver not probing when IPU port is missing

Randy Dunlap (1):
      Documentation: fix dma-buf.rst underline length warning

Yu Kuai (1):
      drm/sun4i: add missing put_device() call in sun8i_r40_tcon_tv_set_mux()

 Documentation/driver-api/dma-buf.rst         |  2 +-
 drivers/dma-buf/dma-buf.c                    |  6 +++---
 drivers/dma-buf/dma-fence-chain.c            |  1 +
 drivers/gpu/drm/i915/display/intel_display.c | 10 ++++------
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c    | 20 ++++++++++++--------
 drivers/gpu/drm/sun4i/sun4i_backend.c        |  4 +---
 drivers/gpu/drm/sun4i/sun4i_tcon.c           |  8 ++++++--
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c       |  4 ++--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c       |  2 +-
 drivers/gpu/drm/tve200/tve200_display.c      | 22 +++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_display.c     | 15 +++++++++++----
 drivers/gpu/drm/virtio/virtgpu_drv.h         |  2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c      |  8 +++++++-
 drivers/gpu/drm/virtio/virtgpu_plane.c       |  6 ++++--
 drivers/gpu/drm/xlnx/Kconfig                 |  1 +
 drivers/rapidio/Kconfig                      |  2 +-
 16 files changed, 77 insertions(+), 36 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
