Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F316506DA5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0692989DFC;
	Tue, 19 Apr 2022 13:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E4B89DBC
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:38:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DDBD2B81983;
 Tue, 19 Apr 2022 13:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67FABC385A7;
 Tue, 19 Apr 2022 13:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375503;
 bh=L4gg5quKavJfZpB1KmVyym3/k9syW52kKGL3fWcWNjg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Kw5XRrHAn4pHn0I0JSh0pW57bNvPPurtShwMxO/ul/PIS9ZWV7guEzF9xGWK75yRC
 bzffgZZd8BPpYtn0JabaPloCpm1tz/ceomP3Qs/F5g/4nJxDb9p53CYK8dY+lp094q
 5wSTJkSY6xX7kul1bEQDyh2BoaPj9LNbGhLQVEKS74JWheELzUKJZJGWNDB6nIy4sR
 xnLBt7RWn0x8glJbzXe3XEizJ0lyMha7r/xgEfcpwSpe8ncBfbEVc8L7vt/yccyzep
 Gv9WCtCyMSH2+NDbePmeginBmFfZtvvfUXLljK5KzX4lbjo/agNMuMUcCA3OAl3QVI
 ZFJk0s9vx/QYQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 06/41] ARM: omap1: ams-delta: remove camera leftovers
Date: Tue, 19 Apr 2022 15:36:48 +0200
Message-Id: <20220419133723.1394715-7-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419133723.1394715-1-arnd@kernel.org>
References: <20220419133723.1394715-1-arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The obsolete camera support was removed, but a few lines remain in this
file and cause a warning:

arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: 'ams_delta_camera_power' defined but not used [-Wunused-function]
  462 | static int ams_delta_camera_power(struct device *dev, int power)

Remove this and all related lines as well.

Fixes: ce548396a433 ("media: mach-omap1: board-ams-delta.c: remove soc_camera dependencies")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/board-ams-delta.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 1026a816dcc0..12d61ad98395 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -407,9 +407,6 @@ static struct gpio_led gpio_leds[] __initdata = {
 	[LATCH1_PIN_LED_CAMERA] = {
 		.name		 = "camera",
 		.default_state	 = LEDS_GPIO_DEFSTATE_OFF,
-#ifdef CONFIG_LEDS_TRIGGERS
-		.default_trigger = "ams_delta_camera",
-#endif
 	},
 	[LATCH1_PIN_LED_ADVERT] = {
 		.name		 = "advert",
@@ -456,10 +453,6 @@ static struct gpiod_lookup_table leds_gpio_table = {
 	},
 };
 
-#ifdef CONFIG_LEDS_TRIGGERS
-DEFINE_LED_TRIGGER(ams_delta_camera_led_trigger);
-#endif
-
 static struct platform_device ams_delta_audio_device = {
 	.name   = "ams-delta-audio",
 	.id     = -1,
@@ -705,10 +698,6 @@ static void __init ams_delta_init(void)
 	omap_register_i2c_bus(1, 100, NULL, 0);
 
 	omap1_usb_init(&ams_delta_usb_config);
-#ifdef CONFIG_LEDS_TRIGGERS
-	led_trigger_register_simple("ams_delta_camera",
-			&ams_delta_camera_led_trigger);
-#endif
 	platform_add_devices(ams_delta_devices, ARRAY_SIZE(ams_delta_devices));
 
 	/*
-- 
2.29.2

