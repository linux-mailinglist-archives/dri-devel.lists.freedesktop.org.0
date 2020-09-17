Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C2426D085
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 03:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AAB6EB73;
	Thu, 17 Sep 2020 01:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A876EB73
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 01:21:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40360276;
 Thu, 17 Sep 2020 03:21:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1600305689;
 bh=qA+L9X7VsKmBKyD7nDs9/cepua7b6rG6CVKurJUmCCU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QJcrQuRn1cWgGRL5sV+xH2EJ5pvUvc65pepfBR2TyuxxqnQATg2dxcqdvnOsrh0jX
 b8JRO4rFGNyerRmFgQ2tzD4ZLAwVOUR6I225rICEKhRtd9wB265kY0MdudO5ZyvFLV
 yzuUA4vwNhl8Fh63jf8TBPKZhkVrq6P9SSIGhTP4=
Date: Thu, 17 Sep 2020 04:20:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [GIT PULL FOR v5.10 - v2] R-Car display drivers miscellaneous changes
Message-ID: <20200917012059.GU3853@pendragon.ideasonboard.com>
References: <20200908160336.GA20954@pendragon.ideasonboard.com>
 <20200915175730.GA28219@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915175730.GA28219@pendragon.ideasonboard.com>
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

As the original pull request hasn't been pulled yet, here's an updated
version that collects more acks and rb's, and includes an additional
patch.

The following changes since commit 818280d5adf1d80e78f95821815148abe9407e14:

  Merge v5.9-rc5 into drm-next (2020-09-14 17:19:11 +0200)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/du-next-20200917

for you to fetch changes up to ab00111864ee2c9742f6627c5ca1019730c0eedd:

  drm: rcar-du: Put reference to VSP device (2020-09-17 03:42:17 +0300)

----------------------------------------------------------------
Miscellaneous R-Car display driver changes:

- R8A7742, R8A774E1 and R8A77961 support
- Fixes for pitch of YUV planar formats, non-visible plane handling and
  VSP device reference count
- Kconfig fix to avoid displaying disabled options in .config

----------------------------------------------------------------
Biju Das (2):
      dt-bindings: display: bridge: lvds-codec: Document power-supply property
      drm/bridge: lvds-codec: Add support for regulator

Kuninori Morimoto (4):
      dt-bindings: display: renesas: du: Document the r8a77961 bindings
      dt-bindings: display: renesas: dw-hdmi: Tidyup example compatible
      dt-bindings: display: renesas: dw-hdmi: Add R8A77961 support
      drm: rcar-du: Add r8a77961 support

Lad Prabhakar (5):
      dt-bindings: display: renesas,du: Document the r8a7742 bindings
      drm: rcar-du: Add r8a7742 support
      dt-bindings: display: renesas,lvds: Document r8a7742 bindings
      drm: rcar-du: lvds: Add r8a7742 support
      drm: rcar-du: Update description for DRM_RCAR_DW_HDMI Kconfig entry

Laurent Pinchart (3):
      drm: rcar-du: Fix pitch handling for fully planar YUV formats
      drm: rcar-du: Fix crash when enabling a non-visible plane
      drm: rcar-du: Put reference to VSP device

Marian-Cristian Rotariu (5):
      dt-bindings: display: renesas,du: Document r8a774e1 bindings
      drm: rcar-du: Add support for R8A774E1 SoC
      dt-bindings: display: renesas,lvds: Document r8a774e1 bindings
      dt-bindings: display: renesas,dw-hdmi: Add r8a774e1 support
      drm: rcar-du: lvds: Add support for R8A774E1 SoC

Qian Cai (1):
      drm: rcar-du: Make DRM_RCAR_WRITEBACK depends on DRM_RCAR_DU

 .../bindings/display/bridge/lvds-codec.yaml        |  3 ++
 .../bindings/display/bridge/renesas,dw-hdmi.txt    |  4 +-
 .../bindings/display/bridge/renesas,lvds.yaml      |  2 +
 .../devicetree/bindings/display/renesas,du.txt     |  6 +++
 drivers/gpu/drm/bridge/lvds-codec.c                | 29 ++++++++++++
 drivers/gpu/drm/rcar-du/Kconfig                    |  5 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              | 37 ++++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              | 54 +++++++++++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_kms.h              |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              | 14 +++++-
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |  2 +
 11 files changed, 149 insertions(+), 8 deletions(-)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
