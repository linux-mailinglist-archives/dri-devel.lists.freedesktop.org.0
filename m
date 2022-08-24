Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CF459FA5C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 14:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31152112D41;
	Wed, 24 Aug 2022 12:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADCC112584
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 12:47:38 +0000 (UTC)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FC5E2B3;
 Wed, 24 Aug 2022 14:47:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661345256;
 bh=jmXMBiW2sAdBb7wHcyIWSm1ZxeHbRx5C7F49bqeOB2I=;
 h=From:To:Cc:Subject:Date:From;
 b=dzNqVvfArpr05Ky8ed9MvCJ+Rxe6iyNwKomWeb3NM559Ot5pUlKvRM5NNfS9i0BZH
 ikE7+Z8+WACR+ouU9EQBSC6kStk/eab/iP9OxO75FJKddmqe3jODRgBvZnxO/8k6SX
 qrjW05EKcHlUVEfIh5gCnw2zC3avMu/iDCEPyzC0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 0/5] drm: rcar-du: DSI fixes
Date: Wed, 24 Aug 2022 15:47:21 +0300
Message-Id: <20220824124726.187224-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes to v3:
- Fix LVDS function renames wrt. export symbol.
- Fix missing static inline
- Use rcar_mipi_dsi_write for VCLKSET writes

 Tomi

Tomi Valkeinen (5):
  drm: rcar-du: lvds: Rename pclk enable/disable functions
  drm: rcar-du: dsi: Properly stop video mode TX
  drm: rcar-du: dsi: Improve DSI shutdown
  drm: rcar-du: fix DSI enable & disable sequence
  drm: rcar-du: dsi: Fix VCLKSET write

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 30 +++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h     |  2 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  4 ++
 drivers/gpu/drm/rcar-du/rcar_lvds.c       |  8 +--
 drivers/gpu/drm/rcar-du/rcar_lvds.h       | 10 ++--
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c   | 68 ++++++++++++++++++++---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h   | 31 +++++++++++
 7 files changed, 135 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h

-- 
2.34.1

