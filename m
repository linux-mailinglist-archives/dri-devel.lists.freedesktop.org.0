Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 776145383D2
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 17:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449D010EE09;
	Mon, 30 May 2022 15:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50AA10EDEE
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 15:06:10 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1nvgy4-0005Kh-Bh; Mon, 30 May 2022 17:06:04 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <mfe@pengutronix.de>)
 id 1nvgy3-005THt-Hy; Mon, 30 May 2022 17:06:02 +0200
Received: from mfe by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <mfe@pengutronix.de>)
 id 1nvgy1-005Bdu-C5; Mon, 30 May 2022 17:06:01 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: robert.foss@linaro.org, laurent.pinchart@ideasonboard.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org, maxime@cerno.tech
Subject: [PATCH 0/6] TI SN65DSI83 Features
Date: Mon, 30 May 2022 17:05:43 +0200
Message-Id: <20220530150548.1236307-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

the purpose of this small series is to enable the support for the reverse
lane feature and to add support for reset controllers which can drive
the enable pin.

Regards,
  Marco

Marco Felsch (6):
  drm/bridge: ti-sn65dsi83: make lvds lane register setup more readable
  dt-bindings: drm/bridge: ti-sn65dsi83: add documentation for reverse
    lvds lanes
  drm/bridge: ti-sn65dsi83: add support to swap the LVDS data lanes
  drm/bridge: ti-sn65dsi83: make use of dev_err_probe
  dt-bindings: drm/bridge: ti-sn65dsi83: Add reset controller
    documentation
  drm/bridge: ti-sn65dsi83: add support for a external reset controller

 .../bindings/display/bridge/ti,sn65dsi83.yaml | 64 ++++++++++++-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c         | 89 +++++++++++++++++--
 2 files changed, 145 insertions(+), 8 deletions(-)

-- 
2.30.2

