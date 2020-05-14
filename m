Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CC11D2884
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 09:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB6F6E2DD;
	Thu, 14 May 2020 07:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A566E2DD;
 Thu, 14 May 2020 07:08:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DF15CAAD0;
 Thu, 14 May 2020 07:08:24 +0000 (UTC)
Date: Thu, 14 May 2020 09:08:19 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20200514070819.GA6930@linux-uq9g>
MIME-Version: 1.0
Content-Disposition: inline
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

Hi Dave and Daniel,

this is the forth pull request for drm-misc-next for what will become v5.8.
It's fairly small number of patches without major changes. There's one fix
to the UAPI headers, but it only affects comments.

Best regards
Thomsa

drm-misc-next-2020-05-14:
drm-misc-next for 5.8:

UAPI Changes:

Cross-subsystem Changes:

 * dma-buf: use atomic64_fetch_add() for context id
 * Documentation: document bindings for ASUS ZOOT TM5P5, BOE NV133FHM-N62,
                  hpd-gpios

Core Changes:

Driver Changes:

 * drm/ast: fix supend; cleanups
 * drm/i2c: cleanups
 * drm/panel: add MODULE_LICENSE to panel-visinox-rm69299; add support for
              ASUS TM5P5i, BOE NV133FHM-N62i; fix size and bpp of BOE NV133FHM-N61
	      add hpd-gpio to panel-simple
 * drm/mcde: fix return value check in mcde_dsi_bind()
 * drm/mgag200: use managed drmm_mode_config_init(); cleanups
 * fbdev/pxa168fb: cleanups

The following changes since commit 0ea2ea42b31abc1141f2fd3911f952a97d401fcb:

  drm/vkms: Hold gem object while still in-use (2020-05-06 21:51:46 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2020-05-14

for you to fetch changes up to 1c530d431c698f156538b8954b07df95337beb34:

  dma-buf: Use atomic_fetch_add() for the context id (2020-05-13 13:38:59 +0100)

----------------------------------------------------------------
drm-misc-next for 5.8:

UAPI Changes:

Cross-subsystem Changes:

 * dma-buf: use atomic64_fetch_add() for context id
 * Documentation: document bindings for ASUS ZOOT TM5P5, BOE NV133FHM-N62,
                  hpd-gpios

Core Changes:

Driver Changes:

 * drm/ast: fix supend; cleanups
 * drm/i2c: cleanups
 * drm/panel: add MODULE_LICENSE to panel-visinox-rm69299; add support for
              ASUS TM5P5i, BOE NV133FHM-N62i; fix size and bpp of BOE NV133FHM-N61
	      add hpd-gpio to panel-simple
 * drm/mcde: fix return value check in mcde_dsi_bind()
 * drm/mgag200: use managed drmm_mode_config_init(); cleanups
 * fbdev/pxa168fb: cleanups

----------------------------------------------------------------
Chris Wilson (1):
      dma-buf: Use atomic_fetch_add() for the context id

Douglas Anderson (5):
      panel: simple: Fix size and bpp of BOE NV133FHM-N61
      dt-bindings: display: simple: Add BOE NV133FHM-N62
      panel: simple: Add BOE NV133FHM-N62
      dt-bindings: display: Add hpd-gpios to panel-common bindings
      drm/panel-simple: Support hpd-gpios for delaying prepare()

Jason Yan (1):
      video: fbdev: pxa168fb: make pxa168fb_init_mode() return void

Konrad Dybcio (2):
      dt-bindings: display: Document ASUS Z00T TM5P5 NT35596 panel compatible
      drivers: drm: panel: Add ASUS TM5P5 NT35596 panel driver

Mika Kahola (1):
      uapi/drm/drm_fourcc.h: Note on platform specificity for format modifiers

Randy Dunlap (1):
      drm: panel: add MODULE_LICENSE to panel-visionox-rm69299.c

Samuel Zou (2):
      drm/ast: Make ast_primary_plane_helper_atomic_update static
      drm/i2c/tda998x: Make tda998x_audio_digital_mute static

Thomas Zimmermann (7):
      drm/ast: Don't check new mode if CRTC is being disabled
      drm/mgag200: Convert struct drm_device to struct mga_device with helper
      drm/mgag200: Remove several references to struct mga_device.dev
      drm/mgag200: Integrate init function into load function
      drm/mgag200: Use managed mode-config initialization
      drm/mgag200: Remove unused fields from struct mga_device
      drm/mgag200: Embed connector instance in struct mga_device

Wei Yongjun (1):
      drm/mcde: dsi: Fix return value check in mcde_dsi_bind()

 .../display/panel/asus,z00t-tm5p5-nt35596.yaml     |  56 ++++
 .../bindings/display/panel/panel-common.yaml       |   6 +
 .../bindings/display/panel/panel-simple.yaml       |   2 +
 drivers/dma-buf/dma-fence.c                        |   2 +-
 drivers/gpu/drm/ast/ast_mode.c                     |   8 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   3 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |   7 +-
 drivers/gpu/drm/mgag200/mgag200_cursor.c           |   4 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |   2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |  15 +-
 drivers/gpu/drm/mgag200/mgag200_i2c.c              |  10 +-
 drivers/gpu/drm/mgag200/mgag200_main.c             | 115 ++-----
 drivers/gpu/drm/mgag200/mgag200_mode.c             | 127 ++++---
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c   | 367 +++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c               |  64 +++-
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     |   1 +
 drivers/video/fbdev/pxa168fb.c                     |   5 +-
 include/uapi/drm/drm_fourcc.h                      |  18 +-
 20 files changed, 654 insertions(+), 169 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/asus,z00t-tm5p5-nt35596.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
