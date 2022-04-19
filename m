Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D652550735F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88ADC10EF6F;
	Tue, 19 Apr 2022 16:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A91E10EF68
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:39:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C93D2B81BEC;
 Tue, 19 Apr 2022 16:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E9A2C385AC;
 Tue, 19 Apr 2022 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386386;
 bh=LG1bcBYOkdyP7KLIymt99RG2NdIiaXEuRSrVvs573KY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T4H7dpvXVANFtFG0af2IjmNie+uHIUShZAvOn5+alhwiwzWuBABhSLilb4FntAhkl
 4imNwHrVwSEHgo3fZAIk6eFmmbos3nMQK+2PjuXVe24Fz2RZQwZl2AFECOq1lvtND1
 zOhTT7LlzFsRKVGze1tRhKmDiBuAvKvZQyo6LeIL1a0E/8C8W5iNqIJxcoCANAELae
 +0Jz2e4Q0RxrvG0QLmW5gSNVi55sHZ5paYTOzFzPMcbrvXkLms2rBkuPOn8C2igEVo
 7NMJqhgh31cgPGSKy0Sn7sP5T3vY8TL6kJyHyGaucJKImVbhxu7YvS9tj2UsEOHtSw
 u/x4fel6q7MzQ==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 07/48] ARM: pxa: move mach/sound.h to linux/platform_data/
Date: Tue, 19 Apr 2022 18:37:29 +0200
Message-Id: <20220419163810.2118169-8-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Tomas Cech <sleep_walker@suse.com>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

This is a basically a platform_data file, so move it out of
the mach/* header directory.

Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Tomas Cech <sleep_walker@suse.com>
Cc: Sergey Lapin <slapin@ossfans.org>
Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/balloon3.c                                  | 2 +-
 arch/arm/mach-pxa/cm-x300.c                                   | 2 +-
 arch/arm/mach-pxa/colibri-pxa270.c                            | 2 +-
 arch/arm/mach-pxa/colibri-pxa300.c                            | 2 +-
 arch/arm/mach-pxa/colibri-pxa320.c                            | 2 +-
 arch/arm/mach-pxa/csb726.c                                    | 2 +-
 arch/arm/mach-pxa/devices.c                                   | 2 +-
 arch/arm/mach-pxa/eseries.c                                   | 2 +-
 arch/arm/mach-pxa/lpd270.c                                    | 2 +-
 arch/arm/mach-pxa/lubbock.c                                   | 2 +-
 arch/arm/mach-pxa/mainstone.c                                 | 2 +-
 arch/arm/mach-pxa/mioa701.c                                   | 2 +-
 arch/arm/mach-pxa/palm27x.c                                   | 2 +-
 arch/arm/mach-pxa/palmld.c                                    | 2 +-
 arch/arm/mach-pxa/palmt5.c                                    | 2 +-
 arch/arm/mach-pxa/palmtc.c                                    | 2 +-
 arch/arm/mach-pxa/palmte2.c                                   | 2 +-
 arch/arm/mach-pxa/palmtreo.c                                  | 2 +-
 arch/arm/mach-pxa/palmtx.c                                    | 2 +-
 arch/arm/mach-pxa/palmz72.c                                   | 2 +-
 arch/arm/mach-pxa/pcm990-baseboard.c                          | 2 +-
 arch/arm/mach-pxa/tosa.c                                      | 2 +-
 arch/arm/mach-pxa/trizeps4.c                                  | 2 +-
 arch/arm/mach-pxa/viper.c                                     | 2 +-
 arch/arm/mach-pxa/vpac270.c                                   | 2 +-
 arch/arm/mach-pxa/zeus.c                                      | 2 +-
 arch/arm/mach-pxa/zylonite.c                                  | 2 +-
 .../mach/audio.h => include/linux/platform_data/asoc-pxa.h    | 4 ++--
 sound/arm/pxa2xx-ac97-lib.c                                   | 2 +-
 sound/arm/pxa2xx-ac97.c                                       | 2 +-
 sound/soc/pxa/corgi.c                                         | 2 +-
 sound/soc/pxa/e740_wm9705.c                                   | 2 +-
 sound/soc/pxa/e750_wm9705.c                                   | 2 +-
 sound/soc/pxa/e800_wm9712.c                                   | 2 +-
 sound/soc/pxa/em-x270.c                                       | 2 +-
 sound/soc/pxa/mioa701_wm9713.c                                | 2 +-
 sound/soc/pxa/palm27x.c                                       | 2 +-
 sound/soc/pxa/poodle.c                                        | 2 +-
 sound/soc/pxa/pxa2xx-ac97.c                                   | 2 +-
 sound/soc/pxa/pxa2xx-i2s.c                                    | 2 +-
 sound/soc/pxa/tosa.c                                          | 2 +-
 sound/soc/pxa/z2.c                                            | 2 +-
 42 files changed, 43 insertions(+), 43 deletions(-)
 rename arch/arm/mach-pxa/include/mach/audio.h => include/linux/platform_data/asoc-pxa.h (93%)

diff --git a/arch/arm/mach-pxa/balloon3.c b/arch/arm/mach-pxa/balloon3.c
index 26140249c784..82f9299f67d3 100644
--- a/arch/arm/mach-pxa/balloon3.c
+++ b/arch/arm/mach-pxa/balloon3.c
@@ -41,7 +41,7 @@
 
 #include "pxa27x.h"
 #include <mach/balloon3.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include "udc.h"
diff --git a/arch/arm/mach-pxa/cm-x300.c b/arch/arm/mach-pxa/cm-x300.c
index 85e2537fdc15..09a5264a27c8 100644
--- a/arch/arm/mach-pxa/cm-x300.c
+++ b/arch/arm/mach-pxa/cm-x300.c
@@ -53,7 +53,7 @@
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include <linux/platform_data/mtd-nand-pxa3xx.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <linux/platform_data/usb-pxa3xx-ulpi.h>
 
 #include <asm/mach/map.h>
diff --git a/arch/arm/mach-pxa/colibri-pxa270.c b/arch/arm/mach-pxa/colibri-pxa270.c
index 2f2cd2ae4187..5dc669752836 100644
--- a/arch/arm/mach-pxa/colibri-pxa270.c
+++ b/arch/arm/mach-pxa/colibri-pxa270.c
@@ -23,7 +23,7 @@
 #include <asm/mach-types.h>
 #include <linux/sizes.h>
 
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include "colibri.h"
 #include "pxa27x.h"
 
diff --git a/arch/arm/mach-pxa/colibri-pxa300.c b/arch/arm/mach-pxa/colibri-pxa300.c
index 4ceeea142bfd..11ca6c4795e7 100644
--- a/arch/arm/mach-pxa/colibri-pxa300.c
+++ b/arch/arm/mach-pxa/colibri-pxa300.c
@@ -24,7 +24,7 @@
 #include "colibri.h"
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include <linux/platform_data/video-pxafb.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 
 #include "generic.h"
 #include "devices.h"
diff --git a/arch/arm/mach-pxa/colibri-pxa320.c b/arch/arm/mach-pxa/colibri-pxa320.c
index 35dd3adb7712..1a59056e181e 100644
--- a/arch/arm/mach-pxa/colibri-pxa320.c
+++ b/arch/arm/mach-pxa/colibri-pxa320.c
@@ -24,7 +24,7 @@
 #include "colibri.h"
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include "pxa27x-udc.h"
 #include "udc.h"
 
diff --git a/arch/arm/mach-pxa/csb726.c b/arch/arm/mach-pxa/csb726.c
index d48493445ae5..88f2f1d96c7b 100644
--- a/arch/arm/mach-pxa/csb726.c
+++ b/arch/arm/mach-pxa/csb726.c
@@ -22,7 +22,7 @@
 #include "pxa27x.h"
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <mach/smemc.h>
 
 #include "generic.h"
diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
index 7ca97ddef6fe..454523237c97 100644
--- a/arch/arm/mach-pxa/devices.c
+++ b/arch/arm/mach-pxa/devices.c
@@ -20,7 +20,7 @@
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include <linux/platform_data/keypad-pxa27x.h>
 #include <linux/platform_data/media/camera-pxa.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <linux/platform_data/mmp_dma.h>
 #include <linux/platform_data/mtd-nand-pxa3xx.h>
 
diff --git a/arch/arm/mach-pxa/eseries.c b/arch/arm/mach-pxa/eseries.c
index f37c44b6139d..a8b6483ff665 100644
--- a/arch/arm/mach-pxa/eseries.c
+++ b/arch/arm/mach-pxa/eseries.c
@@ -34,7 +34,7 @@
 #include "pxa25x.h"
 #include <mach/eseries-gpio.h>
 #include "eseries-irq.h"
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <linux/platform_data/video-pxafb.h>
 #include "udc.h"
 #include <linux/platform_data/irda-pxaficp.h>
diff --git a/arch/arm/mach-pxa/lpd270.c b/arch/arm/mach-pxa/lpd270.c
index eac32bd9e385..7f10b86f85fd 100644
--- a/arch/arm/mach-pxa/lpd270.c
+++ b/arch/arm/mach-pxa/lpd270.c
@@ -39,7 +39,7 @@
 #include "pxa27x.h"
 #include "lpd270.h"
 #include <mach/addr-map.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/irda-pxaficp.h>
diff --git a/arch/arm/mach-pxa/lubbock.c b/arch/arm/mach-pxa/lubbock.c
index 72816e7c206f..46aef93c0615 100644
--- a/arch/arm/mach-pxa/lubbock.c
+++ b/arch/arm/mach-pxa/lubbock.c
@@ -45,7 +45,7 @@
 #include <asm/hardware/sa1111.h>
 
 #include "pxa25x.h"
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <mach/lubbock.h>
 #include "udc.h"
 #include <linux/platform_data/irda-pxaficp.h>
diff --git a/arch/arm/mach-pxa/mainstone.c b/arch/arm/mach-pxa/mainstone.c
index cf74adfe65df..c8200fc2159d 100644
--- a/arch/arm/mach-pxa/mainstone.c
+++ b/arch/arm/mach-pxa/mainstone.c
@@ -45,7 +45,7 @@
 
 #include "pxa27x.h"
 #include "mainstone.h"
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/irda-pxaficp.h>
diff --git a/arch/arm/mach-pxa/mioa701.c b/arch/arm/mach-pxa/mioa701.c
index a79f296e81e0..907cd7b5f58c 100644
--- a/arch/arm/mach-pxa/mioa701.c
+++ b/arch/arm/mach-pxa/mioa701.c
@@ -41,7 +41,7 @@
 #include "udc.h"
 #include "pxa27x-udc.h"
 #include <linux/platform_data/media/camera-pxa.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <mach/smemc.h>
 
 #include "mioa701.h"
diff --git a/arch/arm/mach-pxa/palm27x.c b/arch/arm/mach-pxa/palm27x.c
index 6230381a7ca0..1a8d25eecac3 100644
--- a/arch/arm/mach-pxa/palm27x.c
+++ b/arch/arm/mach-pxa/palm27x.c
@@ -25,7 +25,7 @@
 #include <asm/mach/map.h>
 
 #include "pxa27x.h"
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/irda-pxaficp.h>
diff --git a/arch/arm/mach-pxa/palmld.c b/arch/arm/mach-pxa/palmld.c
index 5f73716a77f0..d85146957004 100644
--- a/arch/arm/mach-pxa/palmld.c
+++ b/arch/arm/mach-pxa/palmld.c
@@ -29,7 +29,7 @@
 #include <asm/mach/map.h>
 
 #include "pxa27x.h"
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <mach/palmld.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/video-pxafb.h>
diff --git a/arch/arm/mach-pxa/palmt5.c b/arch/arm/mach-pxa/palmt5.c
index 7c7cbb4e677e..460a8b1043a5 100644
--- a/arch/arm/mach-pxa/palmt5.c
+++ b/arch/arm/mach-pxa/palmt5.c
@@ -29,7 +29,7 @@
 #include <asm/mach/map.h>
 
 #include "pxa27x.h"
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include "palmt5.h"
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/video-pxafb.h>
diff --git a/arch/arm/mach-pxa/palmtc.c b/arch/arm/mach-pxa/palmtc.c
index 455cb8ccaf26..c59fc76c0c3d 100644
--- a/arch/arm/mach-pxa/palmtc.c
+++ b/arch/arm/mach-pxa/palmtc.c
@@ -29,7 +29,7 @@
 #include <asm/mach/map.h>
 
 #include "pxa25x.h"
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <mach/palmtc.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/video-pxafb.h>
diff --git a/arch/arm/mach-pxa/palmte2.c b/arch/arm/mach-pxa/palmte2.c
index a2b10db4aacc..fedac670a8af 100644
--- a/arch/arm/mach-pxa/palmte2.c
+++ b/arch/arm/mach-pxa/palmte2.c
@@ -29,7 +29,7 @@
 #include <asm/mach/map.h>
 
 #include "pxa25x.h"
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include "palmte2.h"
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/video-pxafb.h>
diff --git a/arch/arm/mach-pxa/palmtreo.c b/arch/arm/mach-pxa/palmtreo.c
index 2bf0f7f3ea24..d6d5b90d9578 100644
--- a/arch/arm/mach-pxa/palmtreo.c
+++ b/arch/arm/mach-pxa/palmtreo.c
@@ -29,7 +29,7 @@
 
 #include "pxa27x.h"
 #include "pxa27x-udc.h"
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include "palmtreo.h"
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/video-pxafb.h>
diff --git a/arch/arm/mach-pxa/palmtx.c b/arch/arm/mach-pxa/palmtx.c
index 07332c92c9f7..097b88638863 100644
--- a/arch/arm/mach-pxa/palmtx.c
+++ b/arch/arm/mach-pxa/palmtx.c
@@ -32,7 +32,7 @@
 #include <asm/mach/map.h>
 
 #include "pxa27x.h"
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <mach/palmtx.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/video-pxafb.h>
diff --git a/arch/arm/mach-pxa/palmz72.c b/arch/arm/mach-pxa/palmz72.c
index b4a5fe02a0af..66e8fe6f1661 100644
--- a/arch/arm/mach-pxa/palmz72.c
+++ b/arch/arm/mach-pxa/palmz72.c
@@ -34,7 +34,7 @@
 #include <asm/mach/map.h>
 
 #include "pxa27x.h"
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include "palmz72.h"
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/video-pxafb.h>
diff --git a/arch/arm/mach-pxa/pcm990-baseboard.c b/arch/arm/mach-pxa/pcm990-baseboard.c
index 8dfcc366d0fe..33a9d2eeca1c 100644
--- a/arch/arm/mach-pxa/pcm990-baseboard.c
+++ b/arch/arm/mach-pxa/pcm990-baseboard.c
@@ -26,7 +26,7 @@
 
 #include <asm/mach/map.h>
 #include "pxa27x.h"
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include "pcm990_baseboard.h"
diff --git a/arch/arm/mach-pxa/tosa.c b/arch/arm/mach-pxa/tosa.c
index 431709725d02..5af980d77d39 100644
--- a/arch/arm/mach-pxa/tosa.c
+++ b/arch/arm/mach-pxa/tosa.c
@@ -45,7 +45,7 @@
 #include <linux/platform_data/mmc-pxamci.h>
 #include "udc.h"
 #include "tosa_bt.h"
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <mach/smemc.h>
 
 #include <asm/mach/arch.h>
diff --git a/arch/arm/mach-pxa/trizeps4.c b/arch/arm/mach-pxa/trizeps4.c
index f76f8be09554..1337008cc760 100644
--- a/arch/arm/mach-pxa/trizeps4.c
+++ b/arch/arm/mach-pxa/trizeps4.c
@@ -41,7 +41,7 @@
 
 #include "pxa27x.h"
 #include <mach/trizeps4.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/irda-pxaficp.h>
diff --git a/arch/arm/mach-pxa/viper.c b/arch/arm/mach-pxa/viper.c
index 4b81c0117971..ac94b10bf8c1 100644
--- a/arch/arm/mach-pxa/viper.c
+++ b/arch/arm/mach-pxa/viper.c
@@ -46,7 +46,7 @@
 #include <linux/syscore_ops.h>
 
 #include "pxa25x.h"
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <linux/platform_data/video-pxafb.h>
 #include "regs-uart.h"
 #include <linux/platform_data/pcmcia-pxa2xx_viper.h>
diff --git a/arch/arm/mach-pxa/vpac270.c b/arch/arm/mach-pxa/vpac270.c
index 14505e83479e..7067d1464689 100644
--- a/arch/arm/mach-pxa/vpac270.c
+++ b/arch/arm/mach-pxa/vpac270.c
@@ -29,7 +29,7 @@
 #include <asm/mach/arch.h>
 
 #include "pxa27x.h"
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <mach/vpac270.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/video-pxafb.h>
diff --git a/arch/arm/mach-pxa/zeus.c b/arch/arm/mach-pxa/zeus.c
index 5d02f10b5b5a..67396e85bb66 100644
--- a/arch/arm/mach-pxa/zeus.c
+++ b/arch/arm/mach-pxa/zeus.c
@@ -46,7 +46,7 @@
 #include "udc.h"
 #include <linux/platform_data/video-pxafb.h>
 #include "pm.h"
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <linux/platform_data/pcmcia-pxa2xx_viper.h>
 #include "zeus.h"
 #include <mach/smemc.h>
diff --git a/arch/arm/mach-pxa/zylonite.c b/arch/arm/mach-pxa/zylonite.c
index 9bcb81688201..c48dd6d03df9 100644
--- a/arch/arm/mach-pxa/zylonite.c
+++ b/arch/arm/mach-pxa/zylonite.c
@@ -25,7 +25,7 @@
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include "pxa3xx.h"
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <linux/platform_data/video-pxafb.h>
 #include "zylonite.h"
 #include <linux/platform_data/mmc-pxamci.h>
diff --git a/arch/arm/mach-pxa/include/mach/audio.h b/include/linux/platform_data/asoc-pxa.h
similarity index 93%
rename from arch/arm/mach-pxa/include/mach/audio.h
rename to include/linux/platform_data/asoc-pxa.h
index 7beebf7297b5..327454cd8246 100644
--- a/arch/arm/mach-pxa/include/mach/audio.h
+++ b/include/linux/platform_data/asoc-pxa.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_ARCH_AUDIO_H__
-#define __ASM_ARCH_AUDIO_H__
+#ifndef __SOC_PXA_AUDIO_H__
+#define __SOC_PXA_AUDIO_H__
 
 #include <sound/core.h>
 #include <sound/pcm.h>
diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/arm/pxa2xx-ac97-lib.c
index 84d5f85073b9..9b5c1f0f8998 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/arm/pxa2xx-ac97-lib.c
@@ -23,7 +23,7 @@
 
 #include <mach/irqs.h>
 #include <mach/regs-ac97.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 
 static DEFINE_MUTEX(car_mutex);
 static DECLARE_WAIT_QUEUE_HEAD(gsr_wq);
diff --git a/sound/arm/pxa2xx-ac97.c b/sound/arm/pxa2xx-ac97.c
index c17a19fe59ed..57c3e12e6629 100644
--- a/sound/arm/pxa2xx-ac97.c
+++ b/sound/arm/pxa2xx-ac97.c
@@ -22,7 +22,7 @@
 #include <sound/dmaengine_pcm.h>
 
 #include <mach/regs-ac97.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 
 static void pxa2xx_ac97_legacy_reset(struct snd_ac97 *ac97)
 {
diff --git a/sound/soc/pxa/corgi.c b/sound/soc/pxa/corgi.c
index 8ee2dea25a8d..8b83709431cb 100644
--- a/sound/soc/pxa/corgi.c
+++ b/sound/soc/pxa/corgi.c
@@ -22,7 +22,7 @@
 
 #include <asm/mach-types.h>
 #include <mach/corgi.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 
 #include "../codecs/wm8731.h"
 #include "pxa2xx-i2s.h"
diff --git a/sound/soc/pxa/e740_wm9705.c b/sound/soc/pxa/e740_wm9705.c
index eafa1482afbe..f922be7e0016 100644
--- a/sound/soc/pxa/e740_wm9705.c
+++ b/sound/soc/pxa/e740_wm9705.c
@@ -13,7 +13,7 @@
 #include <sound/pcm.h>
 #include <sound/soc.h>
 
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <mach/eseries-gpio.h>
 
 #include <asm/mach-types.h>
diff --git a/sound/soc/pxa/e750_wm9705.c b/sound/soc/pxa/e750_wm9705.c
index d75510d7b16b..308828cd736b 100644
--- a/sound/soc/pxa/e750_wm9705.c
+++ b/sound/soc/pxa/e750_wm9705.c
@@ -13,7 +13,7 @@
 #include <sound/pcm.h>
 #include <sound/soc.h>
 
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <mach/eseries-gpio.h>
 
 #include <asm/mach-types.h>
diff --git a/sound/soc/pxa/e800_wm9712.c b/sound/soc/pxa/e800_wm9712.c
index 56d543da938a..d74fcceef687 100644
--- a/sound/soc/pxa/e800_wm9712.c
+++ b/sound/soc/pxa/e800_wm9712.c
@@ -14,7 +14,7 @@
 #include <sound/soc.h>
 
 #include <asm/mach-types.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <mach/eseries-gpio.h>
 
 static int e800_spk_amp_event(struct snd_soc_dapm_widget *w,
diff --git a/sound/soc/pxa/em-x270.c b/sound/soc/pxa/em-x270.c
index 9076ea7e9339..b59ec22e1e7e 100644
--- a/sound/soc/pxa/em-x270.c
+++ b/sound/soc/pxa/em-x270.c
@@ -23,7 +23,7 @@
 #include <sound/soc.h>
 
 #include <asm/mach-types.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 
 SND_SOC_DAILINK_DEFS(ac97,
 	DAILINK_COMP_ARRAY(COMP_CPU("pxa2xx-ac97")),
diff --git a/sound/soc/pxa/mioa701_wm9713.c b/sound/soc/pxa/mioa701_wm9713.c
index 763db7bbd9bb..0fa37637eca9 100644
--- a/sound/soc/pxa/mioa701_wm9713.c
+++ b/sound/soc/pxa/mioa701_wm9713.c
@@ -33,7 +33,7 @@
 #include <linux/platform_device.h>
 
 #include <asm/mach-types.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/pxa/palm27x.c b/sound/soc/pxa/palm27x.c
index b92ea1a0453f..275c86379e88 100644
--- a/sound/soc/pxa/palm27x.c
+++ b/sound/soc/pxa/palm27x.c
@@ -20,7 +20,7 @@
 #include <sound/jack.h>
 
 #include <asm/mach-types.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <linux/platform_data/asoc-palm27x.h>
 
 static struct snd_soc_jack hs_jack;
diff --git a/sound/soc/pxa/poodle.c b/sound/soc/pxa/poodle.c
index 323ba3e23039..176a0441235a 100644
--- a/sound/soc/pxa/poodle.c
+++ b/sound/soc/pxa/poodle.c
@@ -22,7 +22,7 @@
 #include <asm/mach-types.h>
 #include <asm/hardware/locomo.h>
 #include <mach/poodle.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 
 #include "../codecs/wm8731.h"
 #include "pxa2xx-i2s.h"
diff --git a/sound/soc/pxa/pxa2xx-ac97.c b/sound/soc/pxa/pxa2xx-ac97.c
index 8f78c5a359c5..9443c1390d2f 100644
--- a/sound/soc/pxa/pxa2xx-ac97.c
+++ b/sound/soc/pxa/pxa2xx-ac97.c
@@ -23,7 +23,7 @@
 
 #include <mach/pxa-regs.h>
 #include <mach/regs-ac97.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 
 static void pxa2xx_ac97_warm_reset(struct ac97_controller *adrv)
 {
diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index 114a33c4a064..5164c60ba89f 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -22,7 +22,7 @@
 #include <sound/dmaengine_pcm.h>
 
 #include <mach/pxa-regs.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 
 #include "pxa2xx-i2s.h"
 
diff --git a/sound/soc/pxa/tosa.c b/sound/soc/pxa/tosa.c
index 3b40b5fa5de7..06226f9b863e 100644
--- a/sound/soc/pxa/tosa.c
+++ b/sound/soc/pxa/tosa.c
@@ -24,7 +24,7 @@
 
 #include <asm/mach-types.h>
 #include <mach/tosa.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 
 #define TOSA_HP        0
 #define TOSA_MIC_INT   1
diff --git a/sound/soc/pxa/z2.c b/sound/soc/pxa/z2.c
index 7e8f33d7b83f..dc6c48e4738b 100644
--- a/sound/soc/pxa/z2.c
+++ b/sound/soc/pxa/z2.c
@@ -21,7 +21,7 @@
 #include <sound/jack.h>
 
 #include <asm/mach-types.h>
-#include <mach/audio.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include <mach/z2.h>
 
 #include "../codecs/wm8750.h"
-- 
2.29.2

