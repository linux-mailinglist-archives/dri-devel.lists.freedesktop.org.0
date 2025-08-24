Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD229B33128
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 17:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43BB10E094;
	Sun, 24 Aug 2025 15:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gBYsnenm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174EE10E094
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 15:23:40 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4b109c58e29so67305561cf.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 08:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756049019; x=1756653819; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1J4EbcOf2LhfDb/WvZfcB3qbTMY0IghRJsrEw4IQnZ8=;
 b=gBYsnenm47Woy6EtCVTlzVDxwCtM5IU4BWCMSRIpVIIB5rct2F0+URSDrsZQVB5tBx
 c8cMwY2RGFKw8BjobyCLjRNy41aP2D1iaZdLqPH8SwGCATMbDANlJNUjFnm3f0VJ9BBZ
 A/EAOM5HSqnisp/liRPBvqaxVbnooKr7W042EUfoO0vluTiqMCoH8ln7eBgM9vIAhnnS
 fsnP/cbDyS7zvaNGv3LoddVi2sj+zE7A8TQsBAzQXRQezHFW5+jLJYz+tOhcDBXTKzaF
 ILAAzfHyo5tyi2V42U2G/HajIR4TTo1NWeWVlRQu9njtGLLZ1TfHll6SwLcbgBijWCFv
 KDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756049019; x=1756653819;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1J4EbcOf2LhfDb/WvZfcB3qbTMY0IghRJsrEw4IQnZ8=;
 b=U4d0Or67Hx/QlBISLOJr1IkDRM/lOVcl1E66AvjACaPk8qMC/lGwExlPP7g9/cFJpi
 7wcINeisIEJqoFNhKM5B1+nsS+XSmmxMBWx3XRh5hHYTqYk02k90eBnorSCvVIJkZ2G2
 /teRWrYYUVxOUL19o5x3D/3Wu1dD6mXqrqgTGomF9gcDJ4wK4JmE78mi4yHknhAjIjjB
 +tl943btg7wFYFbZ0PxgK7jYgYtc4BYvM0sKlmVroCmzEKgp26VqBjWwnNILkCnbDH9s
 OuxRX3r3IX0tNmPPXmAcffdTSzQpuHMmy5us638VsKrA4UeC2iNiyDm2s8HoxKS4usHu
 oCHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVm7G4PA5v8/1prFR2ar0RiD7BI+DpUmozmOolAtVUPxIZwjBBE/9XriBIqmczu+o9XcrwtLK7S+M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMvSszWiUHaRHZxauT4IbVx9ySwDSiunLZFOtkqEYU9pmPesjg
 GMPVKXi3taFRNgZp+npDby+sQ535gCIurmDdj+7qEoTM2DCSuZAZtFue
X-Gm-Gg: ASbGnctbTRQCkpgHvVI1Oq7PC20PkkmttI8SfLz+MwnXR0kvXq9vDozbAi6bVQ1cx5n
 EgPfpRMnJxZSpCvDVXXib3CZBvDFivB4sTzrg37bejJii6gwHsTcQzkyRhxMKVQ8O6jx0DdJ6C1
 yePTZQsIBhVa4sCJYE/M0WuNs/tO3Hq4ziToNtK16pvSwDcgYXTyMIFchkjtuTn40/OgrQyVbun
 YCVSEE7TXHDGCuA0eEcHYBCFseHBD7QeSv11prRn7conlAlSh7/oGZIPp3UeaKXjKuqWXgaXN7X
 1tKTkoxZpXZ0dqgzbQltRMccNA3Wm6Ip93wytFN7ibkOlP15ZMJVApfq9uVuHcehUvWfb46cTq8
 lvalo59Ob8NAcjaIMbF68ZKZ4zw5CZBaKZ9dbbyqXb9lwQnuglwZ2rOQGbg==
X-Google-Smtp-Source: AGHT+IHa6yPvn+nHszvBp9rYLUGeFHo/D+GxPGScD6pQMA3XTmHN3fGBTgq3bBxfFIJ5AsF0ZnnlsQ==
X-Received: by 2002:a05:622a:1a89:b0:4b2:992b:c88d with SMTP id
 d75a77b69052e-4b2aaaa67demr105454991cf.20.1756049019009; 
 Sun, 24 Aug 2025 08:23:39 -0700 (PDT)
Received: from cr-x-redhat96-nsd-2.fyre.ibm.com ([129.41.87.0])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b2b8e502cfsm33859801cf.49.2025.08.24.08.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 08:23:38 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: simona@ffwll.ch,
	deller@gmx.de,
	adaplas@gmail.com
Cc: raag.jadav@intel.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH] fbdev: Use string choices helpers
Date: Sun, 24 Aug 2025 08:23:27 -0700
Message-ID: <20250824152327.2390717-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use string_choices.h helpers instead of hard-coded strings.

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
 drivers/video/fbdev/core/fbmon.c    | 7 ++++---
 drivers/video/fbdev/nvidia/nvidia.c | 3 ++-
 drivers/video/fbdev/pxafb.c         | 3 ++-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core/fbmon.c
index 3b779c27c271..0a65bef01e3c 100644
--- a/drivers/video/fbdev/core/fbmon.c
+++ b/drivers/video/fbdev/core/fbmon.c
@@ -36,6 +36,7 @@
 #include <video/of_videomode.h>
 #include <video/videomode.h>
 #include "../edid.h"
+#include <linux/string_choices.h>
 
 /*
  * EDID parser
@@ -320,9 +321,9 @@ static void get_dpms_capabilities(unsigned char flags,
 	if (flags & DPMS_STANDBY)
 		specs->dpms |= FB_DPMS_STANDBY;
 	DPRINTK("      DPMS: Active %s, Suspend %s, Standby %s\n",
-	       (flags & DPMS_ACTIVE_OFF) ? "yes" : "no",
-	       (flags & DPMS_SUSPEND)    ? "yes" : "no",
-	       (flags & DPMS_STANDBY)    ? "yes" : "no");
+	       str_yes_no(flags & DPMS_ACTIVE_OFF),
+	       str_yes_no(flags & DPMS_SUSPEND),
+	       str_yes_no(flags & DPMS_STANDBY));
 }
 
 static void get_chroma(unsigned char *block, struct fb_monspecs *specs)
diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index cfaf9454014d..72b85f475605 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -22,6 +22,7 @@
 #include <linux/pci.h>
 #include <linux/console.h>
 #include <linux/backlight.h>
+#include <linux/string_choices.h>
 #ifdef CONFIG_BOOTX_TEXT
 #include <asm/btext.h>
 #endif
@@ -622,7 +623,7 @@ static int nvidiafb_set_par(struct fb_info *info)
 		else
 			par->FPDither = !!(NV_RD32(par->PRAMDAC, 0x083C) & 1);
 		printk(KERN_INFO PFX "Flat panel dithering %s\n",
-		       par->FPDither ? "enabled" : "disabled");
+		       str_enabled_disabled(par->FPDither));
 	}
 
 	info->fix.visual = (info->var.bits_per_pixel == 8) ?
diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index baf87f34cc24..b96a8a96bce8 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -60,6 +60,7 @@
 #include <linux/soc/pxa/cpu.h>
 #include <video/of_display_timing.h>
 #include <video/videomode.h>
+#include <linux/string_choices.h>
 
 #include <asm/io.h>
 #include <asm/irq.h>
@@ -1419,7 +1420,7 @@ static inline void __pxafb_lcd_power(struct pxafb_info *fbi, int on)
 
 		if (ret < 0)
 			pr_warn("Unable to %s LCD supply regulator: %d\n",
-				on ? "enable" : "disable", ret);
+				str_enable_disable(on), ret);
 		else
 			fbi->lcd_supply_enabled = on;
 	}
-- 
2.47.3

