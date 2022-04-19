Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B9D50731A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D614010EF09;
	Tue, 19 Apr 2022 16:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E473110EF09
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:39:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 714FA617D1;
 Tue, 19 Apr 2022 16:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23EEC385AB;
 Tue, 19 Apr 2022 16:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386346;
 bh=/w2/TuJUuh8aAeAb2m2RYQ0ha5XDa7wX5MqtonXBziw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JSa8soCOWoHbvEvEMCJM5/utpcask8B1DWr5x2vp91tbyaynmX0rTSsEKOTeoQHXR
 xSRS3Xno7rnCUQ3pMwm4mb0C5Nn4Un3kthir4lze9lCf7arGoOqvJyX6s9isYF1BTg
 81xrpPmbsNyOwda4gry9Su9QAWOc6aLDIvSCivZ6D7ALqa5hnnFk8qqp6WGo4H0jz/
 n3cmV2yg+Hsqp/2KBOQWv4OG8fsDhuMeF3RquJVsVmQ3r03jGQ5Jb/kE9Eg+MfTnPV
 0fhh0N+QRSE/UK4kqmfvj+oYMYiI2cyul44m5sN6XHaZpuap2KcE/Ox9+lUvfY7liW
 OcEgijUbKxbQQ==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 02/48] ARM: pxa: make mainstone.h private
Date: Tue, 19 Apr 2022 18:37:24 +0200
Message-Id: <20220419163810.2118169-3-arnd@kernel.org>
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

No driver includes this any more, so don't expose it globally.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/mainstone.c                    | 2 +-
 arch/arm/mach-pxa/{include/mach => }/mainstone.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)
 rename arch/arm/mach-pxa/{include/mach => }/mainstone.h (99%)

diff --git a/arch/arm/mach-pxa/mainstone.c b/arch/arm/mach-pxa/mainstone.c
index d237bd030238..997f6e502201 100644
--- a/arch/arm/mach-pxa/mainstone.c
+++ b/arch/arm/mach-pxa/mainstone.c
@@ -45,7 +45,7 @@
 #include <asm/mach/flash.h>
 
 #include "pxa27x.h"
-#include <mach/mainstone.h>
+#include "mainstone.h"
 #include <mach/audio.h>
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/mmc-pxamci.h>
diff --git a/arch/arm/mach-pxa/include/mach/mainstone.h b/arch/arm/mach-pxa/mainstone.h
similarity index 99%
rename from arch/arm/mach-pxa/include/mach/mainstone.h
rename to arch/arm/mach-pxa/mainstone.h
index 1698f2ffd7c7..ba003742e003 100644
--- a/arch/arm/mach-pxa/include/mach/mainstone.h
+++ b/arch/arm/mach-pxa/mainstone.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- *  arch/arm/mach-pxa/include/mach/mainstone.h
- *
  *  Author:	Nicolas Pitre
  *  Created:	Nov 14, 2002
  *  Copyright:	MontaVista Software Inc.
-- 
2.29.2

