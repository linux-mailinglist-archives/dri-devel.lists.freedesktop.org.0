Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A017846A1D0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 17:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD966FAC2;
	Mon,  6 Dec 2021 16:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339436FAC2
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 16:50:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28F35EE;
 Mon,  6 Dec 2021 17:50:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1638809420;
 bh=IBMMxCVf9/FO+nAIQ9TPYBZAzZ4vcTY/2I7CHk6KnYI=;
 h=Date:From:To:Cc:Subject:From;
 b=Is7CsLrx+zy6fRjWhefFm513fSbZ1ehhXX4a5UpVti3z77yxqJ33mqu+nzH5p0EqM
 kdY5TPTuRyrt9/ylcMjcZgg7rvVyFJ0TFLl73/+8h5OwWaa6UJP02a9cMwIIcdKGGA
 TlukVHlYMCc6t5REls0yrtRwoy5e99HlM8wzRVdI=
Date: Mon, 6 Dec 2021 18:49:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL FOR v5.17] R-Car DU updates
Message-ID: <Ya4/MCeuNf601tL4@pendragon.ideasonboard.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Dave and Daniel,

The following changes since commit c305ae99dfd4d0fe70c7fdf13ef5f7650a804ea7:

  Merge tag 'drm-intel-next-2021-11-30' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2021-12-02 10:28:19 +1000)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/du-next-20211206

for you to fetch changes up to 155358310f013c23c2e5533e007afc7310c9a964:

  drm: rcar-du: Add R-Car DSI driver (2021-12-06 18:19:49 +0200)

----------------------------------------------------------------
R-Car DU updates:

- DSI output support
- Misc fixes

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/rcar: stop using 'imply' for dependencies

Kieran Bingham (2):
      drm: rcar-du: Add DSI support to rcar_du_output_name
      drm: rcar-du: crtc: Support external DSI dot clock

LUU HOAI (1):
      drm: rcar-du: Add R-Car DSI driver

Laurent Pinchart (2):
      drm: rcar-du: Fix CRTC timings when CMM is used
      dt-bindings: display: bridge: Add binding for R-Car MIPI DSI/CSI-2 TX

 .../display/bridge/renesas,dsi-csi2-tx.yaml        | 118 +++
 MAINTAINERS                                        |   1 +
 drivers/gpu/drm/rcar-du/Kconfig                    |  30 +-
 drivers/gpu/drm/rcar-du/Makefile                   |   1 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |  31 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |   6 +-
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c            | 819 +++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h       | 172 +++++
 8 files changed, 1159 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h

-- 
Regards,

Laurent Pinchart
