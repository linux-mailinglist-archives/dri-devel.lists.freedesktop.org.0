Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB73B90E83D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 12:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1D810EC14;
	Wed, 19 Jun 2024 10:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="apuU+xC6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876CF10EC10
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 10:22:40 +0000 (UTC)
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it
 [93.61.96.190])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 401FF541;
 Wed, 19 Jun 2024 12:22:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1718792540;
 bh=kWppy7kzX76ZP+Kpg/QDqihgHRN9nqTNMekCt0x6Qoc=;
 h=From:To:Cc:Subject:Date:From;
 b=apuU+xC623Yzch46x/LoqJVld3VZqht11mIPwt5GBZFBH9OK5Yp0/JG1U/71plxZo
 /zER3ayrwrHGTmjZ5Gig3bcb0RiRTgjlP47noeMhP5M9AFIZQZfUjbYDREnvCiSbDB
 lJtuX3+Ei5XwrbLfoU9jvTzUuUCXVqiu/9olJq4s=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS R-CAR),
 linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS R-CAR)
Subject: [PATCH 0/4] drm: rcar-du: Add support for R8A779H0
Date: Wed, 19 Jun 2024 12:22:14 +0200
Message-ID: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series upports from Renesas BSP at revision rcar-5.2.0.rc18 the initial
display support for the V4M SoC (R8A779H0).

The series includes two small bugfixes and then adds support for the
V4M SoC to the R-Car DU module and R-Car DSI encoder.

Compile-tested only as I don't have a Gray Hawk board available yet.
Once the board will be available, DTS integration will follow.

Jacopo Mondi (2):
  drm: rcar-mipi-dsi: Add support for R8A779H0
  drm: rcar-du: Add support for R8A779H0

Phong Hoang (1):
  drm: ti-sn65dsi86: Check bridge connection failure

Takeshi Kihara (1):
  drm: rcar-mipi-dsi: Fix CLOCKSET1_LOCK definition

 .../display/bridge/renesas,dsi-csi2-tx.yaml    |  1 +
 .../bindings/display/renesas,du.yaml           |  1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c          |  6 +++++-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c  | 18 ++++++++++++++++++
 .../gpu/drm/renesas/rcar-du/rcar_du_group.c    | 17 ++++++++++++-----
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |  1 +
 .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h   |  3 +--
 7 files changed, 39 insertions(+), 8 deletions(-)

--
2.45.2

