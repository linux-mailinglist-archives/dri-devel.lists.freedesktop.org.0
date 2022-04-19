Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF5550732C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B8F210EF0E;
	Tue, 19 Apr 2022 16:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED0410EF0E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:39:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D8E96183C;
 Tue, 19 Apr 2022 16:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34BBC385A5;
 Tue, 19 Apr 2022 16:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386354;
 bh=iNfaqPXbxvJ8CzkrujTl+KTX1dXRxdfsCaFm+BFdUkw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bfRkXwjMc9oek9+kpE3h7BCEd05AgRXzISzSv39xtx/qe6Q/2hxmd3obXTk9UB36X
 +q4K5dVdjE3QggFgrTvjYnWJW1DdumolThYG/Etv/6l46iOKZpsTRoAEErpmmuzy/U
 lUmHdvOnaZOz3V1CaFwc0LstSClQkNGYSguKhmK3DQNsD7u/0DwgzqR9wbmaqBeb3U
 gj8yt11H4YBBVesxMPSkz9sQGyQQ2mEHodmsWtzBM5xh6K1SJLtjD+piWx4+Ajg4Jr
 LtTB6YXt4UPB2SD8A7KAOdJAvbYsNgQ2Zzg1xKK1Z0QY63UFZvEjMGPJhE0gvn5f2x
 4UMXt0euV9HXA==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 03/48] ARM: pxa: make mach/regs-uart.h private
Date: Tue, 19 Apr 2022 18:37:25 +0200
Message-Id: <20220419163810.2118169-4-arnd@kernel.org>
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

This is not used by any drivers, so make it private to the
platform.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/{include/mach => }/regs-uart.h | 0
 arch/arm/mach-pxa/viper.c                        | 2 +-
 arch/arm/mach-pxa/zeus.c                         | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm/mach-pxa/{include/mach => }/regs-uart.h (100%)

diff --git a/arch/arm/mach-pxa/include/mach/regs-uart.h b/arch/arm/mach-pxa/regs-uart.h
similarity index 100%
rename from arch/arm/mach-pxa/include/mach/regs-uart.h
rename to arch/arm/mach-pxa/regs-uart.h
diff --git a/arch/arm/mach-pxa/viper.c b/arch/arm/mach-pxa/viper.c
index 3aa34e9a15d3..4b81c0117971 100644
--- a/arch/arm/mach-pxa/viper.c
+++ b/arch/arm/mach-pxa/viper.c
@@ -48,7 +48,7 @@
 #include "pxa25x.h"
 #include <mach/audio.h>
 #include <linux/platform_data/video-pxafb.h>
-#include <mach/regs-uart.h>
+#include "regs-uart.h"
 #include <linux/platform_data/pcmcia-pxa2xx_viper.h>
 #include "viper.h"
 
diff --git a/arch/arm/mach-pxa/zeus.c b/arch/arm/mach-pxa/zeus.c
index 97700429633e..5d02f10b5b5a 100644
--- a/arch/arm/mach-pxa/zeus.c
+++ b/arch/arm/mach-pxa/zeus.c
@@ -39,7 +39,7 @@
 
 #include "pxa27x.h"
 #include "devices.h"
-#include <mach/regs-uart.h>
+#include "regs-uart.h"
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include "pxa27x-udc.h"
-- 
2.29.2

