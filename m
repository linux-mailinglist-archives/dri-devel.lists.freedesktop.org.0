Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F5A850515
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 17:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E6910F394;
	Sat, 10 Feb 2024 16:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.skole.hr (unknown [161.53.165.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC2610F394
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 16:18:10 +0000 (UTC)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
 by mx.skole.hr (mx.skole.hr) with ESMTP id 59EDD8431B;
 Sat, 10 Feb 2024 17:17:59 +0100 (CET)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Sat, 10 Feb 2024 17:16:17 +0100
Subject: [PATCH] backlight: ktd2801: make timing struct static
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240210-ktd2801-static-v1-1-90ad2e2e8483@skole.hr>
X-B4-Tracking: v=1; b=H4sIAFChx2UC/x3MMQqAMAxA0atIZgtJFFGvIg7SRg1ClbaIIL27x
 fEN/78QJahEGKsXgtwa9fQFVFdg98VvYtQVAyO3yITmSI57JBPTktQaIcuNo6FDtFCiK8iqzz+
 c5pw/xW2pM2AAAAA=
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: Karel Balej <balejk@matfyz.cz>, Linus Walleij <linus.walleij@linaro.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=TFGgvTM2PG0fbMk9Rl9Qb2vgbRJiET6Rp+y64OYoGI4=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlx6GE2aYXO7i6H7ygEfSoqrSV4LJWg+nPqiTWX
 De1P3tytdqJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZcehhAAKCRCaEZ6wQi2W
 4Qc2EACLTotP/+lxPbA4aYMKka8lirI9jsEY2lS37VZxUyOV4vV5MRUFJmJ5DPU11k/c+0NbwX0
 xZ2gMntp/sR/9A6jYFVOfU50N6SaymZRo+vnDQr+CmFj2bnX9NXH7huoyhPWmKXHKB2pxiDCSSy
 9ZvgazMDi1O078oYI07txn6Mv5yv3+Vru1/UDjZvMTGleuwTsSbPmwYPZ459X7jUZjRE1tbNM0A
 kOkG3pN4qhh1BJ5fA5joSqFkeFHoo/eSZVUX2ZOKUC5UDiSwOXWpmzAWikvVhaCf1HYSCqudBWA
 LYK2von+UkIct5WSYjsC/rcQPaCltcc9M44ZhuQDrTHe0qNwIvz1IX+ErId8ALX8p5/DOsc7Ajx
 Iem5xm1FDD5/OS3lFqZGKnzRV5sniXWzxwwbNxUHTj5exuiu+cfGbHwvi/x6N5K/VOaMrff6oss
 4m4TtJy71Xz0BfGLE0Gw/uvXVSRSBHm9HJwxAY4NSh//+uSM2TCNH2XPqcELV8wEjT2DDNTO+Im
 CG7zehjHRrhDrwwCp3rp/4AjnQ+lJnDV/ffNTZ8uL9nvs54WEnR4UXw7zH9bRRLLNHBq7WAmXJ4
 gRmj4lX1oCohNrKeIbQ7VHRUkWB1fRldwcfx+3wr+9+jC0gkE6AIbW22R6UJkxa0vV8/+7LuuSO
 EQWdKESlbf/OSrg==
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

The struct containing the KTD2801 timing can be made static as it's not
referenced outside the KTD2801 driver. Do this to prevent sparse
complaints.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402100625.M0RkJhMh-lkp@intel.com/
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 drivers/video/backlight/ktd2801-backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/ktd2801-backlight.c b/drivers/video/backlight/ktd2801-backlight.c
index c020acff40f1..d295c2766025 100644
--- a/drivers/video/backlight/ktd2801-backlight.c
+++ b/drivers/video/backlight/ktd2801-backlight.c
@@ -13,7 +13,7 @@
 #define KTD2801_MAX_BRIGHTNESS		255
 
 /* These values have been extracted from Samsung's driver. */
-const struct expresswire_timing ktd2801_timing = {
+static const struct expresswire_timing ktd2801_timing = {
 	.poweroff_us = 2600,
 	.detect_delay_us = 150,
 	.detect_us = 270,

---
base-commit: 66c76c1cd984c14660453dfa2118014817924375
change-id: 20240210-ktd2801-static-e1c23d19600c

Best regards,
-- 
Duje Mihanović <duje.mihanovic@skole.hr>


