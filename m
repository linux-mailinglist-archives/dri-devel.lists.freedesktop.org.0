Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B030782B212
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 16:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED14610E933;
	Thu, 11 Jan 2024 15:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D70F10E933;
 Thu, 11 Jan 2024 15:49:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E944A1FD51;
 Thu, 11 Jan 2024 15:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704988145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vYE8CP1pNXb698lwxqWEf++BR4nIvQk6yuqavTI9CME=;
 b=cvAUsFjOG0k/DSPh0U57z9MD9QW7I9hErVBDh3CH7/xBT1bVY0s+04FQfzgnQBEt5xsssz
 BXi6wTT0tRdbtGe+bUHM4PV91MVPa7vNMekTJdLKROo0kEBRdQvTl1Bhp0Ikb1Ran1M6//
 YMdfgx7jaSwGaVCzvXgWJU7yaznUHbE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704988145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vYE8CP1pNXb698lwxqWEf++BR4nIvQk6yuqavTI9CME=;
 b=uWuD+Zh9vXAU94qRgfC5ZeNNj1kAEE1aZIuLICXKVjP2z536BUQnLJfLxoYQeLoH5E5snA
 Od+zlsikQrTFTsDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704988144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vYE8CP1pNXb698lwxqWEf++BR4nIvQk6yuqavTI9CME=;
 b=qrVbenSRHjtotVdSW7bnbd/4517Sh1TbqlbpcLrgYt6Sc/3TQz0FIICJ7Y/OFLCtzTLm9g
 fmM30eGHvhblsZpXmjQq9jNhxzUq5xgzRFwGZAswf8fDLeI654SmMUSkrEiAhT1V/5iRU5
 SAQ3NnF0GXbpCyHwjkjiaX0mB3+00LY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704988144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vYE8CP1pNXb698lwxqWEf++BR4nIvQk6yuqavTI9CME=;
 b=kXgNgmzB8T9A8Y3QyU67CoxcBYtuC/+Oyf9k2J6ZQZcCe04svS7m8Uw22RIukLQ3hAOpbT
 tugXSerh+JveMkCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5520413635;
 Thu, 11 Jan 2024 15:49:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KdJaE/ANoGV8UQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 11 Jan 2024 15:49:04 +0000
Date: Thu, 11 Jan 2024 16:49:02 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20240111154902.GA8448@linux-uq9g>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.80
X-Spamd-Result: default: False [-3.80 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_TWELVE(0.00)[15];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
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
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Sima,

this is the first PR for drm-misc-next for Linux v6.9. It's fairly small
compared to typical PRs; probably because of the holidays. Most of the
changes appear to by fixes. There's also support for a few more panels
and HDMI support for a Rockchip chipset.

Best regards
Thomas

drm-misc-next-2024-01-11:
drm-misc-next for v6.9:

UAPI Changes:

virtio:
- add Venus capset defines

Cross-subsystem Changes:

Core Changes:

- fix drm_fixp2int_ceil()
- documentation fixes
- clean ups
- allow DRM_MM_DEBUG with DRM=m
- build fixes for debugfs support
- EDID cleanups
- sched: error-handling fixes
- ttm: add tests

Driver Changes:

bridge:
- ite-6505: fix DP link-training bug
- samsung-dsim: fix error checking in probe
- tc358767: fix regmap usage

efifb:
- use copy of global screen_info state

hisilicon:
- fix EDID includes

mgag200:
- improve ioremap usage
- convert to struct drm_edid

nouveau:
- disp: use kmemdup()
- fix EDID includes
- documentation fixes

panel:
- ltk050h3146w: error-handling fixes
- panel-edp: support delay between power-on and enable; use put_sync in
  unprepare; support Mediatek MT8173 Chromebooks, BOE NV116WHM-N49 V8.0,
  BOE NV122WUM-N41, CSO MNC207QS1-1 plus DT bindings
- panel-lvds: support EDT ETML0700Z9NDHA plus DT bindings
- panel-novatek: FRIDA FRD400B25025-A-CTK plus DT bindings

qaic:
- fixes to BO handling
- make use of DRM managed release
- fix order of remove operations

rockchip:
- analogix_dp: get encoder port from DT
- inno_hdmi: support HDMI for RK3128
- lvds: error-handling fixes

simplefb:
- fix logging

ssd130x:
- support SSD133x plus DT bindings

tegra:
- fix error handling

tilcdc:
- make use of DRM managed release

v3d:
- show memory stats in debugfs

vc4:
- fix error handling in plane prepare_fb
- fix framebuffer test in plane helpers

vesafb:
- use copy of global screen_info state

virtio:
- cleanups

vkms:
- fix OOB access when programming the LUT
- Kconfig improvements

vmwgfx:
- unmap surface before changing plane state
- fix memory leak in error handling
- documentation fixes
The following changes since commit b1a2aa9bcbb88a7dc1c4df98dbf4f4df9ca79c9f:

  drm: ci: Update xfails (2023-12-13 15:18:30 -0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2024-01-11

for you to fetch changes up to 502756e23360d1192c496bc6791e97621e8578d8:

  drm/v3d: Show the memory-management stats on debugfs (2024-01-11 11:45:47 -0300)

----------------------------------------------------------------
drm-misc-next for v6.9:

UAPI Changes:

virtio:
- add Venus capset defines

Cross-subsystem Changes:

Core Changes:

- fix drm_fixp2int_ceil()
- documentation fixes
- clean ups
- allow DRM_MM_DEBUG with DRM=m
- build fixes for debugfs support
- EDID cleanups
- sched: error-handling fixes
- ttm: add tests

Driver Changes:

bridge:
- ite-6505: fix DP link-training bug
- samsung-dsim: fix error checking in probe
- tc358767: fix regmap usage

efifb:
- use copy of global screen_info state

hisilicon:
- fix EDID includes

mgag200:
- improve ioremap usage
- convert to struct drm_edid

nouveau:
- disp: use kmemdup()
- fix EDID includes
- documentation fixes

panel:
- ltk050h3146w: error-handling fixes
- panel-edp: support delay between power-on and enable; use put_sync in
  unprepare; support Mediatek MT8173 Chromebooks, BOE NV116WHM-N49 V8.0,
  BOE NV122WUM-N41, CSO MNC207QS1-1 plus DT bindings
- panel-lvds: support EDT ETML0700Z9NDHA plus DT bindings
- panel-novatek: FRIDA FRD400B25025-A-CTK plus DT bindings

qaic:
- fixes to BO handling
- make use of DRM managed release
- fix order of remove operations

rockchip:
- analogix_dp: get encoder port from DT
- inno_hdmi: support HDMI for RK3128
- lvds: error-handling fixes

simplefb:
- fix logging

ssd130x:
- support SSD133x plus DT bindings

tegra:
- fix error handling

tilcdc:
- make use of DRM managed release

v3d:
- show memory stats in debugfs

vc4:
- fix error handling in plane prepare_fb
- fix framebuffer test in plane helpers

vesafb:
- use copy of global screen_info state

virtio:
- cleanups

vkms:
- fix OOB access when programming the LUT
- Kconfig improvements

vmwgfx:
- unmap surface before changing plane state
- fix memory leak in error handling
- documentation fixes

----------------------------------------------------------------
Alex Bee (13):
      drm/rockchip: vop: Add output selection registers for RK312x
      drm/rockchip: inno_hdmi: Fix video timing
      drm/rockchip: inno_hdmi: Remove YUV-based csc coefficents
      drm/rockchip: inno_hdmi: Drop irq struct member
      drm/rockchip: inno_hdmi: Remove useless include
      drm/rockchip: inno_hdmi: Subclass connector state
      drm/rockchip: inno_hdmi: Correctly setup HDMI quantization range
      drm/rockchip: inno_hdmi: Don't power up the phy after resetting
      drm/rockchip: inno_hdmi: Split power mode setting
      drm/rockchip: inno_hdmi: Add variant support
      drm/rockchip: inno_hdmi: Add RK3128 support
      drm/rockchip: inno_hdmi: Add basic mode validation
      drm/rockchip: inno_hdmi: Drop custom fill_modes hook

Alexander Stein (7):
      drm/bridge: tc358767: Use regmap_access_table for writeable registers
      drm/bridge: tc358767: Fix order of register defines
      drm/bridge: tc358767: Add more registers to non-writeable range
      drm/bridge: tc358767: Sort volatile registers according to address
      drm/bridge: tc358767: Add more volatile registers
      drm/bridge: tc358767: Add precious register SYSSTAT
      drm/bridge: tc358767: Add descriptions to register definitions

Andy Shevchenko (1):
      drm/virtio: Spelling fixes

Brian Masney (1):
      fbdev/simplefb: change loglevel when the power domains cannot be parsed

Chen Haonan (1):
      drm/nouveau/disp: switch to use kmemdup() helper

Chen Ni (1):
      drm/tegra: dsi: Add missing check for of_find_device_by_node

Christophe JAILLET (6):
      drm/tegra: dsi: Fix some error handling paths in tegra_dsi_probe()
      drm/tegra: dsi: Fix missing pm_runtime_disable() in the error handling path of tegra_dsi_probe()
      drm/tegra: hdmi: Fix some error handling paths in tegra_hdmi_probe()
      drm/tegra: rgb: Fix some error handling paths in tegra_dc_rgb_probe()
      drm/tegra: rgb: Fix missing clk_put() in the error handling paths of tegra_dc_rgb_probe()
      drm/tegra: output: Fix missing i2c_put_adapter() in the error handling paths of tegra_output_probe()

Dario Binacchi (5):
      drm/bridge: samsung-dsim: check the return value only if necessary
      drm/debugfs: drop unneeded DEBUG_FS guard
      dt-bindings: nt35510: add compatible for FRIDA FRD400B25025-A-CTK
      drm/panel: nt35510: move hardwired parameters to configuration
      drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK

Donald Robson (1):
      MAINTAINERS: Remove Donald Robson from powervr driver maintainers

Ghanshyam Agrawal (1):
      drm/vmwgfx: Fix typos in vmwgfx_execbuf.c

Harry Wentland (3):
      drm: Don't treat 0 as -1 in drm_fixp2int_ceil
      drm/vkms: Create separate Kconfig file for VKMS
      drm/vkms: Avoid reading beyond LUT array

Hsin-Yi Wang (1):
      drm/panel-edp: use put_sync in unprepare

Huang Rui (1):
      drm/virtio: add definition for venus capset

Jani Nikula (8):
      drm/edid: replace __attribute__((packed)) with __packed
      drm/ioc32: replace __attribute__((packed)) with __packed
      drm/tegra: include drm/drm_edid.h only where needed
      drm/edid: prefer forward declarations over includes in drm_edid.h
      drm/mgag200: convert get modes to struct drm_edid
      drm/probe-helper: remove unused drm_connector_helper_get_modes_from_ddc()
      drm/nouveau: include drm/drm_edid.h only where needed
      drm/hisilicon: include drm/drm_edid.h only where needed

Javier Martinez Canillas (5):
      dt-bindings: display: ssd1307fb: Add vendor prefix to width and height
      dt-bindings: display: ssd132x: Add vendor prefix to width and height
      dt-bindings: display: Add SSD133x OLED controllers
      drm/ssd130x: Add support for the SSD133x OLED controller family
      drm: Move drm_set_preferred_mode() helper from drm_edid to drm_modes

Jeffrey Hugo (2):
      accel/qaic: Fix MHI channel struct field order
      accel/qaic: Order pci_remove() operations in reverse of probe()

Karolina Stolarek (4):
      drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man
      drm/ttm/tests: Add tests for ttm_tt
      drm/ttm/tests: Add tests for ttm_bo functions
      drm/ttm/tests: Fix argument in ttm_tt_kunit_init()

Lucas Stach (1):
      drm/rockchip: analogix_dp: get encoder port ID from DT

Markus Elfring (2):
      drm/sched: One function call less in drm_sched_init() after error detection
      drm/sched: Return an error code only as a constant in drm_sched_init()

Maxime Ripard (17):
      drm/atomic: Move the drm_atomic_state field doc inline
      drm/atomic: Remove inexistent reference
      drm/atomic: Rework the object doc a bit
      drm/atomic: Make the drm_atomic_state documentation less ambiguous
      drm/todo: Add entry to rename drm_atomic_state
      drm/rockchip: inno_hdmi: Remove useless mode_fixup
      drm/rockchip: inno_hdmi: Remove useless copy of drm_display_mode
      drm/rockchip: inno_hdmi: Switch encoder hooks to atomic
      drm/rockchip: inno_hdmi: Get rid of mode_set
      drm/rockchip: inno_hdmi: no need to store vic
      drm/rockchip: inno_hdmi: Remove unneeded has audio flag
      drm/rockchip: inno_hdmi: Remove useless input format
      drm/rockchip: inno_hdmi: Remove tmds rate from structure
      drm/rockchip: inno_hdmi: Drop HDMI Vendor Infoframe support
      drm/rockchip: inno_hdmi: Move infoframe disable to separate function
      drm/rockchip: inno_hdmi: Switch to infoframe type
      drm/rockchip: inno_hdmi: Remove unused drm device pointer

Maíra Canal (2):
      drm/vc4: don't check if plane->state->fb == state->fb
      drm/v3d: Show the memory-management stats on debugfs

Philipp Stanner (1):
      drm/tilcdc: request and mapp iomem with devres

Pin-yen Lin (3):
      drm/panel-edp: Add powered_on_to_enable delay
      drm/edp-panel: Add panels delay entries
      drm/panel-edp: Add some panels with conservative timings

Pranjal Ramajor Asha Kanojiya (5):
      accel/qaic: Deprecate ->size field from attach slice IOCTL structure
      accel/qaic: Remove bo->queued field
      accel/qaic: Drop the reference to BO in error path of create BO IOCTL
      accel/qaic: Call drm_gem_create_mmap_offset() once for each BO
      accel/qaic: Leverage DRM managed APIs to release resources

Quentin Schulz (4):
      drm/rockchip: lvds: do not overwrite error code
      drm/rockchip: lvds: do not print scary message when probing defer
      drm/panel: ltk050h3146w: only print message when GPIO getting is not EPROBE_DEFER
      drm/panel: ltk050h3146w: use dev_err_probe wherever possible

Randy Dunlap (7):
      drm/vmwgfx: fix all kernel-doc warnings in stdu
      drm/vmwgfx: fix kernel-doc Excess struct member 'base'
      drm/nouveau/bios/init: drop kernel-doc notation
      drm/nouveau/disp: don't misuse kernel-doc comments
      drm/nouveau: don't misuse kernel-doc comments
      drm/nouveau/gr/gf100: don't misuse kernel-doc comments
      drm/nouveau/volt/gk20a: don't misuse kernel-doc comments

Raphael Gallais-Pou (1):
      dt-bindings: panel: lvds: Append edt,etml0700z9ndha in panel-lvds

Rodrigo Vivi (1):
      drm/doc/rfc: Remove Xe's pre-merge plan

Simon Ser (1):
      drm/vc4: plane: check drm_gem_plane_helper_prepare_fb() return value

Thomas Zimmermann (5):
      fbdev/efifb: Replace references to global screen_info by local pointer
      fbdev/efifb: Use screen_info pointer from device
      fbdev/vesafb: Replace references to global screen_info by local pointer
      fbdev/vesafb: Use screen_info pointer from device
      drm/mgag200: Fix caching setup for remapped video memory

Vegard Nossum (1):
      drm/nouveau: uapi: fix kerneldoc warnings

Ville Syrjälä (1):
      drm/mm: Allow CONFIG_DRM_MM_DEBUG with DRM=m

Xuxin Xiong (1):
      drm/panel-edp: Add several generic edp panels

Zack Rusin (1):
      drm/vmwgfx: Unmap the surface before resetting it on a plane state

Zhang Shurong (1):
      drm/tegra: dpaux: Fix PM disable depth imbalance in tegra_dpaux_probe

Zhipeng Lu (1):
      drm/vmwgfx: fix a memleak in vmw_gmrid_man_get_node

chenxuebing (1):
      drm/edid: Clean up errors in drm_edid.c

xiazhengqiao (1):
      drm/bridge: Fixed a DP link training bug

 .../bindings/display/panel/novatek,nt35510.yaml    |   4 +-
 .../bindings/display/panel/panel-lvds.yaml         |   2 +
 .../bindings/display/solomon,ssd1307fb.yaml        |  20 +-
 .../bindings/display/solomon,ssd132x.yaml          |  12 +-
 .../bindings/display/solomon,ssd133x.yaml          |  45 ++
 Documentation/gpu/rfc/xe.rst                       | 234 --------
 Documentation/gpu/todo.rst                         |  23 +
 MAINTAINERS                                        |   1 -
 drivers/accel/qaic/mhi_controller.c                |   4 +-
 drivers/accel/qaic/qaic.h                          |   3 +-
 drivers/accel/qaic/qaic_data.c                     |  59 +-
 drivers/accel/qaic/qaic_drv.c                      | 140 +++--
 drivers/gpu/drm/Kconfig                            |  16 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   4 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |   8 +-
 drivers/gpu/drm/bridge/tc358767.c                  | 171 ++++--
 drivers/gpu/drm/drm_debugfs.c                      |   4 -
 drivers/gpu/drm/drm_edid.c                         |  25 +-
 drivers/gpu/drm/drm_ioc32.c                        |   4 +-
 drivers/gpu/drm/drm_modes.c                        |  22 +
 drivers/gpu/drm/drm_probe_helper.c                 |  36 --
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h    |   1 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |   1 +
 drivers/gpu/drm/mgag200/mgag200_drv.c              |   9 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |  14 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c            |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/head.c            |   1 +
 drivers/gpu/drm/nouveau/nouveau_connector.h        |   2 +-
 drivers/gpu/drm/nouveau/nouveau_ioc32.c            |   4 +-
 drivers/gpu/drm/nouveau/nvif/outp.c                |   3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c     |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c    | 136 ++---
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c   |   4 +-
 drivers/gpu/drm/panel/panel-edp.c                  |  97 +++-
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |  23 +-
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      | 424 ++++++++++++--
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |   3 +
 drivers/gpu/drm/rockchip/inno_hdmi.c               | 548 +++++++++++-------
 drivers/gpu/drm/rockchip/inno_hdmi.h               |   5 -
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |   3 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |  13 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h        |   3 +
 drivers/gpu/drm/scheduler/sched_main.c             |  11 +-
 drivers/gpu/drm/solomon/ssd130x-spi.c              |   7 +
 drivers/gpu/drm/solomon/ssd130x.c                  | 370 ++++++++++++
 drivers/gpu/drm/solomon/ssd130x.h                  |   5 +-
 drivers/gpu/drm/tegra/dpaux.c                      |  14 +-
 drivers/gpu/drm/tegra/drm.h                        |   2 +-
 drivers/gpu/drm/tegra/dsi.c                        |  59 +-
 drivers/gpu/drm/tegra/hdmi.c                       |  20 +-
 drivers/gpu/drm/tegra/output.c                     |  17 +-
 drivers/gpu/drm/tegra/rgb.c                        |  18 +-
 drivers/gpu/drm/tegra/sor.c                        |   1 +
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |  19 +-
 drivers/gpu/drm/ttm/tests/Makefile                 |   3 +
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c            | 622 +++++++++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c      |  48 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h      |   3 +
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c          |   3 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c      | 335 +++++++++++
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c            | 295 ++++++++++
 drivers/gpu/drm/ttm/ttm_resource.c                 |   3 +
 drivers/gpu/drm/ttm/ttm_tt.c                       |   3 +
 drivers/gpu/drm/v3d/v3d_debugfs.c                  |  15 +
 drivers/gpu/drm/vc4/vc4_plane.c                    |  10 +-
 drivers/gpu/drm/virtio/virtgpu_submit.c            |   6 +-
 drivers/gpu/drm/vkms/Kconfig                       |  15 +
 drivers/gpu/drm/vkms/vkms_composer.c               |  14 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |   5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   4 +
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |  17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |   1 -
 drivers/video/fbdev/efifb.c                        | 136 +++--
 drivers/video/fbdev/simplefb.c                     |   2 +-
 drivers/video/fbdev/vesafb.c                       |  78 ++-
 include/drm/drm_atomic.h                           |  70 ++-
 include/drm/drm_edid.h                             |  46 +-
 include/drm/drm_fixed.h                            |   2 +-
 include/drm/drm_modes.h                            |   2 +
 include/drm/drm_probe_helper.h                     |   1 -
 include/uapi/drm/nouveau_drm.h                     |  56 +-
 include/uapi/drm/qaic_accel.h                      |  13 +-
 include/uapi/linux/virtio_gpu.h                    |   2 +
 84 files changed, 3397 insertions(+), 1097 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
 delete mode 100644 Documentation/gpu/rfc/xe.rst
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c
 create mode 100644 drivers/gpu/drm/vkms/Kconfig

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
