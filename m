Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EDF506DB9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68C110EFCD;
	Tue, 19 Apr 2022 13:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9270210EFCD
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:40:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 13737616C9;
 Tue, 19 Apr 2022 13:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F781C385AF;
 Tue, 19 Apr 2022 13:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375645;
 bh=LP9bbU3MqE1mo0qlsHP17AGtQ9utDR1mCwd3GRyFRr4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M/YHCSpeMYgwnnRYACPWzb5HEoTcv0Uo+NjAgUJua+1h56xSW2dsYBRjZfK1E2BdW
 ufGtCxWaK9OFsPZeVaEUcov5M3hta5Q+TJb3cdQu3RTCCHtk2DsusHYPyQF7LJHnTI
 IL8FxI+oDR/0/IzsSioLFjIlnMk2NFJMoFJ3B6APAiFOTW85BTHE0LXGnXdGVfGd13
 wCsvqkLvGaTKrsfN+TZgA0RrRTWoDmZBdsDJObGLaggZ6D5MCMY5yAp86WDvGn4KIc
 1iB23i3dMqJKuazzVP/9pqxdegdyW0H0DLYhyKg4JgYtwpC2ocseM+UbPIVSebgCgU
 9Edk9oMYpOBkA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 25/41] ARM: omap: remove empty plat-omap directory
Date: Tue, 19 Apr 2022 15:37:07 +0200
Message-Id: <20220419133723.1394715-26-arnd@kernel.org>
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

The last file in this directory is gone, and it can be removed as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Makefile           | 1 -
 arch/arm/plat-omap/Makefile | 9 ---------
 2 files changed, 10 deletions(-)
 delete mode 100644 arch/arm/plat-omap/Makefile

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index a2391b8de5a5..7bcf59d0d315 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -228,7 +228,6 @@ machine-$(CONFIG_PLAT_SPEAR)		+= spear
 
 # Platform directory name.  This list is sorted alphanumerically
 # by CONFIG_* macro name.
-plat-$(CONFIG_ARCH_OMAP)	+= omap
 plat-$(CONFIG_PLAT_ORION)	+= orion
 plat-$(CONFIG_PLAT_PXA)		+= pxa
 plat-$(CONFIG_PLAT_VERSATILE)	+= versatile
diff --git a/arch/arm/plat-omap/Makefile b/arch/arm/plat-omap/Makefile
deleted file mode 100644
index fefce2e1eaf3..000000000000
--- a/arch/arm/plat-omap/Makefile
+++ /dev/null
@@ -1,9 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-#
-# Makefile for the linux kernel.
-#
-
-ccflags-$(CONFIG_ARCH_MULTIPLATFORM) := -I$(srctree)/arch/arm/plat-omap/include
-
-# Common support
-obj-y :=
-- 
2.29.2

