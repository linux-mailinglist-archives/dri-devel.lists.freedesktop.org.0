Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 825A23AE972
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 14:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1245089A20;
	Mon, 21 Jun 2021 12:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97ED989A20
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 12:55:50 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49E995A5;
 Mon, 21 Jun 2021 14:55:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624280149;
 bh=uxH/8tdelbRBModOmtOA6PMpsmgnwIX9TVw63z7W9tU=;
 h=From:To:Cc:Subject:Date:From;
 b=rWB3DfYU09W7VxOwzj/FUpnwrgindMANpl+CGrRZ5xCCu+tyi/MQ+Ut28YDs+MB/I
 HqcbO7Q+0P6Ou+KoJlq9+jMI/ebvVW3KWKWJBvGo9ZhlxX6VzfB9Vx7+s+qbqkKQ0Y
 puvz/jOoBKluXvLmxi/VEA/AOdxe0dDMNm6L0owk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] ti-sn65dsi83: Finalize transition to atomic operations
Date: Mon, 21 Jun 2021 15:55:13 +0300
Message-Id: <20210621125518.13715-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Marek Vasut <marex@denx.de>, Loic Poulain <loic.poulain@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Robert Foss <robert.foss@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Adam Ford <aford173@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch series is based on top of "[PATCH] drm/bridge: ti-sn65dsi83:
Replace connector format patching with atomic_get_input_bus_fmts". It
completes the transition to atomic operations in the ti-sn65dsi83
driver. The main reason for this change is patch 4/5 that fixes a few
issues in the driver (see the patch's commit message for details), but
overall it also brings the driver to the most recent API which is nice
in itself.

Laurent Pinchart (5):
  drm: bridge: ti-sn65dsi83: Move LVDS format selection to .mode_set()
  drm: bridge: ti-sn65dsi83: Pass mode explicitly to helper functions
  drm: bridge: ti-sn65dsi83: Switch to atomic operations
  drm: bridge: ti-sn65dsi83: Retrieve output format from bridge state
  drm: bridge: ti-sn65dsi83: Retrieve the display mode from the state

 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 166 +++++++++++++-------------
 1 file changed, 82 insertions(+), 84 deletions(-)

-- 
Regards,

Laurent Pinchart

