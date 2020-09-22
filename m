Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 596AB274544
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 17:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CC46E8B0;
	Tue, 22 Sep 2020 15:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B816E8B0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 15:28:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 332D7214F1;
 Tue, 22 Sep 2020 15:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600788539;
 bh=27J/qBjEJpMQ8FBjYAVH6iBhxNoGncMH/j8Wfds65Pk=;
 h=From:To:Cc:Subject:Date:From;
 b=PUADNSFPFhR29EDiZ/Ij/9aOCJMuqQD/tfx+RF+4ktGbqIa574a09TU2HgTYkAgHI
 IBI43/uVuc/fDA4alYxxp1xhvSuyZG75OL/ch4cfeUkqHCjw0N8hUXlGplF+DensSJ
 fFcIES1zzv27+KfI4PjVOCCdKSMMXJn6bMWx+0VI=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Jonathan Cameron <jic23@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Sebastian Reichel <sre@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-iio@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-leds@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: [PATCH v2] MAINTAINERS: add Dan Murphy as TP LP8xxx drivers maintainer
Date: Tue, 22 Sep 2020 17:28:39 +0200
Message-Id: <20200922152839.2744-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Dan Murphy <dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Milo Kim's email in TI bounces with permanent error (550: Invalid
recipient).  Last email from him on LKML was in 2017.  Move Milo Kim to
credits and add Dan Murphy from TI to look after:
 - TI LP855x backlight driver,
 - TI LP8727 charger driver,
 - TI LP8788 MFD (ADC, LEDs, charger and regulator) drivers.

Cc: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Add Dan Murphy, do not remove the entries.
---
 CREDITS     | 3 +++
 MAINTAINERS | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/CREDITS b/CREDITS
index 1df63cdf71df..46384b11f258 100644
--- a/CREDITS
+++ b/CREDITS
@@ -1910,6 +1910,9 @@ S: 660 Harvard Ave. #7
 S: Santa Clara, CA 95051
 S: USA
 
+N: Milo Kim
+D: TI LP855x, LP8727 and LP8788 drivers
+
 N: Russell King
 E: rmk@arm.linux.org.uk
 D: Linux/arm integrator, maintainer & hacker
diff --git a/MAINTAINERS b/MAINTAINERS
index 5b9621ca2b31..bcd2fdf0dbf2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17472,20 +17472,20 @@ F:	sound/soc/codecs/isabelle*
 F:	sound/soc/codecs/lm49453*
 
 TI LP855x BACKLIGHT DRIVER
-M:	Milo Kim <milo.kim@ti.com>
+M:	Dan Murphy <dmurphy@ti.com>
 S:	Maintained
 F:	Documentation/driver-api/backlight/lp855x-driver.rst
 F:	drivers/video/backlight/lp855x_bl.c
 F:	include/linux/platform_data/lp855x.h
 
 TI LP8727 CHARGER DRIVER
-M:	Milo Kim <milo.kim@ti.com>
+M:	Dan Murphy <dmurphy@ti.com>
 S:	Maintained
 F:	drivers/power/supply/lp8727_charger.c
 F:	include/linux/platform_data/lp8727.h
 
 TI LP8788 MFD DRIVER
-M:	Milo Kim <milo.kim@ti.com>
+M:	Dan Murphy <dmurphy@ti.com>
 S:	Maintained
 F:	drivers/iio/adc/lp8788_adc.c
 F:	drivers/leds/leds-lp8788.c
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
