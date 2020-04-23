Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C38CB1B55EF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 09:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1976E217;
	Thu, 23 Apr 2020 07:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB646E217
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 07:40:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D4879AF13;
 Thu, 23 Apr 2020 07:40:05 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, airlied@gmail.com,
 torvalds@linux-foundation.org
Subject: [PATCH] MAINTAINERS: Restore alphabetical sorting
Date: Thu, 23 Apr 2020 09:40:03 +0200
Message-Id: <20200423074003.9637-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dariusz Marcinkiewicz <darekm@google.com>, Sam Ravnborg <sam@ravnborg.org>,
 "David S. Miller" <davem@davemloft.net>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MAINTAINERS got sorted in

  commit 4400b7d68f6e ("MAINTAINERS: sort entries by entry name")

Merging from drm-next into drm-misc-next duplicated some of the
entries by restoring old, unsorted sections. Restore the sorted
list by removing the duplicates.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 08d99b2c23df ("Merge drm/drm-next into drm-misc-next")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Dariusz Marcinkiewicz <darekm@google.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 MAINTAINERS | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ad29107786fe3..b4ca7489c13cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5047,24 +5047,6 @@ F:	Documentation/driver-api/dma-buf.rst
 K:	\bdma_(?:buf|fence|resv)\b
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 
-DMA-BUF HEAPS FRAMEWORK
-M:	Sumit Semwal <sumit.semwal@linaro.org>
-R:	Andrew F. Davis <afd@ti.com>
-R:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
-R:	Liam Mark <lmark@codeaurora.org>
-R:	Laura Abbott <labbott@redhat.com>
-R:	Brian Starkey <Brian.Starkey@arm.com>
-R:	John Stultz <john.stultz@linaro.org>
-S:	Maintained
-L:	linux-media@vger.kernel.org
-L:	dri-devel@lists.freedesktop.org
-L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
-F:	include/uapi/linux/dma-heap.h
-F:	include/linux/dma-heap.h
-F:	drivers/dma-buf/dma-heap.c
-F:	drivers/dma-buf/heaps/*
-T:	git git://anongit.freedesktop.org/drm/drm-misc
-
 DMA GENERIC OFFLOAD ENGINE SUBSYSTEM
 M:	Vinod Koul <vkoul@kernel.org>
 L:	dmaengine@vger.kernel.org
@@ -5276,11 +5258,6 @@ S:	Maintained
 F:	drivers/gpu/drm/panel/panel-arm-versatile.c
 F:	Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
 
-DRM DRIVER FOR AST SERVER GRAPHICS CHIPS
-M:	Dave Airlie <airlied@redhat.com>
-S:	Odd Fixes
-F:	drivers/gpu/drm/ast/
-
 DRM DRIVER FOR ASPEED BMC GFX
 M:	Joel Stanley <joel@jms.id.au>
 L:	linux-aspeed@lists.ozlabs.org
@@ -5468,12 +5445,6 @@ S:	Orphan / Obsolete
 F:	drivers/gpu/drm/sis/
 F:	include/uapi/drm/sis_drm.h
 
-DRM DRIVER FOR SITRONIX ST7701 PANELS
-M:	Jagan Teki <jagan@amarulasolutions.com>
-S:	Maintained
-F:	drivers/gpu/drm/panel/panel-sitronix-st7701.c
-F:	Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
-
 DRM DRIVER FOR SITRONIX ST7586 PANELS
 M:	David Lechner <david@lechnology.com>
 S:	Maintained
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
