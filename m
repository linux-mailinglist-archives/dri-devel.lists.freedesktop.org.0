Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB0F8539A6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 19:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6B910E322;
	Tue, 13 Feb 2024 18:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B4710E322
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 18:13:34 +0000 (UTC)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
 by mx.skole.hr (mx.skole.hr) with ESMTP id CD1F9873CC;
 Tue, 13 Feb 2024 19:13:27 +0100 (CET)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Tue, 13 Feb 2024 19:12:33 +0100
Subject: [PATCH] backlight: ktd2801: depend on GPIOLIB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240213-ktd2801-deps-v1-1-7feb5385eb9a@skole.hr>
X-B4-Tracking: v=1; b=H4sIABCxy2UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDI0Nj3eySFCMLA0PdlNSCYl2DNFNzw2QDyyQLIxMloJaCotS0zAqwcdG
 xtbUAviWRL14AAAA=
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Arnd Bergmann <arnd@kernel.org>, Karel Balej <balejk@matfyz.cz>, 
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=U+6rlt5Ta8MmGgRR4Hf8eIhUKZgfMXsWUZk6oX3Js04=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBly7ETl3iXiBasGYGxNzalU0t7/uTvFbWgKXkMI
 l0VLMuc26GJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZcuxEwAKCRCaEZ6wQi2W
 4YkmEACKMl/X2GJUWXOA57RLxzb3s5i8nLgTWk9quyZcge6rleXOSuP7FUP/x7xOk0ifXg8CUgF
 mDSSa69nLnkdwGIMblSgBKk9qaJESt9J0AXUgkZrBC96+3Iqf5f3+GGQoir/dc1z8pOOpyTJUu4
 b1mUu6qSl0flypP0F03YWOz7v53vRW3guhkCkUxaOkLU6U2cvZhKdvEN9Cey15JsIe5C+C9GcjD
 VNVl6wA3ju8uloRRGjIUV6FUkkf574BSWJVhu8uZvZqStkoe+aHxx2X4YQOQLXC+YFhnZ0JPf0c
 ay8/tIhW9Kk5Cp1qNhow853GYIDb8GX6leqVr99yx/MKMA1WinkHCToGA9JzocQDqjkaMnUNwGk
 6Zk2T0njowSWKEVfTcQ45xRVo7Ny+osaGcpFdXrWJB2hXn1Lte+CrgsXWJ5zLPjBrO4s7fYgRh2
 nnm6qt67d8+p9agbm8JtK1bMQ361ATNr26BS6u4TexyEizkDz27nzjdjuBCmvoRiRdIbbL6CuW6
 Hyrpw8LJOtY2XYmhSQeOHa2uuH9jn/kYkxOyq7ZBvNrRq2pjGZRKD3t9rti7vB62QenQqr2N22f
 42CYcE97jPJlQJYsJQ+IcaywKBKHdkOpF04cSttg6YTIVYl+Hl9BbuNgBBzochXi2LIZjc+qaS2
 yjy3ToDWXhgUJAA==
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

LEDS_EXPRESSWIRE depends on GPIOLIB, and so must anything selecting it:

WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
  Depends on [n]: NEW_LEDS [=y] && GPIOLIB [=n]
  Selected by [m]:
  - BACKLIGHT_KTD2801 [=m] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=m]

Fixes: 66c76c1cd984 ("backlight: Add Kinetic KTD2801 backlight support")
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 drivers/video/backlight/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 230bca07b09d..8bd88017d945 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -185,6 +185,7 @@ config BACKLIGHT_KTD253
 
 config BACKLIGHT_KTD2801
 	tristate "Backlight Driver for Kinetic KTD2801"
+	depends on GPIOLIB
 	select LEDS_EXPRESSWIRE
 	help
 	  Say Y to enable the backlight driver for the Kinetic KTD2801 1-wire

---
base-commit: 46d4e2eb58e14c8935fa0e27d16d4c62ef82849a
change-id: 20240213-ktd2801-deps-0f571c09b824

Best regards,
-- 
Duje Mihanović <duje.mihanovic@skole.hr>


