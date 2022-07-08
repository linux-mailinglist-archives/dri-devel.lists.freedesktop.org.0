Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 675A956B6D0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE3910E95F;
	Fri,  8 Jul 2022 10:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6A810E1F8
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 10:08:07 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o9kcD-00022R-Ju; Fri, 08 Jul 2022 11:49:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o9kc5-005827-8I; Fri, 08 Jul 2022 11:49:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o9kc8-003kzk-2C; Fri, 08 Jul 2022 11:49:32 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Icenowy Zheng <icenowy@aosc.io>,
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Robert Chiras <robert.chiras@nxp.com>, Ondrej Jirman <megous@megous.com>
Subject: [PATCH 0/3] drm/mipi-dsi: Make remove callback return void
Date: Fri,  8 Jul 2022 11:49:19 +0200
Message-Id: <20220708094922.1408248-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4262; h=from:subject;
 bh=OVg5FS7U1LBddJj6bD0jYA0EJYWo3+LNPCO+KgTzifc=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBix/2Q9/ZOUbIatbjmwQtUNfLwmVsTvTbcY5mf1YZG
 G7Q2I3mJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYsf9kAAKCRDB/BR4rcrsCQW/B/
 0Sex6kRtTpx/Ic+r67ISm/xd9J7z7dOhRYKF3cFHleYkjQHAYcXDFcwel8fZwj7tklcqygFh+8uVra
 MoYGDJKkaBn9oVW827/emBd06RHTMwc886WNQx7vdb8wNjYYbJ8QNedMMYBLkgbgF8RDIDY81MYydq
 JfSx5e5fKsWvrDnaUb3TJXyf4IhaM6Z87cVGNeTIlLRQ0d8Wr6V1GFEGFeKiq2fkeV2YdcPXKPTREc
 9MjQ38K+n2LW73tc3bPSMtT2NM5rXQac38BQIkXT2h3jhIxyQczutj8v4N7Hx+yGc6G1O6WybfkvXF
 IiVqZK4UxyQnZ32BedTd49BLnhOenQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
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
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

the intention of this patch series is to make it obvious to mipi-dsi
driver authors that they cannot rely on the mipi-dsi (or driver) core to
handle errors that occur at remove time. This is done by changing the
return type of the remove callback from int to void.

The first two patches make two drivers (obviously) always return zero.
Then in the final patch only return 0 are dropped and so it's easier to
see that there are no side effects.

A positive side effect of the last patch is that mipi_dsi_drv_remove()
now obviously always returns zero, which in turn prepares making driver
core remove functions return void.

Best regards
Uwe

Uwe Kleine-König (3):
  drm/panel: simple: Make panel_simple_remove() return void
  drm/panel-novatek-nt35510: Emit an error message if power off fails
  drm/mipi-dsi: Make remove callback return void

 drivers/gpu/drm/bridge/chipone-icn6211.c             |  4 +---
 drivers/gpu/drm/bridge/tc358762.c                    |  4 +---
 drivers/gpu/drm/bridge/tc358764.c                    |  4 +---
 drivers/gpu/drm/drm_mipi_dsi.c                       |  4 +++-
 drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c |  4 +---
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c       |  4 +---
 drivers/gpu/drm/panel/panel-boe-himax8279d.c         |  4 +---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c       |  4 +---
 drivers/gpu/drm/panel/panel-dsi-cm.c                 |  4 +---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c         |  4 +---
 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c    |  4 +---
 .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c    |  4 +---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c        |  4 +---
 drivers/gpu/drm/panel/panel-innolux-p079zca.c        |  4 +---
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c         |  4 +---
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c       |  4 +---
 drivers/gpu/drm/panel/panel-khadas-ts050.c           |  4 +---
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c   |  4 +---
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c   |  4 +---
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c   |  4 +---
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c     |  4 +---
 drivers/gpu/drm/panel/panel-novatek-nt35510.c        |  7 ++++---
 drivers/gpu/drm/panel/panel-novatek-nt35560.c        |  4 +---
 drivers/gpu/drm/panel/panel-novatek-nt35950.c        |  4 +---
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c       |  4 +---
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c     |  4 +---
 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c   |  4 +---
 drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c |  4 +---
 drivers/gpu/drm/panel/panel-raydium-rm67191.c        |  4 +---
 drivers/gpu/drm/panel/panel-raydium-rm68200.c        |  4 +---
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c         |  4 +---
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c        |  4 +---
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c        |  4 +---
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c     |  4 +---
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c    |  3 +--
 .../gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c |  4 +---
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c        |  4 +---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c        |  4 +---
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c      |  6 ++----
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c      |  4 +---
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c      |  4 +---
 drivers/gpu/drm/panel/panel-simple.c                 | 12 ++++++------
 drivers/gpu/drm/panel/panel-sitronix-st7701.c        |  4 +---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c        |  4 +---
 .../gpu/drm/panel/panel-sony-tulip-truly-nt35521.c   |  4 +---
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c         |  4 +---
 drivers/gpu/drm/panel/panel-truly-nt35597.c          |  3 +--
 drivers/gpu/drm/panel/panel-visionox-rm69299.c       |  3 +--
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c     |  4 +---
 include/drm/drm_mipi_dsi.h                           |  2 +-
 50 files changed, 61 insertions(+), 147 deletions(-)


base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

