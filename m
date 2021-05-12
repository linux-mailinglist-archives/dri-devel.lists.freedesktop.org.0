Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B492537B9B8
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 11:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785DE6E81F;
	Wed, 12 May 2021 09:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629CD6E81F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 09:55:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 799FB613C4;
 Wed, 12 May 2021 09:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620813326;
 bh=iRga/USHGurDvcUu4hqU7TKX39dgB3IyjXw/3MsUN/M=;
 h=Subject:To:Cc:From:Date:From;
 b=oe5K067VyWpQtqRP0A48W7XOmAFq2NNXF13hw4fgImT867afpH6I4F6BIBpFxsVVb
 j3RGlPONA/UJFAdlOuHMHxBAJ+hE5Wr1Hr/sy2zGqBj0w0ie0ESHKu6FQFPUsJ6w4B
 fUjZ1zWwea3txGS13iazmg3LXZiiD+h1Hma5rFb0=
Subject: Patch "drm: bridge: fix ANX7625 use of mipi_dsi_() functions" has
 been added to the 5.11-stable tree
To: a.hajda@samsung.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, lkp@intel.com, narmstrong@baylibre.com,
 rdunlap@infradead.org, robert.foss@linaro.org, sam@ravnborg.org,
 xji@analogixsemi.com
From: <gregkh@linuxfoundation.org>
Date: Wed, 12 May 2021 11:55:03 +0200
Message-ID: <1620813303236238@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm: bridge: fix ANX7625 use of mipi_dsi_() functions

to the 5.11-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-bridge-fix-anx7625-use-of-mipi_dsi_-functions.patch
and it can be found in the queue-5.11 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From ed01fca38717169fcb61bd45ad1c3750d9c40d59 Mon Sep 17 00:00:00 2001
From: Randy Dunlap <rdunlap@infradead.org>
Date: Thu, 15 Apr 2021 11:36:19 -0700
Subject: drm: bridge: fix ANX7625 use of mipi_dsi_() functions

From: Randy Dunlap <rdunlap@infradead.org>

commit ed01fca38717169fcb61bd45ad1c3750d9c40d59 upstream.

The Analogix DRM ANX7625 bridge driver uses mips_dsi_() function
interfaces so it should select DRM_MIPI_DSI to prevent build errors.

ERROR: modpost: "mipi_dsi_attach" [drivers/gpu/drm/bridge/analogix/anx7625.ko] undefined!
ERROR: modpost: "mipi_dsi_device_register_full" [drivers/gpu/drm/bridge/analogix/anx7625.ko] undefined!
ERROR: modpost: "of_find_mipi_dsi_host_by_node" [drivers/gpu/drm/bridge/analogix/anx7625.ko] undefined!
ERROR: modpost: "mipi_dsi_device_unregister" [drivers/gpu/drm/bridge/analogix/anx7625.ko] undefined!
ERROR: modpost: "mipi_dsi_detach" [drivers/gpu/drm/bridge/analogix/anx7625.ko] undefined!

Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Cc: Xin Ji <xji@analogixsemi.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: stable@vger.kernel.org
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210415183619.1431-1-rdunlap@infradead.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/bridge/analogix/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -30,6 +30,7 @@ config DRM_ANALOGIX_ANX7625
 	tristate "Analogix Anx7625 MIPI to DP interface support"
 	depends on DRM
 	depends on OF
+	select DRM_MIPI_DSI
 	help
 	  ANX7625 is an ultra-low power 4K mobile HD transmitter
 	  designed for portable devices. It converts MIPI/DPI to


Patches currently in stable-queue which might be from rdunlap@infradead.org are

queue-5.11/drm-bridge-fix-lontium-use-of-mipi_dsi_-functions.patch
queue-5.11/drm-bridge-fix-anx7625-use-of-mipi_dsi_-functions.patch
