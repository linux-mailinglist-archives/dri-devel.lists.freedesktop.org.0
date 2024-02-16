Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE4C8587CE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 22:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3419110E3DE;
	Fri, 16 Feb 2024 21:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.skole.hr (mx2.hosting.skole.hr [161.53.165.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AEB10E3DE
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 21:16:52 +0000 (UTC)
Received: from mx2.hosting.skole.hr (localhost.localdomain [127.0.0.1])
 by mx.skole.hr (mx.skole.hr) with ESMTP id 0A4F987249;
 Fri, 16 Feb 2024 22:16:47 +0100 (CET)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Fri, 16 Feb 2024 22:15:44 +0100
Subject: [PATCH v2 2/2] leds: expresswire: don't depend on NEW_LEDS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240216-expresswire-deps-v2-2-8be59c4a75f5@skole.hr>
References: <20240216-expresswire-deps-v2-0-8be59c4a75f5@skole.hr>
In-Reply-To: <20240216-expresswire-deps-v2-0-8be59c4a75f5@skole.hr>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Flavio Suligoi <f.suligoi@asem.it>, Hans de Goede <hdegoede@redhat.com>, 
 Jianhua Lu <lujianhua000@gmail.com>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Helge Deller <deller@gmx.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Karel Balej <balejk@matfyz.cz>, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=ilUd2XEnYNcfkPcVbpE92eytf80u0600eDPMHH5G6bY=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlz9CFbQMadin7Zla/M2jnk+iQ4GhiLeNoguKar
 l1fhos+V66JAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZc/QhQAKCRCaEZ6wQi2W
 4e5nD/9KEaP/IJ5aCnN9dT5oMviYaX+wYXZI5R60COC8fWdFX0HrlrZL8u44u4GR1W5TgbNFsdL
 Z3NNqjzgV84k0a5fNIslVFCKi4GUCWrj4xaA+6vuN+iBw+e7fls5IN1wqHWqnmpjLqmC1tkT+Tb
 7SGnrwm3P0lUkZthiAX3Ox1fmKMBJfDSmT3NntRlLbO8pcjylfNOWnYOKvMMtIVxJvmFrMSl6Iy
 eqq/wa1RJpN+15orAfXTU1OB5/NuPseaIoN9FvWuyX26LV0oEHJJ1dYLwWCZ+aUSEtj8FFCtMyP
 H7VVrIW8jrD18Hv+KCog8JJcOZ1PCTDaA/U/M7GhMJY9lMHDu1U/ekxbgfZzDWUjTqi2ebUA9MU
 7U1NwcqfQ5hlDykSBzKZbLxbxrWQXB05miTWlE55+PAiz+t+k9oVMno8wlqpCmaUdHZvg30+kL8
 KhodxUneOoU7fmTz9uWxqqbYa064GnK0Pv13fGP9121TIrxtx7Zpghp7RcffeQU0YiYhNJfNMDO
 G9oa58a0t0W589NGvH64zFZDjVMABnmuAMKQ5aiS5e3O/6QS3EOa7sIFDbQfwP8wKZDtoEVF44d
 Eo7lxKkX8sAzs9Pdqd5BCsqPEdI6MVhOKuXW9Rt4zyF/CzrIJdqgAguBTX1jy3nyNl5dzzKCxPe
 690wlyjR4kIHKgA==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
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

The ExpressWire library does not depend on NEW_LEDS and selecting it
from a subsystem other than LEDs may cause Kconfig warnings:

WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
  Depends on [n]: NEW_LEDS [=n] && GPIOLIB [=y]
  Selected by [y]:
  - BACKLIGHT_KTD2801 [=y] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=y]

Move it out of the "if NEW_LEDS" block to allow selection from other
subsystems (in particular backlight) without raising this warning.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Closes: https://lore.kernel.org/20240212111819.936815-1-arnd@kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402161410.IG9I4odj-lkp@intel.com/
Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
Fixes: 25ae5f5f4168 ("leds: Introduce ExpressWire library")
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
Changes in v2:
- Change Link: to Closes: to silence checkpatch
- Add kernel test robot's error report
---
 drivers/leds/Kconfig | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 52328d295b4e..66998b938ed3 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -6,6 +6,12 @@ config LEDS_GPIO_REGISTER
 	  As this function is used by arch code it must not be compiled as a
 	  module.
 
+# This library does not depend on NEW_LEDS and must be independent so it can be
+# selected from other subsystems (specifically backlight).
+config LEDS_EXPRESSWIRE
+	bool
+	depends on GPIOLIB
+
 menuconfig NEW_LEDS
 	bool "LED Support"
 	help
@@ -186,10 +192,6 @@ config LEDS_EL15203000
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-el15203000.
 
-config LEDS_EXPRESSWIRE
-	bool
-	depends on GPIOLIB
-
 config LEDS_TURRIS_OMNIA
 	tristate "LED support for CZ.NIC's Turris Omnia"
 	depends on LEDS_CLASS_MULTICOLOR

-- 
2.43.1


