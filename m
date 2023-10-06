Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBFB7BBB46
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 17:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4C610E51A;
	Fri,  6 Oct 2023 15:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD4110E519
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 15:07:25 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <m.tretter@pengutronix.de>)
 id 1qomPy-00051v-2n; Fri, 06 Oct 2023 17:07:06 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Fri, 06 Oct 2023 17:07:03 +0200
Subject: [PATCH v2 1/5] drm/bridge: samsung-dsim: add more mipi-dsi device
 debug information
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230818-samsung-dsim-v2-1-846603df0e0a@pengutronix.de>
References: <20230818-samsung-dsim-v2-0-846603df0e0a@pengutronix.de>
In-Reply-To: <20230818-samsung-dsim-v2-0-846603df0e0a@pengutronix.de>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Cc: Marco Felsch <m.felsch@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>,
 kernel@pengutronix.de, Adam Ford <aford173@gmail.com>,
 Michael Tretter <m.tretter@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Marco Felsch <m.felsch@pengutronix.de>

Since the MIPI configuration can be changed on demand it is very useful
to print more MIPI settings during the MIPI device attach step.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Adam Ford <aford173@gmail.com>  #imx8mm-beacon
Tested-by: Adam Ford <aford173@gmail.com>  #imx8mm-beacon
Reviewed-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL i.MX8MM + Waveshare 10.1inch HDMI LCD (E)
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

---
Changes in v2: None
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index cf777bdb25d2..3e8ee9d73a72 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1712,7 +1712,10 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 		return ret;
 	}
 
-	DRM_DEV_INFO(dev, "Attached %s device\n", device->name);
+	DRM_DEV_INFO(dev, "Attached %s device (lanes:%d bpp:%d mode-flags:0x%lx)\n",
+		     device->name, device->lanes,
+		     mipi_dsi_pixel_format_to_bpp(device->format),
+		     device->mode_flags);
 
 	drm_bridge_add(&dsi->bridge);
 

-- 
2.39.2

