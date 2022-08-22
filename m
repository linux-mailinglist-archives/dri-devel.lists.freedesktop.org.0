Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3349B59C1B2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 16:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307DE90EAF;
	Mon, 22 Aug 2022 14:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A6B90E13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 14:35:08 +0000 (UTC)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 705E22B3;
 Mon, 22 Aug 2022 16:35:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661178906;
 bh=CMR8Dp1YN5eauuu52E5A1UUWFfjio2SLf2OkZTJpvhY=;
 h=From:To:Cc:Subject:Date:From;
 b=YnlULzN293EMizzW3ToHZSOc2kvDGxVJajbA/KEBVj8w0+ZQOTtwRt8CReOX5aIv0
 KPSACkRMOzfYioCeCWNqU0thOvUlEdyZ75RFacwgrA/itTkoTwwiAzNVIfDTPHLoFN
 cMGujVsPxgWORAauddUkryk9D/fwJsRkxWL9FDkM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/5] drm: rcar-du: DSI fixes
Date: Mon, 22 Aug 2022 17:33:56 +0300
Message-Id: <20220822143401.135081-1-tomi.valkeinen@ideasonboard.com>
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

Changes to v2:

- Move the LVDS patch to the beginning and improve the patch desc.
- Write 0 to registers in rcar_mipi_dsi_shutdown instead of just
  clearing a bit.
- Fix function names in "fix DSI enable & disable sequence" patch desc.
- Add "drm: rcar-du: dsi: Fix VCLKSET write"

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
 drivers/gpu/drm/rcar-du/rcar_lvds.c       |  4 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.h       | 10 ++--
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c   | 71 ++++++++++++++++++++---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h   | 31 ++++++++++
 7 files changed, 135 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h

-- 
2.34.1

