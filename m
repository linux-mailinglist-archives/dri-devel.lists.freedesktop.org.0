Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B70467258DD
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531E910E47E;
	Wed,  7 Jun 2023 08:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF2710E48F;
 Wed,  7 Jun 2023 08:56:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 26171219EC;
 Wed,  7 Jun 2023 08:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686128206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C6KAY2bpYR+gjA+4/8LnpTbvfWmLThL9Rarcw9iqEmE=;
 b=JJyc7MTDWsQtEc2a3Td5U460cBK22tJLsLFRSQjD9tfULrVWBbJWZH0RSmFuqcATrEjnhQ
 XoUPrhUxwxCAND1sqKWbxAeR1TBPgSl0FkNuZf0ZMgpkL2faEhM77gN50W8W+S6jxsiKsH
 l7ku4trGM8LgxaqJ6JQEDPmKOccDKR8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686128206;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C6KAY2bpYR+gjA+4/8LnpTbvfWmLThL9Rarcw9iqEmE=;
 b=tDUrIPc/cpwJJyVdFmOGs9bq00Xcv920ffmb4cJJ7Fqi/Q1w/jhbxN/SmNk3Kq9ybQ7lr0
 6pj3xY5eVHFBCiBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC7921346D;
 Wed,  7 Jun 2023 08:56:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gjDlNE1GgGQDTgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Jun 2023 08:56:45 +0000
Date: Wed, 7 Jun 2023 10:56:44 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20230607085644.GA12673@linux-uq9g>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's the weekly PR for drm-misc-next.

Best regards
Thomas

drm-misc-next-2023-06-07:
drm-misc-next for v6.5:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:

Driver Changes:

 * bridge
   * imx: Fix module linking
   * tc358762: Support reset GPIO

 * meson
   * Add support for MIPI DSI displays; plus fixes and DT bindings

 * panel
   * Add Support for Rocktech RK043FN48H; plus DT bindings
   * Add support for Starry himax83102-j02; plus DT bindings
   * Add support for Starry ili9882t; plus DT bindings

 * virtio
   * Support sync-object UAPI
The following changes since commit 43049f17b5262826ef64a19762a096782398ef8f:

  drm/i915: Implement dedicated fbdev I/O helpers (2023-06-01 12:41:40 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-06-07

for you to fetch changes up to 13cdd12a9f934158f4ec817cf048fcb4384aa9dc:

  drm/panel: simple: add support for Rocktech RK043FN48H panel (2023-06-07 10:13:10 +0200)

----------------------------------------------------------------
drm-misc-next for v6.5:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:

Driver Changes:

 * bridge
   * imx: Fix module linking
   * tc358762: Support reset GPIO

 * meson
   * Add support for MIPI DSI displays; plus fixes and DT bindings

 * panel
   * Add Support for Rocktech RK043FN48H; plus DT bindings
   * Add support for Starry himax83102-j02; plus DT bindings
   * Add support for Starry ili9882t; plus DT bindings

 * virtio
   * Support sync-object UAPI

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/meson: venc: include linux/bitfield.h

Cong Yang (4):
      dt-bindings: display: panel: Add compatible for Starry himax83102-j02
      drm/panel: Support for Starry-himax83102-j02 TDDI MIPI-DSI panel
      dt-bindings: display: panel: Add compatible for Starry ili9882t
      drm/panel: Support for Starry-ili9882t TDDI MIPI-DSI panel

Dario Binacchi (2):
      dt-bindings: display: simple: add Rocktech RK043FN48H
      drm/panel: simple: add support for Rocktech RK043FN48H panel

Dmitry Osipenko (2):
      drm/virtio: Refactor and optimize job submission code path
      drm/virtio: Wait for each dma-fence of in-fence array individually

Jeffrey Hugo (1):
      MAINTAINERS: Add Carl/Pranjal as QAIC reviewers

Marek Vasut (2):
      dt-bindings: display: bridge: tc358762: Document reset-gpios
      drm/bridge: tc358762: Add reset GPIO support

Masahiro Yamada (2):
      drm/bridge: imx: fix mixed module-builtin object
      drm/bridge: imx: turn imx8{qm,qxp}-ldb into single-object modules

Maxime Ripard (1):
      mailmap: Add missing email address

Neil Armstrong (8):
      dt-bindings: display: add Amlogic MIPI DSI Host Controller bindings
      dt-bindings: display: meson-vpu: add third DPI output port
      drm/meson: fix unbind path if HDMI fails to bind
      drm/meson: only use components with dw-hdmi
      drm/meson: venc: add ENCL encoder setup for MIPI-DSI output
      drm/meson: add DSI encoder
      drm/meson: add support for MIPI-DSI transceiver
      drm/panel: khadas-ts050: update timings to achieve 60Hz refresh rate

Yang Li (1):
      drm/meson: Remove unneeded semicolon

 .mailmap                                           |   1 +
 .../display/amlogic,meson-g12a-dw-mipi-dsi.yaml    | 118 ++++++
 .../bindings/display/amlogic,meson-vpu.yaml        |   5 +
 .../bindings/display/bridge/toshiba,tc358762.yaml  |   3 +
 .../bindings/display/panel/boe,tv101wum-nl6.yaml   |   4 +
 .../bindings/display/panel/panel-simple.yaml       |   2 +
 MAINTAINERS                                        |   2 +
 drivers/gpu/drm/bridge/imx/Kconfig                 |   5 +
 drivers/gpu/drm/bridge/imx/Makefile                |   5 +-
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c        |  17 +
 .../bridge/imx/{imx8qm-ldb-drv.c => imx8qm-ldb.c}  |   0
 .../imx/{imx8qxp-ldb-drv.c => imx8qxp-ldb.c}       |   0
 drivers/gpu/drm/bridge/tc358762.c                  |  15 +
 drivers/gpu/drm/meson/Kconfig                      |   7 +
 drivers/gpu/drm/meson/Makefile                     |   3 +-
 drivers/gpu/drm/meson/meson_drv.c                  |  62 ++-
 drivers/gpu/drm/meson/meson_drv.h                  |   1 +
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          | 352 +++++++++++++++
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h          | 160 +++++++
 drivers/gpu/drm/meson/meson_encoder_dsi.c          | 174 ++++++++
 drivers/gpu/drm/meson/meson_encoder_dsi.h          |  13 +
 drivers/gpu/drm/meson/meson_registers.h            |  25 ++
 drivers/gpu/drm/meson/meson_venc.c                 | 212 ++++++++-
 drivers/gpu/drm/meson/meson_venc.h                 |   6 +
 drivers/gpu/drm/meson/meson_vpp.h                  |   2 +
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     | 472 +++++++++++++++++++++
 drivers/gpu/drm/panel/panel-khadas-ts050.c         |  16 +-
 drivers/gpu/drm/panel/panel-simple.c               |  29 ++
 drivers/gpu/drm/virtio/Makefile                    |   2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |   4 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             | 182 --------
 drivers/gpu/drm/virtio/virtgpu_submit.c            | 311 ++++++++++++++
 32 files changed, 1989 insertions(+), 221 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml
 rename drivers/gpu/drm/bridge/imx/{imx8qm-ldb-drv.c => imx8qm-ldb.c} (100%)
 rename drivers/gpu/drm/bridge/imx/{imx8qxp-ldb-drv.c => imx8qxp-ldb.c} (100%)
 create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.c
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.h
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_submit.c

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
