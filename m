Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C5E4CBE19
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 13:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2586610E46D;
	Thu,  3 Mar 2022 12:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D911F10E46D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 12:45:07 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6495:14e6:1343:3ecb])
 by andre.telenet-ops.be with bizsmtp
 id 1oky2700L5ER6nL01okzmC; Thu, 03 Mar 2022 13:45:05 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nPkpG-002XrF-8b; Thu, 03 Mar 2022 13:44:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nPkpF-008D6v-AA; Thu, 03 Mar 2022 13:44:57 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] drm: Drop commas after SoC match table sentinels
Date: Thu,  3 Mar 2022 13:44:56 +0100
Message-Id: <298f0644275d7d0b4aa3ee7143756a2431a4900c.1646311443.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It does not make sense to have a comma after a sentinel, as any new
elements must be added before the sentinel.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/bridge/nwl-dsi.c  | 2 +-
 drivers/gpu/drm/meson/meson_drv.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 5abb5ec3de467458..846df1ee7a2888cb 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -1151,7 +1151,7 @@ MODULE_DEVICE_TABLE(of, nwl_dsi_dt_ids);
 static const struct soc_device_attribute nwl_dsi_quirks_match[] = {
 	{ .soc_id = "i.MX8MQ", .revision = "2.0",
 	  .data = (void *)E11418_HS_MODE_QUIRK },
-	{ /* sentinel. */ },
+	{ /* sentinel. */ }
 };
 
 static int nwl_dsi_probe(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 26aeaf0ab86ef932..35eaa669e8fe0c2a 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -167,7 +167,7 @@ static const struct meson_drm_soc_attr meson_drm_soc_attrs[] = {
 		},
 		.attrs = (const struct soc_device_attribute []) {
 			{ .soc_id = "GXL (S805*)", },
-			{ /* sentinel */ },
+			{ /* sentinel */ }
 		}
 	},
 };
-- 
2.25.1

