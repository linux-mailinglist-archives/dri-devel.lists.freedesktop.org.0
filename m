Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ED9A686DF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 09:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850D410E2E8;
	Wed, 19 Mar 2025 08:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PKwhMwdE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nb1AukRi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PKwhMwdE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nb1AukRi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811A710E23C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 08:34:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 86B012174F;
 Wed, 19 Mar 2025 08:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742373233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IkiDZKgtChK2EG4JCBmvhfevaGE+EkkVGm6oM93LU/E=;
 b=PKwhMwdE8zDmtwl781CbFpMMEsXMsaaM+DQfxGYIQzUDcuz7m9EBpfg7ejwxyeCjcFMPdB
 1fBsqTo1u826kkK53hSRsKbwywy/owNSw3j44fiT0Sf7DSsi2UtY1N0bko0I+rb7YhDJDu
 B9QhAtzO/mUOzV5bq5EeI2szFO1JuG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742373233;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IkiDZKgtChK2EG4JCBmvhfevaGE+EkkVGm6oM93LU/E=;
 b=nb1AukRiBj/JhqwkxIx+0rkjW8kYsm0SyeldaAU150xbo0l3bauNeeApqTa2fM7FbJRQSl
 daUuYEKHp2wBqvDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742373233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IkiDZKgtChK2EG4JCBmvhfevaGE+EkkVGm6oM93LU/E=;
 b=PKwhMwdE8zDmtwl781CbFpMMEsXMsaaM+DQfxGYIQzUDcuz7m9EBpfg7ejwxyeCjcFMPdB
 1fBsqTo1u826kkK53hSRsKbwywy/owNSw3j44fiT0Sf7DSsi2UtY1N0bko0I+rb7YhDJDu
 B9QhAtzO/mUOzV5bq5EeI2szFO1JuG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742373233;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IkiDZKgtChK2EG4JCBmvhfevaGE+EkkVGm6oM93LU/E=;
 b=nb1AukRiBj/JhqwkxIx+0rkjW8kYsm0SyeldaAU150xbo0l3bauNeeApqTa2fM7FbJRQSl
 daUuYEKHp2wBqvDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 51A6013A2C;
 Wed, 19 Mar 2025 08:33:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eKjCEnGB2mc+OQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Mar 2025 08:33:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/18] drm: Move sysfb drivers into separate subdirectory
Date: Wed, 19 Mar 2025 08:45:03 +0100
Message-ID: <20250319083021.6472-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319083021.6472-1-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org];
 RCPT_COUNT_SEVEN(0.00)[7]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
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

The ofdrm and simpledrm drivers are special as they operate on
externally provided framebuffers. Move them into their own sub-
directory. Will let them share common code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 MAINTAINERS                                 |  3 +-
 drivers/gpu/drm/Kconfig                     |  2 ++
 drivers/gpu/drm/Makefile                    |  1 +
 drivers/gpu/drm/sysfb/Kconfig               | 38 +++++++++++++++++++++
 drivers/gpu/drm/sysfb/Makefile              |  4 +++
 drivers/gpu/drm/{tiny => sysfb}/ofdrm.c     |  0
 drivers/gpu/drm/{tiny => sysfb}/simpledrm.c |  0
 drivers/gpu/drm/tiny/Kconfig                | 32 -----------------
 drivers/gpu/drm/tiny/Makefile               |  2 --
 9 files changed, 46 insertions(+), 36 deletions(-)
 create mode 100644 drivers/gpu/drm/sysfb/Kconfig
 create mode 100644 drivers/gpu/drm/sysfb/Makefile
 rename drivers/gpu/drm/{tiny => sysfb}/ofdrm.c (100%)
 rename drivers/gpu/drm/{tiny => sysfb}/simpledrm.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9df9b25fffc3..588cea0e8630 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7247,8 +7247,7 @@ M:	Javier Martinez Canillas <javierm@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-F:	drivers/gpu/drm/tiny/ofdrm.c
-F:	drivers/gpu/drm/tiny/simpledrm.c
+F:	drivers/gpu/drm/sysfb/
 F:	drivers/video/aperture.c
 F:	drivers/video/nomodeset.c
 F:	include/linux/aperture.h
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 1be14d8634f4..200bfbb9f093 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -335,6 +335,8 @@ config DRM_SCHED
 	tristate
 	depends on DRM
 
+source "drivers/gpu/drm/sysfb/Kconfig"
+
 source "drivers/gpu/drm/arm/Kconfig"
 
 source "drivers/gpu/drm/radeon/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index ed54a546bbe2..bf5cb7936a1d 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -204,6 +204,7 @@ obj-$(CONFIG_DRM_FSL_DCU) += fsl-dcu/
 obj-$(CONFIG_DRM_ETNAVIV) += etnaviv/
 obj-y			+= hisilicon/
 obj-y			+= mxsfb/
+obj-y			+= sysfb/
 obj-y			+= tiny/
 obj-$(CONFIG_DRM_PL111) += pl111/
 obj-$(CONFIG_DRM_TVE200) += tve200/
diff --git a/drivers/gpu/drm/sysfb/Kconfig b/drivers/gpu/drm/sysfb/Kconfig
new file mode 100644
index 000000000000..9eafc06b7192
--- /dev/null
+++ b/drivers/gpu/drm/sysfb/Kconfig
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menu "Drivers for system framebuffers"
+	depends on DRM
+
+config DRM_OFDRM
+	tristate "Open Firmware display driver"
+	depends on DRM && MMU && OF && (PPC || COMPILE_TEST)
+	select APERTURE_HELPERS
+	select DRM_CLIENT_SELECTION
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
+	help
+	  DRM driver for Open Firmware framebuffers.
+
+	  This driver assumes that the display hardware has been initialized
+	  by the Open Firmware before the kernel boots. Scanout buffer, size,
+	  and display format must be provided via device tree.
+
+config DRM_SIMPLEDRM
+	tristate "Simple framebuffer driver"
+	depends on DRM && MMU
+	select APERTURE_HELPERS
+	select DRM_CLIENT_SELECTION
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
+	help
+	  DRM driver for simple platform-provided framebuffers.
+
+	  This driver assumes that the display hardware has been initialized
+	  by the firmware or bootloader before the kernel boots. Scanout
+	  buffer, size, and display format must be provided via device tree,
+	  UEFI, VESA, etc.
+
+	  On x86 BIOS or UEFI systems, you should also select SYSFB_SIMPLEFB
+	  to use UEFI and VESA framebuffers.
+
+endmenu
diff --git a/drivers/gpu/drm/sysfb/Makefile b/drivers/gpu/drm/sysfb/Makefile
new file mode 100644
index 000000000000..f6c03629accb
--- /dev/null
+++ b/drivers/gpu/drm/sysfb/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_DRM_OFDRM)		+= ofdrm.o
+obj-$(CONFIG_DRM_SIMPLEDRM)	+= simpledrm.o
diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
similarity index 100%
rename from drivers/gpu/drm/tiny/ofdrm.c
rename to drivers/gpu/drm/sysfb/ofdrm.c
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
similarity index 100%
rename from drivers/gpu/drm/tiny/simpledrm.c
rename to drivers/gpu/drm/sysfb/simpledrm.c
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 54c84c9801c1..95c1457d7730 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -65,20 +65,6 @@ config DRM_GM12U320
 	 This is a KMS driver for projectors which use the GM12U320 chipset
 	 for video transfer over USB2/3, such as the Acer C120 mini projector.
 
-config DRM_OFDRM
-	tristate "Open Firmware display driver"
-	depends on DRM && MMU && OF && (PPC || COMPILE_TEST)
-	select APERTURE_HELPERS
-	select DRM_CLIENT_SELECTION
-	select DRM_GEM_SHMEM_HELPER
-	select DRM_KMS_HELPER
-	help
-	  DRM driver for Open Firmware framebuffers.
-
-	  This driver assumes that the display hardware has been initialized
-	  by the Open Firmware before the kernel boots. Scanout buffer, size,
-	  and display format must be provided via device tree.
-
 config DRM_PANEL_MIPI_DBI
 	tristate "DRM support for MIPI DBI compatible panels"
 	depends on DRM && SPI
@@ -95,24 +81,6 @@ config DRM_PANEL_MIPI_DBI
 	  https://github.com/notro/panel-mipi-dbi/wiki.
 	  To compile this driver as a module, choose M here.
 
-config DRM_SIMPLEDRM
-	tristate "Simple framebuffer driver"
-	depends on DRM && MMU
-	select APERTURE_HELPERS
-	select DRM_CLIENT_SELECTION
-	select DRM_GEM_SHMEM_HELPER
-	select DRM_KMS_HELPER
-	help
-	  DRM driver for simple platform-provided framebuffers.
-
-	  This driver assumes that the display hardware has been initialized
-	  by the firmware or bootloader before the kernel boots. Scanout
-	  buffer, size, and display format must be provided via device tree,
-	  UEFI, VESA, etc.
-
-	  On x86 BIOS or UEFI systems, you should also select SYSFB_SIMPLEFB
-	  to use UEFI and VESA framebuffers.
-
 config TINYDRM_HX8357D
 	tristate "DRM support for HX8357D display panels"
 	depends on DRM && SPI
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 0a3a7837a58b..ba4a60bb72bd 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -5,9 +5,7 @@ obj-$(CONFIG_DRM_ARCPGU)		+= arcpgu.o
 obj-$(CONFIG_DRM_BOCHS)			+= bochs.o
 obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus-qemu.o
 obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
-obj-$(CONFIG_DRM_OFDRM)			+= ofdrm.o
 obj-$(CONFIG_DRM_PANEL_MIPI_DBI)	+= panel-mipi-dbi.o
-obj-$(CONFIG_DRM_SIMPLEDRM)		+= simpledrm.o
 obj-$(CONFIG_TINYDRM_HX8357D)		+= hx8357d.o
 obj-$(CONFIG_TINYDRM_ILI9163)		+= ili9163.o
 obj-$(CONFIG_TINYDRM_ILI9225)		+= ili9225.o
-- 
2.48.1

