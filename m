Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B89899E041
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 10:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8973810E0DB;
	Tue, 15 Oct 2024 08:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pxtd4LP5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF94010E0DB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 08:04:47 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-430558cddbeso34144695e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 01:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728979486; x=1729584286; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0caYVR1pg5Rq1O4FBXQi9SrRUN2FQI8Lj8s2gNiWkqI=;
 b=Pxtd4LP5JzkXz9/X+79lN1ZCv/7PtrwGBzPvFRZQvPHY2Bp+E4bq+qGsuekaAVOB5s
 YsSADH4J6o9Bt7QgaR3TgbTJk44/X89kGT3EHKfTCP426fZDyNvZ7V4bFJ/Mmz0apI1O
 pcD4Nvqy97yCRmUUNrH7np1RUhw2IzuE+cDe09KnDOm/3r/3F1EH2zHi+ZguLUbYXBcU
 HZ7MmpZ8xYdVRts5W07nohL0owyPBagwAlB79MAuYQM6T425uxb6dstZZWhFyH02EmEl
 MXkqnUzZdZk6Ylip6RclA5IKK/9fLKU/r+Onb7olpL1CSwPxynOfvKH6G8fX8OSHTCrQ
 bb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728979486; x=1729584286;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0caYVR1pg5Rq1O4FBXQi9SrRUN2FQI8Lj8s2gNiWkqI=;
 b=WAyqws6OHjMXlVY3bpQRQCzdeMIZ5cyMr7P5zSaNa7QWaXnqvpV+/VMAnO5w4J2hbJ
 WcftKadM/jFlqJXuO/PvaTMh4/WkCgtFnucrrZuR0+Zf0QA9OZeT0T2Tjb2VMyqeYj/S
 cztdUbuf1Lgv29TcJm2w3xmMxEitp+K7foiBmy7gR0pye0KNKooFAh86kC0bb87fWYGr
 jFOXvv/kcN9pa0o5eRSbXzlcgGKRoAE2YfmaZxGQRkL9a8NxKcqKvaaoFTVh8nDxFOZ+
 wz18qDJFi6OKYPR2qDYbN54RZBwzOu68Lm7GaE1G3kKmNH4jHZahHhiFrajiLJzpeSRp
 i/xw==
X-Gm-Message-State: AOJu0YxJ3pb/InNYTw0l32eb46OLaG3GA/2G0tTmLpA9E+LlKpFtt36d
 hZi/1nJKq4Y/vVnySqln5lFFMp2MSN8+5B5zcvKNetIyMj7d9XBg
X-Google-Smtp-Source: AGHT+IFvKR0+6x9JX7Vh87yg9VTlpuo2dLXkWy9dO/nzv74nZCjMSHoVP+4Tig2IGJk2shTsmfOLgA==
X-Received: by 2002:a05:600c:4f14:b0:42c:b826:a26c with SMTP id
 5b1f17b1804b1-43115aa7323mr144439565e9.8.1728979485844; 
 Tue, 15 Oct 2024 01:04:45 -0700 (PDT)
Received: from Gonzalo.udc.pri (natpw271.usc.es. [193.144.81.196])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4313f56f24csm10040635e9.28.2024.10.15.01.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 01:04:45 -0700 (PDT)
From: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>
To: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, thomas.zimmermann@suse.de,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>
Subject: [PATCH v3] fbdev: sstfb: Make CONFIG_FB_DEVICE optional and update
 Kconfig dependency
Date: Tue, 15 Oct 2024 10:04:39 +0200
Message-Id: <20241015080439.5931-1-gonzalo.silvalde@gmail.com>
X-Mailer: git-send-email 2.39.5
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

The sstfb driver currently depends on CONFIG_FB_DEVICE to create sysfs
entries and access info->dev. This patch wraps the relevant code blocks
with #ifdef CONFIG_FB_DEVICE, allowing the driver to be built and used
even if CONFIG_FB_DEVICE is not selected.

Additionally, the dependency on CONFIG_FB_DEVICE in the Kconfig file
has been removed for the FB_VOODOO1 driver, allowing it to be selected
independently of the FB_DEVICE option. This is because the sysfs setting
only controls the VGA pass-through state and is not required for the
display to function properly.

For more information on VGA pass-through, see:
http://vogonswiki.com/index.php/VGA_passthrough_cable

Tested by building with and without CONFIG_FB_DEVICE enabled, and both
configurations compiled successfully without issues.

Signed-off-by: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>
---
 drivers/video/fbdev/Kconfig |  1 -
 drivers/video/fbdev/sstfb.c | 13 ++++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index ea36c6956bf3..44a8fdbab6df 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1236,7 +1236,6 @@ config FB_3DFX_I2C
 config FB_VOODOO1
 	tristate "3Dfx Voodoo Graphics (sst1) support"
 	depends on FB && PCI
-	depends on FB_DEVICE
 	select FB_IOMEM_HELPERS
 	help
 	  Say Y here if you have a 3Dfx Voodoo Graphics (Voodoo1/sst1) or
diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
index f8ae54ca0cc3..1d6ef97f1a84 100644
--- a/drivers/video/fbdev/sstfb.c
+++ b/drivers/video/fbdev/sstfb.c
@@ -716,6 +716,7 @@ static void sstfb_setvgapass( struct fb_info *info, int enable )
 	pci_write_config_dword(sst_dev, PCI_INIT_ENABLE, tmp);
 }
 
+#ifdef CONFIG_FB_DEVICE
 static ssize_t store_vgapass(struct device *device, struct device_attribute *attr,
 			const char *buf, size_t count)
 {
@@ -736,10 +737,10 @@ static ssize_t show_vgapass(struct device *device, struct device_attribute *attr
 	struct sstfb_par *par = info->par;
 	return sprintf(buf, "%d\n", par->vgapass);
 }
-
 static struct device_attribute device_attrs[] = {
 	__ATTR(vgapass, S_IRUGO|S_IWUSR, show_vgapass, store_vgapass)
-	};
+};
+#endif
 
 static int sstfb_ioctl(struct fb_info *info, unsigned int cmd,
 			unsigned long arg)
@@ -1435,10 +1436,10 @@ static int sstfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	}
 
 	sstfb_clear_screen(info);
-
+#ifdef CONFIG_FB_DEVICE
 	if (device_create_file(info->dev, &device_attrs[0]))
 		printk(KERN_WARNING "sstfb: can't create sysfs entry.\n");
-
+#endif
 
 	fb_info(info, "%s frame buffer device at 0x%p\n",
 		fix->id, info->screen_base);
@@ -1467,8 +1468,9 @@ static void sstfb_remove(struct pci_dev *pdev)
 
 	info = pci_get_drvdata(pdev);
 	par = info->par;
-
+#ifdef CONFIG_FB_DEVICE
 	device_remove_file(info->dev, &device_attrs[0]);
+#endif
 	sst_shutdown(info);
 	iounmap(info->screen_base);
 	iounmap(par->mmio_vbase);
@@ -1536,3 +1538,4 @@ MODULE_PARM_DESC(slowpci, "Uses slow PCI settings (0 or 1) (default=0)");
 module_param(mode_option, charp, 0);
 MODULE_PARM_DESC(mode_option, "Initial video mode (default=" DEFAULT_VIDEO_MODE ")");
 
+
-- 
2.39.5

