Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C092A72E092
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 13:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795D310E385;
	Tue, 13 Jun 2023 11:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE94A10E36E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 11:09:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A2A2E223E7;
 Tue, 13 Jun 2023 11:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686654597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=759wPSS2YZhgjZvqqs3DuVdRpXqcbQxPoHRkgNwrzjQ=;
 b=hB2LOkFdJ+zgRNkt1Xil1QsWxaSSGjhWIEkLnnB+ViefVknwgzP+1uVoJXm5oVEYtOKwaK
 iYZSd1mpgCuQz+47nSm+EndIsjAN/yhXD8m4zlUlNJ7H5V7IDE+3/2gq0puNLgJNUc0cjd
 cNZltbFm3n6FwjCID/HOxOq/GANXEjI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686654597;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=759wPSS2YZhgjZvqqs3DuVdRpXqcbQxPoHRkgNwrzjQ=;
 b=IEJlUU0QgQc1tc+jsRfLDZZsU94E6dRYpY9GsfopDnR7T62da6D3m9rgkIJCnVqZsF/Poi
 VUtvvBgd/IgiQsDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 490D313483;
 Tue, 13 Jun 2023 11:09:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QJ7tEIVOiGR8CQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Jun 2023 11:09:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Subject: [PATCH v3 04/38] backlight/gpio_backlight: Rename field 'fbdev' to
 'dev'
Date: Tue, 13 Jun 2023 13:06:39 +0200
Message-ID: <20230613110953.24176-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230613110953.24176-1-tzimmermann@suse.de>
References: <20230613110953.24176-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 linux-sh@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename the field 'fbdev' in struct gpio_backlight_platform_data and
struct gpio_backlight to 'dev', as they store pointers to the Linux
platform device; not the fbdev device. Makes the code easier to
understand.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: linux-sh@vger.kernel.org
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 arch/sh/boards/mach-ecovec24/setup.c         | 2 +-
 drivers/video/backlight/gpio_backlight.c     | 6 +++---
 include/linux/platform_data/gpio_backlight.h | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index 674da7ebd8b7f..310513646c9b3 100644
--- a/arch/sh/boards/mach-ecovec24/setup.c
+++ b/arch/sh/boards/mach-ecovec24/setup.c
@@ -386,7 +386,7 @@ static struct property_entry gpio_backlight_props[] = {
 };
 
 static struct gpio_backlight_platform_data gpio_backlight_data = {
-	.fbdev = &lcdc_device.dev,
+	.dev = &lcdc_device.dev,
 };
 
 static const struct platform_device_info gpio_backlight_device_info = {
diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 5c5c99f7979e3..d3bea42407f15 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -17,7 +17,7 @@
 #include <linux/slab.h>
 
 struct gpio_backlight {
-	struct device *fbdev;
+	struct device *dev;
 	struct gpio_desc *gpiod;
 };
 
@@ -35,7 +35,7 @@ static int gpio_backlight_check_fb(struct backlight_device *bl,
 {
 	struct gpio_backlight *gbl = bl_get_data(bl);
 
-	return gbl->fbdev == NULL || gbl->fbdev == info->device;
+	return !gbl->dev || gbl->dev == info->device;
 }
 
 static const struct backlight_ops gpio_backlight_ops = {
@@ -59,7 +59,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (pdata)
-		gbl->fbdev = pdata->fbdev;
+		gbl->dev = pdata->dev;
 
 	def_value = device_property_read_bool(dev, "default-on");
 
diff --git a/include/linux/platform_data/gpio_backlight.h b/include/linux/platform_data/gpio_backlight.h
index 1a8b5b1946fe4..323fbf5f76139 100644
--- a/include/linux/platform_data/gpio_backlight.h
+++ b/include/linux/platform_data/gpio_backlight.h
@@ -8,7 +8,7 @@
 struct device;
 
 struct gpio_backlight_platform_data {
-	struct device *fbdev;
+	struct device *dev;
 };
 
 #endif
-- 
2.41.0

