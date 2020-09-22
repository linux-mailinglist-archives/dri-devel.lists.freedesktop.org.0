Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AE627408A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 13:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195B16E0DC;
	Tue, 22 Sep 2020 11:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4C96E0DC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 11:16:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31AC82D7;
 Tue, 22 Sep 2020 13:15:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1600773359;
 bh=AB6LpVt3gweF2ZFPSu/ONY41VjmIrSE/hLwHAp8UWVY=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=erwx5jFgIbucGaGc14pa6AjaJ+UK2j1gTHfdBf1ItmmoQTOPh68LfpRscfG44Ujp4
 84OtiHyv1ADXzOMQ7aJhq2aZJ8p4QdFzVyj5HhNSuqoM6f82fr6xuSIX5s1207vT2k
 lSZLmDCDu4wVHlevd5Y2a02e3fPbQSKfUI7uj0u8=
Date: Tue, 22 Sep 2020 14:15:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL FOR v5.10 - v3] R-Car display drivers miscellaneous changes
Message-ID: <20200922111526.GG8290@pendragon.ideasonboard.com>
References: <20200908160336.GA20954@pendragon.ideasonboard.com>
 <20200915175730.GA28219@pendragon.ideasonboard.com>
 <20200917012059.GU3853@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917012059.GU3853@pendragon.ideasonboard.com>
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

Still because the original pull request hasn't been pulled yet, here's
an updated version that fixes one small issue. I had initially fixed it
in a separate patch to be merged in the fixes branch for v5.10, but
realized the offending commit wasn't in -next yet.

Is there still time to get this merged in v5.10 ? The originally pull
request was sent two weeks ago and seems to have fallen through the
cracks.

The following changes since commit 818280d5adf1d80e78f95821815148abe9407e14:

  Merge v5.9-rc5 into drm-next (2020-09-14 17:19:11 +0200)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git

for you to fetch changes up to 2a32dbdc2c7db5463483fa01fb220fd1b770c6bc:

  drm: rcar-du: Put reference to VSP device (2020-09-22 14:10:05 +0300)

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
