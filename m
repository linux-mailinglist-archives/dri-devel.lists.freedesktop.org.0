Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E20E31A2BA
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 17:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF776EEA0;
	Fri, 12 Feb 2021 16:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFB56EEA0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 16:32:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E138F64DB1;
 Fri, 12 Feb 2021 16:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613147557;
 bh=u1/9qFb1jcDrE7vnQF9/4iC4Sa1MsRCfL+IXvC69710=;
 h=From:To:Cc:Subject:Date:From;
 b=bj9TAl6rU/VSmGsk4jINUW3SBmVXm8I4saZ1pOqYDX2pwqiuktm+7BhosA+XtmQ3T
 MW+eeJJqlS3Tr07yRiuZvi2CpvGq6cvvhiVq+xKtu/5clbEw8Nx1DaNZJEK4w5exoM
 NNwsu5HMxi5zzeNjo1H2295SMj2q6FiVtQNEs9mC2MicMCDN+wHT5+lSXir4fQpC9T
 Ld24ZMWwMXSm51Kb36ttYGe6GAobtE6KB7QE8hCSIRh3ydQLwmz7DjHaiRQtos28hC
 HtiMUfsaEwahiUNvI0FwgWbY9AR5Tpz0w4clg5GE7TS/EsVUPWqkJOrBsIcWHaCgRq
 0meT4kgrRmH7A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lee Jones <lee.jones@linaro.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH v4] MAINTAINERS: move Milo Kim to credits
Date: Fri, 12 Feb 2021 17:32:29 +0100
Message-Id: <20210212163229.68270-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Jingoo Han <jingoohan1@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Sebastian Reichel <sre@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Milo Kim's email in TI bounces with permanent error (550: Invalid
recipient).  Last email from him on LKML was in 2017.  Move Milo Kim to
credits and remove the separate driver entries for:
 - TI LP855x backlight driver,
 - TI LP8727 charger driver,
 - TI LP8788 MFD (ADC, LEDs, charger and regulator) drivers.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>

---

Dear Lee,

Could you take care about this patch?

Best regards,
Krzysztof

Changes since v3:
1. Remove the entries as Dan Murphy won't be mainaining them.

Changes since v2:
1. Fix subject (TP -> TI).

Changes since v1:
1. Add Dan Murphy, do not remove the entries.
---
 CREDITS     |  3 +++
 MAINTAINERS | 23 -----------------------
 2 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/CREDITS b/CREDITS
index be097156bd71..71552790774d 100644
--- a/CREDITS
+++ b/CREDITS
@@ -1933,6 +1933,9 @@ N: Kukjin Kim
 E: kgene@kernel.org
 D: Samsung S3C, S5P and Exynos ARM architectures
 
+N: Milo Kim
+D: TI LP855x, LP8727 and LP8788 drivers
+
 N: Sangbeom Kim
 E: sbkim73@samsung.com
 D: Samsung SoC Audio (ASoC) drivers
diff --git a/MAINTAINERS b/MAINTAINERS
index 00bca3e220cc..3478082debd1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17880,29 +17880,6 @@ S:	Maintained
 F:	sound/soc/codecs/isabelle*
 F:	sound/soc/codecs/lm49453*
 
-TI LP855x BACKLIGHT DRIVER
-M:	Milo Kim <milo.kim@ti.com>
-S:	Maintained
-F:	Documentation/driver-api/backlight/lp855x-driver.rst
-F:	drivers/video/backlight/lp855x_bl.c
-F:	include/linux/platform_data/lp855x.h
-
-TI LP8727 CHARGER DRIVER
-M:	Milo Kim <milo.kim@ti.com>
-S:	Maintained
-F:	drivers/power/supply/lp8727_charger.c
-F:	include/linux/platform_data/lp8727.h
-
-TI LP8788 MFD DRIVER
-M:	Milo Kim <milo.kim@ti.com>
-S:	Maintained
-F:	drivers/iio/adc/lp8788_adc.c
-F:	drivers/leds/leds-lp8788.c
-F:	drivers/mfd/lp8788*.c
-F:	drivers/power/supply/lp8788-charger.c
-F:	drivers/regulator/lp8788-*.c
-F:	include/linux/mfd/lp8788*.h
-
 TI NETCP ETHERNET DRIVER
 M:	Wingman Kwok <w-kwok2@ti.com>
 M:	Murali Karicheri <m-karicheri2@ti.com>
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
