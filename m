Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14949B9B26E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 19:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A8510E7A5;
	Wed, 24 Sep 2025 17:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JnaA0N5I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CFE10E7A5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 17:58:49 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-62fb48315ddso95017a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 10:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758736728; x=1759341528; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GKqJP+48MmB6+CsLCrP4WRsLC5jZbjywV4JQAy5jU3Y=;
 b=JnaA0N5ImtjKC/tlEl28u7xddAZR2Pe0ixY41qai0i+eLI0BASngXOqD++Jf0u7Fja
 sxVVCkZVIYFQpiXlIto25Ggvry17fCyCKFmSC3OXFcmumiBODUyO78nC99/VUBWZwHAE
 FUrtDF7GfjPUQNIYYZZ5pyUwydWwA7G/W46aZteX0vUmwFmDYfZK4KQd+X+70hbNg1op
 xiLX+7Z0kE1FvaMU8YJ4iMsLXr/eIlpjtMQao3HTZh8lVD9fAr7zNTS8csIjyfV1y1z9
 3q7N8GV2NOswHYQBtdAWPZw2cmnwpiEuI/0k8BsJEQkxUP9QkGisSX8KTCEzM7XHwfUw
 4Osg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758736728; x=1759341528;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GKqJP+48MmB6+CsLCrP4WRsLC5jZbjywV4JQAy5jU3Y=;
 b=Kod86OH7sIfULG3Gj12kz/XCgcnl4o1+TI//tOdMQjomYceVKE2aVfDpZNFKkLjQR+
 dTGZcSzs5Fu129i8w64pLY2XX9dVrWVfDlq19n3n1kE3d1Ylgz1d4qK1bRXbomWCQDPL
 D335lHxKkNvAlPasqQOZN5KKA0V1ZewKDOnkmUYHiFs8M7RnzZfEjXi1v6YK3kAYQsMX
 s74ba/te+Qp0gHAGsM4scEV5qcOLXmdvhpRmUtbnjQuzRxY9/Dk/xR6wu1O+tHqXviII
 Q34ZFqNF8kWa6azgYN8kVceDyXSxjSPBDCI2zKdAqCaUQik5/qcwWB0eaRrXpF6iD0Cf
 150w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz5/VOs0nrFyrkS9MCLd2MiONFE+OwmKNPGIpUwGVg2XrQDD74jxdh6hq81VQYsCxuFJ0W82h9mtM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2Gv/vejRc1lJ1cVAirC42d7dbNzPLDf+LZDcSZzimPjZW608q
 LiPNx6yKJJMQlrtdFcS05/dr2MhyoHzE/2pVrHYFwyU6PLZ3lJUh5iwK
X-Gm-Gg: ASbGncsM0O2wqfnwVBhKXaMMI3syhAripXBvh4L17EblqkPig8qFjC5X5n4SqR2HQJE
 FiIU9lNs8oWxZ5KVtqqYMLERAMNyLGcHvQ+ibaRJim9rfs2BW/AheNMHzfxZZBMSrbDAQLUtpUh
 bNLHCxq5aM3401/McxhQXcfvvxbsJMU7QWbO88fM2fzXZhMO12s9ScO64LLn6/kyKz/DwGs6wsv
 MSYJEyZ9k5bn82MUUcR5QlMFx41OfG1mMacL0bfuwKtlfaJKC57NPWstKlD/lX6q7OtxCi5QBI4
 Cm8bd+x39zGsBuh2HH2QaP10tK9a2uPnYrGAcCKY9ai8U1LBHuBNjHoSLVSNps541kqsAtcHRt9
 oZMFKrnRKHPQbgdQ=
X-Google-Smtp-Source: AGHT+IGK48eDiJPLwUG6CwWCcjw8mwwOjz0+lrph0QUuGNIzekpn8VliJE1l3jHE+fdBUys0/PFSAA==
X-Received: by 2002:a05:6402:180d:b0:62f:9cfb:7d34 with SMTP id
 4fb4d7f45d1cf-6349fa97d25mr223912a12.38.1758736726861; 
 Wed, 24 Sep 2025 10:58:46 -0700 (PDT)
Received: from hsukr3.. ([141.70.88.200]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6316acdfe14sm9080057a12.52.2025.09.24.10.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 10:58:46 -0700 (PDT)
From: Sukrut Heroorkar <hsukrut3@gmail.com>
To: Helge Deller <deller@gmx.de>, Bernie Thompson <bernie@plugable.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Sukrut Heroorkar <hsukrut3@gmail.com>, Zsolt Kajtar <soci@c64.rulez.org>,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
 dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
 linux-kernel@vger.kernel.org (open list)
Cc: skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Subject: [PATCH] fbdev: udlfb: make CONFIG_FB_DEVICE optional
Date: Wed, 24 Sep 2025 19:57:38 +0200
Message-ID: <20250924175743.6790-1-hsukrut3@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The udlfb driver exposes sysfs attributes thus depends upon
CONFIG_FB_DEVICE. This patch work wraps relavent code blocks
with #ifdef CONFIG_FB_DEVICE so that the driver can still be
built even when CONFIG_FB_DEVICE is not selected.

This addresses an item in Documentation/gpu/TODO.rst.

Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
---
Note: this change has only been compile-tested.

 drivers/video/fbdev/Kconfig | 1 -
 drivers/video/fbdev/udlfb.c | 8 ++++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 1500dca8c416..40442b80de17 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1596,7 +1596,6 @@ config FB_SMSCUFX
 config FB_UDL
 	tristate "Displaylink USB Framebuffer support"
 	depends on FB && USB
-	depends on FB_DEVICE
 	select FB_MODE_HELPERS
 	select FB_SYSMEM_HELPERS_DEFERRED
 	help
diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index ccede85df1e1..de2e310054d4 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -1382,6 +1382,7 @@ static int dlfb_setup_modes(struct dlfb_data *dlfb,
 	return result;
 }
 
+#ifdef CONFIG_FB_DEVICE
 static ssize_t metrics_bytes_rendered_show(struct device *fbdev,
 				   struct device_attribute *a, char *buf) {
 	struct fb_info *fb_info = dev_get_drvdata(fbdev);
@@ -1413,6 +1414,7 @@ static ssize_t metrics_cpu_kcycles_used_show(struct device *fbdev,
 	return sysfs_emit(buf, "%u\n",
 			atomic_read(&dlfb->cpu_kcycles_used));
 }
+#endif
 
 static ssize_t edid_show(
 			struct file *filp,
@@ -1486,6 +1488,7 @@ static const struct bin_attribute edid_attr = {
 	.write = edid_store
 };
 
+#ifdef CONFIG_FB_DEVICE
 static const struct device_attribute fb_device_attrs[] = {
 	__ATTR_RO(metrics_bytes_rendered),
 	__ATTR_RO(metrics_bytes_identical),
@@ -1493,6 +1496,7 @@ static const struct device_attribute fb_device_attrs[] = {
 	__ATTR_RO(metrics_cpu_kcycles_used),
 	__ATTR(metrics_reset, S_IWUSR, NULL, metrics_reset_store),
 };
+#endif
 
 /*
  * This is necessary before we can communicate with the display controller.
@@ -1702,6 +1706,7 @@ static int dlfb_usb_probe(struct usb_interface *intf,
 		goto error;
 	}
 
+#ifdef CONFIG_FB_DEVICE
 	for (i = 0; i < ARRAY_SIZE(fb_device_attrs); i++) {
 		attr = &fb_device_attrs[i];
 		retval = device_create_file(info->dev, attr);
@@ -1710,6 +1715,7 @@ static int dlfb_usb_probe(struct usb_interface *intf,
 				 "failed to create '%s' attribute: %d\n",
 				 attr->attr.name, retval);
 	}
+#endif
 
 	retval = device_create_bin_file(info->dev, &edid_attr);
 	if (retval)
@@ -1753,9 +1759,11 @@ static void dlfb_usb_disconnect(struct usb_interface *intf)
 	/* this function will wait for all in-flight urbs to complete */
 	dlfb_free_urb_list(dlfb);
 
+#ifdef CONFIG_FB_DEVICE
 	/* remove udlfb's sysfs interfaces */
 	for (i = 0; i < ARRAY_SIZE(fb_device_attrs); i++)
 		device_remove_file(info->dev, &fb_device_attrs[i]);
+#endif
 	device_remove_bin_file(info->dev, &edid_attr);
 
 	unregister_framebuffer(info);
-- 
2.43.0

