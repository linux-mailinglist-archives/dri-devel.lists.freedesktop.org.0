Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE7D1D2189
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 23:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089BB6EA8A;
	Wed, 13 May 2020 21:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA236EA8A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 21:56:24 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e16so1333633wra.7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 14:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hwonKHzFuATNeAdoyzCvSTRBuE9NuTgicFg1W8wjFZg=;
 b=vHMbGgI7Rodl3kyPSAXHxWobKHo1GYSJ4oa2Z3FZcTd8iL1WF+wNrqZcu2RhW6OW2p
 jlPqiypDyN9iMTgTznUUpON9fpnWagb18lPHwXU2RlRWDbdNpCdrObQXBlybQNOp6iYl
 zkKYmHhlN3UPtxPXZZxUMULABWT0PL0ZX19LWaS+r8CYoow4yCUVQKb94UCT/efyiu6v
 ken+Xh4UOxhO7XbvSEB/SIoZKCHJeRO0g0zKqIlVJHCtYgJ+QlkLjLaeo8eN7VtiYCKo
 +v4ekNfkJmNj5r/Ud+YfrNYEePcEkka+3NsDGnMsF4kjf/4CS+9QdEjw5b4o5PoyjlDs
 OTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hwonKHzFuATNeAdoyzCvSTRBuE9NuTgicFg1W8wjFZg=;
 b=nX7WO9oKxMGlPUUD8pUzIShWAzpKRVf5RTN75ioi6YfAjL4xTdWCr3lmUrY+2NOeiE
 997B6XX7/vBQuiDjFo8HWP9JRvhgJsGjFAVGXK8HKJKlma12rRtMeal+9Z8K4Kc1Y8KY
 ZLKMlDsofdJ1FmIp2oLI6ONuKOI5+5/MAtx/KoeV0OHjz1CO64lexOp3LKZfD6M/E1LK
 UXZCl3a9Fe6oXyvZNaFxzNx7444mIxE4i8fjpJcOHPo81V29x4dXcQZzjQEL0rLT/t0U
 DncgTgGlTaIJyoKVXKt0fshM3nhnxsPlJSvTqRCIrSyOQBhjX2pjpqXXtppsjFuGDiN6
 rQag==
X-Gm-Message-State: AOAM533bCV2fLkAF0z6GWlnk8ivPKavst7aHHbaVU2HSU2i0nRbLclTF
 FJ7CvTPVJESvXoUaYO0QwIR32knU
X-Google-Smtp-Source: ABdhPJwZab0RhfCQOqf/Ht72DHQCZ1jIssnq1PG+HQQCEjv/FfAMFsFPDkcvD1ObXYb4L1Cdf4yA7g==
X-Received: by 2002:a5d:4b09:: with SMTP id v9mr1548869wrq.297.1589406982352; 
 Wed, 13 May 2020 14:56:22 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id h133sm192371wmf.25.2020.05.13.14.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 14:56:21 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev: annotate rivafb/nvidiafb as obsolete
Date: Wed, 13 May 2020 22:53:42 +0100
Message-Id: <20200513215342.2145495-1-emil.l.velikov@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, emil.l.velikov@gmail.com,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers have not seen any love for years.

Be that fixes or improvements, or cosmetics like introducing symbolic
names, style and code-flow polish.

Seemingly the maintainer has also disappeared years ago :-\

Considering nouveau supports all that hardware (modulo nv03) just mark
these as obsolete/broken, referring to nouveau in the help text.

Cc: Antonino Daplas <adaplas@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 MAINTAINERS                           | 3 +--
 arch/powerpc/configs/g5_defconfig     | 2 --
 arch/powerpc/configs/pasemi_defconfig | 2 --
 arch/powerpc/configs/pmac32_defconfig | 2 --
 arch/powerpc/configs/ppc6xx_defconfig | 3 ---
 drivers/video/fbdev/Kconfig           | 6 ++++++
 6 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 515a81fdb7d6..cc9da9a1e230 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11247,9 +11247,8 @@ F:	include/linux/nubus.h
 F:	include/uapi/linux/nubus.h
 
 NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
-M:	Antonino Daplas <adaplas@gmail.com>
 L:	linux-fbdev@vger.kernel.org
-S:	Maintained
+S:	Obsolete
 F:	drivers/video/fbdev/riva/
 F:	drivers/video/fbdev/nvidia/
 
diff --git a/arch/powerpc/configs/g5_defconfig b/arch/powerpc/configs/g5_defconfig
index ceb3c770786f..24225e39662a 100644
--- a/arch/powerpc/configs/g5_defconfig
+++ b/arch/powerpc/configs/g5_defconfig
@@ -130,8 +130,6 @@ CONFIG_FB=y
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_OF=y
-CONFIG_FB_NVIDIA=y
-CONFIG_FB_NVIDIA_I2C=y
 CONFIG_FB_RADEON=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/powerpc/configs/pasemi_defconfig b/arch/powerpc/configs/pasemi_defconfig
index c0423b2cf7c0..36b242efae9a 100644
--- a/arch/powerpc/configs/pasemi_defconfig
+++ b/arch/powerpc/configs/pasemi_defconfig
@@ -107,8 +107,6 @@ CONFIG_DRM_RADEON=y
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_VGA16=y
-CONFIG_FB_NVIDIA=y
-CONFIG_FB_NVIDIA_I2C=y
 CONFIG_FB_RADEON=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_VGACON_SOFT_SCROLLBACK=y
diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index 50b610b48914..ef4470d44763 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -211,8 +211,6 @@ CONFIG_FB_PLATINUM=y
 CONFIG_FB_VALKYRIE=y
 CONFIG_FB_CT65550=y
 CONFIG_FB_IMSTT=y
-CONFIG_FB_NVIDIA=y
-CONFIG_FB_NVIDIA_I2C=y
 CONFIG_FB_MATROX=y
 CONFIG_FB_MATROX_MILLENIUM=y
 CONFIG_FB_MATROX_MYSTIQUE=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 7c6baf6df139..5b4e26de0bcf 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -752,9 +752,6 @@ CONFIG_FB_OF=y
 CONFIG_FB_PLATINUM=y
 CONFIG_FB_VALKYRIE=y
 CONFIG_FB_CT65550=y
-CONFIG_FB_NVIDIA=y
-CONFIG_FB_NVIDIA_I2C=y
-CONFIG_FB_RIVA=m
 CONFIG_FB_MATROX=y
 CONFIG_FB_MATROX_MILLENIUM=y
 CONFIG_FB_MATROX_MYSTIQUE=y
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 1b2f5f31fb6f..cad3e4bc5e52 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -868,6 +868,7 @@ config FB_ATMEL
 
 config FB_NVIDIA
 	tristate "nVidia Framebuffer Support"
+	depends on BROKEN
 	depends on FB && PCI
 	select FB_BACKLIGHT if FB_NVIDIA_BACKLIGHT
 	select FB_MODE_HELPERS
@@ -877,6 +878,8 @@ config FB_NVIDIA
 	select BITREVERSE
 	select VGASTATE
 	help
+	  Obsolete, use nouveau instead.
+
 	  This driver supports graphics boards with the nVidia chips, TNT
 	  and newer. For very old chipsets, such as the RIVA128, then use
 	  the rivafb.
@@ -915,6 +918,7 @@ config FB_NVIDIA_BACKLIGHT
 
 config FB_RIVA
 	tristate "nVidia Riva support"
+	depends on BROKEN
 	depends on FB && PCI
 	select FB_BACKLIGHT if FB_RIVA_BACKLIGHT
 	select FB_MODE_HELPERS
@@ -924,6 +928,8 @@ config FB_RIVA
 	select BITREVERSE
 	select VGASTATE
 	help
+	  Obsolete, use nouveau instead.
+
 	  This driver supports graphics boards with the nVidia Riva/Geforce
 	  chips.
 	  Say Y if you have such a graphics board.
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
