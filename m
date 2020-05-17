Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 487481D6DC3
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 00:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B1F89D67;
	Sun, 17 May 2020 22:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD20389D67
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 22:08:14 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id k12so7410997wmj.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 15:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L84eJGx9nrBqB4ScS+pZZVQbMN8D1zpwWqD1mcXWMRo=;
 b=lsbMd8LBESCC1CS6XdcoNp4FHO5Q5lU3uDTrLk0cjtrsZtBbeCdHxhlcUN1grz70JG
 EEA74kNc+KkGSvydt2S9Iywv6XhQ7uzLOwXewMgMe50Hvrgum/zMbn/H/tBY+xxR1e4O
 sMagNsYN8Kkx+cN/dwQQv2BdG81I/FZMtGH1XpYLYYUbu9kJ2TV+6TyoLuL/Z+VV3//I
 9pgHTvwwtDP91oZmNttEepYzgxlj1z2sQO/jwj9BOxC31xfZ37xhcw/EGiVtkMCXNf12
 pMUxQxvtyuPqBQm6QRYzD0+Fempd8rbJJFMyZFDceUEDUWs1g0fwhJlxeP/ogxTW4Mfd
 ldXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L84eJGx9nrBqB4ScS+pZZVQbMN8D1zpwWqD1mcXWMRo=;
 b=c9mHYNo7CRtZtSSesmX6qenFmYV4hZ/p3OOXGd1e4nLrihMia3/f182Z+MOVkPrtDJ
 5PD1kjfuQRh7dAraGOZrvyeuXaAbQt5petAWj4IJnNzw4jihbTk4obxtcQsnOz7pY48P
 Koe3W8NRzAQzeZpVUq3hcIXWsGnHLGmsxiGBnRos0G1WQqtKKBBjg35cPC5Wf0WnZs6D
 IhqeuKQ+94qHh5nZ4RzZvphKmiKGTlKzQV2UZOfZPNKoQPi9lmrIUIOPrPMIWRM4ec1X
 s9dcDR1PYPJsvKJMrPu1EJRSxvhaGRl1U7uNo0d0W9u4F7Z4BJg6/F2GOkJl4rkj4SAI
 XJOw==
X-Gm-Message-State: AOAM530o7E6CWx55zpbJJ98JeCh/xxBN08J+jWv2hGy+bjNjOrdLObCJ
 LiVgmb7zoZV5qsb6LeR18oUMYSUc
X-Google-Smtp-Source: ABdhPJxFmsVmzuCAAXDb7Ie+EhKSRU9KNaJEROz6onOoR7FWnj3tr2kR/+uAq5xSOpNHJJEVlyyrPw==
X-Received: by 2002:a1c:2943:: with SMTP id p64mr172717wmp.42.1589753293111;
 Sun, 17 May 2020 15:08:13 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id d9sm13805482wmd.10.2020.05.17.15.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 15:08:12 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] fbdev: annotate rivafb/nvidiafb as obsolete
Date: Sun, 17 May 2020 23:05:23 +0100
Message-Id: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
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

v2 (Bartlomiej):
 - split config changes into separate patch
 - spell out nouveau DRM driver
 - don't use BROKEN
 - add runtime warning

Cc: Antonino Daplas <adaplas@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v1)
---
 MAINTAINERS                         | 3 +--
 drivers/video/fbdev/Kconfig         | 4 ++++
 drivers/video/fbdev/nvidia/nvidia.c | 3 +++
 drivers/video/fbdev/riva/fbdev.c    | 3 +++
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 938316092634..c9498dd15e4a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12055,9 +12055,8 @@ F:	include/linux/nubus.h
 F:	include/uapi/linux/nubus.h
 
 NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
-M:	Antonino Daplas <adaplas@gmail.com>
 L:	linux-fbdev@vger.kernel.org
-S:	Maintained
+S:	Obsolete
 F:	drivers/video/fbdev/nvidia/
 F:	drivers/video/fbdev/riva/
 
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index fa88e8b9a83d..ccddd06ab430 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -881,6 +881,8 @@ config FB_NVIDIA
 	select BITREVERSE
 	select VGASTATE
 	help
+	  Obsolete, use the nouveau DRM driver instead.
+
 	  This driver supports graphics boards with the nVidia chips, TNT
 	  and newer. For very old chipsets, such as the RIVA128, then use
 	  the rivafb.
@@ -928,6 +930,8 @@ config FB_RIVA
 	select BITREVERSE
 	select VGASTATE
 	help
+	  Obsolete, use the nouveau DRM driver instead.
+
 	  This driver supports graphics boards with the nVidia Riva/Geforce
 	  chips.
 	  Say Y if you have such a graphics board.
diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index c24de9107958..a958612ef75b 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -1512,6 +1512,9 @@ static struct pci_driver nvidiafb_driver = {
 
 static int nvidiafb_init(void)
 {
+	pr_warn("Legacy nvidiafb framebuffer driver will be removed in 2022\n"
+		"Please switch to nouveau DRM driver\n");
+
 #ifndef MODULE
 	char *option = NULL;
 
diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
index 764ec3285e62..c2788e22f5c1 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -2160,6 +2160,9 @@ static struct pci_driver rivafb_driver = {
 
 static int rivafb_init(void)
 {
+	pr_warn("Legacy rivafb framebuffer driver will be removed in 2022\n"
+		"Please switch to nouveau DRM driver\n");
+
 #ifndef MODULE
 	char *option = NULL;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
