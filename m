Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1FB1334F5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 22:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389566E13A;
	Tue,  7 Jan 2020 21:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404D16E13A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 21:37:50 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MD9jV-1ixz5J32PZ-0095eX; Tue, 07 Jan 2020 22:37:40 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] drm: of: fix link error
Date: Tue,  7 Jan 2020 22:37:32 +0100
Message-Id: <20200107213738.635906-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:kt5LvuirQVNweIAs+LOmABN57OTOIGByhcM0pxamuzNx7t9jGfj
 IuJeQ5d8yRjBH3cmRWomTgyvq83b74sEl/ZG5OFHfBjtYHi6ECVAhiW/szJyQgZs0PXsF8Y
 2bBfwV3qIXFpboG4tc9S3L6eSqjFRJ0ufeIjTIs7o4j+915emX7k5ceTf8G/BPTazTZGcD1
 Mu7Yqn5XSaLqcSEspvY2g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ALbzvMY33/E=:vdrGZwPS2OYudX0MwcB3x+
 zdBm+YD9UN+FCkIxDRmYKwhp5EK24CbV3sk3ZI5+EDfjUTsNQnaBNddyVw3cQaBRDXq8szUXO
 1N9N7us30Xxa2Wbm2fYVhsmypwQRCMAJaphoFTNwTpZ/MnY4471u4y7kCflO5YMUJmpdeEghk
 T25qB1JSsSSAkhCqm9jY3YtETHm17lvzi7m8t0iIjtsUHsukKSlPB1n+6/ik3JoSmMJMO0QiR
 5nUvrMVN8YJvAVATHrSCv3Q/kYuEnvlehwonB2JT84n4SPXgRm2OUMQPnCiuRA7z8SRCmhe0T
 Feje9vXwQaBaER4Sh36n8Ti6ghIYCxe/StS2AgYHJXuJMPHsWnQY1w5xYEJ9G5Lc2oEdW83b7
 ZahQ6EsuZMwK9sAEy5aBAU01mQLq/7q+XQrO5daNgbikk69cpwpc3KLOFCGO3zPyTPvSqpJJy
 UEHL03okL7S7MqEvcEcKIQqz2IpivCL8kptQv5L38EZYiNj2uwdyE2rpaKdImPMFO3LrRLT3H
 wO0RIpYUtlawNu5lH8SX3hcTKkLMJf6gcrqVn0LawRQ4SdoSVIkmHmMnZecOxgy+3s1TenpZ8
 4vV9y/X6P8SyGiV+bLUr9dFkLBFGlyl5dNcbGyG4PwzmeAF/57GanXsuo0MwvWYOa/mgVm+vk
 8p/n5QDBrptghnd2BBkGloBbXaXJqinfDXx37lmOm7jZlnih7m/H1hRwy9n2eMBVa9V9zwOD1
 lkSL5Weu9/Izhp+HD6w43EE1K8hakM1V9xegBGsyzgsHAExJwpjzFEvt+qN9IIDh0qHkN6KcR
 6PxU2pvCgTaHUmFkiIn869EudWHe97f+2GmLFab3TFYDQTee9LBPPQdIrUMrwdoFkzwr/CzwI
 zsiDxNDGvGu+J69yFhzw==
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new dummy helper is non-static, so every driver gets
its own copy, leading to a link failure:

drivers/gpu/drm/imx/imx-ldb.o: In function `drm_of_lvds_get_dual_link_pixel_order':
imx-ldb.c:(.text+0x140): multiple definition of `drm_of_lvds_get_dual_link_pixel_order'
drivers/gpu/drm/imx/imx-drm-core.o:imx-drm-core.c:(.text+0x330): first defined here
drivers/gpu/drm/imx/dw_hdmi-imx.o: In function `drm_of_lvds_get_dual_link_pixel_order':
dw_hdmi-imx.c:(.text+0xd0): multiple definition of `drm_of_lvds_get_dual_link_pixel_order'
drivers/gpu/drm/imx/imx-drm-core.o:imx-drm-core.c:(.text+0x330): first defined here
drivers/gpu/drm/bridge/synopsys/dw-hdmi.o: In function `drm_of_lvds_get_dual_link_pixel_order':
dw-hdmi.c:(.text+0x3b90): multiple definition of `drm_of_lvds_get_dual_link_pixel_order'
drivers/gpu/drm/imx/imx-drm-core.o:imx-drm-core.c:(.text+0x330): first defined here
drivers/gpu/drm/etnaviv/etnaviv_drv.o: In function `drm_of_lvds_get_dual_link_pixel_order':
etnaviv_drv.c:(.text+0x9d0): multiple definition of `drm_of_lvds_get_dual_link_pixel_order'
drivers/gpu/drm/imx/imx-drm-core.o:imx-drm-core.c:(.text+0x330): first defined here

Add the missing 'static' keyword.

Fixes: 6529007522de ("drm: of: Add drm_of_lvds_get_dual_link_pixel_order")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/drm/drm_of.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 8ec7ca6d2369..3398be966021 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -92,7 +92,7 @@ static inline int drm_of_find_panel_or_bridge(const struct device_node *np,
 	return -EINVAL;
 }
 
-int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
+static inline int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 					  const struct device_node *port2)
 {
 	return -EINVAL;
-- 
2.20.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
