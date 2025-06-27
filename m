Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C5FAEB6C8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 13:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A5210E9D7;
	Fri, 27 Jun 2025 11:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF1F10E9FC
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 11:45:56 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1uV7Wi-0004N2-QJ; Fri, 27 Jun 2025 13:45:52 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 27 Jun 2025 13:45:41 +0200
Subject: [PATCH v2 4/4] drm/mipi-dsi: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-dsi-vsync-flush-v2-4-4066899a5608@pengutronix.de>
References: <20250627-dsi-vsync-flush-v2-0-4066899a5608@pengutronix.de>
In-Reply-To: <20250627-dsi-vsync-flush-v2-0-4066899a5608@pengutronix.de>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the unused MIPI_DSI_MODE_VSYNC_FLUSH flag. Whether or not a display
FIFO flush on vsync is required to avoid sending garbage to the panel is
not a property of the DSI link, but of the integration between display
controller and DSI host bridge.

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 include/drm/drm_mipi_dsi.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index b37860f4a895c25ef8ba1c5b3f44827ef53aa100..369b0d8830c3d14a4fc1e8e38d5fa55f04ca143e 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -130,8 +130,6 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
 #define MIPI_DSI_MODE_VIDEO_NO_HBP	BIT(6)
 /* disable hsync-active area */
 #define MIPI_DSI_MODE_VIDEO_NO_HSA	BIT(7)
-/* flush display FIFO on vsync pulse */
-#define MIPI_DSI_MODE_VSYNC_FLUSH	BIT(8)
 /* disable EoT packets in HS mode */
 #define MIPI_DSI_MODE_NO_EOT_PACKET	BIT(9)
 /* device supports non-continuous clock behavior (DSI spec 5.6.1) */

-- 
2.39.5

