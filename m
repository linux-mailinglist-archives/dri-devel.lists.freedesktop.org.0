Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAE47004CC
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 12:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D566510E66F;
	Fri, 12 May 2023 10:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B082F10E666
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 10:07:03 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-64a9335a8e7so4469566b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 03:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683886023; x=1686478023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AL9Il3xQ6CcOjY3ofxhaiTscJ0l+n9RW4KfV/woDTZA=;
 b=DMMvY/OlryULJ1BsRWv608YtTpBMnrSEYIq8dTSmOlNMuGp1FaLFrNqLsPDVAlZngQ
 cLHN/7v1d14ia0i0e21UYajgLgiqnpssvLjXYb7sh/yVm38rkBfOnX1jx2IkvXfGIw3L
 bkwrXHw8mm45kPOy7hTGRpyBWETHoSnj+Mc3xNUfvxm0pQQu4gBvBQqx28prqLVMQ5KS
 z41T2YidLtroQll0sqgiDoyQ3ArFlMie+6xTgcYmrz16PAAne2HuAEsumeq9tiCBgNRl
 GOs1hg5elb4aWrY+w8sZoNEWshk0uPWp9mgnSJHhHsncCuP0JT08hNDVPFyrelHbmwtk
 sVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683886023; x=1686478023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AL9Il3xQ6CcOjY3ofxhaiTscJ0l+n9RW4KfV/woDTZA=;
 b=G94AyPlUpktItJlTL5CtWDpOMvf3L1K5aULYaa23oBED0Sr6WBGXUMvWPPEvX5jSY1
 62yBAVv6JMc75/t20Y5WQ7dGS4qfKDgg91fuSwwXp50bd3bKIe4iwRR7Xwz4/uipd+bi
 bW5xikujY4HRJlbWQ8QsezNV/xMVQXckyklkQagx1XkzczT0QZUlIBg/DSZ4c4Fw1eyD
 EqcKjoqbbystRf8xXojNw+TAoCWzjHyxAYYIm8JZSWEnUcZGYZt7817tuD7eYPp4sBNJ
 Q/+tuPIhqwvCTFiWtjprhkfuQpJflW4aJvhYOuTC77QbER4GGkoYnafgI4Nz8NE+oDT5
 IDpw==
X-Gm-Message-State: AC+VfDyYp33UJqs6mBtCGaksrjDfd3H08U2l85XoLtGpvKXB7vSaEGnM
 vj28MG+DV+QtEKGRSk0OZto=
X-Google-Smtp-Source: ACHHUZ58pt5RKTW1jgFFUUuwPBm8Sk/5pjjh3cUIE7+kVGxXJ3m21l4VtQSwLtJNG70EwPCR8dMLbQ==
X-Received: by 2002:a17:90a:744c:b0:246:9c75:351a with SMTP id
 o12-20020a17090a744c00b002469c75351amr27695257pjk.12.1683886023117; 
 Fri, 12 May 2023 03:07:03 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-58.three.co.id. [116.206.12.58])
 by smtp.gmail.com with ESMTPSA id
 o65-20020a634144000000b00502fd70b0bdsm6442447pga.52.2023.05.12.03.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 03:07:02 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 9C638106B31; Fri, 12 May 2023 17:06:55 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>
Subject: [PATCH v2 08/10] drivers: watchdog: Replace GPL license notice with
 SPDX identifier
Date: Fri, 12 May 2023 17:06:19 +0700
Message-Id: <20230512100620.36807-9-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512100620.36807-1-bagasdotme@gmail.com>
References: <20230512100620.36807-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9335; i=bagasdotme@gmail.com;
 h=from:subject; bh=FKOXnccXkoNiIUxF9t4WxHzAEPq3ACwfo6jq+ieu+hM=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDClx/DOZ2Hvet/74xLl6S+fz3AlXFrG8ttydv7Qiv4drY
 lxdWNDGjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEwk6xfDf4+WLV7PPBO5mOba
 v3i4SqpqT4rYvPU7z266XcDe+5pPRJ2R4VNeiWbssQsbNNJkZQVtWH/yH//yX2ldy47WZTbPN21
 0YAMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Type: text/plain; charset=UTF-8
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Simon Horman <simon.horman@corigine.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Dumazet <edumazet@google.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Jonas Jensen <jonas.jensen@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Andy Gospodarek <andy@greyhouse.net>,
 Sylver Bruneau <sylver.bruneau@googlemail.com>, Marc Zyngier <maz@kernel.org>,
 Oleg Drokin <green@crimea.edu>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrey Panin <pazke@donpac.ru>,
 Guenter Roeck <linux@roeck-us.net>, Sam Creasey <sammy@sammy.net>,
 Denis Turischev <denis@compulab.co.il>,
 Manivannan Sadhasivam <mani@kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Andrew Sharp <andy.sharp@lsi.com>,
 David Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Ray Lehtiniemi <rayl@mail.com>, Alan Cox <alan@linux.intel.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Karsten Keil <isdn@linux-pingi.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Diederik de Haas <didi.debian@cknow.org>, Jan Kara <jack@suse.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Many watchdog drivers's source files has already SPDX license
identifier, while some remaining doesn't.

Convert notices on remaining files to SPDX identifier. While at it,
also move SPDX identifier for drivers/watchdog/rtd119x_wdt.c to the
top of file (as in other files).

Cc: Ray Lehtiniemi <rayl@mail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Andrey Panin <pazke@donpac.ru>
Cc: Oleg Drokin <green@crimea.edu>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Jonas Jensen <jonas.jensen@gmail.com>
Cc: Sylver Bruneau <sylver.bruneau@googlemail.com>
Cc: Andrew Sharp <andy.sharp@lsi.com>
Cc: Denis Turischev <denis@compulab.co.il>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Alan Cox <alan@linux.intel.com>
Reviewed-by: Simon Horman <simon.horman@corigine.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/watchdog/ep93xx_wdt.c     | 5 +----
 drivers/watchdog/ibmasr.c         | 3 +--
 drivers/watchdog/m54xx_wdt.c      | 4 +---
 drivers/watchdog/max63xx_wdt.c    | 5 +----
 drivers/watchdog/moxart_wdt.c     | 4 +---
 drivers/watchdog/octeon-wdt-nmi.S | 5 +----
 drivers/watchdog/orion_wdt.c      | 4 +---
 drivers/watchdog/rtd119x_wdt.c    | 2 +-
 drivers/watchdog/sb_wdog.c        | 5 +----
 drivers/watchdog/sbc_fitpc2_wdt.c | 4 +---
 drivers/watchdog/ts4800_wdt.c     | 4 +---
 drivers/watchdog/ts72xx_wdt.c     | 4 +---
 12 files changed, 12 insertions(+), 37 deletions(-)

diff --git a/drivers/watchdog/ep93xx_wdt.c b/drivers/watchdog/ep93xx_wdt.c
index 38e26f160b9a57..59dfd7f6bf0ba1 100644
--- a/drivers/watchdog/ep93xx_wdt.c
+++ b/drivers/watchdog/ep93xx_wdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Watchdog driver for Cirrus Logic EP93xx family of devices.
  *
@@ -11,10 +12,6 @@
  * Copyright (c) 2012 H Hartley Sweeten <hsweeten@visionengravers.com>
  *	Convert to a platform device and use the watchdog framework API
  *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
- *
  * This watchdog fires after 250msec, which is a too short interval
  * for us to rely on the user space daemon alone. So we ping the
  * wdt each ~200msec and eventually stop doing it if the user space
diff --git a/drivers/watchdog/ibmasr.c b/drivers/watchdog/ibmasr.c
index 4a22fe15208630..6955c693b5fd00 100644
--- a/drivers/watchdog/ibmasr.c
+++ b/drivers/watchdog/ibmasr.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * IBM Automatic Server Restart driver.
  *
@@ -6,8 +7,6 @@
  * Based on driver written by Pete Reynolds.
  * Copyright (c) IBM Corporation, 1998-2004.
  *
- * This software may be used and distributed according to the terms
- * of the GNU Public License, incorporated herein by reference.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/watchdog/m54xx_wdt.c b/drivers/watchdog/m54xx_wdt.c
index f388a769dbd33d..062ea3e6497e52 100644
--- a/drivers/watchdog/m54xx_wdt.c
+++ b/drivers/watchdog/m54xx_wdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * drivers/watchdog/m54xx_wdt.c
  *
@@ -11,9 +12,6 @@
  *  Copyright 2004 (c) MontaVista, Software, Inc.
  *  Based on sa1100 driver, Copyright (C) 2000 Oleg Drokin <green@crimea.edu>
  *
- * This file is licensed under  the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/watchdog/max63xx_wdt.c b/drivers/watchdog/max63xx_wdt.c
index 9e1541cfae0d89..21935f9620e463 100644
--- a/drivers/watchdog/max63xx_wdt.c
+++ b/drivers/watchdog/max63xx_wdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * drivers/char/watchdog/max63xx_wdt.c
  *
@@ -5,10 +6,6 @@
  *
  * Copyright (C) 2009 Marc Zyngier <maz@misterjones.org>
  *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
- *
  * This driver assumes the watchdog pins are memory mapped (as it is
  * the case for the Arcom Zeus). Should it be connected over GPIOs or
  * another interface, some abstraction will have to be introduced.
diff --git a/drivers/watchdog/moxart_wdt.c b/drivers/watchdog/moxart_wdt.c
index 6340a1f5f471b2..b7b1da3c932ded 100644
--- a/drivers/watchdog/moxart_wdt.c
+++ b/drivers/watchdog/moxart_wdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * MOXA ART SoCs watchdog driver.
  *
@@ -5,9 +6,6 @@
  *
  * Jonas Jensen <jonas.jensen@gmail.com>
  *
- * This file is licensed under the terms of the GNU General Public
- * License version 2.  This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/clk.h>
diff --git a/drivers/watchdog/octeon-wdt-nmi.S b/drivers/watchdog/octeon-wdt-nmi.S
index 97f6eb7b5a8e04..57bb0845de477d 100644
--- a/drivers/watchdog/octeon-wdt-nmi.S
+++ b/drivers/watchdog/octeon-wdt-nmi.S
@@ -1,8 +1,5 @@
+/* SPDX-License-Identifier: GPL-1.0+ */
 /*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
  * Copyright (C) 2007-2017 Cavium, Inc.
  */
 #include <asm/asm.h>
diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
index 5ec2dd8fd5fa3d..1fe583e8a95b2e 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * drivers/watchdog/orion_wdt.c
  *
@@ -5,9 +6,6 @@
  *
  * Author: Sylver Bruneau <sylver.bruneau@googlemail.com>
  *
- * This file is licensed under  the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/watchdog/rtd119x_wdt.c b/drivers/watchdog/rtd119x_wdt.c
index 95c8d7abce42e6..984905695dde51 100644
--- a/drivers/watchdog/rtd119x_wdt.c
+++ b/drivers/watchdog/rtd119x_wdt.c
@@ -1,9 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Realtek RTD129x watchdog
  *
  * Copyright (c) 2017 Andreas Färber
  *
- * SPDX-License-Identifier: GPL-2.0+
  */
 
 #include <linux/bitops.h>
diff --git a/drivers/watchdog/sb_wdog.c b/drivers/watchdog/sb_wdog.c
index 504be461f992a9..822bf8905bf3ce 100644
--- a/drivers/watchdog/sb_wdog.c
+++ b/drivers/watchdog/sb_wdog.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * Watchdog driver for SiByte SB1 SoCs
  *
@@ -38,10 +39,6 @@
  *	(c) Copyright 1996 Alan Cox <alan@lxorguk.ukuu.org.uk>,
  *						All Rights Reserved.
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	version 1 or 2 as published by the Free Software Foundation.
- *
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/watchdog/sbc_fitpc2_wdt.c b/drivers/watchdog/sbc_fitpc2_wdt.c
index 13db71e165836e..b8eb8d5ca1af0c 100644
--- a/drivers/watchdog/sbc_fitpc2_wdt.c
+++ b/drivers/watchdog/sbc_fitpc2_wdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Watchdog driver for SBC-FITPC2 board
  *
@@ -5,9 +6,6 @@
  *
  * Adapted from the IXP2000 watchdog driver by Deepak Saxena.
  *
- * This file is licensed under  the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME " WATCHDOG: " fmt
diff --git a/drivers/watchdog/ts4800_wdt.c b/drivers/watchdog/ts4800_wdt.c
index 0ea554c7cda579..0099403f49922f 100644
--- a/drivers/watchdog/ts4800_wdt.c
+++ b/drivers/watchdog/ts4800_wdt.c
@@ -1,11 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Watchdog driver for TS-4800 based boards
  *
  * Copyright (c) 2015 - Savoir-faire Linux
  *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/kernel.h>
diff --git a/drivers/watchdog/ts72xx_wdt.c b/drivers/watchdog/ts72xx_wdt.c
index bf918f5fa13175..3d57670befe1ce 100644
--- a/drivers/watchdog/ts72xx_wdt.c
+++ b/drivers/watchdog/ts72xx_wdt.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Watchdog driver for Technologic Systems TS-72xx based SBCs
  * (TS-7200, TS-7250 and TS-7260). These boards have external
@@ -8,9 +9,6 @@
  *
  * This driver is based on ep93xx_wdt and wm831x_wdt drivers.
  *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/platform_device.h>
-- 
An old man doll... just what I always wanted! - Clara

