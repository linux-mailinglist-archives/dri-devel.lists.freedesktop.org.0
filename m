Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F05C54774B7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 15:34:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3584611236B;
	Thu, 16 Dec 2021 14:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8312112365;
 Thu, 16 Dec 2021 14:34:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 871B821135;
 Thu, 16 Dec 2021 14:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639665259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W5bqJU+Eglskw2AOoGx5/xZkDodRsTPlcLkJzv6ITaE=;
 b=TnkRIRK25WdTueMxciyjxy+bRS+zX4LrisrdpmyAkD3lPa9HyvmvZLHAMwMCiC6l3l7SjW
 dVUkfn0g7SvRjj5NDYvKIEW+M0UchYR8Qz5lQRtEshRvyRCii4hBmvHBUI/Ls1jZy3TYsR
 DjPUlylNUvHk9twRfjJrdQ6Mqf5puO0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639665259;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W5bqJU+Eglskw2AOoGx5/xZkDodRsTPlcLkJzv6ITaE=;
 b=dqZlR0UpT84Mz8BxIHAK0Pyhr1kPQam/4XYj01r7aIXoJmS2vWrqbdADB0tNRTQfovewi2
 rFU6iaHTWYgh/bBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4913313E3B;
 Thu, 16 Dec 2021 14:34:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1UbYEGtOu2GxEgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Dec 2021 14:34:19 +0000
Date: Thu, 16 Dec 2021 15:34:17 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <YbtOaZLvar+9hBOi@linux-uq9g.fritz.box>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's this week's PR for drm-misc-next for what will become Linux
5.17.

Every single patchset in this PR is awesome: vmwgfx now supports
GL 4.3 userspace and GEM (yeah!), simpledrm added support for Apple M1
firmware framebuffers, the SPRD drivers finally got merged, vc4 added
support for 10-bit YUV output. And of course, we have the usual round
of bug fixes.

Besides the DRM updates, there's a backmerge from drm-next that brings
drm-misc-next up to v5.16-rc5.

Best regards
Thomas

drm-misc-next-2021-12-16:
drm-misc-next for 5.17:

UAPI Changes:

 * vmwgfx: Version bump to 2.20

Cross-subsystem Changes:

 * of: Create simple-framebuffer devices in of_platform_default_init()

Core Changes:

 * Replace include <linux/kernel.h> with more fine-grained includes
 * Document DRM_IOCTL_MODE_GETFB2
 * format-helper: Support XRGB2101010 source buffers

Driver Changes:

 * amdgpu: Fix runtime PM on some configs
 * ast: Fix I2C initialization
 * bridge: ti-sn65dsi86: Set regmap max_register
 * panel: Add Team Source Display TST043015CMHX plus DT bindings
 * simpledrm: Add support for Apple M1
 * sprd: Add various drivers plus DT bindings
 * vc4: Support 10-bit YUV 4:2:0 output; Fix clock-rate updates
 * vmwgfx: Implement GEM support; Implement GL 4.3 support
The following changes since commit 244a36e50da05c33b860d20638ee4628017a5334:

  drm/vc4: kms: Wait for the commit before increasing our clock rate (2021-12-15 12:10:50 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-12-16

for you to fetch changes up to 9758ff2fa240173e9a45613b07774b7a78b7653e:

  Merge drm/drm-next into drm-misc-next (2021-12-16 14:48:27 +0100)

----------------------------------------------------------------
drm-misc-next for 5.17:

UAPI Changes:

 * vmwgfx: Version bump to 2.20

Cross-subsystem Changes:

 * of: Create simple-framebuffer devices in of_platform_default_init()

Core Changes:

 * Replace include <linux/kernel.h> with more fine-grained includes
 * Document DRM_IOCTL_MODE_GETFB2
 * format-helper: Support XRGB2101010 source buffers

Driver Changes:

 * amdgpu: Fix runtime PM on some configs
 * ast: Fix I2C initialization
 * bridge: ti-sn65dsi86: Set regmap max_register
 * panel: Add Team Source Display TST043015CMHX plus DT bindings
 * simpledrm: Add support for Apple M1
 * sprd: Add various drivers plus DT bindings
 * vc4: Support 10-bit YUV 4:2:0 output; Fix clock-rate updates
 * vmwgfx: Implement GEM support; Implement GL 4.3 support

----------------------------------------------------------------
Andy Shevchenko (1):
      drm: Replace kernel.h with the necessary inclusions

Christian König (1):
      drm/amdgpu: don't skip runtime pm get on A+A config

Dave Stevenson (3):
      drm/fourcc: Add packed 10bit YUV 4:2:0 format
      drm/vc4: plane: Add support for DRM_FORMAT_P030
      drm/vc4: plane: Add support for YUV color encodings and ranges

Hector Martin (3):
      of: Move simple-framebuffer device handling from simplefb to of
      drm/format-helper: Add drm_fb_xrgb8888_to_xrgb2101010_toio()
      drm/simpledrm: Add [AX]RGB2101010 formats

Kevin Tang (6):
      dt-bindings: display: add Unisoc's drm master bindings
      drm/sprd: add Unisoc's drm kms master
      dt-bindings: display: add Unisoc's dpu bindings
      drm/sprd: add Unisoc's drm display controller driver
      dt-bindings: display: add Unisoc's mipi dsi controller bindings
      drm/sprd: add Unisoc's drm mipi dsi&dphy driver

Marek Vasut (5):
      dt-bindings: display: bridge: lvds-codec: Document pixel data sampling edge select
      drm/bridge: lvds-codec: Add support for pixel data sampling edge select
      dt-bindings: Add Team Source Display Technology vendor prefix
      dt-bindings: display: simple: Add Team Source Display TST043015CMHX panel
      drm/panel: simple: Add Team Source Display TST043015CMHX panel

Roland Scheidegger (2):
      drm/vmwgfx: support SVGA_3D_CMD_DX_DEFINE_RASTERIZER_STATE_V2 command
      drm/vmwgfx: add support for updating only offsets of constant buffers

Simon Ser (1):
      drm: document DRM_IOCTL_MODE_GETFB2

Stephen Boyd (1):
      drm/bridge: ti-sn65dsi86: Set max register for regmap

Thomas Zimmermann (4):
      drm/ast: Handle failed I2C initialization gracefully
      drm/ast: Convert I2C code to managed cleanup
      drm/ast: Move I2C code into separate source file
      Merge drm/drm-next into drm-misc-next

Zack Rusin (10):
      drm/vmwgfx: Remove the dedicated memory accounting
      drm/vmwgfx: Add a debug callback to mobid resource manager
      drm/vmwgfx: Stop hardcoding the PCI ID
      drm/vmwgfx: Implement DRIVER_GEM
      drm/vmwgfx: Implement create_handle on drm_framebuffer_funcs
      drm/vmwgfx: Update device headers for GL43
      drm/vmwgfx: support 64 UAVs
      drm/vmwgfx: Allow checking for gl43 contexts
      drm/vmwgfx: Remove usage of MOBFMT_RANGE
      drm/vmwgfx: Bump the minor version

 .../bindings/display/bridge/lvds-codec.yaml        |   18 +
 .../bindings/display/panel/panel-simple.yaml       |    2 +
 .../display/sprd/sprd,display-subsystem.yaml       |   64 ++
 .../bindings/display/sprd/sprd,sharkl3-dpu.yaml    |   77 ++
 .../display/sprd/sprd,sharkl3-dsi-host.yaml        |   88 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |    3 -
 drivers/gpu/drm/ast/Makefile                       |    2 +-
 drivers/gpu/drm/ast/ast_drv.h                      |    3 +
 drivers/gpu/drm/ast/ast_i2c.c                      |  152 +++
 drivers/gpu/drm/ast/ast_mode.c                     |  151 +--
 drivers/gpu/drm/bridge/lvds-codec.c                |   15 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |    1 +
 drivers/gpu/drm/drm_format_helper.c                |   64 ++
 drivers/gpu/drm/drm_fourcc.c                       |    3 +
 drivers/gpu/drm/panel/panel-simple.c               |   30 +
 drivers/gpu/drm/sprd/Kconfig                       |   13 +
 drivers/gpu/drm/sprd/Makefile                      |    8 +
 drivers/gpu/drm/sprd/megacores_pll.c               |  305 ++++++
 drivers/gpu/drm/sprd/sprd_dpu.c                    |  880 ++++++++++++++++
 drivers/gpu/drm/sprd/sprd_dpu.h                    |  109 ++
 drivers/gpu/drm/sprd/sprd_drm.c                    |  205 ++++
 drivers/gpu/drm/sprd/sprd_drm.h                    |   19 +
 drivers/gpu/drm/sprd/sprd_dsi.c                    | 1073 ++++++++++++++++++++
 drivers/gpu/drm/sprd/sprd_dsi.h                    |  126 +++
 drivers/gpu/drm/tiny/simpledrm.c                   |    4 +-
 drivers/gpu/drm/vc4/vc4_bo.c                       |    2 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |  198 +++-
 drivers/gpu/drm/vc4/vc4_regs.h                     |   19 +-
 drivers/gpu/drm/vmwgfx/Kconfig                     |    1 +
 drivers/gpu/drm/vmwgfx/Makefile                    |    3 +-
 drivers/gpu/drm/vmwgfx/device_include/svga3d_cmd.h |    6 +-
 .../gpu/drm/vmwgfx/device_include/svga3d_devcaps.h |   10 +-
 drivers/gpu/drm/vmwgfx/device_include/svga3d_dx.h  |   12 +-
 .../gpu/drm/vmwgfx/device_include/svga3d_limits.h  |    8 +-
 drivers/gpu/drm/vmwgfx/device_include/svga3d_reg.h |    6 +-
 .../gpu/drm/vmwgfx/device_include/svga3d_types.h   |    7 +-
 .../gpu/drm/vmwgfx/device_include/svga_escape.h    |    6 +-
 .../gpu/drm/vmwgfx/device_include/svga_overlay.h   |    6 +-
 drivers/gpu/drm/vmwgfx/device_include/svga_reg.h   |   14 +-
 drivers/gpu/drm/vmwgfx/ttm_memory.c                |  586 -----------
 drivers/gpu/drm/vmwgfx/ttm_memory.h                |   92 --
 drivers/gpu/drm/vmwgfx/ttm_object.c                |  150 +--
 drivers/gpu/drm/vmwgfx/ttm_object.h                |   56 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c            |   45 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.h            |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |  580 +++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c         |   19 -
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c            |   30 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c            |   26 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   47 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |  128 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |   82 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c                 |   13 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |   43 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |  294 ++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |   16 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c              |    3 +
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   45 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |    1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c                |   13 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c            |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c         |   20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_prime.c              |    1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |   17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |   10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c             |   91 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_simple_resource.c    |   29 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_so.c                 |   21 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_so.h                 |    6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c       |   21 -
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |  158 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |   77 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c           |   74 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_va.c                 |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c         |   13 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h         |   46 -
 drivers/of/platform.c                              |    4 +
 drivers/video/fbdev/simplefb.c                     |   21 +-
 include/drm/drm_format_helper.h                    |    3 +
 include/drm/drm_gem_ttm_helper.h                   |    2 +-
 include/drm/drm_gem_vram_helper.h                  |    2 +-
 include/drm/drm_mm.h                               |    4 +-
 include/uapi/drm/drm.h                             |   18 +
 include/uapi/drm/drm_fourcc.h                      |   11 +
 include/uapi/drm/vmwgfx_drm.h                      |    1 +
 89 files changed, 4314 insertions(+), 2333 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
 create mode 100644 drivers/gpu/drm/ast/ast_i2c.c
 create mode 100644 drivers/gpu/drm/sprd/Kconfig
 create mode 100644 drivers/gpu/drm/sprd/Makefile
 create mode 100644 drivers/gpu/drm/sprd/megacores_pll.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.h
 delete mode 100644 drivers/gpu/drm/vmwgfx/ttm_memory.c
 delete mode 100644 drivers/gpu/drm/vmwgfx/ttm_memory.h
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
