Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C4D671953
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 11:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA9210E6F9;
	Wed, 18 Jan 2023 10:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A86B10E53C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 13:52:14 +0000 (UTC)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BB7610C;
 Tue, 17 Jan 2023 14:52:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1673963532;
 bh=lyUcANRABK69vbSFcbUhit+KV1oo6VY/L0p8cElZ9HM=;
 h=From:To:Cc:Subject:Date:From;
 b=Af/Ez5FiYVvNXJVxTSDbw1AM066zrquKJ45tIjNnvCAYkRbn1EVYFpiv6RQ/oN6QE
 hACg+FOIC3lA3L/95NIHRUQJFGwn3hOiWGFxUw1BV9Vst6uTseRkmasdKPZzq2A8Tn
 dtZRZqSCubLUceoHGcm4MBym3/v1GVWzpEC6RqD0=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/6] drm: rcar-du: Misc patches
Date: Tue, 17 Jan 2023 15:51:48 +0200
Message-Id: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 18 Jan 2023 10:42:12 +0000
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

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Hi,

Here are some small rcar-du patches based on commits in the Renesas BSP
tree.

 Tomi

Koji Matsuoka (2):
  drm: rcar-du: lvds: Add reset control
  drm: rcar-du: Fix LVDS stop sequence

Tomi Valkeinen (4):
  drm: rcar-du: dsi: add 'select RESET_CONTROLLER'
  drm: rcar-du: Add quirk for H3 ES1 pclk WA
  drm: rcar-du: Fix setting a reserved bit in DPLLCR
  drm: rcar-du: Stop accessing non-existant registers on gen4

 drivers/gpu/drm/rcar-du/Kconfig         |  2 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 28 +++++++------
 drivers/gpu/drm/rcar-du/rcar_du_drv.c   | 52 ++++++++++++++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h   |  2 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c |  6 ++-
 drivers/gpu/drm/rcar-du/rcar_du_regs.h  |  3 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c     | 42 +++++++++++++++++++-
 7 files changed, 118 insertions(+), 17 deletions(-)

-- 
2.34.1

