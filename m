Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A28A1263CE1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 08:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260B188AA1;
	Thu, 10 Sep 2020 06:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 579 seconds by postgrey-1.36 at gabe;
 Thu, 10 Sep 2020 06:00:53 UTC
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255266E039;
 Thu, 10 Sep 2020 06:00:53 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <478b49d1-b1b3-c983-7056-8a89249be435@mblankhorst.nl>
Date: Thu, 10 Sep 2020 07:51:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-US
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-fixes-2020-09-09:
drm-misc-fixes for v5.9-rc5:
- Fix double free in virtio.
- Add missing put_device in sun4i, and other fixes.
- Small ingenic fixes.
- Handle sun4i alpha on lowest plane correctly.
- Remove output->enabled from virtio, as it should use crtc_state.
- Fix tve200 enable/disable.
- Documentation fix.
- Fix virtio unblank.
The following changes since commit 7fd5b25499bcec157dd4de9a713425efcf4571cd:

  drm/omap: fix incorrect lock state (2020-08-25 12:05:15 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-09-09

for you to fetch changes up to fc7f148feb8975784bd40e41fff875d33f698be8:

  drm/virtio: drop virtio_gpu_output->enabled (2020-09-04 13:11:32 +0200)

----------------------------------------------------------------
drm-misc-fixes for v5.9-rc5:
- Fix double free in virtio.
- Add missing put_device in sun4i, and other fixes.
- Small ingenic fixes.
- Handle sun4i alpha on lowest plane correctly.
- Remove output->enabled from virtio, as it should use crtc_state.
- Fix tve200 enable/disable.
- Documentation fix.
- Fix virtio unblank.

----------------------------------------------------------------
Gerd Hoffmann (2):
      drm/virtio: fix unblank
      drm/virtio: drop virtio_gpu_output->enabled

Gurchetan Singh (1):
      drm/virtio: Revert "drm/virtio: Call the right shmem helpers"

Jernej Skrabec (1):
      drm/sun4i: Fix DE2 YVU handling

Krzysztof Kozlowski (2):
      dma-buf: Fix kerneldoc of dma_buf_set_name()
      dma-buf: fence-chain: Document missing dma_fence_chain_init() parameter in kerneldoc

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

 Documentation/driver-api/dma-buf.rst      |  2 +-
 drivers/dma-buf/dma-buf.c                 |  6 +++---
 drivers/dma-buf/dma-fence-chain.c         |  1 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 20 ++++++++++++--------
 drivers/gpu/drm/sun4i/sun4i_backend.c     |  4 +---
 drivers/gpu/drm/sun4i/sun4i_tcon.c        |  8 ++++++--
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c    |  4 ++--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c    |  2 +-
 drivers/gpu/drm/tve200/tve200_display.c   | 22 +++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_display.c  | 15 +++++++++++----
 drivers/gpu/drm/virtio/virtgpu_drv.h      |  2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c   |  8 +++++++-
 drivers/gpu/drm/virtio/virtgpu_plane.c    |  6 ++++--
 13 files changed, 71 insertions(+), 29 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
