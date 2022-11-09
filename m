Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9E0622E68
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 15:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A3410E11F;
	Wed,  9 Nov 2022 14:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1081810E11F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:52:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7966B896;
 Wed,  9 Nov 2022 15:52:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668005549;
 bh=o8xarxrIpjH4b+MXSLbl3TgFUdtrSawraOqeelQykM4=;
 h=Date:From:To:Cc:Subject:From;
 b=mq6kNDkIx+xW6cDkl9aVz5chQ46Pnn+hIjng+k4sJ2/kbkXtWdfjzVCIaB2PBSwYK
 Wu/ovZPlS1C/eJxD1z47/vS/y4Pl4y9wC2aVNvU/kKdDsTd2poH2vHxk9YNPUA7142
 OITdp2+2uVMbzqVe0sxKVDKg/KY9xe0ZPEAH7QfI=
Date: Wed, 9 Nov 2022 16:52:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Subject: [GIT PULL FOR v6.2] Renesas and Xilinx changes
Message-ID: <Y2u+mhkPJQ4de3q5@pendragon.ideasonboard.com>
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
Cc: dri-devel@lists.freedesktop.org, Nathan Huckleberry <nhuck@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel, Dave,

The following changes since commit a143bc517bf31c4575191efbaac216a11ec016e0:

  Merge branch '00.06-gr-ampere' of https://gitlab.freedesktop.org/skeggsb/nouveau into drm-next (2022-11-09 11:18:56 +1000)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/drm-next-20221109

for you to fetch changes up to cec9e59cae6071e58140baf54e47c00aaa39851b:

  drm: xlnx: Fix return type of zynqmp_dp_bridge_mode_valid (2022-11-09 16:50:21 +0200)

----------------------------------------------------------------
- Renesas RZ/G2L DSI support
- Renesas DU Kconfig cleanup
- Xilinx DPSUB fix

----------------------------------------------------------------
Biju Das (3):
      dt-bindings: display: bridge: Document RZ/G2L MIPI DSI TX bindings
      drm: rcar-du: Add RZ/G2L DSI driver
      drm: rcar-du: rzg2l_mipi_dsi: Enhance device lanes check

Laurent Pinchart (1):
      drm: rcar-du: Drop leftovers dependencies from Kconfig

Nathan Huckleberry (1):
      drm: xlnx: Fix return type of zynqmp_dp_bridge_mode_valid

 .../bindings/display/bridge/renesas,dsi.yaml       | 182 +++++
 drivers/gpu/drm/rcar-du/Kconfig                    |  10 +-
 drivers/gpu/drm/rcar-du/Makefile                   |   2 +
 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c           | 816 +++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h      | 151 ++++
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |   7 +-
 6 files changed, 1163 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c

-- 
Regards,

Laurent Pinchart
