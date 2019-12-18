Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5582C124B67
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 16:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AB0899B0;
	Wed, 18 Dec 2019 15:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACE1899B0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 15:17:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C515B23;
 Wed, 18 Dec 2019 16:17:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576682241;
 bh=LrsdgnYCPWH+oNG/CqckVngh0X9aJ9U4dXtUjPACSDM=;
 h=Date:From:To:Subject:From;
 b=GrT5N9c988WDA0soqXwHlrBPwWcrptXhBBg0DzKys453aVOqzzTeb/Dim1K7OCS9C
 /YBSaQooxun1CO1sCowP5061Gd6BK5lKF3pkIIQdNKeRk6/UWm6L/bAzJg7ScXAK3c
 vABW/l2sCtsIcwE4SF69+fMhlU2ummoIn4r1E9EQ=
Date: Wed, 18 Dec 2019 17:17:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL FOR v5.6] R-Car DU new features
Message-ID: <20191218151710.GA13830@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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

The following changes since commit d1eef1c619749b2a57e514a3fa67d9a516ffa919:

  Linux 5.5-rc2 (2019-12-15 15:16:08 -0800)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/du-next-20191218

for you to fetch changes up to c267782c5f0efbd20c560101738e68bb30d4fad5:

  drm: rcar-du: Add r8a77980 support (2019-12-18 02:40:29 +0200)

----------------------------------------------------------------
R-Car Display Unit changes:

- Color Management Module support
- LVDS encoder dual-link support enhancements
- R8A77980 support

----------------------------------------------------------------
Fabrizio Castro (4):
      drm: of: Add drm_of_lvds_get_dual_link_pixel_order
      drm: rcar-du: lvds: Improve identification of panels
      drm: rcar-du: lvds: Get dual link configuration from DT
      drm: rcar-du: lvds: Allow for even and odd pixels swap

Geert Uytterhoeven (2):
      dt-bindings: display: renesas: du: Add vendor prefix to vsps property
      drm: rcar-du: Recognize "renesas,vsps" in addition to "vsps"

Jacopo Mondi (6):
      dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
      dt-bindings: display: renesas,du: Document cmms property
      drm: rcar-du: Add support for CMM
      drm: rcar-du: kms: Initialize CMM instances
      drm: rcar-du: crtc: Control CMM operations
      drm: rcar-du: crtc: Register GAMMA_LUT properties

Kieran Bingham (1):
      drm: rcar-du: Add r8a77980 support

Laurent Pinchart (1):
      drm: rcar-du: lvds: Get mode from state

(with all patches properly signed this time)

 .../devicetree/bindings/display/renesas,cmm.yaml   |  67 +++++
 .../devicetree/bindings/display/renesas,du.txt     |  15 +-
 drivers/gpu/drm/drm_of.c                           | 116 ++++++++
 drivers/gpu/drm/rcar-du/Kconfig                    |   8 +
 drivers/gpu/drm/rcar-du/Makefile                   |   1 +
 drivers/gpu/drm/rcar-du/rcar_cmm.c                 | 217 ++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_cmm.h                 |  58 ++++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |  71 +++++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c            |  10 +
 drivers/gpu/drm/rcar-du/rcar_du_group.h            |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  93 +++++-
 drivers/gpu/drm/rcar-du/rcar_du_regs.h             |   5 +
 drivers/gpu/drm/rcar-du/rcar_lvds.c                | 318 +++++++++++----------
 include/drm/drm_of.h                               |  20 ++
 17 files changed, 856 insertions(+), 155 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.yaml
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.h

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
