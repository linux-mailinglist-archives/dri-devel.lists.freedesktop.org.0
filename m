Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B529F67EBC4
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 17:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C77B10E9AE;
	Fri, 27 Jan 2023 16:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6768410E9D1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 16:58:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 123EF2B3;
 Fri, 27 Jan 2023 17:58:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674838727;
 bh=9PTWTf19YJbxubAJz6Kjif+FodJxsFNH48/fZGr7OZc=;
 h=Date:From:To:Cc:Subject:From;
 b=FjbXlvqSY6QzR1nbnXnxs6X8udh8oltMN6VqX8MZrJf8EBHtvJqSrsn74HA+8lHuN
 ca3YqmlzOwaTIXQEr7ADcxogZjtCkxBoImymsLV5MXh8ZHZvx5o+cRAX7b5iYjGkSg
 ykPFn+HE3F+yS+4LJe/VNwoqPb3r9aDMHmkj0ttg=
Date: Fri, 27 Jan 2023 18:58:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [GIT PULL FOR v6.3] R-Car DU fixes and improvements
Message-ID: <Y9QCw3SkHm6k1bwJ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Dave, Daniel,

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/drm-next-20230127

for you to fetch changes up to fd228eb0b482cf2e43847fab46d57ba7b06c6d48:

  drm: rcar-du: Stop accessing non-existent registers on gen4 (2023-01-24 00:41:13 +0200)

Note that the changes to the DU driver depend on changes to the VSP1
driver, usually merged through the media tree. As there are no
conflicting changes for v6.3, Mauro has agreed that the simplest option
is to merge this all through a single tree and acked the first five
commits in this branch. They are based directly on top of v6.2-rc1 (and
pushed to the next/media/vsp/formats branch in the same repository), and
can thus be merged in the media tree as well should the need arise at
the last minute without creating any conflict.

----------------------------------------------------------------
Renesas R-Car DU fixes and improvements

----------------------------------------------------------------
Koji Matsuoka (1):
      drm: rcar-du: lvds: Fix stop sequence

Peter Robinson (1):
      drm: rcar-du: Depend on DRM_RCAR_DU for components on that SoC

Tomi Valkeinen (17):
      media: Add 2-10-10-10 RGB formats
      media: Add Y210, Y212 and Y216 formats
      media: renesas: vsp1: Change V3U to be gen4
      media: renesas: vsp1: Add V4H SoC version
      media: renesas: vsp1: Add new formats (2-10-10-10 ARGB, Y210, Y212)
      drm: rcar-du: Bump V3U to gen 4
      drm: rcar-du: Add new formats (2-10-10-10 ARGB, Y210)
      dt-bindings: display: renesas,du: Provide bindings for r8a779g0
      dt-bindings: display: bridge: renesas,dsi-csi2-tx: Add r8a779g0
      drm: rcar-du: Add r8a779g0 support
      drm: rcar-du: dsi: Add r8A779g0 support
      drm: rcar-du: dsi: Add 'select RESET_CONTROLLER'
      drm: rcar-du: lvds: Add runtime PM
      drm: rcar-du: lvds: Add reset control
      drm: rcar-du: Add quirk for H3 ES1.x pclk workaround
      drm: rcar-du: Fix setting a reserved bit in DPLLCR
      drm: rcar-du: Stop accessing non-existent registers on gen4

 .../display/bridge/renesas,dsi-csi2-tx.yaml        |   3 +-
 .../devicetree/bindings/display/renesas,du.yaml    |   2 +
 .../userspace-api/media/v4l/pixfmt-packed-yuv.rst  |  49 +-
 .../userspace-api/media/v4l/pixfmt-rgb.rst         | 194 ++++++++
 drivers/gpu/drm/rcar-du/Kconfig                    |   6 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |  39 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  73 ++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c            |  26 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  30 ++
 drivers/gpu/drm/rcar-du/rcar_du_regs.h             |   8 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |  50 ++-
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |  92 +++-
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c            | 497 +++++++++++++++------
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h       |   6 +-
 drivers/media/platform/renesas/vsp1/vsp1_drv.c     |   4 +-
 drivers/media/platform/renesas/vsp1/vsp1_hgo.c     |   4 +-
 drivers/media/platform/renesas/vsp1/vsp1_lif.c     |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c    |  18 +
 drivers/media/platform/renesas/vsp1/vsp1_regs.h    |  26 +-
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c     |  64 ++-
 drivers/media/platform/renesas/vsp1/vsp1_video.c   |   4 +-
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c     |   4 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   6 +
 include/uapi/linux/videodev2.h                     |  11 +
 25 files changed, 1034 insertions(+), 185 deletions(-)


-- 
Regards,

Laurent Pinchart
