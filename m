Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1000B1AE19F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 17:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D396E1ED;
	Fri, 17 Apr 2020 15:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430C06E03A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 15:56:46 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N8XHb-1jBo980fon-014Txp; Fri, 17 Apr 2020 17:56:23 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 linux-fbdev@vger.kernel.org
Subject: [PATCH 2/8] fbdev/ARM: pxa: avoid selecting CONFIG_FB
Date: Fri, 17 Apr 2020 17:55:47 +0200
Message-Id: <20200417155553.675905-3-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200417155553.675905-1-arnd@arndb.de>
References: <20200417155553.675905-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:9M8pFwKX8xhc5e+yflMbgJ8Ti6PLiBfgEhVySMhV/l2w6DXvyhX
 NqHG6MTuIAQ0w1jXhYMeQm/4sXwpcF6UovtQtruUfscod7FvMEitj/jjGKxoBkkpMde5A1s
 TBfzXcBjdh5JWbAS6IpSI6QECoFWTAR3EQJJbyIAER9nV/YNICVaq0mV0hKKyDm8O6XP8Pa
 wgxD678gZrlSEP9c+3IGQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:t8odLHHYr0o=:Eg4WwvEkIOxDpSqihTijKr
 gZfLCtw7qujzdzRsUDZ0VHt/JTPiKUG+uXsRdhzshYzby8NPGd4+i45NlI7f1e3dHYOMGwI1X
 Z+cd9oSIohw+PNDm2ct6SrZcELzbLecOrPCEpv+nOM3yOZ/YX2AMlu6XEYrQl8w4gGvv/tfvq
 5bfoKGknTe3qGPhMVMJYMmJi5il5cnGt4bPqMEW7tmwiwezHfBlhqJRXXnARvzJnK4wA/Oyvi
 nFm8ir/siulpRMerWvH2QoFCE153RArslwfQyVv8JemnPd+hp53+OQDzKfnSvTNa7iuSyMEV7
 ZcoIQfYgffOyaPZ4tb15M4eynhQ5+hNKCSMHzPhIhmM/NAvHJ7khVEKQu1TwBxxrBg3U6lML+
 wZ8bZO4Jt6U7IEtd9MS4DudbcoGI2beF9R39qF2lMlxsyg0sayLYswdMvLT/6EnDDN9+cvZ/2
 nQQkXPvoW87wu9dRxnDWoWEPMRKQogwNfhYVllsS5vMOkgz/UEeUCBkHeYSikxOaayF1BY2/M
 bvjy/DHSfS6pLnM3gDZuJr9DGNse73vSLTtSOfAHJbbDdLlDoj8O60Q/xd4DvwDc91EkVKMvP
 j0+H9Zg+FXibtOFohU5BUMVc51UiQMUu9vrOjhmGN8/WaIxW5Wmc4mPcJ5PK36Kac7jSGO5Ve
 orGU+2sZO3UrxsACZW98bdQnjhkI1B9ZkLdYE6Sg0BKkxD/zEUqgchgqDSvdI7dyMPdce63iX
 0mE/5g8hGiJk5/oxqmL8ztt8eThB7X2d8gnUrCpr1A/poSvWXNpQ3BSJ6/duGzk5VTXcC7xgx
 4NC4KrpeezbyMCNduMs3m5FvSk8NJrVk5IbKnO3GRcKEvKHsrs=
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
Cc: marex@denx.de, dsd@laptop.org, Arnd Bergmann <arnd@arndb.de>,
 Andrzej Hajda <a.hajda@samsung.com>, airlied@linux.ie, masahiroy@kernel.org,
 Nicolas Pitre <nico@fluxnic.net>, Saeed Mahameed <saeedm@mellanox.com>,
 thellstrom@vmware.com, haojian.zhuang@gmail.com, geert@linux-m68k.org,
 linux-renesas-soc@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 kieran.bingham+renesas@ideasonboard.com, linux-graphics-maintainer@vmware.com,
 Laurent.pinchart@ideasonboard.com, jfrederich@gmail.com,
 robert.jarzmik@free.fr, daniel@zonque.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to add more compile-time dependencies to CONFIG_FB, remove the
last few instances of selecting it from platform code.

This was originally written to allow a modular driver, but that never
worked because vmlinux cannot call exported functions from a loadable
module.

Just change the #ifdef check to what it should have been and remove
the 'select' statement.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/pxa_defconfig | 1 +
 arch/arm/mach-pxa/Kconfig      | 4 ----
 arch/arm/mach-pxa/saar.c       | 2 +-
 arch/arm/mach-pxa/tavorevb.c   | 2 +-
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 8df88e8a3048..3931184e2eb1 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -455,6 +455,7 @@ CONFIG_SOC_CAMERA_MT9M111=m
 CONFIG_DRM=m
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB=y
+CONFIG_FB_PXA=y
 CONFIG_FB_W100=y
 CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_PXA_OVERLAY=y
diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
index 8444d40df1b3..bea8ce447ed3 100644
--- a/arch/arm/mach-pxa/Kconfig
+++ b/arch/arm/mach-pxa/Kconfig
@@ -76,16 +76,12 @@ config MACH_TAVOREVB
 	select CPU_PXA930
 	select CPU_PXA935
 	select PXA3xx
-	select FB
-	select FB_PXA
 
 config MACH_SAAR
 	bool "PXA930 Handheld Platform (aka SAAR)"
 	select CPU_PXA930
 	select CPU_PXA935
 	select PXA3xx
-	select FB
-	select FB_PXA
 
 comment "Third Party Dev Platforms (sorted by vendor name)"
 
diff --git a/arch/arm/mach-pxa/saar.c b/arch/arm/mach-pxa/saar.c
index 3275b679792b..e35d6c57f73e 100644
--- a/arch/arm/mach-pxa/saar.c
+++ b/arch/arm/mach-pxa/saar.c
@@ -113,7 +113,7 @@ static struct platform_device smc91x_device = {
 	},
 };
 
-#if defined(CONFIG_FB_PXA) || defined(CONFIG_FB_PXA_MODULE)
+#if defined(CONFIG_FB_PXA)
 static uint16_t lcd_power_on[] = {
 	/* single frame */
 	SMART_CMD_NOOP,
diff --git a/arch/arm/mach-pxa/tavorevb.c b/arch/arm/mach-pxa/tavorevb.c
index a15eb3b9484d..dda5f10b1883 100644
--- a/arch/arm/mach-pxa/tavorevb.c
+++ b/arch/arm/mach-pxa/tavorevb.c
@@ -165,7 +165,7 @@ static void __init tavorevb_init_keypad(void)
 static inline void tavorevb_init_keypad(void) {}
 #endif /* CONFIG_KEYBOARD_PXA27x || CONFIG_KEYBOARD_PXA27x_MODULE */
 
-#if defined(CONFIG_FB_PXA) || defined(CONFIG_FB_PXA_MODULE)
+#if defined(CONFIG_FB_PXA)
 static struct pwm_lookup tavorevb_pwm_lookup[] = {
 	PWM_LOOKUP("pxa27x-pwm.0", 1, "pwm-backlight.0", NULL, 100000,
 		   PWM_POLARITY_NORMAL),
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
