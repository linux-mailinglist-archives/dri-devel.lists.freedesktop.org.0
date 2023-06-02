Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B6A72002D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 13:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AFA10E660;
	Fri,  2 Jun 2023 11:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155E010E660
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 11:15:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126156168104.26.openmobile.ne.jp
 [126.156.168.104])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CA9C6E0;
 Fri,  2 Jun 2023 13:14:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1685704484;
 bh=q64qr64KUSmU43FApltBPnedseIkYdVM3/12pYfS37c=;
 h=Date:From:To:Cc:Subject:From;
 b=kpZ2w8T96wUC3bxqPPmeAPyR//cXFDaFDP2XqaWK1G6N9UbcRvHL5uf8mQE5/68f4
 jjDc61r0Yig+toyKRNE1q5xhxRhn06l9e1Lw3c7LXl1L3gU5faSZxjlN2n8I+IcEz2
 TcWIIbNFd3QWumsddjGSkAgvEwLIes+KrH08oOu8=
Date: Fri, 2 Jun 2023 14:15:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL FOR v6.5] drm: rcar-du: Miscellaneous changes
Message-ID: <20230602111504.GA24855@pendragon.ideasonboard.com>
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
Cc: Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

The following changes since commit 85d712f033d23bb56a373e29465470c036532d46:

  Merge tag 'drm-intel-gt-next-2023-05-24' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-05-29 06:21:51 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/drm-next-20230529

for you to fetch changes up to 11696c5e89245a1d360f75be3dfc4960b25a265a:

  drm: Place Renesas drivers in a separate dir (2023-05-29 16:41:03 +0300)

----------------------------------------------------------------
Renesas DRM/KMS drivers:

- Group drivers in renesas subdirectory to prepare for new platform
- Drop deprecated R-Car H3 ES1.x support

----------------------------------------------------------------
Biju Das (1):
      drm: Place Renesas drivers in a separate dir

Wolfram Sang (1):
      drm: rcar-du: remove R-Car H3 ES1.* workarounds

 MAINTAINERS                                        |  3 +-
 drivers/gpu/drm/Kconfig                            |  4 +-
 drivers/gpu/drm/Makefile                           |  3 +-
 drivers/gpu/drm/renesas/Kconfig                    |  4 ++
 drivers/gpu/drm/renesas/Makefile                   |  4 ++
 drivers/gpu/drm/{ => renesas}/rcar-du/Kconfig      |  0
 drivers/gpu/drm/{ => renesas}/rcar-du/Makefile     |  0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_cmm.c   |  0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_cmm.h   |  0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_du_crtc.c   | 37 ++---------------
 .../gpu/drm/{ => renesas}/rcar-du/rcar_du_crtc.h   |  0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_du_drv.c    | 48 ----------------------
 .../gpu/drm/{ => renesas}/rcar-du/rcar_du_drv.h    |  2 -
 .../drm/{ => renesas}/rcar-du/rcar_du_encoder.c    |  0
 .../drm/{ => renesas}/rcar-du/rcar_du_encoder.h    |  0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_du_group.c  |  0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_du_group.h  |  0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_du_kms.c    |  0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_du_kms.h    |  0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_du_plane.c  |  0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_du_plane.h  |  0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_du_regs.h   |  3 +-
 .../gpu/drm/{ => renesas}/rcar-du/rcar_du_vsp.c    |  0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_du_vsp.h    |  0
 .../drm/{ => renesas}/rcar-du/rcar_du_writeback.c  |  0
 .../drm/{ => renesas}/rcar-du/rcar_du_writeback.h  |  0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_dw_hdmi.c   |  0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_lvds.c  |  0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_lvds.h  |  0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_lvds_regs.h |  0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_mipi_dsi.c  |  0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_mipi_dsi.h  |  0
 .../drm/{ => renesas}/rcar-du/rcar_mipi_dsi_regs.h |  0
 .../gpu/drm/{ => renesas}/rcar-du/rzg2l_mipi_dsi.c |  0
 .../{ => renesas}/rcar-du/rzg2l_mipi_dsi_regs.h    |  0
 drivers/gpu/drm/{ => renesas}/shmobile/Kconfig     |  0
 drivers/gpu/drm/{ => renesas}/shmobile/Makefile    |  0
 .../{ => renesas}/shmobile/shmob_drm_backlight.c   |  0
 .../{ => renesas}/shmobile/shmob_drm_backlight.h   |  0
 .../drm/{ => renesas}/shmobile/shmob_drm_crtc.c    |  0
 .../drm/{ => renesas}/shmobile/shmob_drm_crtc.h    |  0
 .../gpu/drm/{ => renesas}/shmobile/shmob_drm_drv.c |  0
 .../gpu/drm/{ => renesas}/shmobile/shmob_drm_drv.h |  0
 .../gpu/drm/{ => renesas}/shmobile/shmob_drm_kms.c |  0
 .../gpu/drm/{ => renesas}/shmobile/shmob_drm_kms.h |  0
 .../drm/{ => renesas}/shmobile/shmob_drm_plane.c   |  0
 .../drm/{ => renesas}/shmobile/shmob_drm_plane.h   |  0
 .../drm/{ => renesas}/shmobile/shmob_drm_regs.h    |  0
 48 files changed, 15 insertions(+), 93 deletions(-)
 create mode 100644 drivers/gpu/drm/renesas/Kconfig
 create mode 100644 drivers/gpu/drm/renesas/Makefile
 rename drivers/gpu/drm/{ => renesas}/rcar-du/Kconfig (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/Makefile (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_cmm.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_cmm.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_crtc.c (96%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_crtc.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_drv.c (93%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_drv.h (96%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_encoder.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_encoder.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_group.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_group.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_kms.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_kms.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_plane.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_plane.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_regs.h (99%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_vsp.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_vsp.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_writeback.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_writeback.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_dw_hdmi.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_lvds.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_lvds.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_lvds_regs.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_mipi_dsi.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_mipi_dsi.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_mipi_dsi_regs.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rzg2l_mipi_dsi.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rzg2l_mipi_dsi_regs.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/Kconfig (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/Makefile (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_backlight.c (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_backlight.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_crtc.c (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_crtc.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_drv.c (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_drv.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_kms.c (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_kms.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_plane.c (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_plane.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_regs.h (100%)

-- 
Regards,

Laurent Pinchart
