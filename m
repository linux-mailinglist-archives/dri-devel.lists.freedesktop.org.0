Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5F26C51AE
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 18:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB7510E9B0;
	Wed, 22 Mar 2023 17:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA8710E3E9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 17:02:33 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r2-0000PK-2P; Wed, 22 Mar 2023 18:02:28 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r0-005xjl-GO; Wed, 22 Mar 2023 18:02:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1qz-0075pK-OE; Wed, 22 Mar 2023 18:02:25 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 00/12] drm/tegra: Convert to platform remove callback
 returning void
Date: Wed, 22 Mar 2023 18:02:11 +0100
Message-Id: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2732;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=3rpjn0c4WSYGYyS5/RVkmvwXpGdpb7uRSmd+Uf8Qnuw=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGzSNKtUtqhr1oZPwBWhA+JAHg0J0xGc6e+tkg
 x3bfFW9Uz+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBs0jQAKCRCPgPtYfRL+
 TqfzB/4/IANKSWB2KQ4zILj/AcceJ/FejtlG9MZOl1ru5nAcYKhknZGa0eUiSTgwEvfZ4WI+NYr
 ZqcfIAlJ4wmpoY853WXtSvrSGhWEUeEcCtMD183oxwIjcWNWhZ4tVPpomGbD4DW7DeI2uUwAB2e
 oCyD1/usx5pYMB5uQL+mo3G5PcKfeDR6XwVkUm1mUz/6lIVlmqnEs9HZvD/5ZC/PYECy2dGzP1n
 pjGYTMwEWVgCNocM7PIfq0E4ZNL0NmZCzCQ+arhDlszrTIPw6Eg78BLkh5NA1OU/yPpbSOf8A9s
 ykSV2508c/D4OOQQRW4cDZEd8OHkmFrS4ewJNpo+M+kOHU4a
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
Cc: linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

this series adapts the platform drivers below drivers/gpu/drm/tegra to
use the .remove_new() callback. Compared to the traditional .remove()
callback .remove_new() returns no value. This is a good thing because
the driver core doesn't (and cannot) cope for errors during remove. The
only effect of a non-zero return value in .remove() is that the driver
core emits a warning. The device is removed anyhow and an early return
from .remove() usually yields a resource leak.

By changing the remove callback to return void driver authors cannot
reasonably assume any more that there is some kind of cleanup later.

The first two patches are simplifications that make it obvious that all
remove callbacks always return zero. After that all drivers can be
converted trivially.

Best regards
Uwe

Uwe Kleine-König (12):
  gpu: host1x: Make host1x_client_unregister() return void
  drm/tegra: rgb: Make tegra_dc_rgb_remove() return void
  drm/tegra: dc: Convert to platform remove callback returning void
  drm/tegra: dpaux: Convert to platform remove callback returning void
  drm/tegra: dsi: Convert to platform remove callback returning void
  drm/tegra: gr2d: Convert to platform remove callback returning void
  drm/tegra: gr3d: Convert to platform remove callback returning void
  drm/tegra: hdmi: Convert to platform remove callback returning void
  drm/tegra: hub: Convert to platform remove callback returning void
  drm/tegra: nvdec: Convert to platform remove callback returning void
  drm/tegra: sor: Convert to platform remove callback returning void
  drm/tegra: vic: Convert to platform remove callback returning void

 drivers/gpu/drm/tegra/dc.c              | 20 ++++----------------
 drivers/gpu/drm/tegra/dc.h              |  2 +-
 drivers/gpu/drm/tegra/dpaux.c           |  6 ++----
 drivers/gpu/drm/tegra/dsi.c             | 14 +++-----------
 drivers/gpu/drm/tegra/gr2d.c            | 14 +++-----------
 drivers/gpu/drm/tegra/gr3d.c            | 14 +++-----------
 drivers/gpu/drm/tegra/hdmi.c            | 14 +++-----------
 drivers/gpu/drm/tegra/hub.c             | 13 +++----------
 drivers/gpu/drm/tegra/nvdec.c           | 14 +++-----------
 drivers/gpu/drm/tegra/rgb.c             |  6 ++----
 drivers/gpu/drm/tegra/sor.c             | 14 +++-----------
 drivers/gpu/drm/tegra/vic.c             | 14 +++-----------
 drivers/gpu/host1x/bus.c                |  6 ++----
 drivers/staging/media/tegra-video/csi.c |  8 +-------
 drivers/staging/media/tegra-video/vi.c  |  8 +-------
 include/linux/host1x.h                  |  2 +-
 16 files changed, 38 insertions(+), 131 deletions(-)

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2

