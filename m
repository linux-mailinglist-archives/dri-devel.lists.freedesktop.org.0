Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE4B2EA4FA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 06:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCED89E50;
	Tue,  5 Jan 2021 05:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFB789E50
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 05:42:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C11183D7;
 Tue,  5 Jan 2021 06:42:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1609825325;
 bh=9Q8w6h31ZNfLk80hxRpvRIMufjXuiWPHRXEXj8VfiK4=;
 h=Date:From:To:Cc:Subject:From;
 b=wqMqKzxKIKikOtSNgtml3cnLZkpLxeUFCSPBqX7iwugZZwDY9NBApgG2oo9sh58Cp
 myXURpSVZRKlcETnLVtvSyyKLj3d+RvSZhd+VwmYR+NEnGj8xp4g6CzxUjwwJ+1Q2p
 3zU/gx7bTR5TdhUWDQsReFwHEHp+IEccYnp9+1Zw=
Date: Tue, 5 Jan 2021 07:41:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [GIT PULL FOR v5.12] R-Car DU and misc other changes
Message-ID: <X/P8IOrVXkTpLeCm@pendragon.ideasonboard.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

The following changes since commit 5b2fc08c455bbf749489254a81baeffdf4c0a693:

  Merge tag 'amd-drm-fixes-5.11-2020-12-23' of git://people.freedesktop.org/~agd5f/linux into drm-next (2020-12-24 10:31:16 +1000)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/du-next-20210105

for you to fetch changes up to 3fc5a284213d5fca1c0807ea8725355d39808930:

  drm: bridge: adv7511: Remove redundant null check before clk_disable_unprepare (2021-01-05 07:20:42 +0200)

----------------------------------------------------------------
- Add default modes for connectors in unknown state
- R-Car DU conversion to DRM-managed API
- R-Car DU miscellaneous fixes
- Miscellaneous bridge and bridge bindings fixes
- Assorted misc driver cleanups
- Constify drm_driver for PCI devices

----------------------------------------------------------------
Fabrizio Castro (1):
      dt-bindings: display: bridge: renesas,lvds: RZ/G2E needs renesas,companion too

Laurent Pinchart (20):
      dt-bindings: display: bridge: thc63lvd1024: Document dual-output mode
      drm: Add default modes for connectors in unknown state
      drm: rcar-du: Fix crash when using LVDS1 clock for CRTC
      drm: rcar-du: Release vsp device reference in all error paths
      drm: rcar-du: Drop unneeded encoder cleanup in error path
      drm: rcar-du: Use DRM-managed allocation for VSP planes
      drm: rcar-du: Use DRM-managed allocation for encoders
      drm: rcar-du: Embed drm_device in rcar_du_device
      drm: rcar-du: Replace dev_private with container_of
      drm: rcar-du: Skip encoder allocation for LVDS1 in dual-link mode
      drm: rcar-du: Drop local encoder variable
      drm: rcar-du: Fix leak of CMM platform device reference
      drm: arc: Remove unnecessary drm_plane_cleanup() wrapper
      drm: sti: Remove unnecessary drm_plane_cleanup() wrapper
      drm: vc4: Remove unnecessary drm_plane_cleanup() wrapper
      drm: zte: Remove unnecessary drm_plane_cleanup() wrapper
      drm: Don't export the drm_gem_dumb_destroy() function
      drm: Move legacy device list out of drm_driver
      drm: Use a const drm_driver for legacy PCI devices
      drm: Constify drm_driver in drivers that don't modify it

Mark Brown (1):
      drm/bridge: thc63lvd1024: Fix regulator_get_optional() misuse

Qinglang Miao (1):
      drm: rcar-du: Fix PM reference leak in rcar_cmm_enable()

Wang Xiaojun (1):
      drm: rcar-du: Fix the return check of of_parse_phandle and of_find_device_by_node

Xu Wang (2):
      drm: bridge: dw-hdmi: Remove redundant null check before clk_disable_unprepare
      drm: bridge: adv7511: Remove redundant null check before clk_disable_unprepare

 .../bindings/display/bridge/renesas,lvds.yaml      |  6 +-
 .../display/bridge/thine,thc63lvd1024.yaml         | 16 ++--
 drivers/gpu/drm/arc/arcpgu_crtc.c                  |  9 +-
 drivers/gpu/drm/arc/arcpgu_drv.c                   |  2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  6 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  6 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c              |  2 +-
 drivers/gpu/drm/drm_drv.c                          |  4 -
 drivers/gpu/drm/drm_dumb_buffers.c                 |  8 +-
 drivers/gpu/drm/drm_gem.c                          | 12 +--
 drivers/gpu/drm/drm_internal.h                     |  3 +
 drivers/gpu/drm/drm_pci.c                          | 33 +++++---
 drivers/gpu/drm/drm_probe_helper.c                 |  3 +-
 drivers/gpu/drm/kmb/kmb_drv.c                      |  2 +-
 drivers/gpu/drm/rcar-du/rcar_cmm.c                 |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             | 12 +--
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              | 33 +++-----
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              | 16 ++--
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          | 98 +++++++++++-----------
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h          |  2 -
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              | 42 +++++++---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c            |  8 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              | 28 +++++--
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |  2 +-
 drivers/gpu/drm/sti/sti_cursor.c                   |  9 +-
 drivers/gpu/drm/sti/sti_gdp.c                      |  9 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                    |  9 +-
 drivers/gpu/drm/tdfx/tdfx_drv.c                    |  2 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |  7 +-
 drivers/gpu/drm/zte/zx_plane.c                     |  7 +-
 include/drm/drm_device.h                           | 14 +---
 include/drm/drm_drv.h                              |  2 -
 include/drm/drm_gem.h                              |  3 -
 include/drm/drm_legacy.h                           | 10 ++-
 include/drm/drm_modeset_helper_vtables.h           |  8 +-
 35 files changed, 209 insertions(+), 226 deletions(-)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
